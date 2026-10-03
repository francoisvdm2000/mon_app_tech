import { google, androidpublisher_v3 } from "googleapis";
import { logger } from "firebase-functions";
import { GOOGLE_PLAY_SERVICE_ACCOUNT_JSON, BUNDLE_ID } from "./config";

export interface AndroidVerificationResult {
  productId: string;
  active: boolean;
  expiresAt: Date | null;
}

const ACTIVE_STATES = new Set([
  "SUBSCRIPTION_STATE_ACTIVE",
  "SUBSCRIPTION_STATE_IN_GRACE_PERIOD",
]);

let cachedClient: androidpublisher_v3.Androidpublisher | null = null;

function getClient(): androidpublisher_v3.Androidpublisher {
  if (cachedClient) return cachedClient;

  const credentials = JSON.parse(GOOGLE_PLAY_SERVICE_ACCOUNT_JSON.value());
  const auth = new google.auth.GoogleAuth({
    credentials,
    scopes: ["https://www.googleapis.com/auth/androidpublisher"],
  });

  cachedClient = google.androidpublisher({ version: "v3", auth });
  return cachedClient;
}

/**
 * Vérifie un achat Android via l'API Google Play Developer (subscriptionsv2),
 * à partir du purchaseToken transmis par le client
 * (= PurchaseDetails.verificationData.serverVerificationData côté in_app_purchase).
 */
export async function verifyAndroidPurchase(
  productId: string,
  purchaseToken: string
): Promise<AndroidVerificationResult> {
  const client = getClient();

  const { data } = await client.purchases.subscriptionsv2.get({
    packageName: BUNDLE_ID,
    token: purchaseToken,
  });

  const lineItem =
    data.lineItems?.find((item) => item.productId === productId) ??
    data.lineItems?.[0];

  if (!lineItem) {
    logger.error("verifyAndroidPurchase: aucun lineItem dans la réponse Play", {
      productId,
    });
    throw new Error("Réponse Google Play sans lineItem exploitable.");
  }

  const state = data.subscriptionState ?? "";
  const active = ACTIVE_STATES.has(state);

  return {
    productId: lineItem.productId ?? productId,
    active,
    expiresAt: lineItem.expiryTime ? new Date(lineItem.expiryTime) : null,
  };
}
