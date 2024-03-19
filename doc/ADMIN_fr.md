## Démo

* Une démo gratuite de 30 jours de Document Server est disponible à partir du connecteur ONLYOFFICE pour Nextcloud:
  * Installez Nextcloud et l'application ONLYOFFICE (connector).
  * Allez dans les paramètres de l'administrateur Nextcloud, section ONLYOFFICE.
  * Cochez la case `Connexion à la démonstration ONLYOFFICE Document Server` dans les paramètres du serveur.
* Certains tests sont également possibles en utilisant [ONLYOFFICE Desktop Editor](https://www.onlyoffice.com/fr/download-desktop.aspx).

## Prérequis

Vous ne devez pas installer ONLYOFFICE sur votre domaine YunoHost principal, surtout si vous souhaitez l'utiliser avec une instance Nextcloud installée sur le même domaine.

* Ajouter un nouveau domaine pour ONLYOFFICE dans YunoHost
  * Si votre domaine YunoHost principal a été fourni par YunoHost, par exemple `domain.nohost.me`, alors vous n'avez pas à acheter/enregistrer un nouveau nom de domaine.
  * Cliquez simplement sur `J'ai déjà un nom de domaine`.
  * Tapez par exemple `office.domain.nohost.me` et cliquez sur `Ajouter`.
* Ajoutez un certificat Let's Encrypt pour ce domaine.

## Configuration de ONLYOFFICE Server

* Supposons que :
  * `yunohost.domain` est votre domaine principal YunoHost.
  * Vous avez configuré `office.yunohost.domain` pour ONLYOFFICE, voir Prérequis ci-dessus
  * Vous avez Nextcloud installé sur `yunohost.domain / nextcloud` ou `nextcloud.yunohost.domain`.
* Installez `ONLYOFFICE` à l'aide de la CLI ou de l'administrateur Web
  * choisissez un nom de domaine pour ONLYOFFICE différent de votre domaine Nextcloud, par exemple `office.yunohost.domain`  (ou `office.domain.nohost.me`, voir section précédente).
  * Choisissez un chemin pour ONLYOFFICE, par exemple `/` si vous installez sur `office.yunohost.domain` (n'installez aucune autre application sur ce domaine).
  * Le domaine de votre instance Nextcloud, par exemple `yunohost.domain / nextcloud` ou `nextcloud.yunohost.domain`.
  * Est-ce une application publique ? **Si vous souhaitez le connecter à Nextcloud, ONLYOFFICE doit être public** : puis sélectionnez `Oui` ou `cochez la case`.

## Comment éditer des documents ONLYOFFICE ?

### Web Édition dans Nextcloud

Prérequis : **ONLYOFFICE doit être public**, voir la section précédente.

* dans le magasin d'applications Nextcloud, installez `ONLYOFFICE`, c'est-à-dire le [connecteur ONLYOFFICE pour Nextcloud](https://apps.nextcloud.com/apps/onlyoffice)
* Allez dans Nextcloud `Paramètres` > `Administration` > `ONLYOFFICE` > `Paramètres du serveur` > `Adresse du service d'édition de document`.
* Spécifiez le domaine d'installation de votre serveur `ONLYOFFICE`, par exemple `https://office.yunohost.domain/`.
* Renseignez la clé secrète qui vous a été envoyée par email lors de l'installation (vous pouvez aussi la retrouve avec la ligne de commande `sudo documentserver-jwt-status.sh`).
* Cliquez sur `Enregistrer`.
* Créez un nouveau document !

### Desktop Édition sur PC

* Téléchargez et installez [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)
* Démarrez l'éditeur et allez dans `Connecter au Cloud` > `Ajouter cloud`
  * sélectionnez ONLYOFFICE et indiquez le domaine d'installation de votre server ONLYOFFICE, par ex. `office.yunohost.domain`
  * ou (uniquement si vous avez connecté `ONLYOFFICE` à Nextcloud, voir section précédente).
  * Sélectionnez `Nextcloud` et donnez votre domaine d'installation Nextcloud, par exemple `yunohost.domain/nextcloud`.
* Créez un nouveau document !
