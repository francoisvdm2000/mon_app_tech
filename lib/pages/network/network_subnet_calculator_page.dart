import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);
const _kDivideOptions = [2, 4, 8, 16];

int? _parseIp(String s) {
  final parts = s.trim().split('.');
  if (parts.length != 4) return null;
  var value = 0;
  for (final p in parts) {
    final n = int.tryParse(p);
    if (n == null || n < 0 || n > 255) return null;
    value = (value << 8) | n;
  }
  return value;
}

String _ipToString(int ip) {
  final a = (ip >> 24) & 0xFF;
  final b = (ip >> 16) & 0xFF;
  final c = (ip >> 8) & 0xFF;
  final d = ip & 0xFF;
  return '$a.$b.$c.$d';
}

int _maskFromPrefix(int prefix) {
  if (prefix <= 0) return 0;
  if (prefix >= 32) return 0xFFFFFFFF;
  return (0xFFFFFFFF << (32 - prefix)) & 0xFFFFFFFF;
}

class _SubnetInfo {
  final int network;
  final int broadcast;
  final int mask;
  final int prefix;

  _SubnetInfo(this.network, this.broadcast, this.mask, this.prefix);

  int get hostCount {
    if (prefix >= 32) return 1;
    if (prefix == 31) return 2;
    final size = 1 << (32 - prefix);
    return size - 2;
  }

  int? get firstHost => hostCount > 0 && prefix < 31 ? network + 1 : network;
  int? get lastHost =>
      hostCount > 0 && prefix < 31 ? broadcast - 1 : broadcast;
}

_SubnetInfo _computeSubnet(int ip, int prefix) {
  final mask = _maskFromPrefix(prefix);
  final network = ip & mask;
  final broadcast = network | (~mask & 0xFFFFFFFF);
  return _SubnetInfo(network, broadcast, mask, prefix);
}

class NetworkSubnetCalculatorPage extends StatefulWidget {
  const NetworkSubnetCalculatorPage({super.key});

  @override
  State<NetworkSubnetCalculatorPage> createState() =>
      _NetworkSubnetCalculatorPageState();
}

class _NetworkSubnetCalculatorPageState
    extends State<NetworkSubnetCalculatorPage> {
  final _ipCtrl = TextEditingController(text: '192.168.1.0');
  double _prefix = 24;
  int? _divideInto;

  @override
  void dispose() {
    _ipCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final ip = _parseIp(_ipCtrl.text);
    final prefix = _prefix.round();
    final info = ip == null ? null : _computeSubnet(ip, prefix);

    List<_SubnetInfo>? divided;
    if (info != null && _divideInto != null) {
      final extraBits = (_divideInto! > 1)
          ? (_divideInto!.bitLength - 1)
          : 0;
      final newPrefix = prefix + extraBits;
      if (newPrefix <= 32) {
        final subnetSize = 1 << (32 - newPrefix);
        divided = List.generate(_divideInto!, (i) {
          final subNetwork = info.network + i * subnetSize;
          return _computeSubnet(subNetwork, newPrefix);
        });
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.networkSubnetTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(pageId: 'tool:network_subnet', sectionId: 'main'),
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
            // ── Adresse IP ───────────────────────────────────────────────────
            _Card(
              icon: Icons.lan_rounded,
              title: loc.networkSubnetIpLabel,
              child: TextField(
                controller: _ipCtrl,
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: loc.networkSubnetIpLabel,
                  hintText: '192.168.1.0',
                  filled: true,
                  fillColor: const Color(0xFF0E0E18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Colors.white.withValues(alpha: 0.12)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Colors.white.withValues(alpha: 0.12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: _kAccent, width: 1.5),
                  ),
                  labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
                  errorText: ip == null ? loc.networkSubnetInvalidIp : null,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // ── Masque CIDR ──────────────────────────────────────────────────
            _Card(
              icon: Icons.linear_scale_rounded,
              title: loc.networkSubnetPrefixLabel,
              child: Column(
                children: [
                  Text(
                    '/$prefix',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: _kAccent,
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: _kAccent,
                      thumbColor: _kAccent,
                      inactiveTrackColor: Colors.white.withValues(alpha: 0.12),
                    ),
                    child: Slider(
                      value: _prefix,
                      min: 0,
                      max: 32,
                      divisions: 32,
                      onChanged: (v) => setState(() => _prefix = v),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            if (info != null) ...[
              // ── Résultats ────────────────────────────────────────────────
              _Card(
                icon: Icons.calculate_outlined,
                title: loc.networkSubnetNetworkLabel,
                child: Column(
                  children: [
                    _InfoRow(
                        label: loc.networkSubnetNetworkLabel,
                        value: _ipToString(info.network)),
                    _InfoRow(
                        label: loc.networkSubnetBroadcastLabel,
                        value: _ipToString(info.broadcast)),
                    _InfoRow(
                        label: loc.networkSubnetNetmaskLabel,
                        value: _ipToString(info.mask)),
                    _InfoRow(
                        label: loc.networkSubnetWildcardLabel,
                        value: _ipToString(~info.mask & 0xFFFFFFFF)),
                    _InfoRow(
                        label: loc.networkSubnetFirstHostLabel,
                        value: _ipToString(info.firstHost ?? info.network)),
                    _InfoRow(
                        label: loc.networkSubnetLastHostLabel,
                        value: _ipToString(info.lastHost ?? info.broadcast)),
                    _InfoRow(
                        label: loc.networkSubnetHostCountLabel,
                        value: '${info.hostCount}',
                        isLast: true),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // ── Diviser en sous-réseaux ──────────────────────────────────
              _Card(
                icon: Icons.call_split_rounded,
                title: loc.networkSubnetDivideTitle,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(loc.networkSubnetDivideNote,
                        style: TextStyle(
                            fontSize: 12.5,
                            color: Colors.white.withValues(alpha: 0.50))),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _kDivideOptions.map((n) {
                        final sel = _divideInto == n;
                        final disabled = prefix + (n.bitLength - 1) > 32;
                        return GestureDetector(
                          onTap: disabled
                              ? null
                              : () => setState(
                                  () => _divideInto = sel ? null : n),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 140),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 9),
                            decoration: BoxDecoration(
                              color: sel
                                  ? _kAccent.withValues(alpha: 0.16)
                                  : const Color(0xFF0E0E18),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: sel
                                    ? _kAccent
                                    : Colors.white
                                        .withValues(alpha: disabled ? 0.05 : 0.12),
                                width: sel ? 1.5 : 1,
                              ),
                            ),
                            child: Text(
                              '× $n',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: disabled
                                    ? Colors.white24
                                    : (sel ? _kAccent : Colors.white60),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    if (divided != null) ...[
                      const SizedBox(height: 12),
                      for (var i = 0; i < divided.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0E0E18),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.07)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${_ipToString(divided[i].network)}/${divided[i].prefix}',
                                    style: TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Colors.white.withValues(alpha: 0.85)),
                                  ),
                                ),
                                Text(
                                  '${divided[i].hostCount} hosts',
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      color: _kAccent.withValues(alpha: 0.80)),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;
  const _InfoRow(
      {required this.label, required this.value, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 8),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(
                    fontSize: 12.5, color: Colors.white.withValues(alpha: 0.55))),
          ),
          Text(value,
              style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: _kAccent)),
        ],
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
