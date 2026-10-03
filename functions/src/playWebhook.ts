import { onRequest } from "firebase-functions/v2/https";
import { logger } from "firebase-functions";
import { OAuth2Client } from "google-auth-library";
import {
  GOOGLE_PLAY_SERVICE_ACCOUNT_JSON,
  PUBSUB_PUSH_SERVICE_ACCOUNT_EMAIL,
  categoryFromProductId,
} from "./config";
import { verifyAndroidPurchase } from "./playStore";
import { applyVerificationByRef } from "./entitlements";

const oauthClient = new OAuth2Client();

interface PubSubPushBody {
  message?: {
    data?: string; // base64
    messageId?: string;
    publishTime?: string;
  };
  subscription?: string;
}

interface PlayDeveloperNotification {
  version: string;
  packageName: string;
  eventTimeMillis: string;
  subscriptionNotification?: {
    version: string;
    notificationType: number;
    purchaseToken: string;
    subscriptionId: string; // = productId
  };
  testNotification?: { version: string };
}

/**
 * Vérifie que l'appel provient bien de Pub/Sub via la souscription push
 * configurée avec le compte de service attendu (jeton OIDC dans
 * `Authorization: Bearer <jwt>`).
 * https://cloud.google.com/pubsub/docs/authenticate-push-subscriptions
 */
async function assertRequestIsFromPubSub(
  authorizationHeader: string | undefined,
  expectedAudience: string
): Promise<void> {
  const expectedEmail = PUBSUB_PUSH_SERVICE_ACCOUNT_EMAIL.value();
  if (!expectedEmail) {
    // Pas encore configuré : on refuse plutôt que d'accepter du trafic non authentifié.
    throw new Error(
      "PUBSUB_PUSH_SERVICE_ACCOUNT_EMAIL non configuré : voir le runbook."
    );
  }

  const token = authorizationHeader?.replace(/^Bearer\s+/i, "");
  if (!token) {
    throw new Error("Requête sans jeton d'authentification Pub/Sub.");
  }

  const ticket = await oauthClient.verifyIdToken({
    idToken: token,
    audience: expectedAudience,
  });
  const payload = ticket.getPayload();

  if (!payload?.email_verified || payload.email !== expectedEmail) {
    throw new Error("Jeton Pub/Sub invalide ou compte de service inattendu.");
  }
}

/**
 * Endpoint push pour les Real-time Developer Notifications (RTDN) de Google
 * Play. À configurer dans Play Console > Configuration > Notifications
 * temps réel, via un topic Pub/Sub dont la souscription push pointe ici.
 *
 * Comme pour Apple : on ne se fie pas au contenu métier de la notification,
 * on l'utilise uniquement comme déclencheur pour revérifier l'état réel
 * auprès de l'API Google Play Developer.
 */
// Restreint les appels au compte de service Pub/Sub dédié (voir
// PUBSUB_PUSH_SERVICE_ACCOUNT_EMAIL) plutôt que de laisser Firebase déployer
// la function en accès public par défaut. La vérification applicative dans
// assertRequestIsFromPubSub() reste en place en défense en profondeur, mais
// bloquer aussi au niveau IAM/Cloud Run évite qu'une requête non authentifiée
// n'atteigne même le code.
const pushServiceAccountEmail = PUBSUB_PUSH_SERVICE_ACCOUNT_EMAIL.value();

export const playWebhook = onRequest(
  {
    region: "europe-west1",
    secrets: [GOOGLE_PLAY_SERVICE_ACCOUNT_JSON],
    invoker: pushServiceAccountEmail ? [pushServiceAccountEmail] : "private",
  },
  async (req, res) => {
    if (req.method !== "POST") {
      res.status(405).send("Method Not Allowed");
      return;
    }

    try {
      const expectedAudience = `https://${req.get("host")}${req.path}`;
      await assertRequestIsFromPubSub(req.get("authorization"), expectedAudience);
    } catch (err) {
      logger.error("playWebhook: authentification Pub/Sub refusée", { err });
      res.status(401).send("Unauthorized");
      return;
    }

    const body = req.body as PubSubPushBody;
    const rawData = body.message?.data;
    if (!rawData) {
      res.status(400).send("Missing Pub/Sub message data");
      return;
    }

    let notification: PlayDeveloperNotification;
    try {
      notification = JSON.parse(Buffer.from(rawData, "base64").toString("utf8"));
    } catch (err) {
      logger.error("playWebhook: payload illisible", { err });
      res.status(400).send("Invalid message data");
      return;
    }

    const sub = notification.subscriptionNotification;
    if (!sub) {
      // testNotification ou type non géré : on accuse réception sans traiter.
      res.status(200).send("OK");
      return;
    }

    const category = categoryFromProductId(sub.subscriptionId);
    if (!category) {
      logger.warn("playWebhook: productId inconnu", {
        productId: sub.subscriptionId,
      });
      res.status(200).send("OK");
      return;
    }

    try {
      const result = await verifyAndroidPurchase(
        sub.subscriptionId,
        sub.purchaseToken
      );

      await applyVerificationByRef("android", sub.purchaseToken, {
        productId: result.productId,
        category,
        active: result.active,
        expiresAt: result.expiresAt,
      });

      res.status(200).send("OK");
    } catch (err) {
      logger.error("playWebhook: échec de revérification", { err });
      // 500 => Pub/Sub réessaiera (retry policy de la souscription).
      res.status(500).send("Internal error");
    }
  }
);
