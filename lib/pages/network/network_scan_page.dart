import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/network_device.dart';
import '../../services/network/network_scan_service.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);

class NetworkScanPage extends StatefulWidget {
  const NetworkScanPage({super.key});

  @override
  State<NetworkScanPage> createState() => _NetworkScanPageState();
}

class _NetworkScanPageState extends State<NetworkScanPage> {
  final _service = NetworkScanService();
  StreamSubscription<NetworkScanEvent>? _sub;

  bool _scanning = false;
  String? _localIp;
  String? _subnet;
  int _done = 0;
  int _total = 0;
  final List<NetworkDevice> _devices = [];
  String? _errorCode;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _sub = _service.events.listen(_onEvent);
  }

  @override
  void dispose() {
    _service.stopScan();
    _sub?.cancel();
    _service.dispose();
    super.dispose();
  }

  void _onEvent(NetworkScanEvent event) {
    if (!mounted) return;
    setState(() {
      switch (event) {
        case NetworkScanStartedEvent e:
          _scanning = true;
          _completed = false;
          _localIp = e.localIp;
          _subnet = e.subnet;
          _total = e.totalHosts;
          _done = 0;
          _devices.clear();
          _errorCode = null;
        case NetworkScanProgressEvent e:
          _done = e.done;
          _total = e.total;
        case NetworkScanDeviceFoundEvent e:
          _devices.add(e.device);
          // Tri par IP
          _devices.sort((a, b) => _ipToInt(a.ip) - _ipToInt(b.ip));
        case NetworkScanCompletedEvent _:
          _scanning = false;
          _completed = true;
        case NetworkScanErrorEvent e:
          _scanning = false;
          _errorCode = e.code;
      }
    });
  }

  int _ipToInt(String ip) {
    final parts = ip.split('.');
    if (parts.length != 4) return 0;
    return (int.tryParse(parts[0]) ?? 0) * 16777216 +
        (int.tryParse(parts[1]) ?? 0) * 65536 +
        (int.tryParse(parts[2]) ?? 0) * 256 +
        (int.tryParse(parts[3]) ?? 0);
  }

  Future<void> _startScan() async {
    try {
      await _service.startScan();
    } catch (e) {
      if (mounted) {
        setState(() {
          _scanning = false;
          _errorCode = 'error';
        });
      }
    }
  }

  void _stopScan() {
    _service.stopScan();
    setState(() => _scanning = false);
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
          loc.networkScanTitle,
          style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        actions: const [
          AboutPinButton(pageId: 'tool:network_scan', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16, 16, 16, 24 + MediaQuery.paddingOf(context).bottom,
        ),
        children: [
          // ── iOS avertissement ──────────────────────────────────────────────
          if (Platform.isIOS) ...[
            _InfoBanner(
              icon: Icons.info_outline_rounded,
              color: Colors.orangeAccent,
              text: loc.networkScanIosLimitation,
            ),
            const SizedBox(height: 12),
          ],

          // ── Infos réseau ───────────────────────────────────────────────────
          if (_localIp != null) ...[
            _InfoRow(loc.networkScanLocalIp, _localIp!),
            if (_subnet != null) _InfoRow(loc.networkScanSubnet, _subnet!),
            const SizedBox(height: 12),
          ],

          // ── Bouton start/stop ──────────────────────────────────────────────
          _ScanButton(
            scanning: _scanning,
            onStart: _startScan,
            onStop: _stopScan,
            loc: loc,
          ),

          // ── Progression ───────────────────────────────────────────────────
          if (_scanning && _total > 0) ...[
            const SizedBox(height: 14),
            _ScanProgress(done: _done, total: _total, loc: loc),
          ],

          // ── Erreur ────────────────────────────────────────────────────────
          if (_errorCode != null) ...[
            const SizedBox(height: 12),
            _InfoBanner(
              icon: Icons.error_outline_rounded,
              color: Colors.redAccent,
              text: _errorMessage(loc, _errorCode!),
            ),
          ],

          // ── Résultats ─────────────────────────────────────────────────────
          if (_devices.isNotEmpty) ...[
            const SizedBox(height: 16),
            _SummaryRow(count: _devices.length, loc: loc),
            const SizedBox(height: 10),
            ..._devices.map((d) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _DeviceTile(device: d, loc: loc),
                )),
          ] else if (_completed && _devices.isEmpty && _errorCode == null) ...[
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Icon(Icons.device_unknown_rounded,
                      color: Colors.white.withValues(alpha: 0.20), size: 48),
                  const SizedBox(height: 12),
                  Text(
                    loc.networkScanNoDevicesFound,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.35),
                    ),
                  ),
                ],
              ),
            ),
          ] else if (!_scanning && !_completed && _errorCode == null) ...[
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Icon(Icons.network_check_rounded,
                      color: Colors.white.withValues(alpha: 0.15), size: 48),
                  const SizedBox(height: 12),
                  Text(
                    loc.networkScanHint,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _errorMessage(AppLocalizations loc, String code) {
    switch (code) {
      case 'no_network':
        return loc.networkScanNoNetwork;
      case 'permission_denied':
        return loc.networkScanPermissionDenied;
      default:
        return loc.networkScanErrorGeneric;
    }
  }
}

// ─── Widgets ──────────────────────────────────────────────────────────────────

class _InfoBanner extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _InfoBanner({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color.withValues(alpha: 0.80), size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.60),
                  height: 1.35,
                ),
              ),
            ),
          ],
        ),
      );
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Row(
          children: [
            Text(
              '$label : ',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withValues(alpha: 0.45),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      );
}

class _ScanButton extends StatelessWidget {
  final bool scanning;
  final VoidCallback onStart;
  final VoidCallback onStop;
  final AppLocalizations loc;

  const _ScanButton({
    required this.scanning,
    required this.onStart,
    required this.onStop,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: scanning ? onStop : onStart,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 52,
        decoration: BoxDecoration(
          color: scanning
              ? Colors.redAccent.withValues(alpha: 0.08)
              : _kAccent.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: scanning
                ? Colors.redAccent.withValues(alpha: 0.40)
                : _kAccent.withValues(alpha: 0.50),
            width: 1.5,
          ),
        ),
        alignment: Alignment.center,
        child: scanning
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.redAccent.withValues(alpha: 0.70),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    loc.networkScanStopButton,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.redAccent.withValues(alpha: 0.80),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.radar_rounded, color: _kAccent, size: 22),
                  const SizedBox(width: 10),
                  Text(
                    loc.networkScanStartButton,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _kAccent,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _ScanProgress extends StatelessWidget {
  final int done;
  final int total;
  final AppLocalizations loc;
  const _ScanProgress({required this.done, required this.total, required this.loc});

  @override
  Widget build(BuildContext context) {
    final pct = total > 0 ? done / total : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.networkScanProgress(done, total),
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withValues(alpha: 0.45),
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: pct,
            backgroundColor: Colors.white.withValues(alpha: 0.08),
            valueColor: const AlwaysStoppedAnimation(_kAccent),
            minHeight: 5,
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final int count;
  final AppLocalizations loc;
  const _SummaryRow({required this.count, required this.loc});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: _kAccent.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _kAccent.withValues(alpha: 0.20)),
        ),
        child: Row(
          children: [
            const Icon(Icons.devices_rounded, color: _kAccent, size: 18),
            const SizedBox(width: 10),
            Text(
              loc.networkScanDevicesFound(count),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: _kAccent,
              ),
            ),
          ],
        ),
      );
}

class _DeviceTile extends StatelessWidget {
  final NetworkDevice device;
  final AppLocalizations loc;
  const _DeviceTile({required this.device, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: device.isOnline
                  ? Colors.greenAccent
                  : Colors.redAccent,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IP + hostname
                Row(
                  children: [
                    Text(
                      device.ip,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    if (device.hostname != null) ...[
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          device.hostname!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.45),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (device.responseTimeMs != null)
                      _Tag(
                        label: loc.networkScanResponseMs(device.responseTimeMs!),
                        color: _responseColor(device.responseTimeMs!),
                      ),
                    const SizedBox(width: 6),
                    _Tag(
                      label: loc.networkScanStatusOnline,
                      color: Colors.greenAccent,
                    ),
                    if (device.mac != null) ...[
                      const SizedBox(width: 6),
                      _Tag(label: device.mac!, color: Colors.white38),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _responseColor(int ms) {
    if (ms < 50) return Colors.greenAccent;
    if (ms < 150) return Colors.orangeAccent;
    return Colors.redAccent;
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color.withValues(alpha: 0.28)),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color),
        ),
      );
}
