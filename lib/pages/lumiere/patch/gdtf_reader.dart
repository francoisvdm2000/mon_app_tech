import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';

/// Lecteur GDTF minimal :
/// - ouvre un .gdtf (ZIP)
/// - lit description.xml
/// - cherche un DMXMode par nom
/// - retourne le nombre de DMXChannel de ce mode
class GdtfReader {
  final Map<String, int> _footprintCache = <String, int>{};
  final Map<int, GdtfPhysicalInfo> _physicalInfoCache =
      <int, GdtfPhysicalInfo>{};

  /// Lit les informations physiques (poids, dimensions, watt, présence d'un
  /// modèle 3D réel) depuis un .gdtf. Ne dépend pas du mode DMX : ce sont
  /// des propriétés du type de machine, pas du patch.
  GdtfPhysicalInfo physicalInfo({required Uint8List gdtfBytes}) {
    // Clé sur l'identité de l'instance (pas sa taille) : patchStore renvoie
    // toujours le même Uint8List pour un même gdtfSpec au sein d'une
    // session, donc identityHashCode identifie fiablement "le même fichier"
    // sans recalculer un hash de contenu à chaque appel.
    final cacheKey = identityHashCode(gdtfBytes);
    final cached = _physicalInfoCache[cacheKey];
    if (cached != null) return cached;

    final xml = _extractDescriptionXml(gdtfBytes);
    if (xml == null || xml.trim().isEmpty) {
      const empty = GdtfPhysicalInfo();
      _physicalInfoCache[cacheKey] = empty;
      return empty;
    }

    try {
      final doc = XmlDocument.parse(xml);
      final all = doc.descendants.whereType<XmlElement>();

      double? weightKg;
      double? legHeightM;
      double? tempLow;
      double? tempHigh;

      final properties = all.firstWhere(
        (e) => e.name.local.toLowerCase() == 'properties',
        orElse: () => XmlElement(XmlName('properties')),
      );
      for (final child in properties.childElements) {
        final local = child.name.local.toLowerCase();
        if (local == 'weight') {
          weightKg = _readFloatAttr(child, 'Value');
        } else if (local == 'legheight') {
          legHeightM = _readFloatAttr(child, 'Value');
        } else if (local == 'operatingtemperature') {
          tempLow = _readFloatAttr(child, 'Low');
          tempHigh = _readFloatAttr(child, 'High');
        }
      }

      double? maxLength;
      double? maxWidth;
      double? maxHeight;
      bool hasRealModelFile = false;

      // Modèle "principal" = celui avec le plus grand volume (L×W×H) parmi
      // ceux qui référencent un fichier — heuristique simple pour choisir
      // quelle partie représenter en phase 2 sans reconstruire tout l'arbre
      // de géométrie articulé (base/yoke/head).
      String? primaryModelName;
      double? primaryModelVolume;
      String? firstModelNameWithFile;

      final models = all.where((e) => e.name.local.toLowerCase() == 'model');
      for (final model in models) {
        final l = _readFloatAttr(model, 'Length');
        final w = _readFloatAttr(model, 'Width');
        final h = _readFloatAttr(model, 'Height');
        if (l != null && (maxLength == null || l > maxLength)) maxLength = l;
        if (w != null && (maxWidth == null || w > maxWidth)) maxWidth = w;
        if (h != null && (maxHeight == null || h > maxHeight)) maxHeight = h;

        final file = (model.getAttribute('File') ?? '').trim();
        if (file.isEmpty) continue;
        hasRealModelFile = true;

        final name = (model.getAttribute('Name') ?? '').trim();
        if (name.isEmpty) continue;
        firstModelNameWithFile ??= name;

        if (l != null && w != null && h != null) {
          final volume = l * w * h;
          if (primaryModelVolume == null || volume > primaryModelVolume) {
            primaryModelVolume = volume;
            primaryModelName = name;
          }
        }
      }
      // Repli si aucun modèle n'avait ses 3 dimensions renseignées : on
      // prend quand même le premier modèle avec fichier plutôt que rien.
      primaryModelName ??= firstModelNameWithFile;

      double? totalWatts;
      final wiringObjects = all.where(
        (e) => e.name.local.toLowerCase() == 'wiringobject',
      );
      for (final wo in wiringObjects) {
        final payload = _readFloatAttr(wo, 'ElectricalPayLoad');
        if (payload == null) continue;
        totalWatts = (totalWatts ?? 0) + payload;
      }

      final info = GdtfPhysicalInfo(
        weightKg: weightKg,
        legHeightM: legHeightM,
        operatingTempLowC: tempLow,
        operatingTempHighC: tempHigh,
        approxLengthM: maxLength,
        approxWidthM: maxWidth,
        approxHeightM: maxHeight,
        powerConsumptionWatts: totalWatts,
        hasReal3dModelFile: hasRealModelFile,
        primaryModelName: primaryModelName,
      );
      _physicalInfoCache[cacheKey] = info;
      return info;
    } catch (_) {
      const empty = GdtfPhysicalInfo();
      _physicalInfoCache[cacheKey] = empty;
      return empty;
    }
  }

