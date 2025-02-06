<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# OnlyOffice para Yunohost

[![Nivel de integración](https://apps.yunohost.org/badge/integration/onlyoffice)](https://ci-apps.yunohost.org/ci/apps/onlyoffice/)
![Estado funcional](https://apps.yunohost.org/badge/state/onlyoffice)
![Estado En Mantención](https://apps.yunohost.org/badge/maintained/onlyoffice)

[![Instalar OnlyOffice con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=onlyoffice)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarOnlyOffice rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

ONLYOFFICE Document Server is an online office suite comprising viewers and editors for texts, spreadsheets and presentations, fully compatible with Office Open XML formats: .docx, .xlsx, .pptx and enabling collaborative editing in real time.

Online collaborative edition of ONLYOFFICE documents requires: 
1. a server part, with two installation options:
   1. ONLYOFFICE Document Server packaged for YunoHost. 
   2. The [Community Document Server for Nextcloud](https://apps.nextcloud.com/apps/documentserver_community) 

2. a client part, such as: 
   1. The [ONLYOFFICE connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice) 
   2. The [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

A solution made easy by YunoHost is to install (1.i) and (2.i), see [section below](https://github.com/YunoHost-Apps/onlyoffice_ynh/#configuration-of-onlyoffice-server). The Nextcloud addicts may follow [this tutorial](https://github.com/YunoHost-Apps/nextcloud_ynh#configure-onlyoffice-integration) to install (1.ii) and (2.i) on one Nextcloud instance. However, performance and architecture are limited.


**Versión actual:** 8.3.0~ynh1

**Demo:** <https://www.onlyoffice.com/fr/download-desktop.aspx>

## Capturas

![Captura de OnlyOffice](./doc/screenshots/01-presentation.jpg)
![Captura de OnlyOffice](./doc/screenshots/02-document-short.png)

## Documentaciones y recursos

- Sitio web oficial: <https://www.onlyoffice.com>
- Repositorio del código fuente oficial de la aplicación : <https://github.com/ONLYOFFICE/DocumentServer>
- Catálogo YunoHost: <https://apps.yunohost.org/app/onlyoffice>
- Reportar un error: <https://github.com/YunoHost-Apps/onlyoffice_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [rama `testing`](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
o
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
