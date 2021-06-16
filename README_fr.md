# OnlyOffice pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/onlyoffice.svg)](https://dash.yunohost.org/appci/app/onlyoffice) ![](https://ci-apps.yunohost.org/ci/badges/onlyoffice.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/onlyoffice.maintain.svg)  
[![Installer OnlyOffice avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=onlyoffice)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer OnlyOffice rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Créez et éditer des documents collaborativement

**Version incluse :** 6.1.0~ynh2

**Démo :** https://www.onlyoffice.com/fr/download-desktop.aspx

## Captures d'écran

![](./doc/screenshots/.DS_Store)
![](./doc/screenshots/document-short.png)

## Avertissements / informations importantes

## Démo

* Une démo gratuite de 30 jours de Document Server est disponible à partir du connecteur OnlyOffice pour Nextcloud:
   * Installez Nextcloud et l'application ONLYOFFICE (connector).
   * Allez dans les paramètres de l'administrateur Nextcloud, section ONLYOFFICE.
   * Cochez la case `Connexion à la démonstration ONLYOFFICE Document Server` dans les paramètres du serveur.
* Certains tests sont également possibles en utilisant [ONLYOFFICE Desktop Editor](https://www.onlyoffice.com/fr/download-desktop.aspx).

## Prérequis

Vous ne devez pas installer OnlyOffice sur votre domaine YunoHost principal, surtout si vous souhaitez l'utiliser avec une instance Nextcloud installée sur le même domaine.
* Ajouter un nouveau domaine pour OnlyOffice dans YunoHost
   * Si votre domaine YunoHost principal a été fourni par YunoHost, par exemple `domain.nohost.me`, alors vous n'avez pas à acheter/enregistrer un nouveau nom de domaine.
   * Cliquez simplement sur `J'ai déjà un nom de domaine`.
   * Tapez par exemple `office.domain.nohost.me` et cliquez sur `Ajouter`.
* Ajoutez un certificat Let's Encrypt pour ce domaine.

## Configuration de OnlyOffice Server

* Supposons que :
   * `yunohost.domain` est votre domaine principal YunoHost.
   * Vous avez configuré `office.yunohost.domain` pour OnlyOffice, voir Prérequis ci-dessus
   * Vous avez Nextcloud installé sur `yunohost.domain / nextcloud` ou `nextcloud.yunohost.domain`.
* Installez `onlyoffice` à l'aide de la CLI ou de l'administrateur Web
   * choisissez un nom de domaine pour OnlyOffice différent de votre domaine Nextcloud, par exemple `office.yunohost.domain`  (ou `office.domain.nohost.me`, voir section précédente).
   * Choisissez un chemin pour OnlyOffice, par exemple `/` si vous installez sur `office.yunohost.domain` (n'installez aucune autre application sur ce domaine).
   * Le domaine de votre instance Nextcloud, par exemple `yunohost.domain / nextcloud` ou `nextcloud.yunohost.domain`.
   * Est-ce une application publique ? **Si vous souhaitez le connecter à Nextcloud, OnlyOffice doit être public** : puis sélectionnez `Oui` ou `cochez la case`.

## Comment éditer des documents OnlyOffice ?

### Web Édition dans Nextcloud

Prérequis : **OnlyOffice doit être public**, voir la section précédente.
* dans le magasin d'applications Nextcloud, installez `ONLYOFFICE`, c'est-à-dire le [connecteur OnlyOffice pour Nextcloud](https://apps.nextcloud.com/apps/onlyoffice)
* Allez dans Nextcloud `Paramètres` > `Administration` > `ONLYOFFICE` > `Paramètres du serveur` > `Adresse du service d'édition de document`.
* Spécifiez le domaine d'installation de votre serveur `onlyoffice`, par exemple `https://office.yunohost.domain/` et cliquez sur `Enregistrer`.
* Créez un nouveau document !

### Desktop Édition sur PC

* Téléchargez et installez [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)
* Démarrez l'éditeur et allez dans `Connecter au Cloud` > `Ajouter cloud`
  * sélectionnez ONLYOFFICE et indiquez le domaine d'installation de votre server OnlyOffice, par ex. `office.yunohost.domain`
  * ou (uniquement si vous avez connecté `onlyoffice` à Nextcloud, voir section précédente).
  * Sélectionnez `Nextcloud` et donnez votre domaine d'installation Nextcloud, par exemple `yunohost.domain/nextcloud`.
* Créez un nouveau document !

## Documentations et ressources

* Site officiel de l'app : https://www.onlyoffice.com
* Documentation officielle utilisateur : https://yunohost.org/#/app_onlyoffice
* Dépôt de code officiel de l'app : https://github.com/ONLYOFFICE/DocumentServer
* Documentation YunoHost pour cette app : https://yunohost.org/app_onlyoffice
* Signaler un bug : https://github.com/YunoHost-Apps/onlyoffice_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
ou
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps