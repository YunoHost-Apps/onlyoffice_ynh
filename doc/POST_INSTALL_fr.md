__APP__ a été correctement installé :)

Pour intégrer l'éditeur bureautique dans votre app (Nextcloud, Seafile, etc.):
1. Installer l'extension connecteur dédié à votre application
2. Configurer les paramètres suivants dans la configuration de l'extension et sauvegarder (ou redémarrer le service si c'est un fichier de config):
  - Addresse du Document Server: "https://__DOMAIN____PATH__"
  - Clé secrète JWT: "__JWT_SECRET__"
3. Tester l'édition ou la création d'un document.

Plus d'info sont disponibles dans la documentation de ce paquet `Web administration > App > OnlyOffice`.

Si vous rencontrez un problème ou souhaitez améliorer cette application, veuillez ouvrir un nouveau ticket ici: <https://github.com/YunoHost-Apps/onlyoffice_ynh>

