<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# OnlyOffice YunoHost-erako

[![Integrazio maila](https://apps.yunohost.org/badge/integration/onlyoffice)](https://ci-apps.yunohost.org/ci/apps/onlyoffice/)
![Funtzionamendu egoera](https://apps.yunohost.org/badge/state/onlyoffice)
![Mantentze egoera](https://apps.yunohost.org/badge/maintained/onlyoffice)

[![Instalatu OnlyOffice YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=onlyoffice)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek OnlyOffice YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

ONLYOFFICE Document Server is an online office suite comprising viewers and editors for texts, spreadsheets and presentations, fully compatible with Office Open XML formats: .docx, .xlsx, .pptx and enabling collaborative editing in real time.

Online collaborative edition of ONLYOFFICE documents requires: 
1. a server part, with two installation options:
   1. ONLYOFFICE Document Server packaged for YunoHost. 
   2. The [Community Document Server for Nextcloud](https://apps.nextcloud.com/apps/documentserver_community) 

2. a client part, such as: 
   1. The [ONLYOFFICE connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice) 
   2. The [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

A solution made easy by YunoHost is to install (1.i) and (2.i), see [section below](https://github.com/YunoHost-Apps/onlyoffice_ynh/#configuration-of-onlyoffice-server). The Nextcloud addicts may follow [this tutorial](https://github.com/YunoHost-Apps/nextcloud_ynh#configure-onlyoffice-integration) to install (1.ii) and (2.i) on one Nextcloud instance. However, performance and architecture are limited.


**Paketatutako bertsioa:** 8.3.0~ynh1

**Demoa:** <https://www.onlyoffice.com/fr/download-desktop.aspx>

## Pantaila-argazkiak

![OnlyOffice(r)en pantaila-argazkia](./doc/screenshots/01-presentation.jpg)
![OnlyOffice(r)en pantaila-argazkia](./doc/screenshots/02-document-short.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://www.onlyoffice.com>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/ONLYOFFICE/DocumentServer>
- YunoHost Denda: <https://apps.yunohost.org/app/onlyoffice>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/onlyoffice_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
edo
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
