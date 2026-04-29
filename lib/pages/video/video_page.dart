import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';

import 'video_lens_measure_page.dart';
import 'video_brightness_page.dart';
import 'video_multiprojecteur_page.dart';
import 'video_led_page.dart';
import 'video_mire_page.dart';
import 'video_camera_exposure_page.dart';

class PageVideo extends StatelessWidget {
  const PageVideo({super.key});

  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    final hasAccess =
        await SubscriptionService.hasAccess(SubscriptionCategory.video);
    if (!context.mounted) return;
    if (hasAccess) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) =>
            const SubscriptionPage(category: SubscriptionCategory.video),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.videoTitle)),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          children: [
            // GRATUIT
            _TileCard(
              title: loc.videoLensMeasureTitle,
              subtitle: loc.videoLensMeasureSubtitle,
              icon: Icons.straighten,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const VideoLensMeasurePage()),
              ),
            ),

            // Séparateur
            const SizedBox(height: 8),
            _SectionLabel(text: 'Abonnement Vidéo'),
            const SizedBox(height: 8),

            // ABONNEMENT VIDÉO
            _TileCard(
              title: loc.videoBrightnessTitle,
              subtitle: loc.videoBrightnessSubtitle,
              icon: Icons.brightness_6,
              isPro: true,
              onTap: () =>
                  _openOrSubscribe(context, const VideoBrightnessPage()),
            ),
            const SizedBox(height: 12),
            _TileCard(
              title: loc.videoCameraExposureTitle,
              subtitle: loc.videoCameraExposureSubtitle,
              icon: Icons.videocam,
              isPro: true,
              onTap: () =>
                  _openOrSubscribe(context, const VideoCameraExposurePage()),
            ),
            const SizedBox(height: 12),
            _TileCard(
              title: loc.videoMultiprojectorTitle,
              subtitle: loc.videoMultiprojectorSubtitle,
              icon: Icons.grid_on,
              isPro: true,
              onTap: () =>
                  _openOrSubscribe(context, const VideoMultiprojecteurPage()),
            ),
            const SizedBox(height: 12),
            _TileCard(
              title: loc.videoLedTitle,
              subtitle: loc.videoLedSubtitle,
              icon: Icons.view_quilt,
              isPro: true,
              onTap: () => _openOrSubscribe(context, const VideoLedPage()),
            ),
            const SizedBox(height: 12),
            _TileCard(
              title: loc.videoTestPatternTitle,
              subtitle: loc.videoTestPatternSubtitle,
              icon: Icons.image,
              isPro: true,
              onTap: () => _openOrSubscribe(context, const VideoMirePage()),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _TileCard extends StatelessWidget {
  const _TileCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.isPro = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 26, color: theme.colorScheme.onSurface),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color:
                            theme.colorScheme.onSurface.withValues(alpha: 0.75),
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isPro)
                    Container(
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.amber.withValues(alpha: 0.5)),
                      ),
                      child: const Text(
                        'PRO',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  Icon(
                    Icons.chevron_right,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
