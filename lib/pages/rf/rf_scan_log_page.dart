import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../about/about_favorites.dart';

const _kAccent = Color(0xFF9C27B0);
const _kPrefsKey = 'rf_scan_log_v1';

// ─── Modèle ──────────────────────────────────────────────────────────��────────
class _ScanEntry {
  final String id;
  final double freqMhz;
  final int? levelDbm;
  final String note;
  final DateTime timestamp;
  final _ScanStatus status;

  const _ScanEntry({
    required this.id,
    required this.freqMhz,
    this.levelDbm,
    required this.note,
    required this.timestamp,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'freqMhz': freqMhz,
        'levelDbm': levelDbm,
        'note': note,
        'timestamp': timestamp.toIso8601String(),
        'status': status.name,
      };

  factory _ScanEntry.fromJson(Map<String, dynamic> j) => _ScanEntry(
        id: j['id'] as String,
        freqMhz: (j['freqMhz'] as num).toDouble(),
        levelDbm: j['levelDbm'] as int?,
        note: j['note'] as String? ?? '',
        timestamp: DateTime.parse(j['timestamp'] as String),
        status: _ScanStatus.values.firstWhere(
          (s) => s.name == j['status'],
          orElse: () => _ScanStatus.unknown,
        ),
      );

  Color get statusColor => switch (status) {
        _ScanStatus.clear => Colors.greenAccent,
        _ScanStatus.occupied => Colors.redAccent,
        _ScanStatus.marginal => Colors.orangeAccent,
        _ScanStatus.unknown => Colors.white38,
      };

  String statusLabel(AppLocalizations loc) => switch (status) {
        _ScanStatus.clear => loc.rfScanLogStatusFree,
        _ScanStatus.occupied => loc.rfScanLogStatusOccupied,
        _ScanStatus.marginal => loc.rfScanLogStatusBorderline,
        _ScanStatus.unknown => '?',
      };
}

enum _ScanStatus { clear, marginal, occupied, unknown }

// ─── Page ─────────────────────────��────────────────────────────────���──────────
class RfScanLogPage extends StatefulWidget {
  const RfScanLogPage({super.key});

  @override
  State<RfScanLogPage> createState() => _RfScanLogPageState();
}

class _RfScanLogPageState extends State<RfScanLogPage> {
  List<_ScanEntry> _entries = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kPrefsKey);
    if (raw != null) {
      try {
        final list = jsonDecode(raw) as List;
        setState(() {
          _entries = list
              .map((e) => _ScanEntry.fromJson(e as Map<String, dynamic>))
              .toList();
          _entries.sort((a, b) => b.timestamp.compareTo(a.timestamp));
        });
      } catch (_) {}
    }
    setState(() => _loading = false);
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _kPrefsKey, jsonEncode(_entries.map((e) => e.toJson()).toList()));
  }

  void _addEntry(_ScanEntry entry) {
    setState(() => _entries.insert(0, entry));
    _save();
  }

  void _deleteEntry(String id) {
    setState(() => _entries.removeWhere((e) => e.id == id));
    _save();
  }

  Future<void> _clearAll() async {
    final loc = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF161622),
        title: Text(loc.rfScanLogClearConfirmTitle,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        content: Text(loc.rfScanLogClearConfirmContent,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.60))),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(loc.rfScanLogCancel,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55)))),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(loc.rfScanLogDelete,
                  style: const TextStyle(color: Colors.redAccent))),
        ],
      ),
    );
    if (confirmed == true) {
      setState(() => _entries.clear());
      _save();
    }
  }

  void _showAddSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF161622),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => _AddEntrySheet(onAdd: _addEntry),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(loc.rfScanLogTitle,
            style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: [
          const AboutPinButton(pageId: 'tool:rf_scan_log', sectionId: 'main'),
          if (_entries.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete_sweep_rounded,
                  color: Colors.redAccent.withValues(alpha: 0.70)),
              tooltip: loc.rfScanLogClearAll,
              onPressed: _clearAll,
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddSheet,
        backgroundColor: _kAccent,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: Text(loc.rfScanLogAdd,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700)),
      ),
      body: SafeArea(
        bottom: true,
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(color: _kAccent))
            : _entries.isEmpty
                ? _EmptyState(onAdd: _showAddSheet)
                : ListView(
                    padding:
                        EdgeInsets.fromLTRB(16, 16, 16, 80 + bottom),
                    children: [
                      // Résumé
                      _SummaryRow(entries: _entries),
                      const SizedBox(height: 14),
                      // Entrées
                      ..._entries.map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _EntryTile(
                                entry: e,
                                onDelete: () => _deleteEntry(e.id)),
                          )),
                    ],
                  ),
      ),
    );
  }
}

