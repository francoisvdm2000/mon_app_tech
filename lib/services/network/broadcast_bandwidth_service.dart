import 'dart:async';
import 'dart:io';

import '../../models/network/bandwidth_snapshot.dart';

/// Écoute passive sur les ports UDP broadcast/multicast connus.
/// Compte les bytes et paquets reçus par protocole, émet un
/// [BandwidthSnapshot] toutes les secondes.
///
/// ⚠️  Limite iOS : seul le trafic broadcast/multicast adressé
/// à cet appareil est visible. Le trafic unicast (NDI, Dante…)
/// entre deux autres équipements ne passe pas par ce socket.
class BroadcastBandwidthService {
  /// Protocoles surveillés avec leur port UDP.
  static const protocols = <String, int>{
    'Art-Net': 6454,
    'sACN': 5568,
    'MA-Net': 6549,
  };

  final _controller = StreamController<BandwidthSnapshot>.broadcast();
  Stream<BandwidthSnapshot> get stream => _controller.stream;

  final Map<String, int> _bytesAcc = {};
  final Map<String, int> _pktsAcc = {};
  final List<RawDatagramSocket> _sockets = [];
  Timer? _ticker;
  bool _running = false;

  Future<void> start() async {
    if (_running) return;
    _running = true;

    for (final entry in protocols.entries) {
      try {
        final socket = await RawDatagramSocket.bind(
          InternetAddress.anyIPv4,
          entry.value,
          reuseAddress: true,
          reusePort: true,
        );
        socket.broadcastEnabled = true;
        socket.listen((event) {
          if (event == RawSocketEvent.read) {
            final dg = socket.receive();
            if (dg != null) {
              _bytesAcc[entry.key] =
                  (_bytesAcc[entry.key] ?? 0) + dg.data.length;
              _pktsAcc[entry.key] = (_pktsAcc[entry.key] ?? 0) + 1;
            }
          }
        });
        _sockets.add(socket);
      } catch (_) {
        // Port déjà utilisé par un autre service (ex. MaNetService).
        // Le service continue sans ce protocole.
      }
    }

    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_controller.isClosed) return;
      _controller.add(BandwidthSnapshot(
        timestamp: DateTime.now(),
        bytesPerSec: Map.unmodifiable(Map.from(_bytesAcc)),
        pktsPerSec: Map.unmodifiable(Map.from(_pktsAcc)),
      ));
      _bytesAcc.clear();
      _pktsAcc.clear();
    });
  }

  void dispose() {
    _running = false;
    _ticker?.cancel();
    _ticker = null;
    for (final s in _sockets) {
      s.close();
    }
    _sockets.clear();
    if (!_controller.isClosed) _controller.close();
  }
}
