<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# OnlyOffice para YunoHost

[![Nivel de integración](https://apps.yunohost.org/badge/integration/onlyoffice)](https://ci-apps.yunohost.org/ci/apps/onlyoffice/)
![Estado de funcionamento](https://apps.yunohost.org/badge/state/onlyoffice)
![Estado de mantemento](https://apps.yunohost.org/badge/maintained/onlyoffice)

[![Instalar OnlyOffice con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=onlyoffice)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar OnlyOffice de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

ONLYOFFICE Document Server is an online office suite comprising viewers and editors for texts, spreadsheets and presentations, fully compatible with Office Open XML formats: .docx, .xlsx, .pptx and enabling collaborative editing in real time.

Online collaborative edition of ONLYOFFICE documents requires: 
1. a server part, with two installation options:
   1. ONLYOFFICE Document Server packaged for YunoHost. 
   2. The [Community Document Server for Nextcloud](https://apps.nextcloud.com/apps/documentserver_community) 

2. a client part, such as: 
   1. The [ONLYOFFICE connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice) 
   2. The [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

A solution made easy by YunoHost is to install (1.i) and (2.i), see [section below](https://github.com/YunoHost-Apps/onlyoffice_ynh/#configuration-of-onlyoffice-server). The Nextcloud addicts may follow [this tutorial](https://github.com/YunoHost-Apps/nextcloud_ynh#configure-onlyoffice-integration) to install (1.ii) and (2.i) on one Nextcloud instance. However, performance and architecture are limited.


**Versión proporcionada:** 8.3.1~ynh1

**Demo:** <https://www.onlyoffice.com/fr/download-desktop.aspx>

## Capturas de pantalla

![Captura de pantalla de OnlyOffice](./doc/screenshots/01-presentation.jpg)
![Captura de pantalla de OnlyOffice](./doc/screenshots/02-document-short.png)

## Documentación e recursos

- Web oficial da app: <https://www.onlyoffice.com>
- Repositorio de orixe do código: <https://github.com/ONLYOFFICE/DocumentServer>
- Tenda YunoHost: <https://apps.yunohost.org/app/onlyoffice>
- Informar dun problema: <https://github.com/YunoHost-Apps/onlyoffice_ynh/issues>

## Info de desenvolvemento

Envía a túa colaboración á [rama `testing`](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

Para probar a rama `testing`, procede deste xeito:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
ou
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```

**Máis info sobre o empaquetado da app:** <https://yunohost.org/packaging_apps>
