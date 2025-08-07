## Integrate your ONLYOFFICE Server into an app

To integrate the editors into your app (nextcloud, seafile, etc.):
1. Install the dedicated onlyoffice connector extension in your apps
2. Feel the following settings in the configuration of this extension and save (or restart the app service if it's a config file):
  - Address of the Document Server: "https://__DOMAIN____PATH__"
  - Secret key: "__JWT_SECRET__"
3. Test to edit or create a document on your app

### Nextcloud
To configure OnlyOffice with Nextcloud:

- Within Nextcloud, install ONLYOFFICE app
- go to the settings under "Administration > ONLYOFFICE > Server settings
- Address of the Document Server: "https://__DOMAIN____PATH__"
- Secret key: "__JWT_SECRET__"

OnlyOffice should now work with your Nextcloud!

### Seafile
Add the following config option to `seahub_settings.py`.
```
# Enable OnlyOffice
ENABLE_ONLYOFFICE = True
VERIFY_ONLYOFFICE_CERTIFICATE = True
ONLYOFFICE_APIJS_URL = 'https://__DOMAIN____PATH__/web-apps/apps/api/documents/api.js'
ONLYOFFICE_FILE_EXTENSION = ('doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx', 'odt', 'fodt', 'odp', 'fodp', 'ods', 'fods')
ONLYOFFICE_EDIT_FILE_EXTENSION = ('docx', 'pptx', 'xlsx')

# Enable force save to let user can save file when he/she press the save button on OnlyOffice file edit page.
ONLYOFFICE_FORCE_SAVE = True

# if JWT enabled
ONLYOFFICE_JWT_SECRET = '__JWT_SECRET__'
```

Restart seafile
```
systemctl restart seafile
systemctl restart seahub
```

### YesWiki
A yeswiki-extension-documents which support OnlyOffice exists.
Feel free to contribute if you find a way to setup it.
See https://github.com/YesWiki/yeswiki-extension-documents/blob/main/services/OnlyOfficeDocumentProvider.php

### Others

For Owncloud, Opencloud, Mattermost, Odoo, Moodle, Redmine, Wordpress, Humhub, you can find infos to integrate onlyoffice here: https://www.onlyoffice.com/all-connectors.aspx


## Question & Answer
### My apps can't have a valid certificate (local ip), could i connect it to onlyoffice ?
Yes, you could do it by deactivating `Prevent unauthenticated requests`. 

Important:it could be a security hole if you can't trust your local router, and your local users...

### I am not able to connect my app to this OnlyOffice server
 - Check you have a valid Let's Encrypt certificate (https) for your app and this OnlyOffice
 - Check your app and the onlyoffice app are public (so the visitors group should be able to access the app or at least the API...).
 - Check your app doesn't contains a mechanism that forbid local request onto 127.0.0.1, if it's the case, you can try to delete `rm /etc/dsnmasq.d/__DOMAIN__` and restart dnsmasq service `systemctl restart dnsmasq`

### Some change on documents are lost
If you use nextcloud client synchronization and OnlyOffice web apps on the same file, you could face sometimes situations where OnlyOffice rewrite a change made from a local device and sync with nextcloud client. You probably should adopt practice with your team to avoid this situation. For example, by adopting naming convention for collaborative files to open by the web onlyoffice.

### What about the OnlyOffice limitations ? Is it legal to remove it like this package did it ?
OnlyOffice is edited by a company which have decided to integrate strong limitations on their "free software" (like others office apps). Those limitations (20 sessions in the same time) are not easy to understand by end users ("why i can't edit the document ???")

So a way to remove those limitations and to help the editors is to buy a license.

On the other way, we know a lot of self hosters don't have enough money to pay expensive licence.

And, OnlyOffice Document Server is an AGPL v3 software (like YunoHost) and was popularized thanks in part to the fame of this license... AGPLv3 license says we can change the source code if we publish the new source code with the same license (what we do here: the patch is under AGPLv3). 

So, as it's legal and a lot of users waited for this, we decided to patch those anti-features.
