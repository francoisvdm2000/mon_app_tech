import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF00E5FF);

/// Adressage Art-Net (spec Art-Net 4) : Port-Address 15 bits =
/// Net (bits 14-8, 7 bits, 0-127) · Sub-Net (bits 7-4, 4 bits, 0-15) ·
/// Universe (bits 3-0, 4 bits, 0-15).
/// PortAddress = (Net << 8) | (SubNet << 4) | Universe   → 0-32767.
int _portAddress(int net, int subNet, int universe) =>
    (net << 8) | (subNet << 4) | universe;

class _Decomposed {
  final int net;
  final int subNet;
  final int universe;
  const _Decomposed(this.net, this.subNet, this.universe);
}

_Decomposed _decompose(int portAddress) => _Decomposed(
      (portAddress >> 8) & 0x7F,
      (portAddress >> 4) & 0x0F,
      portAddress & 0x0F,
    );

final _intFmt = FilteringTextInputFormatter.digitsOnly;

class NetworkArtNetAddressingPage extends StatefulWidget {
  const NetworkArtNetAddressingPage({super.key});

  @override
  State<NetworkArtNetAddressingPage> createState() =>
      _NetworkArtNetAddressingPageState();
}

class _NetworkArtNetAddressingPageState
    extends State<NetworkArtNetAddressingPage> {
  final _netCtrl = TextEditingController(text: '0');
  final _subNetCtrl = TextEditingController(text: '0');
  final _universeCtrl = TextEditingController(text: '0');
  final _portAddressCtrl = TextEditingController(text: '0');

  @override
  void dispose() {
    _netCtrl.dispose();
    _subNetCtrl.dispose();
    _universeCtrl.dispose();
    _portAddressCtrl.dispose();
    super.dispose();
  }

  int? _p(TextEditingController c) => int.tryParse(c.text.trim());

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    final net = _p(_netCtrl);
    final subNet = _p(_subNetCtrl);
    final universe = _p(_universeCtrl);
    final netValid = net != null && net >= 0 && net <= 127;
    final subNetValid = subNet != null && subNet >= 0 && subNet <= 15;
    final universeValid = universe != null && universe >= 0 && universe <= 15;
    final combinedPortAddress = (netValid && subNetValid && universeValid)
        ? _portAddress(net, subNet, universe)
        : null;

    final rawPortAddress = _p(_portAddressCtrl);
    final portAddressValid =
        rawPortAddress != null && rawPortAddress >= 0 && rawPortAddress <= 32767;
    final decomposed = portAddressValid ? _decompose(rawPortAddress) : null;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.networkArtNetAddressingTitle,
            style: const TextStyle(
                fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: const [
          AboutPinButton(
              pageId: 'tool:network_artnet_addressing', sectionId: 'main'),
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
            // ── Net/Sub-Net/Universe → Port-Address ─────────────────────────
            _Card(
              icon: Icons.call_merge_rounded,
              title: loc.networkArtNetToPortTitle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _NumField(
                          controller: _netCtrl,
                          label: loc.networkArtNetNetLabel,
                          hint: '0',
                          range: '0-127',
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _NumField(
                          controller: _subNetCtrl,
                          label: loc.networkArtNetSubNetLabel,
                          hint: '0',
                          range: '0-15',
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _NumField(
                          controller: _universeCtrl,
                          label: loc.networkArtNetUniverseLabel,
                          hint: '0',
                          range: '0-15',
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  if (combinedPortAddress == null)
                    _EmptyState(message: loc.networkArtNetEmptyState)
                  else
                    _ResultBox(
                      value: '${loc.networkArtNetPortAddressLabel} $combinedPortAddress',
                      subtitle:
                          '0x${combinedPortAddress.toRadixString(16).padLeft(4, '0').toUpperCase()}',
                    ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            // ── Port-Address → Net/Sub-Net/Universe ─────────────────────────
            _Card(
              icon: Icons.call_split_rounded,
              title: loc.networkArtNetFromPortTitle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _NumField(
                    controller: _portAddressCtrl,
                    label: loc.networkArtNetPortAddressLabel,
                    hint: '0',
                    range: '0-32767',
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 14),
                  if (decomposed == null)
                    _EmptyState(message: loc.networkArtNetEmptyState)
                  else
                    _ResultBox(
                      value: 'Net ${decomposed.net} · '
                          '${loc.networkArtNetSubNetLabel} ${decomposed.subNet} · '
                          '${loc.networkArtNetUniverseLabel} ${decomposed.universe}',
                      subtitle: null,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              loc.networkArtNetFormulaNote,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'monospace',
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

class _ResultBox extends StatelessWidget {
  final String value;
  final String? subtitle;
  const _ResultBox({required this.value, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: _kAccent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _kAccent.withValues(alpha: 0.35), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: _kAccent,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 6),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: 12.5,
                fontFamily: 'monospace',
                color: Colors.white.withValues(alpha: 0.55),
              ),
            ),
          ],
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

class _NumField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String range;
  final ValueChanged<String> onChanged;

  const _NumField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.range,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [_intFmt],
      style: const TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixText: range,
        filled: true,
        fillColor: const Color(0xFF0E0E18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _kAccent, width: 1.5),
        ),
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.55)),
        suffixStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.35), fontSize: 11),
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
