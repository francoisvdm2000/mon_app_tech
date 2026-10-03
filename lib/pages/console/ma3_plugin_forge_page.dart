import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../l10n_gen/app_localizations.dart';
import 'package:http/http.dart' as http;
import '../../../config/api_secrets.dart';


String _ma3Text(AppLocalizations l10n, String text) {
  switch (text) {
    case 'MA3 Plugin ': return l10n.ma3AppTitlePrefix;
    case 'Forge': return l10n.ma3AppTitleAccent;
    case '↺ Nouveau': return l10n.ma3New;
    case 'Catégorie': return l10n.ma3StepCategory;
    case 'Paramètres': return l10n.ma3StepSettings;
    case 'Code généré': return l10n.ma3StepGeneratedCode;
    case 'Quel type de plugin ?': return l10n.ma3ChoosePluginType;
    case 'Choisis une catégorie pour commencer': return l10n.ma3ChooseCategorySubtitle;
    case 'Continuer →': return l10n.ma3Continue;
    case 'Nom du plugin': return l10n.ma3PluginName;
    case 'Mon Plugin MA3': return l10n.ma3PluginNameHint;
    case 'Paramètres du plugin': return l10n.ma3PluginSettings;
    case '💬 Détails supplémentaires (optionnel)': return l10n.ma3AdditionalDetails;
    case 'Ajoute des précisions, cas particuliers, contraintes...': return l10n.ma3AdditionalDetailsHint;
    case '← Retour': return l10n.ma3Back;
    case '⚡ Générer le Plugin': return l10n.ma3GeneratePlugin;
    case 'Plugin généré — prêt à coller dans MA3': return l10n.ma3GeneratedReady;
    case 'Installer dans MA3 : ': return l10n.ma3InstallInMa3;
    case 'Menu ': return l10n.ma3Menu;
    case 'Plugin': return l10n.ma3GeneratedPluginFallback;
    case 'New Plugin': return l10n.ma3NewPlugin;
    case ' → colle → sauvegarde comme ': return l10n.ma3PasteSaveAs;
    case 'Run': return l10n.ma3Run;
    case '✓ Copié !': return l10n.ma3Copied;
    case '⎘ Copier': return l10n.ma3Copy;
    case '← Modifier': return l10n.ma3Edit;
    case '↺ Régénérer': return l10n.ma3Regenerate;
    case '+ Nouveau plugin': return l10n.ma3NewPluginButton;
    case '— Choisir —': return l10n.ma3Choose;
    case 'Ajouter...': return l10n.ma3Add;
    case 'Couleur': return l10n.ma3CategoryColor;
    case 'Layout RGB, palette, presets couleur': return l10n.ma3CategoryColorDesc;
    case 'Mouvement': return l10n.ma3CategoryMovement;
    case 'Pan/Tilt, cercle, figure 8, positions': return l10n.ma3CategoryMovementDesc;
    case 'Effets': return l10n.ma3CategoryEffect;
    case 'Strobe, pulse, chase, séquences': return l10n.ma3CategoryEffectDesc;
    case 'Intensité': return l10n.ma3CategoryDimmer;
    case 'Dimmer, bump, fade, blackout': return l10n.ma3CategoryDimmerDesc;
    case 'Layout': return l10n.ma3CategoryLayout;
    case 'Créer/organiser des layouts MA3': return l10n.ma3CategoryLayoutDesc;
    case 'Sélection': return l10n.ma3CategorySelect;
    case 'Sélection groupes, fixtures, filtres': return l10n.ma3CategorySelectDesc;
    case 'Macro': return l10n.ma3CategoryMacro;
    case 'Macros multi-étapes, séquences console': return l10n.ma3CategoryMacroDesc;
    case 'Utilitaire': return l10n.ma3CategoryUtility;
    case 'Label, store, organiser le show file': return l10n.ma3CategoryUtilityDesc;
    case 'Sur mesure': return l10n.ma3CategoryCustom;
    case 'Décris librement ce que tu veux': return l10n.ma3CategoryCustomDesc;
    case 'Espace couleur des machines': return l10n.ma3FieldColorSpace;
    case 'Couleurs à proposer comme presets': return l10n.ma3FieldColors;
    case 'Le plugin demande le groupe au lancement': return l10n.ma3FieldGroupSelect;
    case 'Oui — via dialog MA3': return l10n.ma3YesViaMa3Dialog;
    case 'Non — utilise la sélection courante': return l10n.ma3NoUseCurrentSelection;
    case 'Type de mouvement à créer': return l10n.ma3FieldMovementType;
    case 'Presets positions (scène, face, côtés...)': return l10n.ma3MovePresetPositions;
    case 'Effect Engine — Cercle': return l10n.ma3MoveCircle;
    case 'Effect Engine — Figure 8': return l10n.ma3MoveFigure8;
    case 'Effect Engine — Pan sweep': return l10n.ma3MovePanSweep;
    case 'Effect Engine — Tilt sweep': return l10n.ma3MoveTiltSweep;
    case 'Effect Engine — Aléatoire': return l10n.ma3MoveRandom;
    case 'Source de vitesse (pour effects)': return l10n.ma3FieldSpeedSourceEffects;
    case 'BPM — valeur saisie dans la console': return l10n.ma3SpeedBpmConsole;
    case 'Executeur de vitesse — numéro saisi dans la console': return l10n.ma3SpeedExecutorConsole;
    case 'Les deux — choix proposé dans la console': return l10n.ma3SpeedBothConsole;
    case "Type d'effet à créer": return l10n.ma3FieldEffectType;
    case 'Ce que le plugin crée': return l10n.ma3FieldOutput;
    case 'Presets effet': return l10n.ma3OutputEffectPresets;
    case 'Séquence chase': return l10n.ma3OutputChaseSequence;
    case 'Macro déclencheur': return l10n.ma3OutputTriggerMacro;
    case 'Source de vitesse': return l10n.ma3FieldSpeedSource;
    case 'Fonctionnalités à inclure': return l10n.ma3FieldFeatures;
    case 'Macros intensité': return l10n.ma3OutputIntensityMacros;
    case 'Presets intensité': return l10n.ma3OutputIntensityPresets;
    case 'Sections à inclure dans le layout': return l10n.ma3FieldLayoutSections;
    case 'Couleurs': return l10n.ma3SectionColors;
    case 'Groupes': return l10n.ma3SectionGroups;
    case 'Presets': return l10n.ma3SectionPresets;
    case 'Style visuel': return l10n.ma3FieldVisualStyle;
    case 'Le plugin demande le nom/numéro au lancement': return l10n.ma3FieldGroupNameNumber;
    case 'Non — nom générique codé en dur': return l10n.ma3NoHardcodedGenericName;
    case 'Critères de sélection à proposer': return l10n.ma3FieldSelectionCriteria;
    case 'Pairs/Impairs': return l10n.ma3CriteriaEvenOdd;
    case '1/3 — 2/3 — 3/3': return l10n.ma3CriteriaThirds;
    case 'Par position (avant/milieu/arrière)': return l10n.ma3CriteriaPosition;
    case 'Tous': return l10n.ma3CriteriaAll;
    case 'Premier/Dernier': return l10n.ma3FirstLast;
    case 'Macros de sélection': return l10n.ma3OutputSelectionMacros;
    case 'Boutons de groupe dans un layout': return l10n.ma3OutputGroupButtonsLayout;
    case 'Décris les étapes de la macro': return l10n.ma3FieldMacroSteps;
    case 'ex:\n1. Sélectionner un groupe (dialog)\n2. Blackout\n3. Attendre 1s\n4. Fade In 3s': return l10n.ma3MacroStepsHint;
    case 'Déclencheur': return l10n.ma3FieldTrigger;
    case 'Manuel': return l10n.ma3TriggerManual;
    case 'Tâche à effectuer': return l10n.ma3FieldTask;
    case 'Nommer les fixtures du patch': return l10n.ma3TaskNameFixtures;
    case 'Créer les groupes automatiquement': return l10n.ma3TaskCreateGroups;
    case 'Stocker tous les presets': return l10n.ma3TaskStorePresets;
    case 'Nettoyer les objets vides': return l10n.ma3TaskCleanEmptyObjects;
    case 'Cloner un layout': return l10n.ma3TaskCloneLayout;
    case 'Rapport du show (fixtures, groupes, presets)': return l10n.ma3TaskShowReport;
    case 'Confirmer avant chaque action': return l10n.ma3FieldConfirmEachAction;
    case 'Oui': return l10n.ma3Yes;
    case 'Non': return l10n.ma3No;
    case 'Décris ce que le plugin doit faire dans MA3': return l10n.ma3FieldCustomDescription;
    case 'Rouge': return l10n.ma3ColorRed;
    case 'Vert': return l10n.ma3ColorGreen;
    case 'Bleu': return l10n.ma3ColorBlue;
    case 'Jaune': return l10n.ma3ColorYellow;
    case 'Orange': return l10n.ma3ColorOrange;
    case 'Rose': return l10n.ma3ColorPink;
    case 'Blanc froid': return l10n.ma3ColorColdWhite;
    case 'Blanc chaud': return l10n.ma3ColorWarmWhite;
    case 'Strobe': return l10n.ma3EffectStrobe;
    case 'Pulse': return l10n.ma3EffectPulse;
    case 'Chase': return l10n.ma3EffectChase;
    case 'Twinkle': return l10n.ma3EffectTwinkle;
    case 'Fire': return l10n.ma3EffectFire;
    case 'Sawtooth': return l10n.ma3EffectSawtooth;
    case 'Random': return l10n.ma3EffectRandom;
    case 'Blackout': return l10n.ma3Blackout;
    case 'Full': return l10n.ma3Full;
    case 'Bump': return l10n.ma3Bump;
    case 'Fade In': return l10n.ma3FadeIn;
    case 'Fade Out': return l10n.ma3FadeOut;
    case 'Dimmer Chase': return l10n.ma3DimmerChase;
    case 'Compact': return l10n.ma3Compact;
    case 'Large': return l10n.ma3Large;
    case 'Tablette': return l10n.ma3Tablet;
    case 'Wing': return l10n.ma3Wing;
    case 'Aléatoire': return l10n.ma3Random;
    case 'RGB': return l10n.ma3Text_RGB;
    case 'CMY': return l10n.ma3Text_CMY;
    case 'HSI': return l10n.ma3Text_HSI;
    case 'RGBW': return l10n.ma3Text_RGBW;
    case 'RGBWW': return l10n.ma3Text_RGBWW;
    case 'RGBA': return l10n.ma3Text_RGBA;
    case 'RGBL': return l10n.ma3Text_RGBL;
    case 'RGBWA': return l10n.ma3Text_RGBWA;
    case 'RGBUV': return l10n.ma3Text_RGBUV;
    case 'Gel Color': return l10n.ma3Text_Gel_Color;
    case 'Cyan': return l10n.ma3Text_Cyan;
    case 'Magenta': return l10n.ma3Text_Magenta;
    case 'Lime': return l10n.ma3Text_Lime;
    case 'UV': return l10n.ma3Text_UV;
    case 'OFF': return l10n.ma3Text_OFF;
    case '50%': return l10n.ma3Text_50;
    case '25%': return l10n.ma3Text_25;
    case 'GO button': return l10n.ma3Text_GO_button;
    case 'Timecode': return l10n.ma3Text_Timecode;
    case 'OSC': return l10n.ma3Text_OSC;
    case 'MIDI': return l10n.ma3Text_MIDI;
    default: return text;
  }
}

