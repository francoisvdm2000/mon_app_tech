import 'package:flutter/material.dart';

/// Carte « Le saviez-vous ? » affichée sous l'en-tête de l'accueil.
/// Non bloquante : se ferme d'une croix, s'ouvre d'un tap.
class HomeTipCard extends StatelessWidget {
  const HomeTipCard({
    super.key,
    required this.label,
    required this.sectionTitle,
    required this.text,
    required this.icon,
    required this.accentColor,
    required this.openLabel,
    required this.hideLabel,
    required this.onOpen,
    required this.onClose,
    required this.onHideForever,
  });

  final String label;
  final String sectionTitle;
  final String text;
  final IconData icon;
  final Color accentColor;
  final String openLabel;
  final String hideLabel;
  final VoidCallback onOpen;
  final VoidCallback onClose;
  final VoidCallback onHideForever;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onOpen,
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 12, 6, 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: accentColor.withValues(alpha: 0.08),
            border: Border.all(color: accentColor.withValues(alpha: 0.35)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Icon(icon, color: accentColor, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '💡 $label  ·  $sectionTitle',
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: accentColor,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          text,
                          style: TextStyle(
                            fontSize: 13.5,
                            height: 1.3,
                            color: Colors.white.withValues(alpha: 0.88),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onClose,
                    icon: const Icon(Icons.close_rounded, size: 18),
                    color: Colors.white54,
                    visualDensity: VisualDensity.compact,
                    tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: onHideForever,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white38,
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    child: Text(hideLabel),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: onOpen,
                    style: TextButton.styleFrom(foregroundColor: accentColor),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          openLabel,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.arrow_forward_rounded, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
