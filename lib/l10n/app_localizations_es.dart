// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Mi App Tech';

  @override
  String get homeTitle => 'Inicio';

  @override
  String get menuTitle => 'Menú';

  @override
  String get settings => 'Ajustes';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Sistema (automático)';

  @override
  String get languageSystemCurrent => 'Idioma del teléfono';

  @override
  String get legalNotices => 'Avisos legales';

  @override
  String get resetConsents => 'Restablecer consentimientos';

  @override
  String get consentsReset => 'Consentimientos restablecidos.';

  @override
  String get homeVideoTitle => 'Vídeo';

  @override
  String get homeVideoSubtitle =>
      'Lente y medición, luminosidad, multiproyector, LED y patrones de prueba.';

  @override
  String get homeLightTitle => 'Luz';

  @override
  String get homeLightSubtitle =>
      'Tamaño de proyección, dip-switch DMX, fotometría, catálogo, patch DMX.';

  @override
  String get homeLaserTitle => 'Láser';

  @override
  String get homeLaserSubtitle =>
      'Cálculos y seguridad láser (consentimiento requerido en cada acceso).';

  @override
  String get homeReferencesTitle => 'Referencias';

  @override
  String get homeReferencesSubtitle =>
      'DMX / red / vídeo: fichas y referencias de campo.';

  @override
  String get disclaimerTitle =>
      '⚠️ ADVERTENCIA LEGAL Y EXENCIÓN DE RESPONSABILIDAD';

  @override
  String get disclaimerText =>
      'SOLO PARA USO INFORMATIVO\n\nLos cálculos proporcionados por esta aplicación (vídeo, luz, láser) son únicamente informativos y orientativos.\nNo sustituyen en ningún caso:\n- cálculos certificados,\n- estudios técnicos,\n- normas oficiales vigentes,\n- ni la validación por un profesional cualificado.\n\nRESPONSABILIDAD\nEl editor de esta aplicación no puede ser considerado responsable de errores de cálculo, omisiones, daños materiales,\nlesiones personales o cualquier incidente que ocurra durante la instalación, la explotación o el uso de los equipos.\n\nVÍDEO Y PROYECCIÓN\nLos resultados (tamaños, ratios, luminosidad, overlaps, etc.) se basan en modelos teóricos y pueden variar según:\nóptica, zoom, uniformidad, luz ambiente, superficie, ajustes, etc.\nVerifica siempre con la documentación oficial del fabricante.\n\nLUZ\n\nLos cálculos son orientativos y no tienen en cuenta todas las condiciones reales (tolerancias, pérdidas ópticas,\ndegradación de las fuentes, normas locales, condiciones ambientales…).\n\nLÁSER – SEGURIDAD\nLos cálculos NOHD, SZED y CZED se basan en hipótesis estándar y umbrales teóricos.\nNo tienen en cuenta, en particular:\n- instrumentos ópticos (prismáticos, cámaras, telescopios…),\n- condiciones atmosféricas (niebla, lluvia, polvo…),\n- reflejos imprevistos, usos indebidos, ajustes específicos.\nEl uso de un sistema láser implica responsabilidad directa del operador y un análisis de riesgos adecuado.\n\nACEPTACIÓN DE RIESGOS\nAl utilizar esta aplicación, el usuario reconoce:\n- haber leído las normas de seguridad aplicables,\n- ser el único responsable de sus instalaciones,\n- asumir toda la responsabilidad de los riesgos relacionados con el uso de los equipos (vídeo, luz, láser),\n- verificar sistemáticamente los datos con los manuales oficiales del fabricante.';

  @override
  String get disclaimerCertify =>
      'Certifico que he leído y acepto estas condiciones.';

  @override
  String get disclaimerAccept => 'Acepto';

  @override
  String get laserConsentTitle => '🔴 CONSENTIMIENTO LÁSER (OBLIGATORIO)';

  @override
  String get laserConsentText =>
      'ACCESO A LA SECCIÓN LÁSER\n\nLa sección LÁSER de esta aplicación trata cálculos de seguridad (p. ej.: NOHD, SZED, CZED).\nEstos cálculos son orientativos y no sustituyen:\n- un análisis de riesgos,\n- las normas vigentes,\n- los procedimientos de explotación,\n- ni la validación por una persona cualificada.\n\nIMPORTANTE\n- Riesgo de lesiones oculares / cutáneas en caso de mal uso.\n- El cálculo puede ser incorrecto si los parámetros introducidos son incompletos, erróneos o si las condiciones reales difieren (óptica,\n  condiciones atmosféricas, reflejos, alineación, etc.).\n- El operador es el único responsable de la instalación, la explotación y el cumplimiento.\n\nAl validar, confirmas:\n- entender los riesgos,\n- respetar las normas de seguridad aplicables,\n- asumir toda la responsabilidad en caso de negligencia o mal uso.';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonRename => 'Renombrar';

  @override
  String get commonSearch => 'Buscar';

  @override
  String get commonNone => 'Sin registros';

  @override
  String get commonCalculate => 'Calcular';

  @override
  String get commonCopyResultTooltip => 'Copiar el resultado';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get commonReset => 'Restablecer';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonTooLowWithCross => 'Demasiado bajo ❌';

  @override
  String get lightProjectionTitle => 'Tamaño de proyección';

  @override
  String get lightProjectionDescription =>
      'Cálculo orientativo del tamaño de la mancha según el ángulo, la distancia y el diámetro.';

  @override
  String get lightDmxSwitchTitle => 'Dip-switch DMX';

  @override
  String get lightDmxSwitchDescription =>
      'Conversión orientativa entre dirección DMX e interruptores, con navegación por intervalos.';

  @override
  String get lightPhotometryTitle => 'Fotometría';

  @override
  String get lightPhotometryDescription =>
      'Conversiones orientativas entre lux, candela y lumen, con distancia y ángulo.';

  @override
  String get lightCatalogTitle => 'Catálogo';

  @override
  String get lightCatalogDescription =>
      'Selección por fabricante, tipo y producto, con información y manual.';

  @override
  String get lightPatchTitle => 'Patch DMX';

  @override
  String get lightPatchDescription =>
      'Importar un archivo MVR o crear un patch manualmente desde la librería.';

  @override
  String get lightDisclaimerShort =>
      'Herramientas orientativas. Verifica siempre la documentación del fabricante.';

  @override
  String get laserInputsTitle => 'Entradas';

  @override
  String get laserPowerLabel => 'Potencia (mW)';

  @override
  String get laserPowerHint => 'p. ej.: 5000';

  @override
  String get laserDivergenceLabel => 'Divergencia (mrad)';

  @override
  String get laserDivergenceHint => 'p. ej.: 1.2';

  @override
  String get laserDiameterLabel => 'Diámetro de salida (mm)';

  @override
  String get laserDiameterHint => 'p. ej.: 3.0';

  @override
  String get laserSaveCurrentProjector => 'Guardar este proyector';

  @override
  String get laserSafetyResultsTitle => 'Resultados de seguridad';

  @override
  String get laserZoneNohdDesc => 'Peligro ocular';

  @override
  String get laserZoneSzedDesc => 'Zona sensible';

  @override
  String get laserZoneCzedDesc => 'Zona crítica';

  @override
  String get laserTargetDistanceLabel => 'Distancia objetivo (m)';

  @override
  String get laserTargetDistanceHint => 'p. ej.: 10';

  @override
  String get laserAdviceFullPower => 'Potencia total permitida (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Potencia máxima recomendada: $percent';
  }

  @override
  String get laserSavedProjectorsTitle => 'Proyectores guardados';

  @override
  String get laserSearchHint => 'p. ej.: “RGB 5W”';

  @override
  String laserPresetSubtitle(Object p, Object div, Object diam) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserSaveProjectorTitle => 'Guardar un proyector';

  @override
  String get laserRenameProjectorTitle => 'Renombrar el proyector';

  @override
  String get laserProjectorNameLabel => 'Nombre del proyector';

  @override
  String get laserInvalidInputs =>
      'Introduce valores válidos de potencia, divergencia y diámetro.';

  @override
  String get laserPresetAdded => 'Registro añadido.';

  @override
  String get laserPresetDeleted => 'Registro eliminado.';

  @override
  String get laserNameUpdated => 'Nombre actualizado.';

  @override
  String get laserNormativeParamsTitle => 'Parámetros de seguridad utilizados';

  @override
  String get laserNormativeParamsBody =>
      'MPE para la distancia nominal de peligro ocular (NOHD): 25,4 W/m²\n(Norma IEC 60825-1, edición 3.0)\n\nMPE para la distancia de exposición de la zona sensible (SZED): 1 W/m²\n(Norma ANSI Z136.6)\n\nMPE para la distancia de exposición de la zona crítica (CZED): 0,05 W/m²\n(Norma ANSI Z136.6)';

  @override
  String get laserDisclaimerShort =>
      'Cálculo orientativo. No sustituye un análisis de seguridad láser.';

  @override
  String get aboutDmxTitle => 'DMX — funcionamiento (simple y completo)';

  @override
  String get aboutDmxSubtitle =>
      'Universos, direcciones, tramas, cableado RS-485, terminación, problemas de campo.\nIncluye esquemas + checklist.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX sobre IP (nodes, unicast/broadcast)';

  @override
  String get aboutArtNetSubtitle =>
      'Universos DMX sobre Ethernet/UDP, nodes, broadcast vs unicast.\nLímites reales, estabilidad de red, RDM según hardware.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — multicast, IGMP, prioridades';

  @override
  String get aboutSacnSubtitle =>
      'Estándar DMX sobre IP orientado a red “pro”.\nMulticast/unicast, IGMP snooping/querier, prioridades multi-fuente.';

  @override
  String get aboutIpBasicsTitle => 'Red — bases IP / máscara / DHCP (esencial)';

  @override
  String get aboutIpBasicsSubtitle =>
      'Comprender IP, máscara, puerta de enlace, DHCP vs estático.\nEjemplos concretos (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutLightNetworkTitle =>
      'Red de iluminación — VLAN, IGMP, Wi-Fi vs cable';

  @override
  String get aboutLightNetworkSubtitle =>
      'Arquitectura simple y robusta para Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switches, esquemas + checklist.';

  @override
  String get aboutCablingFiberTitle =>
      'Red — RJ45 / fibra / caudales y distancias';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distancias típicas, buenas prácticas de show.';

  @override
  String get aboutVideoTitle => 'Vídeo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutVideoSubtitle =>
      'Elegir según latencia, fiabilidad, cableado, LAN vs WAN.\nTablas + esquema.';

  @override
  String get aboutElectricityTitle => 'Eléctrico — Schuko / P17 / potencias';

  @override
  String get aboutElectricitySubtitle =>
      'Conectores, mono/tri, tablas rápidas de kW (16A→400A), trampas de campo.';

  @override
  String get aboutComputingTitle =>
      'Informática — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutComputingSubtitle =>
      'Caudales útiles, versiones, límites reales, trampas de marketing.';

  @override
  String get videoTitle => 'Vídeo';

  @override
  String get videoToolsTitle => 'Herramientas de vídeo';

  @override
  String get videoDisclaimerShort =>
      'Cálculos orientativos. Verifica siempre la documentación del fabricante.';

  @override
  String get videoLensMeasureTitle => 'Lente y medición';

  @override
  String get videoLensMeasureSubtitle =>
      'Ratio / ancho / alto (cálculos 1 a 3).';

  @override
  String get videoBrightnessTitle => 'Luminosidad';

  @override
  String get videoBrightnessSubtitle =>
      'Lux / nits / ft-L + umbral (cálculo 4).';

  @override
  String get videoMultiprojectorTitle => 'Multiproyector';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + ancho/proyector + número de proyectores (cálculos 5 y 6).';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLedSubtitle =>
      'Píxeles del muro LED según tamaño, pitch y dimensiones de las tiles.';

  @override
  String get videoTestPatternTitle => 'Patrón de prueba';

  @override
  String get videoTestPatternSubtitle =>
      'Creación de patrones de prueba para pantallas y muros LED (más adelante).';

  @override
  String get videoMpFormatLabel => 'Formato (ratio)';

  @override
  String get videoMpCalc5Title => 'Cálculo 5 — Ancho por proyector';

  @override
  String get videoMpCalc6Title =>
      'Cálculo 6 — Número de proyectores (ratio min/max)';

  @override
  String get videoMpTotalWidthLabel => 'Ancho total de proyección (m)';

  @override
  String get videoMpTotalWidthHint => 'p. ej.: 18.0';

  @override
  String get videoMpDistanceLabel => 'Distancia de proyección (m)';

  @override
  String get videoMpDistanceHint => 'p. ej.: 12.0';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpOverlapHint => 'p. ej.: 10';

  @override
  String get videoMpProjectorCountLabel => 'Número de proyectores (N)';

  @override
  String get videoMpProjectorCountHint => 'p. ej.: 2';

  @override
  String get videoMpRatioMinLabel => 'Ratio min';

  @override
  String get videoMpRatioMinHint => 'p. ej.: 1.20';

  @override
  String get videoMpRatioMaxLabel => 'Ratio max';

  @override
  String get videoMpRatioMaxHint => 'p. ej.: 1.80';

  @override
  String get videoMpOptionalLuminanceTitle => 'Opcional: luminosidad';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lúmenes por proyector';

  @override
  String get videoMpLumensPerProjectorHint => 'p. ej.: 20000';

  @override
  String get videoMpGainLabel => 'Ganancia';

  @override
  String get videoMpGainHint => 'p. ej.: 1.0';

  @override
  String get videoMpErrMissing5 =>
      '❌ Datos faltantes: Ancho total + Overlap% + N.';

  @override
  String get videoMpErrWidthGt0 => '❌ El ancho total debe ser > 0.';

  @override
  String get videoMpErrNGte2 => '❌ N debe ser ≥ 2.';

  @override
  String get videoMpErrOverlapRange => '❌ Overlap% debe estar entre 0 y 99.9.';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Parámetros imposibles (denom ≤ 0).';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Datos faltantes: Ancho total + Distancia + Overlap%.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ El ancho total y la distancia deben ser > 0.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Datos faltantes: Ratio min y/o Ratio max.';

  @override
  String get videoMpErrInvalidRatio => '❌ Ratio inválido (debe ser > 0).';

  @override
  String get videoMpLumiOptionalHint =>
      'Luminosidad (opcional): introduce Lúmenes/proyector + Ganancia para estimar.';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Luminosidad: ❌ Lúmenes/proyector y ganancia deben ser > 0.';

  @override
  String videoMpCaseOpenMin(Object n, Object coverage) {
    return 'Caso ratio más abierto (min) = $n proyectores | cobertura ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object n, Object coverage) {
    return 'Caso ratio más cerrado (max) = $n proyectores | cobertura ≈ $coverage m';
  }

  @override
  String videoMpLumiEstimated(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Luminosidad estimada (N=$n)\nSuperficie: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpNoteIndicative => 'Nota: estimación orientativa.';

  @override
  String get videoLmFormatLabel => 'Formato (ratio)';

  @override
  String get videoLmCalc1Title => 'Cálculo 1 — Ratio (Distancia / Ancho)';

  @override
  String get videoLmCalc2Title => 'Cálculo 2 — Ancho (Distancia / Ratio)';

  @override
  String get videoLmCalc3Title => 'Cálculo 3 — Alto (Ancho + Formato)';

  @override
  String get videoLmDistanceLabel => 'Distancia de proyección (m)';

  @override
  String get videoLmDistanceHint => 'p. ej.: 12.0';

  @override
  String get videoLmImageWidthLabel => 'Ancho de imagen (m)';

  @override
  String get videoLmImageWidthHint => 'p. ej.: 6.0';

  @override
  String get videoLmThrowRatioLabel => 'Ratio de proyección';

  @override
  String get videoLmThrowRatioHint => 'p. ej.: 1.60';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Datos faltantes: Distancia + Ancho.';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Datos faltantes: Distancia + Ratio.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Dato faltante: Ancho.';

  @override
  String get videoLmErrWidthGt0 => '❌ El ancho debe ser > 0.';

  @override
  String get videoLmErrRatioGt0 => '❌ El ratio debe ser > 0.';

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Ratio de proyección = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Ancho de imagen = $width m';
  }

  @override
  String videoLmResultHeight(Object height, Object format) {
    return '✅ Alto = $height m (formato $format)';
  }

  @override
  String get videoLedCalcTitle => 'Cálculo — Píxeles / tiles';

  @override
  String get videoLedTilesXLabel => 'Tiles horizontales (X)';

  @override
  String get videoLedTilesXHint => 'p. ej.: 15';

  @override
  String get videoLedTilesYLabel => 'Tiles verticales (Y)';

  @override
  String get videoLedTilesYHint => 'p. ej.: 8';

  @override
  String get videoLedTileWpxLabel => 'Tile ancho (px)';

  @override
  String get videoLedTileWpxHint => 'p. ej.: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile alto (px)';

  @override
  String get videoLedTileHpxHint => 'p. ej.: 128';

  @override
  String get videoLedTileWcmLabel => 'Tile ancho (cm)';

  @override
  String get videoLedTileWcmHint => 'p. ej.: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile alto (cm)';

  @override
  String get videoLedTileHcmHint => 'p. ej.: 33.28';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Datos faltantes: Tiles X/Y + Tile px + Tile cm.';

  @override
  String get videoLedErrAllGt0 => '❌ Todos los valores deben ser > 0.';

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
      Object wallWpx,
      Object wallHpx,
      Object wallWm,
      Object wallHm,
      Object tileWpx,
      Object tileHpx,
      Object tileWcm,
      Object tileHcm,
      Object pitch) {
    return '✅ Resolución muro: $wallWpx × $wallHpx px\n✅ Tamaño muro: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nPitch calculado: $pitch';
  }

  @override
  String get videoCalculationsTitle => 'Cálculos de vídeo';

  @override
  String get videoCopyAllTooltip => 'Copiar todos los resultados';

  @override
  String get videoExportPdfTooltip => 'Exportar PDF';

  @override
  String get videoCalculateAll => 'Calcular todo';

  @override
  String get videoSummaryPillsTitle => 'Resumen (pastillas)';

  @override
  String get videoCopySummaryTooltip => 'Copiar el resumen';

  @override
  String get videoCommonParamsTitle => 'Parámetros comunes';

  @override
  String get videoFormatLabel => 'Formato (ratio)';

  @override
  String get videoDistanceLabel => 'Distancia de proyección (m)';

  @override
  String get videoDistanceHint => 'p. ej.: 12.0';

  @override
  String get videoImageWidthLabel => 'Ancho de imagen (m)';

  @override
  String get videoImageWidthHint => 'p. ej.: 6.0';

  @override
  String get videoThrowRatioLabel => 'Ratio de proyección';

  @override
  String get videoThrowRatioHint => 'p. ej.: 1.60';

  @override
  String get videoLumensLabel => 'Lúmenes (ANSI)';

  @override
  String get videoLumensHint => 'p. ej.: 20000';

  @override
  String get videoGainLabel => 'Ganancia';

  @override
  String get videoGainHint => 'p. ej.: 1.0';

  @override
  String get videoScreenPresetLabel => 'Pantalla / Superficie (preset)';

  @override
  String get videoPresetFrontWhite =>
      'Frontal - pantalla blanca mate (ganancia 1.0)';

  @override
  String get videoPresetFrontGrey => 'Frontal - pantalla gris (ganancia 0.8)';

  @override
  String get videoPresetFrontHighGain =>
      'Frontal - pantalla high gain (ganancia 1.3)';

  @override
  String get videoPresetRearDiffusion =>
      'Retro - tela de difusión (ganancia 0.7)';

  @override
  String get videoPresetRearClear => 'Retro - tela clara (ganancia 0.9)';

  @override
  String get videoPresetMappingMatte =>
      'Mapping - pintura mate (ganancia 0.75)';

  @override
  String get videoPresetMappingSatin =>
      'Mapping - pintura satinada (ganancia 0.9)';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping - piedra clara (ganancia 0.6)';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping - piedra oscura (ganancia 0.35)';

  @override
  String get videoPresetMappingGlass => 'Mapping - vidrio (ganancia 0.15)';

  @override
  String get videoPresetFrontWhiteShort => 'Frontal - pantalla blanca mate';

  @override
  String get videoPresetFrontGreyShort => 'Frontal - pantalla gris';

  @override
  String get videoPresetFrontHighGainShort => 'Frontal - pantalla high gain';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - tela de difusión';

  @override
  String get videoPresetRearClearShort => 'Retro - tela clara';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - pintura mate';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - pintura satinada';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping - piedra clara';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping - piedra oscura';

  @override
  String get videoPresetMappingGlassShort => 'Mapping - vidrio';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoOverlapHint => 'p. ej.: 10';

  @override
  String get videoTotalWidthLabel => 'Ancho total de proyección (m)';

  @override
  String get videoTotalWidthHint => 'p. ej.: 18.0';

  @override
  String get videoCalc1Title => 'Cálculo 1 — Ratio (Distancia / Ancho)';

  @override
  String get videoCalc2Title => 'Cálculo 2 — Ancho (Distancia / Ratio)';

  @override
  String get videoCalc3Title => 'Cálculo 3 — Alto (Ancho + Formato)';

  @override
  String get videoCalc4Title =>
      'Cálculo 4 — Luminosidad (lux / nits / ft-L + umbral)';

  @override
  String get videoCalc5Title => 'Cálculo 5 — Overlap (Ancho total + N)';

  @override
  String get videoCalc6Title =>
      'Cálculo 6 — Nº de proyectores auto + luminosidad';

  @override
  String get videoCalc5NLabel => 'Número de proyectores (N)';

  @override
  String get videoCalc5NHint => 'p. ej.: 2';

  @override
  String get videoCalc6RatioMinLabel => 'Ratio min';

  @override
  String get videoCalc6RatioMinHint => 'p. ej.: 1.20';

  @override
  String get videoCalc6RatioMaxLabel => 'Ratio max';

  @override
  String get videoCalc6RatioMaxHint => 'p. ej.: 1.80';

  @override
  String get videoOptionalBrightnessTitle => 'Opcional: luminosidad';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lúmenes por proyector';

  @override
  String get videoCalc6LumensPerProjectorHint => 'p. ej.: 20000';

  @override
  String get videoCalc6GainLabel => 'Ganancia (calc 6)';

  @override
  String get videoCalc6GainHint => 'p. ej.: 1.0';

  @override
  String get videoCalc1ErrMissing => '❌ Datos faltantes: Distancia + Ancho.';

  @override
  String get videoCalc2ErrMissing => '❌ Datos faltantes: Distancia + Ratio.';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Dato faltante: Ancho.';

  @override
  String get videoErrWidthGt0 => '❌ El ancho debe ser > 0.';

  @override
  String get videoErrRatioGt0 => '❌ El ratio debe ser > 0.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Ratio de proyección = $ratio';
  }

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Ancho de imagen = $width m';
  }

  @override
  String videoCalc3Ok(Object height, Object format) {
    return '✅ Alto = $height m (formato $format)';
  }

  @override
  String get videoCalc4ErrMissing =>
      '❌ Datos faltantes: Lúmenes + Ganancia + Ancho.';

  @override
  String get videoCalc4ErrGt0 => '❌ Lúmenes/Ganancia/Ancho deben ser > 0.';

  @override
  String videoCalc4Result(Object area, Object format, Object lux, Object luxEq,
      Object nits, Object fl, Object presetLabel, Object minFl, Object status) {
    return 'Superficie: $area m² (formato $format)\nLux (lm/m²): $lux\nLux eq (ganancia): $luxEq\nLuminancia: $nits nits | $fl ft-L\nUmbral mínimo ($presetLabel): $minFl ft-L → $status\nNota: conversión nits/ft-L basada en una hipótesis lambertiana (aprox).';
  }

  @override
  String get videoCalc5ErrMissing =>
      '❌ Datos faltantes: Ancho total + Overlap% + Número de proyectores.';

  @override
  String get videoErrTotalWidthGt0 => '❌ El ancho total debe ser > 0.';

  @override
  String get videoCalc5ErrNMin2 => '❌ El número de proyectores debe ser ≥ 2.';

  @override
  String get videoErrOverlapRange => '❌ Overlap% debe estar entre 0 y 99.9.';

  @override
  String get videoErrImpossibleDenom => '❌ Parámetros imposibles (denom ≤ 0).';

  @override
  String videoCalc5Result(Object wTot, Object n, Object overlapPct, Object wPer,
      Object overlapM, Object format, Object hTot) {
    return 'Ancho total: $wTot m\nN: $n | Overlap: $overlapPct% (sobre el ancho del proyector)\n\n- Ancho por proyector: $wPer m\n- Overlap entre 2 proyectores: $overlapM m\n- Alto total (formato $format): $hTot m';
  }

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Datos faltantes: Ancho total + Distancia + Overlap%.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ El ancho total y la distancia deben ser > 0.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Datos faltantes: Ratio min y/o Ratio max.';

  @override
  String get videoCalc6LumiOptional =>
      'Luminosidad (opcional): introduce Lúmenes/proyector + Ganancia para la estimación.';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Luminosidad: ❌ Lúmenes/proyector y ganancia deben ser > 0.';

  @override
  String videoCalc6LumiForN(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Luminosidad estimada (N=$n)\nSuperficie: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6NoteIndicative =>
      'Nota: estimación orientativa (el blend/overlap real puede reducir ligeramente).';

  @override
  String videoCalc6Result(
      Object wTot,
      Object distance,
      Object overlapPct,
      Object format,
      Object hTot,
      Object area,
      Object ratioMin,
      Object ratioMax,
      Object nMin,
      Object covMin,
      Object lumiMin,
      Object nMax,
      Object covMax,
      Object lumiMax,
      Object note) {
    return 'Ancho total=$wTot m | Distancia=$distance m | Overlap=$overlapPct%\nFormato $format → Alto total=$hTot m | Superficie=$area m²\nRatio min/max: $ratioMin → $ratioMax\n\nCaso ratio más abierto (min) = $nMin proyectores | cobertura ≈ $covMin m\n$lumiMin\n\nCaso ratio más cerrado (max) = $nMax proyectores | cobertura ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Formato: $format';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Distancia: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Ancho: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Ratio: $value';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Alto: $value';
  }

  @override
  String videoCommonPillArea(Object value) {
    return 'Superficie: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Ancho total: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlap: $value';
  }

  @override
  String get videoPdfTitle => 'Mon App Technique – Exportación de vídeo';

  @override
  String get videoPdfDate => 'Fecha';

  @override
  String get videoPdfFormat => 'Formato';

  @override
  String get videoPdfDistance => 'Distancia (m)';

  @override
  String get videoPdfImageWidth => 'Ancho de imagen (m)';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfLumens => 'Lúmenes';

  @override
  String get videoPdfGain => 'Ganancia';

  @override
  String get videoPdfScreenPreset => 'Preset de pantalla';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfTotalWidth => 'Ancho total (m)';

  @override
  String get videoPdfCalc5N => 'N (Calc5)';

  @override
  String get videoPdfCalc6RatioMin => 'Ratio min (Calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Ratio max (Calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lúmenes/proyector (Calc6)';

  @override
  String get videoPdfCalc6Gain => 'Ganancia (Calc6)';

  @override
  String get videoPdfParams => 'Parámetros';

  @override
  String get videoPdfResults => 'Resultados';

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
  String get videoPdfCalc6 => 'Cálculo 6';

  @override
  String videoCalcLabel(Object n) {
    return 'Cálculo $n';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Cálculo 4 — Lux / nits / ft-L + umbral';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Datos faltantes: Ancho + Lúmenes + Ganancia.';

  @override
  String videoBrightnessResult(
      Object format,
      Object area,
      Object lux,
      Object luxEq,
      Object nits,
      Object fl,
      Object presetLabel,
      Object minFl,
      Object status) {
    return 'Formato: $format\nSuperficie: $area m²\nLux (lm/m²): $lux\nLux eq (ganancia): $luxEq\nLuminancia: $nits nits | $fl ft-L\nUmbral mínimo ($presetLabel): $minFl ft-L → $status\nNota: estimación orientativa (Lambert).';
  }

  @override
  String get videoMireTitle => 'Patrón de prueba';

  @override
  String get videoMireHeaderTitle => 'Generador de patrones de prueba';

  @override
  String get videoMireHeaderSubtitle =>
      'Patrones orientativos (ajuste, enfoque, geometría, blend, pixel perfect).';

  @override
  String get videoMireScreenVideoTitle => 'Patrón para pantalla de vídeo';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simple (An×Al px) + mapping multiproyector (N + overlap).';

  @override
  String get videoMireScreenLedTitle => 'Patrón para pantalla LED';

  @override
  String get videoMireScreenLedSubtitle =>
      'Patrón según An×Al px (pixel perfect, uniformidad, rejilla).';

  @override
  String get mireVideoSimpleTitle => 'VÍDEO / PATRÓN SIMPLE';

  @override
  String get mireVideoComboTitle => 'VÍDEO / PATRÓN COMBO';

  @override
  String get mireVideoMappingTitle => 'VÍDEO / PATRÓN MAPPING';

  @override
  String get mireLedTitle => 'LED / PATRÓN';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireSimpleSubtitleGridSafe => 'Rejilla + safe + círculos';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Damero + círculos';

  @override
  String get mireSimpleSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformidad + círculos';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Rejilla + safe + 2 barras centradas + círculos';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedSubtitleGridLabels => 'Rejilla + referencias + círculos';

  @override
  String get mireLedSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedSubtitleUniformity => 'Uniformidad + círculos';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Overlap $percent% • $orient';
  }

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROY $index';
  }

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireTileMissingPx => 'Introduce Tile (px) para la numeración.';

  @override
  String get mireWallNotMultipleOfTiles => 'MURO NO MÚLTIPLO DE TILES';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px • Rejilla $nx x $ny';
  }

  @override
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm) {
    return 'Tile $wcm×$hcm cm';
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
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Muro ~ $wm×$hm m';
  }

  @override
  String get mireSimpleSectionTitle => 'Patrón de pantalla simple';

  @override
  String get mireMappingSectionTitle => 'Patrón de mapping multiproyector';

  @override
  String get mireVideoSimpleSectionTitle => 'Patrón de pantalla simple';

  @override
  String get mireVideoMappingSectionTitle => 'Patrón de mapping multiproyector';

  @override
  String get mireWidthPxLabel => 'Ancho (px)';

  @override
  String get mireHeightPxLabel => 'Alto (px)';

  @override
  String get mireWidthPxHint => 'p. ej.: 1920';

  @override
  String get mireHeightPxHint => 'p. ej.: 1080';

  @override
  String get mireWidthPxHintMapping => 'p. ej.: 3840';

  @override
  String get mireHeightPxHintMapping => 'p. ej.: 2160';

  @override
  String get mireTypeLabel => 'Tipo de patrón';

  @override
  String get mireExportPng => 'Exportar PNG';

  @override
  String get mireErrInvalidWHpx => '❌ Ancho/alto inválidos (px).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Número de proyectores inválido (N > 0).';

  @override
  String get mireErrInvalidOverlap => '❌ Overlap inválido (0 a 99.9).';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (rejilla + círculos + 2 barras centradas)';

  @override
  String get mireSimpleTypeGridSafe => 'Rejilla + safe + círculos';

  @override
  String get mireSimpleTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireSimpleTypeCheckerboard => 'Damero + círculos';

  @override
  String get mireProjectorsNLabel => 'Número de proyectores (N)';

  @override
  String get mireProjectorsNHint => 'p. ej.: 2';

  @override
  String get mireOverlapLabel => 'Overlap (%)';

  @override
  String get mireOverlapHint => 'p. ej.: 10.0';

  @override
  String get mireOrientationLabel => 'Orientación';

  @override
  String get mireMappingTypeLabel => 'Tipo de mapping';

  @override
  String get mireMappingTypeCombo => 'Combo (zonas + overlap + blend)';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonas + overlap';

  @override
  String get mireMappingTypeBlendRamps => 'Rampas de blend';

  @override
  String get mireDash => '—';

  @override
  String mirePitchEqual(Object value) {
    return '$value mm';
  }

  @override
  String mirePitchXY(Object x, Object y) {
    return 'X $x mm • Y $y mm';
  }

  @override
  String get mireLedParamsTitle => 'Parámetros del muro LED';

  @override
  String get mireLedTilesXLabel => 'Tiles horizontales (X)';

  @override
  String get mireLedTilesYLabel => 'Tiles verticales (Y)';

  @override
  String get mireLedTileWpxLabel => 'Tile ancho (px)';

  @override
  String get mireLedTileHpxLabel => 'Tile alto (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile ancho (cm)';

  @override
  String get mireLedTileHcmLabel => 'Tile alto (cm)';

  @override
  String mireLedWallResolution(Object w, Object h) {
    return 'Resolución muro: $w × $h px';
  }

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Pitch calculado: $pitch';
  }

  @override
  String get mireLedErrTilesXY => '❌ Introduce Tiles X/Y (>0).';

  @override
  String get mireLedErrTilePx => '❌ Introduce Tile px (ancho/alto >0).';

  @override
  String get mireLedErrTileCm => '❌ Introduce Tile cm (ancho/alto >0).';

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Pitch calculado fuera de rango (0.5–20 mm). Revisa Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (tile no homogénea). Revisa dimensiones en cm y px.';

  @override
  String get mireLedTypeTilesId => 'ID de tiles (número + colores)';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedTypeGridLabels => 'Rejilla + referencias + círculos';

  @override
  String get mireLedTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireVideoTypeCombo =>
      'Combo (rejilla + círculos + 2 barras centradas)';

  @override
  String get mireVideoTypeGridSafe => 'Rejilla + safe + círculos';

  @override
  String get mireVideoTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireVideoTypeCheckerboard => 'Damero + círculos';
}
