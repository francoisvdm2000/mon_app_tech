import { defineSecret, defineString } from "firebase-functions/params";

/**
 * Identifiant de bundle / package, identique iOS et Android pour cette app.
 * (voir ios/Runner.xcodeproj/project.pbxproj et android/app/build.gradle.kts)
 */
export const BUNDLE_ID = "eu.openwhite.showtechtools";

/**
 * Catégories d'abonnement — DOIT rester strictement synchronisé avec
 * lib/services/subscription_service.dart (enum SubscriptionCategory + .key + .productId).
 * Si tu ajoutes/renommes une catégorie côté Flutter, répercute le changement ici.
 */
export const CATEGORIES = [
  "video",
  "lumiere",
  "laser",
  "console",
  "electricity",
  "rigging",
  "sonRf",
  "network",
  "pro",
] as const;

export type Category = (typeof CATEGORIES)[number];

/**
 * productId -> category, pour les DEUX plateformes (les valeurs sont uniques
 * globalement donc une seule table suffit). Recopié depuis
 * SubscriptionCategoryExt.productId dans subscription_service.dart.
 */
const PRODUCT_ID_TO_CATEGORY: Record<string, Category> = {
  // iOS
  ShowTechTools_Video: "video",
  ShowTechTools_Lumiere: "lumiere",
  ShowTechTools_Laser: "laser",
  ShowTechTools_Console: "console",
  ShowTechTools_electricicty: "electricity",
  ShowTechTools_Rigging: "rigging",
  ShowTechTools_SonRF: "sonRf",
  ShowTechTools_Network: "network",
  "eu.openwhite.showtechtools.pro.year": "pro",
  // Android / autres plateformes
  "showtech.video.year": "video",
  "showtech.light.year": "lumiere",
  "showtech.laser.year": "laser",
  "showtech.console.year": "console",
  "showtech.electricity.year": "electricity",
  "showtech.rigging.year": "rigging",
  "showtech.sonrf.year": "sonRf",
  "showtech.network.year": "network",
};

export function categoryFromProductId(productId: string): Category | null {
  return PRODUCT_ID_TO_CATEGORY[productId] ?? null;
}

// ─── Secrets (à définir avec `firebase functions:secrets:set <NOM>`) ───────

/** Contenu du fichier .p8 téléchargé dans App Store Connect (clé In-App Purchase). */
export const APPLE_PRIVATE_KEY = defineSecret("APPLE_IAP_PRIVATE_KEY");
/** Key ID associé à la clé ci-dessus (App Store Connect > Utilisateurs et accès > Intégrations). */
export const APPLE_KEY_ID = defineString("APPLE_IAP_KEY_ID");
/** Issuer ID affiché sur la même page. */
export const APPLE_ISSUER_ID = defineString("APPLE_IAP_ISSUER_ID");
/** Identifiant numérique de l'app dans App Store Connect (obligatoire en Production). */
export const APPLE_APP_APPLE_ID = defineString("APPLE_APP_APPLE_ID");

/** JSON complet du compte de service Google Play (rôle "Voir les infos financières" + accès Play Console API). */
export const GOOGLE_PLAY_SERVICE_ACCOUNT_JSON = defineSecret(
  "GOOGLE_PLAY_SERVICE_ACCOUNT_JSON"
);

/**
 * E-mail du compte de service dédié à la souscription push Pub/Sub des
 * notifications Google Play (RTDN). Sert à vérifier le jeton OIDC que
 * Pub/Sub joint à chaque requête, pour être sûr que playWebhook n'accepte
 * que du vrai trafic Google — sans ça, n'importe qui pourrait POSTer de
 * fausses notifications sur l'URL publique de la function.
 */
export const PUBSUB_PUSH_SERVICE_ACCOUNT_EMAIL = defineString(
  "PUBSUB_PUSH_SERVICE_ACCOUNT_EMAIL"
);