  double? _readFloatAttr(XmlElement element, String name) {
    final raw = element.getAttribute(name);
    if (raw == null || raw.trim().isEmpty) return null;
    return double.tryParse(raw.trim());
  }

  final Map<int, Uint8List?> _glbBytesCache = <int, Uint8List?>{};

  /// Extrait les octets d'un modèle 3D embarqué dans le GDTF, à partir de
  /// son nom (attribut Name du `<Model>`, sans extension — voir
  /// [GdtfPhysicalInfo.primaryModelName]). Ne gère que le glTF binaire
  /// (.glb, auto-suffisant) : le GDTF peut aussi embarquer du .3ds ou du
  /// .gltf+.bin+textures séparés, non supportés ici (retombe sur le cube
  /// générique côté viewer 3D).
  ///
  /// Convention GDTF : les fichiers glb sont dans `./models/gltf/<name>.glb`
  /// à l'intérieur du zip. On tente aussi quelques variantes de casse/chemin
  /// par prudence (les exports ne sont pas tous strictement conformes).
  Uint8List? extractGlbBytes({
    required Uint8List gdtfBytes,
    required String modelBaseName,
  }) {
    final name = modelBaseName.trim();
    if (name.isEmpty) return null;

    final cacheKey =
        Object.hash(identityHashCode(gdtfBytes), name.toLowerCase());
    if (_glbBytesCache.containsKey(cacheKey)) return _glbBytesCache[cacheKey];

    Uint8List? result;
    try {
      final archive = ZipDecoder().decodeBytes(gdtfBytes, verify: true);
      final wanted = '$name.glb'.toLowerCase();

      ArchiveFile? best;
      for (final f in archive.files) {
        if (!f.isFile) continue;
        final fileName = f.name.split('/').last.split('\\').last.toLowerCase();
        if (fileName != wanted) continue;
        // Priorité au fichier situé sous un dossier "gltf" (convention GDTF),
        // sinon on prend ce qu'on trouve (certains exports mettent tout à
        // la racine du zip).
        final lowerPath = f.name.toLowerCase();
        if (best == null || lowerPath.contains('gltf')) {
          best = f;
          if (lowerPath.contains('gltf')) break;
        }
      }

      result = best?.readBytes();
    } catch (_) {
      result = null;
    }

    _glbBytesCache[cacheKey] = result;
    return result;
  }

  int? footprintForMode({
    required Uint8List gdtfBytes,
    required String modeName,
  }) {
    final mode = modeName.trim();
    if (mode.isEmpty) return null;

    final cacheKey = '${gdtfBytes.lengthInBytes}::$mode'.toLowerCase();
    final cached = _footprintCache[cacheKey];
    if (cached != null) return cached;

    final xml = _extractDescriptionXml(gdtfBytes);
    if (xml == null || xml.trim().isEmpty) return null;

    try {
      final doc = XmlDocument.parse(xml);

      // DMXModes/DMXMode
      final modes = doc.descendants.whereType<XmlElement>().where((e) {
        return e.name.local.toLowerCase() == 'dmxmode';
      }).toList();

      if (modes.isEmpty) return null;

      XmlElement? selected;

      // 1) match Name exact (case-insensitive)
      for (final m in modes) {
        final n = m.getAttribute('Name') ?? m.getAttribute('name') ?? '';
        if (n.trim().toLowerCase() == mode.toLowerCase()) {
          selected = m;
          break;
        }
      }

      // 2) fallback : match partiel (si le MVR donne "Mode 26" et GDTF "Mode 26ch")
      if (selected == null) {
        for (final m in modes) {
          final n =
              (m.getAttribute('Name') ?? m.getAttribute('name') ?? '').trim();
          if (n.isEmpty) continue;
          final nl = n.toLowerCase();
          final ml = mode.toLowerCase();
          if (nl.contains(ml) || ml.contains(nl)) {
            selected = m;
            break;
          }
        }
      }

      // Si aucun mode ne correspond (ni exact ni partiel), on ne devine pas :
      // prendre modes.first renverrait potentiellement le nombre de canaux
      // d'un mode totalement différent, ce qui est pire qu'un footprint
      // non résolu (qui, lui, retombe proprement sur 1 canal côté appelant).
      if (selected == null) return null;

      final footprint = _countDmxChannels(selected);
      if (footprint == null || footprint < 1) return null;

      _footprintCache[cacheKey] = footprint;
      return footprint;
    } catch (_) {
      return null;
    }
  }

