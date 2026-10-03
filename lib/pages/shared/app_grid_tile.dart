import 'package:flutter/material.dart';

import 'app_view_mode.dart';

/// Indique aux [AppGridTile] s'ils doivent se dessiner en "case" (grille)
/// ou en "ligne" (liste). Fourni automatiquement par [AppGridView].
class _TileLayoutScope extends InheritedWidget {
  const _TileLayoutScope({required this.isList, required super.child});

  final bool isList;

  static bool of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_TileLayoutScope>()?.isList ??
      false;

  @override
  bool updateShouldNotify(_TileLayoutScope old) => old.isList != isList;
}

/// Carte de grille "icône + nom" — style aéré et coloré utilisé partout
/// dans l'app (accueil + menus de chaque catégorie) à la place des
/// anciennes listes verticales sombres.
///
/// Ajoute un léger effet "rebond" au toucher (scale-down/scale-up) et une
/// ombre douce colorée pour un rendu plus vivant, sans rien changer à
/// l'API ni à l'empreinte visuelle (même taille, même contenu) : tous les
/// écrans qui l'utilisent en profitent automatiquement.
class AppGridTile extends StatefulWidget {
  const AppGridTile({
    super.key,
    this.icon,
    required this.label,
    required this.accentColor,
    required this.onTap,
    this.badge,
    this.locked = false,
    this.imageAsset,
    this.subtitle,
  }) : assert(icon != null || imageAsset != null,
            'Il faut fournir soit icon, soit imageAsset.');

  /// Icône Material affichée dans la pastille colorée (ignorée si
  /// [imageAsset] est fourni).
  final IconData? icon;

  /// Chemin d'un visuel dédié (ex: assets/tool_icons/icone_gdtf.png) à
  /// afficher à la place de l'icône Material — fond et couleurs déjà
  /// intégrés à l'image.
  final String? imageAsset;

  /// Nom de l'onglet / de l'outil, affiché sous l'icône.
  final String label;

  /// Couleur d'accent de la catégorie (teinte du dégradé + de l'icône).
  final Color accentColor;

  final VoidCallback onTap;

  /// Texte court optionnel affiché en badge (ex: "PRO", "GRATUIT", "BETA").
  final String? badge;

  final bool locked;

  /// Courte description affichée uniquement en mode "lignes".
  final String? subtitle;

  @override
  State<AppGridTile> createState() => _AppGridTileState();
}

class _AppGridTileState extends State<AppGridTile> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  Widget _iconBadge({double size = 48, double radius = 16, bool vivid = false}) {
    final double contentAlpha = widget.locked ? 0.45 : 1.0;
    if (widget.imageAsset != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Opacity(
          opacity: widget.locked ? 0.35 : 1.0,
          child: Image.asset(
            widget.imageAsset!,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        // Grille : pastille unie (rendu d'origine, identique à l'accueil).
        // Lignes : léger dégradé pour un rendu plus vivant.
        color: vivid
            ? null
            : widget.accentColor.withValues(alpha: widget.locked ? 0.10 : 0.22),
        gradient: vivid
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  widget.accentColor
                      .withValues(alpha: widget.locked ? 0.10 : 0.34),
                  widget.accentColor
                      .withValues(alpha: widget.locked ? 0.06 : 0.14),
                ],
              )
            : null,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Icon(
        widget.icon,
        color: widget.accentColor.withValues(alpha: contentAlpha),
        size: size * 0.5,
      ),
    );
  }

  Widget _badgeChip({bool large = false}) {
    return Container(
      padding: large
          ? const EdgeInsets.symmetric(horizontal: 7, vertical: 3)
          : const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: widget.accentColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: widget.accentColor.withValues(alpha: 0.45),
            blurRadius: 6,
          ),
        ],
      ),
      child: Text(
        widget.badge!,
        style: TextStyle(
          fontSize: large ? 9.5 : 8.5,
          fontWeight: FontWeight.w800,
          color: Colors.black,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context) {
    final hasSubtitle =
        widget.subtitle != null && widget.subtitle!.trim().isNotEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          _iconBadge(size: 44, radius: 14, vivid: true),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label.replaceAll('\n', ' '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                    color: Colors.white
                        .withValues(alpha: widget.locked ? 0.55 : 0.96),
                  ),
                ),
                if (hasSubtitle) ...[
                  const SizedBox(height: 3),
                  Text(
                    widget.subtitle!.replaceAll('\n', ' '),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.25,
                      color: Colors.white
                          .withValues(alpha: widget.locked ? 0.35 : 0.60),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),
          if (widget.locked)
            Icon(Icons.lock_rounded,
                size: 16, color: Colors.white.withValues(alpha: 0.45))
          else if (widget.badge != null)
            _badgeChip(large: true),
          const SizedBox(width: 6),
          Icon(
            Icons.chevron_right_rounded,
            color: widget.accentColor
                .withValues(alpha: widget.locked ? 0.30 : 0.80),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isList = _TileLayoutScope.of(context);
    final radius = isList ? 20.0 : 24.0;

    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: AnimatedScale(
        scale: _pressed ? (isList ? 0.98 : 0.94) : 1.0,
        duration: const Duration(milliseconds: 110),
        curve: Curves.easeOut,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(radius),
            splashColor: widget.accentColor.withValues(alpha: 0.18),
            highlightColor: widget.accentColor.withValues(alpha: 0.08),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.accentColor
                        .withValues(alpha: widget.locked ? 0.06 : 0.19),
                    widget.accentColor
                        .withValues(alpha: widget.locked ? 0.02 : 0.06),
                  ],
                ),
                border: Border.all(
                  color: widget.accentColor
                      .withValues(alpha: widget.locked ? 0.10 : 0.30),
                  width: 1.2,
                ),
                boxShadow: widget.locked
                    ? null
                    : [
                        BoxShadow(
                          color: widget.accentColor.withValues(alpha: 0.12),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
              ),
              child: isList
                  ? _buildRow(context)
                  : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        _iconBadge(),
                        if (widget.locked)
                          Positioned(
                            right: -4,
                            bottom: -4,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: const Color(0xFF161622),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.15),
                                ),
                              ),
                              child: Icon(
                                Icons.lock_rounded,
                                size: 10,
                                color: Colors.white.withValues(alpha: 0.70),
                              ),
                            ),
                          )
                        else if (widget.badge != null)
                          Positioned(
                            right: -10,
                            top: -10,
                            child: _badgeChip(),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Center(
                        child: Text(
                          widget.label,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1.15,
                            letterSpacing: 0.1,
                            color: Colors.white
                                .withValues(alpha: widget.locked ? 0.55 : 0.95),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Petit intitulé de section (ex: "Gratuit" / "Abonnement ...") utilisé
/// pour regrouper les outils gratuits en haut et les payants dans une
/// section séparée en dessous, comme sur la page Électricité.
///
/// Présenté en forme de pastille colorée (plutôt qu'un simple texte entre
/// deux lignes) pour un rendu un peu plus vivant et moderne.
class AppSectionLabel extends StatelessWidget {
  const AppSectionLabel({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withValues(alpha: 0.35)),
            ),
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child:
                Divider(color: Colors.white.withValues(alpha: 0.10), height: 1),
          ),
        ],
      ),
    );
  }
}

