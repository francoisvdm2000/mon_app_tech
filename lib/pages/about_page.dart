
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about/about_registry.dart';
import 'about/pinned_references_page.dart';

class PageAbout extends StatefulWidget {
  const PageAbout({super.key});
  @override
  State<PageAbout> createState() => _PageAboutState();
}

class _PageAboutState extends State<PageAbout> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void dispose() { _searchCtrl.dispose(); super.dispose(); }

  void _open(BuildContext context, String pageId, {String? sectionId}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AboutRegistry.buildPage(pageId, sectionId: sectionId)));
  }

  String _normalize(String value) {
    const map = {'à':'a','á':'a','â':'a','ä':'a','ç':'c','é':'e','è':'e','ê':'e','ë':'e','î':'i','ï':'i','ô':'o','ö':'o','ù':'u','ú':'u','û':'u','ü':'u','ÿ':'y','œ':'oe','æ':'ae'};
    var out = value.toLowerCase().trim();
    map.forEach((k, v) => out = out.replaceAll(k, v));
    return out;
  }

  List<AboutSearchEntry> _filteredEntries(BuildContext context) {
    final q = _normalize(_query);
    if (q.isEmpty) return const <AboutSearchEntry>[];
    return AboutRegistry.searchEntries(context).where((entry) {
      final haystack = _normalize('${entry.pageTitle} ${entry.sectionTitle} ${entry.subtitle}');
      return haystack.contains(q);
    }).take(12).toList();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final tiles = AboutRegistry.tiles(context);
    final results = _filteredEntries(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.homeReferencesTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(children: [
                    TextField(
                      controller: _searchCtrl,
                      onChanged: (value) => setState(() => _query = value),
                      decoration: InputDecoration(
                        hintText: loc.aboutSearchHint,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _query.trim().isEmpty ? null : IconButton(onPressed: () { _searchCtrl.clear(); setState(() => _query = ''); }, icon: const Icon(Icons.close)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _NavTile(title: loc.pinnedReferencesTitle, subtitle: loc.homePinnedSubtitle, icon: Icons.push_pin_outlined, onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => const PinnedReferencesPage())); }),
                  ]),
                ),
              ),
              if (_query.trim().isNotEmpty) ...[
                const SizedBox(height: 12),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: results.isEmpty ? Text(loc.aboutSearchNoResults, style: TextStyle(color: Colors.white.withValues(alpha: 0.80), fontWeight: FontWeight.w600)) : Column(children: results.map((entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Material(
                        color: const Color(0xFF0B0B0B),
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => _open(context, entry.pageId, sectionId: entry.sectionId == 'page' ? null : entry.sectionId),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(children: [
                              Icon(entry.icon, color: Colors.white),
                              const SizedBox(width: 12),
                              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Text(entry.sectionTitle, style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white)),
                                const SizedBox(height: 4),
                                Text(entry.pageTitle, style: TextStyle(color: Colors.white.withValues(alpha: 0.72))),
                              ])),
                              Icon(Icons.chevron_right, color: Colors.white.withValues(alpha: 0.55)),
                            ]),
                          ),
                        ),
                      ),
                    )).toList()),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              LayoutBuilder(builder: (context, c) {
                final isWide = c.maxWidth >= 900;
                final tileW = isWide ? (c.maxWidth - 12) / 2 : c.maxWidth;
                Widget sized(Widget child) => SizedBox(width: tileW, child: child);
                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: tiles.map((tile) => sized(_NavTile(title: tile.title, subtitle: tile.subtitle, icon: tile.icon, onTap: () => _open(context, tile.pageId)))).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({required this.title, required this.subtitle, required this.icon, required this.onTap});
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white)),
              const SizedBox(height: 8),
              Text(subtitle, style: TextStyle(color: Colors.white.withValues(alpha: 0.75), height: 1.25, fontWeight: FontWeight.w600)),
            ])),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: Colors.white.withValues(alpha: 0.55)),
          ]),
        ),
      ),
    );
  }
}
