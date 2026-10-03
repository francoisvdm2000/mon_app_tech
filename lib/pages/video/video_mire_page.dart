import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import 'mire_ecran_led_page.dart';
import 'mire_ecran_video_page.dart';

const _kAccentVideo = Color(0xFF00B4D8);

class VideoMirePage extends StatelessWidget {
  const VideoMirePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // used by textTheme.titleLarge
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.videoMireTitle)),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          children: [
            Text(
              loc.videoMireHeaderTitle,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              loc.videoMireHeaderSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.60),
                height: 1.25,
              ),
            ),
            const SizedBox(height: 16),
            _TileCard(
              title: loc.videoMireScreenVideoTitle,
              subtitle: loc.videoMireScreenVideoSubtitle,
              icon: Icons.videocam,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const MireEcranVideoPage()),
              ),
            ),
            const SizedBox(height: 12),
            _TileCard(
              title: loc.videoMireScreenLedTitle,
              subtitle: loc.videoMireScreenLedSubtitle,
              icon: Icons.view_quilt,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const MireEcranLedPage()),
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          splashColor: _kAccentVideo.withValues(alpha: 0.10),
          highlightColor: _kAccentVideo.withValues(alpha: 0.04),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _kAccentVideo.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: _kAccentVideo, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.50),
                          fontSize: 12.5,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.chevron_right_rounded,
                  color: _kAccentVideo.withValues(alpha: 0.65),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