  String? _extractDescriptionXml(Uint8List gdtfBytes) {
    try {
      final archive = ZipDecoder().decodeBytes(gdtfBytes, verify: true);

      ArchiveFile? best;

      // description.xml est le fichier principal dans un GDTF
      for (final f in archive.files) {
        if (!f.isFile) continue;
        final name = f.name.toLowerCase();
        if (name == 'description.xml' || name.endsWith('/description.xml')) {
          best = f;
          break;
        }
      }

      // fallback : premier .xml trouvé
      best ??= archive.files.cast<ArchiveFile?>().firstWhere(
            (f) =>
                f != null && f.isFile && f.name.toLowerCase().endsWith('.xml'),
            orElse: () => null,
          );

      if (best == null) return null;
      final content = best.readBytes();
      if (content == null) return null;

      return utf8.decode(content, allowMalformed: true);
    } catch (_) {
      return null;
    }
  }

  int? _countDmxChannels(XmlElement dmxModeElement) {
    // Dans un GDTF : DMXMode -> DMXChannels -> DMXChannel*
    final channelsContainers = dmxModeElement.findElements('DMXChannels');
    if (channelsContainers.isEmpty) {
      // Certains GDTF peuvent être en namespaces : on tente une recherche globale locale-name
      final container =
          dmxModeElement.descendants.whereType<XmlElement>().firstWhere(
                (e) => e.name.local.toLowerCase() == 'dmxchannels',
                orElse: () => dmxModeElement,
              );
      return _countDmxChannelChildren(container);
    }

    return _countDmxChannelChildren(channelsContainers.first);
  }

  int? _countDmxChannelChildren(XmlElement container) {
    int count = 0;

    // Compte les éléments DMXChannel (local-name insensitive)
    for (final e in container.descendants.whereType<XmlElement>()) {
      if (e.name.local.toLowerCase() == 'dmxchannel') {
        count++;
      }
    }

    return count >= 1 ? count : null;
  }

  // ─── Liste des modes (pour l'import local dans la console virtuelle) ──────

  /// Liste les noms de tous les DMXMode présents dans le fichier .gdtf.
  List<String> modeNames(Uint8List gdtfBytes) {
    final xml = _extractDescriptionXml(gdtfBytes);
    if (xml == null || xml.trim().isEmpty) return const [];

    try {
      final doc = XmlDocument.parse(xml);
      final modes = doc.descendants.whereType<XmlElement>().where((e) {
        return e.name.local.toLowerCase() == 'dmxmode';
      });

      final names = <String>[];
      for (final m in modes) {
        final n =
            (m.getAttribute('Name') ?? m.getAttribute('name') ?? '').trim();
        if (n.isNotEmpty) names.add(n);
      }
      return names;
    } catch (_) {
      return const [];
    }
  }

  // ─── Canaux nommés (pour la console virtuelle) ─────────────────────────────

