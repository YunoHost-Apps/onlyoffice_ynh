## Integrate your ONLYOFFICE Server into an app

To integrate the editors into your app (nextcloud, seafile, etc.):
1. Install the dedicated onlyoffice connector extension in your apps
2. Feed the following settings in the configuration of this extension and save (or restart the app service if it's a config file):
  - Address of the Document Server: "https://__DOMAIN____PATH__"
  - Secret key: "__JWT_SECRET__"
3. Test to edit or create a document on your app

### Nextcloud
To configure OnlyOffice with Nextcloud:

- Within Nextcloud, install the ONLYOFFICE app
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

# Enable force save to let user save file when he/she presses the save button on the OnlyOffice file edit page.
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
A yeswiki-extension-documents which supports OnlyOffice exists.
Feel free to contribute if you find a way to set it up.
See https://github.com/YesWiki/yeswiki-extension-documents/blob/main/services/OnlyOfficeDocumentProvider.php

### Moodle
If you install Moodle on the same YNH as OnlyOffice, remember to remove 127.0.0.0/8 from curlsecurityblockedhosts (in Site Administration / Security / HTTP Security).

### Others

For Owncloud, Opencloud, Mattermost, Odoo, Moodle, Redmine, Wordpress, Humhub, you can find info on how to integrate OnlyOffice here: https://www.onlyoffice.com/all-connectors.aspx


## Questions & Answers
### My app doesn't have a valid certificate (local ip). Could I connect it to OnlyOffice ?
Yes, you could do it by deactivating `Prevent unauthenticated requests`. 

Important: it could be a security hole if you can't trust your local router, and your local users...

### I am not able to connect my app to this OnlyOffice server
 - Check you have a valid Let's Encrypt certificate (https) for your app and this OnlyOffice
 - Check your app and the OnlyOffice app are public (so the visitors group should be able to access the app or at least the API...).
 - Check your app doesn't contain a mechanism that forbids local request onto 127.0.0.1; if that is the case, you can try to delete `rm /etc/dsnmasq.d/__DOMAIN__` and restart the dnsmasq service `systemctl restart dnsmasq`

### Some change on documents are lost
If you use nextcloud client synchronization and OnlyOffice web apps on the same file, you could face sometimes situations where OnlyOffice rewrites a change made from a local device that is synced with the nextcloud client. You probably should adopt a practice with your team to avoid this situation. For example, by adopting a naming convention for collaborative files to open by the web OnlyOffice.

### What about the OnlyOffice limitations? Is it legal to remove them like this package did?
OnlyOffice is edited by a company which has decided to integrate strong limitations on their "free software" (like other office apps). Those limitations (20 sessions in the same time) are not easy to understand by end users ("why can't I edit the document???")

So a way to remove those limitations and to help the editors is to buy a license.

On the other hand, we know a lot of self hosters don't have enough money to pay expensive licence.

And, OnlyOffice Document Server is an AGPL v3 software (like YunoHost) and was popularized thanks in part to the fame of this license... AGPLv3 license says we can change the source code if we publish the new source code with the same license (which is what we do here: the patch is under AGPLv3). 

So, as it's legal and a lot of users waited for this, we decided to patch those anti-features.
