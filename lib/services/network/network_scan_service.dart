import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:network_info_plus/network_info_plus.dart';

import '../../models/network/network_device.dart';

// ─── Événements ───────────────────────────────────────────────────────────────

abstract class NetworkScanEvent {}

class NetworkScanStartedEvent extends NetworkScanEvent {
  final String localIp;
  final String subnet;
  final int totalHosts;
  NetworkScanStartedEvent({
    required this.localIp,
    required this.subnet,
    required this.totalHosts,
  });
}

class NetworkScanProgressEvent extends NetworkScanEvent {
  final int done;
  final int total;
  NetworkScanProgressEvent(this.done, this.total);
}

class NetworkScanDeviceFoundEvent extends NetworkScanEvent {
  final NetworkDevice device;
  NetworkScanDeviceFoundEvent(this.device);
}

class NetworkScanCompletedEvent extends NetworkScanEvent {
  final List<NetworkDevice> devices;
  NetworkScanCompletedEvent(this.devices);
}

class NetworkScanErrorEvent extends NetworkScanEvent {
  final String code; // 'no_network', 'permission_denied', 'error'
  final String? message;
  NetworkScanErrorEvent(this.code, [this.message]);
}

// ─── Service ──────────────────────────────────────────────────────────────────

/// Service de scan réseau local asynchrone.
///
/// Architecture prévue pour :
/// - Alarmes réseau (future)
/// - Snapshots / export (future)
/// - Diagnostic réseau (future)
/// - Luminex monitoring (future)
/// - MA-Net detection (future)
class NetworkScanService {
  static const int _concurrency = 50;
  static const int _timeoutMs = 300;

  // Ports sondés pour détecter si un hôte est actif (TCP connect)
  static const List<int> _probePorts = [80, 443, 22, 23, 8080, 8443, 5900, 21, 9100];

  bool _running = false;
  bool get isRunning => _running;

  final _controller = StreamController<NetworkScanEvent>.broadcast();
  Stream<NetworkScanEvent> get events => _controller.stream;

  /// Lance un scan réseau sur le /24 local.
  Future<void> startScan() async {
    if (_running) return;
    _running = true;

    try {
      final info = NetworkInfo();
      String? localIp;
      try {
        localIp = await info.getWifiIP();
      } catch (_) {}

      if (localIp == null || localIp.isEmpty) {
        _controller.add(NetworkScanErrorEvent('no_network'));
        _running = false;
        return;
      }

      String subnet = '255.255.255.0';
      try {
        final sub = await info.getWifiSubmask();
        if (sub != null && sub.isNotEmpty) subnet = sub;
      } catch (_) {}

      final ipRange = _computeRange(localIp, subnet);
      if (ipRange == null || ipRange.isEmpty) {
        _controller.add(NetworkScanErrorEvent('no_network'));
        _running = false;
        return;
      }

      _controller.add(NetworkScanStartedEvent(
        localIp: localIp,
        subnet: subnet,
        totalHosts: ipRange.length,
      ));

      final devices = <NetworkDevice>[];
      int done = 0;

      // Scan par chunks pour respecter la limite de concurrence
      for (int i = 0; i < ipRange.length; i += _concurrency) {
        if (!_running) break;

        final chunk = ipRange.sublist(i, min(i + _concurrency, ipRange.length));
        final results = await Future.wait(
          chunk.map((ip) async {
            final device = await _probeHost(ip);
            done++;
            _controller.add(NetworkScanProgressEvent(done, ipRange.length));
            if (device != null) {
              _controller.add(NetworkScanDeviceFoundEvent(device));
              return device;
            }
            return null;
          }),
        );

        for (final d in results) {
          if (d != null) devices.add(d);
        }
      }

      if (_running) {
        _controller.add(NetworkScanCompletedEvent(devices));
      }
    } catch (e) {
      _controller.add(NetworkScanErrorEvent('error', e.toString()));
    } finally {
      _running = false;
    }
  }

  /// Arrête le scan.
  void stopScan() {
    _running = false;
  }

  void dispose() {
    _running = false;
    _controller.close();
  }

  // ─── Probe ──────────────────────────────────────────────────────────────────

  Future<NetworkDevice?> _probeHost(String ip) async {
    final start = DateTime.now();
    bool online = false;

    for (final port in _probePorts) {
      if (!_running) return null;
      try {
        final socket = await Socket.connect(
          ip,
          port,
          timeout: const Duration(milliseconds: _timeoutMs),
        );
        socket.destroy();
        online = true;
        break;
      } on SocketException catch (e) {
        // "Connection refused" = l'hôte existe mais le port est fermé
        final err = e.osError?.errorCode ?? 0;
        final msg = e.osError?.message ?? '';
        if (err == 111 ||
            err == 61 || // ECONNREFUSED sur macOS
            msg.toLowerCase().contains('refused')) {
          online = true;
          break;
        }
        // Timeout / hôte injoignable → essayer le port suivant
      } catch (_) {
        // Ignore
      }
    }

    if (!online) return null;

    final responseTime = DateTime.now().difference(start).inMilliseconds;

    // Résolution DNS inverse (meilleur effort, non bloquant)
    String? hostname;
    try {
      final addr = InternetAddress(ip);
      final reversed = await addr
          .reverse()
          .timeout(const Duration(milliseconds: 500), onTimeout: () => addr);
      if (reversed.host != ip && reversed.host.isNotEmpty) {
        hostname = reversed.host;
      }
    } catch (_) {}

    return NetworkDevice(
      ip: ip,
      hostname: hostname,
      mac: null, // Non accessible depuis user-space Flutter
      manufacturer: null, // Nécessite une base OUI embarquée
      responseTimeMs: responseTime,
      isOnline: true,
      discoveredAt: DateTime.now(),
    );
  }

  // ─── Calcul de plage ────────────────────────────────────────────────────────

  /// Calcule la plage d'IPs à scanner depuis une IP locale et un masque.
  /// Pour des raisons de performance, on limite à /24 (254 hôtes).
  List<String>? _computeRange(String localIp, String subnet) {
    final parts = localIp.split('.');
    if (parts.length != 4) return null;

    // /24 ou plus large → on scanne toujours le /24 de l'IP locale
    final prefix = '${parts[0]}.${parts[1]}.${parts[2]}';
    return List.generate(254, (i) => '$prefix.${i + 1}');
  }
}
