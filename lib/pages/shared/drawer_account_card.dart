import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import '../../services/community_service.dart';
import '../community/auth_page.dart';

const _kAccent = Color(0xFF4CC9F0);
const _kSheetBg = Color(0xFF1A1A2E);

/// Carte « compte » en haut du menu latéral.
/// - Non connecté (ou session anonyme) → invite à se connecter avec Google.
/// - Connecté → avatar + nom + e-mail ; un tap ouvre la fiche compte
///   (déconnexion).
class DrawerAccountCard extends StatelessWidget {
  const DrawerAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: CommunityService.userChanges,
      initialData: CommunityService.currentUser,
      builder: (context, snap) {
        final user =
            CommunityService.isRealUser(snap.data) ? snap.data : null;
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
          child: user == null
              ? _SignedOutCard(onTap: () => _openSignIn(context))
              : _SignedInCard(
                  user: user,
                  onTap: () => _openAccountSheet(context, user),
                ),
        );
      },
    );
  }

  Future<void> _openSignIn(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    navigator.pop(); // ferme le drawer
    final ok = await navigator.push<bool>(
      MaterialPageRoute(
        builder: (_) => AuthPage(
          title: l10n.accountAuthTitle,
          subtitle: l10n.accountAuthSubtitle,
          icon: Icons.account_circle_rounded,
        ),
      ),
    );
    if (ok == true) {
      messenger.showSnackBar(SnackBar(
        content: Text(l10n.accountSignedInSnack),
        backgroundColor: _kSheetBg,
      ));
    }
  }

  void _openAccountSheet(BuildContext context, User user) {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: _kSheetBg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Avatar(user: user, radius: 34),
              const SizedBox(height: 12),
              Text(
                CommunityService.displayNameOf(user) ?? l10n.anonymous,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if ((user.email ?? '').isNotEmpty)
                Text(user.email!,
                    style: const TextStyle(color: Colors.white54, fontSize: 13)),
              const SizedBox(height: 20),
              ListTile(
                leading:
                    const Icon(Icons.logout_rounded, color: Colors.redAccent),
                title: Text(l10n.signOut,
                    style: const TextStyle(color: Colors.redAccent)),
                onTap: () async {
                  final confirm = await showDialog<bool>(
                    context: sheetCtx,
                    builder: (dCtx) => AlertDialog(
                      backgroundColor: _kSheetBg,
                      title: Text(l10n.accountSignOutConfirmTitle,
                          style: const TextStyle(color: Colors.white)),
                      content: Text(l10n.accountSignOutConfirmBody,
                          style: const TextStyle(color: Colors.white70)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(dCtx).pop(false),
                          child: Text(l10n.commonCancel,
                              style: const TextStyle(color: Colors.white60)),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(dCtx).pop(true),
                          child: Text(l10n.signOut,
                              style:
                                  const TextStyle(color: Colors.redAccent)),
                        ),
                      ],
                    ),
                  );
                  if (confirm != true) return;
                  if (sheetCtx.mounted) Navigator.of(sheetCtx).pop();
                  await CommunityService.signOut();
                  messenger.showSnackBar(SnackBar(
                    content: Text(l10n.accountSignedOutSnack),
                    backgroundColor: _kSheetBg,
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignedOutCard extends StatelessWidget {
  final VoidCallback onTap;
  const _SignedOutCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                _kAccent.withValues(alpha: 0.18),
                const Color(0xFFF72585).withValues(alpha: 0.12),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: _kAccent.withValues(alpha: 0.35)),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _kAccent.withValues(alpha: 0.18),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_add_alt_1_rounded,
                    color: _kAccent, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.accountSignInCta,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        )),
                    const SizedBox(height: 2),
                    Text(l10n.accountSignInCtaSubtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Colors.white38),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignedInCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;
  const _SignedInCard({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withValues(alpha: 0.05),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Row(
            children: [
              _Avatar(user: user, radius: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CommunityService.displayNameOf(user) ?? l10n.anonymous,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    if ((user.email ?? '').isNotEmpty)
                      Text(
                        user.email!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF2DC653),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final User user;
  final double radius;
  const _Avatar({required this.user, required this.radius});

  @override
  Widget build(BuildContext context) {
    final photo = CommunityService.photoUrlOf(user);
    final name = CommunityService.displayNameOf(user) ?? '';
    return CircleAvatar(
      radius: radius,
      backgroundColor: _kAccent.withValues(alpha: 0.2),
      backgroundImage: photo != null ? NetworkImage(photo) : null,
      child: photo == null
          ? Text(
              name.isEmpty ? 'U' : name.characters.first.toUpperCase(),
              style: TextStyle(color: _kAccent, fontSize: radius * 0.8),
            )
          : null,
    );
  }
}
