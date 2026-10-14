import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:network_info_plus/network_info_plus.dart';

import '../../services/network/ping_service.dart';
import '../about/about_favorites.dart';
import 'ping_page.dart';

const _kAccent = Color(0xFF00E5FF);
const _kBg = Color(0xFF0D0D14);
const _kCard = Color(0xFF161622);
const _kField = Color(0xFF0E0E18);
const _kGood = Color(0xFF00E676);
const _kWarn = Color(0xFFFFB74D);

// ─── Outils IPv4 ─────────────────────────────────────────────────────────────

int? _parseIp(String s) {
  final parts = s.trim().split('.');
  if (parts.length != 4) return null;
  var v = 0;
  for (final p in parts) {
    final n = int.tryParse(p);
    if (n == null || n < 0 || n > 255) return null;
    v = (v << 8) | n;
  }
  return v;
}

String _ipStr(int v) =>
    '${(v >> 24) & 255}.${(v >> 16) & 255}.${(v >> 8) & 255}.${v & 255}';

int _maskOf(int prefix) =>
    prefix <= 0 ? 0 : (0xFFFFFFFF << (32 - prefix)) & 0xFFFFFFFF;

int? _prefixOfMask(String? mask) {
  final m = mask == null ? null : _parseIp(mask);
  if (m == null) return null;
  var p = 0;
  while (p < 32 && (m & (1 << (31 - p))) != 0) {
    p++;
  }
  return _maskOf(p) == m ? p : null;
}

/// Préfixe « naturel » d'un réseau show : 2.x / 10.x → /8, 172.16-31 → /16,
/// sinon /24.
int _guessPrefix(int ip) {
  final a = (ip >> 24) & 255, b = (ip >> 16) & 255;
  if (a == 2 || a == 10) return 8;
  if (a == 172 && b >= 16 && b <= 31) return 16;
  return 24;
}

/// Page « Mon IP » (gratuite) : IP actuelle du téléphone + assistant
/// pour configurer une IP fixe dans la plage d'un réseau show.
class MyIpPage extends StatefulWidget {
  const MyIpPage({super.key});

  @override
  State<MyIpPage> createState() => _MyIpPageState();
}

class _MyIpPageState extends State<MyIpPage> {
  String? _wifiIp, _wifiMask, _gateway;
  List<(String, String)> _ifaces = [];
  bool _loading = true;

  final _targetCtrl = TextEditingController();
  int _prefix = 24;
  bool _prefixTouched = false;

  bool _searching = false;
  int? _suggested;
  bool _noFree = false;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  void dispose() {
    _targetCtrl.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    setState(() => _loading = true);
    final info = NetworkInfo();
    String? ip, mask, gw;
    try {
      ip = await info.getWifiIP();
      mask = await info.getWifiSubmask();
      gw = await info.getWifiGatewayIP();
    } catch (_) {}
    final ifaces = <(String, String)>[];
    try {
      for (final i in await NetworkInterface.list(type: InternetAddressType.IPv4)) {
        for (final a in i.addresses) {
          if (!a.isLoopback) ifaces.add((i.name, a.address));
        }
      }
    } catch (_) {}
    if (!mounted) return;
    setState(() {
      _wifiIp = (ip == null || ip.isEmpty) ? null : ip;
      _wifiMask = (mask == null || mask.isEmpty) ? null : mask;
      _gateway = (gw == null || gw.isEmpty || gw == '0.0.0.0') ? null : gw;
      _ifaces = ifaces;
      _loading = false;
    });
  }

  void _onTargetChanged(String s) {
    final ip = _parseIp(s);
    setState(() {
      _suggested = null;
      _noFree = false;
      if (ip != null && !_prefixTouched) _prefix = _guessPrefix(ip);
    });
  }

  /// Cherche une IP qui ne répond pas au ping dans la plage de la cible :
  /// d'abord .200 → .250 dans le même /24, puis quelques autres.
  Future<void> _findFree() async {
    final target = _parseIp(_targetCtrl.text);
    if (target == null) return;
    FocusScope.of(context).unfocus();
    setState(() {
      _searching = true;
      _suggested = null;
      _noFree = false;
    });

    final mask = _maskOf(_prefix);
    final net = target & mask;
    final bcast = net | (~mask & 0xFFFFFFFF);
    final base24 = target & 0xFFFFFF00;
    final candidates = <int>[
      for (var h = 200; h <= 250; h += 7) base24 | h,
      for (var h = 150; h < 200; h += 11) base24 | h,
    ].where((c) => c > net && c < bcast && c != target).toList();

    int? found;
    for (final c in candidates) {
      if (!mounted) return;
      final ms = await PingService.pingOnce(_ipStr(c),
          timeout: const Duration(milliseconds: 600));
      if (ms == null) {
        found = c;
        break;
      }
    }
    if (!mounted) return;
    setState(() {
      _searching = false;
      _suggested = found;
      _noFree = found == null;
    });
    if (found != null) HapticFeedback.mediumImpact();
  }

