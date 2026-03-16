import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class AboutPinnedRef {
  const AboutPinnedRef({
    required this.pageId,
    required this.sectionId,
  });

  final String pageId;
  final String sectionId;

  Map<String, dynamic> toJson() => {
        'pageId': pageId,
        'sectionId': sectionId,
      };

  static AboutPinnedRef fromJson(Map<String, dynamic> json) {
    return AboutPinnedRef(
      pageId: json['pageId'] as String? ?? '',
      sectionId: json['sectionId'] as String? ?? '',
    );
  }
}

class AboutFavoritesStore {
  static const String _prefsKey = 'about_pinned_references_v1';
  static final ValueNotifier<int> changes = ValueNotifier<int>(0);

  static Future<List<AboutPinnedRef>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_prefsKey) ?? const <String>[];
    return raw
        .map((e) {
          try {
            return AboutPinnedRef.fromJson(
              jsonDecode(e) as Map<String, dynamic>,
            );
          } catch (_) {
            return null;
          }
        })
        .whereType<AboutPinnedRef>()
        .toList();
  }

  static Future<bool> isPinned(String pageId, String sectionId) async {
    final items = await load();
    return items.any((e) => e.pageId == pageId && e.sectionId == sectionId);
  }

  static Future<void> toggle(String pageId, String sectionId) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await load();
    final index = items.indexWhere(
      (e) => e.pageId == pageId && e.sectionId == sectionId,
    );

    if (index >= 0) {
      items.removeAt(index);
    } else {
      items.add(AboutPinnedRef(pageId: pageId, sectionId: sectionId));
    }

    await prefs.setStringList(
      _prefsKey,
      items.map((e) => jsonEncode(e.toJson())).toList(),
    );
    changes.value++;
  }

  static Future<void> remove(String pageId, String sectionId) async {
    final prefs = await SharedPreferences.getInstance();
    final items = await load()
      ..removeWhere((e) => e.pageId == pageId && e.sectionId == sectionId);

    await prefs.setStringList(
      _prefsKey,
      items.map((e) => jsonEncode(e.toJson())).toList(),
    );
    changes.value++;
  }
}

class AboutPinButton extends StatefulWidget {
  const AboutPinButton({
    super.key,
    required this.pageId,
    required this.sectionId,
    this.dense = false,
  });

  final String pageId;
  final String sectionId;
  final bool dense;

  @override
  State<AboutPinButton> createState() => _AboutPinButtonState();
}

class _AboutPinButtonState extends State<AboutPinButton> {
  bool _isPinned = false;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    AboutFavoritesStore.changes.addListener(_onStoreChanged);
    _load();
  }

  void _onStoreChanged() {
    _load();
  }

  Future<void> _load() async {
    final pinned = await AboutFavoritesStore.isPinned(
      widget.pageId,
      widget.sectionId,
    );
    if (!mounted) return;
    setState(() {
      _isPinned = pinned;
      _loading = false;
    });
  }

  Future<void> _toggle() async {
    final loc = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);

    await AboutFavoritesStore.toggle(widget.pageId, widget.sectionId);
    final nowPinned = await AboutFavoritesStore.isPinned(
      widget.pageId,
      widget.sectionId,
    );

    if (!mounted) return;

    setState(() {
      _isPinned = nowPinned;
    });

    messenger.showSnackBar(
      SnackBar(
        content: Text(
          _isPinned ? loc.aboutPinAddedMessage : loc.aboutPinRemovedMessage,
        ),
      ),
    );
  }

  @override
  void dispose() {
    AboutFavoritesStore.changes.removeListener(_onStoreChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final double iconSize = widget.dense ? 18 : 22;
    final Color iconColor =
        _isPinned ? Colors.white : Colors.white.withValues(alpha: 0.78);

    return Semantics(
      button: true,
      label: _isPinned ? loc.aboutPinRemoveTooltip : loc.aboutPinAddTooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: _loading ? null : _toggle,
          child: Container(
            width: widget.dense ? 32 : 40,
            height: widget.dense ? 32 : 40,
            alignment: Alignment.center,
            child: Icon(
              _isPinned ? Icons.push_pin : Icons.push_pin_outlined,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}

class AboutSectionPin extends StatelessWidget {
  const AboutSectionPin({
    super.key,
    required this.pageId,
    required this.sectionId,
    required this.child,
  });

  final String pageId;
  final String sectionId;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: 10,
          right: 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: const Color(0xFF0B0B0B).withValues(alpha: 0.96),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.10),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: AboutPinButton(
              pageId: pageId,
              sectionId: sectionId,
              dense: true,
            ),
          ),
        ),
      ],
    );
  }
}
