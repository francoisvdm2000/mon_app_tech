import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'video_lens_measure_page.dart';
import 'video_brightness_page.dart';
import 'video_multiprojecteur_page.dart';
import 'video_led_page.dart';
import 'video_mire_page.dart';

class PageVideo extends StatelessWidget {
  const PageVideo({super.key});

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
            _TileCard(
              title: loc.videoLensMeasureTitle,
              subtitle: loc.videoLensMeasureSubtitle,
              icon: Icons.straighten,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const VideoLensMeasurePage()),
              ),
            ),
            const SizedBox(height: 12),
            _TileCard(
              title: loc.videoBrightnessTitle,
              subtitle: loc.videoBrightnessSubtitle,
              icon: Icons.brightness_6,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const VideoBrightnessPage()),
              ),
            ),
            const SizedBox(height: 12),
            _TileCard(
              title: loc.videoMultiprojectorTitle,
              subtitle: loc.videoMultiprojectorSubtitle,
              icon: Icons.grid_on,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => const VideoMultiprojecteurPage()),
              ),
            ),
            const SizedBox(height: 12),
            _TileCard(
              title: loc.videoLedTitle,
              subtitle: loc.videoLedSubtitle,
              icon: Icons.view_quilt,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const VideoLedPage()),
              ),
            ),
            const SizedBox(height: 12),
            _TileCard(
              title: loc.videoTestPatternTitle,
              subtitle: loc.videoTestPatternSubtitle,
              icon: Icons.image,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const VideoMirePage()),
              ),
            ),
          ],
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
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

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
              Icon(
                Icons.chevron_right,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
