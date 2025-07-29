#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================
conf_dir="$install_dir/config"

#=================================================
# PERSONAL HELPERS
#=================================================
init_settings() {
    ynh_app_setting_set_default --key=jwt_secret --value="$(ynh_string_random --length=32)"
    ynh_app_setting_set_default --key=secure_link_secret --value="$(ynh_string_random)"
    ynh_app_setting_set_default --key=autoassembly_enable --value="true"
    ynh_app_setting_set_default --key=autoassembly_step --value="1m"
    ynh_app_setting_set_default --key=autoassembly_interval --value="1m"
    ynh_app_setting_set_default --key=reject_unauthorized --value="false"
    
    # Renew cache tag
    cache_tag=$(date +'%Y.%m.%d-%H%M' | openssl md5 | awk '{print $2}')
    ynh_app_setting_set --app="$app" --key=cache_tag --value="$cache_tag"
}
set_permissions() {
    chown -R "$app:$app" "$install_dir"
    chown "$app:www-data" "$install_dir"
    chown "$app:www-data" "$install_dir/documentserver"
    chmod go=--- "$install_dir/"{src,bin,config,Data}
    chmod o=--- "$install_dir/documentserver"
    chmod a-w "$install_dir/documentserver"
    if [ -f "$install_dir/config/local.json" ] ; then
        chmod 400 "$install_dir/config/local.json"
    fi
}
setup_sources() {
    mkdir -p "$install_dir/Data"
    mkdir -p "/var/log/$app/"
    ynh_hide_info ynh_safe_rm "$install_dir/deb"
    ynh_hide_info ynh_safe_rm "$install_dir/src"
    ynh_hide_info ynh_safe_rm "$install_dir/bin"
    ynh_setup_source --dest_dir="$install_dir/deb"
    pushd "$install_dir/deb"
    ar vx "$install_dir/deb/onlyoffice-documentserver.deb"

    # We use the .deb cause tar.xz doesn't contains submodules and management scripts
    tar xf "$install_dir/deb/data.tar.xz"
    popd
    mv "$install_dir/deb/etc/onlyoffice/documentserver" "$conf_dir"
    mv "$install_dir/deb/var/www/onlyoffice/documentserver" "$install_dir/documentserver"
    mv "$install_dir/deb/usr/bin" "$install_dir/bin"
    mkdir -p "$install_dir/documentserver/fonts"
    ynh_safe_rm "$install_dir/deb"

    # We use sources in order to recompile binary
    ynh_setup_source --source_id="src"  --dest_dir="$install_dir/src"
    ynh_replace --match="const buildVersion = " --replace="const buildVersion = '${YNH_APP_MANIFEST_VERSION%%~*}';" --file="$install_dir/src/Common/sources/commondefines.js"
buildNumber=$(ynh_read_manifest "resources.sources.src.url"| sed "s/\.tar\.gz//" | grep -Eo "[0-9]+$")
    ynh_replace --match="const buildNumber = " --replace="const buildNumber = $buildNumber;" --file="$install_dir/src/Common/sources/commondefines.js"
    ynh_replace --match="const buildDate = " --replace="const buildDate = '$( date +%F )';" --file="$install_dir/src/Common/sources/license.js"

    set_permissions

    ynh_setup_source --source_id="fonts" --dest_dir="/usr/share/fonts/custom/" 

    # Some config an scripts should be patched in order to support 
    # ynh files and port organisation
    ynh_replace --match="/var/www/onlyoffice/" --replace="$install_dir/" --file="$conf_dir/production-linux.json"
    ynh_replace --match="/etc/onlyoffice/documentserver/" --replace="$install_dir/config/" --file="$conf_dir/production-linux.json"
    ynh_replace --match="/var/lib/onlyoffice/documentserver/App_Data/" --replace="$data_dir/" --file="$conf_dir/production-linux.json"
    ynh_store_file_checksum "$conf_dir/production-linux.json"
    # TODO: rejectUnauthorized: false was set but i think it's a bad security behaviour

    # Hack for documentserver script
    for script in $(ls "$install_dir/bin/")
    do
        ynh_replace --match="/var/www/onlyoffice/" --replace="$install_dir/" --file="$install_dir/bin/$script"
        ynh_replace --match="/etc/onlyoffice/documentserver" --replace="$conf_dir" --file="$install_dir/bin/$script"
        ynh_replace --match="ds:ds" --replace="$app:$app" --file="$install_dir/bin/$script"
        ynh_replace --match="ds-docservice" --replace="$app-docservice" --file="$install_dir/bin/$script"
        ynh_replace --match="ds-converter" --replace="$app-converter" --file="$install_dir/bin/$script"
    done
    ynh_replace --match="localhost:8000" --replace="localhost:$port" --file="$install_dir/bin/documentserver-prepare4shutdown.sh"

    ynh_replace --match=".*/etc/nginx/includes/ds-cache.conf.*" --replace='sed "/set $cache_tag /s/.*/set \$cache_tag \"$HASH\";/" /etc/nginx/conf.d/'$domain'.d/'$app'.conf' --file="$install_dir/bin/documentserver-flush-cache.sh"
    ynh_replace --match="documentserver-flush-cache.sh" --replace="$install_dir/bin/documentserver-flush-cache.sh" --file="$install_dir/bin/documentserver-generate-allfonts.sh"
    ynh_hide_info ynh_safe_rm "$conf_dir/nginx/ds.conf"
    ln -s /etc/nginx/conf.d/$domain.d/$app.conf "$conf_dir/nginx/ds.conf"
    ynh_hide_info ynh_safe_rm "$conf_dir/nginx/includes/ds-docservice.conf"
    ln -s /etc/nginx/conf.d/$domain.d/$app.conf "$conf_dir/nginx/includes/ds-docservice.conf"


}