// ─── Données MA3 ─────────────────────────────────────────────────────────────

class _Category {
  final String id, icon, label, desc;
  const _Category(this.id, this.icon, this.label, this.desc);
}

const _categories = [
  _Category('color', '◈', 'Couleur', 'Layout RGB, palette, presets couleur'),
  _Category(
      'movement', '◎', 'Mouvement', 'Pan/Tilt, cercle, figure 8, positions'),
  _Category('effect', '◇', 'Effets', 'Strobe, pulse, chase, séquences'),
  _Category('dimmer', '◑', 'Intensité', 'Dimmer, bump, fade, blackout'),
  _Category('layout', '▦', 'Layout', 'Créer/organiser des layouts MA3'),
  _Category('select', '◻', 'Sélection', 'Sélection groupes, fixtures, filtres'),
  _Category('macro', '⊞', 'Macro', 'Macros multi-étapes, séquences console'),
  _Category(
      'utility', '⚙', 'Utilitaire', 'Label, store, organiser le show file'),
  _Category('custom', '✦', 'Sur mesure', 'Décris librement ce que tu veux'),
];

enum _FieldType { text, number, select, tags, chips, textarea }

class _Field {
  final String id, label;
  final _FieldType type;
  final String? placeholder;
  final List<String>? options;
  const _Field(this.id, this.label, this.type,
      {this.placeholder, this.options});
}

