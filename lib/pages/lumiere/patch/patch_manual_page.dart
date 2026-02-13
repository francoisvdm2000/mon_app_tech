import 'package:flutter/material.dart';

import '../../../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class PatchManualPage extends StatelessWidget {
  const PatchManualPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.patchManualTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          SectionCard(
            title: loc.patchManualDisabledTitle,
            icon: Icons.lock_outline,
            child: Text(
              loc.patchManualDisabledBody,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
