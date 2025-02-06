<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# OnlyOffice pour YunoHost

[![Niveau d’intégration](https://apps.yunohost.org/badge/integration/onlyoffice)](https://ci-apps.yunohost.org/ci/apps/onlyoffice/)
![Statut du fonctionnement](https://apps.yunohost.org/badge/state/onlyoffice)
![Statut de maintenance](https://apps.yunohost.org/badge/maintained/onlyoffice)

[![Installer OnlyOffice avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=onlyoffice)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer OnlyOffice rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

ONLYOFFICE Document Server est une suite bureautique en ligne comprenant des visualiseurs et des éditeurs de textes, feuilles de calcul et présentations, entièrement compatible avec les formats Office Open XML: .docx, .xlsx, .pptx et permettant l'édition collaborative en temps réel.

L'édition collaborative en ligne des documents ONLYOFFICE nécessite :
1. une partie serveur, avec deux options d'installation :
    1. ONLYOFFICE Document Server packagé pour YunoHost.
    2. Le [Community Document Server pour Nextcloud](https://apps.nextcloud.com/apps/documentserver_community).

2. une partie client, telle que :
    1. [ONLYOFFICE connector pour Nextcloud](https://apps.nextcloud.com/apps/onlyoffice)
    2. [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

Une solution rendue facile par YunoHost est d'installer (1.i) et (2.i), voir [ci-dessous](https://github.com/YunoHost-Apps/onlyoffice_ynh/blob/master/README_fr.md#configuration-de-onlyoffice-server). Les utilisateurs qui aiment le tout Nextcloud peuvent suivre [ce tutoriel](https://github.com/YunoHost-Apps/nextcloud_ynh/blob/master/README_fr.md#configurer-lint%C3%A9gration-donlyoffice) pour installer le Community Document Server (1.ii) et ONLYOFFICE connector (2.i) sur une instance Nextcloud. Cependant, les performances et l'architecture sont limitées.


**Version incluse :** 8.3.0~ynh1

**Démo :** <https://www.onlyoffice.com/fr/download-desktop.aspx>

## Captures d’écran

![Capture d’écran de OnlyOffice](./doc/screenshots/01-presentation.jpg)
![Capture d’écran de OnlyOffice](./doc/screenshots/02-document-short.png)

## Documentations et ressources

- Site officiel de l’app : <https://www.onlyoffice.com>
- Dépôt de code officiel de l’app : <https://github.com/ONLYOFFICE/DocumentServer>
- YunoHost Store : <https://apps.yunohost.org/app/onlyoffice>
- Signaler un bug : <https://github.com/YunoHost-Apps/onlyoffice_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
ou
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
