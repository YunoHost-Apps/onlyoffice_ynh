ONLYOFFICE Document Server est une suite bureautique en ligne comprenant des visualiseurs et des éditeurs de textes, feuilles de calcul et présentations, entièrement compatible avec les formats Office Open XML: .docx, .xlsx, .pptx et permettant l'édition collaborative en temps réel.

L'édition collaborative en ligne des documents ONLYOFFICE nécessite :
1. une partie serveur, avec deux options d'installation :
    1. ONLYOFFICE Document Server packagé pour YunoHost.
    2. Le [Community Document Server pour Nextcloud](https://apps.nextcloud.com/apps/documentserver_community).

2. une partie client, telle que :
    1. [ONLYOFFICE connector pour Nextcloud](https://apps.nextcloud.com/apps/onlyoffice)
    2. [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

Une solution rendue facile par YunoHost est d'installer (1.i) et (2.i), voir [ci-dessous](https://github.com/YunoHost-Apps/onlyoffice_ynh/blob/master/README_fr.md#configuration-de-onlyoffice-server). Les utilisateurs qui aiment le tout Nextcloud peuvent suivre [ce tutoriel](https://github.com/YunoHost-Apps/nextcloud_ynh/blob/master/README_fr.md#configurer-lint%C3%A9gration-donlyoffice) pour installer le Community Document Server (1.ii) et ONLYOFFICE connector (2.i) sur une instance Nextcloud. Cependant, les performances et l'architecture sont limitées.
