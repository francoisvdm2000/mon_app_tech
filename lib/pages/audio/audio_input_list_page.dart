import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../about/about_favorites.dart';
import 'audio_input_list_storage.dart';

const _kAccent = Color(0xFF00E5FF);

/// Liste d'inputs (micros/DI) réordonnable, avec position et notes,
/// persistée localement et exportable en texte (presse-papiers) pour la
/// balance ou la feuille de patch. L'ordre des lignes définit le numéro
/// de canal.
class AudioInputListPage extends StatefulWidget {
  const AudioInputListPage({super.key});

  @override
  State<AudioInputListPage> createState() => _AudioInputListPageState();
}

class _AudioInputListPageState extends State<AudioInputListPage> {
  List<AudioInputItem> _items = [];
  final Map<String, TextEditingController> _nameCtrls = {};
  final Map<String, TextEditingController> _positionCtrls = {};
  final Map<String, TextEditingController> _notesCtrls = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = await AudioInputListStorage.load();
    if (!mounted) return;
    setState(() {
      _items = items;
      for (final item in _items) {
        _ensureControllers(item);
      }
      _loading = false;
    });
  }

  void _ensureControllers(AudioInputItem item) {
    _nameCtrls.putIfAbsent(
        item.id, () => TextEditingController(text: item.name));
    _positionCtrls.putIfAbsent(
        item.id, () => TextEditingController(text: item.position));
    _notesCtrls.putIfAbsent(
        item.id, () => TextEditingController(text: item.notes));
  }

  void _disposeControllers(String id) {
    _nameCtrls.remove(id)?.dispose();
    _positionCtrls.remove(id)?.dispose();
    _notesCtrls.remove(id)?.dispose();
  }

  @override
  void dispose() {
    for (final c in _nameCtrls.values) {
      c.dispose();
    }
    for (final c in _positionCtrls.values) {
      c.dispose();
    }
    for (final c in _notesCtrls.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _persist() async {
    await AudioInputListStorage.save(_items);
  }

  void _addItem() {
    final item = AudioInputItem.empty();
    setState(() {
      _items.add(item);
      _ensureControllers(item);
    });
    _persist();
  }

  void _removeItem(String id) {
    setState(() {
      _items.removeWhere((i) => i.id == id);
      _disposeControllers(id);
    });
    _persist();
  }

  void _updateItem(String id,
      {String? name, AudioInputType? type, String? position, String? notes}) {
    final index = _items.indexWhere((i) => i.id == id);
    if (index == -1) return;
    _items[index] = _items[index].copyWith(
      name: name,
      type: type,
      position: position,
      notes: notes,
    );
    _persist();
  }

  void _onReorder(int oldIndex, int newIndex) {
    // onReorderItem (contrairement à l'ancien onReorder) fournit déjà un
    // newIndex correct pour un item retiré à oldIndex — plus besoin de
    // l'ajustement manuel `if (newIndex > oldIndex) newIndex -= 1;`.
    setState(() {
      final item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
    _persist();
  }

  String _typeLabel(AppLocalizations loc, AudioInputType type) {
    switch (type) {
      case AudioInputType.mic:
        return loc.audioInputListTypeMic;
      case AudioInputType.di:
        return loc.audioInputListTypeDi;
      case AudioInputType.line:
        return loc.audioInputListTypeLine;
      case AudioInputType.wireless:
        return loc.audioInputListTypeWireless;
      case AudioInputType.other:
        return loc.audioInputListTypeOther;
    }
  }

  Future<void> _copyList() async {
    final loc = AppLocalizations.of(context);
    final buffer = StringBuffer();
    for (var i = 0; i < _items.length; i++) {
      final item = _items[i];
      final parts = [
        loc.audioInputListChannel(i + 1),
        item.name.isEmpty ? '—' : item.name,
        _typeLabel(loc, item.type),
        if (item.position.isNotEmpty) item.position,
        if (item.notes.isNotEmpty) item.notes,
      ];
      buffer.writeln(parts.join('  |  '));
    }
    await Clipboard.setData(ClipboardData(text: buffer.toString().trim()));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(loc.audioInputListCopiedSnackbar)),
    );
  }

  Future<void> _confirmClear() async {
    final loc = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF161622),
        title: Text(loc.audioInputListClearConfirmTitle,
            style: const TextStyle(color: Colors.white)),
        content: Text(loc.audioInputListClearConfirmBody,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.70))),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(loc.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(loc.commonDelete,
                style: const TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
    if (ok != true) return;
    setState(() {
      for (final item in List.of(_items)) {
        _disposeControllers(item.id);
      }
      _items.clear();
    });
    _persist();
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
        title: Text(loc.audioInputListTitle,
            style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2)),
        actions: [
          IconButton(
            tooltip: loc.audioInputListCopyAction,
            icon: const Icon(Icons.copy_all_rounded),
            onPressed: _items.isEmpty ? null : _copyList,
          ),
          IconButton(
            tooltip: loc.audioInputListClearAction,
            icon: const Icon(Icons.delete_sweep_outlined),
            onPressed: _items.isEmpty ? null : _confirmClear,
          ),
          const AboutPinButton(pageId: 'tool:audio_input_list', sectionId: 'main'),
          const SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child:
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: _loading
            ? const Center(
                child: CircularProgressIndicator(color: _kAccent))
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
                    child: Text(
                      loc.audioInputListIntro,
                      style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.white.withValues(alpha: 0.55),
                          height: 1.4),
                    ),
                  ),
                  Expanded(
                    child: _items.isEmpty
                        ? _EmptyState(text: loc.audioInputListEmpty)
                        : ReorderableListView.builder(
                            padding:
                                EdgeInsets.fromLTRB(16, 6, 16, 12 + bottom),
                            buildDefaultDragHandles: false,
                            itemCount: _items.length,
                            onReorderItem: _onReorder,
                            itemBuilder: (context, index) {
                              final item = _items[index];
                              return Padding(
                                key: ValueKey(item.id),
                                padding: const EdgeInsets.only(bottom: 10),
                                child: _InputRow(
                                  channel: index + 1,
                                  item: item,
                                  nameCtrl: _nameCtrls[item.id]!,
                                  positionCtrl: _positionCtrls[item.id]!,
                                  notesCtrl: _notesCtrls[item.id]!,
                                  typeLabel: (t) => _typeLabel(loc, t),
                                  onNameChanged: (v) =>
                                      _updateItem(item.id, name: v),
                                  onPositionChanged: (v) =>
                                      _updateItem(item.id, position: v),
                                  onNotesChanged: (v) =>
                                      _updateItem(item.id, notes: v),
                                  onTypeChanged: (t) =>
                                      setState(() => _updateItem(item.id, type: t)),
                                  onDelete: () => _removeItem(item.id),
                                  positionLabel: loc.audioInputListPositionLabel,
                                  nameLabel: loc.audioInputListNameLabel,
                                  notesLabel: loc.audioInputListNotesLabel,
                                  channelLabel:
                                      loc.audioInputListChannel(index + 1),
                                ),
                              );
                            },
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 12 + bottom),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _addItem,
                        icon: const Icon(Icons.add_rounded, color: _kAccent),
                        label: Text(loc.audioInputListAddButton,
                            style: const TextStyle(
                                color: _kAccent, fontWeight: FontWeight.w700)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: BorderSide(
                              color: _kAccent.withValues(alpha: 0.35)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String text;
  const _EmptyState({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.list_alt_rounded,
                size: 40, color: Colors.white.withValues(alpha: 0.20)),
            const SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13, color: Colors.white.withValues(alpha: 0.45)),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputRow extends StatelessWidget {
  final int channel;
  final AudioInputItem item;
  final TextEditingController nameCtrl;
  final TextEditingController positionCtrl;
  final TextEditingController notesCtrl;
  final String Function(AudioInputType) typeLabel;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPositionChanged;
  final ValueChanged<String> onNotesChanged;
  final ValueChanged<AudioInputType> onTypeChanged;
  final VoidCallback onDelete;
  final String positionLabel;
  final String nameLabel;
  final String notesLabel;
  final String channelLabel;

  const _InputRow({
    required this.channel,
    required this.item,
    required this.nameCtrl,
    required this.positionCtrl,
    required this.notesCtrl,
    required this.typeLabel,
    required this.onNameChanged,
    required this.onPositionChanged,
    required this.onNotesChanged,
    required this.onTypeChanged,
    required this.onDelete,
    required this.positionLabel,
    required this.nameLabel,
    required this.notesLabel,
    required this.channelLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161622),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Tooltip(
            message: channelLabel,
            child: Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(top: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _kAccent.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Text(
                '$channel',
                style: const TextStyle(
                    color: _kAccent,
                    fontWeight: FontWeight.w800,
                    fontSize: 13),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: _MiniField(
                        controller: nameCtrl,
                        label: nameLabel,
                        onChanged: onNameChanged,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _TypeDropdown(
                      value: item.type,
                      label: typeLabel,
                      onChanged: onTypeChanged,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _MiniField(
                        controller: positionCtrl,
                        label: positionLabel,
                        onChanged: onPositionChanged,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _MiniField(
                        controller: notesCtrl,
                        label: notesLabel,
                        onChanged: onNotesChanged,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(Icons.close_rounded,
                    size: 18, color: Colors.white.withValues(alpha: 0.35)),
                onPressed: onDelete,
              ),
              const SizedBox(height: 10),
              ReorderableDragStartListener(
                index: channel - 1,
                child: Icon(Icons.drag_handle_rounded,
                    size: 18, color: Colors.white.withValues(alpha: 0.30)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TypeDropdown extends StatelessWidget {
  final AudioInputType value;
  final String Function(AudioInputType) label;
  final ValueChanged<AudioInputType> onChanged;

  const _TypeDropdown(
      {required this.value, required this.label, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF0E0E18),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<AudioInputType>(
          value: value,
          isDense: true,
          dropdownColor: const Color(0xFF161622),
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
          icon: Icon(Icons.expand_more_rounded,
              size: 16, color: Colors.white.withValues(alpha: 0.40)),
          items: AudioInputType.values
              .map((t) => DropdownMenuItem(
                    value: t,
                    child: Text(label(t)),
                  ))
              .toList(),
          onChanged: (t) {
            if (t != null) onChanged(t);
          },
        ),
      ),
    );
  }
}

class _MiniField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final ValueChanged<String> onChanged;

  const _MiniField({
    required this.controller,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white, fontSize: 13),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        filled: true,
        fillColor: const Color(0xFF0E0E18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _kAccent, width: 1.5),
        ),
        labelStyle: TextStyle(
            color: Colors.white.withValues(alpha: 0.45), fontSize: 12),
      ),
    );
  }
}