final _fields = <String, List<_Field>>{
  // ── Presets Couleur ──────────────────────────────────────────────────────
  // Choix structurels uniquement — les valeurs runtime (numéro preset, nommage)
  // seront demandées par le plugin via gma.gui.input() dans MA3.
  'color': [
    _Field('colorspace', 'Espace couleur des machines', _FieldType.select,
        options: ['RGB', 'CMY', 'HSI', 'RGBW', 'RGBWW', 'RGBA', 'RGBL', 'RGBWA', 'RGBUV', 'Gel Color']),
    _Field('colors', 'Couleurs à proposer comme presets', _FieldType.chips, options: [
      'Rouge', 'Vert', 'Bleu', 'Cyan', 'Magenta', 'Jaune', 'Lime',
      'Orange', 'Rose', 'Blanc froid', 'Blanc chaud', 'UV', 'OFF',
    ]),
    _Field('groupSelect', 'Le plugin demande le groupe au lancement', _FieldType.select,
        options: ['Oui — via dialog MA3', 'Non — utilise la sélection courante']),
  ],
  // ── Presets Position ─────────────────────────────────────────────────────
  'movement': [
    _Field('movetype', 'Type de mouvement à créer', _FieldType.select, options: [
      'Presets positions (scène, face, côtés...)',
      'Effect Engine — Cercle',
      'Effect Engine — Figure 8',
      'Effect Engine — Pan sweep',
      'Effect Engine — Tilt sweep',
      'Effect Engine — Aléatoire',
    ]),
    _Field('speedSource', 'Source de vitesse (pour effects)', _FieldType.select, options: [
      'BPM — valeur saisie dans la console',
      'Executeur de vitesse — numéro saisi dans la console',
      'Les deux — choix proposé dans la console',
    ]),
    _Field('groupSelect', 'Le plugin demande le groupe au lancement', _FieldType.select,
        options: ['Oui — via dialog MA3', 'Non — utilise la sélection courante']),
  ],
  // ── Presets / Séquences Effet ────────────────────────────────────────────
  'effect': [
    _Field('effecttype', "Type d'effet à créer", _FieldType.chips, options: [
      'Strobe', 'Pulse', 'Chase', 'Twinkle', 'Fire', 'Sawtooth', 'Random',
    ]),
    _Field('output', 'Ce que le plugin crée', _FieldType.select, options: [
      'Presets effet', 'Séquence chase', 'Macro déclencheur',
    ]),
    _Field('speedSource', 'Source de vitesse', _FieldType.select, options: [
      'BPM — valeur saisie dans la console',
      'Executeur de vitesse — numéro saisi dans la console',
      'Les deux — choix proposé dans la console',
    ]),
    _Field('groupSelect', 'Le plugin demande le groupe au lancement', _FieldType.select,
        options: ['Oui — via dialog MA3', 'Non — utilise la sélection courante']),
  ],
  // ── Contrôle Intensité ───────────────────────────────────────────────────
  'dimmer': [
    _Field('features', 'Fonctionnalités à inclure', _FieldType.chips, options: [
      'Blackout', 'Full', '50%', '25%', 'Bump', 'Fade In', 'Fade Out', 'Dimmer Chase',
    ]),
    _Field('output', 'Ce que le plugin crée', _FieldType.select,
        options: ['Macros intensité', 'Presets intensité', 'Séquence chase']),
    _Field('groupSelect', 'Le plugin demande le groupe au lancement', _FieldType.select,
        options: ['Oui — via dialog MA3', 'Non — utilise la sélection courante']),
  ],
  // ── Layout ───────────────────────────────────────────────────────────────
  'layout': [
    _Field('sections', 'Sections à inclure dans le layout', _FieldType.chips, options: [
      'Couleurs', 'Intensité', 'Mouvement', 'Effets', 'Groupes', 'Presets', 'Blackout',
    ]),
    _Field('style', 'Style visuel', _FieldType.select,
        options: ['Compact', 'Large', 'Tablette', 'Wing']),
    _Field('groupSelect', 'Le plugin demande le nom/numéro au lancement', _FieldType.select,
        options: ['Oui — via dialog MA3', 'Non — nom générique codé en dur']),
  ],
  // ── Sélection / Groups ───────────────────────────────────────────────────
  'select': [
    _Field('criteria', 'Critères de sélection à proposer', _FieldType.chips, options: [
      'Pairs/Impairs', '1/3 — 2/3 — 3/3', 'Par position (avant/milieu/arrière)',
      'Tous', 'Aléatoire', 'Premier/Dernier',
    ]),
    _Field('output', 'Ce que le plugin crée', _FieldType.select, options: [
      'Macros de sélection', 'Boutons de groupe dans un layout',
    ]),
    _Field('groupSelect', 'Le plugin demande le groupe au lancement', _FieldType.select,
        options: ['Oui — via dialog MA3', 'Non — utilise la sélection courante']),
  ],
  // ── Macro séquentielle ───────────────────────────────────────────────────
  'macro': [
    _Field('steps', 'Décris les étapes de la macro', _FieldType.textarea,
        placeholder: 'ex:\n1. Sélectionner un groupe (dialog)\n2. Blackout\n3. Attendre 1s\n4. Fade In 3s'),
    _Field('trigger', 'Déclencheur', _FieldType.select,
        options: ['Manuel', 'GO button', 'Timecode', 'OSC', 'MIDI']),
  ],
  // ── Utilitaire ───────────────────────────────────────────────────────────
  'utility': [
    _Field('task', 'Tâche à effectuer', _FieldType.chips, options: [
      'Nommer les fixtures du patch', 'Créer les groupes automatiquement',
      'Stocker tous les presets', 'Nettoyer les objets vides',
      'Cloner un layout', 'Rapport du show (fixtures, groupes, presets)',
    ]),
    _Field('confirm', 'Confirmer avant chaque action', _FieldType.select,
        options: ['Oui', 'Non']),
  ],
  // ── Sur mesure ───────────────────────────────────────────────────────────
  'custom': [
    _Field('description', 'Décris ce que le plugin doit faire dans MA3', _FieldType.textarea,
        placeholder: 'ex: Un plugin qui demande un numéro de groupe, puis crée un preset de couleur pour chaque couleur RGB + blanc. Il demande aussi le numéro de départ et le nommage.'),
  ],
};

