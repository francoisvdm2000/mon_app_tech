import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../services/subscription_service.dart';
import '../subscription_page.dart';

const _kAccent = Color(0xFF00E5FF);
const _kPro = Color(0xFFFFB300);
const _kBg = Color(0xFF0D0D14);
const _kCard = Color(0xFF161622);

/// Un outil réseau affiché dans une rubrique.
class NetworkToolEntry {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool pro;
  final Widget Function() builder;

  const NetworkToolEntry({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.pro,
    required this.builder,
  });
}

/// Sous-page d'une rubrique Réseau : outils gratuits, puis outils Pro avec un
/// seul bandeau « Débloquer » quand l'abonnement manque.
class NetworkCategoryPage extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final List<NetworkToolEntry> tools;

  const NetworkCategoryPage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.tools,
  });

  @override
  State<NetworkCategoryPage> createState() => _NetworkCategoryPageState();
}

class _NetworkCategoryPageState extends State<NetworkCategoryPage> {
  bool _hasPremium = false;

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final ok =
        await SubscriptionService.hasAccess(SubscriptionCategory.network);
    if (mounted) setState(() => _hasPremium = ok);
  }

  Future<void> _goToSubscription() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const SubscriptionPage(category: SubscriptionCategory.network),
      ),
    );
    _checkAccess();
  }

  void _open(NetworkToolEntry tool) {
    if (tool.pro && !_hasPremium) {
      _goToSubscription();
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => tool.builder()));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final free = widget.tools.where((t) => !t.pro).toList();
    final pro = widget.tools.where((t) => t.pro).toList();

    return Scaffold(
      backgroundColor: _kBg,
      appBar: AppBar(
        backgroundColor: _kBg,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
              16, 14, 16, 24 + MediaQuery.paddingOf(context).bottom),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(widget.icon, color: _kAccent, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.45,
                      color: Colors.white.withValues(alpha: 0.65),
                    ),
                  ),
                ),
              ],
            ),
            if (free.isNotEmpty) ...[
              _Header(text: loc.rfFreeLabel, color: const Color(0xFF00C853)),
              for (final t in free) _ToolRow(tool: t, onTap: () => _open(t)),
            ],
            if (pro.isNotEmpty) ...[
              _Header(text: loc.subscriptionProShort, color: _kPro),
              if (!_hasPremium)
                _UnlockBanner(
                  title: loc.netProUnlockTitle,
                  description: loc.netProUnlockDesc,
                  onTap: _goToSubscription,
                ),
              for (final t in pro)
                _ToolRow(
                  tool: t,
                  locked: !_hasPremium,
                  onTap: () => _open(t),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String text;
  final Color color;
  const _Header({required this.text, required this.color});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(2, 22, 2, 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: color.withValues(alpha: 0.45)),
              ),
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: color,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Divider(
                  color: Colors.white.withValues(alpha: 0.10), height: 1),
            ),
          ],
        ),
      );
}

class _UnlockBanner extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const _UnlockBanner({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Material(
          color: _kPro.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: _kPro.withValues(alpha: 0.40)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lock_open_rounded, color: _kPro),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: _kPro,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.35,
                            color: Colors.white.withValues(alpha: 0.60),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded, color: _kPro),
                ],
              ),
            ),
          ),
        ),
      );
}

class _ToolRow extends StatelessWidget {
  final NetworkToolEntry tool;
  final VoidCallback onTap;
  final bool locked;

  const _ToolRow({required this.tool, required this.onTap, this.locked = false});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Material(
          color: _kCard,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            splashColor: _kAccent.withValues(alpha: 0.08),
            child: Container(
              padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withValues(alpha: 0.07)),
              ),
              child: Opacity(
                opacity: locked ? 0.55 : 1,
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: _kAccent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(tool.icon, color: _kAccent, size: 22),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tool.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            tool.subtitle,
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.35,
                              color: Colors.white.withValues(alpha: 0.50),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      locked ? Icons.lock_rounded : Icons.chevron_right_rounded,
                      color: locked
                          ? _kPro.withValues(alpha: 0.8)
                          : _kAccent.withValues(alpha: 0.55),
                      size: locked ? 18 : 22,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
