import 'package:flutter/material.dart';

import '../app/ui/widgets.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class PageMentionsLegales extends StatelessWidget {
  const PageMentionsLegales({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.legalNotices)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SectionCard(
            title: loc.legalNotices,
            icon: Icons.gavel,
            child: Text(
              loc.disclaimerText,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
