import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);

// Seuils réglementaires "lieux de diffusion sonore" (décret spectacles
// n°2017-1244) réutilisés pour le code couleur du niveau live — mêmes
// valeurs que dans audio_noise_dose_page.dart.
const double _kVai = 80; // Valeur d'action inférieure
const double _kVas = 85; // Valeur d'action supérieure
const double _kVle = 87; // Valeur limite d'exposition

/// Sonomètre indicatif basé sur le microphone du téléphone.
///
/// Outil pratique et non calibré : le micro d'un smartphone n'est pas un
/// sonomètre certifié (norme IEC 61672), la valeur affichée donne un ordre
/// de grandeur utile en régie mais ne remplace pas une mesure réglementaire.
class AudioSplMeterPage extends StatefulWidget {
  const AudioSplMeterPage({super.key});

  @override
  State<AudioSplMeterPage> createState() => _AudioSplMeterPageState();
}

class _AudioSplMeterPageState extends State<AudioSplMeterPage> {
  NoiseMeter? _noiseMeter;
  StreamSubscription<NoiseReading>? _subscription;

  bool _isListening = false;
  double? _currentDb;
  double _minDb = 0;
  double _maxDb = 0;
  double _sumDb = 0;
  int _sampleCount = 0;

  PermissionStatus? _micPermission;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _refreshPermissionStatus();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> _refreshPermissionStatus() async {
    final status = await Permission.microphone.status;
    if (!mounted) return;
    setState(() => _micPermission = status);
  }

