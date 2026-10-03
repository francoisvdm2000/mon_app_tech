import { onRequest } from "firebase-functions/v2/https";
import { logger } from "firebase-functions";
import { APPLE_PRIVATE_KEY, categoryFromProductId } from "./config";
import { verifyAppleNotification } from "./appStore";
import { applyVerificationByRef } from "./entitlements";

/**
 * Endpoint public à déclarer dans App Store Connect :
 * App Store Connect > l'app > App Information > App Store Server Notifications
 * (URL Production ET URL Sandbox — les deux pointent vers cette même function).
 *
 * On ne fait JAMAIS confiance au contenu métier de la notification : on
 * revérifie/redécode systématiquement la transaction signée qu'elle contient
 * et on réécrit l'état à partir de cette source unique de vérité.
 */
export const appStoreWebhook = onRequest(
  { region: "europe-west1", secrets: [APPLE_PRIVATE_KEY] },
  async (req, res) => {
    if (req.method !== "POST") {
      res.status(405).send("Method Not Allowed");
      return;
    }

    const signedPayload = req.body?.signedPayload;
    if (typeof signedPayload !== "string") {
      res.status(400).send("Missing signedPayload");
      return;
    }

    try {
      const { notification, transaction } = await verifyAppleNotification(
        signedPayload
      );

      if (!transaction) {
        // Notifications sans transaction exploitable (TEST, résumé de
        // prolongation en masse, etc.) : on accuse simplement réception.
        logger.info("appStoreWebhook: notification sans transaction", {
          type: notification.notificationType,
          subtype: notification.subtype,
        });
        res.status(200).send("OK");
        return;
      }

      const category = categoryFromProductId(transaction.productId);
      if (!category) {
        logger.warn("appStoreWebhook: productId inconnu", {
          productId: transaction.productId,
        });
        res.status(200).send("OK");
        return;
      }

      await applyVerificationByRef("ios", transaction.originalTransactionId, {
        productId: transaction.productId,
        category,
        active: transaction.active,
        expiresAt: transaction.expiresAt,
      });

      res.status(200).send("OK");
    } catch (err) {
      logger.error("appStoreWebhook: échec de traitement", { err });
      // 500 => Apple réessaiera plus tard, ce qui est le comportement voulu
      // si l'erreur est transitoire (Firestore, réseau...).
      res.status(500).send("Internal error");
    }
  }
);
