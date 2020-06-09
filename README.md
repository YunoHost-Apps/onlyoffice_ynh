# OnlyOffice Server for YunoHost

[![Integration level](https://dash.yunohost.org/integration/onlyoffice.svg)](https://dash.yunohost.org/appci/app/onlyoffice) ![](https://ci-apps.yunohost.org/ci/badges/onlyoffice.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/onlyoffice.maintain.svg)  
[![Install OnlyOffice with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=onlyoffice)

> *This package allows you to install OnlyOffice quickly and simply on a YunoHost server.  
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview
Online collaborative edition of OnlyOffice documents requires: 
1) a server part, with two installation options:
   a) **This package installs an OnlyOffice Document Server**. 
   b) The [Community Document Server for Nextcloud](https://apps.nextcloud.com/apps/documentserver_community) 

2) a client part, such as: 
   a) The [ONLYOFFICE connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice) 
   b) The [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

The Nextcloud addicts may follow [this tutorial](https://github.com/YunoHost-Apps/nextcloud_ynh#configure-onlyoffice-integration) to install 1)b) and 2)a) on one Nextcloud instance. However, performance and architecture are limited.

**Shipped version:** 5.2.8

## Screenshots

![](https://static-www.onlyoffice.com/v9.5.0/images/mainpage/may2018/editors/document-short.jpg)

## Demo

* A free 30 days demo of Document Server is available from OnlyOffice connector for Nextcloud:
  * Install Nextcloud and the ONLYOFFICE app (connector)
  * Go in the Nextcloud administrator settings, section ONLYOFFICE
  * Tick the box `Connection to demo ONLYOFFICE Document Server`` in Server Parameters
* Some testing is also possible using [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/fr/download-desktop.aspx)

## Prerequisite
You should not install ``onlyoffice`` on your main YunoHost domain, especially if you want to use it with a ``nextcloud`` installed on the same domain.
* Add a new domain for OnlyOffice in YunoHost 
  * If your main YunoHost domain was provided by YunoHost, e.g. ``domain.nohost.me``, then you don't have to buy/register a new domain name
  * Just click on ``I already have a domain``
  * Type e.g. ``office.domain.nohost.me`` and click on ``Add``
* Add a Let's Encrypt certificate for this domain

## Configuration of OnlyOffice Server
* Suppose:
  * ``yunohost.domain`` is your main YunoHost domain
  * you have configured ``office.yunohost.domain`` for OnlyOffice, see Prerequisite above
  * you have Nextcloud installed on ``yunohost.domain/nextcloud`` or ``nextcloud.yunohost.domain``
* Install ``onlyoffice`` using CLI or web admin
  * Choose a domain name for OnlyOffice that is different from your Nextcloud domain, e.g. ``office.yunohost.domain`` (or ``office.domain.nohost.me``, see previous section)
  * Choose a path for OnlyOffice, e.g. ``/`` if you install on ``office.yunohost.domain`` (do not install any further app on this domain)
  * The domain of your Nextcloud instance, e.g. ``yunohost.domain/nextcloud`` or ``nextcloud.yunohost.domain``
  * Is it a public application? **If you want to connect it to Nextcloud, OnlyOffice should be public**: then select ``Yes`` or ``tick the box``

## How to edit OnlyOffice documents?
### Web Edition in Nextcloud
Prerequisite: **OnlyOffice should be public**, see previous section.
* In Nextcloud apps store, install ``ONLYOFFICE``, i.e. the [OnlyOffice connector for Nextcloud](https://apps.nextcloud.com/apps/onlyoffice)
* Go in the Nextcloud ``settings``>``Administration``>``ONLYOFFICE``>``Server settings``>``Address of the Document Server``
* Give the installation domain of your ``onlyoffice``, e.g. ``https://office.yunohost.domain/`` and click ``Save``
* Create a new document and enjoy!

### Desktop Edition on PC
* Download and install a [ONLYOFFICE Desktop Editor](https://www.onlyoffice.com/fr/download-desktop.aspx)
* Start the Editor and Go to ``Connect to cloud``>``Add cloud``
  * Select ``ONLYOFFICE`` and give the installation domain of your ``onlyoffice``, e.g. ``office.yunohost.domain``
  * or (only if you connected ``onlyoffice`` to Nextcloud, see previous section)
  * Select ``Nextcloud`` and give your nextcloud installation domain, e.g. ``yunohost.domain/nextcloud``
* Create a new document and enjoy!

## Documentation

## YunoHost specific features

#### Multi-user support

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/onlyoffice%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/onlyoffice/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/onlyoffice%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/onlyoffice/)

## Links

 * Report a bug: https://github.com/YunoHost-Apps/onlyoffice_ynh/issues
 * App website: https://www.onlyoffice.com
 * Github App website: https://github.com/ONLYOFFICE/DocumentServer
 * YunoHost website: https://yunohost.org/

---

Developer info
----------------

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
or
sudo yunohost app upgrade onlyoffice -u https://github.com/YunoHost-Apps/onlyoffice_ynh/tree/testing --debug
```
