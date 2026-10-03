import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../models/network/snmp_port_stat.dart';
import '../../services/network/snmp_service.dart';
import '../about/about_favorites.dart';

const _kBg     = Color(0xFF0D0D14);
const _kCard   = Color(0xFF161622);
const _kAccent = Color(0xFF00E5FF);

class SnmpPortsPage extends StatefulWidget {
  const SnmpPortsPage({super.key});

  @override
  State<SnmpPortsPage> createState() => _SnmpPortsPageState();
}

class _SnmpPortsPageState extends State<SnmpPortsPage> {
  final _hostCtrl      = TextEditingController(text: '');
  final _communityCtrl = TextEditingController(text: 'public');
  late final SnmpService _snmp;

  List<SnmpPortStat> _ports = [];
  bool _connected = false;
  bool _connecting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _snmp = SnmpService();
  }

  @override
  void dispose() {
    _snmp.dispose();
    _hostCtrl.dispose();
    _communityCtrl.dispose();
    super.dispose();
  }

  void _connect() {
    final host      = _hostCtrl.text.trim();
    final community = _communityCtrl.text.trim();
    if (host.isEmpty) return;

    setState(() {
      _connecting = true;
      _connected  = false;
      _error      = null;
      _ports      = [];
    });

    _snmp.monitor(host, community).listen(
      (ports) {
        if (!mounted) return;
        setState(() {
          _ports     = ports;
          _connected = true;
          _connecting = false;
        });
      },
      onError: (e) {
        if (!mounted) return;
        setState(() {
          _error      = e.toString();
          _connecting = false;
          _connected  = false;
        });
      },
    );
  }

  void _disconnect() {
    _snmp.dispose();
    setState(() {
      _connected  = false;
      _connecting = false;
      _ports      = [];
      _error      = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.bwSnmpPageTitle,
            style: const TextStyle(fontWeight: FontWeight.w800)),
        actions: const [
          AboutPinButton(pageId: 'tool:network_snmp_ports', sectionId: 'main'),
          SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            16, 12, 16, 24 + MediaQuery.paddingOf(context).bottom),
        children: [
          // ── Config SNMP ───────────────────────────────────────────────────
          _ConfigCard(
            hostCtrl: _hostCtrl,
            communityCtrl: _communityCtrl,
            connected: _connected,
            connecting: _connecting,
            onConnect: _connect,
            onDisconnect: _disconnect,
            loc: loc,
          ),

          // ── Erreur ────────────────────────────────────────────────────────
          if (_error != null) ...[
            const SizedBox(height: 12),
            _ErrorBanner(message: _error!, loc: loc),
          ],

          // ── En attente ────────────────────────────────────────────────────
          if (_connecting && _ports.isEmpty) ...[
            const SizedBox(height: 40),
            const Center(
                child: CircularProgressIndicator(color: _kAccent, strokeWidth: 2)),
            const SizedBox(height: 16),
            Center(
              child: Text(
                loc.bwSnmpConnecting,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.45), fontSize: 14),
              ),
            ),
          ],

          // ── Prérequis (non connecté, pas d'erreur) ────────────────────────
          if (!_connected && !_connecting && _error == null) ...[
            const SizedBox(height: 16),
            _RequirementsCard(loc: loc),
          ],

          // ── Liste des ports ────────────────────────────────────────────────
          if (_ports.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              loc.bwSnmpPortCount(_ports.length),
              style: TextStyle(
                  color: _kAccent.withValues(alpha: 0.80),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ..._ports.map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _PortCard(port: p, loc: loc),
                )),
          ],
        ],
      ),
    );
  }
}

// ─── Carte de configuration SNMP ─────────────────────────────────────────────

class _ConfigCard extends StatelessWidget {
  final TextEditingController hostCtrl;
  final TextEditingController communityCtrl;
  final bool connected;
  final bool connecting;
  final VoidCallback onConnect;
  final VoidCallback onDisconnect;
  final AppLocalizations loc;

  const _ConfigCard({
    required this.hostCtrl,
    required this.communityCtrl,
    required this.connected,
    required this.connecting,
    required this.onConnect,
    required this.onDisconnect,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _kCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: connected
                ? _kAccent.withValues(alpha: 0.25)
                : Colors.white.withValues(alpha: 0.07),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.bwSnmpConfigTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _Field(
                    ctrl: hostCtrl,
                    label: loc.bwSnmpHost,
                    hint: loc.bwSnmpHostHint,
                    keyboard: TextInputType.url,
                    enabled: !connected && !connecting,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: _Field(
                    ctrl: communityCtrl,
                    label: loc.bwSnmpCommunity,
                    hint: loc.bwSnmpCommunityHint,
                    enabled: !connected && !connecting,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    connecting ? null : (connected ? onDisconnect : onConnect),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      connected ? Colors.red.shade800 : _kAccent,
                  foregroundColor: connected ? Colors.white : Colors.black87,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  connected
                      ? loc.bwSnmpDisconnect
                      : connecting
                          ? loc.bwSnmpConnecting
                          : loc.bwSnmpConnect,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      );
}

class _Field extends StatelessWidget {
  final TextEditingController ctrl;
  final String label;
  final String hint;
  final TextInputType keyboard;
  final bool enabled;

  const _Field({
    required this.ctrl,
    required this.label,
    required this.hint,
    this.keyboard = TextInputType.text,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.45),
                  fontSize: 11,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          TextField(
            controller: ctrl,
            enabled: enabled,
            keyboardType: keyboard,
            style: const TextStyle(color: Colors.white, fontSize: 13),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.25), fontSize: 13),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.05),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Colors.white.withValues(alpha: 0.12)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Colors.white.withValues(alpha: 0.12)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: _kAccent),
              ),
            ),
          ),
        ],
      );
}

