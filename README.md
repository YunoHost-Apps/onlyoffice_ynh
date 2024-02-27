<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/readme_generator
It shall NOT be edited by hand.
-->

# OnlyOffice for YunoHost

[![Integration level](https://dash.yunohost.org/integration/onlyoffice.svg)](https://dash.yunohost.org/appci/app/onlyoffice) ![Working status](https://ci-apps.yunohost.org/ci/badges/onlyoffice.status.svg) ![Maintenance status](https://ci-apps.yunohost.org/ci/badges/onlyoffice.maintain.svg)

[![Install OnlyOffice with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=onlyoffice)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install OnlyOffice quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

ONLYOFFICE Document Server is an online office suite comprising viewers and editors for texts, spreadsheets and presentations, fully compatible with Office Open XML formats: .docx, .xlsx, .pptx and enabling collaborative editing in real time.

Online collaborative edition of ONLYOFFICE documents requires: 
1. a server part, with two installation options:
   1. ONLYOFFICE Document Server packaged for YunoHost. 
   2. The [Community Document Server for Nextcloud](https://apps.nextcloud.com/apps/documentserver_community) 

2. a client part, such as: 
   1. The [ONLYOFFICE connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice) 
   2. The [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

A solution made easy by YunoHost is to install (1.i) and (2.i), see [section below](https://github.com/YunoHost-Apps/onlyoffice_ynh/#configuration-of-onlyoffice-server). The Nextcloud addicts may follow [this tutorial](https://github.com/YunoHost-Apps/nextcloud_ynh#configure-onlyoffice-integration) to install (1.ii) and (2.i) on one Nextcloud instance. However, performance and architecture are limited.


**Shipped version:** 8.0.1~ynh1

**Demo:** https://www.onlyoffice.com/fr/download-desktop.aspx

## Screenshots

![Screenshot of OnlyOffice](./doc/screenshots/document-short.png)

## Disclaimers / important information

## Demo

* A free 30 days demo of Document Server is available from ONLYOFFICE connector for Nextcloud:
  * Install Nextcloud and the ONLYOFFICE app (connector).
  * Go in the Nextcloud administrator settings, section ONLYOFFICE.
  * Tick the box `Connection to demo ONLYOFFICE Document Server` in Server Parameters.
* Some testing is also possible using [ONLYOFFICE Desktop Editor](https://www.onlyoffice.com/fr/download-desktop.aspx).

## Prerequisite

You should not install ONLYOFFICE on your main YunoHost domain, especially if you want to use it with a Nextcloud installed on the same domain.
* Add a new domain for ONLYOFFICE in YunoHost.
  * If your main YunoHost domain was provided by YunoHost, e.g. `domain.nohost.me`, then you don't have to buy/register a new domain name.
  * Just click on `I already have a domain`.
  * Type e.g. `office.domain.nohost.me` and click on `Add`.
* Add a Let's Encrypt certificate for this domain.

## Configuration of ONLYOFFICE Server

* Assuming that:
  * `yunohost.domain` is your main YunoHost domain.
  * You have configured `office.yunohost.domain` for ONLYOFFICE, see Prerequisite above.
  * You have Nextcloud installed on `yunohost.domain/nextcloud` or `nextcloud.yunohost.domain`.
* Install `ONLYOFFICE` using CLI or webadmin.
  * Choose a domain name for ONLYOFFICE that is different from your Nextcloud domain, e.g. `office.yunohost.domain` (or `office.domain.nohost.me`, see previous section).
  * Choose a path for ONLYOFFICE, e.g. `/` if you install on `office.yunohost.domain` (do not install any other app on this domain).
  * The domain of your Nextcloud instance, e.g. `yunohost.domain/nextcloud` or `nextcloud.yunohost.domain`.
  * Is it a public application? **If you want to connect it to Nextcloud, ONLYOFFICE should be public**: then select `Yes` or `tick the box`.

## How to edit ONLYOFFICE documents?

### Web Edition in Nextcloud

Prerequisite: **ONLYOFFICE should be public**, see previous section.
* In Nextcloud apps store, install `ONLYOFFICE`, i.e. the [ONLYOFFICE connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice).
* Go in the Nextcloud `settings` > `Administration` > `ONLYOFFICE` > `Server settings` > `Address of the Document Server`.
* Give the installation domain of your `onlyoffice`, e.g. `https://office.yunohost.domain/`.
* Give the secret key that was sent to you by email during the install (you can also retrieve it with the CLI command `sudo documentserver-jwt-status.sh`).
* Click `Save`.
* Create a new document and enjoy!

### Desktop Edition on PC

* Download and install a [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx).
* Start ONLYOFFICE and Go to `Connect to cloud` > `Add cloud`.
  * Select `ONLYOFFICE` and give the installation domain of your `ONLYOFFICE`, e.g. `office.yunohost.domain`
  * or (only if you connected `ONLYOFFICE` to Nextcloud, see previous section).
  * Select `Nextcloud` and give your Nextcloud installation domain, e.g. `yunohost.domain/nextcloud`.
* Create a new document and enjoy!

## Documentation and resources

* Official app website: <https://www.onlyoffice.com>
* Upstream app code repository: <https://github.com/ONLYOFFICE/DocumentServer>
* YunoHost Store: <https://apps.yunohost.org/app/onlyoffice>
* Report a bug: <https://github.com/YunoHost-Apps/onlyoffice_ynh/issues>

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

To try the testing branch, please proceed like that.

``` bash
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
or
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>