// ─── Résumé ──────────���─────────────────────────────────���──────────────────────
class _SummaryRow extends StatelessWidget {
  final List<_ScanEntry> entries;
  const _SummaryRow({required this.entries});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final clear = entries.where((e) => e.status == _ScanStatus.clear).length;
    final occ = entries.where((e) => e.status == _ScanStatus.occupied).length;
    final marg =
        entries.where((e) => e.status == _ScanStatus.marginal).length;

    return Row(children: [
      _MiniStat(label: '$clear', sub: loc.rfScanLogFreePlural, color: Colors.greenAccent),
      const SizedBox(width: 8),
      _MiniStat(label: '$marg', sub: loc.rfScanLogBorderlinePlural, color: Colors.orangeAccent),
      const SizedBox(width: 8),
      _MiniStat(label: '$occ', sub: loc.rfScanLogOccupiedPlural, color: Colors.redAccent),
      const SizedBox(width: 8),
      _MiniStat(
          label: '${entries.length}',
          sub: loc.rfScanLogTotal,
          color: Colors.white38),
    ]);
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String sub;
  final Color color;
  const _MiniStat(
      {required this.label, required this.sub, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.22)),
        ),
        alignment: Alignment.center,
        child: Column(children: [
          Text(label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: color)),
          Text(sub,
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withValues(alpha: 0.40))),
        ]),
      ),
    );
  }
}

// ─── Tile entrée ───────────────────────��────────────────────────────���─────────
class _EntryTile extends StatelessWidget {
  final _ScanEntry entry;
  final VoidCallback onDelete;
  const _EntryTile({required this.entry, required this.onDelete});

  String _fmtTime(DateTime dt, AppLocalizations loc) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 1) return loc.rfScanLogInstant;
    if (diff.inMinutes < 60) return loc.rfScanLogMinutesAgo(diff.inMinutes);
    if (diff.inHours < 24) return loc.rfScanLogHoursAgo(diff.inHours);
    return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final color = entry.statusColor;

    return Dismissible(
      key: Key(entry.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.redAccent.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.delete_rounded, color: Colors.redAccent),
      ),
      onDismissed: (_) => onDelete(),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF161622),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 50,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(2)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${entry.freqMhz.toStringAsFixed(3)} MHz',
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: color.withValues(alpha: 0.35)),
                        ),
                        child: Text(entry.statusLabel(loc),
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w800,
                                color: color)),
                      ),
                    ],
                  ),
                  if (entry.note.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(entry.note,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withValues(alpha: 0.55))),
                    ),
                  const SizedBox(height: 3),
                  Text(_fmtTime(entry.timestamp, loc),
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white.withValues(alpha: 0.30))),
                ],
              ),
            ),
            if (entry.levelDbm != null) ...[
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${entry.levelDbm} dBm',
                      style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: color)),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Formulaire d'ajout ───────────────────────────────────────────────────────
class _AddEntrySheet extends StatefulWidget {
  final ValueChanged<_ScanEntry> onAdd;
  const _AddEntrySheet({required this.onAdd});

  @override
  State<_AddEntrySheet> createState() => _AddEntrySheetState();
}

class _AddEntrySheetState extends State<_AddEntrySheet> {
  final _freqCtrl = TextEditingController();
  final _levelCtrl = TextEditingController();
  final _noteCtrl = TextEditingController();
  _ScanStatus _status = _ScanStatus.unknown;

