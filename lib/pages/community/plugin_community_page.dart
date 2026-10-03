import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../l10n_gen/app_localizations.dart';
import '../../models/plugin_community_model.dart';
import '../../services/community_service.dart';
import '../about/about_favorites.dart';
import 'auth_page.dart';
import 'plugin_detail_page.dart';
import 'upload_plugin_page.dart';

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

class PluginCommunityPage extends StatefulWidget {
  const PluginCommunityPage({super.key});

  @override
  State<PluginCommunityPage> createState() => _PluginCommunityPageState();
}

class _PluginCommunityPageState extends State<PluginCommunityPage> {
  String _categoryFilter = 'all';
  final _searchCtrl = TextEditingController();
  String _searchQuery = '';

  static const _kAccent = Color(0xFF4CC9F0);
  static const _kBg = Color(0xFF0D0D14);
  static const _kCard = Color(0xFF161622);

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _goUpload(User user) async {
    // Capturer l10n avant l'await pour éviter d'utiliser context après un gap async
    final l10n = AppLocalizations.of(context);
    // Récupérer le pseudo
    final profile = await CommunityService.getProfile(user.uid);
    if (!mounted) return;
    final pseudo = [profile?.pseudo, user.displayName]
            .map((e) => e?.trim() ?? '')
            .firstWhere((e) => e.isNotEmpty, orElse: () => l10n.anonymous);

    if (!mounted) return;
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (_) => UploadPluginPage(authorPseudo: pseudo)),
    );
    if (result == true) setState(() {});
  }

  Future<void> _requireAuth(Function(User) callback) async {
    final user = CommunityService.signedInUser;
    if (user != null) {
      callback(user);
      return;
    }
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (_) => const AuthPage()),
    );
    if (result == true && mounted) {
      final newUser = CommunityService.signedInUser;
      if (newUser != null) callback(newUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        title: Text(l10n.pluginCommunity,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          const AboutPinButton(pageId: 'tool:console_plugin_community', sectionId: 'main'),
          // Avatar / connexion
          StreamBuilder<User?>(
            stream: CommunityService.userChanges,
            builder: (ctx, snap) {
              final user = CommunityService.isRealUser(snap.data)
                  ? snap.data
                  : null;
              return GestureDetector(
                onTap: () {
                  if (user != null) {
                    _showProfileMenu(user);
                  } else {
                    _requireAuth((_) {});
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: user != null
                      ? CircleAvatar(
                          radius: 16,
                          backgroundColor: _kAccent.withValues(alpha: 0.2),
                          backgroundImage: (user.photoURL?.isNotEmpty ?? false)
                              ? NetworkImage(user.photoURL!)
                              : null,
                          child: !(user.photoURL?.isNotEmpty ?? false)
                              ? Text(
                                  _initialOf(user.displayName),
                                  style: const TextStyle(
                                      color: _kAccent, fontSize: 14),
                                )
                              : null,
                        )
                      : const Icon(Icons.person_outline_rounded,
                          color: Colors.white54),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: FloatingActionButton.extended(
          onPressed: () => _requireAuth(_goUpload),
          backgroundColor: _kAccent,
          foregroundColor: Colors.black,
          icon: const Icon(Icons.add_rounded),
          label: Text(l10n.share,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(
        children: [
          // Barre de recherche
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: TextField(
              controller: _searchCtrl,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: l10n.searchPluginHint,
                hintStyle: const TextStyle(color: Colors.white38),
                prefixIcon:
                    const Icon(Icons.search_rounded, color: Colors.white38),
                suffixIcon: _searchQuery.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          _searchCtrl.clear();
                          setState(() => _searchQuery = '');
                        },
                        child: const Icon(Icons.close_rounded,
                            color: Colors.white38))
                    : null,
                filled: true,
                fillColor: _kCard,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onChanged: (v) => setState(() => _searchQuery = v.toLowerCase()),
            ),
          ),

          // Filtres catégories
          SizedBox(
            height: 52,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: [
                _FilterChip(
                  label: l10n.allPluginsFilter,
                  selected: _categoryFilter == 'all',
                  onTap: () => setState(() => _categoryFilter = 'all'),
                ),
                ...kPluginCategories.entries.map((e) => _FilterChip(
                      label: _pluginCategoryLabel(l10n, e.key, e.value),
                      selected: _categoryFilter == e.key,
                      onTap: () => setState(() => _categoryFilter = e.key),
                    )),
              ],
            ),
          ),

          // Liste des plugins
          Expanded(
            child: StreamBuilder<List<PluginModel>>(
              stream: CommunityService.streamPlugins(category: _categoryFilter),
              builder: (ctx, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: _kAccent),
                  );
                }
                if (snap.hasError) {
                  return Center(
                    child: Text(l10n.pluginError(snap.error.toString()),
                        style: const TextStyle(color: Colors.redAccent)),
                  );
                }

                var plugins = snap.data ?? [];

                // Filtrer par recherche
                if (_searchQuery.isNotEmpty) {
                  plugins = plugins
                      .where((p) =>
                          p.title.toLowerCase().contains(_searchQuery) ||
                          p.description.toLowerCase().contains(_searchQuery) ||
                          p.authorPseudo.toLowerCase().contains(_searchQuery))
                      .toList();
                }

                if (plugins.isEmpty) {
                  return const _EmptyState();
                }

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                  itemCount: plugins.length,
                  itemBuilder: (_, i) => _PluginCard(
                    plugin: plugins[i],
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PluginDetailPage(plugin: plugins[i]),
                    )),
                    onLike: () => _handleLike(plugins[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleLike(PluginModel plugin) async {
    final user = CommunityService.signedInUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).loginRequiredLike),
          backgroundColor: Color(0xFF1A1A2E),
        ),
      );
      return;
    }
    await CommunityService.toggleLike(plugin);
  }

  void _showProfileMenu(User user) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A2E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _ProfileSheet(user: user),
    );
  }
}

// ─── Carte plugin ──────────────────────────────────────────────────────────

class _PluginCard extends StatelessWidget {
  final PluginModel plugin;
  final VoidCallback onTap;
  final VoidCallback onLike;

  const _PluginCard({
    required this.plugin,
    required this.onTap,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    final uid = CommunityService.currentUser?.uid;
    final liked = uid != null && plugin.likedBy.contains(uid);
    final l10n = AppLocalizations.of(context);
    final catLabel = _pluginCategoryLabel(l10n, plugin.category,
        kPluginCategories[plugin.category] ?? plugin.category);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
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
                Expanded(
                  child: Text(
                    plugin.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Like button
                GestureDetector(
                  onTap: onLike,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Icon(
                          liked
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: liked ? Colors.redAccent : Colors.white38,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text('${plugin.likes}',
                            style: const TextStyle(
                                color: Colors.white38, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                _Chip(catLabel, const Color(0xFF4CC9F0)),
                const SizedBox(width: 8),
                const Icon(Icons.person_outline,
                    size: 12, color: Colors.white38),
                const SizedBox(width: 4),
                Text(plugin.authorPseudo,
                    style:
                        const TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
            if (plugin.description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                plugin.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white54, fontSize: 13, height: 1.4),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color color;
  const _Chip(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }
}

// ─── Filtre ────────────────────────────────────────────────────────────────

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _FilterChip(
      {required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4CC9F0) : const Color(0xFF161622),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white60,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

// ─── État vide ─────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🎛', style: TextStyle(fontSize: 52)),
          const SizedBox(height: 16),
          Text(l10n.noPluginsYet,
              style: TextStyle(color: Colors.white54, fontSize: 16)),
          const SizedBox(height: 8),
          Text(l10n.beFirstToShare,
              style: TextStyle(color: Colors.white30, fontSize: 13)),
        ],
      ),
    );
  }
}

// ─── Profil sheet ──────────────────────────────────────────────────────────

class _ProfileSheet extends StatefulWidget {
  final User user;
  const _ProfileSheet({required this.user});

  @override
  State<_ProfileSheet> createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<_ProfileSheet> {
  String? _pseudo;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadPseudo();
  }

  Future<void> _loadPseudo() async {
    final profile = await CommunityService.getProfile(widget.user.uid);
    if (mounted) {
      setState(() {
        _pseudo = profile?.pseudo;
        _loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 30,
            backgroundImage: (widget.user.photoURL?.isNotEmpty ?? false)
                ? NetworkImage(widget.user.photoURL!)
                : null,
            backgroundColor: const Color(0xFF4CC9F0).withValues(alpha: 0.2),
            child: !(widget.user.photoURL?.isNotEmpty ?? false)
                ? Text(
                    _initialOf(widget.user.displayName),
                    style:
                        const TextStyle(fontSize: 24, color: Color(0xFF4CC9F0)),
                  )
                : null,
          ),
          const SizedBox(height: 12),
          if (_loaded && _pseudo != null)
            Text('@$_pseudo',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          Text(widget.user.email ?? '',
              style: const TextStyle(color: Colors.white54, fontSize: 13)),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
            title: Text(AppLocalizations.of(context).signOut,
                style: const TextStyle(color: Colors.redAccent)),
            onTap: () async {
              Navigator.of(context).pop();
              await CommunityService.signOut();
            },
          ),
        ],
      ),
      ),
    );
  }
}

/// Initiale sûre pour l'avatar (gère null, chaîne vide et espaces).
String _initialOf(String? name) {
  final n = name?.trim() ?? '';
  return n.isEmpty ? 'U' : n.characters.first.toUpperCase();
}