  Future<void> _openWifiSettings() async {
    try {
      await const MethodChannel('eu.openwhite/system').invokeMethod('openWifiSettings');
    } catch (_) {}
  }

  void _copy(String value) {
    Clipboard.setData(ClipboardData(text: value));
    HapticFeedback.selectionClick();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${AppLocalizations.of(context).myIpCopied} : $value'),
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ));
  }

  // ─── UI ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.myIpTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: [
          IconButton(
            tooltip: loc.myIpRefresh,
            icon: const Icon(Icons.refresh_rounded),
            onPressed: _refresh,
          ),
          const AboutPinButton(pageId: 'tool:network_my_ip', sectionId: 'main'),
          const SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + bottom),
          children: [
            _buildCurrent(loc),
            const SizedBox(height: 14),
            _buildLimitNote(loc),
            const SizedBox(height: 14),
            _buildAssistant(loc),
            if (_suggested != null) ...[
              const SizedBox(height: 14),
              _buildValues(loc),
            ],
            const SizedBox(height: 14),
            _buildSteps(loc),
          ],
        ),
      ),
    );
  }

  Widget _card({required Widget child, Color? border}) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: border ?? Colors.white.withValues(alpha: 0.06)),
        ),
        child: child,
      );

  Widget _title(IconData icon, String text, {Color color = _kAccent}) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white)),
          ),
        ]),
      );

  Widget _buildCurrent(AppLocalizations loc) {
    final targetIp = _parseIp(_targetCtrl.text);
    final myIp = _parseIp(_wifiIp ?? '');
    bool? sameRange;
    if (targetIp != null && myIp != null) {
      final m = _maskOf(_prefix);
      sameRange = (targetIp & m) == (myIp & m);
    }

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_kAccent.withValues(alpha: 0.16), _kCard],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _kAccent.withValues(alpha: 0.25)),
      ),
      child: _loading
          ? const Center(
              child: Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(color: _kAccent, strokeWidth: 2),
            ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(loc.myIpCurrentTitle.toUpperCase(),
                    style: TextStyle(
                        fontSize: 10,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w800,
                        color: _kAccent.withValues(alpha: 0.9))),
                const SizedBox(height: 6),
                GestureDetector(
                  onLongPress: _wifiIp == null ? null : () => _copy(_wifiIp!),
                  child: Text(
                    _wifiIp ?? loc.myIpNotConnected,
                    style: TextStyle(
                      fontSize: _wifiIp == null ? 18 : 32,
                      fontWeight: FontWeight.w900,
                      fontFamily: _wifiIp == null ? null : 'monospace',
                      color: Colors.white,
                    ),
                  ),
                ),
                if (_wifiIp != null) ...[
                  const SizedBox(height: 10),
                  Wrap(spacing: 18, runSpacing: 8, children: [
                    _kv(loc.myIpMask,
                        _wifiMask == null
                            ? '—'
                            : '$_wifiMask  (/${_prefixOfMask(_wifiMask) ?? '?'})'),
                    _kv(loc.myIpGateway, _gateway ?? '—'),
                  ]),
                ],
                if (sameRange != null) ...[
                  const SizedBox(height: 12),
                  Row(children: [
                    Icon(sameRange ? Icons.check_circle_rounded : Icons.error_outline_rounded,
                        size: 18, color: sameRange ? _kGood : _kWarn),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(sameRange ? loc.myIpSameRange : loc.myIpOtherRange,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: sameRange ? _kGood : _kWarn)),
                    ),
                  ]),
                ],
                if (_ifaces.length > 1) ...[
                  const SizedBox(height: 12),
                  Text(loc.myIpInterfaces,
                      style: TextStyle(
                          fontSize: 11, color: Colors.white.withValues(alpha: 0.4))),
                  const SizedBox(height: 4),
                  for (final (name, addr) in _ifaces)
                    Text('$addr  ·  $name',
                        style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: Colors.white.withValues(alpha: 0.6))),
                ],
              ],
            ),
    );
  }

  Widget _kv(String k, String v) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(k,
              style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.4))),
          Text(v,
              style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13.5,
                  color: Colors.white.withValues(alpha: 0.85))),
        ],
      );

  Widget _buildLimitNote(AppLocalizations loc) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _kWarn.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: _kWarn.withValues(alpha: 0.25)),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.lock_outline_rounded, size: 18, color: _kWarn.withValues(alpha: 0.85)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(loc.myIpSystemLimit,
                style: TextStyle(
                    fontSize: 12,
                    height: 1.4,
                    color: Colors.white.withValues(alpha: 0.65))),
          ),
        ]),
      );

  Widget _buildAssistant(AppLocalizations loc) {
    final target = _parseIp(_targetCtrl.text);
    return _card(
      border: _kAccent.withValues(alpha: 0.12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Icons.auto_fix_high_rounded, loc.myIpAssistantTitle),
          TextField(
            controller: _targetCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: _onTargetChanged,
            style: const TextStyle(
                color: Colors.white, fontFamily: 'monospace', fontSize: 17),
            decoration: InputDecoration(
              labelText: loc.myIpTargetLabel,
              hintText: '192.168.201.3',
              filled: true,
              fillColor: _kField,
              labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
              errorText: _targetCtrl.text.isNotEmpty && target == null
                  ? loc.networkSubnetInvalidIp
                  : null,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: _kAccent, width: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(loc.myIpMaskLabel,
              style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.5))),
          const SizedBox(height: 6),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final p in const [8, 16, 24])
              ChoiceChip(
                label: Text('${_ipStr(_maskOf(p))}  /$p',
                    style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
                selected: _prefix == p,
                selectedColor: _kAccent,
                backgroundColor: Colors.white.withValues(alpha: 0.05),
                side: BorderSide(color: Colors.white.withValues(alpha: 0.10)),
                labelStyle: TextStyle(
                    color: _prefix == p ? _kBg : Colors.white.withValues(alpha: 0.75),
                    fontWeight: FontWeight.w700),
                showCheckmark: false,
                onSelected: (_) => setState(() {
                  _prefix = p;
                  _prefixTouched = true;
                  _suggested = null;
                }),
              ),
          ]),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: FilledButton.icon(
              onPressed: target == null || _searching ? null : _findFree,
              icon: _searching
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2, color: _kBg))
                  : const Icon(Icons.search_rounded),
              label: Text(_searching ? loc.myIpSearching : loc.myIpFindFree,
                  style: const TextStyle(fontWeight: FontWeight.w800)),
              style: FilledButton.styleFrom(
                backgroundColor: _kAccent,
                foregroundColor: _kBg,
                disabledBackgroundColor: _kAccent.withValues(alpha: 0.25),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          if (target != null) ...[
            const SizedBox(height: 8),
            Center(
              child: TextButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PingPage(initialHost: _ipStr(target))),
                ),
                icon: const Icon(Icons.network_ping, size: 18),
                label: Text(loc.myIpPingTarget),
                style: TextButton.styleFrom(foregroundColor: _kAccent),
              ),
            ),
          ],
          if (_noFree) ...[
            const SizedBox(height: 8),
            Text(loc.myIpNoFree,
                style: const TextStyle(fontSize: 12.5, color: _kWarn)),
          ],
        ],
      ),
    );
  }

  Widget _buildValues(AppLocalizations loc) {
    final ip = _ipStr(_suggested!);
    final mask = _ipStr(_maskOf(_prefix));
    final net = _suggested! & _maskOf(_prefix);
    final routerFallback = _ipStr(net + 1);

    Widget row(String label, String value, {String? hint, bool copy = true}) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 11.5, color: Colors.white.withValues(alpha: 0.45))),
                const SizedBox(height: 2),
                Text(value,
                    style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
                if (hint != null)
                  Text(hint,
                      style: TextStyle(
                          fontSize: 11, color: Colors.white.withValues(alpha: 0.38))),
              ]),
            ),
            if (copy)
              IconButton(
                onPressed: () => _copy(value),
                icon: const Icon(Icons.copy_rounded, size: 18),
                color: _kAccent,
                tooltip: loc.myIpCopied,
              ),
          ]),
        );

    return _card(
      border: _kGood.withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Icons.task_alt_rounded, loc.myIpValuesTitle, color: _kGood),
          row(loc.myIpValueIp, ip),
          row(Platform.isAndroid ? loc.myIpValuePrefix : loc.myIpValueMask,
              Platform.isAndroid ? '$_prefix' : mask,
              hint: Platform.isAndroid ? mask : '/$_prefix'),
          row(loc.myIpValueRouter, loc.myIpRouterEmpty,
              hint: loc.myIpRouterHint(routerFallback), copy: false),
          const SizedBox(height: 6),
          Text(loc.myIpFreeNote,
              style: TextStyle(
                  fontSize: 11.5, height: 1.4, color: Colors.white.withValues(alpha: 0.4))),
          if (Platform.isAndroid) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _openWifiSettings,
                icon: const Icon(Icons.wifi_rounded),
                label: Text(loc.myIpOpenWifi),
                style: OutlinedButton.styleFrom(
                  foregroundColor: _kAccent,
                  side: const BorderSide(color: _kAccent),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSteps(AppLocalizations loc) {
    final steps = (Platform.isIOS ? loc.myIpStepsIos : loc.myIpStepsAndroid)
        .split('\n')
        .where((s) => s.trim().isNotEmpty)
        .toList();
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(Icons.checklist_rounded, loc.myIpStepsTitle),
          for (var i = 0; i < steps.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 22,
                  height: 22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _kAccent.withValues(alpha: 0.14),
                    shape: BoxShape.circle,
                  ),
                  child: Text('${i + 1}',
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w800, color: _kAccent)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(steps[i],
                        style: TextStyle(
                            fontSize: 13,
                            height: 1.35,
                            color: Colors.white.withValues(alpha: 0.75))),
                  ),
                ),
              ]),
            ),
          const SizedBox(height: 4),
          Text(loc.myIpBackToDhcp,
              style: TextStyle(
                  fontSize: 11.5, height: 1.4, color: Colors.white.withValues(alpha: 0.4))),
        ],
      ),
    );
  }
}
