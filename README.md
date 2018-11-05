# OnlyOffice app for YunoHost

- [Yunohost project](https://yunohost.org)
- [OnlyOffice website](https://www.onlyoffice.com)

![](http://kaosenlared.net/wp-content/uploads/2016/10/onlyoffyce-2.jpg)


[![Install OnlyOffice with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=onlyoffice)

### Installing guide

 1. App can be installed by YunoHost **admin web-interface** or by **running following command**:

         $ sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh
 1. Admin username is : **root**.
 1. **Admin password** will be sent to the email address given at the time of the installation.
 1. **TLS** and **starttls** are disabled for the outgoing mails. If you intent to use email address not hosted on your local server,it's advised to have a proper SMTP configured with tls and starttls settings by editing **/var/www/peertube/config/porduction.yml**.

### Upgrade this package:

        $ sudo yunohost app upgrade --verbose example -u https://github.com/YunoHost-Apps/onlyoffice_ynh