const _systemPrompt =
    '''Tu es un expert grandMA3 Lua. Tu génères des plugins Lua complets, fonctionnels et robustes.

CONCEPT FONDAMENTAL :
Le plugin s'exécute À L'INTÉRIEUR de grandMA3. Il CRÉE des objets dans la console (presets, macros, layouts...).
L'utilisateur lance le plugin depuis MA3, et le plugin peut lui poser des questions via les dialogs MA3 (gma.gui.input, gma.gui.confirm).
Le choix des groupes, fixtures, numéros se fait à RUNTIME via les dialogs MA3 — jamais codé en dur (sauf si l'utilisateur a explicitement demandé de ne pas poser la question).

RÈGLES ABSOLUES :
- Code Lua pur, sans markdown, sans backticks, sans explication en dehors des commentaires
- Toujours inclure la fonction main() et return main
- Utiliser gma.cmd() pour les commandes console MA3
- Utiliser gma.feedback() pour informer l'utilisateur en cours de traitement
- Utiliser gma.gui.confirm() avant toute action destructive ou irréversible
- Utiliser gma.sleep() pour les pauses (en secondes)
- Valider les inputs utilisateur (nil check, tonumber, trim)
- Commenter chaque section du code en français
- Le code doit marcher du premier coup

API MA3 DISPONIBLE :
- gma.cmd("commande") → exécuter une commande console
- gma.feedback("message") → afficher un message non-bloquant
- gma.sleep(seconds) → pause
- gma.gui.confirm("titre", "message") → dialog oui/non → retourne true/false
- gma.gui.input("titre", "message") → input texte → retourne string ou nil
- gma.gui.getstring("titre", "message") → alias de input

COMMANDES MA3 UTILES :
- Sélection : "Group N", "SelFix Group N", "Fixture 1 Thru N"
- Presets : "Store Preset X.Y /merge", "Label Preset X.Y \\"nom\\""
- Macros : "Store Macro N /merge", "Label Macro N \\"nom\\"", "Assign Macro N /cmd=\\"commande\\""
- Attributs : "Attribute \\"ColorRGB_R\\" At 100", "Attribute \\"Dimmer\\" At 100"
- Positions : "Attribute \\"Pan\\" At 50", "Attribute \\"Tilt\\" At 50"
- Layouts : "Store Layout \\"nom\\" /merge"
- Effects : "Store Effect N /merge", "Label Effect N \\"nom\\""

PARAMÈTRES RUNTIME — À DEMANDER VIA gma.gui.input() :
Tous les paramètres variables (numéros de preset/macro/layout, nommage, vitesse, amplitude, nombre d'éléments à créer) DOIVENT être demandés à l'utilisateur via gma.gui.input() au démarrage du plugin — JAMAIS codés en dur. La configuration fournie dans ce prompt définit la STRUCTURE du plugin (quelles fonctions il a, quels effets il propose), mais les VALEURS sont toujours demandées au runtime.

PATTERN POUR DEMANDER UN NOMBRE :
  local val = gma.gui.input("Titre", "Message ?")
  if val == nil then gma.feedback("Annulé.") return end
  val = tonumber(val)
  if val == nil then gma.feedback("Valeur invalide.") return end

PATTERN POUR DEMANDER UN TEXTE :
  local nom = gma.gui.input("Titre", "Message ?")
  if nom == nil or nom == "" then nom = "Default" end

PATTERN POUR LE GROUPE :
  local groupNum = gma.gui.input("Groupe", "Numéro du groupe à utiliser ?")
  if groupNum == nil then gma.feedback("Annulé.") return end
  groupNum = tonumber(groupNum)
  if groupNum == nil then gma.feedback("Numéro invalide.") return end
  gma.cmd("Group " .. groupNum)

PATTERN VITESSE — BPM :
  -- Demander le BPM, puis l'appliquer sur l'effet ou la séquence
  local bpm = gma.gui.input("Vitesse", "BPM ? (ex: 120)")
  if bpm == nil then gma.feedback("Annulé.") return end
  bpm = tonumber(bpm)
  if bpm == nil then gma.feedback("BPM invalide.") return end
  gma.cmd("Effect " .. effectNum .. " Rate " .. bpm)  -- ou sur séquence

PATTERN VITESSE — EXECUTEUR DE VITESSE (Speed Master) :
  -- Demander le numéro d'executeur utilisé comme speed master
  local execNum = gma.gui.input("Speed Master", "Numéro d'executeur speed master ? (ex: 201)")
  if execNum == nil then gma.feedback("Annulé.") return end
  execNum = tonumber(execNum)
  if execNum == nil then gma.feedback("Numéro invalide.") return end
  -- Assigner l'executeur comme source de tempo
  gma.cmd("Assign Executor " .. execNum .. " /SpeedMaster")
  -- OU référencer le speed master sur la séquence/effect :
  gma.cmd("Assign Sequence " .. seqNum .. " /SpeedMaster=" .. execNum)

PATTERN VITESSE — LES DEUX (choix à la saisie) :
  local choix = gma.gui.confirm("Vitesse", "Utiliser un executeur speed master ?")
  if choix then
    -- mode executeur (voir pattern ci-dessus)
  else
    -- mode BPM (voir pattern ci-dessus)
  end

STRUCTURE : local function main() ... end / return main''';

