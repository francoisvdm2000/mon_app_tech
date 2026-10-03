import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../../l10n_gen/app_localizations.dart';
import '../../models/plugin_community_model.dart';
import '../../services/community_service.dart';

String _pluginCategoryLabel(
    AppLocalizations l10n, String key, String fallback) {
  switch (key) {
    case 'all':
      return l10n.pluginCategory_all;
    case 'color':
      return l10n.pluginCategory_color;
    case 'movement':
      return l10n.pluginCategory_movement;
    case 'effect':
      return l10n.pluginCategory_effect;
    case 'dimmer':
      return l10n.pluginCategory_dimmer;
    case 'layout':
      return l10n.pluginCategory_layout;
    case 'select':
      return l10n.pluginCategory_select;
    case 'macro':
      return l10n.pluginCategory_macro;
    case 'utility':
      return l10n.pluginCategory_utility;
    case 'custom':
      return l10n.pluginCategory_custom;
    default:
      return fallback;
  }
}

class UploadPluginPage extends StatefulWidget {
  final String authorPseudo;
  const UploadPluginPage({super.key, required this.authorPseudo});

  @override
  State<UploadPluginPage> createState() => _UploadPluginPageState();
}

class _UploadPluginPageState extends State<UploadPluginPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _codeCtrl = TextEditingController();
  String _category = 'custom';
  bool _loading = false;
  final List<PlatformFile> _pickedFiles = [];

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _codeCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withData: true,
    );
    if (result == null) return;
    setState(() {
      final existing = {for (final f in _pickedFiles) f.name};
      for (final f in result.files) {
        if (!existing.contains(f.name)) _pickedFiles.add(f);
      }
    });
  }

  void _removeFile(int index) => setState(() => _pickedFiles.removeAt(index));

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final hasCode = _codeCtrl.text.trim().isNotEmpty;
    final hasFiles = _pickedFiles.isNotEmpty;
    if (!hasCode && !hasFiles) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).codeOrFileRequired),
        backgroundColor: Colors.redAccent,
      ));
      return;
    }
    setState(() => _loading = true);
    try {
      await CommunityService.uploadPlugin(
        title: _titleCtrl.text,
        category: _category,
        description: _descCtrl.text,
        code: _codeCtrl.text,
        authorPseudo: widget.authorPseudo,
        pickedFiles: _pickedFiles,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).pluginPublished),
          backgroundColor: const Color(0xFF2DC653),
        ));
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).pluginError(e.toString())),
          backgroundColor: Colors.redAccent,
        ));
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        title: Text(l10n.sharePlugin,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
              20, 20, 20, 20 + MediaQuery.of(context).padding.bottom),
          children: [
            _label(l10n.pluginTitle),
            const SizedBox(height: 8),
            _field(
              controller: _titleCtrl,
              hint: l10n.pluginTitleHint,
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? l10n.pluginTitleRequired
                  : null,
            ),
            const SizedBox(height: 20),

            _label(l10n.category),
            const SizedBox(height: 8),
            _CategoryPicker(
              value: _category,
              onChanged: (v) => setState(() => _category = v),
            ),
            const SizedBox(height: 20),

            _label(l10n.optionalDescription),
            const SizedBox(height: 8),
            _field(
              controller: _descCtrl,
              hint: l10n.pluginDescriptionHint,
              maxLines: 3,
            ),
            const SizedBox(height: 20),

            // ─── Fichiers ────────────────────────────────────────────────
            _label(l10n.attachFiles),
            const SizedBox(height: 8),
            _FilePickerButton(onTap: _pickFiles, label: l10n.addFiles),
            if (_pickedFiles.isNotEmpty) ...[
              const SizedBox(height: 10),
              ..._pickedFiles.asMap().entries.map((e) => _FileChip(
                    file: e.value,
                    onRemove: () => _removeFile(e.key),
                  )),
            ],
            const SizedBox(height: 20),

            // ─── Code (optionnel) ─────────────────────────────────────────
            _label(l10n.codeOptional),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0A0A12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: const Color(0xFF4CC9F0).withValues(alpha: 0.25)),
              ),
              child: TextFormField(
                controller: _codeCtrl,
                maxLines: 12,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12.5,
                  color: Color(0xFFCDD6F4),
                  height: 1.55,
                ),
                decoration: const InputDecoration(
                  hintText: 'local function main()\n  -- ...\nend\nreturn main',
                  hintStyle: TextStyle(
                      color: Colors.white24,
                      fontFamily: 'monospace',
                      fontSize: 12.5),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.pluginTestedWarning,
              style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 32),

            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: _loading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CC9F0),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  disabledBackgroundColor:
                      const Color(0xFF4CC9F0).withValues(alpha: 0.3),
                ),
                child: _loading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                                color: Colors.black54, strokeWidth: 2.5),
                          ),
                          if (_pickedFiles.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(l10n.uploadingFiles,
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.black54)),
                          ],
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.rocket_launch_rounded, size: 18),
                          const SizedBox(width: 8),
                          Text(l10n.publishPlugin,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String t) => Text(t,
      style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4));

  Widget _field({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white30, fontSize: 14),
        filled: true,
        fillColor: const Color(0xFF161622),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.07)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF4CC9F0), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
      validator: validator,
    );
  }
}

// ─── Bouton sélection fichiers ────────────────────────────────────────────────

class _FilePickerButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  const _FilePickerButton({required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF161622),
          borderRadius: BorderRadius.circular(12),
          border:
              Border.all(color: const Color(0xFF4CC9F0).withValues(alpha: 0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.attach_file_rounded,
                color: Color(0xFF4CC9F0), size: 20),
            const SizedBox(width: 10),
            Text(label,
                style: const TextStyle(
                    color: Color(0xFF4CC9F0),
                    fontWeight: FontWeight.w600,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

// ─── Chip fichier sélectionné ─────────────────────────────────────────────────

class _FileChip extends StatelessWidget {
  final PlatformFile file;
  final VoidCallback onRemove;
  const _FileChip({required this.file, required this.onRemove});

  String get _sizeLabel {
    final b = file.size;
    if (b < 1024) return '$b B';
    if (b < 1024 * 1024) return '${(b / 1024).toStringAsFixed(1)} KB';
    return '${(b / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF4CC9F0).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: const Color(0xFF4CC9F0).withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file_rounded,
              color: Color(0xFF4CC9F0), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(file.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis),
                Text(_sizeLabel,
                    style:
                        const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          ),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close_rounded,
                color: Colors.white38, size: 18),
          ),
        ],
      ),
    );
  }
}

// ─── Category picker ──────────────────────────────────────────────────────────

class _CategoryPicker extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  const _CategoryPicker({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: kPluginCategories.entries.map((e) {
        final selected = e.key == value;
        return GestureDetector(
          onTap: () => onChanged(e.key),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: selected
                  ? const Color(0xFF4CC9F0).withValues(alpha: 0.2)
                  : const Color(0xFF161622),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selected
                    ? const Color(0xFF4CC9F0)
                    : Colors.white.withValues(alpha: 0.1),
              ),
            ),
            child: Text(
              _pluginCategoryLabel(
                  AppLocalizations.of(context), e.key, e.value),
              style: TextStyle(
                fontSize: 13,
                color: selected ? const Color(0xFF4CC9F0) : Colors.white60,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