  void _resetStats() {
    _currentDb = null;
    _minDb = 0;
    _maxDb = 0;
    _sumDb = 0;
    _sampleCount = 0;
  }

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _stop();
      return;
    }

    var status = _micPermission ?? await Permission.microphone.status;
    if (!status.isGranted) {
      status = await Permission.microphone.request();
      if (!mounted) return;
      setState(() => _micPermission = status);
    }
    if (!status.isGranted) return;

    setState(() {
      _errorMessage = null;
      _resetStats();
    });

    try {
      _noiseMeter = NoiseMeter();
      _subscription = _noiseMeter!.noise.listen(_onReading, onError: (Object e) {
        if (!mounted) return;
        setState(() {
          _errorMessage = e.toString();
          _isListening = false;
        });
        _subscription?.cancel();
      });
      setState(() => _isListening = true);
    } catch (e) {
      setState(() => _errorMessage = e.toString());
    }
  }

  Future<void> _stop() async {
    await _subscription?.cancel();
    _subscription = null;
    if (!mounted) return;
    setState(() => _isListening = false);
  }

  void _onReading(NoiseReading reading) {
    final db = reading.meanDecibel;
    if (!db.isFinite) return;
    if (!mounted) return;
    setState(() {
      _currentDb = db;
      if (_sampleCount == 0 || db < _minDb) _minDb = db;
      if (_sampleCount == 0 || db > _maxDb) _maxDb = db;
      _sumDb += db;
      _sampleCount++;
    });
  }

  Color _levelColor(double db) {
    if (db >= _kVle) return const Color(0xFFFF5252);
    if (db >= _kVas) return const Color(0xFFFFB300);
    if (db >= _kVai) return const Color(0xFFFFD54F);
    return const Color(0xFF00E676);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final permanentlyDenied = _micPermission == PermissionStatus.permanentlyDenied;
    final denied = _micPermission == PermissionStatus.denied;
    final avgDb = _sampleCount > 0 ? _sumDb / _sampleCount : null;
    final liveColor = _currentDb != null ? _levelColor(_currentDb!) : _kAccent;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.audioSplMeterTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:audio_spl_meter', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + bottom),
          children: [
            if (permanentlyDenied || (denied && !_isListening && _currentDb == null))
              _Card(
                icon: Icons.mic_off_rounded,
                title: loc.audioSplMeterPermissionTitle,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      loc.audioSplMeterPermissionBody,
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withValues(alpha: 0.65),
                          height: 1.4),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (permanentlyDenied) {
                          openAppSettings();
                        } else {
                          _toggleListening();
                        }
                      },
                      icon: Icon(permanentlyDenied
                          ? Icons.settings_rounded
                          : Icons.mic_rounded),
                      label: Text(permanentlyDenied
                          ? loc.audioSplMeterOpenSettings
                          : loc.audioSplMeterAllowMic),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _kAccent.withValues(alpha: 0.16),
                        foregroundColor: _kAccent,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              // ── Niveau live ──────────────────────────────────────────────
              _Card(
                icon: Icons.mic_rounded,
                title: loc.audioSplMeterLiveTitle,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _toggleListening,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 22),
                        decoration: BoxDecoration(
                          color: liveColor.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: liveColor.withValues(alpha: 0.45),
                              width: 1.5),
                        ),
                        child: Column(
                          children: [
                            Text(
                              _currentDb != null
                                  ? '${_currentDb!.toStringAsFixed(1)} dB'
                                  : '—',
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: liveColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Icon(
                              _isListening
                                  ? Icons.stop_circle_rounded
                                  : Icons.play_circle_fill_rounded,
                              color: liveColor.withValues(alpha: 0.85),
                              size: 34,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _isListening
                                  ? loc.audioSplMeterStopHint
                                  : loc.audioSplMeterStartHint,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: liveColor.withValues(alpha: 0.75),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_errorMessage != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        _errorMessage!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 11.5, color: Color(0xFFFF8A80)),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // ── Statistiques de session ─────────────────────────────────
              _Card(
                icon: Icons.bar_chart_rounded,
                title: loc.audioSplMeterStatsTitle,
                child: (_sampleCount == 0)
                    ? _EmptyState(message: loc.audioSplMeterStatsEmpty)
                    : Column(
                        children: [
                          _InfoRow(
                              label: loc.audioSplMeterMinLabel,
                              value: '${_minDb.toStringAsFixed(1)} dB'),
                          _InfoRow(
                              label: loc.audioSplMeterAvgLabel,
                              value: '${avgDb!.toStringAsFixed(1)} dB'),
                          _InfoRow(
                              label: loc.audioSplMeterMaxLabel,
                              value: '${_maxDb.toStringAsFixed(1)} dB'),
                        ],
                      ),
              ),
              const SizedBox(height: 14),

              // ── Repères ──────────────────────────────────────────────────
              _Card(
                icon: Icons.bookmark_border_rounded,
                title: loc.audioSplMeterReferenceTitle,
                child: Column(
                  children: [
                    _RefRow(label: loc.audioSplMeterRefQuiet, value: '30–40 dB'),
                    _RefRow(
                        label: loc.audioSplMeterRefConversation,
                        value: '55–65 dB'),
                    _RefRow(label: loc.audioSplMeterRefTraffic, value: '70–80 dB'),
                    _RefRow(label: loc.audioSplMeterRefConcert, value: '95–110 dB'),
                    _RefRow(label: loc.audioSplMeterRefPain, value: '120+ dB'),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 14),
            Text(
              loc.audioSplMeterDisclaimer,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.28),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 12.5, color: Colors.white.withValues(alpha: 0.55))),
          ),
          Text(value,
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withValues(alpha: 0.80))),
        ],
      ),
    );
  }
}

class _RefRow extends StatelessWidget {
  final String label;
  final String value;
  const _RefRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF0E0E18),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(label,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.70))),
            ),
            Text(value,
                style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: _kAccent.withValues(alpha: 0.85))),
          ],
        ),
      ),
    );
  }
}

// ─── Widgets partagés (locaux à cette page) ────────────────────────────────
class _Card extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _Card({required this.icon, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(children: [
            Icon(icon, color: Colors.white70, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.1)),
            ),
          ]),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded,
              color: Colors.white.withValues(alpha: 0.30), size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(message,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.40), fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