// ─── Couleurs ─────────────────────────────────────────────────────────────────

const _bg = Color(0xFF0B0D12);
const _s1 = Color(0xFF111318);
const _s2 = Color(0xFF171A22);
const _bdr = Color(0xFF252B3A);
const _amber = Color(0xFFF5A623);
const _amberDim = Color(0x80F5A623);
const _green = Color(0xFF3DDC84);
const _red = Color(0xFFE85050);
const _txtMain = Color(0xFFBFC5D4);
const _txtDim = Color(0xFF50596A);

// ─── Page principale ──────────────────────────────────────────────────────────

class Ma3PluginForgePage extends StatefulWidget {
  const Ma3PluginForgePage({super.key});

  @override
  State<Ma3PluginForgePage> createState() => _Ma3PluginForgePageState();
}

class _Ma3PluginForgePageState extends State<Ma3PluginForgePage> {
  int _step = 1;
  String? _categoryId;
  final Map<String, dynamic> _formData = {};
  String _freeDesc = '';
  String _pluginNameInput = '';
  bool _loading = false;
  String _code = '';
  String _pluginName = '';
  final _pluginNameCtrl = TextEditingController();
  String _error = '';
  bool _copied = false;

  _Category get _cat => _categories.firstWhere((c) => c.id == _categoryId!);
  List<_Field> get _currentFields => _fields[_categoryId] ?? [];

  String _buildPrompt() {
    final catLabel = _cat.label;
    final fields = _currentFields;
    final buf = StringBuffer();

    // Extraire le choix du groupe (runtime vs sélection courante)
    final groupSelect = _formData['groupSelect'] as String? ?? '';
    final askGroupAtRuntime = groupSelect.contains('Oui');

    for (final f in fields) {
      // Le champ groupSelect est traduit en instruction directe ci-dessous
      if (f.id == 'groupSelect') continue;
      final v = _formData[f.id];
      if (v == null) continue;
      if (v is List && v.isEmpty) continue;
      if (v is String && v.isEmpty) continue;
      buf.writeln('- ${f.label} : ${v is List ? v.join(', ') : v}');
    }

    // Instruction runtime groupe
    final groupInstruction = askGroupAtRuntime
        ? '''
Sélection du groupe :
- Au démarrage, demander à l'utilisateur le numéro du groupe via gma.gui.input()
- Valider que c'est un nombre, annuler proprement si nil ou invalide
- Puis faire : gma.cmd("Group " .. groupNum) pour sélectionner ce groupe'''
        : '''
Sélection du groupe :
- Ne pas demander de groupe, utiliser la sélection courante dans MA3 (fixtures déjà sélectionnées par l'opérateur)''';

    if (_freeDesc.isNotEmpty) {
      buf.writeln('- Détails supplémentaires : $_freeDesc');
    }

    final pluginNameLine = _pluginNameInput.isNotEmpty
        ? 'Nom du plugin : $_pluginNameInput'
        : '';

    return '''Génère un plugin Lua complet pour grandMA3.
${pluginNameLine.isNotEmpty ? '$pluginNameLine\n' : ''}Catégorie : $catLabel

Ce plugin s'exécute À L'INTÉRIEUR de grandMA3 et CRÉE des objets dans la console (presets, macros, layouts...).
$groupInstruction

Paramètres de génération :
${buf.isEmpty ? "Génère un exemple fonctionnel et représentatif de la catégorie." : buf.toString()}
Exigences :
- Code 100% fonctionnel, prêt à coller dans MA3
- Commentaires en français à chaque section
- Structure : local function main() ... end / return main
- Feedback utilisateur tout au long de l'exécution (gma.feedback)
- Validation des inputs, annulation propre si nil
- Si création de plusieurs objets : boucle avec feedback de progression''';
  }

