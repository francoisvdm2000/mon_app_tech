import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_bootstrap_service.dart';

class CategoryEntitlement {
  final bool active;
  final DateTime? expiresAt;

  const CategoryEntitlement({required this.active, this.expiresAt});

  Map<String, dynamic> toJson() => {
        'active': active,
        'expiresAt': expiresAt?.millisecondsSinceEpoch,
      };

  factory CategoryEntitlement.fromJson(Map<String, dynamic> json) {
    return CategoryEntitlement(
      active: json['active'] as bool? ?? false,
      expiresAt: json['expiresAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['expiresAt'] as int)
          : null,
    );
  }
}

/// État des achats, source de vérité = Firestore `entitlements/{uid}`,
/// écrit UNIQUEMENT par les Cloud Functions (functions/src/verifyPurchase.ts
/// et les webhooks Apple/Google) après vérification réelle auprès des stores.
///
/// Le client ne débloque plus jamais un accès en se fiant seulement au
/// statut renvoyé par le SDK in_app_purchase — c'est exactement le bug qui a
/// permis un accès Pro gratuit non voulu.
///
/// Un cache local (SharedPreferences) permet de fonctionner hors-ligne,
/// mais seulement pendant une fenêtre de grâce limitée : passé ce délai sans
/// synchro serveur réussie, l'accès payant n'est plus accordé tant qu'une
/// connexion n'a pas permis de revérifier l'état réel.
class EntitlementService {
  EntitlementService._();

  static const _kCacheKey = 'entitlement_cache_v1';
  static const _kLastSyncedKey = 'entitlement_last_synced_at_v1';

  /// Durée pendant laquelle le dernier état connu reste utilisable hors-ligne.
  static const Duration offlineGrace = Duration(hours: 72);

  static StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _docSub;
  static StreamSubscription<User?>? _authSub;

  static Map<String, CategoryEntitlement> _state = {};
  static DateTime? _lastSyncedAt;
  static bool _initialized = false;
  static Future<void>? _coldStartLoad;
  static Future<void>? _diskLoad;

  /// Réponse immédiate depuis le cache disque quand il ACCORDE l'accès
  /// (abonné connu) : pas besoin d'attendre le réseau au démarrage. Un cache
  /// qui refuse l'accès attend, lui, la synchro serveur (achat récent).
  static Future<bool> _grantedFromCache(String categoryKey,
      {bool inheritPro = true}) async {
    await _diskLoad;
    final lastSynced = _lastSyncedAt;
    if (lastSynced == null) return false;
    if (DateTime.now().difference(lastSynced) > offlineGrace) return false;
    if (inheritPro && _state['pro']?.active == true) return true;
    return _state[categoryKey]?.active == true;
  }

  /// À appeler une fois au démarrage (main.dart), après l'auth bootstrap.
  /// Idempotent : les appels suivants (ex. depuis hasCategoryAccess) ne
  /// relancent rien si déjà initialisé.
  static void init() {
    if (_initialized) return;
    _initialized = true;

    final diskLoad = _loadFromDisk();

    // Le cache disque (rapide) peut être périmé par rapport à Firestore
    // (réseau, plus lent) — par exemple juste après un achat vérifié par
    // verifyPurchase pendant qu'une page a déjà été construite. Sans ce
    // fetch initial, hasCategoryAccess() pouvait répondre avec l'état
    // pré-achat au cold start, et comme les pages ne vérifient l'accès
    // qu'une fois dans initState(), ça restait figé jusqu'à re-navigation
    // — y compris après un redémarrage complet de l'app (la course se
    // rejouait à chaque fois). On borne l'attente pour rester utilisable
    // hors-ligne.
    final current = FirebaseAuth.instance.currentUser;
    // La session Firebase est établie en arrière-plan (démarrage non
    // bloquant) : on attend qu'elle soit prête avant le fetch serveur, le
    // tout borné pour rester utilisable hors-ligne.
    final freshSync = AuthBootstrapService.ready.then((_) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return Future<void>.value();
      return _fetchFreshOnce(user.uid);
    }).timeout(const Duration(seconds: 6), onTimeout: () {});
    _diskLoad = diskLoad;

    _coldStartLoad = Future.wait([diskLoad, freshSync]).then((_) {});

    _authSub = FirebaseAuth.instance.authStateChanges().listen((user) {
      _docSub?.cancel();
      _docSub = null;
      if (user != null) {
        _listenTo(user.uid);
      }
    });

    if (current != null) {
      _listenTo(current.uid);
    }
  }

