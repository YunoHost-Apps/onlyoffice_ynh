#!/bin/bash

#=================================================
# COMMON VARIABLES AND CUSTOM HELPERS
#=================================================

_install_msfonts_deb() {

    # Do not replace app dependencies
    YNH_INSTALL_APP_DEPENDENCIES_REPLACE="false"

    # Run this here because it's less verbose for some reason
    ynh_hide_warnings ynh_apt_install_dependencies_from_extra_repository \
        --repo="deb http://deb.debian.org/debian/ $(lsb_release --codename --short) main contrib" \
        --key="https://ftp-master.debian.org/keys/release-$(lsb_release --release --short).asc" \
        --package="ttf-mscorefonts-installer"

}

_install_onlyoffice_deb() {
    echo onlyoffice-documentserver onlyoffice/ds-port select "$port" | debconf-set-selections
    echo onlyoffice-documentserver onlyoffice/db-host string 127.0.0.1 | debconf-set-selections
    echo onlyoffice-documentserver onlyoffice/db-user string "$db_user" | debconf-set-selections
    echo onlyoffice-documentserver onlyoffice/db-pwd password "$db_pwd" | debconf-set-selections
    echo onlyoffice-documentserver onlyoffice/db-name string "$db_name" | debconf-set-selections
    echo onlyoffice-documentserver onlyoffice/jwt-secret password "$jwt_secret" | debconf-set-selections

    # The OnlyOffice dev had the magnificent idea to add a "nginx restart" during
    # the install/configure of their package, which is awful since that will
    # restart NGINX and the whole webadmin and maybe even the YunoHost command
    # running the install...

    ynh_setup_source --dest_dir="$install_dir"
    _ynh_apt_install $install_dir/onlyoffice-documentserver.deb
}
