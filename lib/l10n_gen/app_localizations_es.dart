// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'Universos DMX sobre Ethernet/UDP, nodes, broadcast vs unicast.\nLímites reales, estabilidad de red, RDM según hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX sobre IP (nodes, unicast/broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distancias típicas, buenas prácticas de show.';

  @override
  String get aboutCablingFiberTitle =>
      'Red — RJ45 / fibra / caudales y distancias';

  @override
  String get aboutComputingSubtitle =>
      'Caudales útiles, versiones, límites reales, trampas de marketing.';

  @override
  String get aboutComputingTitle =>
      'Informática — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutDmxSubtitle =>
      'Universos, direcciones, tramas, cableado RS-485, terminación, problemas de campo.\nIncluye esquemas + checklist.';

  @override
  String get aboutDmxTitle => 'DMX — funcionamiento (simple y completo)';

  @override
  String get aboutElectricitySubtitle =>
      'Conectores, mono/tri, tablas rápidas de kW (16A→400A), trampas de campo.';

  @override
  String get aboutElectricityTitle => 'Eléctrico — Schuko / P17 / potencias';

  @override
  String get aboutIpBasicsSubtitle =>
      'Comprender IP, máscara, puerta de enlace, DHCP vs estático.\nEjemplos concretos (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutIpBasicsTitle => 'Red — bases IP / máscara / DHCP (esencial)';

  @override
  String get aboutLightNetworkSubtitle =>
      'Arquitectura simple y robusta para Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switches, esquemas + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Red de iluminación — VLAN, IGMP, Wi-Fi vs cable';

  @override
  String get aboutSacnSubtitle =>
      'Estándar DMX sobre IP orientado a red “pro”.\nMulticast/unicast, IGMP snooping/querier, prioridades multi-fuente.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — multicast, IGMP, prioridades';

  @override
  String get aboutVideoSubtitle =>
      'Elegir según latencia, fiabilidad, cableado, LAN vs WAN.\nTablas + esquema.';

  @override
  String get aboutVideoTitle => 'Vídeo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get appTitle => 'Mi App Tech';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name — $channels canaux';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'Mode DMX ($count)';
  }

  @override
  String get catalogInfoDmxChannels => 'Canaux DMX';

  @override
  String get catalogInfoLuminousFlux => 'Flux lumineux';

  @override
  String get catalogInfoPower => 'Puissance';

  @override
  String get catalogInfoWeight => 'Poids';

  @override
  String catalogLastUpdate(Object date) {
    return 'Dernière mise à jour : $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Constructeur ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Modèle ($count)';
  }

  @override
  String get catalogNotProvided => 'Non renseigné';

  @override
  String get catalogOpenDmxChart => 'Ouvrir la table DMX';

  @override
  String get catalogOpenManual => 'Ouvrir le manuel';

  @override
  String get catalogResetTooltip => 'Réinitialiser';

  @override
  String catalogSyncError(Object message) {
    return 'Erreur : $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Échec de synchronisation : $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Échec de synchronisation (raison inconnue).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Type ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Mettre à jour';

  @override
  String get catalogUpdated => 'Catalogue mis à jour.';

  @override
  String get commonCalculate => 'Calcular';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonCopyResultTooltip => 'Copiar el resultado';

  @override
  String get commonDash => '—';

  @override
  String get commonNone => 'Sin registros';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonRename => 'Renombrar';

  @override
  String get commonReset => 'Restablecer';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonSearch => 'Buscar';

  @override
  String get commonTooLowWithCross => 'Demasiado bajo ❌';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Consentimientos restablecidos.';

  @override
  String get dipSwitchAddressHint => 'Ex : 1 à 512';

  @override
  String get dipSwitchAddressLabel => 'Adresse DMX';

  @override
  String get dipSwitchChannelUnit => 'canal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Attention : fin d’univers DMX atteinte.';

  @override
  String get dipSwitchInputsTitle => 'Entrées';

  @override
  String get dipSwitchIntervalHint => 'Ex : 4 (canaux)';

  @override
  String get dipSwitchIntervalLabel => 'Intervalle';

  @override
  String get dipSwitchModeAddressDirect => 'Adresse directe';

  @override
  String get dipSwitchModeAddressMinusOne => 'Adresse - 1';

  @override
  String get dipSwitchNextAddressButton => 'Adresse suivante';

  @override
  String get dipSwitchOffLabel => 'OFF';

  @override
  String get dipSwitchOnLabel => 'ON';

  @override
  String get dipSwitchResetTooltip => 'Réinitialiser';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Adresse : $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Adresse non renseignée';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binaire : $binary';
  }

  @override
  String get dipSwitchResultHeader => 'Résultat';

  @override
  String dipSwitchResultIntervalLine(Object end, Object start) {
    return 'Intervalle : $start → $end';
  }

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Mode : $mode';
  }

  @override
  String get dipSwitchScrollHint => 'Fais défiler pour voir tous les switchs.';

  @override
  String get dipSwitchSectionTitle => 'Switchs';

  @override
  String get dipSwitchSummaryTitle => 'Résumé';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Switch $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Utiliser le mode Adresse - 1';

  @override
  String get disclaimerAccept => 'Acepto';

  @override
  String get disclaimerCertify =>
      'Certifico que he leído y acepto estas condiciones.';

  @override
  String get disclaimerText =>
      'SOLO PARA USO INFORMATIVO\n\nLos cálculos proporcionados por esta aplicación (vídeo, luz, láser) son únicamente informativos y orientativos.\nNo sustituyen en ningún caso:\n- cálculos certificados,\n- estudios técnicos,\n- normas oficiales vigentes,\n- ni la validación por un profesional cualificado.\n\nRESPONSABILIDAD\nEl editor de esta aplicación no puede ser considerado responsable de errores de cálculo, omisiones, daños materiales,\nlesiones personales o cualquier incidente que ocurra durante la instalación, la explotación o el uso de los equipos.\n\nVÍDEO Y PROYECCIÓN\nLos resultados (tamaños, ratios, luminosidad, overlaps, etc.) se basan en modelos teóricos y pueden variar según:\nóptica, zoom, uniformidad, luz ambiente, superficie, ajustes, etc.\nVerifica siempre con la documentación oficial del fabricante.\n\nLUZ\n\nLos cálculos son orientativos y no tienen en cuenta todas las condiciones reales (tolerancias, pérdidas ópticas,\ndegradación de las fuentes, normas locales, condiciones ambientales…).\n\nLÁSER – SEGURIDAD\nLos cálculos NOHD, SZED y CZED se basan en hipótesis estándar y umbrales teóricos.\nNo tienen en cuenta, en particular:\n- instrumentos ópticos (prismáticos, cámaras, telescopios…),\n- condiciones atmosféricas (niebla, lluvia, polvo…),\n- reflejos imprevistos, usos indebidos, ajustes específicos.\nEl uso de un sistema láser implica responsabilidad directa del operador y un análisis de riesgos adecuado.\n\nACEPTACIÓN DE RIESGOS\nAl utilizar esta aplicación, el usuario reconoce:\n- haber leído las normas de seguridad aplicables,\n- ser el único responsable de sus instalaciones,\n- asumir toda la responsabilidad de los riesgos relacionados con el uso de los equipos (vídeo, luz, láser),\n- verificar sistemáticamente los datos con los manuales oficiales del fabricante.';

  @override
  String get disclaimerTitle =>
      '⚠️ ADVERTENCIA LEGAL Y EXENCIÓN DE RESPONSABILIDAD';

  @override
  String get homeLaserSubtitle =>
      'Cálculos y seguridad láser (consentimiento requerido en cada acceso).';

  @override
  String get homeLaserTitle => 'Láser';

  @override
  String get homeLightSubtitle =>
      'Tamaño de proyección, dip-switch DMX, fotometría, catálogo, patch DMX.';

  @override
  String get homeLightTitle => 'Luz';

  @override
  String get homeReferencesSubtitle =>
      'DMX / red / vídeo: fichas y referencias de campo.';

  @override
  String get homeReferencesTitle => 'Referencias';

  @override
  String get homeTitle => 'Inicio';

  @override
  String get homeVideoSubtitle =>
      'Lente y medición, luminosidad, multiproyector, LED y patrones de prueba.';

  @override
  String get homeVideoTitle => 'Vídeo';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Sistema (automático)';

  @override
  String get languageSystemCurrent => 'Idioma del teléfono';

  @override
  String get laserAdviceFullPower => 'Potencia total permitida (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Potencia máxima recomendada: $percent';
  }

  @override
  String get laserConsentCheckboxLabel =>
      'J’accepte et je comprends les risques.';

  @override
  String get laserConsentContinue => 'Continuer';

  @override
  String get laserConsentText =>
      'ACCESO A LA SECCIÓN LÁSER\n\nLa sección LÁSER de esta aplicación trata cálculos de seguridad (p. ej.: NOHD, SZED, CZED).\nEstos cálculos son orientativos y no sustituyen:\n- un análisis de riesgos,\n- las normas vigentes,\n- los procedimientos de explotación,\n- ni la validación por una persona cualificada.\n\nIMPORTANTE\n- Riesgo de lesiones oculares / cutáneas en caso de mal uso.\n- El cálculo puede ser incorrecto si los parámetros introducidos son incompletos, erróneos o si las condiciones reales difieren (óptica,\n  condiciones atmosféricas, reflejos, alineación, etc.).\n- El operador es el único responsable de la instalación, la explotación y el cumplimiento.\n\nAl validar, confirmas:\n- entender los riesgos,\n- respetar las normas de seguridad aplicables,\n- asumir toda la responsabilidad en caso de negligencia o mal uso.';

  @override
  String get laserConsentTitle => '🔴 CONSENTIMIENTO LÁSER (OBLIGATORIO)';

  @override
  String get laserDiameterHint => 'p. ej.: 3.0';

  @override
  String get laserDiameterLabel => 'Diámetro de salida (mm)';

  @override
  String get laserDisclaimerShort =>
      'Cálculo orientativo. No sustituye un análisis de seguridad láser.';

  @override
  String get laserDivergenceHint => 'p. ej.: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergencia (mrad)';

  @override
  String get laserInputsTitle => 'Entradas';

  @override
  String get laserInvalidInputs =>
      'Introduce valores válidos de potencia, divergencia y diámetro.';

  @override
  String get laserNameUpdated => 'Nombre actualizado.';

  @override
  String get laserNormativeParamsBody =>
      'MPE para la distancia nominal de peligro ocular (NOHD): 25,4 W/m²\n(Norma IEC 60825-1, edición 3.0)\n\nMPE para la distancia de exposición de la zona sensible (SZED): 1 W/m²\n(Norma ANSI Z136.6)\n\nMPE para la distancia de exposición de la zona crítica (CZED): 0,05 W/m²\n(Norma ANSI Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Parámetros de seguridad utilizados';

  @override
  String get laserPowerHint => 'p. ej.: 5000';

  @override
  String get laserPowerLabel => 'Potencia (mW)';

  @override
  String get laserPresetAdded => 'Registro añadido.';

  @override
  String get laserPresetDeleted => 'Registro eliminado.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Nombre del proyector';

  @override
  String get laserRenameProjectorTitle => 'Renombrar el proyector';

  @override
  String get laserSafetyResultsTitle => 'Resultados de seguridad';

  @override
  String get laserSaveCurrentProjector => 'Guardar este proyector';

  @override
  String get laserSaveProjectorTitle => 'Guardar un proyector';

  @override
  String get laserSavedProjectorsTitle => 'Proyectores guardados';

  @override
  String get laserSearchHint => 'p. ej.: “RGB 5W”';

  @override
  String get laserTargetDistanceHint => 'p. ej.: 10';

  @override
  String get laserTargetDistanceLabel => 'Distancia objetivo (m)';

  @override
  String get laserZoneCzedDesc => 'Zona crítica';

  @override
  String get laserZoneNohdDesc => 'Peligro ocular';

  @override
  String get laserZoneSzedDesc => 'Zona sensible';

  @override
  String get legalNotices => 'Avisos legales';

  @override
  String get lightCatalogDescription =>
      'Selección por fabricante, tipo y producto, con información y manual.';

  @override
  String get lightCatalogTitle => 'Catálogo';

  @override
  String get lightDisclaimerShort =>
      'Herramientas orientativas. Verifica siempre la documentación del fabricante.';

  @override
  String get lightDmxSwitchDescription =>
      'Conversión orientativa entre dirección DMX e interruptores, con navegación por intervalos.';

  @override
  String get lightDmxSwitchTitle => 'Dip-switch DMX';

  @override
  String get lightPatchDescription =>
      'Importar un archivo MVR o crear un patch manualmente desde la librería.';

  @override
  String get lightPatchTitle => 'Patch DMX';

  @override
  String get lightPhotometryDescription =>
      'Conversiones orientativas entre lux, candela y lumen, con distancia y ángulo.';

  @override
  String get lightPhotometryTitle => 'Fotometría';

  @override
  String get lightProjectionDescription =>
      'Cálculo orientativo del tamaño de la mancha según el ángulo, la distancia y el diámetro.';

  @override
  String get lightProjectionTitle => 'Tamaño de proyección';

  @override
  String get menuTitle => 'Menú';

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireDash => '—';

  @override
  String get mireErrInvalidOverlap => '❌ Overlap inválido (0 a 99.9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Número de proyectores inválido (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Ancho/alto inválidos (px).';

  @override
  String get mireExportPng => 'Exportar PNG';

  @override
  String get mireHeightPxHint => 'p. ej.: 1080';

  @override
  String get mireHeightPxHintMapping => 'p. ej.: 2160';

  @override
  String get mireHeightPxLabel => 'Alto (px)';

  @override
  String get mireLedErrTileCm => '❌ Introduce Tile cm (ancho/alto >0).';

  @override
  String get mireLedErrTilePx => '❌ Introduce Tile px (ancho/alto >0).';

  @override
  String get mireLedErrTilesXY => '❌ Introduce Tiles X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'Parámetros del muro LED';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Pitch calculado: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedSubtitleGridLabels => 'Rejilla + referencias + círculos';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedSubtitleUniformity => 'Uniformidad + círculos';

  @override
  String get mireLedTileHcmLabel => 'Tile alto (cm)';

  @override
  String get mireLedTileHpxLabel => 'Tile alto (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile ancho (cm)';

  @override
  String get mireLedTileWpxLabel => 'Tile ancho (px)';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireLedTilesXLabel => 'Tiles horizontales (X)';

  @override
  String get mireLedTilesYLabel => 'Tiles verticales (Y)';

  @override
  String get mireLedTitle => 'LED / PATRÓN';

  @override
  String get mireLedTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedTypeGridLabels => 'Rejilla + referencias + círculos';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedTypeTilesId => 'ID de tiles (número + colores)';

  @override
  String get mireLedTypeUniformity => 'Uniformidad + círculos';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Resolución muro: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Pitch calculado fuera de rango (0.5–20 mm). Revisa Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (tile no homogénea). Revisa dimensiones en cm y px.';

  @override
  String get mireMappingSectionTitle => 'Patrón de mapping multiproyector';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlap $percent% • $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Rampas de blend';

  @override
  String get mireMappingTypeCombo => 'Combo (zonas + overlap + blend)';

  @override
  String get mireMappingTypeLabel => 'Tipo de mapping';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonas + overlap';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientación';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String get mireOverlapHint => 'p. ej.: 10.0';

  @override
  String get mireOverlapLabel => 'Overlap (%)';

  @override
  String mirePitchEqual(Object value) {
    return '$value mm';
  }

  @override
  String mirePitchXY(Object x, Object y) {
    return 'X $x mm • Y $y mm';
  }

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROY $index';
  }

  @override
  String get mireProjectorsNHint => 'p. ej.: 2';

  @override
  String get mireProjectorsNLabel => 'Número de proyectores (N)';

  @override
  String get mireSimpleSectionTitle => 'Patrón de pantalla simple';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Damero + círculos';

  @override
  String get mireSimpleSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Rejilla + safe + 2 barras centradas + círculos';

  @override
  String get mireSimpleSubtitleGridSafe => 'Rejilla + safe + círculos';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformidad + círculos';

  @override
  String get mireSimpleTypeCheckerboard => 'Damero + círculos';

  @override
  String get mireSimpleTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (rejilla + círculos + 2 barras centradas)';

  @override
  String get mireSimpleTypeGridSafe => 'Rejilla + safe + círculos';

  @override
  String get mireSimpleTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireTileMissingPx => 'Introduce Tile (px) para la numeración.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px • Rejilla $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Pitch ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Pitch X $px • Y $py mm';
  }

  @override
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm) {
    return 'Tile $wcm×$hcm cm';
  }

  @override
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Muro ~ $wm×$hm m';
  }

  @override
  String get mireTypeLabel => 'Tipo de patrón';

  @override
  String get mireVideoComboTitle => 'VÍDEO / PATRÓN COMBO';

  @override
  String get mireVideoMappingSectionTitle => 'Patrón de mapping multiproyector';

  @override
  String get mireVideoMappingTitle => 'VÍDEO / PATRÓN MAPPING';

  @override
  String get mireVideoSimpleSectionTitle => 'Patrón de pantalla simple';

  @override
  String get mireVideoSimpleTitle => 'VÍDEO / PATRÓN SIMPLE';

  @override
  String get mireVideoTypeCheckerboard => 'Damero + círculos';

  @override
  String get mireVideoTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoTypeCombo =>
      'Combo (rejilla + círculos + 2 barras centradas)';

  @override
  String get mireVideoTypeGridSafe => 'Rejilla + safe + círculos';

  @override
  String get mireVideoTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireWallNotMultipleOfTiles => 'MURO NO MÚLTIPLO DE TILES';

  @override
  String get mireWidthPxHint => 'p. ej.: 1920';

  @override
  String get mireWidthPxHintMapping => 'p. ej.: 3840';

  @override
  String get mireWidthPxLabel => 'Ancho (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Adresse : $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Canaux utilisés : $count / 512';
  }

  @override
  String get patchConflictError => 'Conflit d’adresses (chevauchement).';

  @override
  String get patchConflictShort => 'Conflit';

  @override
  String patchConflicts(Object count) {
    return 'Conflits : $count';
  }

  @override
  String get patchEditChannelsLabel => 'Canaux';

  @override
  String get patchEditHint => 'Vérifie le mode et le nombre de canaux.';

  @override
  String get patchEditModeLabel => 'Mode';

  @override
  String get patchEditTitle => 'Édition';

  @override
  String get patchEmptyUniverse => 'Aucune machine dans cet univers.';

  @override
  String patchFixturesCount(Object count) {
    return 'Machines : $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'Les résultats sont indicatifs. Vérifie toujours avec la console.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analyser un fichier MVR et charger le patch en référence.';

  @override
  String get patchHomeImportMvrTitle => 'Importer un MVR';

  @override
  String get patchHomeTitle => 'Patch DMX';

  @override
  String get patchHomeViewPatchDescription => 'Liste et conflits par univers.';

  @override
  String get patchHomeViewPatchTitle => 'Voir le patch';

  @override
  String get patchHubOpenGridButton => 'Ouvrir grille';

  @override
  String get patchHubOpenMvrButton => 'Ouvrir MVR';

  @override
  String get patchHubStateEmpty => 'Aucune référence chargée.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Chargé : $count univers';
  }

  @override
  String get patchHubStateTitle => 'État';

  @override
  String get patchHubTitle => 'Hub Patch';

  @override
  String get patchHubWorksiteBody =>
      'Importer un MVR ou consulter la grille d’occupation.';

  @override
  String get patchHubWorksiteTitle => 'Chantier';

  @override
  String get patchInvalidChannelCount => 'Nombre de canaux invalide.';

  @override
  String get patchIssueInvalidChannelCount =>
      'Le nombre de canaux doit être supérieur ou égal à 1.';

  @override
  String get patchIssueInvalidStartAddress =>
      'L’adresse DMX doit être comprise entre 1 et 512.';

  @override
  String get patchIssueInvalidUniverse =>
      'L’univers doit être supérieur ou égal à 1.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'La plage de canaux dépasse 512 dans cet univers.';

  @override
  String get patchIssueUnknown => 'Erreur inconnue.';

  @override
  String get patchListTitle => 'Liste';

  @override
  String get patchManualDisabledBody =>
      'Le patch est en lecture seule lorsqu’une référence MVR est chargée.';

  @override
  String get patchManualDisabledTitle => 'Désactivé';

  @override
  String get patchManualTitle => 'Patch manuel';

  @override
  String patchModeLabel(Object mode) {
    return 'Mode : $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Analyse…';

  @override
  String get patchMvrButtonLoadAsReference => 'Charger comme référence';

  @override
  String get patchMvrButtonPickFile => 'Choisir un fichier';

  @override
  String get patchMvrClearTooltip => 'Effacer';

  @override
  String get patchMvrColAddress => 'Adresse';

  @override
  String get patchMvrColChannels => 'Canaux';

  @override
  String get patchMvrColId => 'ID';

  @override
  String get patchMvrColName => 'Nom';

  @override
  String get patchMvrColUniverse => 'Univers';

  @override
  String get patchMvrColumnsHint =>
      'Colonnes : ID, Nom, Univers, Adresse, Canaux';

  @override
  String get patchMvrFileCardHelp =>
      'Sélectionne un fichier .mvr (ZIP) pour analyser le patch.';

  @override
  String get patchMvrFileCardTitle => 'Fichier';

  @override
  String get patchMvrFilterAllUniverses => 'Tous les univers';

  @override
  String get patchMvrFilterUniverseLabel => 'Filtrer par univers';

  @override
  String get patchMvrModeNotProvided => 'Mode non renseigné';

  @override
  String get patchMvrOrderAsc => 'Croissant';

  @override
  String get patchMvrOrderDesc => 'Décroissant';

  @override
  String get patchMvrOrderLabel => 'Ordre';

  @override
  String get patchMvrSortAddress => 'Adresse';

  @override
  String get patchMvrSortByLabel => 'Trier par';

  @override
  String get patchMvrSortChannels => 'Canaux';

  @override
  String get patchMvrSortId => 'ID';

  @override
  String get patchMvrSortName => 'Nom';

  @override
  String get patchMvrSortUniverse => 'Univers';

  @override
  String get patchMvrSortUniverseThenAddress => 'Univers puis adresse';

  @override
  String get patchMvrStatusCleared => 'Référence effacée.';

  @override
  String get patchMvrStatusEmptyBytes => 'Fichier vide.';

  @override
  String get patchMvrStatusExtractingZip => 'Extraction du ZIP…';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'Sélection de fichier impossible : $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Machines trouvées : $count (multi-canaux : $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Chargement des GDTF…';

  @override
  String get patchMvrStatusNoContentToLoad => 'Aucun contenu à charger.';

  @override
  String get patchMvrStatusNoFileSelected => 'Aucun fichier sélectionné.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'Aucune machine exploitable trouvée.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Erreur de parsing : $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Analyse du contenu…';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Référence chargée : $count machine(s) (ignorées : $skipped, empreintes GDTF : $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Restauration : $count machines';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml introuvable dans le MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'Sélection du fichier…';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Fichier non supporté : $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Résumé';

  @override
  String get patchMvrTitle => 'Import MVR';

  @override
  String patchMvrUniverseItem(Object universe) {
    return 'Univers $universe';
  }

  @override
  String get patchPageTitle => 'Patch';

  @override
  String get patchSummaryTitle => 'Résumé';

  @override
  String get patchUniverseAppBarTitle => 'Patch';

  @override
  String patchUniverseConflictCount(Object count) {
    return 'Conflits : $count canal(aux)';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Limité par la largeur de l’écran.';

  @override
  String get patchUniverseGridTitle => 'Occupation (1 à 512)';

  @override
  String patchUniverseItem(Object universe) {
    return 'Univers $universe';
  }

  @override
  String get patchUniverseLabel => 'Univers';

  @override
  String get patchUniverseLegendConflict => 'Conflit';

  @override
  String get patchUniverseLegendFree => 'Libre';

  @override
  String get patchUniverseLegendOccupied => 'Occupé';

  @override
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start) {
    return '• $fixture\n  $mode — $channels canal(aux)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Occupés : $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Univers $universe — Adresse $address\nÉtat : $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Plusieurs machines occupent ce canal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '… et $count autre(s).';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Conflit';

  @override
  String get patchUniversePopupTitleFree => 'Canal libre';

  @override
  String get patchUniversePopupTitleOccupied => 'Canal occupé';

  @override
  String get patchUniverseReferenceNone => 'Aucune référence chargée';

  @override
  String get patchUniverseReferenceReadOnly => 'Lecture seule (depuis MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Référence';

  @override
  String get patchUniverseResetConfirm => 'Réinitialiser';

  @override
  String get patchUniverseResetContent =>
      'Cela efface le patch chargé depuis le MVR dans l’application.\nAucune donnée du fichier n’est modifiée.';

  @override
  String get patchUniverseResetTitle => 'Réinitialiser la référence ?';

  @override
  String get patchUniverseResetTooltip => 'Réinitialiser la référence';

  @override
  String get patchUniverseSelected => 'Univers sélectionné';

  @override
  String get patchUniverseStateConflict => 'Conflit';

  @override
  String get patchUniverseStateFree => 'Libre';

  @override
  String get patchUniverseStateOccupied => 'Occupé';

  @override
  String get patchUniverseTapHint => 'Touche une case pour afficher le détail.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'Univers DMX';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Univers $universe';
  }

  @override
  String get patchUniverseUniverseTitle => 'Univers';

  @override
  String get patchUniverseZoomIn => 'Agrandir';

  @override
  String get patchUniverseZoomOut => 'Réduire';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'En degrés';

  @override
  String get photometryBeamAngleHint3 => 'En degrés';

  @override
  String get photometryBeamAngleLabel => 'Angle de faisceau';

  @override
  String get photometryCandelaHint1 => 'Entrez une valeur en cd';

  @override
  String get photometryCandelaHint2 => 'Entrez une valeur en cd';

  @override
  String get photometryCandelaLabel => 'Candela';

  @override
  String get photometryDisclaimerShort =>
      'Indication uniquement. Vérifie avec la documentation constructeur.';

  @override
  String get photometryDistanceHint1 => 'En mètres';

  @override
  String get photometryDistanceHint3 => 'En mètres';

  @override
  String get photometryDistanceLabel => 'Distance';

  @override
  String get photometryLumensHint2 => 'Entrez une valeur en lm';

  @override
  String get photometryLumensHint3 => 'Entrez une valeur en lm';

  @override
  String get photometryLumensLabel => 'Lumens';

  @override
  String get photometryLuxHint => 'Entrez une valeur en lux';

  @override
  String get photometryLuxLabel => 'Lux';

  @override
  String get photometrySection1Title => 'Section 1';

  @override
  String get photometrySection2Title => 'Section 2';

  @override
  String get photometrySection3Title => 'Section 3';

  @override
  String photometrySummary1(Object candela, Object distance, Object lux) {
    return 'À $distance m, $candela cd ≈ $lux lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'À $distance m, $lumens lm ≈ $lux lux (approx.).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumens : $lumens lm — Distance : $distance m — Angle : $angle° — Lux : $lux lx.';
  }

  @override
  String get projectionAngleHint => 'En degrés';

  @override
  String get projectionAngleLabel => 'Angle';

  @override
  String get projectionAutoHelp => 'Auto : calcule la valeur manquante.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Angle : $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diamètre : $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Distance : $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Angle : $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Diamètre : $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Distance : $distance m';
  }

  @override
  String get projectionDiameterHint => 'En mètres';

  @override
  String get projectionDiameterLabel => 'Diamètre';

  @override
  String get projectionDistanceHint => 'En mètres';

  @override
  String get projectionDistanceLabel => 'Distance';

  @override
  String get projectionHeaderAutoActive => 'Auto actif';

  @override
  String get projectionHeaderNeedTwoValues =>
      'Renseigne au moins deux valeurs.';

  @override
  String get projectionInputsTitle => 'Entrées';

  @override
  String get projectionResultsTitle => 'Résultats';

  @override
  String get resetConsents => 'Restablecer consentimientos';

  @override
  String get settings => 'Ajustes';

  @override
  String videoBrightnessResult(
      Object area,
      Object fl,
      Object format,
      Object lux,
      Object luxEq,
      Object minFl,
      Object nits,
      Object presetLabel,
      Object status) {
    return 'Formato: $format\nSuperficie: $area m²\nLux (lm/m²): $lux\nLux eq (ganancia): $luxEq\nLuminancia: $nits nits | $fl ft-L\nUmbral mínimo ($presetLabel): $minFl ft-L → $status\nNota: estimación orientativa (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Cálculo 4 — Lux / nits / ft-L + umbral';

  @override
  String get videoBrightnessSubtitle =>
      'Lux / nits / ft-L + umbral (cálculo 4).';

  @override
  String get videoBrightnessTitle => 'Luminosidad';

  @override
  String get videoCalc1ErrMissing => '❌ Datos faltantes: Distancia + Ancho.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Ratio de proyección = $ratio';
  }

  @override
  String get videoCalc1Title => 'Cálculo 1 — Ratio (Distancia / Ancho)';

  @override
  String get videoCalc2ErrMissing => '❌ Datos faltantes: Distancia + Ratio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Ancho de imagen = $width m';
  }

  @override
  String get videoCalc2Title => 'Cálculo 2 — Ancho (Distancia / Ratio)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Dato faltante: Ancho.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Alto = $height m (formato $format)';
  }

  @override
  String get videoCalc3Title => 'Cálculo 3 — Alto (Ancho + Formato)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lúmenes/Ganancia/Ancho deben ser > 0.';

  @override
  String get videoCalc4ErrMissing =>
      '❌ Datos faltantes: Lúmenes + Ganancia + Ancho.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Datos faltantes: Ancho + Lúmenes + Ganancia.';

  @override
  String videoCalc4Result(
      Object area,
      Object fl,
      Object format,
      Object lux,
      Object luxEq,
      Object minFl,
      Object nits,
      Object presetLabel,
      Object status) {
    return 'Superficie: $area m² (formato $format)\nLux (lm/m²): $lux\nLux eq (ganancia): $luxEq\nLuminancia: $nits nits | $fl ft-L\nUmbral mínimo ($presetLabel): $minFl ft-L → $status\nNota: conversión nits/ft-L basada en una hipótesis lambertiana (aprox).';
  }

  @override
  String get videoCalc4Title =>
      'Cálculo 4 — Luminosidad (lux / nits / ft-L + umbral)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Datos faltantes: Ancho total + Overlap% + Número de proyectores.';

  @override
  String get videoCalc5ErrNMin2 => '❌ El número de proyectores debe ser ≥ 2.';

  @override
  String get videoCalc5NHint => 'p. ej.: 2';

  @override
  String get videoCalc5NLabel => 'Número de proyectores (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Ancho total: $wTot m\nN: $n | Overlap: $overlapPct% (sobre el ancho del proyector)\n\n- Ancho por proyector: $wPer m\n- Overlap entre 2 proyectores: $overlapM m\n- Alto total (formato $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Cálculo 5 — Overlap (Ancho total + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Datos faltantes: Ancho total + Distancia + Overlap%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Datos faltantes: Ratio min y/o Ratio max.';

  @override
  String get videoCalc6GainHint => 'p. ej.: 1.0';

  @override
  String get videoCalc6GainLabel => 'Ganancia (calc 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'p. ej.: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lúmenes por proyector';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Luminosidad: ❌ Lúmenes/proyector y ganancia deben ser > 0.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosidad estimada (N=$n)\nSuperficie: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Luminosidad (opcional): introduce Lúmenes/proyector + Ganancia para la estimación.';

  @override
  String get videoCalc6NoteIndicative =>
      'Nota: estimación orientativa (el blend/overlap real puede reducir ligeramente).';

  @override
  String get videoCalc6RatioMaxHint => 'p. ej.: 1.80';

  @override
  String get videoCalc6RatioMaxLabel => 'Ratio max';

  @override
  String get videoCalc6RatioMinHint => 'p. ej.: 1.20';

  @override
  String get videoCalc6RatioMinLabel => 'Ratio min';

  @override
  String videoCalc6Result(
      Object area,
      Object covMax,
      Object covMin,
      Object distance,
      Object format,
      Object hTot,
      Object lumiMax,
      Object lumiMin,
      Object nMax,
      Object nMin,
      Object note,
      Object overlapPct,
      Object ratioMax,
      Object ratioMin,
      Object wTot) {
    return 'Ancho total=$wTot m | Distancia=$distance m | Overlap=$overlapPct%\nFormato $format → Alto total=$hTot m | Superficie=$area m²\nRatio min/max: $ratioMin → $ratioMax\n\nCaso ratio más abierto (min) = $nMin proyectores | cobertura ≈ $covMin m\n$lumiMin\n\nCaso ratio más cerrado (max) = $nMax proyectores | cobertura ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title =>
      'Cálculo 6 — Nº de proyectores auto + luminosidad';

  @override
  String videoCalcLabel(Object n) {
    return 'Cálculo $n';
  }

  @override
  String get videoCalculateAll => 'Calcular todo';

  @override
  String get videoCalculationsTitle => 'Cálculos de vídeo';

  @override
  String get videoCommonParamsTitle => 'Parámetros comunes';

  @override
  String videoCommonPillArea(Object value) {
    return 'Superficie: $value';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Distancia: $value';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Formato: $format';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Alto: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlap: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Ratio: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Ancho total: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Ancho: $value';
  }

  @override
  String get videoCopyAllTooltip => 'Copiar todos los resultados';

  @override
  String get videoCopySummaryTooltip => 'Copiar el resumen';

  @override
  String get videoDisclaimerShort =>
      'Cálculos orientativos. Verifica siempre la documentación del fabricante.';

  @override
  String get videoDistanceHint => 'p. ej.: 12.0';

  @override
  String get videoDistanceLabel => 'Distancia de proyección (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Parámetros imposibles (denom ≤ 0).';

  @override
  String get videoErrOverlapRange => '❌ Overlap% debe estar entre 0 y 99.9.';

  @override
  String get videoErrRatioGt0 => '❌ El ratio debe ser > 0.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ El ancho total y la distancia deben ser > 0.';

  @override
  String get videoErrTotalWidthGt0 => '❌ El ancho total debe ser > 0.';

  @override
  String get videoErrWidthGt0 => '❌ El ancho debe ser > 0.';

  @override
  String get videoExportPdfTooltip => 'Exportar PDF';

  @override
  String get videoFormatLabel => 'Formato (ratio)';

  @override
  String get videoGainHint => 'p. ej.: 1.0';

  @override
  String get videoGainLabel => 'Ganancia';

  @override
  String get videoImageWidthHint => 'p. ej.: 6.0';

  @override
  String get videoImageWidthLabel => 'Ancho de imagen (m)';

  @override
  String get videoLedCalcTitle => 'Cálculo — Píxeles / tiles';

  @override
  String get videoLedErrAllGt0 => '❌ Todos los valores deben ser > 0.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Datos faltantes: Tiles X/Y + Tile px + Tile cm.';

  @override
  String videoLedPitchUniform(Object value) {
    return '$value mm';
  }

  @override
  String videoLedPitchXY(Object x, Object y) {
    return 'X $x mm • Y $y mm';
  }

  @override
  String videoLedResult(
      Object pitch,
      Object tileHcm,
      Object tileHpx,
      Object tileWcm,
      Object tileWpx,
      Object wallHm,
      Object wallHpx,
      Object wallWm,
      Object wallWpx) {
    return '✅ Resolución muro: $wallWpx × $wallHpx px\n✅ Tamaño muro: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nPitch calculado: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Píxeles del muro LED según tamaño, pitch y dimensiones de las tiles.';

  @override
  String get videoLedTileHcmHint => 'p. ej.: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile alto (cm)';

  @override
  String get videoLedTileHpxHint => 'p. ej.: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile alto (px)';

  @override
  String get videoLedTileWcmHint => 'p. ej.: 33.28';

  @override
  String get videoLedTileWcmLabel => 'Tile ancho (cm)';

  @override
  String get videoLedTileWpxHint => 'p. ej.: 128';

  @override
  String get videoLedTileWpxLabel => 'Tile ancho (px)';

  @override
  String get videoLedTilesXHint => 'p. ej.: 15';

  @override
  String get videoLedTilesXLabel => 'Tiles horizontales (X)';

  @override
  String get videoLedTilesYHint => 'p. ej.: 8';

  @override
  String get videoLedTilesYLabel => 'Tiles verticales (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Ratio / ancho / alto (cálculos 1 a 3).';

  @override
  String get videoLensMeasureTitle => 'Lente y medición';

  @override
  String get videoLmCalc1Title => 'Cálculo 1 — Ratio (Distancia / Ancho)';

  @override
  String get videoLmCalc2Title => 'Cálculo 2 — Ancho (Distancia / Ratio)';

  @override
  String get videoLmCalc3Title => 'Cálculo 3 — Alto (Ancho + Formato)';

  @override
  String get videoLmDistanceHint => 'p. ej.: 12.0';

  @override
  String get videoLmDistanceLabel => 'Distancia de proyección (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Datos faltantes: Distancia + Ratio.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Datos faltantes: Distancia + Ancho.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Dato faltante: Ancho.';

  @override
  String get videoLmErrRatioGt0 => '❌ El ratio debe ser > 0.';

  @override
  String get videoLmErrWidthGt0 => '❌ El ancho debe ser > 0.';

  @override
  String get videoLmFormatLabel => 'Formato (ratio)';

  @override
  String get videoLmImageWidthHint => 'p. ej.: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Ancho de imagen (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Alto = $height m (formato $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Ratio de proyección = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Ancho de imagen = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'p. ej.: 1.60';

  @override
  String get videoLmThrowRatioLabel => 'Ratio de proyección';

  @override
  String get videoLumensHint => 'p. ej.: 20000';

  @override
  String get videoLumensLabel => 'Lúmenes (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Patrones orientativos (ajuste, enfoque, geometría, blend, pixel perfect).';

  @override
  String get videoMireHeaderTitle => 'Generador de patrones de prueba';

  @override
  String get videoMireScreenLedSubtitle =>
      'Patrón según An×Al px (pixel perfect, uniformidad, rejilla).';

  @override
  String get videoMireScreenLedTitle => 'Patrón para pantalla LED';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simple (An×Al px) + mapping multiproyector (N + overlap).';

  @override
  String get videoMireScreenVideoTitle => 'Patrón para pantalla de vídeo';

  @override
  String get videoMireTitle => 'Patrón de prueba';

  @override
  String get videoMpCalc5Title => 'Cálculo 5 — Ancho por proyector';

  @override
  String get videoMpCalc6Title =>
      'Cálculo 6 — Número de proyectores (ratio min/max)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Caso ratio más abierto (min) = $n proyectores | cobertura ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Caso ratio más cerrado (max) = $n proyectores | cobertura ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'p. ej.: 12.0';

  @override
  String get videoMpDistanceLabel => 'Distancia de proyección (m)';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Parámetros imposibles (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => '❌ Ratio inválido (debe ser > 0).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Datos faltantes: Ancho total + Overlap% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Datos faltantes: Ancho total + Distancia + Overlap%.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Datos faltantes: Ratio min y/o Ratio max.';

  @override
  String get videoMpErrNGte2 => '❌ N debe ser ≥ 2.';

  @override
  String get videoMpErrOverlapRange => '❌ Overlap% debe estar entre 0 y 99.9.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ El ancho total y la distancia deben ser > 0.';

  @override
  String get videoMpErrWidthGt0 => '❌ El ancho total debe ser > 0.';

  @override
  String get videoMpFormatLabel => 'Formato (ratio)';

  @override
  String get videoMpGainHint => 'p. ej.: 1.0';

  @override
  String get videoMpGainLabel => 'Ganancia';

  @override
  String get videoMpLumensPerProjectorHint => 'p. ej.: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lúmenes por proyector';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Luminosidad: ❌ Lúmenes/proyector y ganancia deben ser > 0.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosidad estimada (N=$n)\nSuperficie: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Luminosidad (opcional): introduce Lúmenes/proyector + Ganancia para estimar.';

  @override
  String get videoMpNoteIndicative => 'Nota: estimación orientativa.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Opcional: luminosidad';

  @override
  String get videoMpOverlapHint => 'p. ej.: 10';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpProjectorCountHint => 'p. ej.: 2';

  @override
  String get videoMpProjectorCountLabel => 'Número de proyectores (N)';

  @override
  String get videoMpRatioMaxHint => 'p. ej.: 1.80';

  @override
  String get videoMpRatioMaxLabel => 'Ratio max';

  @override
  String get videoMpRatioMinHint => 'p. ej.: 1.20';

  @override
  String get videoMpRatioMinLabel => 'Ratio min';

  @override
  String get videoMpTotalWidthHint => 'p. ej.: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Ancho total de proyección (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + ancho/proyector + número de proyectores (cálculos 5 y 6).';

  @override
  String get videoMultiprojectorTitle => 'Multiproyector';

  @override
  String get videoOptionalBrightnessTitle => 'Opcional: luminosidad';

  @override
  String get videoOverlapHint => 'p. ej.: 10';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoPdfCalc1 => 'Cálculo 1';

  @override
  String get videoPdfCalc2 => 'Cálculo 2';

  @override
  String get videoPdfCalc3 => 'Cálculo 3';

  @override
  String get videoPdfCalc4 => 'Cálculo 4';

  @override
  String get videoPdfCalc5 => 'Cálculo 5';

  @override
  String get videoPdfCalc5N => 'N (Calc5)';

  @override
  String get videoPdfCalc6 => 'Cálculo 6';

  @override
  String get videoPdfCalc6Gain => 'Ganancia (Calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lúmenes/proyector (Calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Ratio max (Calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Ratio min (Calc6)';

  @override
  String get videoPdfDate => 'Fecha';

  @override
  String get videoPdfDistance => 'Distancia (m)';

  @override
  String get videoPdfFormat => 'Formato';

  @override
  String get videoPdfGain => 'Ganancia';

  @override
  String get videoPdfImageWidth => 'Ancho de imagen (m)';

  @override
  String get videoPdfLumens => 'Lúmenes';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfParams => 'Parámetros';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfResults => 'Resultados';

  @override
  String get videoPdfScreenPreset => 'Preset de pantalla';

  @override
  String get videoPdfTitle => 'Mon App Technique – Exportación de vídeo';

  @override
  String get videoPdfTotalWidth => 'Ancho total (m)';

  @override
  String get videoPresetFrontGrey => 'Frontal - pantalla gris (ganancia 0.8)';

  @override
  String get videoPresetFrontGreyShort => 'Frontal - pantalla gris';

  @override
  String get videoPresetFrontHighGain =>
      'Frontal - pantalla high gain (ganancia 1.3)';

  @override
  String get videoPresetFrontHighGainShort => 'Frontal - pantalla high gain';

  @override
  String get videoPresetFrontWhite =>
      'Frontal - pantalla blanca mate (ganancia 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Frontal - pantalla blanca mate';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping - piedra oscura (ganancia 0.35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping - piedra oscura';

  @override
  String get videoPresetMappingGlass => 'Mapping - vidrio (ganancia 0.15)';

  @override
  String get videoPresetMappingGlassShort => 'Mapping - vidrio';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping - piedra clara (ganancia 0.6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping - piedra clara';

  @override
  String get videoPresetMappingMatte =>
      'Mapping - pintura mate (ganancia 0.75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - pintura mate';

  @override
  String get videoPresetMappingSatin =>
      'Mapping - pintura satinada (ganancia 0.9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - pintura satinada';

  @override
  String get videoPresetRearClear => 'Retro - tela clara (ganancia 0.9)';

  @override
  String get videoPresetRearClearShort => 'Retro - tela clara';

  @override
  String get videoPresetRearDiffusion =>
      'Retro - tela de difusión (ganancia 0.7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - tela de difusión';

  @override
  String get videoScreenPresetLabel => 'Pantalla / Superficie (preset)';

  @override
  String get videoSummaryPillsTitle => 'Resumen (pastillas)';

  @override
  String get videoTestPatternSubtitle =>
      'Creación de patrones de prueba para pantallas y muros LED (más adelante).';

  @override
  String get videoTestPatternTitle => 'Patrón de prueba';

  @override
  String get videoThrowRatioHint => 'p. ej.: 1.60';

  @override
  String get videoThrowRatioLabel => 'Ratio de proyección';

  @override
  String get videoTitle => 'Vídeo';

  @override
  String get videoToolsTitle => 'Herramientas de vídeo';

  @override
  String get videoTotalWidthHint => 'p. ej.: 18.0';

  @override
  String get videoTotalWidthLabel => 'Ancho total de proyección (m)';

  @override
  String get aboutArtnetTitle => 'Art-Net';

  @override
  String get aboutArtnetToc01 => '1) Art-Net — c’est quoi et pourquoi';

  @override
  String get aboutArtnetToc02 => '2) Adressage & univers — mapping propre';

  @override
  String get aboutArtnetToc03 => '3) Limites & perf — ce qui casse en premier';

  @override
  String get aboutArtnetToc04 => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetToc05 => '5) Dépannage — symptômes → causes';

  @override
  String get aboutArtnetToc06 => '6) Schémas (réseau / unicast vs broadcast)';

  @override
  String get aboutArtnetToc07 => '6bis) Images (assets) — RJ45/switch/câbles';

  @override
  String get aboutArtnetToc08 => '7) Checklist rapide';

  @override
  String get aboutDmxToc01 => '1) DMX, univers, adresses — la base';

  @override
  String get aboutDmxToc02 => '2) Trame DMX — break, start code, canaux';

  @override
  String get aboutDmxToc03 => '3) Câblage RS-485 — topologie & câble';

  @override
  String get aboutDmxToc04 =>
      '4) Terminaison & splitters — éviter les réflexions';

  @override
  String get aboutDmxToc05 => '4bis) RDM — limites & compatibilités';

  @override
  String get aboutDmxToc06 => '5) Dépannage terrain — symptômes → causes';

  @override
  String get aboutDmxToc07 => '6) Art-Net — repères terrain';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutDmxToc09 => '8) DMX vs Art-Net vs sACN — choisir';

  @override
  String get aboutDmxToc10 => '9) Schémas terrain (DMX / IP / pinout)';

  @override
  String get aboutDmxToc11 => '10) Checklist rapide';

  @override
  String get aboutElectriciteTitle => 'Électricité';

  @override
  String get aboutElectriciteToc01 => '1) Bases (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 =>
      '2) Connecteurs (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono / Tri (ce que ça change)';

  @override
  String get aboutElectriciteToc04 => '4) Table rapide (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Sécurité & pièges terrain';

  @override
  String get aboutElectriciteToc06 => '6) Checklist';

  @override
  String get aboutInformatiqueTitle => 'Informatique';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Stockage (SATA / NVMe / SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Liaisons vidéo (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe / GPU (repères)';

  @override
  String get aboutInformatiqueToc05 => '5) Checklist (plateau)';

  @override
  String get aboutIpBasicsToc01 => '1) C’est quoi une IP et à quoi ça sert ?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Pourquoi 192.x / 10.x / 172.x ? (adresses privées)';

  @override
  String get aboutIpBasicsToc03 =>
      '3) Masque & sous-réseaux : comprendre pour de vrai';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, passerelle, DNS : qui fait quoi ?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Comment deux appareils se parlent (LAN vs hors LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Plans IP “show” simples (exemples prêts à copier)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Dépannage : symptômes → causes (méthode terrain)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-exercices (vérifier vite un masque / un réseau)';

  @override
  String get aboutIpBasicsToc09 => '9) Checklist rapide';

  @override
  String get aboutNetworkTitle => 'Network (EN)';

  @override
  String get aboutNetworkToc01 => '1) Objectif: réseau stable';

  @override
  String get aboutNetworkToc02 => '2) Plan IP (simple)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (séparation)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi vs filaire';

  @override
  String get aboutNetworkToc06 => '6) Switch: ce qu’il faut';

  @override
  String get aboutNetworkToc07 => '7) Schémas';

  @override
  String get aboutNetworkToc08 => '7bis) Images (assets)';

  @override
  String get aboutNetworkToc09 => '8) Checklist';

  @override
  String get aboutReseauTitle => 'Réseau';

  @override
  String get aboutReseauToc01 => '1) Bases réseau (LAN / IP / débit)';

  @override
  String get aboutReseauToc02 => '2) RJ45 & catégories (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc03 => '3) PoE (alimentation réseau)';

  @override
  String get aboutReseauToc04 => '4) Fibre (SM/MM) + connecteurs (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc06 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN sur réseau (conseils)';

  @override
  String get aboutReseauToc08 => '8) Checklist';

  @override
  String get aboutSacnToc01 => '1) À quoi sert sACN ?';

  @override
  String get aboutSacnToc02 => '2) Univers (numérotation)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Priorités (multi-sources)';

  @override
  String get aboutSacnToc05 => '5) Limites / perfs';

  @override
  String get aboutSacnToc06 => '6) RDM & sACN (proxy / selon matériel)';

  @override
  String get aboutSacnToc07 => '7) Schémas';

  @override
  String get aboutSacnToc08 => '7bis) Images (assets)';

  @override
  String get aboutSacnToc09 => '8) Checklist';

  @override
  String get aboutVideoToc01 => '1) Bases vidéo (mots-clés)';

  @override
  String get aboutVideoToc02 => '2) Résolution & FPS';

  @override
  String get aboutVideoToc03 => '3) Couleur (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc04 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc05 => '5) Câbles & distances';

  @override
  String get aboutVideoToc06 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI — terrain';

  @override
  String get aboutVideoToc08 => '8) NDI — quand / pourquoi / limites';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / multi-projo';

  @override
  String get aboutVideoToc10 => '10) Checklist terrain';

  @override
  String get aboutTileDmxTitle => 'DMX — fonctionnement (simple & complet)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net — DMX sur IP (nodes, unicast/broadcast)';

  @override
  String get aboutTileSacnTitle => 'sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutTileIpBasicsTitle =>
      'Réseau — bases IP / masque / DHCP (essentiel)';

  @override
  String get aboutTileReseauTitle =>
      'Réseau — RJ45 / Fibre / débits & longueurs';

  @override
  String get aboutTileNetworkTitle =>
      'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire';

  @override
  String get aboutTileVideoTitle => 'Vidéo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle =>
      'Électrique — Schuko / P17 / puissances';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.';

  @override
  String get aboutTileInformatiqueTitle =>
      'Informatique — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Débits utiles, versions, limites réelles, pièges marketing.';

  @override
  String get aboutTitle => 'À propos';

  @override
  String get homeRiggingTitle => 'Rigging';

  @override
  String get homeRiggingSubtitle => 'Bridles : angles & longueurs d’élingues.';

  @override
  String get riggingTitle => 'Rigging';

  @override
  String get riggingAngleLengthTitle => 'Angle de bridle & longueur d’élingues';

  @override
  String get riggingSymmetryNote =>
      'Hypothèse : bridle symétrique (2 brins identiques). Aucun calcul de charge.';

  @override
  String get riggingInputsTitle => 'Entrées';

  @override
  String get riggingSpanLabel => 'Entraxe (distance entre points)';

  @override
  String get riggingSpanHint => 'Ex : 2.40';

  @override
  String get riggingDropLabel => 'Flèche (drop vertical)';

  @override
  String get riggingDropHint => 'Ex : 0.60';

  @override
  String get riggingUnitMeters => 'm';

  @override
  String get riggingResultsTitle => 'Résultats';

  @override
  String get riggingNeedPositiveValues => 'Renseigne des valeurs > 0.';

  @override
  String get riggingLegLengthLabel => 'Longueur d’un brin';

  @override
  String get riggingAngleToHorizontalLabel =>
      'Angle par rapport à l’horizontale';

  @override
  String get riggingAngleToVerticalLabel => 'Angle par rapport à la verticale';

  @override
  String get riggingDisclaimerShort =>
      'Résultats indicatifs. À valider selon ton contexte et les pratiques rigging.';

  @override
  String get riggingCalcLegDropTitle => 'Longueur + flèche → portée';

  @override
  String get riggingCalcLegDropHelp =>
      'Élingue symétrique (2 brins) : calcule la portée à partir de la longueur d’élingue et de la flèche.';

  @override
  String get riggingLegLengthInputLabel => 'Longueur d’un brin';

  @override
  String get riggingLegLengthInputHint => 'Ex: 2.50';

  @override
  String get riggingInvalidTriangle =>
      'Impossible : la longueur doit être supérieure à la flèche.';

  @override
  String get riggingCalcLegAngleTitle => 'Longueur + angle → portée + flèche';

  @override
  String get riggingCalcLegAngleHelp =>
      'Élingue symétrique (2 brins) : calcule portée et flèche à partir de la longueur et de l’angle par rapport à l’horizontale.';

  @override
  String get riggingAngleHorizontalInputLabel =>
      'Angle par rapport à l’horizontale';

  @override
  String get riggingAngleHorizontalInputHint => 'Ex: 30';

  @override
  String get riggingInvalidAngle => 'Angle invalide : entre 0° et 90° (exclu).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title => 'Entraxe + flèche → longueur & angles';

  @override
  String get riggingCalc1Subtitle =>
      'Bridle symétrique (2 brins identiques). Poids affiché (info). Aucun calcul de charge.';

  @override
  String get riggingCalc2Title => 'Entraxe + angle(H) → flèche & longueur';

  @override
  String get riggingCalc2Subtitle =>
      'Angle par rapport à l\'horizontale. Bridle symétrique. Aucun calcul de charge.';

  @override
  String get riggingCalc3Title => 'Entraxe + longueur → flèche & angles';

  @override
  String get riggingCalc3Subtitle =>
      'Longueur d’un brin connue. Bridle symétrique. Aucun calcul de charge.';

  @override
  String get riggingLegLengthHint => 'Ex: 4.70';

  @override
  String get riggingAngleHint => 'Ex : 45';

  @override
  String get riggingInvalidGeometry =>
      'Géométrie impossible (longueur trop courte pour l’entraxe).';

  @override
  String get riggingSchemaTitle => 'Schéma';

  @override
  String get riggingSchemaCaption1 =>
      'Entrées : portée + flèche. Sorties : longueur d’élingue + angles.';

  @override
  String get riggingSchemaCaption2 =>
      'Entrées : portée + longueur d’élingue. Sorties : flèche + angles.';

  @override
  String get riggingSchemaCaption3 =>
      'Entrées : portée + angle (horizontal). Sorties : flèche + longueur.';

  @override
  String get riggingAngleHInputLabel => 'Angle (par rapport à l’horizontale)';

  @override
  String get riggingAngleHInputHint => 'Ex: 45';

  @override
  String get riggingDropResultLabel => 'Flèche (drop)';

  @override
  String get riggingSchemaLabelSpan => 'Entraxe';

  @override
  String get riggingSchemaLabelDrop => 'Flèche';

  @override
  String get riggingSchemaLabelLeg => 'Brin';

  @override
  String get riggingWeightLabel => 'Poids (info)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Géométrie impossible : la longueur d’un brin doit être > (entraxe / 2).';

  @override
  String get riggingDisclaimerNoLoad =>
      'Poids affiché à titre indicatif. Aucun calcul de charge / tension. Valide selon ton contexte rigging.';

  @override
  String get riggingCalcCommonSubtitle =>
      'Bridle 2 brins. Poids affiché (info). Aucun calcul de charge.';

  @override
  String get riggingOffCenterToggle => 'Charge décentrée';

  @override
  String get riggingOffsetLabel => 'Offset A → charge';

  @override
  String get riggingInvalidOffset =>
      'Offset invalide : doit être > 0 et < entraxe.';

  @override
  String get riggingLegLeftLabel => 'Longueur brin gauche';

  @override
  String get riggingLegRightLabel => 'Longueur brin droit';

  @override
  String get riggingAngleHLeftLabel => 'Angle H (gauche)';

  @override
  String get riggingAngleHRightLabel => 'Angle H (droit)';

  @override
  String get riggingAngleVLeftLabel => 'Angle V (gauche)';

  @override
  String get riggingAngleVRightLabel => 'Angle V (droit)';

  @override
  String get riggingIncludedAngleLabel => 'Angle entre brins';

  @override
  String get riggingAngleHLeftInputLabel => 'Angle H (brin gauche)';

  @override
  String get riggingLegLeftInputLabel => 'Longueur (brin gauche)';

  @override
  String get riggingNeedValidValues => 'Entrer des valeurs positives valides.';
}
