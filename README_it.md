<!--
N.B.: Questo README è stato automaticamente generato da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON DEVE essere modificato manualmente.
-->

# OnlyOffice per YunoHost

[![Livello di integrazione](https://dash.yunohost.org/integration/onlyoffice.svg)](https://dash.yunohost.org/appci/app/onlyoffice) ![Stato di funzionamento](https://ci-apps.yunohost.org/ci/badges/onlyoffice.status.svg) ![Stato di manutenzione](https://ci-apps.yunohost.org/ci/badges/onlyoffice.maintain.svg)

[![Installa OnlyOffice con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=onlyoffice)

*[Leggi questo README in altre lingue.](./ALL_README.md)*

> *Questo pacchetto ti permette di installare OnlyOffice su un server YunoHost in modo semplice e veloce.*  
> *Se non hai YunoHost, consulta [la guida](https://yunohost.org/install) per imparare a installarlo.*

## Panoramica

ONLYOFFICE Document Server is an online office suite comprising viewers and editors for texts, spreadsheets and presentations, fully compatible with Office Open XML formats: .docx, .xlsx, .pptx and enabling collaborative editing in real time.

Online collaborative edition of ONLYOFFICE documents requires: 
1. a server part, with two installation options:
   1. ONLYOFFICE Document Server packaged for YunoHost. 
   2. The [Community Document Server for Nextcloud](https://apps.nextcloud.com/apps/documentserver_community) 

2. a client part, such as: 
   1. The [ONLYOFFICE connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice) 
   2. The [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

A solution made easy by YunoHost is to install (1.i) and (2.i), see [section below](https://github.com/YunoHost-Apps/onlyoffice_ynh/#configuration-of-onlyoffice-server). The Nextcloud addicts may follow [this tutorial](https://github.com/YunoHost-Apps/nextcloud_ynh#configure-onlyoffice-integration) to install (1.ii) and (2.i) on one Nextcloud instance. However, performance and architecture are limited.


**Versione pubblicata:** 7.5~ynh1

**Prova:** <https://www.onlyoffice.com/fr/download-desktop.aspx>

## Screenshot

![Screenshot di OnlyOffice](./doc/screenshots/01-presentation.jpg)
![Screenshot di OnlyOffice](./doc/screenshots/02-document-short.png)

## Documentazione e risorse

- Sito web ufficiale dell’app: <https://www.onlyoffice.com>
- Repository upstream del codice dell’app: <https://github.com/ONLYOFFICE/DocumentServer>
- Store di YunoHost: <https://apps.yunohost.org/app/onlyoffice>
- Segnala un problema: <https://github.com/YunoHost-Apps/onlyoffice_ynh/issues>

## Informazioni per sviluppatori

Si prega di inviare la tua pull request alla [branch di `testing`](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

Per provare la branch di `testing`, si prega di procedere in questo modo:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
o
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```

**Maggiori informazioni riguardo il pacchetto di quest’app:** <https://yunohost.org/packaging_apps>
