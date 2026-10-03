import {
  AppStoreServerAPIClient,
  APIError,
  APIException,
  Environment,
  SignedDataVerifier,
  JWSTransactionDecodedPayload,
  ResponseBodyV2DecodedPayload,
} from "@apple/app-store-server-library";
import * as fs from "fs";
import * as path from "path";
import { logger } from "firebase-functions";
import {
  APPLE_APP_APPLE_ID,
  APPLE_ISSUER_ID,
  APPLE_KEY_ID,
  APPLE_PRIVATE_KEY,
  BUNDLE_ID,
} from "./config";

export interface AppleVerificationResult {
  productId: string;
  /** Identifiant stable de l'abonnement, utilisé comme clé de mapping. */
  originalTransactionId: string;
  active: boolean;
  /** null = pas de date d'expiration (achat non-consommable/à vie). */
  expiresAt: Date | null;
  environment: "Sandbox" | "Production";
}

let cachedRootCertificates: Buffer[] | null = null;

/**
 * Charge les certificats racine Apple depuis functions/certs/.
 * Voir functions/certs/README.md pour les récupérer (Apple ne permet pas de
 * les embarquer automatiquement : téléchargement manuel obligatoire).
 */
function loadRootCertificates(): Buffer[] {
  if (cachedRootCertificates) return cachedRootCertificates;

  const certsDir = path.join(__dirname, "..", "certs");
  const files = fs.existsSync(certsDir)
    ? fs.readdirSync(certsDir).filter((f) => f.endsWith(".cer"))
    : [];

  if (files.length === 0) {
    throw new Error(
      "Aucun certificat racine Apple trouvé dans functions/certs/. " +
        "Lance `npm run fetch-apple-root-certs` dans functions/ avant de déployer."
    );
  }

  cachedRootCertificates = files.map((f) =>
    fs.readFileSync(path.join(certsDir, f))
  );
  return cachedRootCertificates;
}

function buildClient(environment: Environment): AppStoreServerAPIClient {
  return new AppStoreServerAPIClient(
    APPLE_PRIVATE_KEY.value(),
    APPLE_KEY_ID.value(),
    APPLE_ISSUER_ID.value(),
    BUNDLE_ID,
    environment
  );
}

function buildVerifier(environment: Environment): SignedDataVerifier {
  const appAppleId =
    environment === Environment.PRODUCTION
      ? Number(APPLE_APP_APPLE_ID.value())
      : undefined;

  return new SignedDataVerifier(
    loadRootCertificates(),
    /* enableOnlineChecks */ true,
    environment,
    BUNDLE_ID,
    appAppleId
  );
}

function toResult(
  payload: JWSTransactionDecodedPayload
): AppleVerificationResult {
  if (!payload.productId || !payload.originalTransactionId) {
    throw new Error("Payload de transaction Apple incomplet.");
  }

  const active =
    !payload.revocationDate &&
    (payload.expiresDate === undefined || payload.expiresDate > Date.now());

  return {
    productId: payload.productId,
    originalTransactionId: payload.originalTransactionId,
    active,
    expiresAt: payload.expiresDate ? new Date(payload.expiresDate) : null,
    environment:
      payload.environment === Environment.PRODUCTION
        ? "Production"
        : "Sandbox",
  };
}

/**
 * Vérifie une transaction App Store à partir de son transactionId
 * (= PurchaseDetails.purchaseID côté client in_app_purchase sur iOS).
 *
 * Essaie d'abord l'environnement de Production, puis retombe sur le Sandbox
 * si Apple répond "transaction introuvable" — c'est le comportement que
 * l'App Store lui-même recommande pour supporter les achats TestFlight.
 */
export async function verifyAppleTransaction(
  transactionId: string
): Promise<AppleVerificationResult> {
  const environments = [Environment.PRODUCTION, Environment.SANDBOX];
  let lastError: unknown;

  for (const environment of environments) {
    try {
      const client = buildClient(environment);
      const response = await client.getTransactionInfo(transactionId);

      if (!response.signedTransactionInfo) {
        throw new Error("Réponse Apple sans signedTransactionInfo.");
      }

      const verifier = buildVerifier(environment);
      const payload = await verifier.verifyAndDecodeTransaction(
        response.signedTransactionInfo
      );

      return toResult(payload);
    } catch (err) {
      lastError = err;
      const isNotFound =
        err instanceof APIException &&
        err.apiError === APIError.TRANSACTION_ID_NOT_FOUND;

      if (!isNotFound) {
        logger.error("verifyAppleTransaction: échec Apple", {
          environment,
          err,
        });
        throw err;
      }
      // sinon on retente dans l'environnement suivant (Sandbox)
    }
  }

  throw lastError;
}

/**
 * Vérifie et décode le signedPayload d'une App Store Server Notification V2,
 * puis en extrait la transaction associée (source d'état la plus fiable :
 * on ne se fie jamais au contenu du notificationType pour la logique métier,
 * uniquement à la transaction re-décodée).
 */
export async function verifyAppleNotification(signedPayload: string): Promise<{
  notification: ResponseBodyV2DecodedPayload;
  transaction: AppleVerificationResult | null;
}> {
  // On ne connaît pas encore l'environnement avant décodage : on tente Production
  // puis Sandbox (le champ `environment` du payload lui-même confirmera).
  let notification: ResponseBodyV2DecodedPayload | null = null;
  let lastError: unknown;

  for (const environment of [Environment.PRODUCTION, Environment.SANDBOX]) {
    try {
      const verifier = buildVerifier(environment);
      notification = await verifier.verifyAndDecodeNotification(signedPayload);
      break;
    } catch (err) {
      lastError = err;
    }
  }

  if (!notification) {
    throw lastError ?? new Error("Impossible de vérifier la notification Apple.");
  }

  const signedTransactionInfo = notification.data?.signedTransactionInfo;
  if (!signedTransactionInfo) {
    return { notification, transaction: null };
  }

  const environment =
    notification.data?.environment === Environment.PRODUCTION
      ? Environment.PRODUCTION
      : Environment.SANDBOX;
  const verifier = buildVerifier(environment);
  const payload = await verifier.verifyAndDecodeTransaction(
    signedTransactionInfo
  );

  return { notification, transaction: toResult(payload) };
}
