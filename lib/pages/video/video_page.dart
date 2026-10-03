import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import '../shared/app_grid_tile.dart';

import 'video_lens_measure_page.dart';
import 'video_brightness_page.dart';
import 'video_multiprojecteur_page.dart';
import 'video_led_page.dart';
import 'video_mire_page.dart';
import 'video_camera_exposure_page.dart';

class PageVideo extends StatefulWidget {
  const PageVideo({super.key});
  @override
  State<PageVideo> createState() => _PageVideoState();
}

class _PageVideoState extends State<PageVideo> {
  bool _isPro = false;

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.video);
    if (!mounted) return;
    setState(() => _isPro = ok);
  }

  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    if (_isPro) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
      return;
    }
    final ok = await SubscriptionService.hasAccess(SubscriptionCategory.video);
    if (!context.mounted) return;
    if (ok) {
      setState(() => _isPro = true);
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => const SubscriptionPage(category: SubscriptionCategory.video),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSectionLabel(text: loc.videoFreeSection, color: _kAccentVideo),
              AppGridView(
                children: [
                  AppGridTile(
                    icon: Icons.straighten,
                    label: loc.videoLensMeasureTitle,
                    subtitle: loc.videoLensMeasureSubtitle,
                    accentColor: _kAccentVideo,
                    badge: loc.timecodeBadgeFree,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const VideoLensMeasurePage()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AppSectionLabel(text: loc.videoProSection, color: _kAccentVideo),
              AppGridView(
                children: [
                  AppGridTile(
                    icon: Icons.brightness_6,
                    label: loc.videoBrightnessTitle,
                    subtitle: loc.videoBrightnessSubtitle,
                    accentColor: _kAccentVideo,
                    badge: loc.pro,
                    locked: !_isPro,
                    onTap: () =>
                        _openOrSubscribe(context, const VideoBrightnessPage()),
                  ),
                  AppGridTile(
                    icon: Icons.videocam,
                    label: loc.videoCameraExposureTitle,
                    subtitle: loc.videoCameraExposureSubtitle,
                    accentColor: _kAccentVideo,
                    badge: loc.pro,
                    locked: !_isPro,
                    onTap: () => _openOrSubscribe(context, const VideoCameraExposurePage()),
                  ),
                  AppGridTile(
                    icon: Icons.grid_on,
                    label: loc.videoMultiprojectorTitle,
                    subtitle: loc.videoMultiprojectorSubtitle,
                    accentColor: _kAccentVideo,
                    badge: loc.pro,
                    locked: !_isPro,
                    onTap: () => _openOrSubscribe(context, const VideoMultiprojecteurPage()),
                  ),
                  AppGridTile(
                    icon: Icons.view_quilt,
                    label: loc.videoLedTitle,
                    subtitle: loc.videoLedSubtitle,
                    accentColor: _kAccentVideo,
                    badge: loc.pro,
                    locked: !_isPro,
                    onTap: () => _openOrSubscribe(context, const VideoLedPage()),
                  ),
                  AppGridTile(
                    icon: Icons.image,
                    label: loc.videoTestPatternTitle,
                    subtitle: loc.videoTestPatternSubtitle,
                    accentColor: _kAccentVideo,
                    badge: loc.pro,
                    locked: !_isPro,
                    onTap: () => _openOrSubscribe(context, const VideoMirePage()),
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

const _kAccentVideo = Color(0xFF00B4D8);
