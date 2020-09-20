# OnlyOffice Server pour YunoHost

[![Integration level](https://dash.yunohost.org/integration/onlyoffice.svg)](https://dash.yunohost.org/appci/app/onlyoffice) ![](https://ci-apps.yunohost.org/ci/badges/onlyoffice.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/onlyoffice.maintain.svg)  
[![Installer OnlyOffice avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=onlyoffice)

*[Read this readme in english.](./README.md)* 

> *Ce package vous permet d'installer OnlyOffice rapidement et simplement sur un serveur YunoHost.  
Si vous n'avez pas YunoHost, consultez [le guide](https://yunohost.org/#/install) pour apprendre comment l'installer.*

## Vue d'ensemble

L'édition collaborative en ligne des documents OnlyOffice nécessite:
1) une partie serveur, avec deux options d'installation:
    a) **Ce package installe OnlyOffice Document Server**.
    b) Le [Community Document Server for Nextcloud](https://apps.nextcloud.com/apps/documentserver_community)

2) une partie client, telle que:
    a) [ONLYOFFICE connector pour Nextcloud](https://apps.nextcloud.com/apps/onlyoffice)
    b) [ONLYOFFICE Desktop Editor](https://www.onlyoffice.com/fr/download-desktop.aspx)

Les utilisateurs de Nextcloud peuvent suivre [ce tutoriel](https://github.com/YunoHost-Apps/nextcloud_ynh#configure-onlyoffice-integration) pour installer le Community Document Server (1.b) et l'ONLYOFFICE connector (2.a) sur une instance Nextcloud. Cependant, les performances et l'architecture sont limitées.

**Version incluse :** 5.5.3

## Captures d'écran

![](https://static-www.onlyoffice.com/v9.5.0/images/mainpage/may2018/editors/document-short.jpg)

## Démo

* Une démo gratuite de 30 jours de Document Server est disponible à partir du connecteur OnlyOffice pour Nextcloud:
   * Installez Nextcloud et l'application ONLYOFFICE (connector)
   * Allez dans les paramètres de l'administrateur Nextcloud, section ONLYOFFICE
   * Cochez la case `Connexion à la démonstration ONLYOFFICE Document Server` dans les paramètres du serveur
* Certains tests sont également possibles en utilisant [ONLYOFFICE Desktop Editor](https://www.onlyoffice.com/fr/download-desktop.aspx)

## Prérequis

Vous ne devez pas installer `onlyoffice` sur votre domaine YunoHost principal, surtout si vous souhaitez l'utiliser avec un `nextcloud` installé sur le même domaine.
* Ajouter un nouveau domaine pour OnlyOffice dans YunoHost
   * Si votre domaine YunoHost principal a été fourni par YunoHost, par exemple `domain.nohost.me`, alors vous n'avez pas à acheter/enregistrer un nouveau nom de domaine
   * Cliquez simplement sur `J'ai déjà un nom de domaine`
   * Tapez par exemple `office.domain.nohost.me` et cliquez sur `Ajouter`
* Ajoutez un certificat Let's Encrypt pour ce domaine

## Configuration de OnlyOffice Server

* Supposons:
   * `yunohost.domain` est votre domaine principal YunoHost
   * vous avez configuré `office.yunohost.domain` pour OnlyOffice, voir Prérequis ci-dessus
   * vous avez Nextcloud installé sur `yunohost.domain / nextcloud` ou `nextcloud.yunohost.domain`
* Installez `onlyoffice` à l'aide de la CLI ou de l'administrateur Web
   * choisissez un nom de domaine pour OnlyOffice différent de votre domaine Nextcloud, par exemple `office.yunohost.domain`  (ou `office.domain.nohost.me`, voir section précédente)
   * Choisissez un chemin pour OnlyOffice, par exemple `/` si vous installez sur `office.yunohost.domain` (n'installez aucune autre application sur ce domaine)
   * Le domaine de votre instance Nextcloud, par exemple `yunohost.domain / nextcloud` ou `nextcloud.yunohost.domain`
   * Est-ce une application publique? **Si vous souhaitez le connecter à Nextcloud, OnlyOffice doit être public**: puis sélectionnez `Oui` ou `cochez la case`

## Comment éditer des documents OnlyOffice ?

### Web Édition dans Nextcloud

Prérequis : **OnlyOffice doit être public**, voir la section précédente.
* dans le magasin d'applications Nextcloud, installez `ONLYOFFICE`, c'est-à-dire le [connecteur OnlyOffice pour Nextcloud](https://apps.nextcloud.com/apps/onlyoffice)
* allez dans Nextcloud `Paramètres` > `Administration` > `ONLYOFFICE` > `Paramètres du serveur` > `Adresse du service d'édition de document`
* spécifiez le domaine d'installation de votre server `onlyoffice`, par exemple `https://office.yunohost.domain/` et cliquez sur `Enregistrer`
* créez un nouveau document !

### Desktop Édition sur PC

* Téléchargez et installez [ONLYOFFICE Desktop Editor](https://www.onlyoffice.com/fr/download-desktop.aspx)
* Démarrez l'éditeur et allez dans `Connecter au Cloud` > `Ajouter cloud`
  * sélectionnez `ONLYOFFICE` et indiquez le domaine d'installation de votre server `onlyoffice`, par ex. `office.yunohost.domain`
  * ou (uniquement si vous avez connecté `onlyoffice` à Nextcloud, voir section précédente)
  * sélectionnez `Nextcloud` et donnez votre domaine d'installation nextcloud, par exemple `yunohost.domain/nextcloud`
* Créez un nouveau document !

## Documentation

## Caractéristiques spécifiques YunoHost

#### Support multi-utilisateur

#### Architectures supportées

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/onlyoffice%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/onlyoffice/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/onlyoffice%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/onlyoffice/)

## Liens

 * Signaler un bug : https://github.com/YunoHost-Apps/onlyoffice_ynh/issues
 * Site de l'application : https://www.onlyoffice.com
 * Dépôt de l'application principale : https://github.com/ONLYOFFICE/DocumentServer
 * Site web YunoHost : https://yunohost.org/

---

## Informations pour les développeurs

Merci de faire vos pull request sur la [testing branch](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
or
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```
