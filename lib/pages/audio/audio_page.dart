import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import '../shared/app_grid_tile.dart';
import 'audio_sub_cardioid_page.dart';
import 'audio_spl_distance_page.dart';
import 'audio_delay_distance_page.dart';
import 'audio_wavelength_page.dart';
import 'audio_amp_load_page.dart';
import 'audio_spl_sum_page.dart';
import 'audio_levels_page.dart';
import 'audio_electroacoustic_page.dart';
import 'audio_noise_dose_page.dart';
import 'audio_input_list_page.dart';
import 'audio_impedance_page.dart';
import 'audio_crossover_page.dart';
import 'audio_rt60_page.dart';
import 'audio_spl_meter_page.dart';
import 'audio_delay_time_page.dart';

const _kAccent = Color(0xFF00E5FF);

// Outils gratuits : Fréquence & Longueur d'onde, Niveaux & Câbles, Délai de Distance
// Outils Pro     : tous les autres

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});
  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  bool _isPro = false;

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.sonRf);
    if (!mounted) return;
    setState(() => _isPro = ok);
  }

  Future<void> _goToSubscription() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const SubscriptionPage(category: SubscriptionCategory.sonRf),
      ),
    );
    _checkAccess();
  }

  Widget _sectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 6),
      child: Row(
        children: [
          Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: _kAccent,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(AppLocalizations.of(context).audioHomeTitle,
            style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        // Encoches / bords arrondis (paysage) : marges latérales sûres.
        top: false,
        bottom: false,
        child: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          // ── Placement & Directivité ───────────────────────────────────────
          _sectionLabel(loc.audioSectionPlacementDirectivity),
          const SizedBox(height: 8),
          AppGridView(
            children: [
              _AudioToolTile(
                icon: Icons.speaker_group_rounded,
                title: loc.audioSubCardioidTitle,
                subtitle: loc.audioSubCardioidSubtitle,
                free: true,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AudioSubCardioidPage())),
              ),
            ],
          ),
          // ── Acoustique & Niveaux ──────────────────────────────────────────
          const SizedBox(height: 20),
          _sectionLabel(loc.audioSectionAcousticLevels),
          const SizedBox(height: 8),
          AppGridView(
            children: [
              _AudioToolTile(
                icon: Icons.social_distance_rounded,
                title: loc.audioSplDistanceTitle,
                subtitle: loc.audioSplDistanceSubtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AudioSplDistancePage()))
                    : _goToSubscription,
              ),
              _AudioToolTile(
                icon: Icons.add_chart_rounded,
                title: loc.audioSplSumTitle,
                subtitle: loc.audioSplSumSubtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const AudioSplSumPage()))
                    : _goToSubscription,
              ),
              _AudioToolTile(
                icon: Icons.speaker_rounded,
                title: loc.audioElectroacousticTitle,
                subtitle: loc.audioElectroacousticSubtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AudioElectroacousticPage()))
                    : _goToSubscription,
              ),
              _AudioToolTile(
                icon: Icons.waves_rounded,
                title: loc.audioWavelengthTitle,
                subtitle: loc.audioWavelengthSubtitle,
                free: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AudioWavelengthPage())),
              ),
              _AudioToolTile(
                icon: Icons.meeting_room_rounded,
                title: loc.audioRt60Title,
                subtitle: loc.audioRt60Subtitle,
                free: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AudioRt60Page())),
              ),
              _AudioToolTile(
                icon: Icons.mic_rounded,
                title: loc.audioSplMeterTitle,
                subtitle: loc.audioSplMeterSubtitle,
                free: true,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AudioSplMeterPage())),
              ),
            ],
          ),
          // ── Ampli & Câblage ───────────────────────────────────────────────
          const SizedBox(height: 20),
          _sectionLabel(loc.audioSectionAmpCabling),
          const SizedBox(height: 8),
          AppGridView(
            children: [
              _AudioToolTile(
                icon: Icons.electrical_services_rounded,
                title: loc.audioAmpLoadTitle,
                subtitle: loc.audioAmpLoadSubtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const AudioAmpLoadPage()))
                    : _goToSubscription,
              ),
              _AudioToolTile(
                icon: Icons.cable_rounded,
                title: loc.audioLevelsTitle,
                subtitle: loc.audioLevelsSubtitle,
                free: true,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AudioLevelsPage())),
              ),
              _AudioToolTile(
                icon: Icons.speaker_rounded,
                title: loc.audioImpedanceTitle,
                subtitle: loc.audioImpedanceSubtitle,
                free: true,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AudioImpedancePage())),
              ),
              _AudioToolTile(
                icon: Icons.graphic_eq_rounded,
                title: loc.audioCrossoverTitle,
                subtitle: loc.audioCrossoverSubtitle,
                free: true,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AudioCrossoverPage())),
              ),
            ],
          ),
          // ── Timing & Alignement ───────────────────────────────────────────
          const SizedBox(height: 20),
          _sectionLabel(loc.audioSectionTimingAlignment),
          const SizedBox(height: 8),
          AppGridView(
            children: [
              _AudioToolTile(
                icon: Icons.timer_outlined,
                title: loc.audioDelayDistanceTitle,
                subtitle: loc.audioDelayDistanceSubtitle,
                free: true,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AudioDelayDistancePage())),
              ),
              _AudioToolTile(
                icon: Icons.speed_rounded,
                title: loc.audioDelayTimeTitle,
                subtitle: loc.audioDelayTimeSubtitle,
                pro: true,
                locked: !_isPro,
                onTap: _isPro
                    ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AudioDelayTimePage()))
                    : _goToSubscription,
              ),
            ],
          ),
          // ── Sécurité auditive ─────────────────────────────────────────────
          const SizedBox(height: 20),
          _sectionLabel(loc.audioSectionSafety),
          const SizedBox(height: 8),
          AppGridView(
            children: [
              _AudioToolTile(
                icon: Icons.hearing_rounded,
                title: loc.audioNoiseDoseTitle,
                subtitle: loc.audioNoiseDoseSubtitle,
                free: true,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AudioNoiseDosePage())),
              ),
            ],
          ),
          // ── Organisation ─────────────────────────────────────────────────
          const SizedBox(height: 20),
          _sectionLabel(loc.audioSectionOrganization),
          const SizedBox(height: 8),
          AppGridView(
            children: [
              _AudioToolTile(
                icon: Icons.list_alt_rounded,
                title: loc.audioInputListTitle,
                subtitle: loc.audioInputListSubtitle,
                free: true,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AudioInputListPage())),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}

// ── Tile ──────────────────────────────────────────────────────────────────────

class _AudioToolTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool locked;
  final bool free;
  final bool pro;

  const _AudioToolTile({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.locked = false,
    this.free = false,
    this.pro = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppGridTile(
      icon: icon,
      label: title,
      subtitle: subtitle,
      accentColor: _kAccent,
      locked: locked,
      badge: free
          ? AppLocalizations.of(context).free
          : (pro ? AppLocalizations.of(context).subscriptionProShort : null),
      onTap: onTap ?? () {},
    );
  }
}
