import 'package:flutter/material.dart';

/// Petite animation "pop" (échelle avec léger rebond + fondu) pour faire
/// apparaître un résultat de calcul de façon plus vivante dès qu'il
/// devient valide, plutôt que de le faire surgir brutalement.
///
/// Usage : englober le widget de résultat existant, en pilotant [show]
/// avec la même condition de nullité déjà utilisée pour l'afficher
/// (ex: `ResultReveal(show: rt60 != null, child: ...)`).
class ResultReveal extends StatelessWidget {
  const ResultReveal({super.key, required this.show, required this.child});

  final bool show;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 280),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: FadeTransition(opacity: animation, child: child),
      ),
      child: show
          ? KeyedSubtree(key: const ValueKey('result-visible'), child: child)
          : const SizedBox.shrink(key: ValueKey('result-empty')),
    );
  }
}
