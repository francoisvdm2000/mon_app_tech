import { onCall, HttpsError } from "firebase-functions/v2/https";
import { logger } from "firebase-functions";
import {
  APPLE_APP_APPLE_ID,
  APPLE_ISSUER_ID,
  APPLE_KEY_ID,
  APPLE_PRIVATE_KEY,
  GOOGLE_PLAY_SERVICE_ACCOUNT_JSON,
  categoryFromProductId,
} from "./config";
import { verifyAppleTransaction } from "./appStore";
import { verifyAndroidPurchase } from "./playStore";
import { upsertEntitlement } from "./entitlements";

interface VerifyPurchaseRequest {
  platform: "ios" | "android";
  productId: string;
  /**
   * iOS: transactionId (PurchaseDetails.purchaseID).
   * Android: purchase token (PurchaseDetails.verificationData.serverVerificationData).
   */
  token: string;
}

interface VerifyPurchaseResponse {
  category: string;
  active: boolean;
  expiresAt: string | null;
}

/**
 * Callable appelée par le client juste après un achat/restauration marqué
 * `purchased`/`restored` par le plugin in_app_purchase. Revérifie l'achat
 * directement auprès d'Apple/Google (jamais de confiance aveugle dans le
 * statut renvoyé par le SDK client) avant d'écrire l'entitlement.
 */
export const verifyPurchase = onCall<VerifyPurchaseRequest>(
  {
    region: "europe-west1",
    secrets: [
      APPLE_PRIVATE_KEY,
      GOOGLE_PLAY_SERVICE_ACCOUNT_JSON,
    ],
    cpu: 1,
  },
  async (request): Promise<VerifyPurchaseResponse> => {
    if (!request.auth?.uid) {
      throw new HttpsError(
        "unauthenticated",
        "Connexion (même anonyme) requise avant de vérifier un achat."
      );
    }

    const { platform, productId, token } = request.data ?? {};

    if (
      (platform !== "ios" && platform !== "android") ||
      typeof productId !== "string" ||
      typeof token !== "string" ||
      !productId ||
      !token
    ) {
      throw new HttpsError("invalid-argument", "Requête de vérification invalide.");
    }

    const category = categoryFromProductId(productId);
    if (!category) {
      throw new HttpsError(
        "invalid-argument",
        `productId inconnu : ${productId}`
      );
    }

    try {
      if (platform === "ios") {
        // Params Apple requis même si non listés en secrets (issuer/key id/app id
        // ne sont pas sensibles au même niveau que la clé privée, mais doivent
        // être configurés).
        void APPLE_ISSUER_ID.value();
        void APPLE_KEY_ID.value();
        void APPLE_APP_APPLE_ID.value();

        const result = await verifyAppleTransaction(token);

        if (result.productId !== productId) {
          throw new HttpsError(
            "failed-precondition",
            "Le produit vérifié par Apple ne correspond pas à la demande."
          );
        }

        await upsertEntitlement(request.auth.uid, {
          platform: "ios",
          refId: result.originalTransactionId,
          category,
          productId: result.productId,
          active: result.active,
          expiresAt: result.expiresAt,
        });

        return {
          category,
          active: result.active,
          expiresAt: result.expiresAt?.toISOString() ?? null,
        };
      }

      // Android
      const result = await verifyAndroidPurchase(productId, token);

      await upsertEntitlement(request.auth.uid, {
        platform: "android",
        refId: token,
        category,
        productId: result.productId,
        active: result.active,
        expiresAt: result.expiresAt,
      });

      return {
        category,
        active: result.active,
        expiresAt: result.expiresAt?.toISOString() ?? null,
      };
    } catch (err) {
      if (err instanceof HttpsError) throw err;

      logger.error("verifyPurchase: échec de vérification", {
        uid: request.auth.uid,
        platform,
        productId,
        err,
      });
      throw new HttpsError(
        "internal",
        "Impossible de vérifier cet achat auprès du store pour le moment."
      );
    }
  }
);
