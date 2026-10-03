import 'package:flutter/material.dart';

import '../../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'gdtf_reader.dart';
import 'patch_models.dart';
import 'package:mon_app_tech/app/constants.dart';

/// Panneau de détails d'une fixture patchée : toutes les infos
/// disponibles (identification, DMX, physique, électrique, environnement),
/// fusion de [PatchEntry] (MVR) et [GdtfPhysicalInfo] (GDTF).
///
/// Widget partagé entre la vue tableur et le visualiseur 3D : un seul
/// point de vérité pour "qu'est-ce qu'on affiche au clic sur une
/// fixture", quel que soit l'endroit d'où vient le clic. Chaque section
/// ne s'affiche que si elle a au moins un champ renseigné — un GDTF
/// incomplet ne doit jamais faire apparaître des champs vides.
class FixtureInfoPanel extends StatelessWidget {
  final PatchEntry entry;
  final GdtfPhysicalInfo physicalInfo;

  const FixtureInfoPanel({
    super.key,
    required this.entry,
    required this.physicalInfo,
  });

  /// Ouvre le panneau dans un bottom sheet — un seul appel depuis
  /// n'importe quelle vue (tableur, univers, 3D).
  static Future<void> show(
    BuildContext context, {
    required PatchEntry entry,
    required GdtfPhysicalInfo physicalInfo,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => FixtureInfoPanel(entry: entry, physicalInfo: physicalInfo),
    );
  }

  String get _displayId {
    final raw = entry.id;
    if (raw.startsWith('mvr:')) return raw.substring(4);
    if (raw.startsWith('mvrh:')) return raw.substring(5);
    return raw;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final p = physicalInfo;

    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF0E0E18),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                entry.fixtureName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              SectionCard(
                accentColor: kSectionLight,
                title: loc.fixtureInfoSectionIdentification,
                icon: Icons.badge_outlined,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _InfoRow(loc.fixtureInfoLabelName, entry.fixtureName),
                    _InfoRow(loc.fixtureInfoLabelId, _displayId),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              SectionCard(
                accentColor: kSectionLight,
                title: loc.fixtureInfoSectionDmx,
                icon: Icons.cable_outlined,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _InfoRow(
                      loc.fixtureInfoLabelUniverse,
                      loc.patchUniverseItem(entry.universe),
                    ),
                    _InfoRow(
                      loc.fixtureInfoLabelAddress,
                      '${entry.startAddress}–${entry.endAddress}',
                    ),
                    _InfoRow(loc.fixtureInfoLabelMode, entry.dmxModeName),
                    _InfoRow(
                      loc.fixtureInfoLabelChannelCount,
                      '${entry.channelCount}',
                    ),
                    if (entry.gdtfSpec != null && entry.gdtfSpec!.isNotEmpty)
                      _InfoRow(loc.fixtureInfoLabelGdtfSpec, entry.gdtfSpec!),
                  ],
                ),
              ),

              if (p.weightKg != null ||
                  p.approxLengthM != null ||
                  p.approxWidthM != null ||
                  p.approxHeightM != null ||
                  p.legHeightM != null) ...[
                const SizedBox(height: 12),
                SectionCard(
                  accentColor: kSectionLight,
                  title: loc.fixtureInfoSectionPhysical,
                  icon: Icons.straighten_outlined,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (p.weightKg != null)
                        _InfoRow(
                          loc.fixtureInfoLabelWeight,
                          loc.fixtureInfoValueKg(p.weightKg!.toStringAsFixed(1)),
                        ),
                      if (p.approxLengthM != null &&
                          p.approxWidthM != null &&
                          p.approxHeightM != null)
                        _InfoRow(
                          loc.fixtureInfoLabelDimensions,
                          // Ordre des paramètres généré par gen-l10n =
                          // ordre alphabétique des placeholders ARB
                          // (heightCm, lengthCm, widthCm), pas l'ordre
                          // d'apparition dans la chaîne.
                          loc.fixtureInfoValueDimensionsCm(
                            (p.approxHeightM! * 100).round(),
                            (p.approxLengthM! * 100).round(),
                            (p.approxWidthM! * 100).round(),
                          ),
                        ),
                      if (p.legHeightM != null)
                        _InfoRow(
                          loc.fixtureInfoLabelLegHeight,
                          loc.fixtureInfoValueCm((p.legHeightM! * 100).round()),
                        ),
                    ],
                  ),
                ),
              ],

              if (p.powerConsumptionWatts != null) ...[
                const SizedBox(height: 12),
                SectionCard(
                  accentColor: kSectionLight,
                  title: loc.fixtureInfoSectionElectrical,
                  icon: Icons.bolt_outlined,
                  child: _InfoRow(
                    loc.fixtureInfoLabelPower,
                    loc.fixtureInfoValueWatts(
                      p.powerConsumptionWatts!.round(),
                    ),
                  ),
                ),
              ],

              if (p.operatingTempLowC != null || p.operatingTempHighC != null) ...[
                const SizedBox(height: 12),
                SectionCard(
                  accentColor: kSectionLight,
                  title: loc.fixtureInfoSectionEnvironment,
                  icon: Icons.thermostat_outlined,
                  child: _InfoRow(
                    loc.fixtureInfoLabelOperatingTemp,
                    // Ordre alphabétique des placeholders : highC, lowC.
                    loc.fixtureInfoValueTempRange(
                      p.operatingTempHighC?.round() ?? 0,
                      p.operatingTempLowC?.round() ?? 0,
                    ),
                  ),
                ),
              ],

              if (!p.hasAnyData) ...[
                const SizedBox(height: 12),
                Text(
                  loc.fixtureInfoNoGdtfData,
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(label, style: const TextStyle(color: Colors.white54)),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
