import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/constants.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_page.dart';
import 'mentions_page.dart';
import 'lumiere_page.dart';
import 'laser_page.dart';
import 'video/video_page.dart';
import 'tools/bpm_page.dart';
import 'laser/laser_consent_dialog.dart';
import 'settings_page.dart';
import 'package:url_launcher/url_launcher.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  // --- Contact & contribution catalogue --
  static const String _kContactEmail = 'info@openwhite.eu';
  static const String _kCatalogFormUrl = 'https://forms.gle/ymhsrLXyZioCoqUa6';

  Future<void> _contactEmail(BuildContext context) async {
    final uri = Uri(
      scheme: 'mailto',
      path: _kContactEmail,
      queryParameters: {
        'subject': AppLocalizations.of(context).homeContactEmailSubject,
      },
    );

    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context).homeErrorOpenEmail)),
      );
    }
  }

  Future<void> _openGoogleForm(BuildContext context) async {
    final uri = Uri.parse(_kCatalogFormUrl);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).homeErrorOpenForm)),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkDisclaimerOnStart();
  }

  Future<void> _checkDisclaimerOnStart() async {
    final prefs = await SharedPreferences.getInstance();
    final accepted = prefs.getBool(kPrefDisclaimerAccepted) ?? false;
    if (!accepted) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _showDisclaimerDialog(),
      );
    }
  }

  Future<void> _acceptDisclaimer() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(kPrefDisclaimerAccepted, true);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> _resetConsents() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(kPrefDisclaimerAccepted);
    if (!mounted) return;

    final loc = AppLocalizations.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(loc.consentsReset)),
    );

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _showDisclaimerDialog(),
    );
  }

  void _showDisclaimerDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        bool checked = false;

        return StatefulBuilder(
          builder: (context, setStateDialog) {
            final loc = AppLocalizations.of(context);

            return AlertDialog(
              backgroundColor: const Color(0xFF111111),
              title: Text(loc.disclaimerTitle),
              content: SizedBox(
                width: double.maxFinite,
                height: 420,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          loc.disclaimerText,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    CheckboxListTile(
                      value: checked,
                      onChanged: (v) =>
                          setStateDialog(() => checked = v ?? false),
                      title: Text(
                        loc.disclaimerCertify,
                        style: const TextStyle(fontSize: 13),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.white,
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: checked ? _acceptDisclaimer : null,
                  child: Text(loc.disclaimerAccept),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _goToLaserWithConsent() async {
    if (!mounted) return;

    final accepted = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return LaserConsentDialog(
          onAccepted: () async {
            // consentement affiché à chaque entrée -> rien à stocker
          },
        );
      },
    );

    if (accepted == true && mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LaserPage()));
    }
  }

  void _push(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  Widget _homeTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.white),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.70),
                  height: 1.25,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(loc.homeTitle)),
      drawer: Drawer(
        backgroundColor: const Color(0xFF111111),
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                loc.menuTitle,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(loc.settings),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                _push(const PageSettings());
              },
            ),
            ListTile(
              title: Text(loc.legalNotices),
              leading: const Icon(Icons.gavel),
              onTap: () {
                Navigator.pop(context);
                _push(const PageMentionsLegales());
              },
            ),
            ListTile(
              title: Text(loc.resetConsents),
              leading: const Icon(Icons.refresh),
              onTap: () {
                Navigator.pop(context);
                _resetConsents();
              },
            ),
            const Divider(),
            ListTile(
              title: Text(loc.homeDrawerContact),
              leading: const Icon(Icons.mail_outline),
              onTap: () async {
                Navigator.pop(context);
                await _contactEmail(context);
              },
            ),
            ListTile(
              title: Text(loc.homeDrawerSuggestItem),
              leading: const Icon(Icons.playlist_add),
              onTap: () async {
                Navigator.pop(context);
                await _openGoogleForm(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _homeTile(
                icon: Icons.video_settings,
                title: loc.homeVideoTitle,
                subtitle: loc.homeVideoSubtitle,
                onTap: () => _push(const PageVideo()),
              ),
              const SizedBox(height: 12),
              _homeTile(
                icon: Icons.lightbulb_outline,
                title: loc.homeLightTitle,
                subtitle: loc.homeLightSubtitle,
                onTap: () => _push(const PageLumiere()),
              ),
              const SizedBox(height: 12),
              _homeTile(
                icon: Icons.center_focus_strong,
                title: loc.homeLaserTitle,
                subtitle: loc.homeLaserSubtitle,
                onTap: _goToLaserWithConsent,
              ),
              const SizedBox(height: 12),
              _homeTile(
                icon: Icons.speed,
                title: loc.homeBpmTitle,
                subtitle: loc.homeBpmSubtitle,
                onTap: () => _push(const BpmPage()),
              ),
              const SizedBox(height: 12),
              _homeTile(
                icon: Icons.menu_book,
                title: loc.homeReferencesTitle,
                subtitle: loc.homeReferencesSubtitle,
                onTap: () => _push(const PageAbout()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
