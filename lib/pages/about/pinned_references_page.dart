
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';
import 'about_registry.dart';

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
    final allEntries = AboutRegistry.searchEntries(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.pinnedReferencesTitle)),
      body: FutureBuilder<List<AboutPinnedRef>>(
        future: _future,
        builder: (context, snapshot) {
          final refs = snapshot.data ?? const <AboutPinnedRef>[];
          final entries = refs.map((ref) => allEntries.where((entry) => entry.pageId == ref.pageId && entry.sectionId == ref.sectionId)).expand((e) => e).toList();
          if (entries.isEmpty) {
            return Center(child: Padding(padding: const EdgeInsets.all(24), child: Text(loc.pinnedReferencesEmpty, textAlign: TextAlign.center)));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final entry = entries[index];
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  leading: Icon(entry.icon, color: Colors.white),
                  title: Text(entry.sectionTitle, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                  subtitle: Padding(padding: const EdgeInsets.only(top: 4), child: Text(entry.pageTitle)),
                  trailing: IconButton(tooltip: loc.aboutPinRemoveTooltip, icon: const Icon(Icons.close), onPressed: () async { await AboutFavoritesStore.remove(entry.pageId, entry.sectionId); await _reload(); }),
                  onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => AboutRegistry.buildPage(entry.pageId, sectionId: entry.sectionId == 'page' ? null : entry.sectionId))).then((_) => _reload()); },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
