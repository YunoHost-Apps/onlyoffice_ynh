<!--
Важно: этот README был автоматически сгенерирован <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Он НЕ ДОЛЖЕН редактироваться вручную.
-->

# OnlyOffice для YunoHost

[![Уровень интеграции](https://apps.yunohost.org/badge/integration/onlyoffice)](https://ci-apps.yunohost.org/ci/apps/onlyoffice/)
![Состояние работы](https://apps.yunohost.org/badge/state/onlyoffice)
![Состояние сопровождения](https://apps.yunohost.org/badge/maintained/onlyoffice)

[![Установите OnlyOffice с YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=onlyoffice)

*[Прочтите этот README на других языках.](./ALL_README.md)*

> *Этот пакет позволяет Вам установить OnlyOffice быстро и просто на YunoHost-сервер.*  
> *Если у Вас нет YunoHost, пожалуйста, посмотрите [инструкцию](https://yunohost.org/install), чтобы узнать, как установить его.*

## Обзор

ONLYOFFICE Document Server is an online office suite comprising viewers and editors for texts, spreadsheets and presentations, fully compatible with Office Open XML formats: .docx, .xlsx, .pptx and enabling collaborative editing in real time.

Online collaborative edition of ONLYOFFICE documents requires: 
1. a server part, with two installation options:
   1. ONLYOFFICE Document Server packaged for YunoHost. 
   2. The [Community Document Server for Nextcloud](https://apps.nextcloud.com/apps/documentserver_community) 

2. a client part, such as: 
   1. The [ONLYOFFICE connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice) 
   2. The [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

A solution made easy by YunoHost is to install (1.i) and (2.i), see [section below](https://github.com/YunoHost-Apps/onlyoffice_ynh/#configuration-of-onlyoffice-server). The Nextcloud addicts may follow [this tutorial](https://github.com/YunoHost-Apps/nextcloud_ynh#configure-onlyoffice-integration) to install (1.ii) and (2.i) on one Nextcloud instance. However, performance and architecture are limited.


**Поставляемая версия:** 8.3.0~ynh1

**Демо-версия:** <https://www.onlyoffice.com/fr/download-desktop.aspx>

## Снимки экрана

![Снимок экрана OnlyOffice](./doc/screenshots/01-presentation.jpg)
![Снимок экрана OnlyOffice](./doc/screenshots/02-document-short.png)

## Документация и ресурсы

- Официальный веб-сайт приложения: <https://www.onlyoffice.com>
- Репозиторий кода главной ветки приложения: <https://github.com/ONLYOFFICE/DocumentServer>
- Магазин YunoHost: <https://apps.yunohost.org/app/onlyoffice>
- Сообщите об ошибке: <https://github.com/YunoHost-Apps/onlyoffice_ynh/issues>

## Информация для разработчиков

Пришлите Ваш запрос на слияние в [ветку `testing`](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

Чтобы попробовать ветку `testing`, пожалуйста, сделайте что-то вроде этого:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
или
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```

**Больше информации о пакетировании приложений:** <https://yunohost.org/packaging_apps>