  Future<void> _generate() async {
    // Capturer l10n avant les awaits pour éviter d'utiliser context après un gap async
    final l10n = AppLocalizations.of(context);
    setState(() {
      _loading = true;
      _error = '';
      _code = '';
    });
    try {
      final resp = await http.post(
        Uri.parse('https://api.anthropic.com/v1/messages'),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': kAnthropicApiKey,
          'anthropic-version': '2023-06-01',
        },
        body: jsonEncode({
          'model': 'claude-sonnet-4-6',
          'max_tokens': 2000,
          'system': _systemPrompt,
          'messages': [
            {'role': 'user', 'content': _buildPrompt()}
          ],
        }),
      );
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      if (data['error'] != null) {
        throw Exception((data['error'] as Map)['message'] ?? 'Erreur API');
      }
      final blocks = data['content'] as List;
      final text = (blocks.firstWhere(
        (b) => b['type'] == 'text',
        orElse: () => {'text': ''},
      ) as Map)['text'] as String;
      final clean = text
          .replaceAll(RegExp(r'```lua\n?', caseSensitive: false), '')
          .replaceAll(RegExp(r'```\n?'), '')
          .trim();
      final name = _pluginNameInput.isNotEmpty
          ? _pluginNameInput
          : (_formData['layoutName'] as String? ?? '').isNotEmpty
              ? _formData['layoutName'] as String
              : (_formData['macroName'] as String? ?? '').isNotEmpty
                  ? _formData['macroName'] as String
                  : '${_cat.label} ${l10n.ma3GeneratedPluginFallback}';
      setState(() {
        _code = clean;
        _pluginName = name;
        _step = 3;
      });
    } catch (e) {
      setState(() => _error = l10n.ma3Error(e.toString()));
    }
    setState(() => _loading = false);
  }

  void _reset() {
    _pluginNameCtrl.clear();
    setState(() {
      _step = 1;
      _categoryId = null;
      _formData.clear();
      _freeDesc = '';
      _pluginNameInput = '';
      _code = '';
      _error = '';
    });
  }

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: _code));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  // ─── Build ──────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        backgroundColor: _s1,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: _amber,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text('⚡', style: TextStyle(fontSize: 14)),
              ),
            ),
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6),
                children: [
                  TextSpan(
                      text: l10n.ma3AppTitlePrefix,
                      style: TextStyle(color: Colors.white)),
                  TextSpan(text: l10n.ma3AppTitleAccent, style: const TextStyle(color: _amber)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          if (_step > 1)
            TextButton(
              onPressed: _reset,
              child: Text(l10n.ma3New,
                  style: const TextStyle(color: _amberDim, fontSize: 12)),
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: _buildProgressBar(),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildProgressBar() {
    final l10n = AppLocalizations.of(context);
    final steps = [
      (1, l10n.ma3StepCategory),
      (2, l10n.ma3StepSettings),
      (3, l10n.ma3StepGeneratedCode),
    ];
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: _bdr)),
      ),
      child: Row(
        children: steps.map((s) {
          final (n, label) = s;
          final isActive = _step == n;
          final isDone = _step > n;
          return Expanded(
            child: GestureDetector(
              onTap: isDone ? () => setState(() => _step = n) : null,
              child: Opacity(
                opacity: (isActive || isDone) ? 1.0 : 0.35,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDone ? _amber : Colors.transparent,
                          border: Border.all(
                            color: isActive ? _amber : _txtDim,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: isDone
                              ? const Text('✓',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900))
                              : Text('$n',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: isActive ? _amber : _txtDim)),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: isActive ? _amber : _txtMain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBody() {
    return switch (_step) {
      1 => _buildStep1(),
      2 => _buildStep2(),
      3 => _buildStep3(),
      _ => const SizedBox(),
    };
  }

  // ─── Step 1 : Catégories ───────────────────────────────────────────────

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
          child: Text(
            AppLocalizations.of(context).ma3ChoosePluginType,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 0.3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(AppLocalizations.of(context).ma3ChooseCategorySubtitle,
              style: TextStyle(color: _txtDim, fontSize: 13)),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.78,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: _categories.length,
            itemBuilder: (ctx, i) {
              final cat = _categories[i];
              final selected = _categoryId == cat.id;
              return GestureDetector(
                onTap: () => setState(() {
                  _categoryId = cat.id;
                  _formData.clear();
                }),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0x20F5A623) : _s2,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selected ? _amber : _bdr,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cat.icon,
                          style: TextStyle(
                              fontSize: 22,
                              color: selected ? _amber : _txtDim)),
                      const Spacer(),
                      Text(_ma3Text(AppLocalizations.of(context), cat.label),
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      const SizedBox(height: 3),
                      Text(_ma3Text(AppLocalizations.of(context), cat.desc),
                          style: TextStyle(
                              fontSize: 10, color: _txtDim, height: 1.3)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SafeArea(
          top: false,
          child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  _categoryId == null ? null : () => setState(() => _step = 2),
              style: ElevatedButton.styleFrom(
                backgroundColor: _amber,
                foregroundColor: Colors.black,
                disabledBackgroundColor: _amber.withValues(alpha: 0.3),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(AppLocalizations.of(context).ma3Continue,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      letterSpacing: 0.5)),
            ),
          ),
        )),
      ],
    );
  }

  // ─── Step 2 : Formulaire ──────────────────────────────────────────────

  Widget _buildStep2() {
    final cat = _cat;
    final fields = _fields[_categoryId] ?? [];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('${cat.icon} ${_ma3Text(AppLocalizations.of(context), cat.label)}',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white)),
        const SizedBox(height: 4),
        Text(_ma3Text(AppLocalizations.of(context), cat.desc), style: TextStyle(color: _txtDim, fontSize: 13)),
        const SizedBox(height: 16),
        // ── Nom du plugin ──
        _label(AppLocalizations.of(context).ma3PluginName),
        const SizedBox(height: 8),
        TextField(
          controller: _pluginNameCtrl,
          style: const TextStyle(fontFamily: 'monospace', fontSize: 13, color: _txtMain),
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context).ma3PluginNameHint,
            hintStyle: TextStyle(color: _txtDim, fontSize: 12, fontFamily: 'monospace'),
            filled: true, fillColor: _s2,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: _bdr)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: _bdr)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: _amber)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
          onChanged: (v) => setState(() => _pluginNameInput = v),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: _s2,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _bdr),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle(AppLocalizations.of(context).ma3PluginSettings),
              ...fields.map((f) => _buildField(f)),
            ],
          ),
        ),
        if (_categoryId != 'custom') ...[
          const SizedBox(height: 16),
          _label(AppLocalizations.of(context).ma3AdditionalDetails,
              color: const Color(0xFF4A9EFF)),
          const SizedBox(height: 8),
          _styledTextArea(
            value: _freeDesc,
            placeholder:
                AppLocalizations.of(context).ma3AdditionalDetailsHint,
            onChanged: (v) => setState(() => _freeDesc = v),
          ),
        ],
        if (_error.isNotEmpty) ...[
          const SizedBox(height: 12),
          _errorBox(_error),
        ],
        const SizedBox(height: 20),
        Row(
          children: [
            OutlinedButton(
              onPressed: () => setState(() => _step = 1),
              style: OutlinedButton.styleFrom(
                foregroundColor: _txtDim,
                side: const BorderSide(color: _bdr),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(AppLocalizations.of(context).ma3Back),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _loading ? null : _generate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _amber,
                  foregroundColor: Colors.black,
                  disabledBackgroundColor: _amber.withValues(alpha: 0.3),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: _loading
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.black),
                      )
                    : Text(
                        AppLocalizations.of(context).ma3GeneratePlugin,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 14),
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildField(_Field field) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(field.label),
          const SizedBox(height: 8),
          switch (field.type) {
            _FieldType.text => _styledInput(field),
            _FieldType.number => _styledInput(field, isNumber: true),
            _FieldType.select => _styledSelect(field),
            _FieldType.tags => _TagInput(
                value: (_formData[field.id] as List<String>?) ?? [],
                placeholder: field.placeholder ?? '',
                onChange: (v) => setState(() => _formData[field.id] = v),
              ),
            _FieldType.chips => _ChipSelect(
                options: field.options ?? [],
                value: (_formData[field.id] as List<String>?) ?? [],
                onChange: (v) => setState(() => _formData[field.id] = v),
              ),
            _FieldType.textarea => _styledTextArea(
                value: (_formData[field.id] as String?) ?? '',
                placeholder: field.placeholder ?? '',
                onChanged: (v) => setState(() => _formData[field.id] = v),
              ),
          },
        ],
      ),
    );
  }

  // ─── Step 3 : Résultat ────────────────────────────────────────────────

  Widget _buildStep3() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Succès
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0x203DDC84),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0x403DDC84)),
          ),
          child: Row(
            children: [
              Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: _green)),
              const SizedBox(width: 10),
              Text(AppLocalizations.of(context).ma3GeneratedReady,
                  style: TextStyle(
                      color: _green,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Instructions
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: _s2,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _bdr)),
          child: RichText(
            text: TextSpan(
              style:
                  const TextStyle(fontSize: 12.5, color: _txtDim, height: 1.5),
              children: [
                TextSpan(
                    text: AppLocalizations.of(context).ma3InstallInMa3,
                    style:
                        const TextStyle(color: _amber, fontWeight: FontWeight.w700)),
                TextSpan(text: AppLocalizations.of(context).ma3Menu),
                _codeSpan(AppLocalizations.of(context).ma3Plugin),
                const TextSpan(text: ' → '),
                _codeSpan(AppLocalizations.of(context).ma3NewPlugin),
                TextSpan(text: AppLocalizations.of(context).ma3PasteSaveAs),
                TextSpan(
                    text:
                        '${_pluginName.toLowerCase().replaceAll(' ', '_')}.lua',
                    style: const TextStyle(
                        color: _amber, fontFamily: 'monospace')),
                const TextSpan(text: ' → '),
                _codeSpan(AppLocalizations.of(context).ma3Run),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Code
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0A0C10),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _bdr),
          ),
          child: Column(
            children: [
              // Header du code
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF0D0F14),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  border: Border(bottom: BorderSide(color: _bdr)),
                ),
                child: Row(
                  children: [
                    Text(
                      '${_pluginName.toLowerCase().replaceAll(' ', '_')}.lua',
                      style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 11,
                          color: _txtDim),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _copy,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: _copied ? _green : _bdr),
                        ),
                        child: Text(
                          _copied ? AppLocalizations.of(context).ma3Copied : AppLocalizations.of(context).ma3Copy,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: _copied ? _green : _txtDim,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Code
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                child: SelectableText(
                  _code,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Color(0xFFABB2BF),
                    height: 1.7,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            OutlinedButton(
              onPressed: () => setState(() => _step = 2),
              style: OutlinedButton.styleFrom(
                foregroundColor: _txtDim,
                side: const BorderSide(color: _bdr),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(AppLocalizations.of(context).ma3Edit),
            ),
            const SizedBox(width: 8),
            OutlinedButton(
              onPressed: _loading ? null : _generate,
              style: OutlinedButton.styleFrom(
                foregroundColor: _txtDim,
                side: const BorderSide(color: _bdr),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: _loading
                  ? const SizedBox(
                      height: 14,
                      width: 14,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : Text(AppLocalizations.of(context).ma3Regenerate),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: _reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(AppLocalizations.of(context).ma3NewPluginButton,
                    style: TextStyle(fontWeight: FontWeight.w800)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  // ─── Widgets helpers ──────────────────────────────────────────────────

  Widget _label(String text, {Color? color}) => Text(
        _ma3Text(AppLocalizations.of(context), text),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: color ?? _amberDim,
        ),
      );

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_ma3Text(AppLocalizations.of(context), text),
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: _amberDim)),
            const SizedBox(height: 8),
            const Divider(color: _bdr, height: 1),
          ],
        ),
      );

  Widget _styledInput(_Field field, {bool isNumber = false}) {
    return TextField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: const TextStyle(
          fontFamily: 'monospace', fontSize: 13, color: _txtMain),
      decoration: InputDecoration(
        hintText: field.placeholder == null ? null : _ma3Text(AppLocalizations.of(context), field.placeholder!),
        hintStyle:
            TextStyle(color: _txtDim, fontSize: 12, fontFamily: 'monospace'),
        filled: true,
        fillColor: _s2,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: _bdr)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: _bdr)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: _amber)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
      onChanged: (v) => setState(() => _formData[field.id] = v),
    );
  }

  Widget _styledSelect(_Field field) {
    final options = field.options ?? [];
    final current = (_formData[field.id] as String?) ?? '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: _s2,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _bdr),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: current.isEmpty ? null : current,
          hint: Text(AppLocalizations.of(context).ma3Choose,
              style: TextStyle(color: _txtDim, fontSize: 13)),
          isExpanded: true,
          dropdownColor: _s2,
          style: const TextStyle(color: _txtMain, fontSize: 13),
          iconEnabledColor: _amber,
          items: options
              .map((o) => DropdownMenuItem(value: o, child: Text(_ma3Text(AppLocalizations.of(context), o))))
              .toList(),
          onChanged: (v) => setState(() => _formData[field.id] = v ?? ''),
        ),
      ),
    );
  }

  Widget _styledTextArea(
      {required String value,
      required String placeholder,
      required ValueChanged<String> onChanged}) {
    return TextField(
      maxLines: 4,
      style: const TextStyle(fontSize: 13, color: _txtMain, height: 1.5),
      decoration: InputDecoration(
        hintText: _ma3Text(AppLocalizations.of(context), placeholder),
        hintStyle: TextStyle(color: _txtDim, fontSize: 12),
        filled: true,
        fillColor: _s2,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: _bdr)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: _bdr)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: _amber)),
        contentPadding: const EdgeInsets.all(10),
      ),
      onChanged: onChanged,
    );
  }

  Widget _errorBox(String msg) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0x20E85050),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0x50E85050)),
        ),
        child: Text(msg, style: const TextStyle(color: _red, fontSize: 13)),
      );

  TextSpan _codeSpan(String text) => TextSpan(
        text: text,
        style: const TextStyle(
            fontFamily: 'monospace',
            color: _txtMain,
            backgroundColor: Color(0xFF252B3A)),
      );

  @override
  void dispose() {
    _pluginNameCtrl.dispose();
    super.dispose();
  }
}

