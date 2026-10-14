import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../../services/network/multicast_helper.dart';

enum NetworkListenProtocol { manet, sacn, artnet }

/// Carte « Rien ne s'affiche ? » : explique à l'utilisateur les limites qui
/// viennent du système (iOS / Android) ou du réseau, et non de l'app.
/// Affiche aussi l'IP actuelle de l'appareil pour vérifier le sous-réseau.
class NetworkLimitsCard extends StatefulWidget {
  final NetworkListenProtocol protocol;
  final bool initiallyExpanded;

  const NetworkLimitsCard({
    super.key,
    required this.protocol,
    this.initiallyExpanded = false,
  });

  @override
  State<NetworkLimitsCard> createState() => _NetworkLimitsCardState();
}

class _NetworkLimitsCardState extends State<NetworkLimitsCard> {
  static const _kColor = Color(0xFFFFB74D);
  late bool _expanded = widget.initiallyExpanded;
  List<String>? _ips;

  @override
  void initState() {
    super.initState();
    _loadIps();
  }

  Future<void> _loadIps() async {
    final result = <String>[];
    try {
      final ifaces =
          await NetworkInterface.list(type: InternetAddressType.IPv4);
      for (final i in ifaces) {
        for (final a in i.addresses) {
          if (!a.isLoopback) result.add('${a.address} (${i.name})');
        }
      }
    } catch (_) {}
    if (mounted) setState(() => _ips = result);
  }

  List<String> _items(AppLocalizations loc) {
    final items = <String>[];
    final isIos = Platform.isIOS;

    if (widget.protocol == NetworkListenProtocol.manet) {
      items.add(loc.netLimitsManetMa3Only);
    }
    if (isIos) {
      if (!MulticastHelper.kIosMulticastEntitled) {
        items.add(loc.netLimitsIosEntitlement);
      }
      items.add(loc.netLimitsIosLocalNetwork);
    }
    if (widget.protocol == NetworkListenProtocol.artnet) {
      items.add(loc.netLimitsArtnetUnicast);
      items.add(loc.netLimitsArtnetSubnet);
    }
    items.add(loc.netLimitsSameNetwork);
    items.add(loc.netLimitsLuminexTip);
    if (Platform.isIOS || Platform.isAndroid) {
      items.add(loc.netLimitsWifiAp);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final items = _items(loc);

    return Container(
      decoration: BoxDecoration(
        color: _kColor.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _kColor.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.help_outline_rounded,
                      color: _kColor.withValues(alpha: 0.85), size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      loc.netLimitsTitle,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withValues(alpha: 0.80),
                      ),
                    ),
                  ),
                  Icon(
                    _expanded
                        ? Icons.expand_less_rounded
                        : Icons.expand_more_rounded,
                    color: Colors.white.withValues(alpha: 0.40),
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc.netLimitsIntro,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      color: Colors.white.withValues(alpha: 0.60),
                    ),
                  ),
                  const SizedBox(height: 8),
                  for (final t in items) _Bullet(text: t),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.04),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _ips == null
                          ? '…'
                          : _ips!.isEmpty
                              ? loc.netLimitsNoIp
                              : loc.netLimitsDeviceIp(_ips!.join('  ·  ')),
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'monospace',
                        color: Colors.white.withValues(alpha: 0.55),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet({required this.text});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6, right: 8),
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.45),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  height: 1.4,
                  color: Colors.white.withValues(alpha: 0.65),
                ),
              ),
            ),
          ],
        ),
      );
}
