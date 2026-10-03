
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';
import 'about_registry.dart';
import '../shared/tool_registry.dart';

/// Entrée unifiée pour l'affichage dans la liste des épingles : peut
/// provenir soit d'une section de référence ([AboutSearchEntry]), soit d'un
/// outil/calculateur ([ToolRefEntry]) — voir [ToolRegistry].
class _PinDisplayItem {
  const _PinDisplayItem({
    required this.pageId,
    required this.sectionId,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.pageBuilder,
  });

  final String pageId;
  final String sectionId;
  final String title;
  final String subtitle;
  final IconData icon;
  final WidgetBuilder pageBuilder;
}

class PinnedReferencesPage extends StatefulWidget {
  const PinnedReferencesPage({super.key});
  @override
  State<PinnedReferencesPage> createState() => _PinnedReferencesPageState();
}

class _PinnedReferencesPageState extends State<PinnedReferencesPage> {
  late Future<List<AboutPinnedRef>> _future;
  @override
  void initState() { super.initState(); _future = AboutFavoritesStore.load(); }
  Future<void> _reload() async { setState(() { _future = AboutFavoritesStore.load(); }); }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final aboutEntries = AboutRegistry.searchEntries(context);
    final toolEntries = ToolRegistry.entries(context);

    final allItems = <_PinDisplayItem>[
      ...aboutEntries.map((entry) => _PinDisplayItem(
            pageId: entry.pageId,
            sectionId: entry.sectionId,
            title: entry.sectionTitle,
            subtitle: entry.pageTitle,
            icon: entry.icon,
            pageBuilder: (_) => AboutRegistry.buildPage(entry.pageId, sectionId: entry.sectionId == 'page' ? null : entry.sectionId),
          )),
      ...toolEntries.map((entry) => _PinDisplayItem(
            pageId: entry.pageId,
            sectionId: entry.sectionId,
            title: entry.toolTitle,
            subtitle: entry.categoryTitle,
            icon: entry.icon,
            pageBuilder: entry.builder,
          )),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(loc.pinnedItemsTitle)),
      body: FutureBuilder<List<AboutPinnedRef>>(
        future: _future,
        builder: (context, snapshot) {
          final refs = snapshot.data ?? const <AboutPinnedRef>[];
          final entries = refs.map((ref) => allItems.where((entry) => entry.pageId == ref.pageId && entry.sectionId == ref.sectionId)).expand((e) => e).toList();
          if (entries.isEmpty) {
            return Center(child: Padding(padding: const EdgeInsets.all(24), child: Text(loc.pinnedItemsEmpty, textAlign: TextAlign.center)));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final entry = entries[index];
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF161622),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () { Navigator.push(context, MaterialPageRoute(builder: entry.pageBuilder)).then((_) => _reload()); },
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7B8CDE).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(entry.icon, color: const Color(0xFF7B8CDE), size: 20),
                      ),
                      title: Text(entry.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                      subtitle: Padding(padding: const EdgeInsets.only(top: 4), child: Text(entry.subtitle, style: TextStyle(color: Colors.white.withValues(alpha: 0.55), fontSize: 12.5))),
                      trailing: IconButton(tooltip: loc.aboutPinRemoveTooltip, icon: Icon(Icons.close, color: Colors.white.withValues(alpha: 0.40), size: 18), onPressed: () async { await AboutFavoritesStore.remove(entry.pageId, entry.sectionId); await _reload(); }),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
