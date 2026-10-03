# Vérification serveur des achats — mise en prod

Ce document liste ce qu'il reste à faire **toi-même** (comptes/identifiants
que je n'ai pas) pour activer la vérification côté serveur des achats
in-app. Le code (Cloud Functions + client Flutter) est déjà écrit et compile
sans erreur ; il ne fonctionnera qu'une fois ces étapes faites.

## Pourquoi ce chantier

Le correctif rapide (filtrer `purchase.status` dans `home_page.dart`) a
fermé le trou immédiat. Mais tant que l'entitlement reste un simple booléen
`SharedPreferences` posé par le client, rien n'empêche un accès gratuit
permanent après un abonnement expiré/remboursé, ou via un appareil modifié.
La vraie protection : ne jamais faire confiance au client, toujours
revérifier l'achat auprès d'Apple/Google, stocker le résultat côté serveur
(Firestore), et le laisser expirer/se mettre à jour tout seul.

## Ce qui a été fait

- `functions/` : Cloud Functions (TypeScript, compile sans erreur) —
  `verifyPurchase` (callable, vérifie un achat via l'App Store Server API /
  Google Play Developer API), `appStoreWebhook` et `playWebhook` (notifs
  temps réel de renouvellement/expiration/remboursement), `recheckEntitlements`
  (filet de sécurité planifié toutes les 6h).
- `firestore.rules` / `firestore.indexes.json` : `entitlements/{uid}`
  lisible uniquement par son propriétaire, jamais inscriptible côté client.
- Client Flutter : connexion anonyme automatique au démarrage
  (`AuthBootstrapService`), `EntitlementService` (écoute Firestore + cache
  hors-ligne borné à 72h), achats/restaurations qui appellent désormais
  `verifyPurchase` au lieu de débloquer l'accès localement
  (`PurchaseVerificationService`).
- `lib/services/community_service.dart` : la connexion Google *lie* le
  compte au compte anonyme existant (au lieu de basculer sur un nouvel uid),
  pour ne pas perdre l'entitlement d'un utilisateur qui utilise aussi la
  communauté.

## Étapes restantes

### 1. Apple — clé App Store Server API

App Store Connect → **Utilisateurs et accès → Intégrations → In-App
Purchase** (rôle Admin requis) :
1. Crée une clé, télécharge le fichier `.p8` (téléchargeable une seule fois).
2. Note le **Key ID** et l'**Issuer ID** affichés sur cette page.
3. Récupère l'**identifiant numérique de l'app** (App Store Connect → ton
   app → App Information → "Apple ID").

### 2. Google — compte de service Play Developer API

Play Console → **Configuration → Accès à l'API** :
1. Crée (ou lie) un compte de service Google Cloud.
2. Dans Google Cloud Console, génère une clé JSON pour ce compte de service.
3. Dans Play Console, donne à ce compte de service l'accès à l'app avec au
   minimum la permission **"Voir les données financières"** (nécessaire pour
   `purchases.subscriptionsv2.get`).

### 3. Récupérer les certificats racine Apple

```bash
cd functions
npm install
npm run fetch-apple-root-certs
```

### 4. Configurer les secrets et paramètres Firebase

Depuis la racine du repo (projet Firebase déjà pointé sur `showtech-tools`
dans `.firebaserc`, celui déjà utilisé par Auth/Firestore/Storage) :

```bash
firebase functions:secrets:set APPLE_IAP_PRIVATE_KEY   # colle le contenu du .p8
firebase functions:secrets:set GOOGLE_PLAY_SERVICE_ACCOUNT_JSON   # colle le JSON entier
```

Copie `functions/.env.example` en `functions/.env` et renseigne
`APPLE_IAP_KEY_ID`, `APPLE_IAP_ISSUER_ID`, `APPLE_APP_APPLE_ID` (l'étape 6
ci-dessous donnera `PUBSUB_PUSH_SERVICE_ACCOUNT_EMAIL`).

### 5. Déployer les functions et les règles Firestore