  /// Lit l'entitlement une fois depuis le serveur (pas le cache local, pas
  /// le stream) pour rattraper l'état réel dès le cold start. Silencieux en
  /// cas d'échec (hors-ligne) : le cache disque + la fenêtre de grâce
  /// prennent le relais.
  static Future<void> _fetchFreshOnce(String uid) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('entitlements')
          .doc(uid)
          .get(const GetOptions(source: Source.server));
      _applySnapshot(snapshot.data());
    } catch (e) {
      debugPrint('EntitlementService: sync initial échoué: $e');
    }
  }

  static void _listenTo(String uid) {
    _docSub = FirebaseFirestore.instance
        .collection('entitlements')
        .doc(uid)
        .snapshots()
        .listen(
      (snapshot) => _applySnapshot(snapshot.data()),
      onError: (Object e, StackTrace st) {
        debugPrint('EntitlementService: erreur d\'écoute Firestore: $e');
      },
    );
  }

  static void _applySnapshot(Map<String, dynamic>? data) {
    final categories =
        (data?['categories'] as Map<String, dynamic>?) ?? const {};

    final parsed = <String, CategoryEntitlement>{};
    categories.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        final active = value['active'] as bool? ?? false;
        final expiresAtRaw = value['expiresAt'];
        final expiresAt =
            expiresAtRaw is Timestamp ? expiresAtRaw.toDate() : null;
        parsed[key] = CategoryEntitlement(active: active, expiresAt: expiresAt);
      }
    });

    _state = parsed;
    _lastSyncedAt = DateTime.now();
    unawaited(_saveToDisk());
  }

  static Future<void> _saveToDisk() async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(_state.map((k, v) => MapEntry(k, v.toJson())));
    await prefs.setString(_kCacheKey, json);
    await prefs.setInt(
      _kLastSyncedKey,
      (_lastSyncedAt ?? DateTime.now()).millisecondsSinceEpoch,
    );
  }

  static Future<void> _loadFromDisk() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kCacheKey);
    final lastSynced = prefs.getInt(_kLastSyncedKey);

    // Le listener Firestore (ou refreshNow) peut avoir déjà répondu pendant
    // qu'on lisait le disque : dans ce cas ses données sont plus fraîches
    // que le cache, on ne les écrase pas.
    if (_lastSyncedAt != null) return;

    if (lastSynced != null) {
      _lastSyncedAt = DateTime.fromMillisecondsSinceEpoch(lastSynced);
    }

    if (raw == null) return;
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      _state = decoded.map(
        (k, v) => MapEntry(
          k,
          CategoryEntitlement.fromJson(v as Map<String, dynamic>),
        ),
      );
    } catch (_) {
      _state = {};
    }
  }

  /// true si `categoryKey` (ou "pro", qui inclut tout) est actif selon le
  /// dernier état serveur connu et encore dans la fenêtre de grâce hors-ligne.
  static Future<bool> hasCategoryAccess(String categoryKey) async {
    init();
    if (await _grantedFromCache(categoryKey)) return true;
    await _coldStartLoad;

    final lastSynced = _lastSyncedAt;
    if (lastSynced == null) return false;
    if (DateTime.now().difference(lastSynced) > offlineGrace) return false;

    if (_state['pro']?.active == true) return true;
    return _state[categoryKey]?.active == true;
  }

  /// true si `categoryKey` précisément (sans hériter de "pro") est actif.
  /// Utilisé pour l'affichage "déjà possédé" catégorie par catégorie.
  static Future<bool> isCategoryDirectlyActive(String categoryKey) async {
    init();
    if (await _grantedFromCache(categoryKey, inheritPro: false)) return true;
    await _coldStartLoad;

    final lastSynced = _lastSyncedAt;
    if (lastSynced == null) return false;
    if (DateTime.now().difference(lastSynced) > offlineGrace) return false;

    return _state[categoryKey]?.active == true;
  }

  /// Arrête les écouteurs (auth + Firestore) et réinitialise l'état interne.
  /// Pas appelé en usage normal (le service vit pour toute la durée de vie
  /// de l'app), utile surtout pour les tests ou un hot restart propre.
  static Future<void> dispose() async {
    await _docSub?.cancel();
    await _authSub?.cancel();
    _docSub = null;
    _authSub = null;
    _initialized = false;
    _state = {};
    _lastSyncedAt = null;
    _coldStartLoad = null;
    _diskLoad = null;
  }

  /// Relit l'entitlement directement depuis le serveur (pas le cache local).
  /// À appeler après un appel réussi à verifyPurchase pour refléter l'achat
  /// immédiatement dans l'UI, sans attendre le prochain événement du stream.
  static Future<void> refreshNow() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('entitlements')
          .doc(uid)
          .get(const GetOptions(source: Source.server));
      _applySnapshot(snapshot.data());
    } catch (e) {
      debugPrint('EntitlementService.refreshNow a échoué: $e');
    }
  }
}