compile() {
    pushd "$install_dir"
    ynh_hide_warnings npm install @yao-pkg/pkg
    popd
    pushd "$install_dir/src"
    ynh_hide_warnings npm ci
    ynh_hide_warnings npm run build

    ynh_hide_warnings ../node_modules/.bin/pkg DocService --options max_old_space_size=4096 -o $install_dir/documentserver/server/DocService/docservice
    ynh_hide_warnings ../node_modules/.bin/pkg FileConverter -o $install_dir/documentserver/server/FileConverter/converter
    ynh_hide_warnings ../node_modules/.bin/pkg Metrics -o $install_dir/documentserver/server/Metrics/metrics
    popd

    # Activate smartphone editor
    sed -i 's/isSupportEditFeature=()=>!1/isSupportEditFeature=()=>!0/g' $install_dir/documentserver/web-apps/apps/*/mobile/dist/js/app.js
}


apply_system_config() {
    # Create a dedicated NGINX config using the conf/nginx.conf template
    ynh_config_add_nginx

    # Create a dedicated systemd config
    ynh_config_add_systemd --service="$app"
    yunohost service add "$app" --description="$app" --test_status="systemctl is-active $app-docservice $app-converter |uniq"
    for service in "converter" "docservice" "metrics"; do
        ynh_config_add_systemd --service="$app-$service" --template="$service.service"
        yunohost service add "$app-$service" --description="$app $service" --log="/var/log/$app/$service.log"
    done
    chown -R "$app:$app" "/var/log/$app/"

    # Use logrotate to manage application logfile(s)
    ynh_config_add_logrotate

    # This is not in official setup but it could help to avoid overload and lost data
    # It runs a restart which triggers document-prepare4shutdown.sh script (in ExecStop) so all documents are force saved and all clients disconnected.
    # Note: may be the autoAssembly config is enough, and that's not necessary anymore.
    ynh_config_add --template="cron" --destination="/etc/cron.d/$app"
 
}
configure_redis() {
    redis_db=$(ynh_app_setting_get --app="$app" --key=redis_db)
    if [[ "$redis_db" ]]; then
        redis_db=$(ynh_redis_get_free_db)
        ynh_app_setting_set --app="$app" --key=redis_db --value="$redis_db"
    fi
}
#=================================================
# EXPERIMENTAL HELPERS
#=================================================
ynh_rabbitmq_setup_vhost() {
    ynh_hide_warning rabbitmqctl delete_user "guest" || true
    rabbitmq_user=$app
    rabbitmq_vhost=$app
    rabbitmq_pwd=$(ynh_app_setting_get --app="$app" --key=rabbitmq_pwd)
    rabbitmq_pwd=${rabbitmq_pwd:-$(ynh_string_random)}
    ynh_app_setting_set --app="$app" --key=rabbitmq_user --value="$rabbitmq_user"
    ynh_app_setting_set --app="$app" --key=rabbitmq_vhost --value="$rabbitmq_vhost"
    ynh_app_setting_set --app="$app" --key=rabbitmq_pwd --value="$rabbitmq_pwd"
    ynh_hide_warning rabbitmqctl add_user "$rabbitmq_user" "$rabbitmq_pwd" || true
    rabbitmqctl set_user_tags "$rabbitmq_user" administrator || true
    rabbitmqctl add_vhost "$rabbitmq_vhost" || true
    rabbitmqctl set_permissions -p "$rabbitmq_vhost" "$rabbitmq_user" ".*" ".*" ".*"
}
ynh_rabbitmq_remove_vhost() {
    rabbitmqctl delete_user "$rabbitmq_user"
    rabbitmqctl delete_vhost "$rabbitmq_vhost"
    
}

ynh_hide_info() {
    OLD_YNH_STDINFO=$YNH_STDINFO
    YNH_STDINFO=/dev/null
    # Note that "$@" is used and not $@, c.f. https://unix.stackexchange.com/a/129077
    "$@"
    YNH_STDINFO=$OLD_YNH_STDINFO
}
#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