⚠️ **Avant de déployer `firestore.rules`** : ce fichier n'existait pas dans
le dépôt (la fonctionnalité communauté tournait avec des règles gérées
seulement dans la console). Compare `firestore.rules` (section
`users`/`plugins`) avec ce qui est actuellement en prod
(`firebase firestore:rules:get` ou onglet Règles de la console) pour ne rien
casser côté communauté. Les règles `entitlements`/`purchaseMappings`, elles,
sont nouvelles et sans risque.

```bash
firebase deploy --only firestore:rules,firestore:indexes
cd functions && npm run deploy
```

Note l'URL des deux functions HTTPS affichées à la fin du déploiement
(`appStoreWebhook` et `playWebhook`), tu en as besoin pour la suite.

### 6. Brancher les notifications temps réel

**Apple** — App Store Connect → ton app → App Information → *App Store
Server Notifications* : colle l'URL de `appStoreWebhook` dans les champs
**Production** et **Sandbox** (Version 2).

**Google Play** — Play Console → Configuration → *Notifications en temps
réel* :
1. Crée un topic Pub/Sub (ex. `play-rtdn`) dans Google Cloud Console.
2. Donne au compte `google-play-developer-notifications@system.gserviceaccount.com`
   le rôle **Pub/Sub Publisher** sur ce topic.
3. Crée un compte de service dédié (ex.
   `play-rtdn-pusher@showtech-tools.iam.gserviceaccount.com`), donne-lui le
   rôle **Cloud Functions Invoker** sur `playWebhook`.
4. Crée une souscription **push** sur le topic, pointant vers l'URL de
   `playWebhook`, avec "Activer l'authentification" cochée et ce compte de
   service.
5. Renseigne l'email de ce compte de service dans
   `functions/.env` → `PUBSUB_PUSH_SERVICE_ACCOUNT_EMAIL`, puis redéploie
   les functions (`npm run deploy`).
6. Colle le nom du topic (`projects/showtech-tools/topics/play-rtdn`) dans
   Play Console.

### 7. Flutter

```bash
flutter pub get
```

(ajoute `cloud_functions` au projet — déjà déclaré dans `pubspec.yaml`.)

### 8. Tester avant de publier

- iOS : testeur Sandbox (App Store Connect → Testeurs Sandbox), fais un
  achat, vérifie dans la console Firestore que
  `entitlements/{uid}.categories.pro.active` passe à `true`.
- Android : test interne Play Console (licence de test), même vérification.
- Vérifie les logs (`firebase functions:log`) pour voir `verifyPurchase`
  s'exécuter sans erreur.
- Laisse tourner `recheckEntitlements` au moins une fois (planifiée toutes
  les 6h, ou déclenche-la manuellement depuis la console Cloud Scheduler)
  pour confirmer qu'elle ne casse rien sur un entitlement déjà à jour.

### 9. Utilisateurs déjà installés

Après cette mise à jour, l'app ignore complètement les anciens booléens
`SharedPreferences` (`sub_pro`, `sub_video`, …). Pour un vrai abonné, aucune
action requise : `home_page.dart` appelle déjà `restorePurchases()` à chaque
lancement, qui repassera automatiquement par la vérification serveur et
recréera l'entitlement Firestore correct. Un utilisateur qui avait un accès
non légitime (le bug initial), lui, perdra l'accès — c'est le but.

## Ce que je n'ai pas pu vérifier

- Le format exact de `PurchaseDetails.purchaseID` sur iOS avec la version
  actuelle de `in_app_purchase_storekit` du projet : le code part du
  principe que c'est un identifiant de transaction exploitable tel quel par
  `getTransactionInfo`. Si `verifyPurchase` échoue systématiquement côté iOS
  avec une erreur "transaction introuvable", regarde en premier ce que
  contient réellement `purchase.purchaseID` en debug.
- Les règles `firestore.rules` pour `users`/`plugins` (section communauté)
  sont une reconstitution, pas une copie des règles réellement en prod —
  à comparer avant déploiement (voir étape 5).
- Aucun test n'a pu être exécuté (pas de simulateur/Flutter SDK dans mon
  environnement, ni d'accès à tes comptes Apple/Google) : le TypeScript
  compile sans erreur, mais le parcours d'achat réel n'a pas pu être vérifié
  de bout en bout.
