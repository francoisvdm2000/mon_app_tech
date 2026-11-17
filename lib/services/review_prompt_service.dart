import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'meta_analytics_service.dart';

/// Demande d'avis (fenêtre native App Store / Google Play) au bon moment :
/// juste après une réussite (export PDF, GDTF généré, sauvegarde partagée…).
///
/// Garde-fous :
/// - au moins [_minSuccesses] réussites cumulées ;
/// - au moins [_minAge] depuis la première ouverture de l'app ;
/// - pas plus d'une demande tous les [_cooldown].
/// Apple et Google appliquent en plus leurs propres quotas
/// (la fenêtre peut ne pas s'afficher : c'est normal).
class ReviewPromptService {
  ReviewPromptService._();

  static const _kFirstSeen = 'review_first_seen_ms';
  static const _kSuccessCount = 'review_success_count';
  static const _kLastAsked = 'review_last_asked_ms';

  static const int _minSuccesses = 3;
  static const Duration _minAge = Duration(days: 3);
  static const Duration _cooldown = Duration(days: 120);

  /// À appeler au démarrage : mémorise la date de première ouverture.
  static Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getInt(_kFirstSeen) == null) {
        await prefs.setInt(
            _kFirstSeen, DateTime.now().millisecondsSinceEpoch);
      }
    } catch (_) {}
  }

  /// À appeler juste après une action réussie de l'utilisateur.
  static Future<void> onSuccess() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final now = DateTime.now().millisecondsSinceEpoch;

      final firstSeen = prefs.getInt(_kFirstSeen) ?? now;
      if (prefs.getInt(_kFirstSeen) == null) {
        await prefs.setInt(_kFirstSeen, now);
      }

      final count = (prefs.getInt(_kSuccessCount) ?? 0) + 1;
      await prefs.setInt(_kSuccessCount, count);

      if (count < _minSuccesses) return;
      if (now - firstSeen < _minAge.inMilliseconds) return;
      final lastAsked = prefs.getInt(_kLastAsked);
      if (lastAsked != null && now - lastAsked < _cooldown.inMilliseconds) {
        return;
      }

      final review = InAppReview.instance;
      if (!await review.isAvailable()) return;

      await prefs.setInt(_kLastAsked, now);
      // Petit délai : laisser se refermer la feuille de partage / l'aperçu.
      await Future<void>.delayed(const Duration(milliseconds: 800));
      await review.requestReview();
      MetaAnalyticsService.logCustom('review_prompt_requested');
    } catch (_) {
      // Ne jamais gêner l'utilisateur pour une demande d'avis.
    }
  }
}
