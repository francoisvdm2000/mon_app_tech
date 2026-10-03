import 'package:multicast_dns/multicast_dns.dart';

import '../../models/network/ndi_source.dart';

/// Découverte des sources NDI via mDNS (Bonjour).
///
/// Cherche les services de type `_ndi._tcp` sur le réseau local.
/// Ne nécessite pas le SDK NDI — utilise uniquement mDNS/Bonjour.
///
/// Prérequis iOS : `_ndi._tcp` déclaré dans `NSBonjourServices` (Info.plist).
class NdiDiscoveryService {
  static const String _serviceType = '_ndi._tcp';

  NdiDiscoveryService._();

  /// Découvre les sources NDI sur le réseau local.
  ///
  /// [timeout] : durée maximale de l'opération entière (par défaut 6 secondes).
  static Future<List<NdiSource>> discover({
    Duration timeout = const Duration(seconds: 6),
  }) async {
    return Future<List<NdiSource>>(() => _doDiscover())
        .timeout(timeout, onTimeout: () => const []);
  }

  static Future<List<NdiSource>> _doDiscover() async {
    final client = MDnsClient();
    final sources = <NdiSource>[];

    try {
      await client.start();

      await for (final ptr in client.lookup<PtrResourceRecord>(
        ResourceRecordQuery.serverPointer('$_serviceType.local'),
      ).timeout(
        const Duration(seconds: 4),
        onTimeout: (sink) => sink.close(),
      )) {
        // Résolution du SRV (hostname + port)
        SrvResourceRecord? srv;
        await for (final record in client
            .lookup<SrvResourceRecord>(
              ResourceRecordQuery.service(ptr.domainName),
            )
            .timeout(
              const Duration(seconds: 2),
              onTimeout: (sink) => sink.close(),
            )) {
          srv = record;
          break;
        }

        if (srv == null) continue;

        // Résolution A (adresse IPv4)
        String resolvedIp = '';
        await for (final record in client
            .lookup<IPAddressResourceRecord>(
              ResourceRecordQuery.addressIPv4(srv.target),
            )
            .timeout(
              const Duration(seconds: 2),
              onTimeout: (sink) => sink.close(),
            )) {
          resolvedIp = record.address.address;
          break;
        }

        // Nom propre : "SOURCE NAME._ndi._tcp.local" → "SOURCE NAME"
        final rawName = ptr.domainName;
        final name = rawName.contains('.$_serviceType')
            ? rawName.substring(0, rawName.indexOf('.$_serviceType'))
            : rawName;

        // Évite les doublons (même nom)
        if (sources.any((s) => s.name == name)) continue;

        final host = srv.target.endsWith('.local')
            ? srv.target.substring(0, srv.target.length - 6)
            : srv.target;

        sources.add(NdiSource(
          name: name,
          host: host.isNotEmpty ? host : null,
          ip: resolvedIp.isNotEmpty ? resolvedIp : srv.target,
          port: srv.port,
          serviceName: rawName,
        ));
      }
    } catch (_) {
      // Découverte mDNS silencieuse : on retourne ce qu'on a trouvé
    } finally {
      client.stop();
    }

    return sources;
  }
}
