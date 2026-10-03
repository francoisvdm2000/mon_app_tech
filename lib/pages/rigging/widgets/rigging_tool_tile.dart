import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../../shared/app_grid_tile.dart';

const _kAccent = Color(0xFF2DC653); // vert rigging

class RiggingToolTile extends StatelessWidget {
  const RiggingToolTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isPro = false,
    this.isFree = false,
    this.locked = false,
  });

  final IconData  icon;
  final String    title;
  final String    subtitle;
  final VoidCallback onTap;
  final bool      isPro;
  final bool      isFree;
  final bool      locked;

  @override
  Widget build(BuildContext context) {
    return AppGridTile(
      icon: icon,
      label: title,
      subtitle: subtitle,
      accentColor: _kAccent,
      locked: locked,
      badge: isFree
          ? AppLocalizations.of(context).free
          : (isPro ? AppLocalizations.of(context).pro : null),
      onTap: onTap,
    );
  }
}
