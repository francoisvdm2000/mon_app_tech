import { onCall, HttpsError } from "firebase-functions/v2/https";
import { getFirestore, FieldValue } from "firebase-admin/firestore";
import { logger } from "firebase-functions";

export interface ClaimTesterAccessResponse {
  granted: boolean;
}

/**
 * Accorde un accès "pro" complet, sans achat, aux comptes Google listés
 * dans la collection Firestore `testers` (un document par email en
 * minuscules, ex: testers/francois.vandermeeren@gmail.com avec
 * { active: true } — géré à la main via la console Firebase, jamais par
 * le client).
 *
 * Volontairement indépendant d'upsertEntitlement/purchaseMappings : ce
 * n'est pas un achat réel, donc rien à revérifier auprès d'Apple/Google.
 * L'accès survit aux réinstallations et changements d'uid anonyme tant que
 * le même compte Google est utilisé, car le client rappelle cette fonction
 * à chaque connexion Google (voir TesterAccessService côté Flutter).
 */
export const claimTesterAccess = onCall<void, Promise<ClaimTesterAccessResponse>>(
  { region: "europe-west1" },
  async (request) => {
    const uid = request.auth?.uid;
    const email = request.auth?.token.email as string | undefined;

    if (!uid || !email) {
      throw new HttpsError(
        "unauthenticated",
        "Connexion Google requise pour vérifier l'accès testeur."
      );
    }

    const db = getFirestore();
    const testerDoc = await db
      .collection("testers")
      .doc(email.toLowerCase())
      .get();

    if (!testerDoc.exists || testerDoc.data()?.active !== true) {
      return { granted: false };
    }

    await db.collection("entitlements").doc(uid).set(
      {
        categories: {
          pro: {
            active: true,
            expiresAt: null,
            productId: "tester-access",
            platform: "manual",
            updatedAt: FieldValue.serverTimestamp(),
          },
        },
        updatedAt: FieldValue.serverTimestamp(),
      },
      { merge: true }
    );

    logger.info("claimTesterAccess: accès accordé", { uid, email });
    return { granted: true };
  }
);
