import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/constants.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'shared/app_grid_tile.dart';
import 'shared/app_view_mode.dart';
import 'shared/drawer_account_card.dart';
import 'about_page.dart';
import 'mentions_page.dart';
import 'lumiere_page.dart';
import 'laser_page.dart';
import 'video/video_page.dart';
import 'console/console_page.dart';
import 'cinema/cinema_tools_page_full.dart';
import 'electricity/electricity_page.dart';
import 'rigging/rigging_page.dart';
import 'tools/bpm_page.dart';
import 'laser/laser_consent_dialog.dart';
import 'settings_page.dart';
import 'about/pinned_references_page.dart';
import 'subscription_page.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../services/subscription_service.dart';
import '../services/purchase_verification_service.dart';
import 'conversions/conversions_page.dart';
import 'audio/audio_page.dart';
import 'rf/rf_page.dart';
import 'network/network_page.dart';
import 'timecode/timecode_page.dart';
import 'safety/safety_page.dart';

// ─── Couleurs d'accent par catégorie ───────────────────────────────────────
const _kColorVideo        = Color(0xFF00B4D8);
const _kColorLight        = Color(0xFFFFB703);
const _kColorLaser        = Color(0xFFDA77FF);
const _kColorConsole      = Color(0xFF4CC9F0);
const _kColorCinema       = Color(0xFFFF6B6B);
const _kColorElectricity  = Color(0xFFFF9F1C);
const _kColorRigging      = Color(0xFF2DC653);
const _kColorConversions  = Color(0xFF06D6A0);
const _kColorAudio        = Color(0xFF00E5FF);
const _kColorRf           = Color(0xFF9C27B0);
const _kColorNetwork      = Color(0xFF00E5FF);
const _kColorBpm          = Color(0xFFF72585);
const _kColorReferences   = Color(0xFF7B8CDE);
const _kColorPinned       = Color(0xFFFF7C38);
const _kColorTimecode     = Color(0xFF5E60CE);
const _kColorSafety       = Color(0xFFF5A524);

