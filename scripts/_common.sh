#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================
ynh_rabbitmq_setup_vhost() {
    rabbitmqctl delete_user "guest"
    rabbitmq_user=$app
    rabbitmq_vhost=$app
    rabbitmq_pwd=$(ynh_string_random)
    ynh_app_setting_set --app="$app" --key=rabbitmq_user --value="$rabbitmq_user"
    ynh_app_setting_set --app="$app" --key=rabbitmq_vhost --value="$rabbitmq_vhost"
    ynh_app_setting_set --app="$app" --key=rabbitmq_pwd --value="$rabbitmq_pwd"
    rabbitmqctl add_user "$rabbitmq_user" "$rabbitmq_pwd"
    rabbitmqctl set_user_tags "$rabbitmq_user" administrator
    rabbitmqctl add_vhost "$rabbitmq_vhost"
    rabbitmqctl set_permissions -p "$rabbitmq_vhost" "$rabbitmq_user" ".*" ".*" ".*"
}
ynh_rabbitmq_remove_vhost() {
    rabbitmqctl delete_user "$rabbitmq_user"
    rabbitmqctl delete_vhost "$rabbitmq_vhost"
    
}
#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
