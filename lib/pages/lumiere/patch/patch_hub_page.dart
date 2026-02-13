import 'package:flutter/material.dart';

import '../../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'patch_mvr_import_page.dart';
import 'patch_universe_page.dart';
import 'patch_store.dart';

class PatchHubPage extends StatelessWidget {
  const PatchHubPage({super.key});

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AnimatedBuilder(
      animation: patchStore,
      builder: (context, _) {
        final hasRef = patchStore.entries.isNotEmpty;
        final count = patchStore.entries.length;

        return Scaffold(
          appBar: AppBar(
            title: Text(loc.patchHubTitle),
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              SectionCard(
                title: loc.patchHubWorksiteTitle,
                icon: Icons.lock_outline,
                child: Text(
                  loc.patchHubWorksiteBody,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _open(context, const PatchMvrImportPage()),
                child: Text(loc.patchHubOpenMvrButton),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _open(context, const PatchUniversePage()),
                child: Text(loc.patchHubOpenGridButton),
              ),
              const SizedBox(height: 12),
              SectionCard(
                title: loc.patchHubStateTitle,
                icon: Icons.info_outline,
                child: Text(
                  hasRef
                      ? loc.patchHubStateLoaded(count)
                      : loc.patchHubStateEmpty,
                  style: const TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
