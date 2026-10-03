import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'auth_bootstrap_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:file_picker/file_picker.dart';
import '../models/plugin_community_model.dart';
import 'tester_access_service.dart';

class CommunityService {
  static final _db      = FirebaseFirestore.instance;
  static final _auth    = FirebaseAuth.instance;
  static final _storage = FirebaseStorage.instance;

  // ─── Auth ────────────────────────────────────────────────────────────────

  static User? get currentUser => _auth.currentUser;
  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Comme [authStateChanges] mais émet aussi quand le profil change
  /// (ex. liaison Google → nom / photo disponibles).
  static Stream<User?> get userChanges => _auth.userChanges();

  /// Utilisateur réellement connecté (Google), ou null. Le compte anonyme
  /// créé au démarrage par AuthBootstrapService ne compte PAS comme
  /// « connecté » côté UI.
  static User? get signedInUser {
    final u = _auth.currentUser;
    return (u == null || u.isAnonymous) ? null : u;
  }

  static bool isRealUser(User? u) => u != null && !u.isAnonymous;

  /// Nom affichable : displayName du compte, sinon celui du provider Google
  /// (après linkWithCredential, le displayName racine peut rester vide).
  static String? displayNameOf(User u) {
    final n = u.displayName?.trim();
    if (n != null && n.isNotEmpty) return n;
    for (final p in u.providerData) {
      final pn = p.displayName?.trim();
      if (pn != null && pn.isNotEmpty) return pn;
    }
    return null;
  }

  static String? photoUrlOf(User u) {
    if (u.photoURL?.isNotEmpty ?? false) return u.photoURL;
    for (final p in u.providerData) {
      if (p.photoURL?.isNotEmpty ?? false) return p.photoURL;
    }
    return null;
  }

  static Future<UserCredential?> signInWithGoogle() async {
    // Ne jamais lier Google pendant que la session anonyme se restaure
    // encore en arrière-plan (sinon risque de nouvel uid / achat orphelin).
    await AuthBootstrapService.ready;
    try {
      final googleUser = await GoogleSignIn(
        serverClientId: '184476147032-ne4t5616j85bbhrpciligmi68hmnmplr.apps.googleusercontent.com',
      ).signIn().timeout(
        const Duration(seconds: 30),
        onTimeout: () => null,
      );
      if (googleUser == null) return null;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final current = _auth.currentUser;
      if (current != null && current.isAnonymous) {
        // On lie le compte Google au compte anonyme existant pour
        // conserver le même uid : les entitlements (achats vérifiés côté
        // serveur, voir EntitlementService) sont indexés par uid et
        // deviendraient orphelins si on basculait sur un nouvel uid.
        try {
          final result = await current.linkWithCredential(credential);
          unawaited(TesterAccessService.claimIfEligible());
          return result;
        } on FirebaseAuthException catch (e) {
          if (e.code != 'credential-already-in-use' &&
              e.code != 'email-already-in-use') {
            rethrow;
          }
          // Ce compte Google est déjà associé à un autre uid Firebase
          // (l'utilisateur avait déjà utilisé la communauté ailleurs) :
          // on bascule dessus. Dans ce cas précis, un éventuel achat déjà
          // vérifié sur l'uid anonyme actuel resterait sur l'ancien uid ;
          // il sera re-détecté au prochain achat/restauration.
        }
      }

      final result = await _auth.signInWithCredential(credential);
      unawaited(TesterAccessService.claimIfEligible());
      return result;
    } catch (e, stack) {
      debugPrint('❌ signInWithGoogle error: $e');
      debugPrint('$stack');
      rethrow;
    }
  }

