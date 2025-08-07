## Intégrez votre serveur ONLYOFFICE dans une application

Pour intégrer les éditeurs dans votre application (nextcloud, seafile, etc.) :
1. Installez l'extension dédiée onlyoffice connector dans vos applications
2. Effectuez les réglages suivants dans la configuration de cette extension et enregistrez (ou redémarrez le service de l'application s'il s'agit d'un fichier de configuration) :
  - Adresse du serveur de documents : « https://__DOMAIN____PATH__ »
  - Clé secrète : « __JWT_SECRET__ »
3. Testez la modification ou la création d'un document sur votre application

### Nextcloud
Pour configurer OnlyOffice avec Nextcloud :

- Dans Nextcloud, installez l'application ONLYOFFICE
- Allez dans les paramètres sous « Administration > ONLYOFFICE > Paramètres du serveur »
- Adresse du serveur de documents : « https://__DOMAIN____PATH__ »
- Clé secrète : « __JWT_SECRET__ »

OnlyOffice devrait désormais fonctionner avec votre Nextcloud !

### Seafile
Ajouter les paramètres de configuration suivants à `seahub_settings.py`
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

### Yeswiki
Une extension existe.
Soyez libre de contribuer si vous trouvez comment l'installer.
Cf: https://github.com/YesWiki/yeswiki-extension-documents/blob/main/services/OnlyOfficeDocumentProvider.php

### Autres

Pour Owncloud, Opencloud, Mattermost, Odoo, Moodle, Redmine, Wordpress, Humhub, vous pouvez trouver les infos d'intégration ici: https://www.onlyoffice.com/all-connectors.aspx

## Questions et Réponses
### Mes applications ne peuvent pas avoir de certificat valide (adresse IP locale), puis-je les connecter à OnlyOffice ?
Oui, vous pouvez le faire en désactivant l'option « Empêcher les requêtes non authentifiées ».

Important : cela pourrait constituer une faille de sécurité si vous ne pouvez pas faire confiance à votre routeur local et à vos utilisateurs locaux...

### Je ne parviens pas à connecter mon application à ce serveur OnlyOffice
 - Vérifiez que vous disposez d'un certificat Let's Encrypt (https) valide pour votre application et ce serveur OnlyOffice
 - Vérifiez que votre application et l'application OnlyOffice sont publiques (afin que le groupe de visiteurs puisse accéder à l'application ou au moins à l'API...).
 - Vérifiez que votre application ne contient pas de mécanisme interdisant les requêtes locales sur 127.0.0.1. Si c'est le cas, vous pouvez essayer de supprimer `rm /etc/dsnmasq.d/__DOMAIN__` et redémarrer le service dnsmasq `systemctl restart dnsmasq`.

### Certaines modifications apportées aux documents sont perdues
Si vous utilisez la synchronisation du client Nextcloud et les applications Web OnlyOffice sur le même fichier, vous pouvez parfois être confronté à des situations où OnlyOffice réécrit une modification effectuée à partir d'un appareil local et la synchronise avec le client Nextcloud. Vous devriez probablement adopter une pratique avec votre équipe pour éviter cette situation. Par exemple, en adoptant une convention de nommage pour les fichiers collaboratifs à ouvrir uniquement via le Web OnlyOffice.

### Qu'en est-il des limitations d'OnlyOffice ? Est-il légal de les supprimer comme l'a fait ce package ?
OnlyOffice est édité par une société qui a décidé d'intégrer de fortes limitations à son « logiciel libre » (comme d'autres applications bureautiques). Ces limitations (20 sessions simultanées) ne sont pas faciles à comprendre pour les utilisateurs finaux (« pourquoi je ne peux pas modifier le document ??? »).

Pour supprimer ces limitations et aider les éditeurs, il faut donc acheter une licence.

D'un autre côté, nous savons que de nombreux hébergeurs indépendants n'ont pas les moyens de payer une licence coûteuse.

De plus, OnlyOffice Document Server est un logiciel AGPL v3 (comme YunoHost) qui a été popularisé en partie grâce à la renommée de cette licence... La licence AGPLv3 stipule que nous pouvons modifier le code source si nous publions le nouveau code source sous la même licence (ce que nous faisons ici : le patch est sous AGPLv3). 

Donc, comme c'est légal et que de nombreux utilisateurs l'attendaient, nous avons décidé de corriger ces anti-fonctionnalités.

