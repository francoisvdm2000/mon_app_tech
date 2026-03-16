import 'package:flutter/material.dart';

import '../../app/ui/widgets.dart'; // SectionCard, MiniPill, copyToClipboard
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import 'about_favorites.dart';

class AboutIpBasicsPage extends StatefulWidget {
  const AboutIpBasicsPage({super.key});

  @override
  State<AboutIpBasicsPage> createState() => _AboutIpBasicsPageState();
}

class _AboutIpBasicsPageState extends State<AboutIpBasicsPage> {
  final _scrollCtrl = ScrollController();

  // Sections (sommaire interne -> scroll)
  final _k1WhatIsIp = GlobalKey();
  final _k2PrivateRanges = GlobalKey();
  final _k3MaskSubnet = GlobalKey();
  final _k4GatewayDnsDhcp = GlobalKey();
  final _k5HowDevicesTalk = GlobalKey();
  final _k6CommonShowPlans = GlobalKey();
  final _k7Troubleshooting = GlobalKey();
  final _k8MiniExercises = GlobalKey();
  final _k9Checklist = GlobalKey();

  void _goTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      alignment: 0.02,
    );
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final bottom = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.ipBasicsPageTitle),
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          controller: _scrollCtrl,
          padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottom),
          child: Column(
            children: [
              _TocCard(
                pageId: 'ip_basics',
                onCopy: () {
                  final txt = [
                    loc.ipBasicsMemo1,
                    loc.ipBasicsMemo2,
                    loc.ipBasicsMemo3,
                    loc.ipBasicsMemo4,
                    loc.ipBasicsMemo5,
                  ].join('\n');
                  copyToClipboard(context, txt);
                },
                items: [
                  _TocItem('what_is_ip', loc.ipBasicsToc1, onTap: () => _goTo(_k1WhatIsIp)),
                  _TocItem('private_ranges', loc.ipBasicsToc2,
                      onTap: () => _goTo(_k2PrivateRanges)),
                  _TocItem('mask_subnet', loc.ipBasicsToc3, onTap: () => _goTo(_k3MaskSubnet)),
                  _TocItem('gateway_dns_dhcp', loc.ipBasicsToc4,
                      onTap: () => _goTo(_k4GatewayDnsDhcp)),
                  _TocItem('how_devices_talk', loc.ipBasicsToc5,
                      onTap: () => _goTo(_k5HowDevicesTalk)),
                  _TocItem('common_show_plans', loc.ipBasicsToc6,
                      onTap: () => _goTo(_k6CommonShowPlans)),
                  _TocItem('troubleshooting', loc.ipBasicsToc7,
                      onTap: () => _goTo(_k7Troubleshooting)),
                  _TocItem('mini_exercises', loc.ipBasicsToc8,
                      onTap: () => _goTo(_k8MiniExercises)),
                  _TocItem('checklist', loc.ipBasicsToc9, onTap: () => _goTo(_k9Checklist)),
                ],
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k1WhatIsIp),
              AboutSectionPin(
                pageId: 'ip_basics',
                sectionId: 'what_is_ip',
                child: const _Section1WhatIsIp(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k2PrivateRanges),
              AboutSectionPin(
                pageId: 'ip_basics',
                sectionId: 'private_ranges',
                child: const _Section2PrivateRanges(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k3MaskSubnet),
              AboutSectionPin(
                pageId: 'ip_basics',
                sectionId: 'mask_subnet',
                child: const _Section3MaskSubnet(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k4GatewayDnsDhcp),
              AboutSectionPin(
                pageId: 'ip_basics',
                sectionId: 'gateway_dns_dhcp',
                child: const _Section4GatewayDnsDhcp(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k5HowDevicesTalk),
              AboutSectionPin(
                pageId: 'ip_basics',
                sectionId: 'how_devices_talk',
                child: const _Section5HowDevicesTalk(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k6CommonShowPlans),
              AboutSectionPin(
                pageId: 'ip_basics',
                sectionId: 'common_show_plans',
                child: const _Section6CommonShowPlans(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k7Troubleshooting),
              AboutSectionPin(
                pageId: 'ip_basics',
                sectionId: 'troubleshooting',
                child: const _Section7Troubleshooting(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k8MiniExercises),
              AboutSectionPin(
                pageId: 'ip_basics',
                sectionId: 'mini_exercises',
                child: const _Section8MiniExercises(),
              ),
              const SizedBox(height: 12),
              _Anchor(key: _k9Checklist),
              AboutSectionPin(
                pageId: 'ip_basics',
                sectionId: 'checklist',
                child: _Section9Checklist(
                onCopy: () {
                  final txt = loc.ipBasicsChecklistCopy.trim();
                  copyToClipboard(context, txt);
                },
              ),
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
      icon: Icons.list_alt,
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
                          horizontal: 12, vertical: 12),
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
                          AboutPinButton(
                            pageId: pageId,
                            sectionId: it.sectionId,
                            dense: true,
                          ),
                          Icon(Icons.chevron_right,
                              color: Colors.white.withValues(alpha: 0.55)),
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
/// SECTIONS (inchangées)
/// =======================

class _Section1WhatIsIp extends StatelessWidget {
  const _Section1WhatIsIp();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.ipBasicsToc1,
      icon: Icons.language,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.ipBasicsSection1Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection1CalloutTitle,
            bullets: [
              loc.ipBasicsSection1Bullet1,
              loc.ipBasicsSection1Bullet2,
              loc.ipBasicsSection1Bullet3,
              loc.ipBasicsSection1Bullet4,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection1Subtitle),
          _BulletList(items: [
            loc.ipBasicsSection1SubBullet1,
            loc.ipBasicsSection1SubBullet2,
            loc.ipBasicsSection1SubBullet3,
            loc.ipBasicsSection1SubBullet4,
          ]),
        ],
      ),
    );
  }
}

class _Section2PrivateRanges extends StatelessWidget {
  const _Section2PrivateRanges();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.ipBasicsToc2,
      icon: Icons.shield,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.ipBasicsSection2Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection2CalloutTitle,
            bullets: [
              loc.ipBasicsSection2Bullet1,
              loc.ipBasicsSection2Bullet2,
              loc.ipBasicsSection2Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection2Subtitle1),
          _BulletList(items: [
            loc.ipBasicsSection2SubBullet1,
            loc.ipBasicsSection2SubBullet2,
            loc.ipBasicsSection2SubBullet3,
          ]),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection2Subtitle2),
          _BulletList(items: [
            loc.ipBasicsSection2SubBullet4,
            loc.ipBasicsSection2SubBullet5,
            loc.ipBasicsSection2SubBullet6,
            loc.ipBasicsSection2SubBullet7,
            loc.ipBasicsSection2SubBullet8,
            loc.ipBasicsSection2SubBullet9,
          ]),
        ],
      ),
    );
  }
}