// ─── Tag Input ────────────────────────────────────────────────────────────────

class _TagInput extends StatefulWidget {
  final List<String> value;
  final String placeholder;
  final ValueChanged<List<String>> onChange;

  const _TagInput(
      {required this.value, required this.placeholder, required this.onChange});

  @override
  State<_TagInput> createState() => _TagInputState();
}

class _TagInputState extends State<_TagInput> {
  final _ctrl = TextEditingController();

  void _add() {
    final v = _ctrl.text.trim();
    if (v.isNotEmpty && !widget.value.contains(v)) {
      widget.onChange([...widget.value, v]);
    }
    _ctrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _s2,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: _bdr),
      ),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          ...widget.value.map((t) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0x20F5A623),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0x50F5A623)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(t,
                        style: const TextStyle(
                            fontSize: 12,
                            color: _amber,
                            fontFamily: 'monospace')),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => widget
                          .onChange(widget.value.where((x) => x != t).toList()),
                      child: const Text('×',
                          style: TextStyle(fontSize: 14, color: _amber)),
                    ),
                  ],
                ),
              )),
          SizedBox(
            width: 140,
            child: TextField(
              controller: _ctrl,
              style: const TextStyle(
                  fontFamily: 'monospace', fontSize: 12, color: _txtMain),
              decoration: InputDecoration(
                hintText:
                    widget.value.isEmpty ? _ma3Text(AppLocalizations.of(context), widget.placeholder) : AppLocalizations.of(context).ma3Add,
                hintStyle: const TextStyle(color: _txtDim, fontSize: 11),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 4),
              ),
              onSubmitted: (_) => _add(),
              onChanged: (v) {
                if (v.endsWith(',')) {
                  _ctrl.text = v.substring(0, v.length - 1);
                  _add();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }
}

// ─── Chip Select ──────────────────────────────────────────────────────────────

class _ChipSelect extends StatelessWidget {
  final List<String> options, value;
  final ValueChanged<List<String>> onChange;

  const _ChipSelect(
      {required this.options, required this.value, required this.onChange});

  void _toggle(String o) {
    if (value.contains(o)) {
      onChange(value.where((x) => x != o).toList());
    } else {
      onChange([...value, o]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: options.map((o) {
        final selected = value.contains(o);
        return GestureDetector(
          onTap: () => _toggle(o),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: selected ? _amber : _s2,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: selected ? _amber : _bdr),
            ),
            child: Text(
              _ma3Text(AppLocalizations.of(context), o),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.black : _txtDim,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
