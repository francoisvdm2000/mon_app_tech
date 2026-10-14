import 'dart:io';

import 'package:flutter/services.dart';

/// Outils partagés pour l'écoute UDP broadcast / multicast
/// (Art-Net, sACN, MA-Net3…).
class MulticastHelper {
  MulticastHelper._();

  /// Passe à true quand Apple a accordé l'entitlement
  /// com.apple.developer.networking.multicast (et qu'il est ajouté au projet).
  /// Tant que c'est false, l'app prévient l'utilisateur iOS de la limite.
  static const bool kIosMulticastEntitled = false;

  static const _channel = MethodChannel('eu.openwhite/multicast');
  static int _lockCount = 0;

  /// Android : sans WifiManager.MulticastLock, le Wi-Fi filtre le multicast
  /// (et sur certains appareils le broadcast) qui n'est pas adressé au
  /// téléphone. Compté par référence : chaque acquire() doit avoir son release().
  static Future<void> acquire() async {
    if (!Platform.isAndroid) return;
    _lockCount++;
    if (_lockCount == 1) {
      try {
        await _channel.invokeMethod('acquire');
      } catch (_) {}
    }
  }

  static Future<void> release() async {
    if (!Platform.isAndroid || _lockCount == 0) return;
    _lockCount--;
    if (_lockCount == 0) {
      try {
        await _channel.invokeMethod('release');
      } catch (_) {}
    }
  }

  static List<NetworkInterface>? _ifaceCache;

  /// Rafraîchit la liste des interfaces IPv4 (à appeler au start()).
  static Future<void> refreshInterfaces() async {
    try {
      final all = await NetworkInterface.list(type: InternetAddressType.IPv4);
      // On ignore cellulaire / tunnels : inutiles pour un réseau show et
      // chaque inscription compte dans la limite IGMP (20 par socket sur Android).
      const skip = ['rmnet', 'ccmni', 'pdp_ip', 'utun', 'ipsec', 'awdl', 'llw', 'tun'];
      _ifaceCache = all
          .where((i) => !skip.any((p) => i.name.toLowerCase().startsWith(p)))
          .toList();
    } catch (_) {
      _ifaceCache = const [];
    }
  }

  /// Rejoint [group] sur chaque interface IPv4 (Wi-Fi, Ethernet, adaptateur
  /// USB…). Sans interface explicite, l'OS ne s'abonne que sur l'interface
  /// par défaut — souvent la 4G sur un téléphone.
  /// Retourne true si au moins une inscription a réussi.
  static bool joinOnAllInterfaces(RawDatagramSocket socket, String group) {
    final addr = InternetAddress(group);
    final ifaces = _ifaceCache ?? const <NetworkInterface>[];
    var ok = false;
    for (final iface in ifaces) {
      try {
        socket.joinMulticast(addr, iface);
        ok = true;
      } catch (_) {}
    }
    if (!ok) {
      try {
        socket.joinMulticast(addr);
        ok = true;
      } catch (_) {}
    }
    return ok;
  }
}
