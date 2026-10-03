# Certificats racine Apple

`appStore.ts` a besoin des certificats racine Apple (au format DER, `.cer`)
pour vérifier la chaîne de signature des transactions et des notifications
App Store Server. Ils ne sont **pas commités** ici — Apple recommande de les
récupérer directement depuis leur site à chaque déploiement plutôt que de les
figer dans un dépôt.

## Récupération

Depuis `functions/`, avant chaque déploiement :

```bash
npm run fetch-apple-root-certs
```

Ou manuellement depuis https://www.apple.com/certificateauthority/ :
télécharge **Apple Root CA - G3** et **Apple Root CA - G2** (format DER),
place les fichiers `.cer` dans ce dossier (`functions/certs/`).

Le code (`loadRootCertificates()` dans `appStore.ts`) charge automatiquement
tous les fichiers `*.cer` présents ici.
