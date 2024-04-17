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
  * Is it a public application? **If you want to connect it to Nextcloud, ONLYOFFICE should be public**: then select `visitors``.

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
