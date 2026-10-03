import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

import '../constants.dart';

/// =======================
/// FORMATTERS
/// =======================

/// Entiers stricts (univers, adresse, canaux, etc.)
final TextInputFormatter intFormatter =
    FilteringTextInputFormatter.digitsOnly;

/// Décimal robuste :
/// - chiffres
/// - un seul séparateur décimal ('.' ou ',')
/// - PAS de signe
/// - PAS d’exposant
final TextInputFormatter numFormatter = TextInputFormatter.withFunction(
  (oldValue, newValue) {
    final text = newValue.text;

    // Champ vide = autorisé
    if (text.isEmpty) return newValue;

    // Autorise uniquement chiffres + '.' + ','
    if (!RegExp(r'^[0-9.,]+$').hasMatch(text)) {
      return oldValue;
    }

    // Un seul séparateur décimal maximum
    final dotCount = '.'.allMatches(text).length;
    final commaCount = ','.allMatches(text).length;
    if (dotCount + commaCount > 1) {
      return oldValue;
    }

    return newValue;
  },
);

/// =======================
/// UI WIDGETS
/// =======================

/// Décor commun des cartes de section : léger dégradé teinté par la
/// couleur de la section + bordure douce.
BoxDecoration _cardDecoration(Color accent) => BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.lerp(const Color(0xFF161622), accent, 0.07)!,
          const Color(0xFF13131D),
        ],
      ),
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: accent.withValues(alpha: 0.16)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.25),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    );

/// Titre de carte : icône dans une pastille colorée + intitulé.
class _CardTitle extends StatelessWidget {
  const _CardTitle({
    required this.icon,
    required this.title,
    required this.accent,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Color accent;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                accent.withValues(alpha: 0.30),
                accent.withValues(alpha: 0.12),
              ],
            ),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, color: accent, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.1,
            ),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final Widget? trailing;

  /// Couleur de la section (pastille d'icône, teinte de la carte).
  final Color accentColor;

  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    this.trailing,
    this.accentColor = kSectionReferences,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration(accentColor),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CardTitle(
              icon: icon,
              title: title,
              accent: accentColor,
              trailing: trailing,
            ),
            const SizedBox(height: 14),
            child,
          ],
        ),
      ),
    );
  }
}

class ExpandSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final bool initiallyExpanded;
  final Widget? trailing;

  /// Couleur de la section (pastille d'icône, flèche, teinte de la carte).
  final Color accentColor;

  const ExpandSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    this.initiallyExpanded = false,
    this.trailing,
    this.accentColor = kSectionReferences,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration(accentColor),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: accentColor.withValues(alpha: 0.10),
          highlightColor: accentColor.withValues(alpha: 0.05),
        ),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          iconColor: accentColor,
          collapsedIconColor: Colors.white38,
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          childrenPadding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          title: _CardTitle(
            icon: icon,
            title: title,
            accent: accentColor,
            trailing: trailing,
          ),
          children: [child],
        ),
      ),
    );
  }
}

class ResultBox extends StatelessWidget {
  final String text;
  const ResultBox(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final t = text.trimLeft();
    final isEmpty = text.trim().isEmpty;
    final isError = t.startsWith('❌');
    final isWarning = t.startsWith('⚠');
    final isSuccess = !isError && !isWarning && text.contains('✅');

    final Color tint = isError
        ? const Color(0xFFFF5252)
        : isWarning
            ? const Color(0xFFFFB703)
            : isSuccess
                ? const Color(0xFF2DC653)
                : Colors.white;

    final box = Container(
      key: ValueKey(text),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            tint.withValues(alpha: tint == Colors.white ? 0.04 : 0.11),
            const Color(0xFF0E0E18),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: tint.withValues(alpha: tint == Colors.white ? 0.10 : 0.40),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 13.5,
          height: 1.45,
          fontWeight: FontWeight.w500,
          color: isError
              ? const Color(0xFFFF6B6B)
              : Colors.white.withValues(alpha: 0.94),
        ),
      ),
    );

    // Apparition "pop" à chaque nouveau résultat.
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 260),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, anim) => FadeTransition(
        opacity: anim,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.96, end: 1).animate(anim),
          child: child,
        ),
      ),
      child: isEmpty ? const SizedBox.shrink(key: ValueKey('empty')) : box,
    );
  }
}

class MiniPill extends StatelessWidget {
  final String label;
  const MiniPill(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// =======================
/// UTILS
/// =======================

Future<void> copyToClipboard(BuildContext context, String text) async {
  final t = text.trim();
  if (t.isEmpty) return;

  await Clipboard.setData(ClipboardData(text: t));
  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(AppLocalizations.of(context).commonCopied)),
  );
}