class _Section3MaskSubnet extends StatelessWidget {
  const _Section3MaskSubnet();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.ipBasicsToc3,
      icon: Icons.grid_4x4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.ipBasicsSection3Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection3Callout1Title,
            bullets: [
              loc.ipBasicsSection3Bullet1,
              loc.ipBasicsSection3Bullet2,
              loc.ipBasicsSection3Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection3Callout2Title,
            bullets: [
              loc.ipBasicsSection3Bullet4,
              loc.ipBasicsSection3Bullet5,
              loc.ipBasicsSection3Bullet6,
              loc.ipBasicsSection3Bullet7,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection3Subtitle1),
          _BulletList(items: [
            loc.ipBasicsSection3SubBullet1,
            loc.ipBasicsSection3SubBullet2,
            loc.ipBasicsSection3SubBullet3,
            loc.ipBasicsSection3SubBullet4,
            loc.ipBasicsSection3SubBullet5,
          ]),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection3Subtitle2),
          _BulletList(items: [
            loc.ipBasicsSection3SubBullet6,
            loc.ipBasicsSection3SubBullet7,
            loc.ipBasicsSection3SubBullet8,
            loc.ipBasicsSection3SubBullet9,
          ]),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection3Callout3Title,
            bullets: [
              loc.ipBasicsSection3Bullet8,
              loc.ipBasicsSection3Bullet9,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section4GatewayDnsDhcp extends StatelessWidget {
  const _Section4GatewayDnsDhcp();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.ipBasicsToc4,
      icon: Icons.settings_ethernet,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.ipBasicsSection4Subtitle1),
          _BulletList(items: [
            loc.ipBasicsSection4SubBullet1,
            loc.ipBasicsSection4SubBullet2,
            loc.ipBasicsSection4SubBullet3,
          ]),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection4Subtitle2),
          _BulletList(items: [
            loc.ipBasicsSection4SubBullet4,
            loc.ipBasicsSection4SubBullet5,
            loc.ipBasicsSection4SubBullet6,
          ]),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection4Callout1Title,
            bullets: [
              loc.ipBasicsSection4Bullet1,
              loc.ipBasicsSection4Bullet2,
              loc.ipBasicsSection4Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection4Callout2Title,
            bullets: [
              loc.ipBasicsSection4Bullet4,
              loc.ipBasicsSection4Bullet5,
              loc.ipBasicsSection4Bullet6,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection4Subtitle3),
          _BulletList(items: [
            loc.ipBasicsSection4SubBullet7,
            loc.ipBasicsSection4SubBullet8,
          ]),
        ],
      ),
    );
  }
}

