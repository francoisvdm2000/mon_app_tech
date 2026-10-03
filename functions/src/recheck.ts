import { onSchedule } from "firebase-functions/v2/scheduler";
import { logger } from "firebase-functions";
import { getFirestore, Timestamp } from "firebase-admin/firestore";
import {
  APPLE_PRIVATE_KEY,
  GOOGLE_PLAY_SERVICE_ACCOUNT_JSON,
  categoryFromProductId,
} from "./config";
import { verifyAppleTransaction } from "./appStore";
import { verifyAndroidPurchase } from "./playStore";
import { upsertEntitlement } from "./entitlements";

const RECHECK_WINDOW_MS = 3 * 24 * 60 * 60 * 1000; // 3 jours
const BATCH_LIMIT = 200;

/**
 * Filet de sécurité : les webhooks Apple/Google (appStoreWebhook,
 * playWebhook) sont censés tenir les entitlements à jour en temps réel,
 * mais un webhook peut être manqué (panne, changement d'URL, etc.). Cette
 * tâche planifiée revérifie directement auprès des stores tout entitlement
 * actif dont l'expiration est passée ou approche sous 3 jours.
 */
export const recheckEntitlements = onSchedule(
  {
    schedule: "every 6 hours",
    region: "europe-west1",
    secrets: [APPLE_PRIVATE_KEY, GOOGLE_PLAY_SERVICE_ACCOUNT_JSON],
    timeoutSeconds: 540,
  },
  async () => {
    const db = getFirestore();
    const threshold = Timestamp.fromMillis(Date.now() + RECHECK_WINDOW_MS);

    const due = await db
      .collection("purchaseMappings")
      .where("active", "==", true)
      .where("expiresAt", "<=", threshold)
      .limit(BATCH_LIMIT)
      .get();

    logger.info(`recheckEntitlements: ${due.size} entitlement(s) à revérifier`);

    for (const doc of due.docs) {
      const { uid, platform, productId, refId } = doc.data() as {
        uid: string;
        platform: "ios" | "android";
        productId: string;
        refId: string;
      };

      const category = categoryFromProductId(productId);
      if (!category) continue;

      try {
        if (platform === "ios") {
          const result = await verifyAppleTransaction(refId);
          await upsertEntitlement(uid, {
            platform: "ios",
            refId: result.originalTransactionId,
            category,
            productId: result.productId,
            active: result.active,
            expiresAt: result.expiresAt,
          });
        } else {
          const result = await verifyAndroidPurchase(productId, refId);
          await upsertEntitlement(uid, {
            platform: "android",
            refId,
            category,
            productId: result.productId,
            active: result.active,
            expiresAt: result.expiresAt,
          });
        }
      } catch (err) {
        logger.error("recheckEntitlements: échec pour un mapping", {
          uid,
          platform,
          productId,
          err,
        });
        // On continue avec les suivants — un échec isolé ne doit pas bloquer le lot.
      }
    }
  }
);