// ─── Prérequis ────────────────────────────────────────────────────────────────

class _RequirementsCard extends StatelessWidget {
  final AppLocalizations loc;
  const _RequirementsCard({required this.loc});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _kAccent.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _kAccent.withValues(alpha: 0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.checklist_rounded,
                    color: _kAccent.withValues(alpha: 0.70), size: 17),
                const SizedBox(width: 8),
                Text(loc.bwSnmpReqTitle,
                    style: TextStyle(
                        color: _kAccent.withValues(alpha: 0.85),
                        fontSize: 13,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(height: 10),
            _Req(text: loc.bwSnmpReq1),
            _Req(text: loc.bwSnmpReq2),
            _Req(text: loc.bwSnmpReq3),
          ],
        ),
      );
}

class _Req extends StatelessWidget {
  final String text;
  const _Req({required this.text});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Icon(Icons.check_circle_outline_rounded,
                  size: 13,
                  color: _kAccent.withValues(alpha: 0.50)),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(text,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55),
                      fontSize: 12.5,
                      height: 1.4)),
            ),
          ],
        ),
      );
}

// ─── Erreur SNMP ─────────────────────────────────────────────────────────────

class _ErrorBanner extends StatelessWidget {
  final String message;
  final AppLocalizations loc;
  const _ErrorBanner({required this.message, required this.loc});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            const Icon(Icons.error_outline_rounded,
                color: Colors.redAccent, size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(loc.bwSnmpError,
                      style: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w700,
                          fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(message,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.45),
                          fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      );
}

// ─── Carte de port ────────────────────────────────────────────────────────────

class _PortCard extends StatelessWidget {
  final SnmpPortStat port;
  final AppLocalizations loc;
  const _PortCard({required this.port, required this.loc});

  @override
  Widget build(BuildContext context) {
    final satColor = _satColor(port.utilizationMax);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _kCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: port.isUp
              ? satColor.withValues(alpha: 0.18)
              : Colors.white.withValues(alpha: 0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: port.isUp
                      ? const Color(0xFF00E676)
                      : Colors.white.withValues(alpha: 0.18),
                  boxShadow: port.isUp
                      ? [
                          BoxShadow(
                            color: const Color(0xFF00E676)
                                .withValues(alpha: 0.40),
                            blurRadius: 4,
                          )
                        ]
                      : null,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Port ${port.index}  ${port.name}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                        .withValues(alpha: port.isUp ? 1.0 : 0.35),
                  ),
                ),
              ),
              Text(
                '${port.speedMbps} Mbps',
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.28),
                    fontSize: 11),
              ),
            ],
          ),

          if (port.isUp && port.inBps != null) ...[
            const SizedBox(height: 10),
            _BwBar(
              label: loc.bwLabelIn,
              bps: port.inBps!,
              utilization: port.utilizationIn,
              color: satColor,
              loc: loc,
            ),
            const SizedBox(height: 6),
            _BwBar(
              label: loc.bwLabelOut,
              bps: port.outBps ?? 0,
              utilization: port.utilizationOut,
              color: satColor,
              loc: loc,
            ),
          ],
        ],
      ),
    );
  }

  Color _satColor(double u) {
    if (u >= 0.95) return Colors.red;
    if (u >= 0.80) return const Color(0xFFFF6D00);
    if (u >= 0.50) return const Color(0xFFFFB300);
    return const Color(0xFF00E676);
  }
}

class _BwBar extends StatelessWidget {
  final String label;
  final double bps;
  final double utilization;
  final Color color;
  final AppLocalizations loc;

  const _BwBar({
    required this.label,
    required this.bps,
    required this.utilization,
    required this.color,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    final kbps = bps * 8 / 1000;
    final mbps = kbps / 1000;
    final valStr = mbps >= 1
        ? '${mbps.toStringAsFixed(2)} ${loc.bwUnitMbps}'
        : '${kbps.toStringAsFixed(0)} ${loc.bwUnitKbps}';
    final pct = (utilization * 100).clamp(0, 100);

    return Row(
      children: [
        SizedBox(
          width: 22,
          child: Text(label,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.40),
                  fontSize: 10,
                  fontWeight: FontWeight.w700)),
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                widthFactor: max(0.002, utilization.clamp(0, 1)),
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.80),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 80,
          child: Text(
            '$valStr  ${pct.toStringAsFixed(0)}%',
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.55),
                fontSize: 10,
                fontFamily: 'monospace'),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