class _Section5HowDevicesTalk extends StatelessWidget {
  const _Section5HowDevicesTalk();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.ipBasicsToc5,
      icon: Icons.swap_horiz,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Paragraph(loc.ipBasicsSection5Paragraph),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection5Callout1Title,
            bullets: [
              loc.ipBasicsSection5Bullet1,
              loc.ipBasicsSection5Bullet2,
              loc.ipBasicsSection5Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection5Subtitle),
          _BulletList(items: [
            loc.ipBasicsSection5SubBullet1,
            loc.ipBasicsSection5SubBullet2,
            loc.ipBasicsSection5SubBullet3,
            loc.ipBasicsSection5SubBullet4,
          ]),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection5Callout2Title,
            bullets: [
              loc.ipBasicsSection5Bullet4,
              loc.ipBasicsSection5Bullet5,
              loc.ipBasicsSection5Bullet6,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section6CommonShowPlans extends StatelessWidget {
  const _Section6CommonShowPlans();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.ipBasicsToc6,
      icon: Icons.map,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.ipBasicsSection6Subtitle1),
          _CodeBox(text: loc.ipBasicsSection6Code1),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection6Callout1Title,
            bullets: [
              loc.ipBasicsSection6Bullet1,
              loc.ipBasicsSection6Bullet2,
              loc.ipBasicsSection6Bullet3,
            ],
          ),
          const SizedBox(height: 12),
          _Subtitle(loc.ipBasicsSection6Subtitle2),
          _CodeBox(text: loc.ipBasicsSection6Code2),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection6Callout2Title,
            bullets: [
              loc.ipBasicsSection6Bullet4,
              loc.ipBasicsSection6Bullet5,
            ],
          ),
          const SizedBox(height: 12),
          _Subtitle(loc.ipBasicsSection6Subtitle3),
          _CodeBox(text: loc.ipBasicsSection6Code3),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection6Callout3Title,
            bullets: [
              loc.ipBasicsSection6Bullet6,
              loc.ipBasicsSection6Bullet7,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section7Troubleshooting extends StatelessWidget {
  const _Section7Troubleshooting();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.ipBasicsToc7,
      icon: Icons.bug_report,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Callout(
            title: loc.ipBasicsSection7Callout1Title,
            bullets: [
              loc.ipBasicsSection7Bullet1,
              loc.ipBasicsSection7Bullet2,
              loc.ipBasicsSection7Bullet3,
              loc.ipBasicsSection7Bullet4,
              loc.ipBasicsSection7Bullet5,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection7Subtitle),
          _BulletList(items: [
            loc.ipBasicsSection7SubBullet1,
            loc.ipBasicsSection7SubBullet2,
            loc.ipBasicsSection7SubBullet3,
            loc.ipBasicsSection7SubBullet4,
            loc.ipBasicsSection7SubBullet5,
          ]),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection7Callout2Title,
            bullets: [
              loc.ipBasicsSection7Bullet6,
              loc.ipBasicsSection7Bullet7,
            ],
          ),
        ],
      ),
    );
  }
}

