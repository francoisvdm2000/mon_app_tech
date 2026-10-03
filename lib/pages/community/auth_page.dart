import 'package:flutter/material.dart';
import '../../l10n_gen/app_localizations.dart';
import '../../services/community_service.dart';
import '../../services/meta_analytics_service.dart';

/// Page de connexion Google + choix du pseudo (affiché la 1ère fois).
class AuthPage extends StatefulWidget {
  /// Par défaut : écran « Plugin Community ». Depuis le menu, on passe un
  /// titre / sous-titre / icône génériques « compte ».
  final String? title;
  final String? subtitle;
  final IconData icon;
  const AuthPage({
    super.key,
    this.title,
    this.subtitle,
    this.icon = Icons.extension_rounded,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _loading = false;
  String? _error;

  Future<void> _signIn() async {
    setState(() { _loading = true; _error = null; });
    try {
      final cred = await CommunityService.signInWithGoogle();
      if (!mounted) return;

      if (cred == null) {
        setState(() { _loading = false; _error = AppLocalizations.of(context).loginCancelled; });
        return;
      }

    // Vérifier si le profil existe déjà
    final profile = await CommunityService.getProfile(cred.user!.uid);
    if (!mounted) return;

    if (profile == null) {
      // Première connexion → choisir un pseudo
      final pseudo = await _askPseudo(cred.user!.displayName ?? '');
      if (!mounted) return;
      if (pseudo != null && pseudo.isNotEmpty) {
        await CommunityService.setProfile(cred.user!.uid, pseudo);
        // Nouveau compte créé → événement Meta completed_registration
        await MetaAnalyticsService.logCompletedRegistration();
      }
    }

    if (mounted) Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      setState(() { _loading = false; _error = e.toString(); });
    }
  }

  Future<String?> _askPseudo(String suggestion) {
    final l10n = AppLocalizations.of(context);
    final ctrl = TextEditingController(text: suggestion);
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(l10n.authChoosePseudo,
            style: const TextStyle(color: Colors.white)),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          maxLength: 24,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: l10n.authPseudoHint,
            hintStyle: const TextStyle(color: Colors.white38),
            counterStyle: const TextStyle(color: Colors.white38),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4CC9F0)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4CC9F0), width: 2),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(ctrl.text.trim()),
            child: Text(l10n.confirm,
                style: const TextStyle(color: Color(0xFF4CC9F0))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D14),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white70),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 72, color: const Color(0xFF4CC9F0)),
              const SizedBox(height: 24),
              Text(
                widget.title ?? l10n.pluginCommunity,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.subtitle ?? l10n.pluginCommunitySubtitleAuth,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white60, fontSize: 15),
              ),
              const SizedBox(height: 40),
              if (_loading)
                const CircularProgressIndicator(color: Color(0xFF4CC9F0))
              else
                _GoogleButton(onTap: _signIn, label: l10n.continueWithGoogle),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(_error!,
                    style: const TextStyle(color: Colors.redAccent, fontSize: 13)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _GoogleButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  const _GoogleButton({required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo Google SVG minimal
            const _GoogleLogo(),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoogleLogo extends StatelessWidget {
  const _GoogleLogo();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22,
      height: 22,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.width / 2;
    // Simplified G
    final paint = Paint()..style = PaintingStyle.fill;
    paint.color = const Color(0xFF4285F4);
    canvas.drawArc(Rect.fromCircle(center: c, radius: r),
        -0.35, 1.4, true, paint);
    paint.color = const Color(0xFF34A853);
    canvas.drawArc(Rect.fromCircle(center: c, radius: r),
        1.05, 1.4, true, paint);
    paint.color = const Color(0xFFFBBC04);
    canvas.drawArc(Rect.fromCircle(center: c, radius: r),
        2.45, 0.9, true, paint);
    paint.color = const Color(0xFFEA4335);
    canvas.drawArc(Rect.fromCircle(center: c, radius: r),
        3.35, 1.1, true, paint);
    paint.color = Colors.white;
    canvas.drawCircle(c, r * 0.6, paint);
    paint.color = const Color(0xFF4285F4);
    canvas.drawRect(
      Rect.fromLTWH(c.dx, c.dy - r * 0.15, r * 0.95, r * 0.3),
      paint,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