  /// Retourne la liste des canaux DMX d'un mode, avec leur libellé lisible
  /// (Dimmer, Pan, Tilt, ColorAdd_R, ...) et leur offset relatif dans
  /// l'empreinte du mode (1 = premier canal du mode).
  ///
  /// Les "canaux virtuels" (Offset="None", pas d'adresse DMX) sont ignorés :
  /// on ne peut de toute façon pas les piloter avec un fader.
  /// Retourne null si le XML ou le mode est introuvable.
  List<GdtfDmxChannelInfo>? channelsForMode({
    required Uint8List gdtfBytes,
    required String modeName,
  }) {
    final mode = modeName.trim();
    if (mode.isEmpty) return null;

    final xml = _extractDescriptionXml(gdtfBytes);
    if (xml == null || xml.trim().isEmpty) return null;

    try {
      final doc = XmlDocument.parse(xml);

      final modes = doc.descendants.whereType<XmlElement>().where((e) {
        return e.name.local.toLowerCase() == 'dmxmode';
      }).toList();
      if (modes.isEmpty) return null;

      XmlElement? selected;
      for (final m in modes) {
        final n = m.getAttribute('Name') ?? m.getAttribute('name') ?? '';
        if (n.trim().toLowerCase() == mode.toLowerCase()) {
          selected = m;
          break;
        }
      }
      if (selected == null) {
        for (final m in modes) {
          final n =
              (m.getAttribute('Name') ?? m.getAttribute('name') ?? '').trim();
          if (n.isEmpty) continue;
          final nl = n.toLowerCase();
          final ml = mode.toLowerCase();
          if (nl.contains(ml) || ml.contains(nl)) {
            selected = m;
            break;
          }
        }
      }
      if (selected == null) return null;

      final channelsContainer = selected.findElements('DMXChannels').isNotEmpty
          ? selected.findElements('DMXChannels').first
          : selected.descendants.whereType<XmlElement>().firstWhere(
                (e) => e.name.local.toLowerCase() == 'dmxchannels',
                orElse: () => selected!,
              );

      final channelElements = channelsContainer.descendants
          .whereType<XmlElement>()
          .where((e) => e.name.local.toLowerCase() == 'dmxchannel')
          .toList();
      if (channelElements.isEmpty) return null;

      final result = <GdtfDmxChannelInfo>[];
      final usedLabels = <String, int>{};

      for (var i = 0; i < channelElements.length; i++) {
        final ch = channelElements[i];

        final offsetRaw = (ch.getAttribute('Offset') ?? '').trim();
        if (offsetRaw.isEmpty || offsetRaw.toLowerCase() == 'none') {
          continue; // canal virtuel, pas d'adresse DMX
        }
        final offsets = offsetRaw
            .split(',')
            .map((s) => int.tryParse(s.trim()))
            .whereType<int>()
            .toList();
        if (offsets.isEmpty) continue;

        var label = _labelForChannel(ch, index: i + 1);
        final seen = usedLabels[label];
        if (seen != null) {
          usedLabels[label] = seen + 1;
          label = '$label (${seen + 1})';
        } else {
          usedLabels[label] = 1;
        }

        result.add(GdtfDmxChannelInfo(
          label: label,
          offsets: offsets,
          defaultValue: _defaultValueForChannel(ch),
          presets: _presetsForChannel(ch),
        ));
      }

      if (result.isEmpty) return null;

      result.sort((a, b) => a.coarseOffset.compareTo(b.coarseOffset));
      return result;
    } catch (_) {
      return null;
    }
  }

  String _labelForChannel(XmlElement dmxChannel, {required int index}) {
    final logical = dmxChannel.findElements('LogicalChannel');
    if (logical.isNotEmpty) {
      final attr = (logical.first.getAttribute('Attribute') ?? '').trim();
      if (attr.isNotEmpty) return attr;
    }

    final initial = (dmxChannel.getAttribute('InitialFunction') ?? '').trim();
    if (initial.isNotEmpty) {
      final parts = initial.split('.');
      if (parts.length >= 2) return parts[1];
      return initial;
    }

    return 'Ch $index';
  }

  int _defaultValueForChannel(XmlElement dmxChannel) {
    final raw = (dmxChannel.getAttribute('Default') ?? '').trim();
    if (raw.isEmpty) return 0;
    final firstPart = raw.split('/').first.trim();
    final v = int.tryParse(firstPart);
    if (v == null) return 0;
    return v.clamp(0, 255);
  }

  /// Récupère les "ChannelSet" (valeurs nommées : Color1, Strobe rapide,
  /// Gobo 3, ...) présents sous un DMXChannel, tous ChannelFunction
  /// confondus. Triés par valeur DMX croissante, dédupliqués par nom.
  List<GdtfChannelPreset> _presetsForChannel(XmlElement dmxChannel) {
    final sets = dmxChannel.descendants
        .whereType<XmlElement>()
        .where((e) => e.name.local.toLowerCase() == 'channelset')
        .toList();
    if (sets.isEmpty) return const [];

    final result = <GdtfChannelPreset>[];
    final seenNames = <String>{};

    for (final s in sets) {
      final name = (s.getAttribute('Name') ?? '').trim();
      if (name.isEmpty) continue;
      if (!seenNames.add(name.toLowerCase())) continue;

      final fromRaw = (s.getAttribute('DMXFrom') ?? '').trim();
      final firstPart = fromRaw.split('/').first.trim();
      final value = int.tryParse(firstPart);
      if (value == null) continue;

      result.add(GdtfChannelPreset(name: name, dmxValue: value.clamp(0, 255)));
      if (result.length >= 40) break; // évite les roues à des dizaines de pas
    }

    result.sort((a, b) => a.dmxValue.compareTo(b.dmxValue));
    return result;
  }
}