class _Section8MiniExercises extends StatelessWidget {
  const _Section8MiniExercises();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.ipBasicsToc8,
      icon: Icons.quiz,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Subtitle(loc.ipBasicsSection8Subtitle1),
          _BulletList(items: [
            loc.ipBasicsSection8SubBullet1,
            loc.ipBasicsSection8SubBullet2,
            loc.ipBasicsSection8SubBullet3,
          ]),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection8Subtitle2),
          _BulletList(items: [
            loc.ipBasicsSection8SubBullet4,
            loc.ipBasicsSection8SubBullet5,
            loc.ipBasicsSection8SubBullet6,
          ]),
          const SizedBox(height: 10),
          _Callout(
            title: loc.ipBasicsSection8CalloutTitle,
            bullets: [
              loc.ipBasicsSection8Bullet1,
              loc.ipBasicsSection8Bullet2,
              loc.ipBasicsSection8Bullet3,
            ],
          ),
          const SizedBox(height: 10),
          _Subtitle(loc.ipBasicsSection8Subtitle3),
          _BulletList(items: [
            loc.ipBasicsSection8SubBullet7,
            loc.ipBasicsSection8SubBullet8,
            loc.ipBasicsSection8SubBullet9,
          ]),
        ],
      ),
    );
  }
}

class _Section9Checklist extends StatelessWidget {
  const _Section9Checklist({required this.onCopy});
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return SectionCard(
      title: loc.ipBasicsToc9,
      icon: Icons.checklist,
      child: _Callout(
        title: loc.ipBasicsSection9CalloutTitle,
        bullets: [
          loc.ipBasicsSection9Bullet1,
          loc.ipBasicsSection9Bullet2,
          loc.ipBasicsSection9Bullet3,
          loc.ipBasicsSection9Bullet4,
          loc.ipBasicsSection9Bullet5,
          loc.ipBasicsSection9Bullet6,
        ],
      ),
    );
  }
}

/// =======================
/// FOOTER
/// =======================

class _FooterNote extends StatelessWidget {
  const _FooterNote();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Text(
      loc.ipBasicsFooterNote,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white38, fontSize: 12, height: 1.35),
    );
  }
}

/// =======================
/// SMALL UI HELPERS
/// =======================

class _Anchor extends StatelessWidget {
  const _Anchor({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox(height: 0);
}

class _Subtitle extends StatelessWidget {
  const _Subtitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.92),
        fontWeight: FontWeight.w900,
        fontSize: 14.5,
      ),
    );
  }
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

class _BulletList extends StatelessWidget {
  const _BulletList({required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (s) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '•  ',
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.80),
                        height: 1.35),
                  ),
                  Expanded(
                    child: Text(
                      s,
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.80),
                          height: 1.35,
                          fontSize: 13.5),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
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
                fontSize: 13.5),
          ),
          const SizedBox(height: 8),
          _BulletList(items: bullets),
        ],
      ),
    );
  }
}

/// Petit bloc monospaced “copiable” (style technique)
class _CodeBox extends StatelessWidget {
  const _CodeBox({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      padding: const EdgeInsets.all(12),
      child: Text(
        text.trimRight(),
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.88),
          fontFamily: 'monospace',
          height: 1.25,
          fontSize: 12.8,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
