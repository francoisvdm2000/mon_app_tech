import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';

class AboutInformatiquePage extends StatefulWidget {
  const AboutInformatiquePage({super.key});

  @override
  State<AboutInformatiquePage> createState() => _AboutInformatiquePageState();
}

class _AboutInformatiquePageState extends State<AboutInformatiquePage> {
  final _scroll = ScrollController();

  final _kUsb = GlobalKey();
  final _kStorage = GlobalKey();
  final _kVideo = GlobalKey();
  final _kPcie = GlobalKey();
  final _kChecklist = GlobalKey();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _goTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      alignment: 0.06,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text(loc.infoPageTitle)),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scroll,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'computing',
                onCopy: () {
                  final txt = loc.infoSummaryCopy.trim();
                  copyToClipboard(context, txt);
                },
                items: [
                  _TocItem('usb', loc.infoUsbTitle, onTap: () => _goTo(_kUsb)),
                  _TocItem('storage', 
                    loc.infoStorageTitle,
                    onTap: () => _goTo(_kStorage),
                  ),
                  _TocItem('video_links', 
                    loc.infoVideoLinksTitle,
                    onTap: () => _goTo(_kVideo),
                  ),
                  _TocItem('pcie_gpu', loc.infoPcieGpuTitle, onTap: () => _goTo(_kPcie)),
                  _TocItem('checklist', 
                    loc.infoChecklistTitle,
                    onTap: () => _goTo(_kChecklist),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _kUsb),
              const _Section1Usb(),
              const SizedBox(height: 12),
              _Anchor(key: _kStorage),
              const _Section2Storage(),
              const SizedBox(height: 12),
              _Anchor(key: _kVideo),
              const _Section3VideoLinks(),
              const SizedBox(height: 12),
              _Anchor(key: _kPcie),
              const _Section4PcieGpu(),
              const SizedBox(height: 12),
              _Anchor(key: _kChecklist),
              _Section5Checklist(
                onCopy: () {
                  final txt = loc.infoChecklistCopy.trim();
                  copyToClipboard(context, txt);
                },
              ),
              const SizedBox(height: 18),
              const _FooterNote(),
            ],
          ),
        ),
      ),
    );
  }
}

/// =======================
/// TOC
/// =======================

class _TocCard extends StatelessWidget {
  const _TocCard({
    required this.pageId,
    required this.items,
    required this.onCopy,
  });

  final String pageId;
  final List<_TocItem> items;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.commonTocTitle,
      icon: Icons.computer,
      child: Column(
        children: items
            .map(
              (it) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Material(
                  color: const Color(0xFF0B0B0B),
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: it.onTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              it.label,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.92),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white.withValues(alpha: 0.55),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TocItem {
  _TocItem(this.sectionId, this.label, {required this.onTap});
  final String sectionId;
  final String label;
  final VoidCallback onTap;
}

/// =======================
/// SECTION 1 — USB
/// =======================

class _Section1Usb extends StatelessWidget {
  const _Section1Usb();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'computing',
      sectionId: 'usb',
      child: SectionCard(
      title: loc.infoUsbTitle,
      icon: Icons.usb,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.infoUsbCriticalTitle,
            bullets: [
              loc.infoUsbCriticalBullet1,
              loc.infoUsbCriticalBullet2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.infoUsbSpeedTitle,
            bullets: [
              loc.infoUsbSpeedBullet1,
              loc.infoUsbSpeedBullet2,
              loc.infoUsbSpeedBullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Paragraph(loc.infoUsbParagraph),
        ],
      ),
    ),
    );
  }
}

/// =======================
/// SECTION 2 — STORAGE
/// =======================

class _Section2Storage extends StatelessWidget {
  const _Section2Storage();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'computing',
      sectionId: 'storage',
      child: SectionCard(
      title: loc.infoStorageTitle,
      icon: Icons.storage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.infoStorageSataNvmeTitle,
            bullets: [
              loc.infoStorageSataNvmeBullet1,
              loc.infoStorageSataNvmeBullet2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.infoStorageFieldTitle,
            bullets: [
              loc.infoStorageFieldBullet1,
              loc.infoStorageFieldBullet2,
              loc.infoStorageFieldBullet3,
            ],
          ),
        ],
      ),
    ),
    );
  }
}

/// =======================
/// SECTION 3 — VIDEO LINKS
/// =======================

class _Section3VideoLinks extends StatelessWidget {
  const _Section3VideoLinks();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'computing',
      sectionId: 'video_links',
      child: SectionCard(
      title: loc.infoVideoLinksTitle,
      icon: Icons.display_settings,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.infoVideoLinksImportantTitle,
            bullets: [
              loc.infoVideoLinksImportantBullet1,
              loc.infoVideoLinksImportantBullet2,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.infoVideoLinksCompareTitle,
            bullets: [
              loc.infoVideoLinksCompareBullet1,
              loc.infoVideoLinksCompareBullet2,
            ],
          ),
        ],
      ),
    ),
    );
  }
}

/// =======================
/// SECTION 4 — PCIE / GPU
/// =======================

class _Section4PcieGpu extends StatelessWidget {
  const _Section4PcieGpu();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'computing',
      sectionId: 'pcie_gpu',
      child: SectionCard(
      title: loc.infoPcieGpuTitle,
      icon: Icons.developer_board,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.infoPcieGpuParagraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.infoPcieGpuFieldTitle,
            bullets: [
              loc.infoPcieGpuFieldBullet1,
              loc.infoPcieGpuFieldBullet2,
              loc.infoPcieGpuFieldBullet3,
            ],
          ),
        ],
      ),
    ),
    );
  }
}

/// =======================
/// SECTION 5 — CHECKLIST
/// =======================

class _Section5Checklist extends StatelessWidget {
  const _Section5Checklist({required this.onCopy});
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AboutSectionPin(
      pageId: 'computing',
      sectionId: 'checklist',
      child: SectionCard(
      title: loc.infoChecklistTitle,
      icon: Icons.checklist,
      child: _Callout(
        title: loc.infoChecklistQuickTitle,
        bullets: [
          loc.infoChecklistBullet1,
          loc.infoChecklistBullet2,
          loc.infoChecklistBullet3,
          loc.infoChecklistBullet4,
          loc.infoChecklistBullet5,
        ],
      ),
    ),
    );
  }
}

/// =======================
/// HELPERS
/// =======================

class _Anchor extends StatelessWidget {
  const _Anchor({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox(height: 0);
}

class _Paragraph extends StatelessWidget {
  const _Paragraph(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.80),
        height: 1.35,
        fontSize: 13.5,
      ),
    );
  }
}

class _Callout extends StatelessWidget {
  const _Callout({required this.title, required this.bullets});
  final String title;
  final List<String> bullets;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.92),
              fontWeight: FontWeight.w900,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(height: 8),
          ...bullets.map((s) => _Bullet(s)),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•  ',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.80),
              height: 1.35,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.80),
                height: 1.35,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterNote extends StatelessWidget {
  const _FooterNote();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Text(
      loc.infoFooterNote,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white38, fontSize: 12, height: 1.35),
    );
  }
}
