import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../l10n_gen/app_localizations.dart';
import '../../models/plugin_community_model.dart';
import '../../services/community_service.dart';


String _pluginCategoryLabel(AppLocalizations l10n, String key, String fallback) {
  switch (key) {
    case 'all': return l10n.pluginCategory_all;
    case 'color': return l10n.pluginCategory_color;
    case 'movement': return l10n.pluginCategory_movement;
    case 'effect': return l10n.pluginCategory_effect;
    case 'dimmer': return l10n.pluginCategory_dimmer;
    case 'layout': return l10n.pluginCategory_layout;
    case 'select': return l10n.pluginCategory_select;
    case 'macro': return l10n.pluginCategory_macro;
    case 'utility': return l10n.pluginCategory_utility;
    case 'custom': return l10n.pluginCategory_custom;
    default: return fallback;
  }
}

class PluginDetailPage extends StatefulWidget {
  final PluginModel plugin;
  const PluginDetailPage({super.key, required this.plugin});

  @override
  State<PluginDetailPage> createState() => _PluginDetailPageState();
}

class _PluginDetailPageState extends State<PluginDetailPage> {
  late PluginModel _plugin;
  bool _copied = false;

  @override
  void initState() {
    super.initState();
    _plugin = widget.plugin;
  }

  Future<void> _toggleLike() async {
    final uid = CommunityService.currentUser?.uid;
    if (uid == null) { _showSignInSnack(); return; }
    await CommunityService.toggleLike(_plugin);
    // Refresh local state optimistically
    setState(() {
      final liked = _plugin.likedBy.contains(uid);
      final newLikedBy = List<String>.from(_plugin.likedBy);
      if (liked) {
        newLikedBy.remove(uid);
      } else {
        newLikedBy.add(uid);
      }
      _plugin = PluginModel(
        id: _plugin.id,
        title: _plugin.title,
        category: _plugin.category,
        description: _plugin.description,
        code: _plugin.code,
        files: _plugin.files,
        authorId: _plugin.authorId,
        authorPseudo: _plugin.authorPseudo,
        likes: liked ? _plugin.likes - 1 : _plugin.likes + 1,
        likedBy: newLikedBy,
        createdAt: _plugin.createdAt,
      );
    });
  }

  void _showSignInSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context).loginRequiredLike),
        backgroundColor: Color(0xFF1A1A2E),
      ),
    );
  }

  Future<void> _copyCode() async {
    await Clipboard.setData(ClipboardData(text: _plugin.code));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final uid = CommunityService.currentUser?.uid;
    final liked = uid != null && _plugin.likedBy.contains(uid);
    final catLabel =
        _pluginCategoryLabel(l10n, _plugin.category, kPluginCategories[_plugin.category] ?? _plugin.category);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D14),
        title: Text(_plugin.title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        actions: [
          // Bouton like
          GestureDetector(
            onTap: _toggleLike,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(
                    liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                    color: liked ? Colors.redAccent : Colors.white54,
                  ),
                  const SizedBox(width: 5),
                  Text('${_plugin.likes}',
                      style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Infos plugin
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF161622),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CC9F0).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(catLabel,
                          style: const TextStyle(
                              color: Color(0xFF4CC9F0), fontSize: 12)),
                    ),
                    const Spacer(),
                    const Icon(Icons.person_outline,
                        size: 14, color: Colors.white38),
                    const SizedBox(width: 4),
                    Text(_plugin.authorPseudo,
                        style: const TextStyle(
                            color: Colors.white54, fontSize: 13)),
                  ],
                ),
                if (_plugin.description.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(_plugin.description,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 14, height: 1.5)),
                ],
              ],
            ),
          ),

          // ─── Section fichiers ───────────────────────────────────────
          if (_plugin.files.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(l10n.pluginFiles,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
              child: Column(
                children: _plugin.files
                    .map((f) => _FileDownloadTile(file: f, l10n: l10n))
                    .toList(),
              ),
            ),
          ],

          // ─── Section code ────────────────────────────────────────────
          if (_plugin.code.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Text(l10n.luaCode,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  const Spacer(),
                  _CopyButton(copied: _copied, onTap: _copyCode),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A0A12),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                      color: const Color(0xFF4CC9F0).withValues(alpha: 0.2)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _plugin.code,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 13,
                        color: Color(0xFFCDD6F4),
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ] else
            const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _FileDownloadTile extends StatelessWidget {
  final PluginFile file;
  final AppLocalizations l10n;
  const _FileDownloadTile({required this.file, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: const Color(0xFF4CC9F0).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: const Color(0xFF4CC9F0).withValues(alpha: 0.25)),
      ),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file_rounded,
              color: Color(0xFF4CC9F0), size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(file.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis),
          ),
          GestureDetector(
            onTap: () async {
              final uri = Uri.parse(file.url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF4CC9F0).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: const Color(0xFF4CC9F0).withValues(alpha: 0.4)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.download_rounded,
                      size: 14, color: Color(0xFF4CC9F0)),
                  const SizedBox(width: 5),
                  Text(l10n.downloadFile,
                      style: const TextStyle(
                          color: Color(0xFF4CC9F0),
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CopyButton extends StatelessWidget {
  final bool copied;
  final VoidCallback onTap;
  const _CopyButton({required this.copied, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: GestureDetector(
        key: ValueKey(copied),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: copied
                ? const Color(0xFF2DC653).withValues(alpha: 0.2)
                : const Color(0xFF4CC9F0).withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: copied
                  ? const Color(0xFF2DC653).withValues(alpha: 0.4)
                  : const Color(0xFF4CC9F0).withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                copied ? Icons.check_rounded : Icons.copy_rounded,
                size: 15,
                color:
                    copied ? const Color(0xFF2DC653) : const Color(0xFF4CC9F0),
              ),
              const SizedBox(width: 6),
              Text(
                copied ? AppLocalizations.of(context).copied : AppLocalizations.of(context).copyCode,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: copied
                      ? const Color(0xFF2DC653)
                      : const Color(0xFF4CC9F0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
