import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/ndi_source.dart';
import '../../services/network/ndi_discovery_service.dart';
import '../about/about_favorites.dart';

class NdiDiscoveryPage extends StatefulWidget {
  const NdiDiscoveryPage({super.key});

  @override
  State<NdiDiscoveryPage> createState() => _NdiDiscoveryPageState();
}

class _NdiDiscoveryPageState extends State<NdiDiscoveryPage> {
  static const _kAccent = Color(0xFF00BCD4); // teal NDI

  List<NdiSource> _sources = [];
  bool _discovering = false;
  bool _hasRun = false;

  Future<void> _start() async {
    if (_discovering) return;
    setState(() {
      _discovering = true;
      _sources = [];
      _hasRun = false;
    });

    try {
      final found = await NdiDiscoveryService.discover();
      if (mounted) {
        setState(() {
          _sources = found;
          _hasRun = true;
        });
      }
    } catch (_) {
      if (mounted) setState(() => _hasRun = true);
    } finally {
      if (mounted) setState(() => _discovering = false);
    }
  }

  void _stop() {
    if (!_discovering) return;
    setState(() {
      _discovering = false;
      _hasRun = true;
    });
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
        title: Text(
          loc.ndiPageTitle,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:network_ndi_discovery', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildBody(loc)),
          _buildActionBar(loc),
        ],
      ),
    );
  }

  Widget _buildBody(AppLocalizations loc) {
    if (_discovering) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(color: _kAccent),
            const SizedBox(height: 16),
            Text(loc.ndiDiscovering,
                style: const TextStyle(color: Colors.white54)),
          ],
        ),
      );
    }

    if (!_hasRun) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            loc.ndiHint,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white38, fontSize: 14),
          ),
        ),
      );
    }

    if (_sources.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search_off_rounded,
                  size: 48, color: Colors.white.withValues(alpha: 0.20)),
              const SizedBox(height: 12),
              Text(
                loc.ndiNoSources,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 12),
              Text(
                loc.ndiIosNote,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white30, fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            loc.ndiSourcesFound(_sources.length),
            style: TextStyle(
              fontSize: 13,
              color: _kAccent.withValues(alpha: 0.85),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ..._sources.map((s) => _NdiSourceCard(source: s, accent: _kAccent)),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            loc.ndiIosNote,
            style: const TextStyle(color: Colors.white30, fontSize: 11.5),
          ),
        ),
      ],
    );
  }

  Widget _buildActionBar(AppLocalizations loc) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _discovering ? null : _start,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _kAccent,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                icon: const Icon(Icons.play_arrow_rounded),
                label: Text(loc.ndiStartButton,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
              ),
            ),
            if (_discovering) ...[
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _stop,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white60,
                    side: BorderSide(color: Colors.white.withValues(alpha: 0.20)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: const Icon(Icons.stop_rounded),
                  label: Text(loc.ndiStopButton),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Card source NDI ─────────────────────────────────────────────────────────

class _NdiSourceCard extends StatelessWidget {
  final NdiSource source;
  final Color accent;

  const _NdiSourceCard({required this.source, required this.accent});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.videocam_rounded, color: accent, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  source.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _Row(
            label: loc.ndiLabelIp,
            value: source.ip,
            accent: accent,
          ),
          if (source.host != null) ...[
            const SizedBox(height: 4),
            _Row(
              label: loc.ndiLabelHost,
              value: source.host!,
              accent: accent,
            ),
          ],
          const SizedBox(height: 4),
          _Row(
            label: loc.ndiLabelPort,
            value: source.port.toString(),
            accent: accent,
          ),
          const SizedBox(height: 4),
          _Row(
            label: loc.ndiLabelService,
            value: source.serviceName,
            accent: accent,
            mono: true,
          ),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  final Color accent;
  final bool mono;

  const _Row({
    required this.label,
    required this.value,
    required this.accent,
    this.mono = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: accent.withValues(alpha: 0.70),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white70,
              fontFamily: mono ? 'monospace' : null,
            ),
          ),
        ),
      ],
    );
  }
}