  final _numFmt = TextInputFormatter.withFunction((oldValue, newValue) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;
    if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) return oldValue;
    final seps = '.'.allMatches(text).length + ','.allMatches(text).length;
    if (seps > 1) return oldValue;
    return newValue;
  });

  @override
  void dispose() {
    _freqCtrl.dispose();
    _levelCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final freq =
        double.tryParse(_freqCtrl.text.replaceAll(',', '.').trim());
    if (freq == null || freq <= 0) return;

    final level =
        int.tryParse(_levelCtrl.text.trim().replaceAll(',', '.'));

    widget.onAdd(_ScanEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      freqMhz: freq,
      levelDbm: level,
      note: _noteCtrl.text.trim(),
      timestamp: DateTime.now(),
      status: _status,
    ));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          20, 20, 20, bottom + MediaQuery.of(context).viewInsets.bottom + 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(2)),
            ),
          ),
          Text(loc.rfScanLogNewEntry,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: Colors.white)),
          const SizedBox(height: 16),

          // Fréquence
          _SheetField(
            controller: _freqCtrl,
            label: loc.rfScanLogFrequency,
            unit: 'MHz',
            formatter: _numFmt,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 10),

          // Niveau
          _SheetField(
            controller: _levelCtrl,
            label: loc.rfScanLogOptionalLevel,
            unit: 'dBm',
            formatter: TextInputFormatter.withFunction((o, n) => n),
            keyboardType: const TextInputType.numberWithOptions(signed: true),
          ),
          const SizedBox(height: 10),

          // Note
          TextField(
            controller: _noteCtrl,
            style: const TextStyle(color: Colors.white),
            maxLines: 2,
            decoration: InputDecoration(
              labelText: loc.rfScanLogNote,
              hintText: loc.rfScanLogNoteHint,
              filled: true,
              fillColor: const Color(0xFF0E0E18),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Colors.white.withValues(alpha: 0.12))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Colors.white.withValues(alpha: 0.12))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: _kAccent, width: 1.5)),
              labelStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.50)),
              hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.25),
                  fontSize: 12),
            ),
          ),
          const SizedBox(height: 12),

          // Statut
          Row(children: [
            Text(loc.rfScanLogStatusLabel,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withValues(alpha: 0.55))),
            const SizedBox(width: 10),
            ..._ScanStatus.values.map((s) {
              final entry = _ScanEntry(
                  id: '',
                  freqMhz: 0,
                  note: '',
                  timestamp: DateTime.now(),
                  status: s);
              final sel = _status == s;
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: GestureDetector(
                  onTap: () => setState(() => _status = s),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 130),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: sel
                          ? entry.statusColor.withValues(alpha: 0.18)
                          : const Color(0xFF0E0E18),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: sel
                            ? entry.statusColor
                            : Colors.white.withValues(alpha: 0.12),
                        width: sel ? 1.5 : 1,
                      ),
                    ),
                    child: Text(entry.statusLabel(loc),
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: sel
                                ? entry.statusColor
                                : Colors.white38)),
                  ),
                ),
              );
            }),
          ]),
          const SizedBox(height: 16),

          // Bouton
          ElevatedButton(
            onPressed: _freqCtrl.text.isEmpty ? null : _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: _kAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
            child: Text(loc.rfScanLogSave,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _SheetField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String unit;
  final TextInputFormatter formatter;
  final TextInputType keyboardType;

  const _SheetField({
    required this.controller,
    required this.label,
    required this.unit,
    required this.formatter,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: [formatter],
      style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
      decoration: InputDecoration(
        labelText: label,
        suffixText: unit,
        isDense: true,
        filled: true,
        fillColor: const Color(0xFF0E0E18),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.12))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.12))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: _kAccent, width: 1.5)),
        labelStyle:
            TextStyle(color: Colors.white.withValues(alpha: 0.50)),
        suffixStyle:
            TextStyle(color: Colors.white.withValues(alpha: 0.40)),
      ),
    );
  }
}

// ─── État vide ─────────────────────��──────────────────────────────���───────────
class _EmptyState extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.radar_rounded,
                color: Colors.white.withValues(alpha: 0.15), size: 64),
            const SizedBox(height: 16),
            Text(loc.rfScanLogEmptyTitle,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.40))),
            const SizedBox(height: 8),
            Text(
              loc.rfScanLogEmptyBody,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withValues(alpha: 0.30),
                  height: 1.4),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: onAdd,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: _kAccent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: _kAccent.withValues(alpha: 0.40)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.add_rounded,
                        color: _kAccent, size: 20),
                    const SizedBox(width: 8),
                    Text(loc.rfScanLogFirstEntry,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: _kAccent)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
