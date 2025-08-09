__APP__ was successfully installed :)

To integrate the office editor into your app (Nextcloud, Seafile, etc.):
1. Install the connector extension dedicated to your application
2. Configure the following settings in the extension configuration and save (or restart the service if it is a config file):
  - Document Server address: “https://__DOMAIN____PATH__”
  - JWT secret key: “__JWT_SECRET__”
3. Test editing or creating a document.

More information is available in the documentation for this package `Web administration > App > OnlyOffice`.

If you are facing any problem or want to improve this app, please open a new issue here: <https://github.com/YunoHost-Apps/onlyoffice_ynh>

