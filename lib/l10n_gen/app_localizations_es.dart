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
  String get photometrySection1Title => 'Lux <> Candela';

  @override
  String get photometrySection2Title => 'Lumens <> Candela';

  @override
  String get photometrySection3Title => 'Lumens < Lux';

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
  String get aboutDmxToc10 => '10) Checklist rapide';

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

  @override
  String get photometrySection4Title => 'Lux → Lumen';

  @override
  String get photometryAreaLabel => 'Surface (m²)';

  @override
  String get photometryAreaHint4 => 'Ex: 12.5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx • S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversions';

  @override
  String get aboutArtnetConversionIntro =>
      'Outils de conversion utiles autour des univers DMX, Art-Net et des valeurs hexadécimales.';

  @override
  String get aboutUniverseToArtnetTitle => 'Univers → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Trouver Subnet + Universe (Net/Port-Address) à partir d’un univers DMX.';

  @override
  String get aboutUniverseToHexTitle => 'Univers → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Convertir un univers (1…N) en index et valeur hexadécimale.';

  @override
  String get aboutArtnetConversionNote =>
      'Note : les conventions Art-Net peuvent varier selon les consoles (adressage, base 0/1). Vérifie toujours la documentation de ton système.';

  @override
  String get elecTocCopyText => 'Copier le sommaire';

  @override
  String get elecToc1 => '1) Conceptos básicos (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Conectores (Schuko / CEE / PowerCON)';

  @override
  String get elecToc3 => '3) Monofásico / Trifásico (qué cambia)';

  @override
  String get elecToc4 => '4) Tabla rápida (16A → 400A)';

  @override
  String get elecToc5 => 'Conversión kVA → kW / A';

  @override
  String get elecToc6 => '6) Seguridad y errores comunes';

  @override
  String get elecToc7 => '6) Lista de verificación';

  @override
  String get elecKvaTitle => 'Table kVA → kW (selon cos φ)';

  @override
  String get elecKvaFormula => 'Formule : kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Cette table donne une estimation rapide de la puissance active (kW) à partir d’une puissance apparente (kVA).';

  @override
  String get elecKvaNote =>
      'Valeurs indicatives. Utilise les valeurs réelles de cos φ quand tu les connais.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1,0)';

  @override
  String get commonTocTitle => 'Sommaire';

  @override
  String get commonCopySummaryTooltip => 'Copier le sommaire';

  @override
  String get aboutLightReferenceTitle => 'Références lumière';

  @override
  String get refCriTitle => 'IRC / CRI';

  @override
  String get refKelvinTitle => 'Température de couleur (K)';

  @override
  String get refBeamFieldTitle => 'Beam / Field';

  @override
  String get refLuxTitle => 'Niveaux d’éclairement (lux)';

  @override
  String get refCriContent =>
      'L’IRC (CRI) mesure la fidélité des couleurs. Plus il est élevé, plus les couleurs paraissent naturelles.';

  @override
  String get refKelvinContent =>
      'La température de couleur décrit la teinte de blanc (chaud à froid).';

  @override
  String get refBeamFieldContent =>
      'Le Beam est l’angle du faisceau principal ; le Field l’angle où l’intensité devient faible (bordure).';

  @override
  String get refBeamLegendBeam => 'Beam';

  @override
  String get refBeamLegendField => 'Field';

  @override
  String get refLuxIntro =>
      'Références indicatives d’éclairement selon l’usage.';

  @override
  String get refLuxColUse => 'Usage';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Couloir / circulation';

  @override
  String get refLuxUseBackstage => 'Backstage / technique';

  @override
  String get refLuxUseMeeting => 'Salle de réunion';

  @override
  String get refLuxUseExpo => 'Expo / showroom';

  @override
  String get refLuxUseStageGeneral => 'Scène – général';

  @override
  String get refLuxUseStageTv => 'Scène – TV / captation';

  @override
  String get refLuxNote =>
      'Ces valeurs varient selon les normes et les contraintes (caméra, contraste, ambiance).';

  @override
  String get refLightDisclaimerShort =>
      'Références indicatives – pas une norme.';

  @override
  String get refCri90 => 'Excellent (≥ 90)';

  @override
  String get refCri80 => 'Bon (≈ 80)';

  @override
  String get refCriLow => 'Faible (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Important';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Certaines consoles utilisent une base 0 (Universe 0..15) et d’autres une base 1 (Universe 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Table Univers → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Correspondance typique entre univers DMX et adressage Art-Net.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Vérifie toujours la convention de ta console / node.';

  @override
  String get aboutUniverseToArtnetColDmx => 'Univers DMX';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Uni (hex)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Subnet $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Principe';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'Un univers (1…N) peut être converti en index (base 0) puis en hexadécimal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Table Univers → Hex';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Table de conversion univers DMX → index / hex.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Bloc $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'Univers DMX';

  @override
  String get aboutUniverseToHexColIndex => 'Index';

  @override
  String get aboutArtnetPageTitle =>
      'Art-Net — univers DMX sur IP (simple & complet)';

  @override
  String get aboutArtnetTocTitle => 'Sommaire';

  @override
  String get aboutArtnetTocCopyTooltip => 'Copier repères';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX sur Ethernet via UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Échelle: beaucoup d’univers via nodes (DMX-out) distribués.';

  @override
  String get aboutArtnetCopyLine3 =>
      'Diffusion: broadcast (simple mais flood) ou unicast (plus propre).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Limites réelles: Wi-Fi, switch basique, firmware nodes, réglages univers/mapping.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: possible via “RDM proxy” selon nodes (support variable).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net — c’est quoi et pourquoi';

  @override
  String get aboutArtnetSection2Title =>
      '2) Adressage & univers — mapping propre';

  @override
  String get aboutArtnetSection3Title =>
      '3) Limites & perf — ce qui casse en premier';

  @override
  String get aboutArtnetSection4Title => '4) Nodes, splitters & RDM';

  @override
  String get aboutArtnetSection5Title => '5) Dépannage — symptômes → causes';

  @override
  String get aboutArtnetSection6Title =>
      '6) Schémas (réseau / unicast vs broadcast)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Images (assets) — RJ45/switch/câbles';

  @override
  String get aboutArtnetSection7Title => '7) Checklist rapide';

  @override
  String get aboutArtnetConversionTablesTitle =>
      'Conversion / tables (Univers 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Univers DMX sur IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'Nodes DMX-out';

  @override
  String get aboutArtnetSection1Paragraph =>
      'Art-Net transporte des univers DMX sur un réseau Ethernet (IP). Au lieu de tirer une ligne DMX par univers, tu envoies des “paquets” sur le réseau, et un node convertit en DMX près des machines.';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Pourquoi c’est utile';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Scalable : beaucoup d’univers sur un seul câble réseau.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distribution : nodes proches des projecteurs/dimmers → moins de longues lignes DMX.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Patch flexible : changer un univers ou déplacer un node est rapide.';

  @override
  String get aboutArtnetSection1Subtitle => 'Deux mots à retenir';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net ne remplace pas le DMX : il le transporte sur IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'La stabilité dépend souvent plus du réseau (switch, Wi-Fi, broadcast) que du protocole.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Univers';

  @override
  String get aboutArtnetSection2PillNodePort => 'Node / Port';

  @override
  String get aboutArtnetSection2PillMapping => 'Mapping';

  @override
  String get aboutDmxPageTitle => 'DMX — fonctionnement (simple & complet)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 canaux (slots) par univers, valeurs 0–255 (8-bit).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Timing : 250 kbaud, univers plein ≈ ~44 Hz (ordre de grandeur).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topologie : daisy-chain (pas de Y passif). Terminaison 120Ω sur le dernier.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = DMX bidirectionnel (config/monitoring) → compatibilités splitters/nodes à vérifier.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = univers DMX transportés sur Ethernet/IP via nodes.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multicast + priorités (IGMP snooping recommandé).';

  @override
  String get aboutDmxToc1 => '1) DMX, univers, adresses — la base';

  @override
  String get aboutDmxToc2 => '2) Trame DMX — break, start code, canaux';

  @override
  String get aboutDmxToc3 => '3) Câblage RS-485 — topologie & câble';

  @override
  String get aboutDmxToc4 =>
      '4) Terminaison & splitters — éviter les réflexions';

  @override
  String get aboutDmxToc4bis => '4bis) RDM — limites & compatibilités';

  @override
  String get aboutDmxToc5 => '5) Dépannage terrain — symptômes → causes';

  @override
  String get aboutDmxToc6 => '6) Art-Net — repères terrain';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutDmxToc8 => '8) DMX vs Art-Net vs sACN — choisir';

  @override
  String get aboutDmxToc9 => '9) Schémas terrain (DMX / IP / pinout)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX — Checklist terrain';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN — Checklist terrain';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Mode appareil correct (nombre de canaux)';

  @override
  String get aboutDmxChecklistCopyB2 =>
      'Adresse DMX correcte (pas de chevauchement)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Daisy-chain (pas de Y passif)';

  @override
  String get aboutDmxChecklistCopyB4 =>
      'Terminaison 120Ω sur le dernier appareil';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'Câble DMX/RS-485 (paire torsadée 120Ω) si possible';

  @override
  String get aboutDmxChecklistCopyB6 => 'Splitter opto si plusieurs branches';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Éloigner DMX des sources parasites (alims, dimmers) si possible';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Si RDM : vérifier compatibilité splitter/node + câblage impeccable';

  @override
  String get aboutDmxChecklistCopyB9 => 'Réseau dédié si possible (ou VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Switch correct ; IGMP snooping recommandé (sACN multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (souvent) ou multicast maîtrisé (éviter flood)';

  @override
  String get aboutDmxChecklistCopyB12 => 'Mapping univers ↔ ports/node vérifié';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Plan IP clair (adresses, masque, DHCP vs statique)';

  @override
  String get aboutDmxS1Title => '1) DMX, univers, adresses — la base';

  @override
  String get aboutDmxS1Pill1 => '1 univers = 512 slots';

  @override
  String get aboutDmxS1Pill2 => '0–255 (8-bit)';

  @override
  String get aboutDmxS1Pill3 => '16-bit = 2 canaux';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 est un protocole de contrôle très utilisé en spectacle (lumière, effets, dimmers). C’est un flux série (RS-485) qui envoie en boucle une “trame” contenant jusqu’à 512 valeurs. Chaque valeur = un canal (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'À retenir';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 univers DMX = 512 canaux (slots) numérotés 1→512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'Un appareil écoute une adresse de départ (ex : 101) et consomme N canaux (selon son mode).';

  @override
  String get aboutDmxS1RememberB3 =>
      'Le contrôleur renvoie tout en continu : si tu arrêtes d’émettre, les appareils “gèlent” (ou passent en fallback).';

  @override
  String get aboutDmxS4bisTitle => '4bis) RDM — limites & compatibilités';

  @override
  String get aboutDmxS4bisPlaceholder => '... (garde ton contenu existant)';

  @override
  String get aboutDmxS9Title => '9) Schémas terrain (DMX / IP / pinout)';

  @override
  String get aboutDmxS9Diagram1 => 'Timing DMX (break / MAB / slots)';

  @override
  String get aboutDmxS9Diagram2 => 'Topologie DMX : daisy-chain';

  @override
  String get aboutDmxS9Diagram3 => 'Terminaison 120Ω';

  @override
  String get aboutDmxS9Diagram4 => 'sACN multicast : rappel IGMP (réseau)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → nodes → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Pinout XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Checklist rapide';

  @override
  String get aboutDmxS10CopyTooltip => 'Copier la checklist';

  @override
  String get aboutDmxS10CalloutTitle => 'Avant de paniquer';

  @override
  String get aboutDmxS10B1 =>
      'Mode appareil + adresse DMX (toujours vérifier).';

  @override
  String get aboutDmxS10B2 =>
      'Chaîne courte avec un câble “connu OK” pour isoler.';

  @override
  String get aboutDmxS10B3 => 'Daisy-chain (pas de Y passif).';

  @override
  String get aboutDmxS10B4 =>
      'Terminaison 120Ω sur le dernier appareil uniquement.';

  @override
  String get aboutDmxS10B5 => 'Splitter opto si plusieurs branches.';

  @override
  String get aboutDmxS10B6 =>
      'Si RDM : compat splitter/node + câblage impeccable.';

  @override
  String get aboutDmxS10B7 =>
      'En IP (Art-Net/sACN) : switch correct, IGMP pour sACN multicast, unicast si doute.';

  @override
  String get aboutDmxFooterNote =>
      'Info indicative (terrain). Les comportements exacts peuvent varier selon consoles, nodes, switchs et firmwares.\nObjectif ici : comprendre et dépanner vite, avec une méthode fiable.';

  @override
  String get aboutDmxPainterBreak => 'BREAK';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Start\ncode';

  @override
  String get aboutDmxPainterSlots => 'Slots 1…N\n(jusqu’à 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Boucle (refresh) — univers plein ≈ ~44 Hz (ordre de grandeur)';

  @override
  String get aboutDmxPainterSourceA => 'SOURCE A\n(prio 100)';

  @override
  String get aboutDmxPainterSourceB => 'SOURCE B\n(prio 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'SWITCH\nIGMP snooping';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniverse U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Sans IGMP : flood\nAvec IGMP : seulement ports abonnés';

  @override
  String get aboutDmxPainterConsole => 'CONSOLE';

  @override
  String get aboutDmxPainterFix1 => 'FIX 1';

  @override
  String get aboutDmxPainterFix2 => 'FIX 2';

  @override
  String get aboutDmxPainterFix3 => 'FIX 3';

  @override
  String get aboutElectricitePageTitle => 'Électrique — repères terrain';

  @override
  String get elecSection1Title => '1) Bases (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 formules utiles';

  @override
  String get elecSection1Formula1 => 'P (W) = U (V) × I (A)';

  @override
  String get elecSection1Formula2 => 'I (A) = P (W) / U (V)';

  @override
  String get elecSection1Formula3 => 'P (kW) = P (W) / 1000';

  @override
  String get elecSection1FieldMarksTitle => 'Repères terrain';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V : 16A ≈ 3,7 kW | 32A ≈ 7,4 kW | 63A ≈ 14,5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Tri 400V : 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW';

  @override
  String get elecSection2Title => '2) Connecteurs (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (prises domestiques)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Typiquement 16A max (≈ 3,7 kW à 230V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Attention aux multiprises et rallonges : échauffement possible.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (bleu/rouge)';

  @override
  String get elecSection2P17Bullet1 =>
      'Bleu : 230V mono (camping, petit distro).';

  @override
  String get elecSection2P17Bullet2 =>
      'Rouge : 400V tri (distro, grandes puissances).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (audio/éclairage)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = plus “terrain” (verrouillage, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Vérifie la section de câble et les protections.';

  @override
  String get elecSection3Title => '3) Mono / Tri (ce que ça change)';

  @override
  String get elecSection3Paragraph =>
      'Mono = une phase + neutre (230V). Tri = 3 phases (400V entre phases).';

  @override
  String get elecSection3PitfallsTitle => 'Pièges fréquents';

  @override
  String get elecSection3Pitfall1 =>
      'Déséquilibre des phases (une phase surcharge).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutre qui chauffe si grosses harmoniques (LED, dimmers).';

  @override
  String get elecSection3Pitfall3 =>
      'Terre absente/douteuse sur certains sites.';

  @override
  String get elecSection3MethodTitle => 'Méthode simple';

  @override
  String get elecSection3MethodBullet1 =>
      'Répartis les grosses charges sur L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Surveille le neutre si beaucoup de LED.';

  @override
  String get elecSection3MethodBullet3 => 'Mesure au clamp si possible.';

  @override
  String get elecSection4Title => '4) Table rapide (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Mono 230V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3,7 kW\n32A ≈ 7,4 kW\n63A ≈ 14,5 kW\n125A ≈ 28,8 kW\n200A ≈ 46 kW\n';

  @override
  String get elecSection4TriTitle => 'Tri 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW\n';

  @override
  String get elecSection4ImportantTitle => 'Important';

  @override
  String get elecSection4ImportantBullet1 =>
      'Ce sont des ordres de grandeur (cosφ, harmoniques, pertes).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Toujours valider protections + sections + température.';

  @override
  String get elecSection5Title => '6) Sécurité & pièges terrain';

  @override
  String get elecSection5DontDoTitle => 'À ne pas faire';

  @override
  String get elecSection5DontDoBullet1 =>
      'Chainer multiprises / rallonges en vrac.';

  @override
  String get elecSection5DontDoBullet2 => 'Mélanger des phases sans savoir.';

  @override
  String get elecSection5DontDoBullet3 => '“Bridger” une terre douteuse.';

  @override
  String get elecSection5WarningTitle => 'Signaux d’alerte';

  @override
  String get elecSection5WarningBullet1 =>
      'Odeur de chaud, prises tièdes, déclenchements répétés.';

  @override
  String get elecSection5WarningBullet2 => 'Tension qui chute (brown-out).';

  @override
  String get elecSection5WarningBullet3 => 'Disjoncteur “fatigué” ou inadapté.';

  @override
  String get elecSection6Title => '6) Checklist';

  @override
  String get elecSection6QuickTitle => 'Rapide';

  @override
  String get elecSection6Bullet1 =>
      'Type d’alim dispo (mono/tri) + calibre (A).';

  @override
  String get elecSection6Bullet2 => 'Répartition phases (charges principales).';

  @override
  String get elecSection6Bullet3 =>
      'Protections (diff/disj) et état du tableau.';

  @override
  String get elecSection6Bullet4 =>
      'Câbles : section / longueur / échauffement.';

  @override
  String get elecSection6Bullet5 => 'Terre : OK ? (testeur si possible).';

  @override
  String get elecFooterNote =>
      'Note : ce contenu est un aide-mémoire terrain. Sur un site réel, respecte toujours les normes, les prescriptions du lieu et les protections en place.';

  @override
  String get infoPageTitle => 'Informatique — repères terrain';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Stockage (SATA / NVMe / SSD)';

  @override
  String get infoVideoLinksTitle => '3) Liaisons vidéo (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe / GPU (repères)';

  @override
  String get infoChecklistTitle => '5) Checklist (plateau)';

  @override
  String get infoSummaryCopy =>
      'INFO — repères terrain\n• USB-C = forme, pas vitesse : vérifier la norme.\n• NVMe (M.2) bien plus rapide que SATA.\n• DisplayPort/HDMI = standards, attention versions/câbles.\n• Sur serveurs vidéo : stockage + GPU + débit sont la base.';

  @override
  String get infoChecklistCopy =>
      'INFO — Checklist\n☐ Câbles USB-C certifiés (data/vidéo si besoin)\n☐ Stockage adapté (NVMe si gros flux)\n☐ Drivers GPU stables (version connue)\n☐ Test résolution/FPS réels\n☐ Éviter adaptateurs cheap';

  @override
  String get infoUsbCriticalTitle => 'Point critique';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = connecteur (forme). Ça ne dit pas la vitesse.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Un câble USB-C peut être “charge only” et ne pas passer la data/vidéo.';

  @override
  String get infoUsbSpeedTitle => 'Repères vitesses (ordre de grandeur)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0 : lent (claviers, dongles, petits périph).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x : beaucoup plus rapide (disques, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt : très haut débit (dock, eGPU, vidéo selon matériel).';

  @override
  String get infoUsbParagraph =>
      'En show : si un périphérique “déconne”, suspecte le câble (qualité/standard) avant le device.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA vs NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SSD SATA : bon et stable, mais limité (interface ancienne).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'SSD NVMe (M.2) : bien plus rapide (idéal pour serveurs média, gros fichiers).';

  @override
  String get infoStorageFieldTitle => 'Terrain vidéo';

  @override
  String get infoStorageFieldBullet1 =>
      'Lecture de gros fichiers 4K/ProRes → NVMe recommandé.';

  @override
  String get infoStorageFieldBullet2 =>
      'Attention à la température : un NVMe peut throttler (ralentir) si ça chauffe.';

  @override
  String get infoStorageFieldBullet3 =>
      'Toujours tester en conditions réelles avant le show.';

  @override
  String get infoVideoLinksImportantTitle => 'Repère important';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Les versions comptent : câble + port + device doivent être compatibles.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Longue distance = convertisseurs actifs / fibre souvent nécessaires.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs HDMI (très simplifié)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI : omniprésent (TV, processors), mais EDID/HDCP peuvent gêner.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort : très courant PC, souvent très “capable” en débit.';

  @override
  String get infoPcieGpuParagraph =>
      'Pour les serveurs vidéo / mapping : GPU + bus + drivers = stabilité. Les problèmes typiques : drivers, câbles, conversion, et limitations de sorties.';

  @override
  String get infoPcieGpuFieldTitle => 'Terrain';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Bloquer une version de driver stable avant un gros show.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Éviter les adaptateurs “cheap”.';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Tester à la résolution/FPS réels du show.';

  @override
  String get infoChecklistQuickTitle => 'Rapide';

  @override
  String get infoChecklistBullet1 => 'Câble/standard correct.';

  @override
  String get infoChecklistBullet2 => 'Stockage adapté au flux.';

  @override
  String get infoChecklistBullet3 => 'Drivers stables.';

  @override
  String get infoChecklistBullet4 => 'Test réel avant show.';

  @override
  String get infoChecklistBullet5 => 'Éviter adaptateurs cheap.';

  @override
  String get infoFooterNote =>
      'Info indicative (terrain). Les capacités exactes varient selon matériel/versions.\nObjectif : repères simples + méthode fiable.';

  @override
  String get ipBasicsPageTitle =>
      'Réseau — bases IP / masque / DHCP (essentiel)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Copier mémo';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Copier la checklist';

  @override
  String get ipBasicsMemo1 =>
      'IP = adresse logique pour joindre un appareil sur un réseau.';

  @override
  String get ipBasicsMemo2 =>
      'Privé (LAN) : 10.x.x.x, 172.16–31.x.x, 192.168.x.x (non routés sur Internet).';

  @override
  String get ipBasicsMemo3 =>
      'Masque / sous-réseau = dit quelle partie est “réseau” vs “machine”.';

  @override
  String get ipBasicsMemo4 =>
      'Même sous-réseau = communication directe. Sinon → passerelle (routeur).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP attribue IP automatiquement; statique = utile pour nodes/console.';

  @override
  String get ipBasicsToc1 => '1) C’est quoi une IP et à quoi ça sert ?';

  @override
  String get ipBasicsToc2 =>
      '2) Pourquoi 192.x / 10.x / 172.x ? (adresses privées)';

  @override
  String get ipBasicsToc3 =>
      '3) Masque & sous-réseaux : comprendre pour de vrai';

  @override
  String get ipBasicsToc4 => '4) DHCP, passerelle, DNS : qui fait quoi ?';

  @override
  String get ipBasicsToc5 =>
      '5) Comment deux appareils se parlent (LAN vs hors LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Plans IP “show” simples (exemples prêts à copier)';

  @override
  String get ipBasicsToc7 =>
      '7) Dépannage : symptômes → causes (méthode terrain)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini-exercices (vérifier vite un masque / un réseau)';

  @override
  String get ipBasicsToc9 => '9) Checklist rapide';

  @override
  String get ipBasicsSection1Paragraph =>
      'Une adresse IP (IPv4) est un identifiant logique sur un réseau. Elle permet de dire : “envoie ce paquet à cet appareil”.\n\nQuand tu branches une console, un node Art-Net/sACN, un PC, un switch géré… tout ce qui parle en réseau doit avoir une IP cohérente pour que les appareils se trouvent.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Image mentale';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = identifiant matériel (carte réseau).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = adresse “postale” sur un réseau (changeable).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Masque = “quartier / code postal” (délimite le sous-réseau).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Passerelle = “sortie du quartier” (routeur).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 en 10 secondes';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Format : A.B.C.D (4 nombres de 0 à 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Ex : 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'Ce n’est pas magique : ce sont 32 bits (4 octets).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'Ce qui compte pour toi : IP + masque doivent être cohérents entre appareils.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Certaines plages d’adresses IPv4 sont réservées aux réseaux privés (LAN). Elles ne sont pas routées sur Internet. C’est pour ça qu’on les utilise en show : tu peux faire ton réseau local sans “consommer” des IP publiques.';

  @override
  String get ipBasicsSection2CalloutTitle =>
      'Les 3 grandes plages privées (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (souvent écrit “10.x.x.x”)';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (souvent “172.16–31.x.x”)';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (souvent “192.168.x.x”)';

  @override
  String get ipBasicsSection2Subtitle1 =>
      'Pourquoi on voit souvent 192.168.x.x ?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Les box/routeurs grand public utilisent souvent 192.168.0.x ou 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'C’est devenu un “standard de fait” en petits LAN.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Mais en show, 10.x.x.x est pratique si tu veux beaucoup d’adresses ou plusieurs VLAN.';

  @override
  String get ipBasicsSection2Subtitle2 => 'Et le fameux 2.x.x.x (Art-Net) ?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Beaucoup de matériel Art-Net sort d’usine avec une IP en 2.x.x.x (réseau fermé).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'C’est “pratique” en plug&play (sans DHCP), mais ça surprend si ton PC est en 192.168.x.x.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Important : le “2.x” n’a rien de magique pour le broadcast/unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'Ce qui change le périmètre du broadcast, c’est le masque (souvent /8 = 255.0.0.0 en legacy).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Exemple : réseau 2.0.0.0/8 → broadcast = 2.255.255.255 (très large).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Solution simple : mettre PC/console dans la même plage + même masque, ou reconfigurer le node sur un plan 192/10.';

  @override
  String get ipBasicsSection3Paragraph =>
      'Le masque (subnet mask) dit quelles adresses sont “dans le même réseau”. Sans masque, une IP ne veut pas dire grand-chose.\n\nRègle terrain : si deux appareils sont dans le même sous-réseau, ils se parlent directement. Sinon, ils ont besoin d’une passerelle (routeur).';

  @override
  String get ipBasicsSection3Callout1Title => 'Masques les plus courants';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 )   → réseau 10.x.x.x typique “large”';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → réseau 10.10.x.x ou 192.168.x.x “large”';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → réseau 192.168.0.x “classique” (254 appareils)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Masque → adresse de broadcast (très utile à comprendre)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'Le broadcast dépend du sous-réseau, donc du masque (pas de “2 vs 192”).';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → broadcast = 192.168.10.255 (petit réseau).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → broadcast = 2.255.255.255 (réseau énorme).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Plus le réseau est “grand”, plus un broadcast peut faire du bruit (si tu l’utilises souvent).';

  @override
  String get ipBasicsSection3Subtitle1 =>
      'Exemple concret (le plus utile) : /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP : 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Masque : 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Réseau : 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Appareils “dans le même réseau” : 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'Si tu passes en 192.168.1.50 → ce n’est PLUS le même réseau.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Pourquoi faire des sous-réseaux ?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organisation : séparer “lumière”, “vidéo”, “intercom”, “internet”…';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Performance : limiter le bruit (broadcast/multicast) à un groupe.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Sécurité : éviter qu’un PC “invité” voie/perturbe le réseau show.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnostic : plus simple de savoir “où” est un appareil.';

  @override
  String get ipBasicsSection3Callout3Title => 'Piège classique';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Même “début” d’IP ≠ même réseau si le masque n’est pas identique.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Ex : 10.0.0.5/8 et 10.0.0.200/24 → pas le même périmètre logique.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (attribution automatique)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Un serveur DHCP “donne” : IP + masque + passerelle + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 => 'Pratique : tu branches, ça marche.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Risque show : si le DHCP tombe / change / conflit → symptômes bizarres.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Statique (IP fixe)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'Tu définis IP + masque (et éventuellement passerelle/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Très utile pour : console, nodes, switch géré, AP Wi-Fi show.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risque : doublon d’IP si plan pas clair (conflit).';

  @override
  String get ipBasicsSection4Callout1Title => 'Passerelle (gateway)';

  @override
  String get ipBasicsSection4Bullet1 =>
      'C’est l’adresse du routeur : elle sert pour aller “hors du réseau local”.';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Si tu fais un réseau show isolé (sans Internet) → passerelle souvent inutile.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Mais si tu veux sortir vers un autre VLAN / Internet → indispensable.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = “annuaire” : transforme un nom (ex: example.com) en IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'En show (Art-Net/sACN), souvent inutile : tu travailles en IP direct.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Si tu utilises des services (MAJ, licences, time server, streaming) → DNS redevient utile.';

  @override
  String get ipBasicsSection4Subtitle3 => 'Règle simple (débutant-friendly)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Petit show fermé : statique partout, pas de passerelle, pas de DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Show avec Internet / plusieurs réseaux : DHCP contrôlé + réservations DHCP, ou plan statique + routeur.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Quand A veut parler à B, il regarde le masque :\n• Si B est dans le même sous-réseau → A envoie directement sur le réseau local.\n• Si B est hors sous-réseau → A envoie à la passerelle (routeur), qui s’occupe du reste.';

  @override
  String get ipBasicsSection5Callout1Title => 'Exemple (facile)';

  @override
  String get ipBasicsSection5Bullet1 => 'A = 192.168.0.10 /24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → même réseau → OK direct.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → réseau différent → besoin routeur/passerelle.';

  @override
  String get ipBasicsSection5Subtitle => 'Pourquoi ça “ping” pas ?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Masque différent → A pense que B est “ailleurs” (ou inversement).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Pas de passerelle → impossible de sortir du sous-réseau.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'Pare-feu PC → ping bloqué (Windows très fréquent).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Câble / switch / VLAN : physiquement pas dans le même segment.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Broadcast vs unicast (bonus utile)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast : vers une IP précise (propre).';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Broadcast : “à tous” sur le sous-réseau (bruyant).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'En show : broadcast peut marcher en petit, mais devient vite source de bruit en gros réseau.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plan A — ultra simple (un seul réseau /24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Réseau : 192.168.10.0/24   (masque 255.255.255.0)\n\nConsole : 192.168.10.10\nPC (contrôle) : 192.168.10.20\nNode 1 : 192.168.10.101\nNode 2 : 192.168.10.102\nSwitch géré : 192.168.10.2\nPasserelle : (vide) ou 192.168.10.1 si routeur présent';

  @override
  String get ipBasicsSection6Callout1Title => 'Pourquoi ça marche bien';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Tout le monde dans le même sous-réseau → aucune surprise.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Facile à expliquer, facile à dépanner.';

  @override
  String get ipBasicsSection6Bullet3 => 'Idéal débutant / petit à moyen show.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plan B — “10.x” quand tu veux grandir';

  @override
  String get ipBasicsSection6Code2 =>
      'Réseau : 10.10.0.0/16   (masque 255.255.0.0)\n\nConsole : 10.10.0.10\nPC : 10.10.0.20\nNodes : 10.10.1.10 → 10.10.1.200\nSwitch : 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Quand l’utiliser';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Quand tu as beaucoup d’équipements (ou plusieurs zones).';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Quand tu prévois VLAN plus tard (lumière/vidéo/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C — compat Art-Net “2.x.x.x” (legacy)';

  @override
  String get ipBasicsSection6Code3 =>
      'Réseau : 2.0.0.0/8   (masque 255.0.0.0)\n\nPC/console : 2.0.0.10\nNode 1 : 2.0.0.100\nNode 2 : 2.0.0.101\n\n⚠️ Réseau isolé, pas d’Internet, pas de routage.';

  @override
  String get ipBasicsSection6Callout3Title => 'Attention';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Ce plan est pratique pour du matériel ancien / par défaut.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Mais évite de mélanger avec un LAN “normal” (192.168.x.x) sans routeur.';

  @override
  String get ipBasicsSection7Callout1Title => 'Symptômes → causes probables';

  @override
  String get ipBasicsSection7Bullet1 =>
      '“Je vois le node mais ça répond pas” → masque différent / VLAN / pare-feu.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '“Un appareil marche puis disparaît” → DHCP instable / conflit d’IP.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '“Rien ne marche sauf sur le switch” → IP pas dans le même réseau / mauvais câble / port VLAN.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '“Tout rame / pertes” → broadcast/multicast trop large / switch bas de gamme / boucle réseau.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '“Ça marche en filaire mais pas en Wi-Fi” → jitter / roaming / bande saturée / power saving.';

  @override
  String get ipBasicsSection7Subtitle => 'Méthode pro en 5 minutes';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Regarder IP + masque de la console/PC et du node.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Vérifier : même sous-réseau ? (ex: 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (si possible) + test d’accès interface web du node.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Si DHCP : lister qui a quelle IP (table DHCP) et vérifier doublons.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Si sACN multicast : vérifier IGMP snooping/querier (sinon flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Piège très fréquent';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Masque “hérité” sur un PC (255.255.0.0 au lieu de 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Résultat : tu crois être “dans le même réseau”, mais pas comme l’autre appareil.';

  @override
  String get ipBasicsSection8Subtitle1 =>
      'Exercice 1 : même réseau ou pas ? (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'A = 192.168.10.50 /24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ même réseau';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ pas le même réseau';

  @override
  String get ipBasicsSection8Subtitle2 => 'Exercice 2 : /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10 /16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ même réseau (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ pas le même réseau';

  @override
  String get ipBasicsSection8CalloutTitle => 'Astuce visuelle';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → les 3 premiers nombres identiques (A.B.C) = même réseau.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → les 2 premiers nombres identiques (A.B) = même réseau.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → le 1er nombre identique (A) = même réseau.';

  @override
  String get ipBasicsSection8Subtitle3 =>
      'Exercice 3 : éviter les IP “bizarres”';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x : réservé (pas une IP normale d’hôte).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x : loopback (ton PC lui-même).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x : auto-IP quand DHCP absent (APIPA) → signe de problème DHCP.';

  @override
  String get ipBasicsSection9CalloutTitle => 'Avant de chercher midi à 14h';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Même sous-réseau = IP + masque cohérents.';

  @override
  String get ipBasicsSection9Bullet2 => 'Aucun doublon d’IP (conflit).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP : OK si maîtrisé; sinon plan statique clair.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'Pare-feu PC : peut bloquer ping / discovery.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN : bon port, bon VLAN, pas de boucle.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN multicast : IGMP snooping/querier recommandés.';

  @override
  String get ipBasicsChecklistCopy =>
      'Réseau — Checklist rapide (IP)\n☐ Tous les appareils sont dans le même sous-réseau (IP + masque cohérents)\n☐ Pas de doublon d’IP (conflit)\n☐ DHCP : soit tout le monde en DHCP, soit plan statique clair (éviter mélange flou)\n☐ Pour Art-Net/sACN : réseau dédié ou VLAN si possible\n☐ Switch géré si multicast/IGMP (sACN)\n☐ Wi-Fi : éviter pour data show critique (jitter), préférer filaire\n☐ Test simple : ping + vérifier masque/passerelle';

  @override
  String get ipBasicsFooterNote =>
      'Objectif : comprendre assez pour câbler / config / dépanner vite en show.\nLes détails réseau peuvent être plus profonds, mais ces bases couvrent 90% des pannes terrain.';

  @override
  String get aboutDmxPainterTerm120 => 'TERM\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote =>
      '✅ Daisy-chain\n❌ Pas de Y passif';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) — repère rapide';

  @override
  String get aboutDmxPainterPin1 => 'Pin 1 : Shield / masse';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2 : Data−';

  @override
  String get aboutDmxPainterPin3 => 'Pin 3 : Data+';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5 : “data 2” (rare / optionnel)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'En pratique : XLR3 souvent utilisé (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'DERNIER\nAPPAREIL';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Terminaison = 120Ω en fin de ligne';

  @override
  String get aboutDmxPainter120Between => '120Ω\nentre\nData− et Data+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ Une seule terminaison\n❌ Pas au milieu\n❌ Pas sur chaque branche';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLE\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SWITCH\n(IGMP pour sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NODE 1\nDMX OUT';

  @override
  String get aboutDmxPainterNode2 => 'NODE 2\nDMX OUT';

  @override
  String get aboutDmxPainterFix => 'FIX';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Beaucoup d’univers\n✅ Nodes proches des machines';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Ton objectif : que chaque univers émis par la source arrive au bon node (et au bon port DMX) sans ambiguïté. La plupart des pannes Art-Net = mauvais univers, mauvais subnet/net, ou broadcast qui sature.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Méthode simple (qui évite 80% des erreurs)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Écris sur papier: “Univers 1 → Node A port 1”, “Univers 2 → Node A port 2”, etc.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Mets des IP stables (DHCP réservé ou statiques).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Préfère l’unicast si tu as plus d’un node ou un réseau partagé.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Broadcast vs Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast : tu envoies à tout le monde → facile mais peut “flood” un switch.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast : tu envoies vers l’IP du node → plus propre et prévisible.';

  @override
  String get aboutArtnetSection2SubBullet3 => 'En show: si doute → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Univers : pratique terrain';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Garde une numérotation simple (ex: 1…N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Évite “un univers partout” : documente tes mappings.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'Sur certains setups, “Net/Subnet/Universe” existent : pense “mapping”, pas “magie”.';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'Les limites “réelles” (dans l’ordre)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi : latence variable + pertes → flicker ou décrochages.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast : surcharge un LAN (tout le monde reçoit tout).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Switch “bas de gamme” : buffers limités, gestion multicast/broadcast médiocre.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Nodes : limite firmware/CPU (nb d’univers, fréquence, options).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/source : driver, charge CPU, antivirus, carte réseau, etc.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Vitesse de refresh';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      'Le DMX “classique” est souvent ~20–44 fps selon trame.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'Sur IP, tu peux envoyer plus, mais les nodes ne suivent pas toujours (et ce n’est pas toujours utile).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Stabilité > fréquence : mieux vaut stable à 30–40 fps que “vite” mais instable.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Règles simples';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Réseau dédié (ou VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 => 'Unicast si plusieurs nodes.';

  @override
  String get aboutArtnetSection3SubBullet6 =>
      'Filaire pour les shows critiques.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Un node = IP → DMX. Il peut avoir 1, 2, 4, 8 ports DMX. La stabilité dépend du node ET du câblage DMX côté sortie (terminaison, topologie, splitters).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Nodes vs Splitters';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Node : convertit IP→DMX (et parfois DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'Splitter DMX : distribue une ligne DMX en branches (opto conseillé).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Bon design : IP jusqu’au plus près, puis DMX court et propre.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM sur Art-Net (support variable)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Certains nodes supportent un “RDM proxy” : la console voit/configure les appareils RDM via IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'D’autres ne supportent RDM du tout, ou partiellement.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Un splitter opto “classique” peut bloquer le retour RDM (selon modèle).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Conseil: si tu veux RDM, choisis explicitement du matériel marqué RDM compatible.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Bon réflexe terrain';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Si DMX instable : règle DMX d’abord (terminaison, câble, Y passif) puis seulement IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Si RDM instable : désactive RDM pour vérifier que le DMX pur est stable.';

  @override
  String get aboutArtnetSection5CalloutTitle => 'Symptômes → causes probables';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Flicker sur tout le plateau → Wi-Fi, broadcast flood, switch saturé.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Un node OK, l’autre non → univers/mapping, IP, unicast mal configuré.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Décrochages aléatoires → câble RJ45 défectueux, switch instable, PC qui droppe des paquets.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Un seul port DMX d’un node KO → câble DMX, terminaison, appareil qui casse la ligne.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'RDM discovery impossible → node/splitter non compatible RDM, câblage DMX “borderline”.';

  @override
  String get aboutArtnetSection5Subtitle => 'Méthode rapide';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Passe en unicast vers un seul node (test simple).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Vérifie univers/mapping (papier + node config).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Test en filaire direct (PC → switch → node) avec câble connu OK.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isole le DMX : node → 1 appareil + terminaison.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Architecture propre (IP → nodes → DMX court)';

  @override
  String get aboutArtnetSection6Subtitle2 => 'Broadcast vs Unicast (idée)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Assets recommandés (optionnels)';

  @override
  String get aboutArtnetExampleLabel => 'exemple';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Copier liste assets';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Section prévue pour illustrer le réseau (RJ45, switch, câbles). Si les assets n’existent pas, l’app affiche un fallback propre.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Exemples';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Connecteur Ethernet';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Switch';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (idéalement géré si IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Câble Ethernet';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = base fiable';

  @override
  String get aboutArtnetChecklistCopyTitle => 'Art-Net — Checklist terrain';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Copier la checklist';

  @override
  String get aboutArtnetChecklistTitle => 'Avant de paniquer';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unicast si plusieurs nodes.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Réseau dédié (ou VLAN) si possible.';

  @override
  String get aboutArtnetChecklistBullet3 => 'Filaire pour show critique.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Univers/mapping documentés.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Test IP simple → 1 node → 1 appareil + terminaison.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Si RDM: node “RDM proxy” confirmé + câblage DMX stable';

  @override
  String get aboutArtnetFooterNote =>
      'Info indicative (terrain). Selon nodes/switch/firmwares, le comportement peut varier.\nObjectif ici : comprendre et diagnostiquer vite.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'SOURCE\n(PC/console)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'SWITCH';

  @override
  String get aboutArtnetDiagramNode1Label => 'NODE 1\nDMX OUT';

  @override
  String get aboutArtnetDiagramNode2Label => 'NODE 2\nDMX OUT';

  @override
  String get aboutArtnetDiagramFixLabel => 'FIX';

  @override
  String get aboutArtnetDiagramInfoLabel => 'IP long / DMX court';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'SOURCE';

  @override
  String get aboutArtnetDiagramNodeALabel => 'NODE A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'NODE B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'NODE C';

  @override
  String get aboutArtnetDiagramUnicastLabel => 'Unicast: paquets vers un node';

  @override
  String get aboutArtnetDiagramBroadcastLabel =>
      'Broadcast: tout le monde reçoit';

  @override
  String get aboutArtnetMissingAssetLabel => 'Asset manquant';

  @override
  String get aboutRegistryDmxTitle => 'DMX — fonctionnement (simple & complet)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Univers, adresses, trames, câblage RS-485, terminaison, erreurs terrain.\nInclut schémas + checklist.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net — DMX sur IP (nodes, unicast/broadcast)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'Univers DMX sur Ethernet/UDP, nodes, broadcast vs unicast.\nLimites réelles, stabilité réseau, RDM selon matériel, schémas + checklist.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 — multicast, IGMP, priorités';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Standard DMX sur IP orienté réseau pro.\nMulticast/unicast, IGMP snooping/querier, priorités multi-sources, schémas + checklist.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Réseau — bases IP / masque / DHCP (essentiel)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Comprendre IP, masque, passerelle, DHCP vs statique.\nExemples concrets (2.x.x.x, 10.x, 192.168.x), tests rapides, pièges show.';

  @override
  String get aboutRegistryReseauTitle =>
      'Réseau — RJ45 / Fibre / débits & longueurs';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, fibre OM3/OM4/OS2, LC/SC/MPO, distances typiques, bonnes pratiques show.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Réseau lumière — VLAN, IGMP, Wi-Fi vs filaire';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Architecture simple et robuste pour Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switchs, schémas + checklist.';

  @override
  String get aboutRegistryVideoTitle => 'Vidéo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Choisir selon latence, fiabilité, câblage, réseau LAN vs WAN.\nTableaux + schéma.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Électrique — Schuko / P17 / puissances';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Connecteurs, mono/tri, tableaux kW rapides (16A→400A), pièges terrain.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'Informatique — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Débits utiles, versions, limites réelles, pièges marketing.';

  @override
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Index = Univers − 1 (base 0).';

  @override
  String get aboutNetworkPageTitle => 'Réseau lumière — VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Copier repères';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Copier';

  @override
  String get aboutNetworkChecklistTitle => 'Avant d’ouvrir Wireshark 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Info indicative (terrain). Selon le matériel réseau, IGMP/VLAN peuvent être indispensables.\nObjectif : rester simple et robuste.';

  @override
  String get aboutNetworkCopy1 =>
      'Réseau lumière: viser simple, dédié, et stable.';

  @override
  String get aboutNetworkCopy2 =>
      'VLAN = séparer le trafic (lumière vs reste).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = indispensable si sACN multicast à grande échelle.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = ok dépannage, rarement ok en prod critique.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Réseau lumière — Checklist\n☐ Réseau dédié ou VLAN lumière\n☐ Plan IP clair (DHCP ou statique) + masque ok\n☐ Switch correct; boucles évitées\n☐ sACN multicast: IGMP snooping ON\n☐ IGMP querier présent dans le VLAN (si infra le nécessite)\n☐ Unicast en dépannage (surtout Art-Net)\n☐ Wi-Fi: éviter prod critique (jitter/pertes)\n☐ Tests: ping stable + charge progressive (univers)';

  @override
  String get aboutNetworkToc1 => '1) Objectif: réseau stable';

  @override
  String get aboutNetworkToc2 => '2) Plan IP (simple)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (séparation)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (sACN multicast)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi vs filaire';

  @override
  String get aboutNetworkToc6 => '6) Switch: ce qu’il faut';

  @override
  String get aboutNetworkToc7 => '7) Schémas';

  @override
  String get aboutNetworkToc8 => '8) Checklist';

  @override
  String get aboutNetworkBasicsPill1 => 'Dédié/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Filaire';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP si multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Un réseau lumière doit être prévisible: faible perte, faible jitter, architecture simple. Quand ça bug, c’est rarement “le protocole” et souvent l’infra (switch, Wi-Fi, boucles, flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Règle de base';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'Si tu peux: filaire + switch correct + réseau dédié (ou VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'Si tu dois partager: VLAN + règles claires.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multicast: IGMP devient vite obligatoire.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Choisis une stratégie simple et cohérente. Deux approches: DHCP (simple) ou statique (prévisible). Le pire: un mélange non documenté.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Exemple de plan (simple)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'VLAN lumière: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Console/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Nodes: 10.10.0.100–150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Switch mgmt: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Erreurs classiques';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Masque différent (ex: /24 vs /16) → machines invisibles.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Deux appareils même IP → comportement aléatoire.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + statique sur même range sans contrôle → conflits.';

  @override
  String get aboutNetworkVlanParagraph =>
      'Un VLAN te permet d’isoler la lumière du reste (internet, production vidéo, invités…). Ça évite le bruit réseau et réduit le risque qu’un autre service casse ton show.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'Ce que tu gagnes';

  @override
  String get aboutNetworkVlanBullet1 => 'Moins de trafic parasite.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Moins de risques (DHCP externe, broadcast non désiré).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Debug plus simple (tout ce qui est dans le VLAN = lumière).';

  @override
  String get aboutNetworkVlanSubtitle => 'Attention';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'Un VLAN = il faut que tous les ports soient bien configurés (access/trunk).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'Si tu ne maîtrises pas: réseau dédié “physique” est souvent plus simple.';

  @override
  String get aboutNetworkIgmpPill1 => 'IGMP snooping';

  @override
  String get aboutNetworkIgmpPill2 => 'IGMP querier';

  @override
  String get aboutNetworkIgmpPill3 => 'Multicast flood';

  @override
  String get aboutNetworkIgmpParagraph =>
      'IGMP snooping permet au switch de savoir quels ports veulent quel multicast. Sans ça, le multicast peut être inondé sur tous les ports → saturation.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'IGMP querier (idée simple)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'Dans certains réseaux/VLAN, il faut un querier pour maintenir les abonnements IGMP.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'Sans querier: selon les switchs, les abonnements expirent et tu vois des “glitches”.';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'Si tu es en petit réseau dédié: parfois tout marche, mais en gros réseau: c’est critique.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Schéma : IGMP (idée)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'Filaire';

  @override
  String get aboutNetworkWifiSubtitle2 => 'Wi-Fi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Latence stable, pertes faibles (si infra propre).';

  @override
  String get aboutNetworkWifiSubBullet2 => '✅ Recommandé en prod.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      '✅ Pratique (setup rapide, tablette).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌ Latence variable (jitter), pertes, interférences.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      '❌ Multicast parfois mal géré selon AP/config.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK dépannage / petites configs non critiques, rarement OK en show chargé.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Règle simple';

  @override
  String get aboutNetworkWifiBullet1 => 'Show critique = filaire.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = confort opérateur (UI), pas transport principal DMX/IP si gros volume.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Minimum recommandé';

  @override
  String get aboutNetworkSwitchBullet1 => 'Switch Ethernet correct (pas hub).';

  @override
  String get aboutNetworkSwitchBullet2 => 'Câbles OK (RJ45, connecteurs).';

  @override
  String get aboutNetworkSwitchBullet3 => 'Éviter boucles (ou STP maîtrisé).';

  @override
  String get aboutNetworkSwitchBullet4 => 'Si sACN multicast: IGMP snooping.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Managed vs unmanaged';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'Unmanaged: ok petit réseau dédié (simple).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Managed: utile pour VLAN/IGMP/diagnostics (gros réseau).';

  @override
  String get aboutNetworkDiagramsSubtitle1 => 'VLAN: séparer lumière / reste';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi vs filaire (idée)';

  @override
  String get aboutNetworkChecklistBullet1 => 'Plan IP clair, masque cohérent.';

  @override
  String get aboutNetworkChecklistBullet2 => 'Réseau dédié / VLAN lumière.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Switch OK, pas de boucles.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP pour sACN multicast.';

  @override
  String get aboutNetworkChecklistBullet5 => 'Wi-Fi évité en prod critique.';

  @override
  String get videoCameraExposureTitle => 'Exposition caméra';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, vitesse et ouverture.';

  @override
  String get videoCamPageTitle => 'Exposition caméra';

  @override
  String get videoCamInfoTitle => 'Info';

  @override
  String get videoCamIntro =>
      'Calculs indicatifs pour relier lux, ISO, vitesse et ouverture.';

  @override
  String get videoCamInputsTitle => 'Entrées';

  @override
  String get videoCamLuxLabel => 'Lux';

  @override
  String get videoCamLuxHint => 'Ex: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Ex: 800';

  @override
  String get videoCamShutterLabel => 'Vitesse (s)';

  @override
  String get videoCamShutterHint => 'Ex: 1/50';

  @override
  String get videoCamApertureLabel => 'Ouverture (f/)';

  @override
  String get videoCamApertureHint => 'Ex: 2.8';

  @override
  String get videoCamEvEmpty => '—';

  @override
  String get videoCamNote =>
      'Valeurs indicatives : la calibration dépend du capteur, de la scène et des normes.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV $ev';
  }

  @override
  String videoCamApertureResult(Object aperture) {
    return 'Ouverture : f/$aperture';
  }

  @override
  String videoCamShutterResult(Object shutter) {
    return 'Vitesse : $shutter s';
  }

  @override
  String get aboutDmxS2Title => '2) Trame DMX — break, start code, canaux';

  @override
  String get aboutDmxS2PillBreak => 'Break';

  @override
  String get aboutDmxS2PillStartCode => 'Start code';

  @override
  String get aboutDmxS2PillSlots512 => '512 slots';

  @override
  String get aboutDmxS2PillRefresh => 'Refresh';

  @override
  String get aboutDmxS2Intro =>
      'Une trame DMX est envoyée en boucle. Elle commence par un « break » (silence), puis un start code, puis jusqu’à 512 valeurs (0–255). Chaque appareil lit uniquement les canaux qui le concernent (selon son adresse et son mode).';

  @override
  String get aboutDmxS2HowToReadTitle => 'Lire une trame (très simplement)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Break + MAB : marque le début de la trame (resynchronisation).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Start code : le plus souvent 0x00 (données d’éclairage).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Slots 1→512 : chaque slot = 1 canal (0–255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'La trame recommence en continu : c’est normal d’« écraser » l’ancienne valeur.';

  @override
  String get aboutDmxS2PracticalTitle => 'En pratique';

  @override
  String get aboutDmxS2PracticalB1 =>
      'Un mode 16-bit utilise 2 canaux pour une même fonction (ex: Pan coarse + Pan fine).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'Plus tu envoies d’univers, plus la charge globale (consoles/nodes/réseau) augmente.';

  @override
  String get aboutDmxS2PracticalB3 =>
      'Si tu as du flicker, pense d’abord câble/termination/branchements avant de soupçonner la console.';

  @override
  String get aboutDmxS3Title => '3) Câblage DMX — RS-485, topologie, pinout';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Daisy-chain';

  @override
  String get aboutDmxS3PillNoY => 'Pas de Y';

  @override
  String get aboutDmxS3Pill120ohm => '120 Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 est basé sur RS-485 : un bus différentiel qui aime les lignes propres. La règle d’or : une chaîne (daisy-chain) de la source vers les appareils, puis une terminaison à la fin.';

  @override
  String get aboutDmxS3TopologyTitle => 'Topologie recommandée';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Source → Appareil 1 → Appareil 2 → … → dernier appareil.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Évite les dérivations en Y : elles créent des réflexions (instabilité).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'Si tu dois faire des branches : utilise un splitter DMX opto-isolé.';

  @override
  String get aboutDmxS3PinoutTitle => 'Connectique (rappel)';

  @override
  String get aboutDmxS3CablesTitle => 'Câbles : ce qui marche vraiment';

  @override
  String get aboutDmxS3CablesB1 =>
      'Utilise un câble DMX (impédance ~120 Ω), pas un micro aléatoire (sauf dépannage court).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Garde les longueurs raisonnables et évite les enroulements serrés près d’alim/gradateurs.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Un mauvais câble = parfois « ça marche »… jusqu’au jour où non (humidité, longueur, charge).';

  @override
  String get aboutDmxS4Title => '4) Terminaison & splitters — stabilité du bus';

  @override
  String get aboutDmxS4Intro =>
      'Sur un bus RS-485, la terminaison évite les réflexions en bout de ligne. Les splitters (opto-isolés) servent à créer des branches propres et à protéger la source.';

  @override
  String get aboutDmxS4TerminatorTitle =>
      'Terminaison (120 Ω) : quand et comment';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Met une terminaison sur le dernier appareil (ou un bouchon XLR).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Une seule terminaison par ligne (pas partout).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Indispensable sur longues lignes, grosses charges, environnements bruyants.';

  @override
  String get aboutDmxS4SplittersTitle => 'Splitters / opto-isolation';

  @override
  String get aboutDmxS4SplittersB1 =>
      'Permet de faire 2, 4, 8 branches sans « Y ».';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Isole électriquement : limite les boucles de masse et protège la console/node.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Pratique pour “re-driver” un signal sur de longues distances.';

  @override
  String get aboutDmxS5Title =>
      '5) Dépannage — méthode simple (rapide et fiable)';

  @override
  String get aboutDmxS5Intro =>
      'Quand un appareil ne répond pas, la clé est d’isoler : est-ce l’adresse, le mode, la ligne DMX, ou l’appareil ? Suis une checklist courte avant de tout reconfigurer.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Checklist rapide';

  @override
  String get aboutDmxS5QuickB1 =>
      'Adresse DMX correcte ? (et pas 001 vs 000 selon l’écran).';

  @override
  String get aboutDmxS5QuickB2 => 'Bon mode DMX (nombre de canaux) ?';

  @override
  String get aboutDmxS5QuickB3 =>
      'Bon univers / sortie (console, node, port) ?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Teste avec un câble connu OK, puis en remplaçant un par un.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Ajoute/retire une terminaison au bout de la ligne pour voir l’effet.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'Si ça flicker / décroche';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Cherche un “Y” caché, un splitter non adapté, ou un mauvais adaptateur XLR.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Éloigne DMX des alimentations/gradateurs, évite les grandes boucles de câble.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Réduis la complexité : 1 univers, 1 ligne, 1 appareil, puis tu reconstruis.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Règle d’or';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'Tu dois pouvoir faire fonctionner un seul appareil sur une seule ligne. Si ce test de base échoue, le problème n’est pas « le patch complet » : c’est l’adressage, le câblage, ou le matériel.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net — DMX sur IP (vocabulaire et pièges)';

  @override
  String get aboutDmxS6PillUdp => 'UDP';

  @override
  String get aboutDmxS6PillNodes => 'Nodes';

  @override
  String get aboutDmxS6PillBroadcast => 'Broadcast';

  @override
  String get aboutDmxS6PillUnicast => 'Unicast';

  @override
  String get aboutDmxS6Intro =>
      'Art-Net transporte des univers DMX via Ethernet (UDP). Une console/logiciel envoie des univers sur le réseau, et un node les convertit en sorties DMX physiques.';

  @override
  String get aboutDmxS6BasicsTitle => 'À retenir';

  @override
  String get aboutDmxS6BasicsB1 => 'Un node = réseau ↔ DMX (plusieurs ports).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Broadcast envoie à tout le monde (simple mais peut saturer).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'Unicast envoie seulement au node ciblé (souvent plus stable sur gros rigs).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Attention au comptage d’univers : souvent Art-Net commence à 0 (Univers 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => 'Quand choisir Art-Net ?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Petits/moyens rigs, set-ups rapides, beaucoup de matériel compatible.';

  @override
  String get aboutDmxS6WhenB2 =>
      'OK si le réseau est propre (switch correct, câbles, pas de Wi-Fi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'Si ça sature : passe en unicast et segmente le réseau (VLAN / réseau dédié).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) — multicast, priorités, réseau propre';

  @override
  String get aboutDmxS7PillE131 => 'E1.31';

  @override
  String get aboutDmxS7PillMulticast => 'Multicast';

  @override
  String get aboutDmxS7PillPriority => 'Priorité';

  @override
  String get aboutDmxS7PillIgmp => 'IGMP';

  @override
  String get aboutDmxS7Intro =>
      'sACN (ANSI E1.31) est un standard moderne pour transporter des univers DMX sur IP. Il est très utilisé en grands systèmes car il gère bien le multicast et les priorités.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Idées clés';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast : un univers est un “groupe” réseau (les nodes s’abonnent).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'IGMP snooping sur les switches = indispensable à grande échelle (sinon ça inonde).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Priorité : plusieurs sources possibles, celle avec la plus haute priorité gagne.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Comme Art-Net : réseau propre + câbles/switch de qualité = stabilité.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN — résumé (quoi choisir ?)';

  @override
  String get aboutDmxS8Intro =>
      'Les trois font la même chose au final : piloter des canaux. La différence se joue sur la distribution (câble DMX vs réseau), l’échelle, et la robustesse.';

  @override
  String get aboutDmxS8QuickTableTitle => 'Résumé en 4 lignes';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX : simple, robuste, 1 câble = 1 ligne (512 canaux).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net : très courant, facile à déployer, attention au broadcast.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN : plus “pro grands systèmes”, multicast + priorités, demande un réseau bien configuré.';

  @override
  String get aboutDmxS8QuickB4 =>
      'Dans tous les cas : documentation + test progressif = gain de temps énorme.';

  @override
  String get aboutDmxS8ChooseTitle => 'Choix rapide';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Petit set-up : DMX direct ou Art-Net (simple).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Beaucoup d’univers : réseau dédié + nodes ; Art-Net en unicast ou sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Très gros rigs / infrastructures : sACN + switches/IGMP bien gérés.';

  @override
  String get aboutSunTimesTitle => 'Soleil (lever / coucher)';

  @override
  String get aboutSunTimesSubtitle =>
      'Choix d’une ville et d’une date, heures de lever/coucher + seuils (lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'Réseau — repères terrain';

  @override
  String get aboutReseauSummaryCopy =>
      'RÉSEAU — repères terrain\n• RJ45 : Cat5e/6/6A → 1G/10G selon distance.\n• Fibre : longue distance + immunité EMI.\n• Switch : IGMP important pour sACN multicast.\n• VLAN : séparer lumière/vidéo/IT = stabilité.';

  @override
  String get aboutReseauChecklistCopy =>
      'RÉSEAU — Checklist\n☐ Plan IP clair (plage / masques)\n☐ Switch correct (IGMP si sACN multicast)\n☐ VLAN si plusieurs “mondes” (lumière/vidéo/IT)\n☐ Câbles testés + étiquetés\n☐ Fibre : modules compatibles + connecteurs propres\n☐ Éviter boucles (STP) + éviter Wi-Fi public sur show LAN';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Copier';

  @override
  String get aboutReseauFooterNote =>
      'Info indicative (terrain). Les capacités exactes varient selon matériel / câbles / modules.\nObjectif : repères simples + méthode fiable.';

  @override
  String get aboutReseauToc1 => '1) Bases réseau (LAN / IP / débit)';

  @override
  String get aboutReseauToc2 => '2) RJ45 & catégories (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc3 => '3) PoE (alimentation réseau)';

  @override
  String get aboutReseauToc4 => '4) Fibre (SM/MM) + connecteurs (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP / SFP+ / QSFP (modules)';

  @override
  String get aboutReseauToc6 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN sur réseau (conseils)';

  @override
  String get aboutReseauToc8 => '8) Checklist';

  @override
  String get aboutReseauSection1Title => 'Les 3 idées simples';

  @override
  String get aboutReseauSection1Bullet1 => 'IP = adresse (ex: 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = réseau local via switch (pas “internet”).';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Débit = capacité (1G, 10G…), mais la stabilité dépend aussi du switch.';

  @override
  String get aboutReseauSection1Title2 => 'Topologie show (propre)';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Console/PC → switch central → nodes/serveurs.';

  @override
  String get aboutReseauSection1Bullet5 =>
      'Évite les “daisy-chain réseau” au hasard.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Si possible : un réseau dédié show (pas le Wi-Fi public).';

  @override
  String get aboutReseauSection2Title => 'Repères rapides';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e : 1 Gbit/s “classique” (jusqu’à 100m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6 : 1G/10G (10G plutôt sur distances plus courtes).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A : 10G jusqu’à 100m (repère pratique).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Au-delà : Cat7/8 existent, mais Cat6A est souvent le sweet spot terrain.';

  @override
  String get aboutReseauSection2Title2 => 'Terrain';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Toujours tester/étiqueter les câbles (surtout quand c’est loué).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Évite les connecteurs abîmés : un RJ45 “fatigué” = pannes fantômes.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Prévoir du 10G si tu fais vidéo IP lourde.';

  @override
  String get aboutReseauSection3Paragraph =>
      'PoE permet d’alimenter des équipements via RJ45 (cam IP, AP Wi-Fi, petits nodes…). Le point critique : le budget PoE total du switch.';

  @override
  String get aboutReseauSection3Title => 'Repères';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt plus haut.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'Le switch a un “budget” total (ex: 120W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'Si tu dépasses le budget : certains ports ne s’allument plus / reboot.';

  @override
  String get aboutReseauSection4Title => 'Pourquoi la fibre en show';

  @override
  String get aboutReseauSection4Bullet1 => 'Très longues distances.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Immunité aux parasites (EMI), top en environnements chargés.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Pratique pour relier FOH ↔ plateau ↔ régie.';

  @override
  String get aboutReseauSection4Title2 =>
      'Multimode vs Monomode (repère simple)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimode (MM) : distances “moyennes” (souvent bâtiment / plateau).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Monomode (SM) : très longues distances.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'Les modules (SFP) doivent matcher le type de fibre.';

  @override
  String get aboutReseauSection4Title3 => 'Connecteurs';

  @override
  String get aboutReseauSection4Bullet7 => 'LC : petit, très courant sur SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC : plus gros, courant en infrastructure.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Toujours protéger/clean (poussière = pertes).';

  @override
  String get aboutReseauSection5Title => 'Repères';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP : souvent 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+ : souvent 10G.';

  @override
  String get aboutReseauSection5Bullet3 => 'QSFP/QSFP+ : 40G (selon usage).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'Un module = vitesse + type fibre + longueur (tout doit être cohérent).';

  @override
  String get aboutReseauSection5Paragraph =>
      'En pratique : prends des modules compatibles avec le switch (et idéalement du même fournisseur/modèle) pour éviter les surprises.';

  @override
  String get aboutReseauSection6Title => 'Fonctions utiles en spectacle';

  @override
  String get aboutReseauSection6Bullet1 =>
      'VLAN : séparer lumière / vidéo / IT.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'IGMP snooping : indispensable si tu utilises sACN multicast à grande échelle.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS : utile si tu mixes beaucoup de flux (selon contexte).';

  @override
  String get aboutReseauSection6Title2 => 'Erreurs fréquentes';

  @override
  String get aboutReseauSection6Bullet4 =>
      'Switch “cheap” qui flood le multicast → réseau qui s’écroule.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Boucle réseau sans STP → tempête de broadcast.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Wi-Fi public sur le même LAN que le show → instabilité.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (terrain)';

  @override
  String get aboutReseauSection7Bullet1 => 'Souvent simple à mettre en place.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'Broadcast possible sur petit LAN dédié, mais unicast est plus propre.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Mapping univers/ports = point numéro 1 à vérifier.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (terrain)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast : efficace, mais exige un switch correct (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Priorités : utile si plusieurs sources.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'Sur gros shows : sACN + IGMP est souvent le choix “propre”.';

  @override
  String get aboutReseauChecklistTitle => 'Rapide';

  @override
  String get aboutReseauChecklistBullet1 => 'Switch correct + câbles propres.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP si sACN multicast.';

  @override
  String get aboutReseauChecklistBullet3 => 'Séparer les usages (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 — multicast & priorités';

  @override
  String get aboutSacnCopyTooltip => 'Copier repères';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Copier';

  @override
  String get aboutSacnFooterNote =>
      'Info indicative (terrain). Les comportements dépendent des switchs (IGMP), nodes et firmwares.\nObjectif : comprendre et stabiliser un réseau sACN.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX sur IP (UDP), standard spectacle.';

  @override
  String get aboutSacnCopy2 => 'Universe sACN = 1..63999 (plage standard).';

  @override
  String get aboutSacnCopy3 =>
      'Multicast: IGMP snooping recommandé, sinon flood.';

  @override
  String get aboutSacnCopy4 =>
      'Priorité: utile avec sources multiples (console + backup).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) — Checklist terrain\n☐ Switch correct (idéalement manageable)\n☐ IGMP snooping activé si multicast\n☐ (Si possible) IGMP querier présent dans le VLAN (sinon comportements bizarres possibles)\n☐ Unicast si réseau non maîtrisé / dépannage\n☐ Priorités: vérifier sources multiples (console/backup)\n☐ Mapping univers ↔ ports node vérifié\n☐ Wi-Fi évité en prod';

  @override
  String get aboutSacnToc1 => '1) À quoi sert sACN ?';

  @override
  String get aboutSacnToc2 => '2) Univers (numérotation)';

  @override
  String get aboutSacnToc3 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc4 => '4) Priorités (multi-sources)';

  @override
  String get aboutSacnToc5 => '5) Limites / perfs';

  @override
  String get aboutSacnToc6 => '6) RDM & sACN (proxy / selon matériel)';

  @override
  String get aboutSacnToc7 => '7) Schémas';

  @override
  String get aboutSacnToc8 => '8) Checklist';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multicast';

  @override
  String get aboutSacnSection1Pill3 => 'Priorité';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) est un standard largement utilisé pour transporter des univers DMX sur IP. Il est souvent privilégié quand on veut une architecture réseau propre: multicast bien géré, priorités standardisées, et un comportement plus “réseau pro”.';

  @override
  String get aboutSacnSection1Title => 'Quand c’est top';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Beaucoup d’univers sur un réseau bien géré.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Installations / gros réseaux avec plusieurs sources (priorités).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'Quand tu veux éviter le “broadcast partout”.';

  @override
  String get aboutSacnSection2Pill1 => 'Universe 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 slots/universe';

  @override
  String get aboutSacnSection2Paragraph =>
      'Un univers sACN correspond à un univers DMX: jusqu’à 512 slots. La numérotation sACN standard est 1..63999. En pratique, l’important est le mapping console ↔ node ↔ port DMX.';

  @override
  String get aboutSacnSection2Title => 'Erreur classique';

  @override
  String get aboutSacnSection2Bullet1 =>
      'Tu changes le numéro d’univers côté console, mais pas côté node (ou inverse).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'Tu patches “Universe 0” alors que le matériel attend une base 1.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Tu mélanges des conventions de numérotation entre outils.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN utilise souvent le multicast: chaque univers “vit” sur un groupe multicast, et les nodes s’abonnent aux univers dont ils ont besoin.';

  @override
  String get aboutSacnSection3Title =>
      'IGMP snooping (pourquoi c’est important)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Sans IGMP: le switch “flood” le multicast partout → surcharge possible.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Avec IGMP: le switch envoie seulement aux ports abonnés → réseau stable.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'Sur gros volumes: IGMP est souvent LA différence entre “ça marche” et “c’est l’enfer”.';

  @override
  String get aboutSacnSection3Subtitle => 'Schéma : multicast & IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (option)';

  @override
  String get aboutSacnSection3SubBullet1 => 'Possible selon consoles/nodes.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Utile en dépannage ou si réseau multicast non maîtrisé.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Moins élégant mais parfois plus simple.';

  @override
  String get aboutSacnSection4Pill1 => 'Source A prio 100';

  @override
  String get aboutSacnSection4Pill2 => 'Source B prio 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN gère une notion de priorité: si plusieurs sources envoient le même univers, le récepteur garde la source la plus prioritaire. Très utile avec une console principale + une console backup + un media server.';

  @override
  String get aboutSacnSection4Title => 'Pièges';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Deux sources non voulues sur le même univers → “ça se bat”.';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Priorité mal réglée → backup qui prend le dessus.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Debug: couper une source et vérifier qui gagne.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Switch';

  @override
  String get aboutSacnSection5Pill3 => 'Wi-Fi non';

  @override
  String get aboutSacnSection5Pill4 => 'CPU node';

  @override
  String get aboutSacnSection5Title => 'Ce qui casse en premier';

  @override
  String get aboutSacnSection5Bullet1 => 'Multicast sans IGMP → flood.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Switch non adapté (buffers/CPU) → pertes.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → jitter/pertes.';

  @override
  String get aboutSacnSection5Bullet4 => 'Nodes limités (ports, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Règles simples';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Switch géré + IGMP snooping si beaucoup d’univers.';

  @override
  String get aboutSacnSection5SubBullet2 => 'VLAN dédié lumière si possible.';

  @override
  String get aboutSacnSection5SubBullet3 => 'Unicast pour isoler en dépannage.';

  @override
  String get aboutSacnSection6Paragraph =>
      'Comme avec Art-Net, le RDM “sur IP” dépend souvent d’un mécanisme de proxy dans les nodes. Le standard sACN n’implique pas automatiquement que ton node fait du RDM correctement.';

  @override
  String get aboutSacnSection6Title => 'À vérifier dans la doc du node';

  @override
  String get aboutSacnSection6Bullet1 => 'Support RDM proxy / RDM over IP.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Limitations (discovery only, commandes partielles).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatibilité avec splitters/opto côté DMX.';

  @override
  String get aboutSacnSection6Subtitle => 'Méthode terrain';

  @override
  String get aboutSacnSection6SubBullet1 => 'Stabiliser DMX sans RDM.';

  @override
  String get aboutSacnSection6SubBullet2 =>
      'Tester RDM sur une ligne simple et propre.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'Si soucis: désactiver RDM, puis isoler node/splitter.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multicast + IGMP (idée)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Priorités (2 sources)';

  @override
  String get aboutSacnChecklistTitle => 'Avant d’accuser “le protocole”';

  @override
  String get aboutSacnChecklistBullet1 => 'IGMP snooping activé si multicast.';

  @override
  String get aboutSacnChecklistBullet2 => 'VLAN dédié si possible.';

  @override
  String get aboutSacnChecklistBullet3 => 'Unicast en dépannage.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Priorités cohérentes si multi-sources.';

  @override
  String get aboutSacnChecklistBullet5 => 'Wi-Fi évité en prod.';

  @override
  String get sunTimesTitle => 'Amanecer / atardecer';

  @override
  String get sunTimesSectionSettings => 'Paramètres';

  @override
  String get sunTimesSectionResults => 'Résultats';

  @override
  String get sunTimesSectionTimeline => 'Timeline (pas de 30 min)';

  @override
  String get sunTimesSectionTwilight =>
      'À quoi correspondent les crépuscules ?';

  @override
  String get sunTimesSectionLux => 'Seuils de luminosité (repères)';

  @override
  String get sunTimesIntro =>
      'Choisis une ville et une date. Les horaires sont indicatifs (arrondis).';

  @override
  String get sunTimesLabelCity => 'Ville';

  @override
  String get sunTimesLabelDate => 'Date';

  @override
  String get sunTimesNoteApprox =>
      'Heures indicatives — peuvent varier selon l’altitude, la réfraction et la météo.';

  @override
  String get sunTimesNoData => '—';

  @override
  String get sunTimesResultSunrise => 'Lever du soleil';

  @override
  String get sunTimesResultSunset => 'Coucher du soleil';

  @override
  String get sunTimesResultCivilDawn => 'Aube civile';

  @override
  String get sunTimesResultCivilDusk => 'Crépuscule civil';

  @override
  String get sunTimesResultNauticalDawn => 'Aube nautique';

  @override
  String get sunTimesResultNauticalDusk => 'Crépuscule nautique';

  @override
  String get sunTimesResultAstronomicalDawn => 'Aube astronomique';

  @override
  String get sunTimesResultAstronomicalDusk => 'Crépuscule astronomique';

  @override
  String get sunTimesTimelineStep30 => 'Pas: 30 min';

  @override
  String get sunTimesTimelineDay => 'Jour';

  @override
  String get sunTimesTimelineCivil => 'Civil';

  @override
  String get sunTimesTimelineNautical => 'Nautique';

  @override
  String get sunTimesTimelineAstronomical => 'Astronomique';

  @override
  String get sunTimesTimelineNight => 'Nuit';

  @override
  String get sunTimesTwilightIntro =>
      'Los crepúsculos se definen por el ángulo del sol bajo el horizonte. Esto estandariza la transición entre día y noche.';

  @override
  String get sunTimesTwilightCivilTitle => 'Civil (≈ 0° à −6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Fin/début de journée. On distingue encore bien le paysage.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Nautique (≈ −6° à −12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'La ligne d’horizon devient difficile à distinguer. Le ciel est nettement plus sombre.';

  @override
  String get sunTimesTwilightAstronomicalTitle =>
      'Astronomique (≈ −12° à −18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'Le ciel est proche de la nuit complète (peu de lumière résiduelle).';

  @override
  String get sunTimesLuxNight => 'Nuit noire';

  @override
  String get sunTimesLuxAstro => 'Crépuscule astro';

  @override
  String get sunTimesLuxNautical => 'Crépuscule naut.';

  @override
  String get sunTimesLuxCivil => 'Crépuscule civil';

  @override
  String get sunTimesLuxVeryLow => 'Très faible';

  @override
  String get sunTimesLuxLow => 'Faible';

  @override
  String get sunTimesLuxDay => 'Jour';

  @override
  String get sunTimesLuxFullDay => 'Plein jour';

  @override
  String get sunTimesLuxNote =>
      'Ces valeurs sont des repères typiques (météo, saison, environnement → variations).';

  @override
  String get aboutVideoPageTitle => 'Vidéo — repères terrain';

  @override
  String get aboutVideoSummaryCopy =>
      'VIDÉO — repères terrain\n• Résolution = taille (px). FPS = fluidité / latence.\n• 4:2:2 / 4:4:4 + 10-bit = qualité couleur.\n• SDI = robuste + longue distance.\n• HDMI = fragile + court.\n• NDI = IP (réseau), dépend du LAN.\n• Genlock / Timecode = synchro.';

  @override
  String get aboutVideoChecklistCopy =>
      'VIDÉO — Checklist\n☐ Même résolution & FPS partout\n☐ HDMI : EDID / HDCP maîtrisés\n☐ SDI : câble 75Ω + bon standard\n☐ NDI/IP : LAN propre (switch, débit)\n☐ Genlock / Timecode si synchro requise\n☐ Tester source → écran direct';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Copier';

  @override
  String get aboutVideoFooterNote =>
      'Info indicative (terrain). Les comportements varient selon matériels.\nObjectif : comprendre vite et dépanner proprement.';

  @override
  String get aboutVideoToc1 => '1) Bases vidéo (mots-clés)';

  @override
  String get aboutVideoToc2 => '2) Résolution & FPS';

  @override
  String get aboutVideoToc3 => '3) Couleur (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc4 => '4) Sync (Genlock / Timecode)';

  @override
  String get aboutVideoToc5 => '5) Câbles & distances';

  @override
  String get aboutVideoToc6 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI — terrain';

  @override
  String get aboutVideoToc8 => '8) NDI — quand / pourquoi / limites';

  @override
  String get aboutVideoToc9 => '9) Mapping / LED / multi-projo';

  @override
  String get aboutVideoSection1Paragraph =>
      'La vidéo, c’est une image (pixels) envoyée à un rythme (FPS), avec une structure couleur (sampling / bit depth), transportée par un lien (SDI / HDMI / IP) et parfois synchronisée.';

  @override
  String get aboutVideoSection1Title => 'Vocabulaire utile';

  @override
  String get aboutVideoSection1Bullet1 => 'Résolution : largeur×hauteur (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS : fluidité / latence.';

  @override
  String get aboutVideoSection1Bullet3 => 'Progressif (p) vs entrelacé (i).';

  @override
  String get aboutVideoSection1Bullet4 =>
      'Codec : compression (H.264, H.265…).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latency : critique en live.';

  @override
  String get aboutVideoSection2Title => 'Résolution';

  @override
  String get aboutVideoSection2Bullet1 => '1080p = 1920×1080.';

  @override
  String get aboutVideoSection2Bullet2 => '4K UHD = 3840×2160.';

  @override
  String get aboutVideoSection2Bullet3 => 'DCI 4K = 4096×2160 (cinéma).';

  @override
  String get aboutVideoSection2Bullet4 => 'Plus de pixels = plus de débit.';

  @override
  String get aboutVideoSection2Title2 => 'FPS';

  @override
  String get aboutVideoSection2Bullet5 => '25/50 : standard Europe.';

  @override
  String get aboutVideoSection2Bullet6 => '30/60 : standard US / devices.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Éviter de mixer 50 et 60 sans conversion.';

  @override
  String get aboutVideoSection3Title => 'Sampling';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4 : graphismes / keying.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2 : pro courant.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0 : fichiers / stream.';

  @override
  String get aboutVideoSection3Title2 => 'Bit depth';

  @override
  String get aboutVideoSection3Bullet4 => '8-bit : standard.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10-bit : meilleurs dégradés (HDR / LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 =>
      'Synchronise le rafraîchissement image.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Utile en multi-cam / LED / broadcast.';

  @override
  String get aboutVideoSection4Title2 => 'Timecode';

  @override
  String get aboutVideoSection4Bullet3 => 'Synchronisation temporelle.';

  @override
  String get aboutVideoSection4Bullet4 => 'Ne remplace pas le genlock.';

  @override
  String get aboutVideoSection5Title => 'Règles simples';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI : fragile, court.';

  @override
  String get aboutVideoSection5Bullet2 => 'SDI : robuste, long.';

  @override
  String get aboutVideoSection5Bullet3 => 'Fibre : très long + EMI free.';

  @override
  String get aboutVideoSection6Title => 'Repères';

  @override
  String get aboutVideoSection6Bullet1 => '3G : 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G : 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G : 2160p60';

  @override
  String get aboutVideoSection7Title => 'À surveiller';

  @override
  String get aboutVideoSection7Bullet1 => 'EDID';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Longueurs';

  @override
  String get aboutVideoSection8Title => 'IP vidéo';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexible.';

  @override
  String get aboutVideoSection8Bullet2 => 'Charge réseau.';

  @override
  String get aboutVideoSection8Bullet3 => 'LAN propre requis.';

  @override
  String get aboutVideoSection9Title => 'Terrain';

  @override
  String get aboutVideoSection9Bullet1 => 'Même résolution / FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Mapping correct.';

  @override
  String get aboutVideoSection9Bullet3 => 'Tester avec mires.';

  @override
  String get aboutVideoChecklistTitle => 'Avant de paniquer';

  @override
  String get aboutVideoChecklistBullet1 => 'Vérifier résolution / FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Tester source → écran.';

  @override
  String get aboutVideoChecklistBullet3 => 'Simplifier la chaîne.';

  @override
  String get homeBpmSubtitle => 'Tap tempo, conversion BPM ↔ ms, Hz, mesure.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tap tempo';

  @override
  String get bpmTapButton => 'Taper';

  @override
  String get bpmResetTap => 'Réinitialiser les taps';

  @override
  String get bpmDetectedLabel => 'BPM détecté';

  @override
  String get bpmTapHint =>
      'Tape plusieurs fois (idéalement 4 à 8 taps) pour obtenir une moyenne stable.';

  @override
  String get bpmManualTitle => 'BPM manuel';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ex. 128';

  @override
  String get commonAdd => 'Ajouter';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonCopied => 'Copié dans le presse-papiers.';

  @override
  String get patchCreateGdtfTitle => 'Créer un GDTF (simple)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Création manuelle d’un device sous forme de tableau.';

  @override
  String get gdtfSimpleTitle => 'Créateur GDTF (simple)';

  @override
  String get gdtfDeviceSectionTitle => 'Appareil';

  @override
  String get gdtfChannelsSectionTitle => 'Canaux';

  @override
  String get gdtfImportJsonTitle => 'Importer JSON';

  @override
  String get gdtfExportJsonTitle => 'Exporter JSON';

  @override
  String get gdtfImportJsonHint => 'Colle le JSON ici';

  @override
  String get gdtfManufacturerLabel => 'Fabricant';

  @override
  String get gdtfModelLabel => 'Modèle';

  @override
  String get gdtfModeNameLabel => 'Nom du mode';

  @override
  String get gdtfChannelsCountLabel => 'Canaux';

  @override
  String get gdtfFootprintLabel => 'Footprint';

  @override
  String get gdtfColIndex => '#';

  @override
  String get gdtfColName => 'Nom';

  @override
  String get gdtfColDmx => 'DMX';

  @override
  String get gdtfColType => 'Type';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Défaut';

  @override
  String get gdtfColActions => 'Actions';

  @override
  String get gdtfMoveUp => 'Monter';

  @override
  String get gdtfMoveDown => 'Descendre';

  @override
  String get gdtfChannelAddTitle => 'Ajouter un canal';

  @override
  String get gdtfChannelEditTitle => 'Modifier le canal';

  @override
  String get gdtfFieldName => 'Nom';

  @override
  String get gdtfFieldDmx => 'Adresse DMX';

  @override
  String get gdtfFieldType => 'Type';

  @override
  String get gdtfFieldResolution => 'Résolution';

  @override
  String get gdtfRes8 => '8-bit';

  @override
  String get gdtfRes16 => '16-bit';

  @override
  String get gdtfFieldDefault8 => 'Valeur par défaut (0–255)';

  @override
  String get gdtfFieldDefault16 => 'Valeur par défaut (0–65535)';

  @override
  String get gdtfDefaultChannelName => 'Canal';

  @override
  String get gdtfMvpHint =>
      'MVP : export JSON (presse-papiers). L’export GDTF réel (XML+ZIP) viendra ensuite.';

  @override
  String get gdtfTypeDimmer => 'Dimmer';

  @override
  String get gdtfTypePan => 'Pan';

  @override
  String get gdtfTypeTilt => 'Tilt';

  @override
  String get gdtfTypeColor => 'Couleur';

  @override
  String get gdtfTypeGobo => 'Gobo';

  @override
  String get gdtfTypeShutter => 'Shutter';

  @override
  String get gdtfTypePrism => 'Prism';

  @override
  String get gdtfTypeZoom => 'Zoom';

  @override
  String get gdtfTypeFocus => 'Focus';

  @override
  String get gdtfTypeIris => 'Iris';

  @override
  String get gdtfTypeEffect => 'Effet';

  @override
  String get gdtfTypeCustom => 'Personnalisé';

  @override
  String get gdtfEasyTitle => 'Créer un GDTF (simple)';

  @override
  String get gdtfTemplatesTitle => 'Présélections';

  @override
  String get gdtfCreateDefaultPreset => 'Créer le preset par défaut';

  @override
  String get gdtfTemplatesHint =>
      'Crée une base rapide (dimmer, shutter, pan, tilt, RGB, etc.) puis complète les adresses DMX et les défauts.';

  @override
  String get gdtfExportButton => 'Exporter GDTF';

  @override
  String get gdtfExportHint =>
      'Export .gdtf minimal (description.xml) puis partage (Mail, WhatsApp, AirDrop, Drive…).';

  @override
  String get gdtfExportNeedDmx =>
      'Ajoute au moins une adresse DMX pour exporter.';

  @override
  String get gdtfExportDone => 'GDTF exporté.';

  @override
  String get gdtfExportError => 'Impossible d’exporter le GDTF.';

  @override
  String get gdtfShareSubject => 'Fichier GDTF';

  @override
  String get gdtfShareText => 'Voici le fichier GDTF exporté.';

  @override
  String get gdtfFieldRole => 'Paramètre';

  @override
  String get gdtfDmxHint => 'Vide ou 1–512';

  @override
  String get gdtfFieldDefault => 'Défaut';

  @override
  String get gdtfDefaultHint8 => '0–255';

  @override
  String get gdtfDefaultHint16 => '0–65535';

  @override
  String get gdtfChannelDefaultName => 'Canal';

  @override
  String get gdtfRoleEmpty => 'Vide / Inconnu';

  @override
  String get gdtfRoleDimmer => 'Dimmer';

  @override
  String get gdtfRoleShutter => 'Shutter';

  @override
  String get gdtfRolePan => 'Pan';

  @override
  String get gdtfRoleTilt => 'Tilt';

  @override
  String get gdtfRoleRed => 'Rouge (R)';

  @override
  String get gdtfRoleGreen => 'Vert (G)';

  @override
  String get gdtfRoleBlue => 'Bleu (B)';

  @override
  String get gdtfRoleColor => 'Couleur';

  @override
  String get gdtfRoleGobo => 'Gobo';

  @override
  String get gdtfRoleZoom => 'Zoom';

  @override
  String get gdtfRoleFocus => 'Focus';

  @override
  String get gdtfRolePrism => 'Prism';

  @override
  String get gdtfRoleEffect => 'Effet';

  @override
  String get gdtfRoleControl => 'Control';

  @override
  String get gdtfRoleCustom => 'Custom';

  @override
  String get gdtfResUnknown => 'Vide';

  @override
  String get gdtfPresetDimmer => 'Dimmer';

  @override
  String get gdtfPresetShutter => 'Shutter';

  @override
  String get gdtfPresetPan => 'Pan';

  @override
  String get gdtfPresetTilt => 'Tilt';

  @override
  String get gdtfPresetRed => 'R';

  @override
  String get gdtfPresetGreen => 'G';

  @override
  String get gdtfPresetBlue => 'B';

  @override
  String get gdtfPresetColor1 => 'Color 1';

  @override
  String get gdtfPresetGobo1 => 'Gobo 1';

  @override
  String get gdtfPresetZoom => 'Zoom';

  @override
  String get gdtfPresetFocus => 'Focus';

  @override
  String get gdtfPresetPrism => 'Prism';

  @override
  String get gdtfPresetEffect => 'Effet';

  @override
  String get gdtfPresetControl => 'Control';

  @override
  String get commonApply => 'Appliquer';

  @override
  String get gdtfPresetLabel => 'Choix';

  @override
  String get gdtfPresetFixtureSimple => 'Fixture simple';

  @override
  String get gdtfPresetBarreLed => 'Barre LED';

  @override
  String get gdtfTemplatesHintShort =>
      'Choisis un preset puis applique. Tu peux ensuite ajuster DMX, défauts, et réordonner par glisser-déposer.';

  @override
  String get gdtfExportNeedChannels =>
      'Ajoute au moins un canal pour exporter.';

  @override
  String get homeDrawerContact => 'Contacter le développeur';

  @override
  String get homeDrawerSuggestItem => 'Proposer un article au catalogue';

  @override
  String get homeErrorOpenEmail =>
      'Impossible d\'ouvrir l\'application e-mail.';

  @override
  String get homeErrorOpenForm => 'Impossible d\'ouvrir le formulaire.';

  @override
  String get homeContactEmailSubject => 'Question concernant Mon App Tech';

  @override
  String get bpmManualHelp =>
      'Si un BPM manuel est saisi, il est prioritaire sur le tap tempo.';

  @override
  String get bpmConversionsTitle => 'Conversions';

  @override
  String get bpmActiveLabel => 'BPM actif';

  @override
  String get bpmMsPerBeat => 'Durée d’un beat';

  @override
  String get bpmHz => 'Fréquence';

  @override
  String get bpmSecPerBar44 => 'Durée d’une mesure (4/4)';

  @override
  String get bpmDisclaimer =>
      'Indication approximative. Vérifie au métronome si c’est critique.';

  @override
  String get laserToolsTitle => 'Outils';

  @override
  String get laserBeamSizeTitle => 'Taille du faisceau';

  @override
  String get laserBeamSizeSubtitle =>
      'Diamètre, rayon et surface du spot à une distance donnée.';

  @override
  String get laserBeamInputsTitle => 'Paramètres';

  @override
  String get laserBeamDistanceLabel => 'Distance';

  @override
  String get laserBeamDistanceHint => 'm (ex. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Calcul : D(z) = D0 + θ · z (θ en rad, angle plein).';

  @override
  String get laserBeamResultsTitle => 'Résultats';

  @override
  String get laserBeamDiameterAtDistance => 'Diamètre à la distance';

  @override
  String get laserBeamRadiusAtDistance => 'Rayon à la distance';

  @override
  String get laserBeamAreaAtDistance => 'Surface du spot';

  @override
  String get sunTimesPageTitle => 'Lever / coucher du soleil';

  @override
  String get sunTimesSelectionTitle => 'Paramètres';

  @override
  String get sunTimesCityLabel => 'Ciudad';

  @override
  String get sunTimesDateLabel => 'Fecha';

  @override
  String get sunTimesResultsTitle => 'Resultados';

  @override
  String get sunTimesSunriseLabel => 'Lever du soleil';

  @override
  String get sunTimesSunsetLabel => 'Coucher du soleil';

  @override
  String get sunTimesDayLengthLabel => 'Durée du jour';

  @override
  String get sunTimesDisclaimer =>
      'Valeurs indicatives (modèle astronomique). Vérifie avec une source officielle si nécessaire (événement, sécurité, tournage).';

  @override
  String get sunTimesThresholdTitle => 'Seuils de luminosité (repères)';

  @override
  String get sunTimesThresholdIntro =>
      'Ordres de grandeur utiles pour anticiper la lumière ambiante (très variable selon météo, latitude, saison, obstacles, pollution lumineuse).';

  @override
  String get sunTimesLuxDaylight => 'Plein jour (hors soleil direct)';

  @override
  String get sunTimesLuxOvercast => 'Ciel couvert (typique)';

  @override
  String get sunTimesLuxSunrise => 'Lever / coucher (clair)';

  @override
  String get sunTimesLuxCivilTwilight => 'Limite crépuscule civil (clair)';

  @override
  String get sunTimesLuxFullMoon => 'Pleine lune (clair)';

  @override
  String get sunTimesThresholdNote =>
      'Astuce : pour un repérage “utilisable sans éclairage”, on vise souvent > 100–300 lx. Pour un travail fin, plutôt 500 lx et +.';

  @override
  String get sunTimesParamsTitle => 'Ajustes';

  @override
  String get sunTimesPickDate => 'Elegir fecha';

  @override
  String get sunTimesSunrise => 'Amanecer';

  @override
  String get sunTimesSunset => 'Atardecer';

  @override
  String get sunTimesDayLength => 'Duración del día';

  @override
  String get sunTimesPolarNote =>
      'Si el sol no sale/se pone (cerca de los polos), el valor puede no estar disponible.';

  @override
  String get sunTimesLuxThresholdTitle =>
      'Umbrales de luminosidad (indicativos)';

  @override
  String get sunTimesLuxBulletNightDark =>
      '~0.001–0.01 lux: Noche oscura (sin luna).';

  @override
  String get sunTimesLuxBulletNightMoon =>
      '~0.01–0.1 lux: Noche con luna / cielo despejado.';

  @override
  String get sunTimesLuxBulletFullMoon =>
      '~0.3 lux: Luna llena (orden de magnitud).';

  @override
  String get sunTimesLuxBulletCivilTwilight =>
      '~3.4 lux: Crepúsculo civil (sol a -6°).';

  @override
  String get sunTimesLuxBulletUrbanLow =>
      '~10–50 lux: Iluminación urbana baja / mañana temprana.';

  @override
  String get sunTimesLuxBulletOfficeLow =>
      '~100 lux: Oficina tenue / pasillo bien iluminado.';

  @override
  String get sunTimesLuxBulletOfficeStd => '~500 lux: Oficina “estándar”.';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      '~1 000–10 000 lux: Día nublado a soleado.';

  @override
  String get sunTimesLuxBulletDirectSun =>
      '~100 000 lux: Sol directo (mediodía, cielo despejado).';

  @override
  String get sunTimesLuxDisclaimer =>
      '⚠️ Indicativo. El tiempo, los obstáculos, la latitud/altitud y la exposición cambian mucho la iluminancia real.';

  @override
  String get sunTimesTwilightTitle => 'Crepúsculos: ¿a qué corresponden?';

  @override
  String get sunTimesTwilightCivil =>
      'Crepúsculo civil: el sol entre 0° y -6°.';

  @override
  String get sunTimesTwilightNautical =>
      'Crepúsculo náutico: el sol entre -6° y -12°.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Crepúsculo astronómico: el sol entre -12° y -18°.';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Por debajo de -18°, suele considerarse “noche” (sin iluminación difusa debida al sol).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Crépuscule astronomique : Soleil à -18°';

  @override
  String get sunTimesTimelineTitleStep30 => 'Timeline (pas 30 min)';

  @override
  String get sunTimesTimelineColTime => 'Heure';

  @override
  String get sunTimesTimelineColElevation => 'Élévation';

  @override
  String get sunTimesTimelineColMarker => 'Repère';

  @override
  String get sunTimesTimelineColLux => 'Lux (ordre)';

  @override
  String get sunTimesTimelineFootnote =>
      'Repères indicatifs (météo/nuages, environnement, saison) — utile pour préparer un show.';

  @override
  String get aboutUniverseToArtnetColSubnet => 'Subnet';

  @override
  String appVersionLabel(Object version, Object build) {
    return 'Version $version ($build)';
  }

  @override
  String appVersionLabelNoBuild(Object version) {
    return 'Version $version';
  }

  @override
  String get aboutUniverseToArtnetColUniverse => 'Univers';

  @override
  String get videoLedResultWallResolution => 'Résolution mur';

  @override
  String get videoLedResultWallSize => 'Taille mur';

  @override
  String get videoLedResultTile => 'Dalle';

  @override
  String get videoLedResultPitch => 'Pitch';

  @override
  String get aboutSearchHint => 'Rechercher dans les références';

  @override
  String get aboutSearchNoResults => 'Aucun résultat trouvé.';

  @override
  String get homePinnedTitle => 'Épingles';

  @override
  String get homePinnedSubtitle =>
      'Retrouver rapidement vos références épinglées.';

  @override
  String get pinnedReferencesTitle => 'Références épinglées';

  @override
  String get pinnedReferencesEmpty =>
      'Aucune référence épinglée pour le moment.';

  @override
  String get aboutPinAddTooltip => 'Épingler cette référence';

  @override
  String get aboutPinRemoveTooltip => 'Retirer cette épingle';

  @override
  String get aboutPinAddedMessage => 'Référence épinglée.';

  @override
  String get aboutPinRemovedMessage => 'Épingle retirée.';
}
