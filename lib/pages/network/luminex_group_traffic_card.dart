import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/luminex_group.dart';

const _kAccent = Color(0xFF00E5FF);

/// Séparateur décimal selon la langue (virgule partout sauf en anglais).
String luminexDecimalSeparator(BuildContext context) =>
    Localizations.localeOf(context).languageCode == 'en' ? '.' : ',';

/// Carte « Trafic par groupe » : un VLAN par ligne, avec débit émis / reçu
/// et une barre proportionnelle au groupe le plus chargé.
class LuminexGroupTrafficCard extends StatelessWidget {
  final List<LuminexGroupTraffic> traffic;
  final AppLocalizations loc;

  const LuminexGroupTrafficCard({
    super.key,
    required this.traffic,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    final sep = luminexDecimalSeparator(context);
    final maxTotal = traffic.fold<int>(
      0,
      (m, t) => t.sentBps + t.receivedBps > m ? t.sentBps + t.receivedBps : m,
    );

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            loc.luminexGroupTrafficHint,
            style: TextStyle(
              fontSize: 11.5,
              height: 1.4,
              color: Colors.white.withValues(alpha: 0.40),
            ),
          ),
          const SizedBox(height: 6),
          for (final t in traffic)
            _GroupRow(
              traffic: t,
              maxTotal: maxTotal,
              decimalSeparator: sep,
              loc: loc,
            ),
        ],
      ),
    );
  }
}

class _GroupRow extends StatelessWidget {
  final LuminexGroupTraffic traffic;
  final int maxTotal;
  final String decimalSeparator;
  final AppLocalizations loc;

  const _GroupRow({
    required this.traffic,
    required this.maxTotal,
    required this.decimalSeparator,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    final colorValue = traffic.colorValue;
    final color = colorValue != null ? Color(colorValue) : _kAccent;
    final total = traffic.sentBps + traffic.receivedBps;
    final double ratio =
        maxTotal > 0 ? (total / maxTotal).clamp(0.0, 1.0).toDouble() : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      traffic.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'VLAN ${traffic.vid}  ·  '
                      '${loc.luminexGroupActivePorts(traffic.activePorts, traffic.totalPorts)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.5,
                        color: Colors.white.withValues(alpha: 0.40),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _Rate(
                    icon: Icons.arrow_upward_rounded,
                    label: loc.luminexTrafficSent,
                    value: formatBitRate(traffic.sentBps,
                        decimalSeparator: decimalSeparator),
                  ),
                  const SizedBox(height: 2),
                  _Rate(
                    icon: Icons.arrow_downward_rounded,
                    label: loc.luminexTrafficReceived,
                    value: formatBitRate(traffic.receivedBps,
                        decimalSeparator: decimalSeparator),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 4,
              backgroundColor: Colors.white.withValues(alpha: 0.06),
              valueColor: AlwaysStoppedAnimation<Color>(
                color.withValues(alpha: 0.85),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Rate extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _Rate({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.white.withValues(alpha: 0.35),
            ),
          ),
          const SizedBox(width: 4),
          Icon(icon, size: 11, color: Colors.white.withValues(alpha: 0.45)),
          const SizedBox(width: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.85),
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      );
}
