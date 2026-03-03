import 'package:flutter/material.dart';

import '../../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'patch_mvr_import_page.dart';
import 'patch_universe_page.dart';
import 'gdtf_builder_simple_page.dart';

class PatchHomePage extends StatelessWidget {
  const PatchHomePage({super.key});

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.patchHomeTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _open(context, const PatchMvrImportPage()),
            child: SectionCard(
              title: loc.patchHomeImportMvrTitle,
              icon: Icons.upload_file,
              trailing: const Icon(Icons.chevron_right, color: Colors.white70),
              child: Text(
                loc.patchHomeImportMvrDescription,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _open(context, const PatchUniversePage()),
            child: SectionCard(
              title: loc.patchHomeViewPatchTitle,
              icon: Icons.account_tree,
              trailing: const Icon(Icons.chevron_right, color: Colors.white70),
              child: Text(
                loc.patchHomeViewPatchDescription,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ✅ Nouvelle tuile GDTF (simple) - L10n
          InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _open(context, const GdtfBuilderSimplePage()),
            child: SectionCard(
              title: loc.patchCreateGdtfTitle,
              icon: Icons.dataset_outlined,
              trailing: const Icon(Icons.chevron_right, color: Colors.white70),
              child: Text(
                loc.patchCreateGdtfSubtitle,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          ),

          const SizedBox(height: 18),
          Text(
            loc.patchHomeDisclaimer,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white38, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