  static Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
    // On recrée tout de suite une session anonyme : l'app a toujours besoin
    // d'un uid (entitlements, testeurs…), sinon il faudrait attendre le
    // prochain redémarrage. L'abonnement Pro reste rattaché au compte
    // Google et revient à la reconnexion (signInWithGoogle bascule sur cet
    // uid via credential-already-in-use).
    try {
      await _auth.signInAnonymously().timeout(const Duration(seconds: 8));
    } catch (e) {
      debugPrint('⚠️ signOut: re-création de la session anonyme échouée: $e');
    }
  }

  /// Tente de restaurer, SANS UI (pas de sélecteur de compte), une session
  /// Google déjà autorisée sur cet appareil, et de la relier au compte
  /// Firebase courant — exactement la même logique de liaison que
  /// [signInWithGoogle], juste déclenchée automatiquement plutôt que par un
  /// bouton.
  ///
  /// Utilisée par AuthBootstrapService en dernier recours avant de créer un
  /// nouveau compte anonyme, quand la restauration native de la session
  /// Firebase (Keychain iOS / Keystore Android) n'a pas abouti à temps au
  /// démarrage : Google Sign-In conserve son propre jeton persisté,
  /// indépendant de celui de Firebase, et se restaure en général de façon
  /// bien plus fiable — c'est d'ailleurs ce détour (reconnexion manuelle via
  /// la communauté) qui « répare » le compte pro/testeur aujourd'hui ; cette
  /// méthode fait la même chose automatiquement, sans que l'utilisateur ait
  /// à s'en rendre compte.
  ///
  /// Ne déclenche jamais de UI : si aucune session Google silencieuse n'est
  /// disponible (jamais connecté, ou consentement expiré), retourne
  /// simplement `false`.
  static Future<bool> trySilentGoogleRestore() async {
    try {
      final googleUser = await GoogleSignIn(
        serverClientId: '184476147032-ne4t5616j85bbhrpciligmi68hmnmplr.apps.googleusercontent.com',
      ).signInSilently().timeout(
        const Duration(seconds: 6),
        onTimeout: () => null,
      );
      if (googleUser == null) return false;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final current = _auth.currentUser;
      if (current != null && current.isAnonymous) {
        try {
          await current.linkWithCredential(credential);
          unawaited(TesterAccessService.claimIfEligible());
          return true;
        } on FirebaseAuthException catch (e) {
          if (e.code != 'credential-already-in-use' &&
              e.code != 'email-already-in-use') {
            rethrow;
          }
          // Ce compte Google est déjà associé à un autre uid Firebase : on
          // bascule dessus, comme dans signInWithGoogle().
        }
      }

      await _auth.signInWithCredential(credential);
      unawaited(TesterAccessService.claimIfEligible());
      return true;
    } catch (e, stack) {
      debugPrint('⚠️ CommunityService.trySilentGoogleRestore a échoué: $e');
      debugPrint('$stack');
      return false;
    }
  }

  // ─── Profil utilisateur ──────────────────────────────────────────────────

  static Future<UserProfile?> getProfile(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return UserProfile.fromDoc(doc);
  }

  static Future<void> setProfile(String uid, String pseudo) async {
    await _db.collection('users').doc(uid).set({
      'pseudo': pseudo.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  static Future<bool> isPseudoTaken(String pseudo) async {
    final q = await _db
        .collection('users')
        .where('pseudo', isEqualTo: pseudo.trim())
        .limit(1)
        .get();
    return q.docs.isNotEmpty;
  }

  // ─── Plugins ─────────────────────────────────────────────────────────────

  static Stream<List<PluginModel>> streamPlugins({String? category}) {
    Query q = _db
        .collection('plugins')
        .orderBy('createdAt', descending: true);
    if (category != null && category != 'all') {
      q = q.where('category', isEqualTo: category);
    }
    return q.snapshots().map((snap) {
      final list = snap.docs.map(PluginModel.fromDoc).toList();
      // Tri par likes côté client (évite les index composites multiples)
      list.sort((a, b) => b.likes.compareTo(a.likes));
      return list;
    });
  }

  static Stream<List<PluginModel>> streamMyPlugins(String uid) {
    return _db
        .collection('plugins')
        .where('authorId', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs.map(PluginModel.fromDoc).toList());
  }

  static Future<void> uploadPlugin({
    required String title,
    required String category,
    required String description,
    required String code,
    required String authorPseudo,
    List<PlatformFile> pickedFiles = const [],
  }) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('Non connecté');

    // Créer le doc en avance pour avoir son ID
    final docRef = _db.collection('plugins').doc();

    // Upload des fichiers vers Firebase Storage
    final uploadedFiles = <PluginFile>[];
    for (final file in pickedFiles) {
      final bytes = file.bytes;
      if (bytes == null) continue;
      final ref = _storage.ref('plugins/${docRef.id}/${file.name}');
      await ref.putData(bytes);
      final url = await ref.getDownloadURL();
      uploadedFiles.add(PluginFile(name: file.name, url: url));
    }

    await docRef.set({
      'title':        title.trim(),
      'category':     category,
      'description':  description.trim(),
      'code':         code.trim(),
      'files':        uploadedFiles.map((f) => f.toMap()).toList(),
      'authorId':     user.uid,
      'authorPseudo': authorPseudo,
      'likes':        0,
      'likedBy':      [],
      'createdAt':    FieldValue.serverTimestamp(),
    });
  }

  static Future<void> deletePlugin(String pluginId) async {
    // Supprimer les fichiers Storage si présents
    try {
      final listResult = await _storage.ref('plugins/$pluginId').listAll();
      for (final item in listResult.items) {
        await item.delete();
      }
    } catch (_) {}
    await _db.collection('plugins').doc(pluginId).delete();
  }

  // ─── Likes ───────────────────────────────────────────────────────────────

  static Future<void> toggleLike(PluginModel plugin) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;
    final ref = _db.collection('plugins').doc(plugin.id);
    if (plugin.likedBy.contains(uid)) {
      await ref.update({
        'likes':   FieldValue.increment(-1),
        'likedBy': FieldValue.arrayRemove([uid]),
      });
    } else {
      await ref.update({
        'likes':   FieldValue.increment(1),
        'likedBy': FieldValue.arrayUnion([uid]),
      });
    }
  }
}
