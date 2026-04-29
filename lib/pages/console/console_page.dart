import 'package:flutter/material.dart';
import '../../l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';
import '../lumiere/patch/patch_home_page.dart';
import '../lumiere/patch/gdtf_builder_simple_page.dart';

class ConsolePage extends StatelessWidget {
  const ConsolePage({super.key});

  Future<void> _openOrSubscribe(BuildContext context, Widget page) async {
    final hasAccess =
        await SubscriptionService.hasAccess(SubscriptionCategory.console);
    if (!context.mounted) return;
    if (hasAccess) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) =>
            const SubscriptionPage(category: SubscriptionCategory.console),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.consoleTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _tile(
            context,
            icon: Icons.grid_view,
            title: loc.consolePatchTitle,
            subtitle: loc.consolePatchSubtitle,
            page: const PatchHomePage(),
          ),
          const SizedBox(height: 12),
          _tile(
            context,
            icon: Icons.extension,
            title: loc.consoleGdtfTitle,
            subtitle: loc.consoleGdtfSubtitle,
            page: const GdtfBuilderSimplePage(),
          ),
        ],
      ),
    );
  }

  Widget _tile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget page,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.amber.withValues(alpha: 0.5)),
              ),
              child: const Text(
                'PRO',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
        onTap: () => _openOrSubscribe(context, page),
      ),
    );
  }
}
