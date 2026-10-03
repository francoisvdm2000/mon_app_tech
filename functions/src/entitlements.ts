import * as crypto from "crypto";
import { getFirestore, FieldValue, Timestamp } from "firebase-admin/firestore";
import { logger } from "firebase-functions";
import { Category } from "./config";

export type Platform = "ios" | "android";

/** Identifiant stable et court pour un couple (plateforme, référence d'achat). */
export function mappingId(platform: Platform, refId: string): string {
  return crypto.createHash("sha256").update(`${platform}:${refId}`).digest("hex");
}

export interface VerificationOutcome {
  platform: Platform;
  /** originalTransactionId (iOS) ou purchaseToken (Android). */
  refId: string;
  category: Category;
  productId: string;
  active: boolean;
  expiresAt: Date | null;
}

/**
 * Source de vérité des entitlements.
 *
 * entitlements/{uid}                  -> { categories: { [cat]: {...} }, updatedAt }
 * purchaseMappings/{hash(platform,ref)} -> { uid, category, platform, productId, refId, active, expiresAt, updatedAt }
 *
 * purchaseMappings sert à la fois à retrouver l'utilisateur depuis un
 * webhook (App Store / Play) et de file de travail pour la revérification
 * planifiée (recheck.ts).
 */
export async function upsertEntitlement(
  uid: string,
  outcome: VerificationOutcome
): Promise<void> {
  const db = getFirestore();
  const expiresAtTs = outcome.expiresAt
    ? Timestamp.fromDate(outcome.expiresAt)
    : null;

  const mappingRef = db
    .collection("purchaseMappings")
    .doc(mappingId(outcome.platform, outcome.refId));
  const entitlementRef = db.collection("entitlements").doc(uid);

  await db.runTransaction(async (tx) => {
    tx.set(
      mappingRef,
      {
        uid,
        category: outcome.category,
        platform: outcome.platform,
        productId: outcome.productId,
        refId: outcome.refId,
        active: outcome.active,
        expiresAt: expiresAtTs,
        updatedAt: FieldValue.serverTimestamp(),
      },
      { merge: true }
    );

    tx.set(
      entitlementRef,
      {
        categories: {
          [outcome.category]: {
            active: outcome.active,
            expiresAt: expiresAtTs,
            productId: outcome.productId,
            platform: outcome.platform,
            updatedAt: FieldValue.serverTimestamp(),
          },
        },
        updatedAt: FieldValue.serverTimestamp(),
      },
      { merge: true }
    );
  });

  logger.info("Entitlement mis à jour", {
    uid,
    category: outcome.category,
    active: outcome.active,
    expiresAt: outcome.expiresAt?.toISOString() ?? null,
  });
}

/**
 * Retrouve l'utilisateur propriétaire d'une référence d'achat (webhook Apple/Google)
 * et applique la nouvelle vérification. Si aucun mapping n'existe encore
 * (notification arrivée avant le premier verifyPurchase, cas rare), on log
 * et on abandonne : le prochain verifyPurchase ou passage de recheck.ts
 * réconciliera l'état.
 */
export async function applyVerificationByRef(
  platform: Platform,
  refId: string,
  data: { productId: string; category: Category; active: boolean; expiresAt: Date | null }
): Promise<void> {
  const db = getFirestore();
  const mappingSnap = await db
    .collection("purchaseMappings")
    .doc(mappingId(platform, refId))
    .get();

  if (!mappingSnap.exists) {
    logger.warn("applyVerificationByRef: aucun mapping trouvé, ignoré", {
      platform,
      refId,
    });
    return;
  }

  const uid = mappingSnap.get("uid") as string;
  await upsertEntitlement(uid, {
    platform,
    refId,
    category: data.category,
    productId: data.productId,
    active: data.active,
    expiresAt: data.expiresAt,
  });
}