/// Grille responsive standard (3 colonnes sur téléphone) utilisée pour
/// afficher une liste d'[AppGridTile] de façon aérée.
///
/// Les cartes apparaissent avec un léger effet d'entrée en cascade
/// (fondu + glissement) au premier affichage, pour une sensation plus
/// vivante — sans impact sur la disposition ni la taille des cartes.
class AppGridView extends StatelessWidget {
  const AppGridView({
    super.key,
    required this.children,
    this.crossAxisCount = 3,
    this.followViewMode = true,
  });

  final List<Widget> children;
  final int crossAxisCount;

  /// Si `true` (défaut), la grille suit le choix global cases / lignes
  /// ([AppViewMode]). Passer `false` pour forcer l'affichage en cases.
  final bool followViewMode;

  @override
  Widget build(BuildContext context) {
    if (!followViewMode) return _buildGrid();
    return ValueListenableBuilder<bool>(
      valueListenable: AppViewMode.isList,
      builder: (context, isList, _) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: KeyedSubtree(
          key: ValueKey(isList),
          child: isList ? _buildList() : _buildGrid(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return _TileLayoutScope(
      isList: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            _StaggeredGridEntry(index: i, child: children[i]),
          ],
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return _TileLayoutScope(
      isList: false,
      child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: children.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        // Hauteur fixe (indépendante de la largeur d'écran) pour éviter
        // les débordements sur certains téléphones (ex: Android avec
        // une largeur d'écran différente d'un aspect ratio fixe).
        mainAxisExtent: 118,
      ),
      itemBuilder: (context, index) =>
          _StaggeredGridEntry(index: index, child: children[index]),
      ),
    );
  }
}

/// Fait apparaître une carte de grille en fondu + léger glissement vers
/// le haut, avec un délai croissant selon sa position — effet de cascade
/// discret joué une seule fois à l'affichage de la grille.
class _StaggeredGridEntry extends StatefulWidget {
  const _StaggeredGridEntry({required this.index, required this.child});

  final int index;
  final Widget child;

  @override
  State<_StaggeredGridEntry> createState() => _StaggeredGridEntryState();
}

class _StaggeredGridEntryState extends State<_StaggeredGridEntry> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    // Délai plafonné pour que les grilles longues ne mettent pas une
    // éternité à finir d'apparaître.
    final delayMs = 28 * (widget.index % 12);
    Future.delayed(Duration(milliseconds: delayMs), () {
      if (mounted) setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _visible ? Offset.zero : const Offset(0, 0.08),
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: const Duration(milliseconds: 220),
        child: widget.child,
      ),
    );
  }
}
