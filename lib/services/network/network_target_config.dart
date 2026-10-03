import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:network_info_plus/network_info_plus.dart';

/// Protocole d'émission/interrogation réseau lumière choisi par l'utilisateur.
enum NetworkOutputProtocol { artnet, sacn }

/// Comment on choisit l'adresse IP destination.
enum NetworkTargetMode { broadcast, unicast }

/// Réglages partagés de "vers qui on parle" sur le réseau lumière
/// (Art-Net / sACN) : protocole, univers, mode de ciblage (broadcast
/// automatique déduit du WiFi courant, ou IP manuelle en unicast).
///
/// Auparavant ces réglages vivaient uniquement dans `DmxSenderService`
/// (console virtuelle), ce qui les rendait impossibles à réutiliser ailleurs
/// sans copier-coller. Ils sont maintenant centralisés ici : la console
/// virtuelle délègue à ce service, et tout futur outil qui parle au même
/// réseau lumière (outil RDM, testeurs réseau...) peut s'y brancher
/// directement pour cibler exactement le même node, sans dupliquer la
/// logique de résolution d'IP.
///
/// Singleton simple (même convention que `patchStore` / `dmxSenderService`).
class NetworkTargetConfig extends ChangeNotifier {
  NetworkTargetConfig._();
  static final NetworkTargetConfig instance = NetworkTargetConfig._();

  NetworkOutputProtocol protocol = NetworkOutputProtocol.artnet;

  /// Premier univers de la plage ciblée.
  int startUniverse = 1;

  /// Nombre d'univers consécutifs à couvrir à partir de [startUniverse]
  /// (1 = un seul univers, comportement historique). Permet de piloter
  /// d'un coup un groupe de machines patchées (import MVR) qui s'étale sur
  /// plusieurs univers.
  int universeCount = 1;

  NetworkTargetMode targetMode = NetworkTargetMode.broadcast;
  String manualIp = '';

  /// Alias rétrocompatible : la plupart des outils à un seul univers
  /// (faders simples, fixture GDTF isolée) ne connaissent que "l'univers",
  /// qui correspond au premier de la plage.
  int get universe => startUniverse;
  set universe(int u) => startUniverse = u;

  /// Univers effectivement ciblés, dans l'ordre : [startUniverse,
  /// startUniverse + universeCount - 1].
  List<int> get universes => List<int>.generate(
        universeCount < 1 ? 1 : universeCount,
        (i) => startUniverse + i,
      );

  /// Définit la plage cible en une fois (ex : groupe MVR couvrant plusieurs
  /// univers) et notifie les écouteurs (UI console, etc.).
  void setUniverseRange(int start, int count) {
    startUniverse = start < 1 ? 1 : start;
    universeCount = count < 1 ? 1 : count;
    notifyListeners();
  }

  InternetAddress? _resolvedTarget;
  InternetAddress? get resolvedTarget => _resolvedTarget;
  String? get resolvedTargetLabel => _resolvedTarget?.address;

  /// Recalcule l'IP cible à partir des réglages courants : IP manuelle en
  /// unicast, sinon broadcast x.x.x.255 déduit du WiFi courant (fallback
  /// 255.255.255.255 si indisponible).
  Future<void> refreshTarget() async {
    if (targetMode == NetworkTargetMode.unicast && manualIp.trim().isNotEmpty) {
      final parsed = InternetAddress.tryParse(manualIp.trim());
      _resolvedTarget = parsed ?? _resolvedTarget;
      notifyListeners();
      return;
    }

    // Broadcast automatique : x.x.x.255 déduit du WiFi courant.
    try {
      final info = NetworkInfo();
      final ip = await info.getWifiIP();
      if (ip != null && ip.contains('.')) {
        final parts = ip.split('.');
        if (parts.length == 4) {
          _resolvedTarget =
              InternetAddress('${parts[0]}.${parts[1]}.${parts[2]}.255');
          notifyListeners();
          return;
        }
      }
    } catch (_) {
      // ignore, fallback ci-dessous
    }
    _resolvedTarget = InternetAddress('255.255.255.255');
    notifyListeners();
  }
}

/// Accès global, même convention que `dmxSenderService` / `patchStore`.
final NetworkTargetConfig networkTargetConfig = NetworkTargetConfig.instance;