// ─── Couleurs de fond ───────────────────────────────────────────────────────
const _kBgPage   = Color(0xFF0D0D14);
const _kBgDrawer = Color(0xFF0F0F1A);

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  static const String _kContactEmail  = 'showtechtools@openwhite.eu';
  static const String _kCatalogFormUrl = 'https://forms.gle/ymhsrLXyZioCoqUa6';

  String _appVersion = '';

  @override
  void initState() {
    super.initState();
    _checkDisclaimerOnStart();
    _loadAppVersion();
    _restorePurchases();
  }

  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (!mounted) return;

    final loc = AppLocalizations.of(context);

    final version = info.version.trim();
    final build   = info.buildNumber.trim();

    setState(() {
      if (build.isNotEmpty) {
        _appVersion = loc.appVersionLabel(version, build);
      } else {
        _appVersion = loc.appVersionLabelNoBuild(version);
      }
    });
  }

  Future<void> _restorePurchases() async {
    final iap = InAppPurchase.instance;

    // 🔁 écoute les restaurations (bouton + auto)
    iap.purchaseStream.listen((purchases) async {
      for (final purchase in purchases) {
        // ⚠️ Ne débloquer l'accès que sur un achat confirmé ou restauré.
        // Un statut pending/error/canceled ne doit jamais donner accès.
        final isGranted = purchase.status == PurchaseStatus.purchased ||
            purchase.status == PurchaseStatus.restored;

        if (isGranted) {
          final category =
              SubscriptionService.categoryFromProductId(purchase.productID);
          if (category != null) {
            // Revérification serveur obligatoire — le statut local du SDK
            // ne suffit jamais à lui seul à débloquer l'accès.
            await PurchaseVerificationService.verify(purchase);
          }
        }

        if (purchase.pendingCompletePurchase) {
          await iap.completePurchase(purchase);
        }
      }
    });

    try {
      // iOS
      await iap.restorePurchases();
    } catch (_) {}
  }

  Future<void> _contactEmail(BuildContext context) async {
    final loc = AppLocalizations.of(context);

    final uri = Uri(
      scheme: 'mailto',
      path: _kContactEmail,
      queryParameters: {
        'subject': loc.homeContactEmailSubject,
      },
    );

    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.homeErrorOpenEmail)),
      );
    }
  }

  Future<void> _openGoogleForm(BuildContext context) async {
    final loc = AppLocalizations.of(context);

    final uri = Uri.parse(_kCatalogFormUrl);
    final ok  = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.homeErrorOpenForm)),
      );
    }
  }

  Future<void> _checkDisclaimerOnStart() async {
    final prefs   = await SharedPreferences.getInstance();
    final accepted = prefs.getBool(kPrefDisclaimerAccepted) ?? false;
    if (!accepted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showDisclaimerDialog();
      });
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDisclaimerDialog();
    });
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
              backgroundColor: const Color(0xFF161622),
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
                      onChanged: (v) {
                        setStateDialog(() {
                          checked = v ?? false;
                        });
                      },
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
          onAccepted: () async {},
        );
      },
    );

    if (accepted == true && mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => LaserPage()),
      );
    }
  }

  void _push(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  // ─── En-tête de bienvenue (heure du jour + tagline) ────────────────────────
  Widget _greetingHeader(AppLocalizations loc) {
    final hour = DateTime.now().hour;
    final greeting = hour < 12
        ? loc.homeGreetingMorning
        : hour < 18
            ? loc.homeGreetingAfternoon
            : loc.homeGreetingEvening;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFFB703).withValues(alpha: 0.14),
            const Color(0xFF00E5FF).withValues(alpha: 0.08),
          ],
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$greeting 👋',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: 0.1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            loc.homeGreetingTagline,
            style: TextStyle(
              fontSize: 12.5,
              color: Colors.white.withValues(alpha: 0.60),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Tile de la grille d'accueil (icône + nom) ─────────────────────────────
  Widget _homeTile({
    IconData?              icon,
    required String       title,
    required String       subtitle,
    required VoidCallback onTap,
    required Color        accentColor,
    bool                  locked = false,
    String?               imageAsset,
  }) {
    return AppGridTile(
      icon: icon,
      imageAsset: imageAsset,
      label: title,
      subtitle: subtitle,
      accentColor: accentColor,
      onTap: onTap,
      locked: locked,
    );
  }

  // ─── Drawer item helper ────────────────────────────────────────────────────
  Widget _drawerTile({
    required IconData icon,
    required String   label,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    final color = iconColor ?? Colors.white70;
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: color, size: 18),
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      minLeadingWidth: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc    = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      backgroundColor: _kBgPage,

      // ─── AppBar ───────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: _kBgPage,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          loc.homeTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            letterSpacing: 0.2,
            color: Colors.white,
          ),
        ),
        // Bascule cases / lignes : un seul bouton, ici, pour toute l'app
        // (accueil + menus de toutes les sections).
        actions: const [AppViewModeButton(), SizedBox(width: 4)],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: Colors.white.withValues(alpha: 0.08),
          ),
        ),
      ),

      // ─── Drawer ───────────────────────────────────────────────────────────
      drawer: Drawer(
        backgroundColor: _kBgDrawer,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // En-tête
            Container(
              padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
              decoration: BoxDecoration(
                color: _kBgDrawer,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withValues(alpha: 0.08),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo / icône app
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/tool_icons/logo_principal.png',
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    loc.menuTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                  if (_appVersion.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      _appVersion,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Compte (connexion Google / profil)
            const DrawerAccountCard(),

            const SizedBox(height: 8),

            _drawerTile(
              icon: Icons.workspace_premium_rounded,
              label: loc.homeDrawerSubscriptions,
              iconColor: _kColorBpm,
              onTap: () {
                Navigator.pop(context);
                _push(const SubscriptionPage());
              },
            ),
            _drawerTile(
              icon: Icons.settings_rounded,
              label: loc.settings,
              iconColor: Colors.white54,
              onTap: () {
                Navigator.pop(context);
                _push(const PageSettings());
              },
            ),
            _drawerTile(
              icon: Icons.gavel_rounded,
              label: loc.legalNotices,
              iconColor: Colors.white54,
              onTap: () {
                Navigator.pop(context);
                _push(const PageMentionsLegales());
              },
            ),
            _drawerTile(
              icon: Icons.refresh_rounded,
              label: loc.resetConsents,
              iconColor: Colors.white54,
              onTap: () {
                Navigator.pop(context);
                _resetConsents();
              },
            ),

            Divider(
              color: Colors.white.withValues(alpha: 0.08),
              indent: 16,
              endIndent: 16,
              height: 24,
            ),

            _drawerTile(
              icon: Icons.mail_outline_rounded,
              label: loc.homeDrawerContact,
              iconColor: _kColorConversions,
              onTap: () async {
                Navigator.pop(context);
                await _contactEmail(context);
              },
            ),
            _drawerTile(
              icon: Icons.playlist_add_rounded,
              label: loc.homeDrawerSuggestItem,
              iconColor: _kColorConversions,
              onTap: () async {
                Navigator.pop(context);
                await _openGoogleForm(context);
              },
            ),

            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/icon/openwhite_logo.jpg',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Créé par François Vandermeeren pour Open White',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white.withValues(alpha: 0.35),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ─── Body ─────────────────────────────────────────────────────────────
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _greetingHeader(loc),
              const SizedBox(height: 16),
              AppGridView(
                children: [
              _homeTile(
                icon: Icons.video_settings_rounded,
                title: loc.homeVideoTitle,
                subtitle: loc.homeVideoSubtitle,
                accentColor: _kColorVideo,
                onTap: () => _push(const PageVideo()),
              ),
              _homeTile(
                icon: Icons.lightbulb_outline_rounded,
                title: loc.homeLightTitle,
                subtitle: loc.homeLightSubtitle,
                accentColor: _kColorLight,
                onTap: () => _push(const PageLumiere()),
              ),
              _homeTile(
                icon: Icons.center_focus_strong_rounded,
                title: loc.homeLaserTitle,
                subtitle: loc.homeLaserSubtitle,
                accentColor: _kColorLaser,
                onTap: _goToLaserWithConsent,
              ),
              _homeTile(
                imageAsset: 'assets/tool_icons/icone_ma3.png',
                title: loc.consoleTitle,
                subtitle: loc.consoleSubtitle,
                accentColor: _kColorConsole,
                onTap: () => _push(const ConsolePage()),
              ),
              _homeTile(
                imageAsset: 'assets/tool_icons/icone_audio.png',
                title: loc.audioHomeTitle,
                subtitle: loc.audioHomeSubtitle,
                accentColor: _kColorAudio,
                onTap: () => _push(const AudioPage()),
              ),
              _homeTile(
                icon: Icons.settings_input_antenna_rounded,
                title: loc.homeRfTitle,
                subtitle: loc.homeRfSubtitle,
                accentColor: _kColorRf,
                onTap: () => _push(const RfPage()),
              ),
              _homeTile(
                imageAsset: 'assets/tool_icons/icone_reseaux_luminex.png',
                title: loc.homeNetworkTitle,
                subtitle: loc.homeNetworkSubtitle,
                accentColor: _kColorNetwork,
                onTap: () => _push(const NetworkPage()),
              ),
              _homeTile(
                imageAsset: 'assets/tool_icons/icone_cinema.png',
                title: loc.homeCinemaTitle,
                subtitle: loc.homeCinemaSubtitle,
                accentColor: _kColorCinema,
                onTap: () => _push(const CinemaToolsPage()),
              ),
              _homeTile(
                imageAsset: 'assets/tool_icons/icone_electricite.png',
                title: loc.homeElectricityTitle,
                subtitle: loc.homeElectricitySubtitle,
                accentColor: _kColorElectricity,
                onTap: () => _push(const ElectricityPage()),
              ),
              _homeTile(
                icon: Icons.hardware_rounded,
                title: loc.homeRiggingTitle,
                subtitle: loc.homeRiggingSubtitle,
                accentColor: _kColorRigging,
                onTap: () => _push(const RiggingPage()),
              ),
              _homeTile(
                icon: Icons.health_and_safety_rounded,
                title: loc.homeSafetyTitle,
                subtitle: loc.homeSafetySubtitle,
                accentColor: _kColorSafety,
                onTap: () => _push(const SafetyPage()),
              ),
              _homeTile(
                imageAsset: 'assets/tool_icons/icone_conversion.png',
                title: loc.homeConversionsTitle,
                subtitle: loc.homeConversionsSubtitle,
                accentColor: _kColorConversions,
                onTap: () => _push(const ConversionsPage()),
              ),
              _homeTile(
                icon: Icons.speed_rounded,
                title: loc.homeBpmTitle,
                subtitle: loc.homeBpmSubtitle,
                accentColor: _kColorBpm,
                onTap: () => _push(const BpmPage()),
              ),
              _homeTile(
                icon: Icons.schedule_rounded,
                title: loc.homeTimecodeTitle,
                subtitle: loc.homeTimecodeSubtitle,
                accentColor: _kColorTimecode,
                onTap: () => _push(const TimecodeHubPage()),
              ),
              _homeTile(
                icon: Icons.menu_book_rounded,
                title: loc.homeReferencesTitle,
                subtitle: loc.homeReferencesSubtitle,
                accentColor: _kColorReferences,
                onTap: () => _push(const PageAbout()),
              ),
              _homeTile(
                icon: Icons.push_pin_rounded,
                title: loc.homePinnedTitle,
                subtitle: loc.homePinnedSubtitle,
                accentColor: _kColorPinned,
                onTap: () => _push(const PinnedReferencesPage()),
              ),
                ],
              ), // AppGridView
            ],
          ),
        ),
      ),
    );
  }
}