/// Un canal DMX "pilotable" d'un mode GDTF : libellé lisible + offset(s)
/// relatifs dans l'empreinte du mode (ex: [1] en 8 bits, [1, 2] en 16 bits
/// coarse/fine — la console virtuelle ne pilote que l'octet coarse).
class GdtfDmxChannelInfo {
  final String label;
  final List<int> offsets;
  final int defaultValue;
  final List<GdtfChannelPreset> presets;

  const GdtfDmxChannelInfo({
    required this.label,
    required this.offsets,
    this.defaultValue = 0,
    this.presets = const [],
  });

  /// Offset (1-based) du premier octet (coarse) dans l'empreinte du mode.
  int get coarseOffset => offsets.first;

  bool get is16Bit => offsets.length >= 2;
}

/// Une valeur nommée d'un canal (ex: "Color1", "Strobe rapide", "Gobo 3"),
/// issue d'un ChannelSet GDTF : un raccourci pour amener le canal à cette
/// valeur DMX en un tap plutôt que de chercher la position au fader.
class GdtfChannelPreset {
  final String name;
  final int dmxValue;

  const GdtfChannelPreset({required this.name, required this.dmxValue});
}

/// Informations physiques d'un type de machine, telles que déclarées dans
/// le GDTF (poids, dimensions, consommation, présence d'un vrai modèle 3D).
/// Tous les champs sont optionnels : un GDTF incomplet ne doit jamais faire
/// planter le panneau de détails, juste masquer les champs manquants.
@immutable
class GdtfPhysicalInfo {
  /// Poids total en kilogrammes (PhysicalDescriptions/Properties/Weight).
  final double? weightKg;

  /// Hauteur des pieds en mètres (.../LegHeight), rarement utile mais peu
  /// coûteux à extraire tant qu'on lit déjà Properties.
  final double? legHeightM;

  /// Plage de température de fonctionnement (.../OperatingTemperature).
  final double? operatingTempLowC;
  final double? operatingTempHighC;

  /// Enveloppe dimensionnelle approximative : max(Length/Width/Height) sur
  /// tous les `<Model>` du GDTF. C'est une approximation volontaire (bbox
  /// globale, pas la géométrie précise par partie) — suffisante pour un
  /// panneau d'infos, pas pour du rendu de détail.
  final double? approxLengthM;
  final double? approxWidthM;
  final double? approxHeightM;

  /// Consommation électrique en watts : somme des ElectricalPayLoad trouvés
  /// sur les WiringObject de type consommateur. Best-effort : de nombreux
  /// GDTF ne renseignent pas ce champ, ou le renseignent par connecteur.
  final double? powerConsumptionWatts;

  /// Vrai si au moins un `<Model>` référence un fichier 3D réel (glb/3ds).
  /// Signal léger (présence d'un attribut File), pas une garantie que
  /// l'extraction/le chargement réussira réellement — voir [primaryModelName]
  /// et [GdtfReader.extractGlbBytes] pour la tentative effective.
  final bool hasReal3dModelFile;

  /// Nom (sans extension) du `<Model>` le plus volumineux (Length×Width×Height)
  /// parmi ceux qui référencent un fichier — c'est celui qu'on tente de
  /// charger comme représentation 3D "principale" de la fixture en phase 2.
  /// Null si aucun modèle exploitable n'a été trouvé.
  final String? primaryModelName;

  const GdtfPhysicalInfo({
    this.weightKg,
    this.legHeightM,
    this.operatingTempLowC,
    this.operatingTempHighC,
    this.approxLengthM,
    this.approxWidthM,
    this.approxHeightM,
    this.powerConsumptionWatts,
    this.hasReal3dModelFile = false,
    this.primaryModelName,
  });

  bool get hasAnyData =>
      weightKg != null ||
      legHeightM != null ||
      operatingTempLowC != null ||
      operatingTempHighC != null ||
      approxLengthM != null ||
      approxWidthM != null ||
      approxHeightM != null ||
      powerConsumptionWatts != null;
}
