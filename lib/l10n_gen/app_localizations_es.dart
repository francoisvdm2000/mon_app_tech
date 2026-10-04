// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'Universo DMX en Ethernet/UDP, nodos, transmisión versus unidifusión.\nLímites reales, estabilidad de la red, RDM según el hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX sobre IP (nodos, unidifusión/difusión)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distancias típicas, muestra de mejores prácticas.';

  @override
  String get aboutCablingFiberTitle =>
      'Red: RJ45 / Fibra / velocidades y longitudes';

  @override
  String get aboutComputingSubtitle =>
      'Velocidades útiles, versiones, límites reales, trampas de marketing.';

  @override
  String get aboutComputingTitle =>
      'Computadoras: USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutDmxSubtitle =>
      'Universo, direcciones, tramas, cableado RS-485, terminación, errores de campo.\nIncluye diagramas + lista de verificación.';

  @override
  String get aboutDmxTitle => '__TECNOLOGÍA_0__';

  @override
  String get aboutElectricitySubtitle =>
      'Conectores, mono/tri, tablas rápidas de kW (16A→400A), trampas de campo.';

  @override
  String get aboutElectricityTitle => 'Eléctrico — Schuko / P17 / potencias';

  @override
  String get aboutIpBasicsSubtitle =>
      'Comprenda IP, máscara, puerta de enlace, DHCP frente a estático.\nEjemplos concretos (2.x, 10.x, 192.168.x) + lista de verificación.';

  @override
  String get aboutIpBasicsTitle => 'Conceptos básicos de propiedad intelectual';

  @override
  String get aboutLightNetworkSubtitle =>
      'Arquitectura simple y robusta para Art-Net/sACN.\nVLAN, IGMP snooping/queridor, Wi-Fi (jitter), conmutadores, diagramas + lista de verificación.';

  @override
  String get aboutLightNetworkTitle =>
      'Red ligera: VLAN, IGMP, Wi-Fi o cableada';

  @override
  String get aboutSacnSubtitle =>
      'Estándar DMX en red \"profesional\" orientada a IP.\nMultidifusión/unidifusión, espionaje/consulta IGMP, prioridades de múltiples fuentes.';

  @override
  String get aboutSacnTitle => '__TECNOLOGÍA_2__';

  @override
  String get aboutVideoSubtitle =>
      'Elija según la latencia, la confiabilidad, el cableado, la red LAN o WAN.\nTablas + diagrama.';

  @override
  String get aboutVideoTitle => 'Video';

  @override
  String get appTitle => 'Mi aplicación tecnológica';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name — $channels canales';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'Modo DMX ($count)';
  }

  @override
  String get catalogInfoDmxChannels => 'Canales DMX';

  @override
  String get catalogInfoLuminousFlux => 'Flujo luminoso';

  @override
  String get catalogInfoPower => 'Fuerza';

  @override
  String get catalogInfoWeight => 'Peso';

  @override
  String catalogLastUpdate(Object date) {
    return 'Última actualización: $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Fabricante ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Modelo ($count)';
  }

  @override
  String get catalogNotProvided => 'No especificado';

  @override
  String get catalogOpenDmxChart => 'Mesa abierta DMX';

  @override
  String get catalogOpenManual => 'abrir el manual';

  @override
  String get catalogResetTooltip => 'Reiniciar';

  @override
  String catalogSyncError(Object message) {
    return 'Error: $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Error de sincronización: $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Fallo de sincronización (motivo desconocido).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Tipo ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Para actualizar';

  @override
  String get catalogUpdated => 'Catálogo actualizado.';

  @override
  String get commonCalculate => 'Calcular';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonCopyResultTooltip => 'Copiar resultado';

  @override
  String get commonDash => '—';

  @override
  String get commonNone => 'Sin grabación';

  @override
  String get commonOk => 'Bueno';

  @override
  String get commonOkWithCheck => 'Está bien ✅';

  @override
  String get commonRename => 'Rebautizar';

  @override
  String get commonReset => 'Reiniciar';

  @override
  String get commonSave => 'Ahorrar';

  @override
  String get commonSearch => 'investigar';

  @override
  String get commonTooLowWithCross => 'Demasiado débil ❌';

  @override
  String get commonUnitMeter => 'metro';

  @override
  String get consentsReset => 'Restablecimiento de consentimientos.';

  @override
  String get dipSwitchAddressHint => 'Ej: 1 a 512';

  @override
  String get dipSwitchAddressLabel => 'Dirección DMX';

  @override
  String get dipSwitchChannelUnit => 'canal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Advertencia: se alcanzó el fin del universo DMX.';

  @override
  String get dipSwitchInputsTitle => 'Entrantes';

  @override
  String get dipSwitchIntervalHint => 'Ej: 4 (canales)';

  @override
  String get dipSwitchIntervalLabel => 'Intervalo';

  @override
  String get dipSwitchModeAddressDirect => 'dirección directa';

  @override
  String get dipSwitchModeAddressMinusOne => 'Dirección - 1';

  @override
  String get dipSwitchNextAddressButton => 'Siguiente dirección';

  @override
  String get dipSwitchOffLabel => 'APAGADO';

  @override
  String get dipSwitchOnLabel => 'EN';

  @override
  String get dipSwitchResetTooltip => 'Reiniciar';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Dirección: $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Dirección no proporcionada';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binario: $binary';
  }

  @override
  String get dipSwitchResultHeader => 'Resultado';

  @override
  String dipSwitchResultIntervalLine(Object end, Object start) {
    return 'Intervalo: $start → $end';
  }

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Modo: $mode';
  }

  @override
  String get dipSwitchScrollHint =>
      'Desplácese para ver todos los interruptores.';

  @override
  String get dipSwitchSectionTitle => 'interruptores';

  @override
  String get dipSwitchSummaryTitle => 'Resumen';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Cambiar $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Usar modo de dirección - 1';

  @override
  String get disclaimerAccept => 'Acepto';

  @override
  String get disclaimerCertify =>
      'Certifico que he leído y acepto estas condiciones.';

  @override
  String get disclaimerText =>
      'USO SÓLO PARA FINES INDICATIVOS\n\nLos cálculos proporcionados por esta aplicación (video, luz, láser) se dan únicamente con fines informativos e indicativos.\nNo reemplazan en ningún caso:\n- cálculos certificados,\n- estudios técnicos,\n- las normas oficiales vigentes,\n- ni validación por parte de un profesional cualificado.\n\nRESPONSABILIDAD\nEl editor de esta aplicación no se hace responsable de errores de cálculo, omisiones, daños materiales,\naccidentes personales, o cualquier incidente ocurrido durante la instalación, operación o uso del equipo.\n\nVÍDEO Y PROYECCIÓN\nLos resultados (tamaños, ratios, luminosidad, superposiciones, etc.) se basan en modelos teóricos y pueden variar en función de:\nóptica, zoom, uniformidad, entorno de luz, soporte, ajustes, etc.\nConsulta siempre con la documentación oficial del fabricante.\n\nLUZ\nLos cálculos son orientativos y no tienen en cuenta todas las condiciones reales (tolerancias, pérdidas ópticas,\ndegradación de fuentes, normas locales, condiciones ambientales, etc.).\n\nLÁSER – SEGURIDAD\nLos cálculos NOHD, SZED y CZED se basan en supuestos estándar y umbrales teóricos.\nNo tienen en cuenta en particular:\n- instrumentos ópticos (prismáticos, cámaras fotográficas, telescopios, etc.),\n- condiciones atmosféricas (niebla, lluvia, polvo, etc.),\n- reflejos imprevistos, usos desviados, escenarios específicos.\nEl uso de un sistema láser implica responsabilidad directa del operador y un análisis de riesgos adecuado.\n\nACEPTACIÓN DE RIESGOS\nAl utilizar esta aplicación, el usuario reconoce:\n- haber leído las normas de seguridad aplicables,\n- ser el único responsable de sus instalaciones,\n- asumir toda la responsabilidad por los riesgos relacionados con el uso de los equipos (vídeo, luz, láser),\n- comprobar sistemáticamente los datos con los manuales oficiales del fabricante.';

  @override
  String get disclaimerTitle => '⚠️ AVISO LEGAL Y DESCARGO DE RESPONSABILIDAD';

  @override
  String get homeLaserSubtitle =>
      'Cálculos láser y seguridad (se requiere consentimiento con cada entrada).';

  @override
  String get homeLaserTitle => 'Láser';

  @override
  String get homeLightSubtitle =>
      'Tamaño de proyección, dip-switch DMX, fotometría, catálogo, parche DMX.';

  @override
  String get homeLightTitle => 'Luz';

  @override
  String get homeReferencesSubtitle =>
      'DMX / red / vídeo: hojas informativas y referencias de campo.';

  @override
  String get homeReferencesTitle => 'Referencias';

  @override
  String get homeTitle => 'Bienvenido';

  @override
  String get homeVideoSubtitle =>
      'Lentes y medición, brillo, multiproyector, LED y patrones de prueba.';

  @override
  String get homeVideoTitle => 'Video';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Sistema (automático)';

  @override
  String get languageSystemCurrent => 'Idioma del teléfono';

  @override
  String get laserAdviceFullPower => 'Potencia máxima permitida (100%)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Potencia máxima recomendada: $percent';
  }

  @override
  String get laserConsentCheckboxLabel => 'Acepto y entiendo los riesgos.';

  @override
  String get laserConsentContinue => 'Continuar';

  @override
  String get laserConsentText =>
      'ACCESO A LA PARTE LÁSER\n\nLa parte LÁSER de esta aplicación se refiere a cálculos de seguridad (por ejemplo: NOHD, SZED, CZED).\nEstos cálculos son orientativos y no sustituyen:\n- un análisis de riesgos,\n- las normas vigentes,\n- procedimientos operativos,\n- ni validación por parte de una persona cualificada.\n\nIMPORTANTE\n- Riesgo de daño a los ojos/piel si se usa incorrectamente.\n- El cálculo puede ser incorrecto si los parámetros introducidos están incompletos, incorrectos o si el contexto real difiere (óptico,\n  condiciones atmosféricas, reflexiones, alineación, etc.).\n- El operador es el único responsable de la instalación, operación y cumplimiento.\n\nAl validar, confirmas:\n- comprender los riesgos,\n- respetar las normas de seguridad aplicables,\n- asumir toda la responsabilidad en caso de negligencia o mal uso.';

  @override
  String get laserConsentTitle => '🔴 CONSENTIMIENTO LÁSER (OBLIGATORIO)';

  @override
  String get laserDiameterHint => 'por ejemplo: 3.0';

  @override
  String get laserDiameterLabel => 'Diámetro de salida (mm)';

  @override
  String get laserDisclaimerShort =>
      'Cálculo indicativo. No sustituye a un análisis de seguridad láser.';

  @override
  String get laserDivergenceHint => 'ej: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergencia (mrad)';

  @override
  String get laserInputsTitle => 'Entrantes';

  @override
  String get laserInvalidInputs =>
      'Introduzca una potencia, divergencia y diámetro válidos.';

  @override
  String get laserNameUpdated => 'Nombre actualizado.';

  @override
  String get laserNormativeParamsBody =>
      'MPE para distancia nominal de riesgo para los ojos (NOHD): 25,4 W/m²\n(Estándar IEC 60825-1, edición 3.0)\n\nMPE para distancia de exposición de zonas sensibles (SZED): 1 W/m²\n(Estándar ANSI Z136.6)\n\nMPE para distancia de exposición de zona crítica (CZED): 0,05 W/m²\n(Estándar ANSI Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Configuración de seguridad retenida';

  @override
  String get laserPowerHint => 'ejemplo: 5000';

  @override
  String get laserPowerLabel => 'Potencia (mW)';

  @override
  String get laserPresetAdded => 'Grabación añadida.';

  @override
  String get laserPresetDeleted => 'Registro eliminado.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Nombre del proyector';

  @override
  String get laserRenameProjectorTitle => 'Cambiar el nombre del proyector';

  @override
  String get laserSafetyResultsTitle => 'Resultados de seguridad';

  @override
  String get laserSaveCurrentProjector => 'Registrar este proyector';

  @override
  String get laserSaveProjectorTitle => 'Registrar un proyector';

  @override
  String get laserSavedProjectorsTitle => 'Proyectores registrados';

  @override
  String get laserSearchHint => 'p.ej. “RGB 5W”';

  @override
  String get laserTargetDistanceHint => 'por ejemplo: 10';

  @override
  String get laserTargetDistanceLabel => 'Distancia objetivo (m)';

  @override
  String get laserZoneCzedDesc => 'Zona critica';

  @override
  String get laserZoneNohdDesc => 'Peligro para los ojos';

  @override
  String get laserZoneSzedDesc => 'zona sensible';

  @override
  String get legalNotices => 'Avisos legales';

  @override
  String get lightCatalogDescription =>
      'Selección por fabricante, tipo y producto, con información y manual.';

  @override
  String get lightCatalogTitle => 'Catálogo de iluminación';

  @override
  String get lightDisclaimerShort =>
      'Herramientas indicativas. Consulta siempre la documentación del fabricante.';

  @override
  String get lightDmxSwitchDescription =>
      'Conversión indicativa entre dirección DMX e interruptores, con navegación por intervalos.';

  @override
  String get lightDmxSwitchTitle => 'Interruptor DIP DMX';

  @override
  String get lightPatchDescription => 'Importe y vea un archivo MVR.';

  @override
  String get lightPatchTitle => 'Parche DMX';

  @override
  String get lightPhotometryDescription =>
      'Conversiones indicativas entre lux, candela y lumen, con distancia y ángulo.';

  @override
  String get lightPhotometryTitle => 'Fotometría';

  @override
  String get lightExposureMeterTitle => 'Fotómetro (lux)';

  @override
  String get lightExposureMeterDescription =>
      'Calcula la iluminancia en lux a partir de los ajustes ISO / apertura / velocidad de una cámara.';

  @override
  String get lightExposureMeterIsoLabel => 'Sensibilidad ISO';

  @override
  String get lightExposureMeterApertureLabel => 'Apertura';

  @override
  String get lightExposureMeterShutterLabel => 'Velocidad de obturación';

  @override
  String get lightExposureMeterShutterDenomLabel =>
      'Velocidad (denominador, 1/x s)';

  @override
  String get lightExposureMeterResultTitle => 'Iluminancia estimada';

  @override
  String get lightExposureMeterReferenceTitle => 'Referencia de iluminancia';

  @override
  String get lightExposureMeterRefMoonlight => 'Luz de luna';

  @override
  String get lightExposureMeterRefDimStage => 'Escenario poco iluminado';

  @override
  String get lightExposureMeterRefOffice => 'Oficina';

  @override
  String get lightExposureMeterRefOvercast => 'Día nublado (exterior)';

  @override
  String get lightExposureMeterRefFollowSpot =>
      'Seguidor / recortador en escena';

  @override
  String get lightExposureMeterRefSunlight => 'Sol directo';

  @override
  String get lightExposureMeterFormulaNote =>
      'Lux = (N² × 250 × 1/t) / ISO — método del fotómetro de luz incidente. Lee los valores en la cámara (modo manual o datos EXIF).';

  @override
  String get lightProjectionDescription =>
      'Cálculo indicativo del tamaño del spot según ángulo, distancia y diámetro.';

  @override
  String get lightProjectionTitle => 'Tamaño de proyección';

  @override
  String get menuTitle => 'Menú';

  @override
  String get homeGreetingMorning => 'Buenos días';

  @override
  String get homeGreetingAfternoon => 'Buenas tardes';

  @override
  String get homeGreetingEvening => 'Buenas noches';

  @override
  String get homeGreetingTagline =>
      'Todas tus herramientas técnicas, listas para usar.';

  @override
  String get mireBlendLabel => 'MEZCLA';

  @override
  String get mireDash => '—';

  @override
  String get mireErrInvalidOverlap => '❌ Superposición no válida (0 a 99,9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Número de proyectores no válido (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Ancho/alto (px) no válido.';

  @override
  String get mireExportPng => 'Exportar PNG';

  @override
  String get mireHeightPxHint => 'por ejemplo: 1080';

  @override
  String get mireHeightPxHintMapping => 'Ej: 2160';

  @override
  String get mireHeightPxLabel => 'Altura (píxeles)';

  @override
  String get mireLedErrTileCm => '❌ Indica cm de mosaico (ancho/alto >0).';

  @override
  String get mireLedErrTilePx => '❌ Indica px de mosaico (ancho/alto >0).';

  @override
  String get mireLedErrTilesXY => '❌ Indica mosaicos X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'Parámetros de la pared LED';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Paso calculado: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedSubtitleGridLabels => 'Cuadrícula + marcadores + círculos';

  @override
  String get mireLedSubtitlePixelPerfect => 'Píxel perfecto + círculos';

  @override
  String get mireLedSubtitleUniformity => 'Uniformidad + círculos';

  @override
  String get mireLedTileHcmLabel => 'Altura del azulejo (cm)';

  @override
  String get mireLedTileHpxLabel => 'Altura del mosaico (px)';

  @override
  String get mireLedTileWcmLabel => 'Ancho del azulejo (cm)';

  @override
  String get mireLedTileWpxLabel => 'Ancho del mosaico (px)';

  @override
  String get mireLedTilesIdTitle => 'AZULEJOS LED / ID';

  @override
  String get mireLedTilesXLabel => 'Azulejos horizontales (X)';

  @override
  String get mireLedTilesYLabel => 'Azulejos verticales (Y)';

  @override
  String get mireLedTitle => 'LED / MARCA';

  @override
  String get mireLedTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedTypeGridLabels => 'Cuadrícula + marcadores + círculos';

  @override
  String get mireLedTypePixelPerfect => 'Píxel perfecto + círculos';

  @override
  String get mireLedTypeTilesId => 'ID de mosaicos (número + colores)';

  @override
  String get mireLedTypeUniformity => 'Uniformidad + círculos';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Resolución de la pared: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Paso calculado fuera de rango (0,5–20 mm). Comprueba el mosaico cm/px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Paso X ≠ Paso Y (mosaico no homogéneo). Verifique las dimensiones cm y px.';

  @override
  String get mireMappingSectionTitle =>
      'Objetivo de mapeo de múltiples proyectores';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Superposición $percent% • $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Rampas de mezcla';

  @override
  String get mireMappingTypeCombo => 'Combo (zonas + superposición + fusión)';

  @override
  String get mireMappingTypeLabel => 'Tipo de mapeo';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonas + superposición';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientación';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String get mireOverlapHint => 'por ejemplo: 10.0';

  @override
  String get mireOverlapLabel => 'Superposición (%)';

  @override
  String mirePitchEqual(Object value) {
    return '${value}mm';
  }

  @override
  String mirePitchXY(Object x, Object y) {
    return 'X $x mm • Y $y mm';
  }

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROJO $index';
  }

  @override
  String get mireProjectorsNHint => 'Ej: 2';

  @override
  String get mireProjectorsNLabel => 'Número de proyectores (N)';

  @override
  String get mireSimpleSectionTitle => 'Prueba de pantalla sencilla';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Tablero de ajedrez + círculos';

  @override
  String get mireSimpleSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Cuadrícula + caja fuerte + 2 barras centradas + círculos';

  @override
  String get mireSimpleSubtitleGridSafe =>
      'Cuadrícula + caja fuerte + círculos';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformidad + círculos';

  @override
  String get mireSimpleTypeCheckerboard => 'Tablero de ajedrez + círculos';

  @override
  String get mireSimpleTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (cuadrícula + círculos + 2 barras centradas)';

  @override
  String get mireSimpleTypeGridSafe => 'Cuadrícula + caja fuerte + círculos';

  @override
  String get mireSimpleTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireTileMissingPx => 'Especifica mosaico (px) para la numeración.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Mosaico ${tw}x$th px • Cuadrícula $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Paso ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Paso X $px • Y $py mm';
  }

  @override
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm) {
    return 'Azulejo $wcm×$hcm cm';
  }

  @override
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Pared ~ $wm×$hm m';
  }

  @override
  String get mireTypeLabel => 'tipo de vista';

  @override
  String get mireVideoComboTitle => 'VIDEO / MARCA COMBO';

  @override
  String get mireVideoMappingSectionTitle =>
      'Objetivo de mapeo de múltiples proyectores';

  @override
  String get mireVideoMappingTitle => 'OBJETIVO DE VIDEO / MAPEO';

  @override
  String get mireVideoSimpleSectionTitle => 'Prueba de pantalla sencilla';

  @override
  String get mireVideoSimpleTitle => 'VÍDEO / PANTALLA SIMPLE';

  @override
  String get mireVideoTypeCheckerboard => 'Tablero de ajedrez + círculos';

  @override
  String get mireVideoTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoTypeCombo =>
      'Combo (cuadrícula + círculos + 2 barras centradas)';

  @override
  String get mireVideoTypeGridSafe => 'Cuadrícula + caja fuerte + círculos';

  @override
  String get mireVideoTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireWallNotMultipleOfTiles => 'PARED NO MÚLTIPLE DE AZULEJOS';

  @override
  String get mireWidthPxHint => 'ejemplo: 1920';

  @override
  String get mireWidthPxHintMapping => 'Ej: 3840';

  @override
  String get mireWidthPxLabel => 'Ancho (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Dirección: $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Canales utilizados: $count / 512';
  }

  @override
  String get patchConflictError => 'Abordar el conflicto (superposición).';

  @override
  String get patchConflictShort => 'Conflicto';

  @override
  String patchConflicts(Object count) {
    return 'Conflictos: $count';
  }

  @override
  String get patchEditChannelsLabel => 'Canales';

  @override
  String get patchEditHint => 'Comprueba el modo y el número de canales.';

  @override
  String get patchEditModeLabel => 'Moda';

  @override
  String get patchEditTitle => 'Edición';

  @override
  String get patchEmptyUniverse => 'No hay máquinas en este universo.';

  @override
  String patchFixturesCount(Object count) {
    return 'Máquinas: $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'Los resultados son indicativos. Siempre consulte con la consola.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analice un archivo MVR y cargue el parche como referencia.';

  @override
  String get patchHomeImportMvrTitle => 'Importar un MVR';

  @override
  String get patchHomeTitle => 'Parche DMX';

  @override
  String get patchHomeViewPatchDescription =>
      'Listado y conflictos por universo.';

  @override
  String get patchHomeViewPatchTitle => 'Ver parche';

  @override
  String get patchHubOpenGridButton => 'Rejilla abierta';

  @override
  String get patchHubOpenMvrButton => 'Abrir MVR';

  @override
  String get patchHubStateEmpty => 'No hay referencias cargadas.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Cargado: universo $count';
  }

  @override
  String get patchHubStateTitle => 'Estado';

  @override
  String get patchHubTitle => 'Parche central';

  @override
  String get patchHubWorksiteBody =>
      'Importa un MVR o consulta la grilla de ocupación.';

  @override
  String get patchHubWorksiteTitle => 'Sitio de construcción';

  @override
  String get patchInvalidChannelCount => 'Número de canales no válido.';

  @override
  String get patchIssueInvalidChannelCount =>
      'El número de canales debe ser mayor o igual a 1.';

  @override
  String get patchIssueInvalidStartAddress =>
      'La dirección DMX debe estar entre 1 y 512.';

  @override
  String get patchIssueInvalidUniverse =>
      'El universo debe ser mayor o igual a 1.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'El rango de canales supera los 512 en este universo.';

  @override
  String get patchIssueUnknown => 'Error desconocido.';

  @override
  String get patchListTitle => 'Lista';

  @override
  String get patchManualDisabledBody =>
      'El parche es de solo lectura cuando se carga una referencia MVR.';

  @override
  String get patchManualDisabledTitle => 'Desactivado';

  @override
  String get patchManualTitle => 'Parche manual';

  @override
  String patchModeLabel(Object mode) {
    return 'Modo: $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Análisis…';

  @override
  String get patchMvrButtonLoadAsReference => 'Cargar como referencia';

  @override
  String get patchMvrButtonPickFile => 'Elige un archivo';

  @override
  String get patchMvrClearTooltip => 'para borrar';

  @override
  String get patchMvrColAddress => 'DIRECCIÓN';

  @override
  String get patchMvrColChannels => 'Canales';

  @override
  String get patchMvrColId => 'IDENTIFICACIÓN';

  @override
  String get patchMvrColName => 'Nombre';

  @override
  String get patchMvrColUniverse => 'Universo';

  @override
  String get patchMvrColumnsHint =>
      'Columnas: ID, Nombre, Universo, Dirección, Canales';

  @override
  String get patchMvrFileCardHelp =>
      'Selecciona un archivo .mvr (ZIP) para analizar el parche.';

  @override
  String get patchMvrFileCardTitle => 'Archivo';

  @override
  String get patchMvrFilterAllUniverses => 'Todos los universos';

  @override
  String get patchMvrFilterUniverseLabel => 'Filtrar por universo';

  @override
  String get patchMvrModeNotProvided => 'Modo no especificado';

  @override
  String get patchMvrOrderAsc => 'Cuerno';

  @override
  String get patchMvrOrderDesc => 'Descendente';

  @override
  String get patchMvrOrderLabel => 'Orden';

  @override
  String get patchMvrSortAddress => 'DIRECCIÓN';

  @override
  String get patchMvrSortByLabel => 'Ordenar por';

  @override
  String get patchMvrSortChannels => 'Canales';

  @override
  String get patchMvrSortId => 'IDENTIFICACIÓN';

  @override
  String get patchMvrSortName => 'Nombre';

  @override
  String get patchMvrSortUniverse => 'Universo';

  @override
  String get patchMvrSortUniverseThenAddress => 'Universo luego dirección';

  @override
  String get patchMvrStatusCleared => 'Referencia eliminada.';

  @override
  String get patchMvrStatusEmptyBytes => 'Archivo vacío.';

  @override
  String get patchMvrStatusExtractingZip => 'Extrayendo el ZIP…';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'No se puede seleccionar el archivo: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Máquinas encontradas: $count (multicanal: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Cargando GDTF…';

  @override
  String get patchMvrStatusNoContentToLoad => 'No hay contenido para cargar.';

  @override
  String get patchMvrStatusNoFileSelected => 'No hay archivos seleccionados.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'No se encontraron máquinas explotables.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Error de análisis: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Análisis de contenido…';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Referencia cargada: $count máquina(s) (ignorada: $skipped, huellas digitales GDTF: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Restauración: $count máquinas';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml no encontrado en MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'Seleccionando el archivo…';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Archivo no compatible: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Resumen';

  @override
  String get patchMvrTitle => 'Importar MVR';

  @override
  String patchMvrUniverseItem(Object universe) {
    return 'Universo $universe';
  }

  @override
  String get patchPageTitle => 'Parche';

  @override
  String get patchSummaryTitle => 'Resumen';

  @override
  String get patchUniverseAppBarTitle => 'Parche';

  @override
  String patchUniverseConflictCount(Object count) {
    return 'Conflictos: $count canal(es)';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Limitado por el ancho de la pantalla.';

  @override
  String get patchUniverseGridTitle => 'Ocupación (1 a 512)';

  @override
  String patchUniverseItem(Object universe) {
    return 'Universo $universe';
  }

  @override
  String get patchUniverseLabel => 'Universo';

  @override
  String get patchUniverseLegendConflict => 'Conflicto';

  @override
  String get patchUniverseLegendFree => 'Gratis';

  @override
  String get patchUniverseLegendOccupied => 'Ocupado';

  @override
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start) {
    return '• $fixture\n  $mode — $channels canal(es)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Ocupado: $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universo $universe — Dirección $address\nEstado: $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Varias máquinas ocupan este canal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '…y $count otros.';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Conflicto';

  @override
  String get patchUniversePopupTitleFree => 'canal libre';

  @override
  String get patchUniversePopupTitleOccupied => 'Canal ocupado';

  @override
  String get patchUniverseReferenceNone => 'Ninguna referencia cargada';

  @override
  String get patchUniverseReferenceReadOnly => 'Sólo lectura (desde MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Referencia';

  @override
  String get patchUniverseResetConfirm => 'Reiniciar';

  @override
  String get patchUniverseResetContent =>
      'Esto borra el parche cargado desde MVR en la aplicación.\nNo se modifica ningún dato del archivo.';

  @override
  String get patchUniverseResetTitle => '¿Restablecer referencia?';

  @override
  String get patchUniverseResetTooltip => 'Restablecer referencia';

  @override
  String get patchUniverseSelected => 'Universo seleccionado';

  @override
  String get patchUniverseStateConflict => 'Conflicto';

  @override
  String get patchUniverseStateFree => 'Gratis';

  @override
  String get patchUniverseStateOccupied => 'Ocupado';

  @override
  String get patchUniverseTapHint => 'Toque un cuadro para ver el detalle.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'Universo DMX';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Universo $universe';
  }

  @override
  String get patchUniverseUniverseTitle => 'Universo';

  @override
  String get patchUniverseZoomIn => 'Agrandar';

  @override
  String get patchUniverseZoomOut => 'Reducir';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'En grados';

  @override
  String get photometryBeamAngleHint3 => 'En grados';

  @override
  String get photometryBeamAngleLabel => 'Ángulo de haz';

  @override
  String get photometryCandelaHint1 => 'Introduzca un valor en cd';

  @override
  String get photometryCandelaHint2 => 'Introduzca un valor en cd';

  @override
  String get photometryCandelaLabel => '__TECNOLOGÍA_15__';

  @override
  String get photometryDisclaimerShort =>
      'Sólo indicación. Consultar con la documentación del fabricante.';

  @override
  String get photometryDistanceHint1 => 'En metros';

  @override
  String get photometryDistanceHint3 => 'En metros';

  @override
  String get photometryDistanceLabel => 'Distancia';

  @override
  String get photometryLumensHint2 => 'Introduzca un valor en lm';

  @override
  String get photometryLumensHint3 => 'Introduzca un valor en lm';

  @override
  String get photometryLumensLabel => 'Lumens';

  @override
  String get photometryLuxHint => 'Introduzca un valor en lux';

  @override
  String get photometryLuxLabel => '__TECNOLOGÍA_13__';

  @override
  String get photometrySection1Title => 'Lux <> Candela';

  @override
  String get photometrySection2Title => 'Lumens <> Candela';

  @override
  String get photometrySection3Title => 'Lumens < Lux';

  @override
  String photometrySummary1(Object candela, Object distance, Object lux) {
    return 'A $distance m, $candela cd ≈ $lux lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'A $distance m, $lumens lm ≈ $lux lux (aprox.).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumens: $lumens lm — Distancia: $distance m — Ángulo: $angle° — Lux: $lux lx.';
  }

  @override
  String get projectionAngleHint => 'En grados';

  @override
  String get projectionAngleLabel => 'Esquina';

  @override
  String get projectionAutoHelp => 'Auto: calcula el valor faltante.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Ángulo: $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diámetro: $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Distancia: $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Ángulo: $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Diámetro: $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Distancia: $distance m';
  }

  @override
  String get projectionDiameterHint => 'En metros';

  @override
  String get projectionDiameterLabel => 'Diámetro';

  @override
  String get projectionDistanceHint => 'En metros';

  @override
  String get projectionDistanceLabel => 'Distancia';

  @override
  String get projectionHeaderAutoActive => 'Auto activo';

  @override
  String get projectionHeaderNeedTwoValues =>
      'Introduzca al menos dos valores.';

  @override
  String get projectionInputsTitle => 'Entrantes';

  @override
  String get projectionResultsTitle => 'Resultados';

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
    return 'Formato: $format\nÁrea: $area m²\nLux (lm/m²): $lux\nLux eq (ganancia): $luxEq\nLuminancia: $nits liendres | $fl pies-L\nUmbral mínimo ($presetLabel): $minFl pies-L → $status\nNota: estimación indicativa (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle => 'Lux / liendres / pies-L + umbral';

  @override
  String get videoBrightnessSubtitle => 'Lux / liendres / pies-L + umbral';

  @override
  String get videoBrightnessTitle => 'Brillo';

  @override
  String get videoCalc1ErrMissing => '❌ Datos faltantes: Distancia + Ancho.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Relación de proyección = $ratio';
  }

  @override
  String get videoCalc1Title => 'Relación (Distancia / Ancho)';

  @override
  String get videoCalc2ErrMissing => '❌ Datos faltantes: Distancia + Ratio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Ancho de imagen = $width m';
  }

  @override
  String get videoCalc2Title => 'Ancho (Distancia / Relación)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Datos faltantes: Ancho.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String get videoCalc3Title => 'Alto (Ancho + Formato)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumens/Ganancia/Ancho debe ser > 0.';

  @override
  String get videoCalc4ErrMissing =>
      '❌ Datos faltantes: Lumens + Ganancia + Ancho.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Datos faltantes: Ancho + Lumens + Ganancia.';

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
    return 'Área: $area m² (formato $format)\nLux (lm/m²): $lux\nLux eq (ganancia): $luxEq\nLuminancia: $nits liendres | $fl pies-L\nUmbral mínimo ($presetLabel): $minFl pies-L → $status\nNota: conversión de liendres/pies-L basada en una suposición lambertiana (aprox.).';
  }

  @override
  String get videoCalc4Title => 'Brillo (lux/nits/ft-L + umbral)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Datos faltantes: Ancho total + Superposición % + Número de focos.';

  @override
  String get videoCalc5ErrNMin2 => '❌ El número de proyectores debe ser ≥ 2.';

  @override
  String get videoCalc5NHint => 'Ej: 2';

  @override
  String get videoCalc5NLabel => 'Número de proyectores (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Ancho total: $wTot m\nN: $n | Superposición: $overlapPct% (en el ancho del proyecto)\n\n- Ancho por proyector: $wPer m\n- Superposición entre 2 proyectos: $overlapM m\n- Altura total (formato $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Superposición (Ancho total + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Datos faltantes: Ancho total + Distancia + % de superposición.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Datos faltantes: relación mínima y/o relación máxima.';

  @override
  String get videoCalc6GainHint => 'por ejemplo: 1.0';

  @override
  String get videoCalc6GainLabel => 'Ganancia (cálculo 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'ejemplo: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumens por proyector';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Brillo: ❌ Lumens/projo y la ganancia debe ser > 0.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Brillo estimado (N=$n)\nÁrea: $area m²\nLux eq: $lux (lm/m²)\nLiendres: $nits | pies-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Brillo (opcional): proporciona Lumens/projo + Ganancia para estimación.';

  @override
  String get videoCalc6NoteIndicative =>
      'Nota: estimación indicativa (la combinación/superposición real puede reducirse un poco).';

  @override
  String get videoCalc6RatioMaxHint => 'por ejemplo: 1,80';

  @override
  String get videoCalc6RatioMaxLabel => 'Relación máxima';

  @override
  String get videoCalc6RatioMinHint => 'por ejemplo: 1,20';

  @override
  String get videoCalc6RatioMinLabel => 'relación mínima';

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
    return 'Ancho total=$wTot m | Distancia=$distance m | Superposición=$overlapPct%\nFormato $format → Altura total=$hTot m | Área=$area m²\nRelación mínima/máxima: $ratioMin → $ratioMax\n\nRatio de casos más abiertos (min) = $nMin projos | cobertura ≈ $covMin m\n$lumiMin\n\nCaso de relación más estricta (máx.) = $nMax projos | cobertura ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'Número de faros de automóvil + brillo';

  @override
  String videoCalcLabel(Object n) {
    return 'Cálculo $n';
  }

  @override
  String get videoCalculateAll => 'Calcula todo';

  @override
  String get videoCalculationsTitle => 'Cálculos en vídeo';

  @override
  String get videoCommonParamsTitle => 'Configuraciones comunes';

  @override
  String videoCommonPillArea(Object value) {
    return 'Área: $value';
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
    return 'Altura: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Superposición: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Relación: $value';
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
  String get videoCopySummaryTooltip => 'Copiar resumen';

  @override
  String get videoDisclaimerShort =>
      'Cálculos indicativos. Consulta siempre la documentación del fabricante.';

  @override
  String get videoDistanceHint => 'por ejemplo: 12.0';

  @override
  String get videoDistanceLabel => 'Distancia de lanzamiento (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Parámetros imposibles (denom ≤ 0).';

  @override
  String get videoErrOverlapRange =>
      '❌ El % de superposición debe estar entre 0 y 99,9.';

  @override
  String get videoErrRatioGt0 => '❌ La relación debe ser > 0.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ El ancho y la distancia totales deben ser > 0.';

  @override
  String get videoErrTotalWidthGt0 => '❌ El ancho total debe ser > 0.';

  @override
  String get videoErrWidthGt0 => '❌ El ancho debe ser > 0.';

  @override
  String get videoExportPdfTooltip => 'Exportar PDF';

  @override
  String get videoFormatLabel => 'Formato (proporción)';

  @override
  String get videoGainHint => 'por ejemplo: 1.0';

  @override
  String get videoGainLabel => 'Ganar';

  @override
  String get videoImageWidthHint => 'por ejemplo: 6.0';

  @override
  String get videoImageWidthLabel => 'Ancho de imagen (m)';

  @override
  String get videoLedCalcTitle => 'Cálculo: píxeles/mosaicos';

  @override
  String get videoLedErrAllGt0 => '❌ Todos los valores deben ser > 0.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Datos faltantes: Mosaicos X/Y + Mosaico px + Mosaico cm.';

  @override
  String videoLedPitchUniform(Object value) {
    return '${value}mm';
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
    return '✅ Resolución de la pared: $wallWpx × $wallHpx px\n✅ Tamaño de pared: $wallWm × $wallHm m\nAzulejo: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nPaso calculado: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Píxeles de la pared LED según tamaño, paso, dimensión de los azulejos.';

  @override
  String get videoLedTileHcmHint => 'por ejemplo: 33,28';

  @override
  String get videoLedTileHcmLabel => 'Altura del azulejo (cm)';

  @override
  String get videoLedTileHpxHint => 'por ejemplo: 128';

  @override
  String get videoLedTileHpxLabel => 'Altura del mosaico (px)';

  @override
  String get videoLedTileWcmHint => 'por ejemplo: 33,28';

  @override
  String get videoLedTileWcmLabel => 'Ancho del azulejo (cm)';

  @override
  String get videoLedTileWpxHint => 'por ejemplo: 128';

  @override
  String get videoLedTileWpxLabel => 'Ancho del mosaico (px)';

  @override
  String get videoLedTilesXHint => 'Ej: 15';

  @override
  String get videoLedTilesXLabel => 'Azulejos horizontales (X)';

  @override
  String get videoLedTilesYHint => 'Ej: 8';

  @override
  String get videoLedTilesYLabel => 'Azulejos verticales (Y)';

  @override
  String get videoLedTitle => 'CONDUJO';

  @override
  String get videoLensMeasureSubtitle =>
      'Relación/ancho/alto (cálculos 1 al 3).';

  @override
  String get videoLensMeasureTitle => 'Lente y medición';

  @override
  String get videoLmCalc1Title => 'Relación (Distancia / Ancho)';

  @override
  String get videoLmCalc2Title => 'Ancho (Distancia / Relación)';

  @override
  String get videoLmCalc3Title => 'Alto (Ancho + Formato)';

  @override
  String get videoLmDistanceHint => 'por ejemplo: 12.0';

  @override
  String get videoLmDistanceLabel => 'Distancia de lanzamiento (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Datos faltantes: Distancia + Ratio.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Datos faltantes: Distancia + Ancho.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Datos faltantes: Ancho.';

  @override
  String get videoLmErrRatioGt0 => '❌ La relación debe ser > 0.';

  @override
  String get videoLmErrWidthGt0 => '❌ El ancho debe ser > 0.';

  @override
  String get videoLmFormatLabel => 'Formato (proporción)';

  @override
  String get videoLmImageWidthHint => 'por ejemplo: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Ancho de imagen (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Relación de proyección = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Ancho de imagen = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'por ejemplo: 1,60';

  @override
  String get videoLmThrowRatioLabel => 'Relación de lanzamiento';

  @override
  String get videoLumensHint => 'ejemplo: 20000';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Objetivos indicativos (calado, enfoque, geometría, combinación, píxel perfecto).';

  @override
  String get videoMireHeaderTitle => 'Generador de patrones';

  @override
  String get videoMireScreenLedSubtitle =>
      'Objetivo según An x Al px (píxel perfecto, uniformidad, cuadrícula).';

  @override
  String get videoMireScreenLedTitle => 'Objetivo de pantalla LED';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simple (WxH px) + Mapeo multiproyecto (N + superposición).';

  @override
  String get videoMireScreenVideoTitle => 'Prueba de pantalla de vídeo';

  @override
  String get videoMireTitle => 'Fango';

  @override
  String get videoMpCalc5Title => 'Ancho por proyector';

  @override
  String get videoMpCalc6Title =>
      'Número de proyectores (relación mínima/máxima)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Relación de casos más abiertos (min) = $n projos | cobertura ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Caso de relación más estricta (máx.) = $n projos | cobertura ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'por ejemplo: 12.0';

  @override
  String get videoMpDistanceLabel => 'Distancia de lanzamiento (m)';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Parámetros imposibles (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => '❌ Ratio no válido (debe ser > 0).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Datos faltantes: Ancho total + Superposición% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Datos faltantes: Ancho total + Distancia + % de superposición.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Datos faltantes: relación mínima y/o relación máxima.';

  @override
  String get videoMpErrNGte2 => '❌ N debe ser ≥ 2.';

  @override
  String get videoMpErrOverlapRange =>
      '❌ El % de superposición debe estar entre 0 y 99,9.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ El ancho y la distancia totales deben ser > 0.';

  @override
  String get videoMpErrWidthGt0 => '❌ El ancho total debe ser > 0.';

  @override
  String get videoMpFormatLabel => 'Formato (proporción)';

  @override
  String get videoMpGainHint => 'por ejemplo: 1.0';

  @override
  String get videoMpGainLabel => 'Ganar';

  @override
  String get videoMpLumensPerProjectorHint => 'ejemplo: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumens por proyector';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Brillo: ❌ Lumens/projo y la ganancia debe ser > 0.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Brillo estimado (N=$n)\nÁrea: $area m²\nLux ecuación: $lux\nLiendres: $nits | pies-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Brillo (opcional): ingresa Lumens/projo + Ganancia a estimar.';

  @override
  String get videoMpNoteIndicative => 'Nota: estimación indicativa.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Opcional: brillo';

  @override
  String get videoMpOverlapHint => 'por ejemplo: 10';

  @override
  String get videoMpOverlapLabel => 'Superposición (%)';

  @override
  String get videoMpProjectorCountHint => 'Ej: 2';

  @override
  String get videoMpProjectorCountLabel => 'Número de proyectores (N)';

  @override
  String get videoMpRatioMaxHint => 'por ejemplo: 1,80';

  @override
  String get videoMpRatioMaxLabel => 'Relación máxima';

  @override
  String get videoMpRatioMinHint => 'por ejemplo: 1,20';

  @override
  String get videoMpRatioMinLabel => 'relación mínima';

  @override
  String get videoMpTotalWidthHint => 'ej: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Ancho total de proyección (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Superposición + ancho/projo + número de projos (cálculos 5 y 6).';

  @override
  String get videoMultiprojectorTitle => 'multiproyector';

  @override
  String get videoOptionalBrightnessTitle => 'Opcional: brillo';

  @override
  String get videoOverlapHint => 'por ejemplo: 10';

  @override
  String get videoOverlapLabel => 'Superposición (%)';

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
  String get videoPdfCalc5N => 'N (calculado 5)';

  @override
  String get videoPdfCalc6 => 'Cálculo 6';

  @override
  String get videoPdfCalc6Gain => 'Ganancia (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lumens/projo (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Relación máxima (calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Relación mínima (calc6)';

  @override
  String get videoPdfDate => 'Fecha';

  @override
  String get videoPdfDistance => 'Distancia (m)';

  @override
  String get videoPdfFormat => 'Formato';

  @override
  String get videoPdfGain => 'Ganar';

  @override
  String get videoPdfImageWidth => 'Ancho de imagen (m)';

  @override
  String get videoPdfLumens => 'Lumens';

  @override
  String get videoPdfOverlap => 'Superposición (%)';

  @override
  String get videoPdfParams => 'Ajustes';

  @override
  String get videoPdfRatio => 'Relación';

  @override
  String get videoPdfResults => 'Resultados';

  @override
  String get videoPdfScreenPreset => 'Preajuste de pantalla';

  @override
  String get videoPdfTitle => 'Mi aplicación técnica – Exportación de vídeo';

  @override
  String get videoPdfTotalWidth => 'Ancho total (m)';

  @override
  String get videoPresetFrontGrey => 'Frontal - pantalla gris (ganancia 0,8)';

  @override
  String get videoPresetFrontGreyShort => 'Frontal - pantalla gris';

  @override
  String get videoPresetFrontHighGain =>
      'Frontal: pantalla de alta ganancia (ganancia 1,3)';

  @override
  String get videoPresetFrontHighGainShort =>
      'Frontal - pantalla de alta ganancia';

  @override
  String get videoPresetFrontWhite =>
      'Frontal: pantalla blanca mate (ganancia 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Frontal - pantalla blanca mate';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapeo - piedra oscura (ganancia 0,35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapeo - piedra oscura';

  @override
  String get videoPresetMappingGlass => 'Mapeo - ventana (ganancia 0,15)';

  @override
  String get videoPresetMappingGlassShort => 'Mapeo - ventana';

  @override
  String get videoPresetMappingLightStone =>
      'Mapeo - piedra clara (ganancia 0,6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapeo - piedra clara';

  @override
  String get videoPresetMappingMatte => 'Mapeo: pintura mate (ganancia 0,75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapeo - pintura mate';

  @override
  String get videoPresetMappingSatin =>
      'Mapeo - pintura satinada (ganancia 0,9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapeo - pintura satinada';

  @override
  String get videoPresetRearClear => 'Retro - lienzo claro (ganancia 0,9)';

  @override
  String get videoPresetRearClearShort => 'Retro - lienzo claro';

  @override
  String get videoPresetRearDiffusion =>
      'Retro - lienzo de difusión (ganancia 0,7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - lienzo de difusión';

  @override
  String get videoScreenPresetLabel => 'Pantalla / Soporte (preestablecido)';

  @override
  String get videoSummaryPillsTitle => 'Resumen (pellets)';

  @override
  String get videoTestPatternSubtitle =>
      'Creación de patrón de video para pantalla y pared LED (a realizar más adelante).';

  @override
  String get videoTestPatternTitle => 'Fango';

  @override
  String get videoThrowRatioHint => 'por ejemplo: 1,60';

  @override
  String get videoThrowRatioLabel => 'Relación de lanzamiento';

  @override
  String get videoTitle => 'Video';

  @override
  String get videoToolsTitle => 'Herramientas de vídeo';

  @override
  String get videoTotalWidthHint => 'ej: 18.0';

  @override
  String get videoTotalWidthLabel => 'Ancho total de proyección (m)';

  @override
  String get aboutArtnetTitle => '__TECNOLOGÍA_1__';

  @override
  String get aboutArtnetToc01 => '1) Art-Net — qué es y por qué';

  @override
  String get aboutArtnetToc02 => '2) Direccionamiento y universo: mapeo propio';

  @override
  String get aboutArtnetToc03 =>
      '3) Límites y rendimiento: lo que se rompe primero';

  @override
  String get aboutArtnetToc04 => '4) Nodos, divisores y RDM';

  @override
  String get aboutArtnetToc05 => '5) Solución de problemas: síntomas → causas';

  @override
  String get aboutArtnetToc06 =>
      '6) Esquemas (red/unidifusión versus transmisión)';

  @override
  String get aboutArtnetToc07 =>
      '6bis) Imágenes (activos) — RJ45/conmutador/cables';

  @override
  String get aboutArtnetToc08 => '7) Lista de verificación rápida';

  @override
  String get aboutDmxToc01 => '1) DMX, universo, direcciones: la base';

  @override
  String get aboutDmxToc02 =>
      '2) Cuadro DMX: interrupción, código de inicio, canales';

  @override
  String get aboutDmxToc03 => '3) Cableado RS-485: topología y cable';

  @override
  String get aboutDmxToc04 => '4) Terminación y divisores: evite reflejos';

  @override
  String get aboutDmxToc05 => '4bis) MDR: límites y compatibilidades';

  @override
  String get aboutDmxToc06 =>
      '5) Solución de problemas en campo: síntomas → causas';

  @override
  String get aboutDmxToc07 => '6) Art-Net — puntos de referencia de campo';

  @override
  String get aboutDmxToc08 =>
      '7) sACN / E1.31 — multidifusión, IGMP, prioridades';

  @override
  String get aboutDmxToc09 => '8) DMX frente a Art-Net frente a sACN - elija';

  @override
  String get aboutDmxToc10 => '10) Lista de verificación rápida';

  @override
  String get aboutDmxToc11 => '10) Lista de verificación rápida';

  @override
  String get aboutElectriciteTitle => 'Electricidad';

  @override
  String get aboutElectriciteToc01 => '1) Conceptos básicos (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono/Tri (qué cambia)';

  @override
  String get aboutElectriciteToc04 => '4) Mesa rápida (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Trampas de seguridad y terreno';

  @override
  String get aboutElectriciteToc06 => '6) Lista de verificación';

  @override
  String get aboutInformatiqueTitle => 'Ciencias de la Computación';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Rayo';

  @override
  String get aboutInformatiqueToc02 => '2) Almacenamiento (SATA/NVMe/SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Conexiones de vídeo (DP/HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe/GPU (puntos de referencia)';

  @override
  String get aboutInformatiqueToc05 => '5) Lista de verificación (bandeja)';

  @override
  String get aboutIpBasicsToc01 => '1) ¿Qué es una IP y para qué sirve?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) ¿Por qué 192.x / 10.x / 172.x? (direcciones privadas)';

  @override
  String get aboutIpBasicsToc03 => '3) Máscara y subredes: comprenda de verdad';

  @override
  String get aboutIpBasicsToc04 =>
      '4) DHCP, puerta de enlace, DNS: ¿quién hace qué?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Cómo se comunican dos dispositivos entre sí (LAN o fuera de LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Planes de IP simples para \"mostrar\" (ejemplos listos para copiar)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Solución de problemas: síntomas → causas (método de campo)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini ejercicios (comprobar rápidamente una máscara/red)';

  @override
  String get aboutIpBasicsToc09 => '9) Lista de verificación rápida';

  @override
  String get aboutNetworkTitle => 'Red (ES)';

  @override
  String get aboutNetworkToc01 => '1) Objetivo: red estable';

  @override
  String get aboutNetworkToc02 => '2) plan IP (simple)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (separación)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (sACN multidifusión)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi frente a cable';

  @override
  String get aboutNetworkToc06 => '6) Cambiar: lo que necesitas';

  @override
  String get aboutNetworkToc07 => '7) Esquemas';

  @override
  String get aboutNetworkToc08 => '7bis) Imágenes (activos)';

  @override
  String get aboutNetworkToc09 => '8) Lista de verificación';

  @override
  String get aboutReseauTitle => 'Red';

  @override
  String get aboutReseauToc01 =>
      '1) Conceptos básicos de red (LAN/IP/rendimiento)';

  @override
  String get aboutReseauToc02 => '2) RJ45 y categorías (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc03 => '3) PoE (fuente de alimentación de red)';

  @override
  String get aboutReseauToc04 => '4) Fibra (SM/MM) + conectores (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP/SFP+/QSFP (módulos)';

  @override
  String get aboutReseauToc06 => '6) Conmutadores (VLAN/IGMP/QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN en la red (consejo)';

  @override
  String get aboutReseauToc08 => '8) Lista de verificación';

  @override
  String get aboutSacnToc01 => '1) ¿Para qué se utiliza sACN?';

  @override
  String get aboutSacnToc02 => '2) Universo (numeración)';

  @override
  String get aboutSacnToc03 => '3) Multidifusión/Unidifusión + IGMP';

  @override
  String get aboutSacnToc04 => '4) Prioridades (multifuente)';

  @override
  String get aboutSacnToc05 => '5) Límites/rendimiento';

  @override
  String get aboutSacnToc06 => '6) RDM y sACN (proxy/según el hardware)';

  @override
  String get aboutSacnToc07 => '7) Esquemas';

  @override
  String get aboutSacnToc08 => '7bis) Imágenes (activos)';

  @override
  String get aboutSacnToc09 => '8) Lista de verificación';

  @override
  String get aboutVideoToc01 =>
      '1) Conceptos básicos de vídeo (palabras clave)';

  @override
  String get aboutVideoToc02 => '2) Resolución y FPS';

  @override
  String get aboutVideoToc03 => '3) Color (4:4:4 / 4:2:2 / 10 bits)';

  @override
  String get aboutVideoToc04 =>
      '4) Sincronización (Genlock / Código de tiempo)';

  @override
  String get aboutVideoToc05 => '5) Cables y distancias';

  @override
  String get aboutVideoToc06 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI - campo';

  @override
  String get aboutVideoToc08 => '8) NDI — cuándo / por qué / límites';

  @override
  String get aboutVideoToc09 => '9) Mapeo / LED / multiproyecto';

  @override
  String get aboutVideoToc10 => '10) Lista de verificación de campo';

  @override
  String get aboutTileDmxTitle => 'DMX — operación (simple y completa)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net — DMX sobre IP (nodos, unidifusión/difusión)';

  @override
  String get aboutTileSacnTitle =>
      'sACN / E1.31 — multidifusión, IGMP, prioridades';

  @override
  String get aboutTileIpBasicsTitle => 'Red — Bases IP/máscara/DHCP (esencial)';

  @override
  String get aboutTileReseauTitle =>
      'Red: RJ45 / Fibra / velocidades y longitudes';

  @override
  String get aboutTileNetworkTitle =>
      'Red ligera: VLAN, IGMP, Wi-Fi o cableada';

  @override
  String get aboutTileVideoTitle => 'Vídeo: SDI/NDI/IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle =>
      'Eléctrico — Schuko / P17 / potencias';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Conectores, mono/tri, tablas rápidas de kW (16A→400A), trampas de campo.';

  @override
  String get aboutTileInformatiqueTitle =>
      'Computadoras: USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Velocidades útiles, versiones, límites reales, trampas de marketing.';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get homeRiggingTitle => '__TECNOLOGÍA_18__';

  @override
  String get homeRiggingSubtitle =>
      'Bridas: ángulos y longitudes de las eslingas.';

  @override
  String get riggingTitle => '__TECNOLOGÍA_18__';

  @override
  String get riggingAngleLengthTitle => 'Ángulo de brida y longitud de eslinga';

  @override
  String get riggingSymmetryNote =>
      'Hipótesis: brida simétrica (2 hilos idénticos). Sin cálculo de carga.';

  @override
  String get riggingInputsTitle => 'Entrantes';

  @override
  String get riggingSpanLabel => 'Distancia al centro (distancia entre puntos)';

  @override
  String get riggingSpanHint => 'Ej: 2,40';

  @override
  String get riggingDropLabel => 'Flecha (caída vertical)';

  @override
  String get riggingDropHint => 'Ej: 0,60';

  @override
  String get riggingUnitMeters => 'metro';

  @override
  String get riggingResultsTitle => 'Resultados';

  @override
  String get riggingNeedPositiveValues => 'Ingrese valores > 0.';

  @override
  String get riggingLegLengthLabel => 'Longitud de una hebra';

  @override
  String get riggingAngleToHorizontalLabel =>
      'Ángulo relativo a la horizontal.';

  @override
  String get riggingAngleToVerticalLabel => 'Ángulo relativo a la vertical';

  @override
  String get riggingDisclaimerShort =>
      'Resultados indicativos. Para ser validado según su contexto y prácticas de aparejo.';

  @override
  String get riggingCalcLegDropTitle => 'Longitud + flecha → alcance';

  @override
  String get riggingCalcLegDropHelp =>
      'Eslinga simétrica (2 patas): calcula el alcance a partir de la longitud de la eslinga y el hundimiento.';

  @override
  String get riggingLegLengthInputLabel => 'Longitud de una hebra';

  @override
  String get riggingLegLengthInputHint => 'Ej: 2,50';

  @override
  String get riggingInvalidTriangle =>
      'Imposible: la longitud debe ser mayor que la flecha.';

  @override
  String get riggingCalcLegAngleTitle => 'Longitud + ángulo → alcance + flecha';

  @override
  String get riggingCalcLegAngleHelp =>
      'Eslinga simétrica (2 patas): calcula el alcance y el hundimiento a partir de la longitud y el ángulo con respecto a la horizontal.';

  @override
  String get riggingAngleHorizontalInputLabel =>
      'Ángulo relativo a la horizontal.';

  @override
  String get riggingAngleHorizontalInputHint => 'Ej: 30';

  @override
  String get riggingInvalidAngle =>
      'Ángulo no válido: entre 0° y 90° (excluido).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title =>
      'Distancia al centro + flecha → longitud y ángulos';

  @override
  String get riggingCalc1Subtitle =>
      'Brida simétrica (2 hebras idénticas). Peso mostrado (info). Sin cálculo de carga.';

  @override
  String get riggingCalc2Title =>
      'Distancia al centro + ángulo (H) → flecha y longitud';

  @override
  String get riggingCalc2Subtitle =>
      'Ángulo relativo a la horizontal. Brida simétrica. Sin cálculo de carga.';

  @override
  String get riggingCalc3Title =>
      'Distancia central + longitud → flecha y ángulos';

  @override
  String get riggingCalc3Subtitle =>
      'Longitud de una hebra conocida. Brida simétrica. Sin cálculo de carga.';

  @override
  String get riggingLegLengthHint => 'Ej: 4,70';

  @override
  String get riggingAngleHint => 'Ej: 45';

  @override
  String get riggingInvalidGeometry =>
      'Geometría imposible (longitud demasiado corta para la distancia entre centros).';

  @override
  String get riggingSchemaTitle => 'Plan';

  @override
  String get riggingSchemaCaption1 =>
      'Entradas: rango + flecha. Salidas: longitud de la eslinga + ángulos.';

  @override
  String get riggingSchemaCaption2 =>
      'Entradas: alcance + longitud del cabestrillo. Salidas: flecha + ángulos.';

  @override
  String get riggingSchemaCaption3 =>
      'Entradas: rango + ángulo (horizontal). Salidas: flecha + longitud.';

  @override
  String get riggingAngleHInputLabel => 'Ángulo (relativo a la horizontal)';

  @override
  String get riggingAngleHInputHint => 'Ej: 45';

  @override
  String get riggingDropResultLabel => 'Flecha (soltar)';

  @override
  String get riggingSchemaLabelSpan => 'Distancia al centro';

  @override
  String get riggingSchemaLabelDrop => 'Flecha';

  @override
  String get riggingSchemaLabelLeg => 'Hebra';

  @override
  String get riggingWeightLabel => 'Peso (información)';

  @override
  String get riggingUnitKg => 'kilos';

  @override
  String get riggingImpossibleGeometry =>
      'Geometría imposible: la longitud de un hilo debe ser > (distancia entre centros / 2).';

  @override
  String get riggingDisclaimerNoLoad =>
      'Peso mostrado únicamente con fines informativos. Sin cálculo de carga/voltaje. Válido según su contexto de montaje.';

  @override
  String get riggingCalcCommonSubtitle =>
      'Brida de 2 hilos. Peso mostrado (info). Sin cálculo de carga.';

  @override
  String get riggingOffCenterToggle => 'Carga descentrada';

  @override
  String get riggingOffsetLabel => 'Offset A → cargar';

  @override
  String get riggingInvalidOffset =>
      'Offset no válido: debe ser > 0 y < distancia al centro.';

  @override
  String get riggingLegLeftLabel => 'Longitud del hilo izquierdo';

  @override
  String get riggingLegRightLabel => 'Longitud del hilo recto';

  @override
  String get riggingAngleHLeftLabel => 'Ángulo H (izquierda)';

  @override
  String get riggingAngleHRightLabel => 'Ángulo H (derecha)';

  @override
  String get riggingAngleVLeftLabel => 'Ángulo V (izquierda)';

  @override
  String get riggingAngleVRightLabel => 'Ángulo V (derecha)';

  @override
  String get riggingBridleAnglesLegend => 'Ángulos';

  @override
  String get riggingIncludedAngleLabel => 'Ángulo entre hilos';

  @override
  String get riggingAngleHLeftInputLabel => 'Ángulo H (hebra izquierda)';

  @override
  String get riggingLegLeftInputLabel => 'Longitud (hebra izquierda)';

  @override
  String get riggingNeedValidValues => 'Introduzca valores positivos válidos.';

  @override
  String get photometrySection4Title => 'Lux → Lumen';

  @override
  String get photometryAreaLabel => 'Área (m²)';

  @override
  String get photometryAreaHint4 => 'Ej: 12,5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx • S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversiones';

  @override
  String get aboutArtnetConversionIntro =>
      'Herramientas de conversión útiles en torno a universos DMX, Art-Net y valores hexadecimales.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universo → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Encuentre subred + universo (red/dirección de puerto) de un universo DMX.';

  @override
  String get aboutUniverseToHexTitle => 'Universo → Hexadecimal';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Convierta un universo (1…N) en índice y valor hexadecimal.';

  @override
  String get aboutArtnetConversionNote =>
      'Nota: Las convenciones Art-Net pueden variar según las consolas (direccionamiento, base 0/1). Siempre consulte la documentación de su sistema.';

  @override
  String get elecTocCopyText => 'Copiar resumen';

  @override
  String get elecToc1 => '1) Conceptos básicos (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono/Tri (qué cambia)';

  @override
  String get elecToc4 => '4) Mesa rápida (16A → 400A)';

  @override
  String get elecToc5 => 'Conversión kVA → kW / A';

  @override
  String get elecToc6 => '6) Seguridad y trampas de campo';

  @override
  String get elecToc7 => '6) Lista de verificación';

  @override
  String get elecKvaTitle => 'Tabla kVA → kW (según cos φ)';

  @override
  String get elecKvaFormula => 'Fórmula: kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Esta tabla ofrece una estimación rápida de la potencia activa (kW) a partir de una potencia aparente (kVA).';

  @override
  String get elecKvaNote =>
      'Valores indicativos. Utilice los valores reales de cos φ cuando los conozca.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1,0)';

  @override
  String get commonTocTitle => 'Resumen';

  @override
  String get commonCopySummaryTooltip => 'Copiar resumen';

  @override
  String get aboutLightReferenceTitle => 'Referencias de iluminación';

  @override
  String get refCriTitle => 'IRC/CRI';

  @override
  String get refKelvinTitle => 'Temperatura de color (K)';

  @override
  String get refBeamFieldTitle => 'Haz/campo';

  @override
  String get refLuxTitle => 'Niveles de iluminación (lux)';

  @override
  String get refCriContent =>
      'CRI (CRI) mide la fidelidad del color. Cuanto más alto es, más naturales parecen los colores.';

  @override
  String get refKelvinContent =>
      'La temperatura del color describe el tono del blanco (de cálido a frío).';

  @override
  String get refBeamFieldContent =>
      'El Haz es el ángulo del haz principal; el Campo el ángulo donde la intensidad se vuelve débil (frontera).';

  @override
  String get refBeamLegendBeam => 'haz';

  @override
  String get refBeamLegendField => 'Campo';

  @override
  String get refLuxIntro =>
      'Referencias orientativas de iluminación según uso.';

  @override
  String get refLuxColUse => 'Usar';

  @override
  String get refLuxColLux => '__TECNOLOGÍA_13__';

  @override
  String get refLuxUseCorridor => 'Corredor/circulación';

  @override
  String get refLuxUseBackstage => 'Entre bastidores / técnico';

  @override
  String get refLuxUseMeeting => 'Sala de reuniones';

  @override
  String get refLuxUseExpo => 'Exposición/showroom';

  @override
  String get refLuxUseStageGeneral => 'Escena – general';

  @override
  String get refLuxUseStageTv => 'Escenario – TV / captura';

  @override
  String get refLuxNote =>
      'Estos valores varían según los estándares y limitaciones (cámara, contraste, atmósfera).';

  @override
  String get refLightDisclaimerShort => 'Referencias indicativas, no estándar.';

  @override
  String get refCri90 => 'Excelente (≥90)';

  @override
  String get refCri80 => 'Bueno (≈ 80)';

  @override
  String get refCriLow => 'Bajo (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Importante';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Algunas consolas usan la base 0 (Universo 0..15) y otras usan la base 1 (Universo 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Tabla del universo → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Correspondencia típica entre el universo DMX y la dirección Art-Net.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Siempre verifique la convención de su consola/nodo.';

  @override
  String get aboutUniverseToArtnetColDmx => 'Universo DMX';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Llano (hexadecimal)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Subred $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Principio';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'Un universo (1…N) se puede convertir a índice (base 0) y luego a hexadecimal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Universo → Tabla hexadecimal';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Tabla de conversión de universos DMX → índice/hexadecimal.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Bloque $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'Universo DMX';

  @override
  String get aboutUniverseToHexColIndex => 'Índice';

  @override
  String get aboutArtnetPageTitle =>
      'Art-Net — universo DMX en IP (simple y completo)';

  @override
  String get aboutArtnetTocTitle => 'Resumen';

  @override
  String get aboutArtnetTocCopyTooltip => 'Copiar marcadores';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX sobre Ethernet vía UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Escala: muchos universos a través de nodos distribuidos (DMX-out).';

  @override
  String get aboutArtnetCopyLine3 =>
      'Difusión: difusión (simple pero inundación) o unidifusión (más limpia).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Límites reales: Wi-Fi, conmutador básico, nodos de firmware, configuración de universo/mapeo.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: posible mediante \"proxy RDM\" dependiendo de los nodos (soporte de variables).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net — qué es y por qué';

  @override
  String get aboutArtnetSection2Title =>
      '2) Direccionamiento y universo: mapeo propio';

  @override
  String get aboutArtnetSection3Title =>
      '3) Límites y rendimiento: lo que se rompe primero';

  @override
  String get aboutArtnetSection4Title => '4) Nodos, divisores y RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Solución de problemas: síntomas → causas';

  @override
  String get aboutArtnetSection6Title =>
      '6) Esquemas (red/unidifusión versus transmisión)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Imágenes (activos) — RJ45/conmutador/cables';

  @override
  String get aboutArtnetSection7Title => '7) Lista de verificación rápida';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Conversión / tablas (Universo 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Universo DMX en IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'Nodos DMX-out';

  @override
  String get aboutArtnetSection1Paragraph => '\"paquetes\" en la red';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Por que es util';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Escalable: muchos universos en un único cable de red.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distribución: nodos cerca de proyectores/atenuadores → menos filas largas DMX.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Parches flexibles: cambiar un universo o mover un nodo es rápido.';

  @override
  String get aboutArtnetSection1Subtitle => 'Dos palabras para recordar';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net no reemplaza a DMX: lo transporta por IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'La estabilidad suele depender más de la red (conmutador, Wi-Fi, transmisión) que del protocolo.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universo';

  @override
  String get aboutArtnetSection2PillNodePort => 'Nodo/Puerto';

  @override
  String get aboutArtnetSection2PillMapping => 'Cartografía';

  @override
  String get aboutDmxPageTitle => 'DMX — operación (simple y completa)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 canales (ranuras) por universo, valores 0–255 (8 bits).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Temporización: 250 kbaudios, universo completo ≈ ~44 Hz (orden de magnitud).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topología: conexión en cadena (sin Y pasiva). Terminación de 120Ω en el último.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = DMX bidireccional (configuración/monitoreo) → compatibilidad del divisor/nodo para verificar.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = universo DMX transportado sobre Ethernet/IP a través de nodos.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multidifusión + prioridades (se recomienda espionaje IGMP).';

  @override
  String get aboutDmxToc1 => '1) DMX, universo, direcciones: la base';

  @override
  String get aboutDmxToc2 =>
      '2) Cuadro DMX: interrupción, código de inicio, canales';

  @override
  String get aboutDmxToc3 => '3) Cableado RS-485: topología y cable';

  @override
  String get aboutDmxToc4 => '4) Terminación y divisores: evite reflejos';

  @override
  String get aboutDmxToc4bis => '4bis) MDR: límites y compatibilidades';

  @override
  String get aboutDmxToc5 =>
      '5) Solución de problemas en campo: síntomas → causas';

  @override
  String get aboutDmxToc6 => '6) Art-Net — puntos de referencia de campo';

  @override
  String get aboutDmxToc7 =>
      '7) sACN / E1.31 — multidifusión, IGMP, prioridades';

  @override
  String get aboutDmxToc8 => '8) DMX frente a Art-Net frente a sACN - elija';

  @override
  String get aboutDmxToc9 => '9) Diagramas de campo (DMX / IP / pinout)';

  @override
  String get aboutDmxChecklistCopyTitle =>
      'DMX — Lista de verificación de campo';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN — Lista de verificación de campo';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Modo de dispositivo correcto (número de canales)';

  @override
  String get aboutDmxChecklistCopyB2 =>
      'Dirección DMX correcta (sin superposición)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Conexión en cadena (sin Y pasiva)';

  @override
  String get aboutDmxChecklistCopyB4 =>
      'Terminación de 120Ω en el último dispositivo';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'Cable DMX/RS-485 (par trenzado de 120Ω) si es posible';

  @override
  String get aboutDmxChecklistCopyB6 => 'Opto dividido si hay varias ramas.';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Mantenga DMX alejado de fuentes parásitas (fuentes de alimentación, atenuadores) si es posible';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Si es RDM: verifique la compatibilidad del divisor/nodo + cableado impecable';

  @override
  String get aboutDmxChecklistCopyB9 => 'Red dedicada si es posible (o VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Interruptor correcto; Se recomienda espionaje IGMP (sACN multidifusión)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (a menudo) o multicast controlado (evite inundaciones)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Mapeo del universo ↔ puertos/nodo verificado';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Borrar plan de IP (direcciones, máscara, DHCP vs estático)';

  @override
  String get aboutDmxS1Title => '1) DMX, universo, direcciones: la base';

  @override
  String get aboutDmxS1Pill1 => '1 universo = 512 espacios';

  @override
  String get aboutDmxS1Pill2 => '0–255 (8 bits)';

  @override
  String get aboutDmxS1Pill3 => '16 bits = 2 canales';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 es un protocolo de control muy utilizado en el mundo del espectáculo (iluminación, efectos, atenuadores). Es un flujo serie (RS-485) que envía una \"trama\" en bucle que contiene hasta 512 valores. Cada valor = un canal (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'Para recordar';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 universo DMX = 512 canales (ranuras) numerados 1→512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'Un dispositivo escucha una dirección de inicio (por ejemplo, 101) y consume N canales (en función de su modo).';

  @override
  String get aboutDmxS1RememberB3 =>
      'El controlador envía todo continuamente: si dejas de transmitir, los dispositivos se \"congelan\" (o pasan a modo fallback).';

  @override
  String get aboutDmxS4bisTitle => '4bis) MDR: límites y compatibilidades';

  @override
  String get aboutDmxS4bisPlaceholder =>
      '... (mantenga su contenido existente)';

  @override
  String get aboutDmxS9Title => '9) Diagramas de campo (DMX / IP / pinout)';

  @override
  String get aboutDmxS9Diagram1 => 'Sincronización DMX (descanso/MAB/slots)';

  @override
  String get aboutDmxS9Diagram2 => 'Topología DMX: conexión en cadena';

  @override
  String get aboutDmxS9Diagram3 => 'terminación de 120Ω';

  @override
  String get aboutDmxS9Diagram4 =>
      'sACN multidifusión: devolución de llamada IGMP (red)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → nodos → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Distribución de pines XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Lista de verificación rápida';

  @override
  String get aboutDmxS10CopyTooltip => 'Copiar lista de verificación';

  @override
  String get aboutDmxS10CalloutTitle => 'Antes de que entres en pánico';

  @override
  String get aboutDmxS10B1 =>
      'Modo del dispositivo + dirección DMX (verificar siempre).';

  @override
  String get aboutDmxS10B2 =>
      'Cadena corta con cable \"OK conocido\" para aislar.';

  @override
  String get aboutDmxS10B3 => 'Conexión en cadena (sin Y pasiva).';

  @override
  String get aboutDmxS10B4 =>
      'Terminación de 120 Ω solo en el último dispositivo.';

  @override
  String get aboutDmxS10B5 => 'Opto divisor si hay varias ramas.';

  @override
  String get aboutDmxS10B6 =>
      'Si RDM: divisor/nodo compatible + cableado impecable.';

  @override
  String get aboutDmxS10B7 =>
      'En IP (Art-Net/sACN): interruptor correcto, IGMP para sACN multidifusión, unidifusión en caso de duda.';

  @override
  String get aboutDmxFooterNote =>
      'Información indicativa (terreno). Los comportamientos exactos pueden variar según las consolas, nodos, conmutadores y firmware.\nObjetivo aquí: comprender y solucionar problemas rápidamente, con un método confiable.';

  @override
  String get aboutDmxPainterBreak => 'ROMPER';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Empezar\ncódigo';

  @override
  String get aboutDmxPainterSlots => 'Ranuras 1…N\n(hasta 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Bucle (actualizar): universo completo ≈ ~44 Hz (orden de magnitud)';

  @override
  String get aboutDmxPainterSourceA => 'FUENTE A\n(prioridad 100)';

  @override
  String get aboutDmxPainterSourceB => 'FUENTE B\n(antes 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'CAMBIAR\nEspionaje IGMP';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTIDIFUSIÓN\nUniverso U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Sin IGMP: inundación\nCon IGMP: sólo puertos de abonado';

  @override
  String get aboutDmxPainterConsole => 'CONSOLA';

  @override
  String get aboutDmxPainterFix1 => 'ARREGLAR 1';

  @override
  String get aboutDmxPainterFix2 => 'ARREGLAR 2';

  @override
  String get aboutDmxPainterFix3 => 'ARREGLAR 3';

  @override
  String get aboutElectricitePageTitle => 'Eléctrica: referencias de campo';

  @override
  String get elecSection1Title => '1) Conceptos básicos (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 fórmulas útiles';

  @override
  String get elecSection1Formula1 => 'P(W) = U(V) × I(A)';

  @override
  String get elecSection1Formula2 => 'I(A) = P(W)/U(V)';

  @override
  String get elecSection1Formula3 => 'P(kW) = P(W)/1000';

  @override
  String get elecSection1FieldMarksTitle => 'Puntos de referencia de campo';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V: 16A ≈ 3,7kW | 32A ≈ 7,4kW | 63A ≈ 14,5 kilovatios';

  @override
  String get elecSection1FieldMark2 =>
      'Tri 400V: 16A ≈ 11 kW | 32A ≈ 22kW | 63A ≈ 44 kilovatios';

  @override
  String get elecSection2Title => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (enchufes domésticos)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Normalmente 16 A máx. (≈ 3,7 kW a 230 V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Tenga cuidado con múltiples enchufes y alargadores: posible sobrecalentamiento.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (azul/rojo)';

  @override
  String get elecSection2P17Bullet1 =>
      'Azul: 230V mono (camping, distribución pequeña).';

  @override
  String get elecSection2P17Bullet2 =>
      'Rojo: 400V tri (distro, altas potencias).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (audio/iluminación)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = más “campo” (bloqueo, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Revisar sección de cables y protecciones.';

  @override
  String get elecSection3Title => '3) Mono/Tri (qué cambia)';

  @override
  String get elecSection3Paragraph =>
      'Mono = monofásico + neutro (230V). Tri = 3 fases (400V entre fases).';

  @override
  String get elecSection3PitfallsTitle => 'Errores comunes';

  @override
  String get elecSection3Pitfall1 =>
      'Desequilibrio de fases (sobrecarga de una fase).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutro que se calienta en caso de grandes armónicos (LED, atenuadores).';

  @override
  String get elecSection3Pitfall3 =>
      'Terrenos ausentes/dudosos en algunos sitios.';

  @override
  String get elecSection3MethodTitle => 'método sencillo';

  @override
  String get elecSection3MethodBullet1 =>
      'Distribuya grandes cargas en L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Monitoree neutral si hay muchos LED.';

  @override
  String get elecSection3MethodBullet3 =>
      'Mida con una abrazadera si es posible.';

  @override
  String get elecSection4Title => '4) Mesa rápida (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Mono 230V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3,7 kilovatios\n32A ≈ 7,4 kilovatios\n63A ≈ 14,5 kilovatios\n125A ≈ 28,8 kilovatios\n200A ≈ 46 kilovatios';

  @override
  String get elecSection4TriTitle => 'Tri 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16A ≈ 11 kilovatios\n32A ≈ 22 kilovatios\n63A ≈ 44 kilovatios\n125A ≈ 86 kilovatios\n200A ≈ 138 kilovatios\n400A ≈ 277 kilovatios';

  @override
  String get elecSection4ImportantTitle => 'Importante';

  @override
  String get elecSection4ImportantBullet1 =>
      'Estos son órdenes de magnitud (cosφ, armónicos, pérdidas).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Validar siempre protecciones + tramos + temperatura.';

  @override
  String get elecSection5Title => '6) Seguridad y trampas de campo';

  @override
  String get elecSection5DontDoTitle => 'que no hacer';

  @override
  String get elecSection5DontDoBullet1 =>
      'Encadenador de enchufes múltiples/cables de extensión a granel.';

  @override
  String get elecSection5DontDoBullet2 => 'Mezclando fases sin saberlo.';

  @override
  String get elecSection5DontDoBullet3 => '“Bridger” una tierra dudosa.';

  @override
  String get elecSection5WarningTitle => 'Señales de advertencia';

  @override
  String get elecSection5WarningBullet1 =>
      'Olor caliente, disparos tibios, disparos repetidos.';

  @override
  String get elecSection5WarningBullet2 =>
      'Caída de tensión (caída de tensión).';

  @override
  String get elecSection5WarningBullet3 => 'Disyuntor “cansado” o inadecuado.';

  @override
  String get elecSection6Title => '6) Lista de verificación';

  @override
  String get elecSection6QuickTitle => 'Rápido';

  @override
  String get elecSection6Bullet1 =>
      'Tipo de fuente de alimentación disponible (mono/tri) + calibre (A).';

  @override
  String get elecSection6Bullet2 =>
      'Distribución de fases (cargas principales).';

  @override
  String get elecSection6Bullet3 =>
      'Protecciones (diff/disj) y estado de la tabla.';

  @override
  String get elecSection6Bullet4 =>
      'Cables: sección/longitud/aumento de temperatura.';

  @override
  String get elecSection6Bullet5 =>
      'Tierra: ¿Está bien? (probador si es posible).';

  @override
  String get elecFooterNote =>
      'Nota: este contenido es una ayuda para la memoria de campo. En un sitio real, siempre se respetan las normas, las normativas del lugar y las protecciones vigentes.';

  @override
  String get infoPageTitle => 'TI: puntos de referencia sobre el terreno';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Rayo';

  @override
  String get infoStorageTitle => '2) Almacenamiento (SATA/NVMe/SSD)';

  @override
  String get infoVideoLinksTitle => '3) Conexiones de vídeo (DP/HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe/GPU (puntos de referencia)';

  @override
  String get infoChecklistTitle => '5) Lista de verificación (bandeja)';

  @override
  String get infoSummaryCopy =>
      'INFORMACIÓN — marcadores de campo\n• USB-C = forma, no velocidad: consulte el estándar.\n• NVMe (M.2) mucho más rápido que SATA.\n• DisplayPort/HDMI = estándares, atención a versiones/cables.\n• En servidores de vídeo: almacenamiento + GPU + rendimiento son la base.';

  @override
  String get infoChecklistCopy =>
      'INFORMACIÓN — Lista de verificación\n☐ Cables USB-C certificados (datos/vídeo si es necesario)\n☐ Almacenamiento adaptado (NVMe si hay un flujo grande)\n☐ Controladores de GPU estables (versión conocida)\n☐ Prueba de resolución real/FPS\n☐ Evite adaptadores baratos';

  @override
  String get infoUsbCriticalTitle => 'Punto crítico';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = conector (forma). No dice velocidad.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Un cable USB-C puede ser \"solo de carga\" y no transmitir datos/vídeo.';

  @override
  String get infoUsbSpeedTitle =>
      'Puntos de referencia de velocidad (orden de magnitud)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: lento (teclados, dongles, dispositivos pequeños).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x: mucho más rápido (discos, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4/Thunderbolt: muy alta velocidad (dock, eGPU, vídeo según hardware).';

  @override
  String get infoUsbParagraph =>
      'En espectáculo: si un dispositivo \"va mal\", sospeche del cable (calidad/estándar) antes que del dispositivo.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA frente a NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SSD SATA: bueno y estable, pero limitado (interfaz antigua).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'NVMe SSD (M.2): mucho más rápido (ideal para servidores multimedia, archivos grandes).';

  @override
  String get infoStorageFieldTitle => 'Vídeo terreno';

  @override
  String get infoStorageFieldBullet1 =>
      'Reproducción de archivos grandes 4K/ProRes → Se recomienda NVMe.';

  @override
  String get infoStorageFieldBullet2 =>
      'Tenga cuidado con la temperatura: una NVMe puede acelerarse (reducir la velocidad) si se calienta.';

  @override
  String get infoStorageFieldBullet3 =>
      'Pruebe siempre en condiciones reales antes del espectáculo.';

  @override
  String get infoVideoLinksImportantTitle => 'Hito importante';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Las versiones cuentan: cable + puerto + dispositivo deben ser compatibles.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Larga distancia = a menudo se requieren convertidores activos/de fibra.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs HDMI (muy simplificado)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: omnipresente (TV, procesadores), pero EDID/HDCP puede interponerse.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: PC muy común, a menudo muy “capaz” de rendimiento.';

  @override
  String get infoPcieGpuParagraph =>
      'Para servidores de vídeo/mapeos: GPU + bus + controladores = estabilidad. Problemas típicos: controladores, cables, conversión y limitaciones de salida.';

  @override
  String get infoPcieGpuFieldTitle => 'Suelo';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Bloquee una versión estable del controlador antes de un gran espectáculo.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Evite los adaptadores \"baratos\".';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Pruebe con la resolución/FPS real del programa.';

  @override
  String get infoChecklistQuickTitle => 'Rápido';

  @override
  String get infoChecklistBullet1 => 'Cable/estándar correcto.';

  @override
  String get infoChecklistBullet2 => 'Almacenamiento adaptado al flujo.';

  @override
  String get infoChecklistBullet3 => 'Conductores estables.';

  @override
  String get infoChecklistBullet4 => 'Prueba real antes del espectáculo.';

  @override
  String get infoChecklistBullet5 => 'Evite los adaptadores baratos.';

  @override
  String get infoFooterNote =>
      'Información indicativa (terreno). Las capacidades exactas varían según el hardware/las versiones.\nObjetivo: benchmarks simples + método confiable.';

  @override
  String get ipBasicsPageTitle => 'Red — Bases IP/máscara/DHCP (esencial)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Copiar nota';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Copiar lista de verificación';

  @override
  String get ipBasicsMemo1 =>
      'IP = dirección lógica para llegar a un dispositivo en una red.';

  @override
  String get ipBasicsMemo2 =>
      'Privado (LAN): 10.x.x.x, 172.16–31.x.x, 192.168.x.x (no enrutado a través de Internet).';

  @override
  String get ipBasicsMemo3 =>
      'Máscara/subred = dice qué parte es \"red\" frente a \"máquina\".';

  @override
  String get ipBasicsMemo4 =>
      'Misma subred = comunicación directa. De lo contrario → puerta de enlace (enrutador).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP asigna IP automáticamente; estático = útil para nodos/consola.';

  @override
  String get ipBasicsToc1 => '1) ¿Qué es una IP y para qué sirve?';

  @override
  String get ipBasicsToc2 =>
      '2) ¿Por qué 192.x / 10.x / 172.x? (direcciones privadas)';

  @override
  String get ipBasicsToc3 => '3) Máscara y subredes: comprenda de verdad';

  @override
  String get ipBasicsToc4 => '4) DHCP, puerta de enlace, DNS: ¿quién hace qué?';

  @override
  String get ipBasicsToc5 =>
      '5) Cómo se comunican dos dispositivos entre sí (LAN o fuera de LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Planes de IP simples para \"mostrar\" (ejemplos listos para copiar)';

  @override
  String get ipBasicsToc7 =>
      '7) Solución de problemas: síntomas → causas (método de campo)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini ejercicios (comprobar rápidamente una máscara/red)';

  @override
  String get ipBasicsToc9 => '9) Lista de verificación rápida';

  @override
  String get ipBasicsSection1Paragraph =>
      'Una dirección IP (IPv4) es un identificador lógico en una red. Te permite decir: “enviar este paquete a este dispositivo”.\n\nCuando conectas una consola, un nodo Art-Net/sACN, una PC, un switch administrado... todo lo que habla en la red debe tener una IP consistente para que los dispositivos se encuentren entre sí.';

  @override
  String get ipBasicsSection1CalloutTitle => 'imagen mental';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = identificador de hardware (tarjeta de red).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = dirección “postal” en una red (modificable).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Máscara = \"distrito/código postal\" (delimita la subred).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Puerta de enlace = “salida del vecindario” (enrutador).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 en 10 segundos';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Formato: A.B.C.D (4 ​​números del 0 al 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Ej: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'No es mágico: son 32 bits (4 bytes).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'Lo que te importa: La máscara IP + debe ser consistente entre dispositivos.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Ciertos rangos de direcciones IPv4 están reservados para redes privadas (LAN). No se enrutan a través de Internet. Por eso los usamos en los shows: puedes crear tu red local sin \"consumir\" IP públicas.';

  @override
  String get ipBasicsSection2CalloutTitle =>
      'Las 3 grandes playas privadas (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (a menudo escrito \"10.x.x.x\")';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (a menudo \"172.16–31.x.x\")';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (a menudo \"192.168.x.x\")';

  @override
  String get ipBasicsSection2Subtitle1 =>
      '¿Por qué vemos a menudo 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Las cajas/enrutadores de consumo suelen utilizar 192.168.0.x o 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'Se ha convertido en un \"estándar de facto\" en las LAN pequeñas.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Pero en el programa, 10.x.x.x es útil si desea muchas direcciones o varias VLAN.';

  @override
  String get ipBasicsSection2Subtitle2 => '¿Y el famoso 2.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Muchos hardware Art-Net salen de fábrica con una IP 2.x.x.x (red cerrada).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'Es \"práctico\" en plug&play (sin DHCP), pero sorprende si tu PC está en 192.168.x.x.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Importante: \"2.x\" no es mágico para transmisión/unidifusión.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'Lo que cambia el alcance de la transmisión es la máscara (a menudo /8 = 255.0.0.0 en versión heredada).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Ejemplo: red 2.0.0.0/8 → transmisión = 2.255.255.255 (muy amplia).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Solución simple: poner PC/consola en el mismo rango + misma máscara, o reconfigurar el nodo en un plan 192/10.';

  @override
  String get ipBasicsSection3Paragraph =>
      'La máscara de subred indica qué direcciones están \"en la misma red\". Sin máscara, una IP no significa mucho.\n\nRegla de campo: si dos dispositivos están en la misma subred, se comunican directamente entre sí. De lo contrario, necesitan una puerta de enlace (enrutador).';

  @override
  String get ipBasicsSection3Callout1Title => 'Máscaras más comunes';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 ) → red típica “ancha” 10.x.x.x';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → red 10.10.x.x o 192.168.x.x \"ancho\"';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → 192.168.0.x red “clásica” (254 dispositivos)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Máscara → dirección de transmisión (muy útil de entender)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'La transmisión depende de la subred y, por tanto, de la máscara (no \"2 vs 192\").';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → transmisión = 192.168.10.255 (red pequeña).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → transmisión = 2.255.255.255 (red enorme).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Cuanto más “grande” sea la red, más ruido puede hacer una transmisión (si la usa con frecuencia).';

  @override
  String get ipBasicsSection3Subtitle1 => 'Ejemplo concreto (más útil): /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP: 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Máscara : 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Red: 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Dispositivos \"en la misma red\": 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'Si cambias a 192.168.1.50 → NO es la misma red.';

  @override
  String get ipBasicsSection3Subtitle2 => '¿Por qué hacer subredes?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organización: “luz”, “vídeo”, “intercomunicador”, “internet”…';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Rendimiento: limita el ruido (difusión/multidifusión) a un grupo.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Seguridad: evita que una PC \"invitada\" vea o interrumpa la red del espectáculo.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnóstico: más fácil saber “dónde” está un dispositivo.';

  @override
  String get ipBasicsSection3Callout3Title => 'Trampa clásica';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Mismo \"inicio\" de IP ≠ misma red si la máscara no es idéntica.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Ej: 10.0.0.5/8 y 10.0.0.200/24 ​​→ no son el mismo perímetro lógico.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (asignación automática)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Un servidor DHCP \"da\": IP + máscara + puerta de enlace + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 => 'Práctico: lo enchufas y funciona.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Mostrar riesgo: si DHCP cae/cambia/conflicto → síntomas extraños.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Estática (IP fija)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'Usted define IP + máscara (y posiblemente puerta de enlace/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Muy útil para: consola, nodos, switch administrado, show AP Wi-Fi.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Riesgo: IP duplicada si el plan no está claro (conflicto).';

  @override
  String get ipBasicsSection4Callout1Title => 'Puerta';

  @override
  String get ipBasicsSection4Bullet1 =>
      'Esta es la dirección del enrutador: se utiliza para salir “fuera de la red local”.';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Si crea una red de espectáculos aislada (sin Internet) → puerta de enlace a menudo es inútil.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Pero si quieres salir a otra VLAN/Internet → imprescindible.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = \"directorio\": transforma un nombre (p. ej.: ejemplo.com) en una IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'En show (Art-Net/sACN), a menudo inútil: trabajas en IP directa.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Si utiliza servicios (ACTUALIZACIÓN, licencias, servidor de tiempo, streaming) → DNS vuelve a ser útil.';

  @override
  String get ipBasicsSection4Subtitle3 =>
      'Regla simple (apto para principiantes)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Pequeño espectáculo cerrado: estático en todas partes, sin puerta de enlace, sin DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Mostrar con Internet / múltiples redes: DHCP controlado + reservas DHCP, o plan estático + enrutador.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Cuando A quiere hablar con B, mira la máscara:\n• Si B está en la misma subred → A envía directamente a la red local.\n• Si B está fuera de la subred → A envía a la puerta de enlace (enrutador), que se encarga del resto.';

  @override
  String get ipBasicsSection5Callout1Title => 'Ejemplo (fácil)';

  @override
  String get ipBasicsSection5Bullet1 => 'Un = 192.168.0.10/24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → misma red → OK directo.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → red diferente → necesita enrutador/puerta de enlace.';

  @override
  String get ipBasicsSection5Subtitle => '¿Por qué no hace ping?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Máscara diferente → A piensa que B está “en otra parte” (o viceversa).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Sin puerta de enlace → no se puede salir de la subred.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'Firewall de PC → ping bloqueado (Windows es muy común).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Cable/switch/VLAN: físicamente no en el mismo segmento.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Transmisión versus unidifusión (bonificación útil)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast: a una IP específica (propia).';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Transmisión: \"a todos\" en la subred (ruidoso).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'En el show: la transmisión puede funcionar a pequeña escala, pero rápidamente se convierte en una fuente de ruido en una red grande.';

  @override
  String get ipBasicsSection6Subtitle1 => 'Plan A: ultra simple (una red/24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Red: 192.168.10.0/24 (máscara 255.255.255.0)\n\nConsola: 192.168.10.10\nPC (control): 192.168.10.20\nNodo 1: 192.168.10.101\nNodo 2: 192.168.10.102\nConmutador administrado: 192.168.10.2\nPuerta de enlace: (vacía) o 192.168.10.1 si el enrutador está presente';

  @override
  String get ipBasicsSection6Callout1Title => '¿Por qué funciona bien?';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Todos en la misma subred → sin sorpresas.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Fácil de explicar, fácil de solucionar.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Ideal para principiantes/espectáculo pequeño a mediano.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plan B: “10.x” cuando quieras crecer';

  @override
  String get ipBasicsSection6Code2 =>
      'Red: 10.10.0.0/16 (máscara 255.255.0.0)\n\nConsola: 10.10.0.10\nPC: 10.10.0.20\nNodos: 10.10.1.10 → 10.10.1.200\nCambiar: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Cuando usarlo';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Cuando tienes mucho equipo (o varias zonas).';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Cuando planifique VLAN más tarde (luz/video/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C: compatibilidad Art-Net \"2.x.x.x\" (heredado)';

  @override
  String get ipBasicsSection6Code3 =>
      'Red: 2.0.0.0/8 (máscara 255.0.0.0)\n\nPC/consola: 2.0.0.10\nNodo 1: 2.0.0.100\nNodo 2: 2.0.0.101\n\n⚠️ Red aislada, sin internet, sin enrutamiento.';

  @override
  String get ipBasicsSection6Callout3Title => 'Atención';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Este plan es práctico para hardware antiguo o predeterminado.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Pero evite mezclar con una LAN \"normal\" (192.168.x.x) sin enrutador.';

  @override
  String get ipBasicsSection7Callout1Title => 'Síntomas → causas probables';

  @override
  String get ipBasicsSection7Bullet1 =>
      '“Veo el nodo pero no responde” → máscara/VLAN/firewall diferente.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '“Un dispositivo funciona y luego desaparece” → Conflicto DHCP/IP inestable.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '“Nada funciona excepto en el conmutador” → IP no en la misma red/cable incorrecto/puerto VLAN.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '“Todas las filas/pérdidas” → transmisión/multidifusión demasiado amplia/conmutador de gama baja/bucle de red.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '“Funciona con cable pero no con Wi-Fi” → jitter/roaming/banda saturada/ahorro de energía.';

  @override
  String get ipBasicsSection7Subtitle => 'Método profesional en 5 minutos';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Mire IP + consola/PC y máscara de nodo.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Verificar: ¿misma subred? (ejemplo: 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (si es posible) + prueba de acceso a la interfaz web del nodo.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Si es DHCP: indique quién tiene qué IP (tabla DHCP) y compruebe si hay duplicados.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Si sACN es multidifusión: verifique el espionaje/consulta IGMP (de lo contrario, inundación).';

  @override
  String get ipBasicsSection7Callout2Title => 'Trampa muy común';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Máscara \"heredada\" en una PC (255.255.0.0 en lugar de 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Resultado: cree que está \"en la misma red\", pero no como el otro dispositivo.';

  @override
  String get ipBasicsSection8Subtitle1 => 'Ejercicio 1: ¿misma red o no? (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'A = 192.168.10.50/24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ misma red';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ no es la misma red';

  @override
  String get ipBasicsSection8Subtitle2 => 'Ejercicio 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10/16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ misma red (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ no es la misma red';

  @override
  String get ipBasicsSection8CalloutTitle => 'consejo visual';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → los primeros 3 números idénticos (A.B.C) = misma red.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → los 2 primeros números idénticos (A.B) = misma red.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → el 1er número idéntico (A) = misma red.';

  @override
  String get ipBasicsSection8Subtitle3 => 'Ejercicio 3: Evite las IP “raras”';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x: Reservado (no es una IP de host normal).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x: loopback (su propia PC).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x: IP automática cuando no hay DHCP (APIPA) → señal de problema de DHCP.';

  @override
  String get ipBasicsSection9CalloutTitle =>
      'Antes de buscar desde el mediodía hasta las 2 p.m.';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Misma subred = IP consistente + máscara.';

  @override
  String get ipBasicsSection9Bullet2 => 'Sin IP duplicadas (conflicto).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK si está dominado; de lo contrario, plan estático claro.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'Firewall de PC: puede bloquear ping/descubrimiento.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: buen puerto, buena VLAN, sin loopback.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN multidifusión: se recomienda espionaje/consulta IGMP.';

  @override
  String get ipBasicsChecklistCopy =>
      'Red: lista de verificación rápida (IP)\n☐ Todos los dispositivos están en la misma subred (IP + máscara consistentes)\n☐ No IP duplicada (conflicto)\n☐ DHCP: todos en DHCP o un plan estático claro (evite mezclas borrosas)\n☐ Para Art-Net/sACN: red dedicada o VLAN si es posible\n☐ Conmutador administrado si es multidifusión/IGMP (sACN)\n☐ Wi-Fi: evite mostrar datos críticos (jitter), prefiera cableado\n☐ Prueba simple: ping + verificar máscara/puerta de enlace';

  @override
  String get ipBasicsFooterNote =>
      'Objetivo: entender lo suficiente para conectar/configurar/solucionar problemas rápidamente en el programa.\nLos detalles de la red pueden ser más profundos, pero estos conceptos básicos cubren el 90% de las fallas de campo.';

  @override
  String get aboutDmxPainterTerm120 => 'PLAZO\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote =>
      '✅ Cadena de margaritas\n❌ Sin Y pasiva';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) — señal rápida';

  @override
  String get aboutDmxPainterPin1 => 'Pin 1: Escudo / masa';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2: Datos-';

  @override
  String get aboutDmxPainterPin3 => 'Pin 3: Datos+';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5: “datos 2” (raro/opcional)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'En la práctica: XLR3 de uso frecuente (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'ÚLTIMO\nDISPOSITIVO';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Terminación = 120Ω al final de la línea';

  @override
  String get aboutDmxPainter120Between => '120Ω\nentre\nDatos- y Datos+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ Sólo un final\n❌ No en el medio\n❌ No en todas las sucursales';

  @override
  String get aboutDmxPainterConsoleIp =>
      'CONSOLA\n__TECNOLOGÍA_1__ / __TECNOLOGÍA_2__';

  @override
  String get aboutDmxPainterSwitchSacn => 'CAMBIAR\n(IGMP para sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NODO 1\nDMX FUERA';

  @override
  String get aboutDmxPainterNode2 => 'NODO 2\nDMX FUERA';

  @override
  String get aboutDmxPainterFix => 'ARREGLAR';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Muchos universos\n✅ Nodos cercanos a las máquinas';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Tu objetivo: que cada universo emitido por la fuente llegue al nodo correcto (y al puerto correcto DMX) sin ambigüedad. La mayoría de las fallas de Art-Net = universo incorrecto, subred/red incorrecta o transmisión saturada.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Método sencillo (que evita el 80% de los errores)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Escriba en un papel: “Universo 1 → Nodo A puerto 1”, “Universo 2 → Nodo A puerto 2”, etc.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Establecer IP estables (DHCP reservado o estático).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Prefiera unidifusión si tiene más de un nodo o una red compartida.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Transmisión versus unidifusión';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Transmisión: envías a todos → fácil pero puede “inundar” un interruptor.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: envías a la IP del nodo → más limpio y predecible.';

  @override
  String get aboutArtnetSection2SubBullet3 =>
      'En show: en caso de duda → unidifusión.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universo: práctica de campo';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Mantenga la numeración simple (por ejemplo: 1…N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Evite “un universo en todas partes”: documente sus asignaciones.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'En ciertas configuraciones, existe \"Red/Subred/Universo\": piense en \"mapeo\", no en \"magia\".';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'Los límites “reales” (en orden)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi: latencia variable + pérdidas → parpadeos o interrupciones.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast: sobrecarga una LAN (todos reciben todo).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Conmutador de “gama baja”: buffers limitados, mala gestión de multidifusión/difusión.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Nodos: límite de firmware/CPU (número de universos, frecuencia, opciones).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/fuente: controlador, carga de CPU, antivirus, tarjeta de red, etc.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Actualizar velocidad';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      'El DMX \"clásico\" suele tener una velocidad de entre 20 y 44 fps, según el fotograma.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'En IP, puedes enviar más, pero los nodos no siempre te siguen (y no siempre es útil).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Estabilidad > frecuencia: mejor estable a 30–40 fps que “rápido” pero inestable.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'reglas simples';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Red dedicada (o VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 =>
      'Unidifusión si hay varios nodos.';

  @override
  String get aboutArtnetSection3SubBullet6 =>
      'Cableado para programas críticos.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Un nodo = IP → DMX. Puede tener 1, 2, 4, 8 puertos DMX. La estabilidad depende del nodo Y del cableado DMX en el lado de salida (terminación, topología, divisores).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Nodos vs divisores';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Nodo: convierte IP→DMX (y a veces DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'Divisor DMX: distribuye una línea DMX en ramas (opto recomendado).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Buen diseño: IP hasta el más cercano, luego DMX corto y limpio.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM en Art-Net (soporte variable)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Algunos nodos admiten un \"proxy RDM\": la consola ve/configura dispositivos RDM a través de IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Otros no soportan RDM en absoluto o parcialmente.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Un optodivisor “clásico” puede bloquear el retorno RDM (según el modelo).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Consejo: Si desea RDM, elija explícitamente hardware marcado como compatible con RDM.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Buen reflejo de campo';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Si DMX es inestable: regla DMX primero (terminación, cable, Y pasiva) y luego solo IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Si RDM es inestable: deshabilita RDM para verificar que DMX puro sea estable.';

  @override
  String get aboutArtnetSection5CalloutTitle => 'Síntomas → causas probables';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Parpadeo por todo el tablero → Wi-Fi, inundación de transmisión, interruptor saturado.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Un nodo está bien, el otro no → universo/mapeo, IP, unidifusión mal configurado.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Caídas aleatorias → cable RJ45 defectuoso, conmutador inestable, paquetes de pérdida de PC.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Un único puerto DMX de un nodo KO → DMX cable, terminación, dispositivo que corta la línea.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'Descubrimiento de RDM imposible → nodo/divisor no compatible con RDM, cableado DMX “límite”.';

  @override
  String get aboutArtnetSection5Subtitle => 'método rápido';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Unidifusión a un solo nodo (prueba simple).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Verificar universo/mapeo (papel + configuración de nodo).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Prueba de cableado directo (PC → interruptor → nodo) con cable conocido en buen estado.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Aislar el DMX: nodo → 1 dispositivo + terminación.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Arquitectura limpia (IP → nodos → DMX corto)';

  @override
  String get aboutArtnetSection6Subtitle2 =>
      'Transmisión vs Unidifusión (idea)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Activos recomendados (opcional)';

  @override
  String get aboutArtnetExampleLabel => 'ejemplo';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Copiar lista de activos';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Sección destinada a ilustrar la red (RJ45, switch, cables). Si los activos no existen, la aplicación muestra su propio respaldo.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Ejemplos';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'conector ethernet';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Cambiar';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (idealmente administrado si es IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'cable ethernet';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = base confiable';

  @override
  String get aboutArtnetChecklistCopyTitle =>
      'Art-Net — Lista de verificación de campo';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Copiar lista de verificación';

  @override
  String get aboutArtnetChecklistTitle => 'Antes de que entres en pánico';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unidifusión si hay varios nodos.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Red dedicada (o VLAN) si es posible.';

  @override
  String get aboutArtnetChecklistBullet3 =>
      'Cableado para espectáculo crítico.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Universo/mapeo documentado.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Prueba de IP simple → 1 nodo → 1 dispositivo + terminación.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Si RDM: nodo “proxy RDM” confirmado + cableado DMX estable';

  @override
  String get aboutArtnetFooterNote =>
      'Información indicativa (terreno). Dependiendo de los nodos/conmutadores/firmwares, el comportamiento puede variar.\nObjetivo aquí: comprender y diagnosticar rápidamente.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'FUENTE\n(PC/consola)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'CAMBIAR';

  @override
  String get aboutArtnetDiagramNode1Label => 'NODO 1\nDMX FUERA';

  @override
  String get aboutArtnetDiagramNode2Label => 'NODO 2\nDMX FUERA';

  @override
  String get aboutArtnetDiagramFixLabel => 'ARREGLAR';

  @override
  String get aboutArtnetDiagramInfoLabel => 'IP larga/corta DMX';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'FUENTE';

  @override
  String get aboutArtnetDiagramNodeALabel => 'NODO A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'NODO B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'NODO C';

  @override
  String get aboutArtnetDiagramUnicastLabel => 'Unicast: paquetes a un nodo';

  @override
  String get aboutArtnetDiagramBroadcastLabel => 'Transmisión: todos reciben';

  @override
  String get aboutArtnetMissingAssetLabel => 'activo faltante';

  @override
  String get aboutRegistryDmxTitle => 'DMX — operación (simple y completa)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universo, direcciones, tramas, cableado RS-485, terminación, errores de campo.\nIncluye diagramas + lista de verificación.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net — DMX sobre IP (nodos, unidifusión/difusión)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'Universo DMX en Ethernet/UDP, nodos, transmisión versus unidifusión.\nLímites reales, estabilidad de la red, RDM según hardware, diagramas + checklist.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 — multidifusión, IGMP, prioridades';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Estándar DMX en red profesional orientada a IP.\nMultidifusión/unidifusión, espionaje/consulta IGMP, prioridades de múltiples fuentes, esquemas + lista de verificación.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Red — Bases IP/máscara/DHCP (esencial)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Comprenda IP, máscara, puerta de enlace, DHCP frente a estático.\nEjemplos concretos (2.x.x.x, 10.x, 192.168.x), pruebas rápidas, mostrar trampas.';

  @override
  String get aboutRegistryReseauTitle =>
      'Red: RJ45 / Fibra / velocidades y longitudes';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distancias típicas, muestra de mejores prácticas.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Red ligera: VLAN, IGMP, Wi-Fi o cableada';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Arquitectura simple y robusta para Art-Net/sACN.\nVLAN, IGMP snooping/queridor, Wi-Fi (jitter), conmutadores, diagramas + lista de verificación.';

  @override
  String get aboutRegistryVideoTitle => 'Vídeo: SDI/NDI/IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Elija según la latencia, la confiabilidad, el cableado, la red LAN o WAN.\nTablas + diagrama.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Eléctrico — Schuko / P17 / potencias';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Conectores, mono/tri, tablas rápidas de kW (16A→400A), trampas de campo.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'Computadoras: USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Velocidades útiles, versiones, límites reales, trampas de marketing.';

  @override
  String get aboutUniverseToHexColHex => 'Maleficio';

  @override
  String get aboutUniverseToHexNote => 'Índice = Universo − 1 (base 0).';

  @override
  String get aboutNetworkPageTitle => 'Red ligera: VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Copiar marcadores';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Copiar';

  @override
  String get aboutNetworkChecklistTitle => 'Antes de abrir Wireshark 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Información indicativa (terreno). Dependiendo del hardware de la red, es posible que se requiera IGMP/VLAN.\nObjetivo: permanecer simple y robusto.';

  @override
  String get aboutNetworkCopy1 =>
      'Red ligera: puntería sencilla, dedicada y estable.';

  @override
  String get aboutNetworkCopy2 =>
      'VLAN = tráfico separado (ligero versus resto).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = esencial si sACN multidifusión a gran escala.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = solución de problemas correcta, rara vez correcta en producción crítica.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Red de iluminación: lista de verificación\n☐ Red dedicada o VLAN ligera\n☐ Borrar plan de IP (DHCP o estático) + máscara ok\n☐ Interruptor correcto; bucles evitados\n☐ sACN multidifusión: espionaje IGMP activado\n☐ Consultador IGMP presente en la VLAN (si es necesario)\n☐ Unicast en solución de problemas (especialmente Art-Net)\n☐ Wi-Fi: evita la producción crítica (jitter/pérdidas)\n☐ Pruebas: ping estable + carga progresiva (universo)';

  @override
  String get aboutNetworkToc1 => '1) Objetivo: red estable';

  @override
  String get aboutNetworkToc2 => '2) plan IP (simple)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (separación)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (sACN multidifusión)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi frente a cable';

  @override
  String get aboutNetworkToc6 => '6) Cambiar: lo que necesitas';

  @override
  String get aboutNetworkToc7 => '7) Esquemas';

  @override
  String get aboutNetworkToc8 => '8) Lista de verificación';

  @override
  String get aboutNetworkBasicsPill1 => 'Dedicada/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'cableado';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP si es multidifusión';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Una red de iluminación debe ser predecible: bajas pérdidas, baja fluctuación y arquitectura simple. Cuando las cosas van mal, rara vez es \"el protocolo\" y, a menudo, la infraestructura (conmutador, Wi-Fi, bucles, inundación).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Regla básica';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'Si puede: cableado + conmutador correcto + red dedicada (o VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'Si tienes que compartir: VLAN + reglas claras.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multidifusión: IGMP rápidamente se vuelve obligatorio.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Elija una estrategia simple y consistente. Dos enfoques: DHCP (simple) o estático (predecible). Lo peor: una mezcla indocumentada.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Plan de ejemplo (simple)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'VLAN ligera: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Consola/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Nodos: 10.10.0.100–150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Gestión de interruptores: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Errores clásicos';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Máscara diferente (ej: /24 vs /16) → máquinas invisibles.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Dos dispositivos misma IP → comportamiento aleatorio.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + estático en el mismo rango sin control → conflictos.';

  @override
  String get aboutNetworkVlanParagraph =>
      'Una VLAN permite aislar la luz del resto (internet, producción de vídeo, invitados, etc.). Esto evita el ruido de la red y reduce el riesgo de que otro servicio interrumpa su programa.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'lo que ganas';

  @override
  String get aboutNetworkVlanBullet1 => 'Tráfico menos espurio.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Menos riesgo (DHCP externo, transmisión no deseada).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Depuración más sencilla (todo en la VLAN = ligero).';

  @override
  String get aboutNetworkVlanSubtitle => 'Atención';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'Una VLAN = todos los puertos deben estar configurados correctamente (acceso/troncal).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'Si no lo sabe: la red \"física\" dedicada suele ser más sencilla.';

  @override
  String get aboutNetworkIgmpPill1 => 'Espionaje IGMP';

  @override
  String get aboutNetworkIgmpPill2 => 'interrogador IGMP';

  @override
  String get aboutNetworkIgmpPill3 => 'Inundación de multidifusión';

  @override
  String get aboutNetworkIgmpParagraph =>
      'La vigilancia IGMP permite al conmutador saber qué puertos desean qué multidifusión. Sin esto, la multidifusión puede verse inundada en todos los puertos → saturación.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'Consultador IGMP (idea simple)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'En algunas redes/VLAN, se requiere un interrogador para mantener las suscripciones IGMP.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'Sin lugar a dudas: dependiendo de los cambios, las suscripciones caducan y aparecen \"fallos técnicos\".';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'Si estás en una red pequeña dedicada: a veces todo funciona, pero en una red grande: es fundamental.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Esquema: IGMP (idea)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'cableado';

  @override
  String get aboutNetworkWifiSubtitle2 => 'Wifi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Latencia estable, bajas pérdidas (si infraestructura limpia).';

  @override
  String get aboutNetworkWifiSubBullet2 => '✅ Recomendado en producción.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      '✅ Práctico (configuración rápida, tableta).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌Latencia variable (jitter), pérdidas, interferencias.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      '❌ La multidifusión a veces está mal administrada dependiendo del AP/configuración.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK solución de problemas/configuraciones pequeñas no críticas, rara vez está bien en el programa cargado.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'regla sencilla';

  @override
  String get aboutNetworkWifiBullet1 => 'Espectáculo crítico = cableado.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = comodidad del operador (UI), no transporte principal DMX/IP si es de gran volumen.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Mínimo recomendado';

  @override
  String get aboutNetworkSwitchBullet1 =>
      'Conmutador Ethernet correcto (no concentrador).';

  @override
  String get aboutNetworkSwitchBullet2 => 'Cables OK (RJ45, conectores).';

  @override
  String get aboutNetworkSwitchBullet3 => 'Evite bucles (o STP controlado).';

  @override
  String get aboutNetworkSwitchBullet4 =>
      'Si sACN es multidifusión: espionaje IGMP.';

  @override
  String get aboutNetworkSwitchSubtitle =>
      'Administrado versus no administrado';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'No administrado: ok, pequeña red dedicada (simple).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Administrado: útil para VLAN/IGMP/diagnóstico (red grande).';

  @override
  String get aboutNetworkDiagramsSubtitle1 =>
      'VLAN: luz/descanso independiente';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi versus cableado (idea)';

  @override
  String get aboutNetworkChecklistBullet1 =>
      'Plan de IP claro, máscara consistente.';

  @override
  String get aboutNetworkChecklistBullet2 => 'Red dedicada/VLAN ligera.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Cambie OK, sin bucles.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP para multidifusión sACN.';

  @override
  String get aboutNetworkChecklistBullet5 =>
      'Wi-Fi evitado en producción crítica.';

  @override
  String get videoCameraExposureTitle => 'exposición de la cámara';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, velocidad y apertura.';

  @override
  String get videoCamPageTitle => 'exposición de la cámara';

  @override
  String get videoCamInfoTitle => 'Información';

  @override
  String get videoCamIntro =>
      'Cálculos indicativos para relacionar lux, ISO, velocidad y apertura.';

  @override
  String get videoCamInputsTitle => 'Entrantes';

  @override
  String get videoCamLuxLabel => '__TECNOLOGÍA_13__';

  @override
  String get videoCamLuxHint => 'Ej: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Ej: 800';

  @override
  String get videoCamShutterLabel => 'Velocidad(es)';

  @override
  String get videoCamShutterHint => 'Ej: 1/50';

  @override
  String get videoCamApertureLabel => 'Apertura (f/)';

  @override
  String get videoCamApertureHint => 'Ej: 2,8';

  @override
  String get videoCamEvEmpty => '—';

  @override
  String get videoCamNote =>
      'Valores orientativos: la calibración depende del sensor, la escena y los estándares.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV $ev';
  }

  @override
  String videoCamApertureResult(Object aperture) {
    return 'Apertura: f/$aperture';
  }

  @override
  String videoCamShutterResult(Object shutter) {
    return 'Velocidad: ${shutter}s';
  }

  @override
  String get aboutDmxS2Title =>
      '2) Cuadro DMX: interrupción, código de inicio, canales';

  @override
  String get aboutDmxS2PillBreak => 'Romper';

  @override
  String get aboutDmxS2PillStartCode => 'Código de inicio';

  @override
  String get aboutDmxS2PillSlots512 => '512 espacios';

  @override
  String get aboutDmxS2PillRefresh => 'Refrescar';

  @override
  String get aboutDmxS2Intro =>
      'Se envía una trama DMX en bucle. Comienza con una \"pausa\" (silencio), luego un código de inicio y luego hasta 512 valores (0-255). Cada dispositivo lee únicamente los canales que le conciernen (según su dirección y modo).';

  @override
  String get aboutDmxS2HowToReadTitle => 'Leer un fotograma (muy sencillo)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Pausa + MAB: marca el inicio de la trama (resincronización).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Código de inicio: normalmente 0x00 (datos de iluminación).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Ranuras 1→512: cada ranura = 1 canal (0–255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'El cuadro comienza de nuevo continuamente: es normal \"sobrescribir\" el valor anterior.';

  @override
  String get aboutDmxS2PracticalTitle => 'En la práctica';

  @override
  String get aboutDmxS2PracticalB1 =>
      'Un modo de 16 bits utiliza 2 canales para la misma función (por ejemplo: Panorámica gruesa + Panorámica fina).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'Cuantos más universos envíe, más aumentará la carga general (consolas/nodos/red).';

  @override
  String get aboutDmxS2PracticalB3 =>
      'Si tiene parpadeo, piense primero en el cable/terminación/conexiones antes de sospechar de la consola.';

  @override
  String get aboutDmxS3Title =>
      '3) Cableado DMX — RS-485, topología, distribución de pines';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Cadena de margaritas';

  @override
  String get aboutDmxS3PillNoY => 'No Sí';

  @override
  String get aboutDmxS3Pill120ohm => '120Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 se basa en RS-485: un bus diferencial al que le gustan las líneas limpias. La regla de oro: una cadena (encadenamiento) desde la fuente hasta los dispositivos, luego una terminación al final.';

  @override
  String get aboutDmxS3TopologyTitle => 'Topología recomendada';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Fuente → Dispositivo 1 → Dispositivo 2 → … → último dispositivo.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Evite las desviaciones en Y: crean reflejos (inestabilidad).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'Si tienes que hacer ramas: utiliza un divisor DMX optoaislado.';

  @override
  String get aboutDmxS3PinoutTitle => 'Conexiones (recordatorio)';

  @override
  String get aboutDmxS3CablesTitle => 'Cables: lo que realmente funciona';

  @override
  String get aboutDmxS3CablesB1 =>
      'Utiliza un cable DMX (impedancia ~120 Ω), no un micrófono aleatorio (a menos que se solucione un problema brevemente).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Mantenga longitudes razonables y evite bobinados apretados cerca de fuentes de alimentación/atenuadores.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Un cable malo = a veces “funciona”… hasta el día que ya no (humedad, longitud, carga).';

  @override
  String get aboutDmxS4Title =>
      '4) Terminación y divisores: estabilidad del bus';

  @override
  String get aboutDmxS4Intro =>
      'En un bus RS-485 la terminación evita reflexiones al final de la línea. Los divisores (optoaislados) se utilizan para crear ramas limpias y proteger la fuente.';

  @override
  String get aboutDmxS4TerminatorTitle => 'Terminación (120 Ω): cuándo y cómo';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Pone una terminación en el último dispositivo (o un conector XLR).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Sólo una terminación por línea (no en todas partes).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Esencial en largas colas, grandes cargas y ambientes ruidosos.';

  @override
  String get aboutDmxS4SplittersTitle => 'Divisores / optoaislamiento';

  @override
  String get aboutDmxS4SplittersB1 => 'Permite hacer 2, 4, 8 ramas sin “Y”.';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Aísla eléctricamente: limita los bucles de tierra y protege la consola/nodo.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Práctico para “reconducir” una señal a largas distancias.';

  @override
  String get aboutDmxS5Title =>
      '5) Solución de problemas: método sencillo (rápido y fiable)';

  @override
  String get aboutDmxS5Intro =>
      'Cuando un dispositivo no responde, la clave es aislar: ¿es la dirección, el modo, la línea DMX o el dispositivo? Siga una breve lista de verificación antes de reconfigurar todo.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Lista de verificación rápida';

  @override
  String get aboutDmxS5QuickB1 =>
      '¿Dirección DMX correcta? (y no 001 vs 000 dependiendo de la pantalla).';

  @override
  String get aboutDmxS5QuickB2 => '¿Modo DMX correcto (número de canales)?';

  @override
  String get aboutDmxS5QuickB3 =>
      '¿Buen universo/salida (consola, nodo, puerto)?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Pruebe con un cable que se sepa que está en buen estado y luego reemplácelo uno por uno.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Agregue o elimine un final al final de la línea para ver el efecto.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'Si parpadea/se levanta';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Busque una \"Y\" oculta, un divisor inadecuado o un adaptador XLR defectuoso.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Mantiene a DMX alejado de fuentes de alimentación/atenuadores, evita grandes bucles de cables.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Reduce la complejidad: 1 universo, 1 línea, 1 dispositivo, luego reconstruyes.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'regla de oro';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'Debe poder operar un solo dispositivo en una sola línea. Si esta prueba básica falla, el problema no es \"el parche completo\": es el direccionamiento, el cableado o el hardware.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net — DMX sobre IP (vocabulario y dificultades)';

  @override
  String get aboutDmxS6PillUdp => 'UDP';

  @override
  String get aboutDmxS6PillNodes => 'Nodos';

  @override
  String get aboutDmxS6PillBroadcast => 'transmisión';

  @override
  String get aboutDmxS6PillUnicast => 'Unidifusión';

  @override
  String get aboutDmxS6Intro =>
      'Art-Net transporta DMX universos a través de Ethernet (UDP). Una consola/software envía universos a través de la red y un nodo los convierte en salidas físicas DMX.';

  @override
  String get aboutDmxS6BasicsTitle => 'para recordar';

  @override
  String get aboutDmxS6BasicsB1 => 'Un nodo = red ↔ DMX (varios puertos).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Envíos de transmisión a todos (simples pero pueden saturarse).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'Unicast solo envía al nodo objetivo (a menudo más estable en plataformas grandes).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Tenga cuidado al contar universos: a menudo Art-Net comienza en 0 (Universo 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => '¿Cuándo elegir Art-Net?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Equipos pequeños/medianos, configuraciones rápidas, muchos equipos compatibles.';

  @override
  String get aboutDmxS6WhenB2 =>
      'Está bien si la red está limpia (interruptor correcto, cables, sin Wi-Fi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'Si se satura: cambia a unidifusión y segmenta la red (VLAN/red dedicada).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) — multidifusión, prioridades, red propia';

  @override
  String get aboutDmxS7PillE131 => 'E1.31';

  @override
  String get aboutDmxS7PillMulticast => 'Multidifusión';

  @override
  String get aboutDmxS7PillPriority => 'Prioridad';

  @override
  String get aboutDmxS7PillIgmp => 'IGMP';

  @override
  String get aboutDmxS7Intro =>
      'sACN (ANSI E1.31) es un estándar moderno para transportar universos DMX a través de IP. Se utiliza ampliamente en sistemas grandes porque gestiona bien la multidifusión y las prioridades.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'ideas clave';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast: un universo es un “grupo” de red (los nodos se suscriben).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'El espionaje IGMP en los interruptores = esencial a gran escala (de lo contrario, se inunda).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Prioridad: varias fuentes posibles, gana la de mayor prioridad.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Como Art-Net: red limpia + cables/conmutador de calidad = estabilidad.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN - resumen (¿qué elegir?)';

  @override
  String get aboutDmxS8Intro =>
      'En última instancia, los tres hacen lo mismo: controlar los canales. La diferencia se reduce a la distribución (DMX cable versus red), escala y solidez.';

  @override
  String get aboutDmxS8QuickTableTitle => 'Resumen en 4 líneas';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX: simple, robusto, 1 cable = 1 línea (512 canales).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net: muy común, fácil de implementar, cuidado con la transmisión.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN: más \"sistemas profesionales grandes\", multidifusión + prioridades, requiere una red bien configurada.';

  @override
  String get aboutDmxS8QuickB4 =>
      'En todos los casos: documentación + pruebas progresivas = enorme ahorro de tiempo.';

  @override
  String get aboutDmxS8ChooseTitle => 'elección rápida';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Configuración pequeña: DMX directa o Art-Net (simple).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Muchos universos: red dedicada + nodos; Art-Net en unidifusión o sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Equipos/infraestructuras muy grandes: sACN + conmutadores/IGMP bien administrados.';

  @override
  String get aboutSunTimesTitle => 'Sol (salida/puesta)';

  @override
  String get aboutSunTimesSubtitle =>
      'Elección de una ciudad y una fecha, hora de salida/puesta + umbrales (lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'Red: puntos de referencia de campo';

  @override
  String get aboutReseauSummaryCopy =>
      'RED: puntos de referencia de campo\n• RJ45: Cat5e/6/6A → 1G/10G dependiendo de la distancia.\n• Fibra: larga distancia + inmunidad EMI.\n• Switch: IGMP importante para la multidifusión sACN.\n• VLAN: luz/vídeo/IT separados = estabilidad.';

  @override
  String get aboutReseauChecklistCopy =>
      'RED — Lista de verificación\n☐ Plan de IP claro (rango/máscaras)\n☐ Conmutador correcto (IGMP si sACN multidifusión)\n☐ VLAN si hay varios “mundos” (luz/vídeo/TI)\n☐ Cables probados + etiquetados\n☐ Fibra: módulos compatibles + conectores propios\n☐ Evite bucles (STP) + evite Wi-Fi público en el programa LAN';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Copiar';

  @override
  String get aboutReseauFooterNote =>
      'Información indicativa (terreno). Las capacidades exactas varían dependiendo del hardware/cables/módulos.\nObjetivo: benchmarks simples + método confiable.';

  @override
  String get aboutReseauToc1 =>
      '1) Conceptos básicos de red (LAN/IP/rendimiento)';

  @override
  String get aboutReseauToc2 => '2) RJ45 y categorías (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc3 => '3) PoE (fuente de alimentación de red)';

  @override
  String get aboutReseauToc4 => '4) Fibra (SM/MM) + conectores (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP/SFP+/QSFP (módulos)';

  @override
  String get aboutReseauToc6 => '6) Conmutadores (VLAN/IGMP/QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN en la red (consejo)';

  @override
  String get aboutReseauToc8 => '8) Lista de verificación';

  @override
  String get aboutReseauSection1Title => 'Las 3 ideas simples';

  @override
  String get aboutReseauSection1Bullet1 => 'IP = dirección (ej: 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = red local mediante conmutador (no \"internet\").';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Flujo = capacidad (1G, 10G, etc.), pero la estabilidad también depende del interruptor.';

  @override
  String get aboutReseauSection1Title2 => 'Mostrar topología (limpia)';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Consola/PC → conmutador central → nodos/servidores.';

  @override
  String get aboutReseauSection1Bullet5 =>
      'Evite las “redes en cadena” aleatorias.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Si es posible: una red de espectáculos dedicada (no Wi-Fi pública).';

  @override
  String get aboutReseauSection2Title => 'Referencias rápidas';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e: 1 Gbit/s “clásico” (hasta 100m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6: 1G/10G (10G más bien en distancias más cortas).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A: 10G hasta 100m (referencia práctica).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Más allá: Cat7/8 existen, pero Cat6A suele ser el punto óptimo en este campo.';

  @override
  String get aboutReseauSection2Title2 => 'Suelo';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Siempre pruebe/etiquete los cables (especialmente cuando se alquilan).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Evite conectores dañados: un RJ45 “cansado” = fallos fantasma.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Planifique 10G si graba videos IP pesados.';

  @override
  String get aboutReseauSection3Paragraph =>
      'PoE permite alimentar equipos vía RJ45 (cámara IP, AP Wi-Fi, nodos pequeños, etc.). El punto crítico: el presupuesto total PoE del switch.';

  @override
  String get aboutReseauSection3Title => 'Puntos de referencia';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt superior.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'El interruptor tiene un \"presupuesto\" total (por ejemplo: 120W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'Si excede el presupuesto: algunos puertos ya no se encienden/reinician.';

  @override
  String get aboutReseauSection4Title =>
      '¿Por qué la fibra está en exposición?';

  @override
  String get aboutReseauSection4Bullet1 => 'Distancias muy largas.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Inmunidad a los parásitos (EMI), máxima en entornos concurridos.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Práctico para conectar FOH ↔ escenario ↔ sala de control.';

  @override
  String get aboutReseauSection4Title2 => 'Multimodo vs Monomodo (marca única)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimodo (MM): distancias “promedio” (a menudo edificio/plataforma).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Modo único (SM): distancias muy largas.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'Los módulos (SFP) deben coincidir con el tipo de fibra.';

  @override
  String get aboutReseauSection4Title3 => 'Conectores';

  @override
  String get aboutReseauSection4Bullet7 => 'LC: pequeño, muy común en SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC: más grande, común en infraestructura.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Proteger/limpiar siempre (polvo = pérdidas).';

  @override
  String get aboutReseauSection5Title => 'Puntos de referencia';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP: a menudo 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+: a menudo 10G.';

  @override
  String get aboutReseauSection5Bullet3 => 'QSFP/QSFP+: 40G (según uso).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'Un módulo = velocidad + tipo de fibra + longitud (todo debe ser consistente).';

  @override
  String get aboutReseauSection5Paragraph =>
      'En la práctica: lleve módulos compatibles con el interruptor (e idealmente del mismo proveedor/modelo) para evitar sorpresas.';

  @override
  String get aboutReseauSection6Title => 'Funciones útiles en show.';

  @override
  String get aboutReseauSection6Bullet1 => 'VLAN: luz/vídeo/IT separados.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'Snooping IGMP: imprescindible si utilizas la multidifusión sACN a gran escala.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS: útil si mezclas muchos flujos (según el contexto).';

  @override
  String get aboutReseauSection6Title2 => 'Errores comunes';

  @override
  String get aboutReseauSection6Bullet4 =>
      'Conmutador “barato” que inunda la multidifusión → red que colapsa.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Bucle de red sin STP → tormenta de transmisión.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Wi-Fi público en la misma LAN que el programa → inestabilidad.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (campo)';

  @override
  String get aboutReseauSection7Bullet1 =>
      'A menudo es sencillo de configurar.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'La transmisión es posible en una pequeña LAN dedicada, pero la unidifusión es más limpia.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Mapeo de universo/puerto = punto número 1 para verificar.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (campo)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast: efectivo, pero requiere un cambio correcto (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Prioridades: útil si hay múltiples fuentes.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'En programas grandes: sACN + IGMP suele ser la opción \"limpia\".';

  @override
  String get aboutReseauChecklistTitle => 'Rápido';

  @override
  String get aboutReseauChecklistBullet1 =>
      'Interruptor correcto + cables limpios.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP si sACN multidifusión.';

  @override
  String get aboutReseauChecklistBullet3 => 'Usos separados (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 — multidifusión y prioridades';

  @override
  String get aboutSacnCopyTooltip => 'Copiar marcadores';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Copiar';

  @override
  String get aboutSacnFooterNote =>
      'Información indicativa (terreno). Los comportamientos dependen de los conmutadores (IGMP), los nodos y el firmware.\nObjetivo: comprender y estabilizar una red sACN.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX sobre IP (UDP), muestra estándar.';

  @override
  String get aboutSacnCopy2 => 'Universo sACN = 1..63999 (rango estándar).';

  @override
  String get aboutSacnCopy3 =>
      'Multidifusión: se recomienda el espionaje IGMP; de lo contrario, se inundará.';

  @override
  String get aboutSacnCopy4 =>
      'Prioridad: útil con múltiples fuentes (consola + copia de seguridad).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) — Lista de verificación de campo\n☐ Interruptor correcto (idealmente manejable)\n☐ La vigilancia IGMP está habilitada si es multidifusión\n☐ (Si es posible) Consultador IGMP presente en la VLAN (de lo contrario, es posible que se produzca un comportamiento extraño)\n☐ Unidifusión si la red no está controlada/solución de problemas\n☐ Prioridades: verificar múltiples fuentes (consola/copia de seguridad)\n☐ Mapeo del universo ↔ puertos de nodo verificados\n☐ Wi-Fi evitado en producción';

  @override
  String get aboutSacnToc1 => '1) ¿Para qué se utiliza sACN?';

  @override
  String get aboutSacnToc2 => '2) Universo (numeración)';

  @override
  String get aboutSacnToc3 => '3) Multidifusión/Unidifusión + IGMP';

  @override
  String get aboutSacnToc4 => '4) Prioridades (multifuente)';

  @override
  String get aboutSacnToc5 => '5) Límites/rendimiento';

  @override
  String get aboutSacnToc6 => '6) RDM y sACN (proxy/según el hardware)';

  @override
  String get aboutSacnToc7 => '7) Esquemas';

  @override
  String get aboutSacnToc8 => '8) Lista de verificación';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multidifusión';

  @override
  String get aboutSacnSection1Pill3 => 'Prioridad';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) es un estándar ampliamente utilizado para transportar universos DMX a través de IP. A menudo se prefiere cuando se desea una arquitectura de red limpia: multidifusión bien administrada, prioridades estandarizadas y un comportamiento más de \"red profesional\".';

  @override
  String get aboutSacnSection1Title => 'cuando es genial';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Muchos universos en una red bien administrada.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Instalaciones/grandes redes con varios orígenes (prioridades).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'Cuando quieras evitar la “transmisión en todas partes”.';

  @override
  String get aboutSacnSection2Pill1 => 'Universo 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 espacios/universo';

  @override
  String get aboutSacnSection2Paragraph =>
      'Un universo sACN corresponde a un universo DMX: hasta 512 espacios. La numeración estándar sACN es 1..63999. En la práctica, lo importante es el mapeo de consola ↔ nodo ↔ puerto DMX.';

  @override
  String get aboutSacnSection2Title => 'error clásico';

  @override
  String get aboutSacnSection2Bullet1 =>
      'Cambia el número de universo en el lado de la consola, pero no en el lado del nodo (o viceversa).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'Parcha el \"Universo 0\" mientras el hardware espera una base 1.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Estás mezclando convenciones de numeración entre herramientas.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN suele utilizar multidifusión: cada universo \"vive\" en un grupo de multidifusión y los nodos se suscriben a los universos que necesitan.';

  @override
  String get aboutSacnSection3Title => 'Espionaje IGMP (por qué es importante)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Sin IGMP: el conmutador inunda la multidifusión en todas partes → posible sobrecarga.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Con IGMP: el switch solo envía a puertos de abonado → red estable.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'En grandes volúmenes: IGMP suele ser LA diferencia entre \"funciona\" y \"es un infierno\".';

  @override
  String get aboutSacnSection3Subtitle => 'Esquema: multidifusión e IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unidifusión (opción)';

  @override
  String get aboutSacnSection3SubBullet1 =>
      'Posible dependiendo de las consolas/nodos.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Útil para solucionar problemas o si la red de multidifusión no está controlada.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Menos elegante pero a veces más sencillo.';

  @override
  String get aboutSacnSection4Pill1 => 'Fuente A prior 100';

  @override
  String get aboutSacnSection4Pill2 => 'Fuente B prior 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN maneja una noción de prioridad: si varias fuentes envían el mismo universo, el receptor se queda con la fuente con mayor prioridad. Muy útil con una consola principal + una consola de respaldo + un servidor de medios.';

  @override
  String get aboutSacnSection4Title => 'Escollos';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Dos fuentes no deseadas en el mismo universo → “está peleando”.';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Prioridad mal configurada → copia de seguridad que toma el control.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Depurar: cortar una fuente y comprobar quién gana.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Cambiar';

  @override
  String get aboutSacnSection5Pill3 => 'Wi-Fi no';

  @override
  String get aboutSacnSection5Pill4 => 'nodo de CPU';

  @override
  String get aboutSacnSection5Title => '¿Qué se rompe primero?';

  @override
  String get aboutSacnSection5Bullet1 => 'Multidifusión sin IGMP → inundación.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Conmutador inadecuado (búfer/CPU) → pérdidas.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → fluctuaciones/caídas.';

  @override
  String get aboutSacnSection5Bullet4 => 'Nodos limitados (puertos, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'reglas simples';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Switch administrado + espionaje IGMP si hay muchos universos.';

  @override
  String get aboutSacnSection5SubBullet2 =>
      'VLAN ligera dedicada si es posible.';

  @override
  String get aboutSacnSection5SubBullet3 =>
      'Unicast para aislar en la resolución de problemas.';

  @override
  String get aboutSacnSection6Paragraph =>
      'Al igual que con Art-Net, el RDM \"sobre IP\" a menudo depende de un mecanismo de proxy en los nodos. El estándar sACN no implica automáticamente que su nodo realice RDM correctamente.';

  @override
  String get aboutSacnSection6Title => 'Para verificar el documento del nodo';

  @override
  String get aboutSacnSection6Bullet1 => 'Proxy RDM/soporte RDM sobre IP.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Limitaciones (solo descubrimiento, pedidos parciales).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatibilidad con divisores/lado óptico DMX.';

  @override
  String get aboutSacnSection6Subtitle => 'Método de campo';

  @override
  String get aboutSacnSection6SubBullet1 => 'Estabilice DMX sin RDM.';

  @override
  String get aboutSacnSection6SubBullet2 =>
      'Pruebe RDM en una línea simple y limpia.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'Si tiene problemas: desactive RDM y luego aísle el nodo/divisor.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multidifusión + IGMP (idea)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Prioridades (2 fuentes)';

  @override
  String get aboutSacnChecklistTitle => 'Antes de acusar “al protocolo”';

  @override
  String get aboutSacnChecklistBullet1 =>
      'La vigilancia IGMP está habilitada si es multidifusión.';

  @override
  String get aboutSacnChecklistBullet2 => 'VLAN dedicada si es posible.';

  @override
  String get aboutSacnChecklistBullet3 =>
      'Unidifusión en solución de problemas.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Prioridades consistentes si se cuenta con múltiples fuentes.';

  @override
  String get aboutSacnChecklistBullet5 => 'Wi-Fi evitado en producción.';

  @override
  String get sunTimesTitle => 'Amanecer/atardecer';

  @override
  String get sunTimesSectionSettings => 'Ajustes';

  @override
  String get sunTimesSectionResults => 'Resultados';

  @override
  String get sunTimesSectionTimeline => 'Línea de tiempo (pasos de 30 minutos)';

  @override
  String get sunTimesSectionTwilight => '¿Qué son los crepúsculos?';

  @override
  String get sunTimesSectionLux => 'Umbrales de brillo (puntos de referencia)';

  @override
  String get sunTimesIntro =>
      'Elige una ciudad y una fecha. Los tiempos son indicativos (redondeados).';

  @override
  String get sunTimesLabelCity => 'Ciudad';

  @override
  String get sunTimesLabelDate => 'Fecha';

  @override
  String get sunTimesNoteApprox =>
      'Tiempos indicativos: pueden variar según la altitud, la refracción y el clima.';

  @override
  String get sunTimesNoData => '—';

  @override
  String get sunTimesResultSunrise => 'Amanecer';

  @override
  String get sunTimesResultSunset => 'Atardecer';

  @override
  String get sunTimesResultCivilDawn => 'Amanecer civil';

  @override
  String get sunTimesResultCivilDusk => 'Crepúsculo civil';

  @override
  String get sunTimesResultNauticalDawn => 'Amanecer náutico';

  @override
  String get sunTimesResultNauticalDusk => 'Crepúsculo náutico';

  @override
  String get sunTimesResultAstronomicalDawn => 'Amanecer astronómico';

  @override
  String get sunTimesResultAstronomicalDusk => 'Crepúsculo astronómico';

  @override
  String get sunTimesTimelineStep30 => 'Pasos: 30 min';

  @override
  String get sunTimesTimelineDay => 'Día';

  @override
  String get sunTimesTimelineCivil => 'Civil';

  @override
  String get sunTimesTimelineNautical => 'Náutico';

  @override
  String get sunTimesTimelineAstronomical => 'Astronómico';

  @override
  String get sunTimesTimelineNight => 'Noche';

  @override
  String get sunTimesTwilightIntro =>
      'Los crepúsculos se definen por la altura del Sol debajo del horizonte. Estas definiciones están estandarizadas.';

  @override
  String get sunTimesTwilightCivilTitle => 'Civil (≈ 0° a −6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Fin/principio del día. Todavía podemos ver claramente el paisaje.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Náutico (≈ −6° a −12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'La línea del horizonte se vuelve difícil de distinguir. El cielo está notablemente más oscuro.';

  @override
  String get sunTimesTwilightAstronomicalTitle => 'Astronómico (≈ −12° a −18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'El cielo está casi en completa oscuridad (poca luz residual).';

  @override
  String get sunTimesLuxNight => 'noche oscura';

  @override
  String get sunTimesLuxAstro => 'Astro Crepúsculo';

  @override
  String get sunTimesLuxNautical => 'Nautica del atardecer.';

  @override
  String get sunTimesLuxCivil => 'Crepúsculo civil';

  @override
  String get sunTimesLuxVeryLow => 'Muy débil';

  @override
  String get sunTimesLuxLow => 'Débil';

  @override
  String get sunTimesLuxDay => 'Día';

  @override
  String get sunTimesLuxFullDay => 'dia completo';

  @override
  String get sunTimesLuxNote =>
      'Estos valores son puntos de referencia típicos (clima, estación, entorno → variaciones).';

  @override
  String get aboutVideoPageTitle => 'Vídeo: marcadores de campo';

  @override
  String get aboutVideoSummaryCopy =>
      'VIDEO — referencias de campo\n• Resolución = tamaño (px). FPS = fluidez/latencia.\n• 4:2:2 / 4:4:4 + 10 bits = calidad del color.\n• SDI = robusto + larga distancia.\n• HDMI = frágil + corto.\n• NDI = IP (red), depende de LAN.\n• Genlock / Código de tiempo = sincronización.';

  @override
  String get aboutVideoChecklistCopy =>
      'VÍDEO — Lista de verificación\n☐ Misma resolución y FPS en todas partes\n☐ HDMI: EDID/HDCP masterizado\n☐ SDI: cable 75Ω + buen estándar\n☐ NDI/IP: propia LAN (conmutador, velocidad)\n☐ Genlock / Código de tiempo si se requiere sincronización\n☐ Fuente de prueba → pantalla directa';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Copiar';

  @override
  String get aboutVideoFooterNote =>
      'Información indicativa (terreno). Los comportamientos varían según el hardware.\nObjetivo: entender rápidamente y solucionar problemas adecuadamente.';

  @override
  String get aboutVideoToc1 => '1) Conceptos básicos de vídeo (palabras clave)';

  @override
  String get aboutVideoToc2 => '2) Resolución y FPS';

  @override
  String get aboutVideoToc3 => '3) Color (4:4:4 / 4:2:2 / 10 bits)';

  @override
  String get aboutVideoToc4 => '4) Sincronización (Genlock / Código de tiempo)';

  @override
  String get aboutVideoToc5 => '5) Cables y distancias';

  @override
  String get aboutVideoToc6 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI - campo';

  @override
  String get aboutVideoToc8 => '8) NDI — cuándo / por qué / límites';

  @override
  String get aboutVideoToc9 => '9) Mapeo / LED / multiproyecto';

  @override
  String get aboutVideoSection1Paragraph =>
      'El vídeo es una imagen (píxeles) enviada a una velocidad (FPS), con una estructura de color (muestreo/profundidad de bits), transportada por un enlace (SDI/HDMI/IP) y en ocasiones sincronizada.';

  @override
  String get aboutVideoSection1Title => 'Vocabulario útil';

  @override
  String get aboutVideoSection1Bullet1 => 'Resolución: ancho×alto (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS: fluidez/latencia.';

  @override
  String get aboutVideoSection1Bullet3 => 'Progresivo (p) vs entrelazado (i).';

  @override
  String get aboutVideoSection1Bullet4 => 'Códec: compresión (H.264, H.265…).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latencia: revisión en vivo.';

  @override
  String get aboutVideoSection2Title => 'Resolución';

  @override
  String get aboutVideoSection2Bullet1 => '1080p = 1920×1080.';

  @override
  String get aboutVideoSection2Bullet2 => '4K UHD = 3840×2160.';

  @override
  String get aboutVideoSection2Bullet3 => 'DCI 4K = 4096×2160 (cine).';

  @override
  String get aboutVideoSection2Bullet4 => 'Más píxeles = más rendimiento.';

  @override
  String get aboutVideoSection2Title2 => 'FPS';

  @override
  String get aboutVideoSection2Bullet5 => '25/50: estándar europeo.';

  @override
  String get aboutVideoSection2Bullet6 =>
      '30/60: estándar/dispositivos de EE. UU.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Evite mezclar 50 y 60 sin conversión.';

  @override
  String get aboutVideoSection3Title => 'Muestreo';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4: gráficos/incrustación.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2: profesional actual.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0: archivos/transmisión.';

  @override
  String get aboutVideoSection3Title2 => 'Profundidad de bits';

  @override
  String get aboutVideoSection3Bullet4 => '8 bits: estándar.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10 bits: mejores gradientes (HDR/LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 =>
      'Sincroniza la actualización de la imagen.';

  @override
  String get aboutVideoSection4Bullet2 => 'Útil en multi-cam/LED/difusión.';

  @override
  String get aboutVideoSection4Title2 => 'Código de tiempo';

  @override
  String get aboutVideoSection4Bullet3 => 'Sincronización horaria.';

  @override
  String get aboutVideoSection4Bullet4 => 'No reemplaza genlock.';

  @override
  String get aboutVideoSection5Title => 'reglas simples';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI: frágil, corto.';

  @override
  String get aboutVideoSection5Bullet2 => 'SDI: robusto, largo.';

  @override
  String get aboutVideoSection5Bullet3 => 'Fibra: muy larga + libre de EMI.';

  @override
  String get aboutVideoSection6Title => 'Puntos de referencia';

  @override
  String get aboutVideoSection6Bullet1 => '3G: 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G: 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G: 2160p60';

  @override
  String get aboutVideoSection7Title => 'para mirar';

  @override
  String get aboutVideoSection7Bullet1 => 'edid';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Longitudes';

  @override
  String get aboutVideoSection8Title => 'IP de vídeo';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexible.';

  @override
  String get aboutVideoSection8Bullet2 => 'Carga de red.';

  @override
  String get aboutVideoSection8Bullet3 => 'Se requiere LAN propia.';

  @override
  String get aboutVideoSection9Title => 'Suelo';

  @override
  String get aboutVideoSection9Bullet1 => 'Misma resolución/FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Mapeo correcto.';

  @override
  String get aboutVideoSection9Bullet3 => 'Prueba con miras.';

  @override
  String get aboutVideoChecklistTitle => 'Antes de que entres en pánico';

  @override
  String get aboutVideoChecklistBullet1 => 'Verifique la resolución/FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Fuente de prueba → pantalla.';

  @override
  String get aboutVideoChecklistBullet3 => 'Simplifica la cadena.';

  @override
  String get homeBpmSubtitle => 'Tap tempo, conversión BPM ↔ ms, Hz, medición.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Toque el tempo';

  @override
  String get bpmTapButton => 'Tipo';

  @override
  String get bpmResetTap => 'Restablecer grifos';

  @override
  String get bpmDetectedLabel => 'BPM detectados';

  @override
  String get bpmTapHint =>
      'Toque varias veces (idealmente de 4 a 8 toques) para obtener un promedio estable.';

  @override
  String get bpmManualTitle => 'BPM manuales';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ex. 128';

  @override
  String get commonAdd => 'Agregar';

  @override
  String get commonEdit => 'para modificar';

  @override
  String get commonDelete => 'BORRAR';

  @override
  String get commonCopied => 'Copiado al portapapeles.';

  @override
  String get patchCreateGdtfTitle => 'Crear un GDTF (sencillo)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Creación manual de un dispositivo en forma de tabla.';

  @override
  String get gdtfSimpleTitle => 'Creador GDTF (sencillo)';

  @override
  String get gdtfDeviceSectionTitle => 'Dispositivo';

  @override
  String get gdtfChannelsSectionTitle => 'Canales';

  @override
  String get gdtfImportJsonTitle => 'Importar JSON';

  @override
  String get gdtfExportJsonTitle => 'Exportar JSON';

  @override
  String get gdtfImportJsonHint => 'Pega el JSON aquí';

  @override
  String get gdtfManufacturerLabel => 'Fabricante';

  @override
  String get gdtfModelLabel => 'Modelo';

  @override
  String get gdtfModeNameLabel => 'Nombre del modo';

  @override
  String get gdtfChannelsCountLabel => 'Canales';

  @override
  String get gdtfFootprintLabel => 'Huella';

  @override
  String get gdtfColIndex => '#';

  @override
  String get gdtfColName => 'Nombre';

  @override
  String get gdtfColDmx => '__TECNOLOGÍA_0__';

  @override
  String get gdtfColType => 'Amable';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Por defecto';

  @override
  String get gdtfColActions => 'Comportamiento';

  @override
  String get gdtfMoveUp => 'para subir';

  @override
  String get gdtfMoveDown => 'para bajar';

  @override
  String get gdtfChannelAddTitle => 'Agregar un canal';

  @override
  String get gdtfChannelEditTitle => 'Editar canal';

  @override
  String get gdtfFieldName => 'Nombre';

  @override
  String get gdtfFieldDmx => 'Dirección DMX';

  @override
  String get gdtfFieldType => 'Amable';

  @override
  String get gdtfFieldResolution => 'Resolución';

  @override
  String get gdtfRes8 => '8 bits';

  @override
  String get gdtfRes16 => '16 bits';

  @override
  String get gdtfFieldDefault8 => 'Valor predeterminado (0–255)';

  @override
  String get gdtfFieldDefault16 => 'Valor predeterminado (0–65535)';

  @override
  String get gdtfDefaultChannelName => 'Canal';

  @override
  String get gdtfMvpHint =>
      'MVP: exportación JSON (portapapeles). La exportación real de GDTF (XML+ZIP) será la siguiente.';

  @override
  String get gdtfTypeDimmer => 'Regulador de intensidad';

  @override
  String get gdtfTypePan => 'Estallido';

  @override
  String get gdtfTypeTilt => 'Inclinación';

  @override
  String get gdtfTypeColor => 'Color';

  @override
  String get gdtfTypeGobo => 'gobo';

  @override
  String get gdtfTypeShutter => 'Obturador';

  @override
  String get gdtfTypePrism => 'Prisma';

  @override
  String get gdtfTypeZoom => 'Zoom';

  @override
  String get gdtfTypeFocus => 'Enfocar';

  @override
  String get gdtfTypeIris => 'Iris';

  @override
  String get gdtfTypeEffect => 'Efecto';

  @override
  String get gdtfTypeCustom => 'Costumbre';

  @override
  String get gdtfEasyTitle => 'Crear un GDTF (sencillo)';

  @override
  String get gdtfTemplatesTitle => 'Preselecciones';

  @override
  String get gdtfCreateDefaultPreset =>
      'Crear el ajuste preestablecido predeterminado';

  @override
  String get gdtfTemplatesHint =>
      'Crea una base rápida (atenuador, obturador, panorámica, inclinación, RGB, etc.) luego completa las direcciones DMX y los valores predeterminados.';

  @override
  String get gdtfExportButton => 'Exportar GDTF';

  @override
  String get gdtfExportHint =>
      'Exportación mínima de .gdtf (descripción.xml) y luego compartir (Correo, WhatsApp, AirDrop, Drive…).';

  @override
  String get gdtfExportNeedDmx =>
      'Agregue al menos una dirección DMX para exportar.';

  @override
  String get gdtfExportDone => 'GDTF exportado.';

  @override
  String get gdtfExportError => 'No se puede exportar GDTF.';

  @override
  String get gdtfShareSubject => 'Archivo GDTF';

  @override
  String get gdtfShareText => 'Aquí está el archivo GDTF exportado.';

  @override
  String get gdtfFieldRole => 'Configuración';

  @override
  String get gdtfDmxHint => 'En blanco o 1–512';

  @override
  String get gdtfFieldDefault => 'Por defecto';

  @override
  String get gdtfDefaultHint8 => '0-255';

  @override
  String get gdtfDefaultHint16 => '0–65535';

  @override
  String get gdtfChannelDefaultName => 'Canal';

  @override
  String get gdtfRoleEmpty => 'Vacío / Desconocido';

  @override
  String get gdtfRoleDimmer => 'Regulador de intensidad';

  @override
  String get gdtfRoleShutter => 'Obturador';

  @override
  String get gdtfRolePan => 'Estallido';

  @override
  String get gdtfRoleTilt => 'Inclinación';

  @override
  String get gdtfRoleRed => 'Rojo (R)';

  @override
  String get gdtfRoleGreen => 'Verde (G)';

  @override
  String get gdtfRoleBlue => 'Azul (B)';

  @override
  String get gdtfRoleColor => 'Color';

  @override
  String get gdtfRoleGobo => 'gobo';

  @override
  String get gdtfRoleZoom => 'Zoom';

  @override
  String get gdtfRoleFocus => 'Enfocar';

  @override
  String get gdtfRolePrism => 'Prisma';

  @override
  String get gdtfRoleEffect => 'Efecto';

  @override
  String get gdtfRoleControl => 'Control';

  @override
  String get gdtfRoleCustom => 'Costumbre';

  @override
  String get gdtfResUnknown => 'Vacío';

  @override
  String get gdtfPresetDimmer => 'Regulador de intensidad';

  @override
  String get gdtfPresetShutter => 'Obturador';

  @override
  String get gdtfPresetPan => 'Estallido';

  @override
  String get gdtfPresetTilt => 'Inclinación';

  @override
  String get gdtfPresetRed => 'R';

  @override
  String get gdtfPresetGreen => 'GRAMO';

  @override
  String get gdtfPresetBlue => 'B';

  @override
  String get gdtfPresetColor1 => 'Color 1';

  @override
  String get gdtfPresetGobo1 => 'Gobo 1';

  @override
  String get gdtfPresetZoom => 'Zoom';

  @override
  String get gdtfPresetFocus => 'Enfocar';

  @override
  String get gdtfPresetPrism => 'Prisma';

  @override
  String get gdtfPresetEffect => 'Efecto';

  @override
  String get gdtfPresetControl => 'Control';

  @override
  String get commonApply => 'Aplicar';

  @override
  String get gdtfPresetLabel => 'Elección';

  @override
  String get gdtfPresetFixtureSimple => 'Fijación sencilla';

  @override
  String get gdtfPresetBarreLed => 'barra de LED';

  @override
  String get gdtfTemplatesHintShort =>
      'Elija un ajuste preestablecido y luego aplíquelo. Luego puede ajustar DMX, los valores predeterminados y reordenarlos arrastrando y soltando.';

  @override
  String get gdtfExportNeedChannels =>
      'Agrega al menos un canal para exportar.';

  @override
  String get homeDrawerContact => 'Contacta al desarrollador';

  @override
  String get homeDrawerSuggestItem => 'Enviar un artículo al catálogo';

  @override
  String get homeErrorOpenEmail =>
      'No se puede abrir la aplicación de correo electrónico.';

  @override
  String get homeErrorOpenForm => 'No se puede abrir el formulario.';

  @override
  String get homeContactEmailSubject => 'Pregunta sobre la aplicación My Tech';

  @override
  String get bpmManualHelp =>
      'Si se ingresa un BPM manual, tiene prioridad sobre el tap tempo.';

  @override
  String get bpmConversionsTitle => 'Conversiones';

  @override
  String get bpmActiveLabel => 'BPM activos';

  @override
  String get bpmMsPerBeat => 'Duración de un latido';

  @override
  String get bpmHz => 'Frecuencia';

  @override
  String get bpmSecPerBar44 => 'Duración de un compás (4/4)';

  @override
  String get bpmDisclaimer =>
      'Indicación aproximada. Consulta con el metrónomo si es crítico.';

  @override
  String get laserToolsTitle => 'Herramientas';

  @override
  String get laserBeamSizeTitle => 'Tamaño del haz';

  @override
  String get laserBeamSizeSubtitle =>
      'Diámetro, radio y área del punto a una distancia determinada.';

  @override
  String get laserBeamInputsTitle => 'Ajustes';

  @override
  String get laserBeamDistanceLabel => 'Distancia';

  @override
  String get laserBeamDistanceHint => 'm (ejemplo 12)';

  @override
  String get laserBeamFormulaHint =>
      'Cálculo: D(z) = D0 + θ · z (θ en rad, ángulo completo).';

  @override
  String get laserBeamResultsTitle => 'Resultados';

  @override
  String get laserBeamDiameterAtDistance => 'Diámetro a distancia';

  @override
  String get laserBeamRadiusAtDistance => 'Radio a distancia';

  @override
  String get laserBeamAreaAtDistance => 'Superficie puntual';

  @override
  String get sunTimesPageTitle => 'Amanecer/atardecer';

  @override
  String get sunTimesSelectionTitle => 'Ajustes';

  @override
  String get sunTimesCityLabel => 'Ciudad';

  @override
  String get sunTimesDateLabel => 'Fecha';

  @override
  String get sunTimesResultsTitle => 'Resultados';

  @override
  String get sunTimesSunriseLabel => 'Amanecer';

  @override
  String get sunTimesSunsetLabel => 'Atardecer';

  @override
  String get sunTimesDayLengthLabel => 'duración del día';

  @override
  String get sunTimesDisclaimer =>
      'Valores indicativos (modelo astronómico). Consulta con una fuente oficial si es necesario (evento, seguridad, filmación).';

  @override
  String get sunTimesThresholdTitle =>
      'Umbrales de brillo (puntos de referencia)';

  @override
  String get sunTimesThresholdIntro =>
      'Órdenes de magnitud útiles para anticipar la luz ambiental (muy variables según el clima, latitud, estación, obstáculos, contaminación lumínica).';

  @override
  String get sunTimesLuxDaylight =>
      'Luz diurna completa (excluyendo el sol directo)';

  @override
  String get sunTimesLuxOvercast => 'Nublado (típico)';

  @override
  String get sunTimesLuxSunrise => 'Amanecer/puesta (despejado)';

  @override
  String get sunTimesLuxCivilTwilight => 'Límite del crepúsculo civil (claro)';

  @override
  String get sunTimesLuxFullMoon => 'Luna llena (brillante)';

  @override
  String get sunTimesThresholdNote =>
      'Consejo: para marcar “utilizable sin iluminación”, normalmente buscamos > 100–300 lx. Para trabajos finos, más bien 500 lx y más.';

  @override
  String get sunTimesParamsTitle => 'Ajustes';

  @override
  String get sunTimesPickDate => 'Elige una fecha';

  @override
  String get sunTimesSunrise => 'Elevar';

  @override
  String get sunTimesSunset => 'para dormir';

  @override
  String get sunTimesDayLength => 'duración del día';

  @override
  String get sunTimesPolarNote =>
      'Nota: en zonas cercanas a los polos, la salida/puesta del sol puede estar ausente dependiendo de la temporada.';

  @override
  String get sunTimesLuxThresholdTitle =>
      'Umbrales de brillo (puntos de referencia)';

  @override
  String get sunTimesLuxBulletNightDark => 'Noche oscura: < 1 lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Noche (luna): ~0,1–1 lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Luna llena: ~0,1–0,3 lux';

  @override
  String get sunTimesLuxBulletCivilTwilight => 'Crepúsculo civil: Sol a -6°';

  @override
  String get sunTimesLuxBulletUrbanLow => 'Iluminación urbana baja: ~5–20 lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Oficina baja: ~100–300 lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Oficina estándar: ~300–500 lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'Durante el día en exteriores: ~10 000–25 000 lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Luz solar directa: ~100.000 lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Puntos de referencia indicativos: el tiempo/nubes, el medio ambiente, la estación y el relieve pueden variar mucho.';

  @override
  String get sunTimesTwilightTitle => 'Crepúsculo: ¿qué significa?';

  @override
  String get sunTimesTwilightCivil =>
      'Civil (-6°): luz aún suficiente para distinguir el ambiente sin iluminación artificial.';

  @override
  String get sunTimesTwilightNautical =>
      'Náutico (-12°): el horizonte se vuelve difícil de distinguir; estrellas visibles.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Astronómico (-18°): el cielo se considera \"negro\" (excluyendo la contaminación lumínica).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Ángulos expresados ​​en grados bajo el horizonte (Sol negativo).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Crepúsculo astronómico: Sol a -18°';

  @override
  String get sunTimesTimelineTitleStep30 => 'Línea de tiempo (no 30 min)';

  @override
  String get sunTimesTimelineColTime => 'Hora';

  @override
  String get sunTimesTimelineColElevation => 'Elevación';

  @override
  String get sunTimesTimelineColMarker => 'Marca';

  @override
  String get sunTimesTimelineColLux => 'Lux (orden)';

  @override
  String get sunTimesTimelineFootnote =>
      'Puntos de referencia indicativos (clima/nubes, medio ambiente, estación): útiles para preparar un espectáculo.';

  @override
  String get aboutUniverseToArtnetColSubnet => 'Subred';

  @override
  String appVersionLabel(Object version, Object build) {
    return 'Versión $version ($build)';
  }

  @override
  String appVersionLabelNoBuild(Object version) {
    return 'Versión $version';
  }

  @override
  String get aboutUniverseToArtnetColUniverse => 'Universo';

  @override
  String get videoLedResultWallResolution => 'Resolución de la pared';

  @override
  String get videoLedResultWallSize => 'Tamaño de la pared';

  @override
  String get videoLedResultTile => 'Losa';

  @override
  String get videoLedResultPitch => 'Paso';

  @override
  String get lightFilterLedTabConvert => 'Conversión';

  @override
  String get lightFilterLedTabProfiles => 'Mis accesorios';

  @override
  String get lightFilterLedSourceLabel => 'fuente de luz';

  @override
  String get lightFilterLedEngineRgbww => 'RGBWW (blanco cálido + frío)';

  @override
  String get lightFilterLedEngineRgbaw => 'RGBAW';

  @override
  String get lightFilterLedEngineRgbauv => 'RGBAUV';

  @override
  String get lightFilterLedEngineRgbwauv => 'RGBWAUV';

  @override
  String get lightFilterLedEngineRgbrcl => 'RGBRCL (rojo, cian, lima)';

  @override
  String get lightFilterLedEngineCmy => 'CMA';

  @override
  String get lightFilterLedSaveProfileTitle => 'Guardar perfil de dispositivo';

  @override
  String get lightFilterLedProfileNameLabel => 'Nombre del dispositivo';

  @override
  String get patchMvrViewTable => 'Hoja de cálculo';

  @override
  String get patchMvrViewVisual => 'Visual';

  @override
  String get consoleTitle => 'Consola';

  @override
  String get consoleSubtitle => 'Parche DMX y herramientas GDTF';

  @override
  String get consolePatchTitle => 'Parche DMX';

  @override
  String get consolePatchSubtitle => 'Importe un MVR y analice el parche';

  @override
  String get consoleGdtfTitle => '__TECNOLOGÍA_24__';

  @override
  String get consoleGdtfSubtitle => 'Crear o analizar un archivo GDTF';

  @override
  String get consoleMa3ForgeTitle => 'Forja del complemento MA3';

  @override
  String get consoleMa3ForgeSubtitle =>
      'Genere complementos de Lua para grandMA3 con IA';

  @override
  String lightFilterLedProfileSaved(String name) {
    return 'Perfil “$name” guardado';
  }

  @override
  String get lightFilterLedNoProfiles =>
      'No se ha guardado ningún perfil de dispositivo';

  @override
  String get lightFilterLedNoProfilesHint =>
      'Calibre los canales en la pestaña Conversión,\nluego guarda con el ícono 💾.';

  @override
  String get lightFilterLedTitle => 'Filtros LED a juego';

  @override
  String get lightFilterLedDescription =>
      'Conversión de filtros LEE, Rosco… a motores LED (RGB, RGBA, RGBW, etc.).';

  @override
  String get lightFilterLedBrandLabel => 'Marca';

  @override
  String get lightFilterLedSearchLabel => 'Investigación';

  @override
  String get lightFilterLedSearchHint => 'Código o nombre del filtro';

  @override
  String get lightFilterLedFilterLabel => 'Filtrado';

  @override
  String get lightFilterLedEngineLabel => 'motor LED';

  @override
  String get lightFilterLedShowPercentLabel => 'Mostrar como porcentaje';

  @override
  String get lightFilterLedShowPercentHint =>
      'De lo contrario, los valores se muestran como DMX 0–255.';

  @override
  String get lightFilterLedHexLabel => 'Color de referencia';

  @override
  String get lightFilterLedChromaticityLabel => 'cromaticidad';

  @override
  String get lightFilterLedTransmissionLabel => 'Transmisión';

  @override
  String get lightFilterLedResultTitle => 'Resultado';

  @override
  String get lightFilterLedOriginalPreviewLabel => 'Vista previa del filtro';

  @override
  String get lightFilterLedApproximatePreviewLabel =>
      'Descripción general de los LED';

  @override
  String get lightFilterLedDisclaimer =>
      'Resultado sólo indicativo. La representación real depende del proyector, su espectro, su calibración, su modo de color y el contexto de uso.';

  @override
  String get lightFilterLedEngineRgb => 'RGB';

  @override
  String get lightFilterLedEngineRgba => 'RGBA';

  @override
  String get lightFilterLedEngineRgbw => 'RGBW';

  @override
  String get lightFilterLedEngineRgbl => 'RGBL';

  @override
  String get lightFilterLedEngineRgbwa => 'RGBWA';

  @override
  String get lightFilterLedEngineRgbal => 'RGBAL';

  @override
  String get aboutSearchHint => 'Buscar en referencias';

  @override
  String get aboutSearchNoResults => 'No se encontraron resultados.';

  @override
  String get homePinnedTitle => 'Patas';

  @override
  String get homePinnedSubtitle =>
      'Encuentre rápidamente sus referencias fijadas.';

  @override
  String get pinnedReferencesTitle => 'Referencias fijadas';

  @override
  String get pinnedReferencesEmpty =>
      'No hay referencias fijadas por el momento.';

  @override
  String get aboutPinAddTooltip => 'Fijar esta referencia';

  @override
  String get aboutPinRemoveTooltip => 'Quitar este pin';

  @override
  String get aboutPinAddedMessage => 'Referencia fijada.';

  @override
  String get aboutPinRemovedMessage => 'Se quitó el pasador.';

  @override
  String get homeDrawerSubscriptions => 'Suscripciones';

  @override
  String get subscriptionPageTitle => 'Suscripciones';

  @override
  String get subscriptionHeadlineAllTitle => 'Elige tu fórmula';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'Encuentre sus compras actuales y suscripciones aún disponibles aquí.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return 'Desbloquear $module';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'Puedes comprar solo Video o elegir Pro para desbloquear todo.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'Puedes comprar solo Light o elegir Pro para desbloquear todo.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'Puedes comprar solo Laser o elegir Pro para desbloquear todo.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'Puedes comprar solo la Consola o elegir Pro para desbloquear todo.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Acceso completo a todas las secciones avanzadas.';

  @override
  String get subscriptionStoreUnavailable =>
      'Tienda actualmente no disponible.';

  @override
  String get subscriptionLoadError => 'No se pueden cargar las suscripciones.';

  @override
  String get subscriptionRestorePurchases => 'Restaurar mis compras';

  @override
  String get subscriptionPrivacy => 'Confidencialidad';

  @override
  String get subscriptionTerms => 'UGE';

  @override
  String get subscriptionBestValue => 'MEJOR VALOR';

  @override
  String get subscriptionOwned => 'Compró';

  @override
  String get subscriptionIncludedInPro => 'Incluido en Pro';

  @override
  String get subscriptionProductUnavailable => 'Producto no disponible.';

  @override
  String get subscriptionSubscribeAll => 'Suscribirse - Desbloquear todo';

  @override
  String subscriptionSubscribeModule(Object module) {
    return 'Suscríbete - $module';
  }

  @override
  String get subscriptionCategoryVideoTitle => 'Video';

  @override
  String get subscriptionCategoryLightTitle => 'Luz';

  @override
  String get subscriptionCategoryLaserTitle => 'Láser';

  @override
  String get subscriptionCategoryConsoleTitle => 'Consola';

  @override
  String get subscriptionCategoryProTitle => 'Herramientas ShowTech Pro';

  @override
  String get subscriptionCategoryVideoDescription =>
      'Accede a la sección de Vídeos.';

  @override
  String get subscriptionCategoryLightDescription =>
      'Acceso a la sección de Luz.';

  @override
  String get subscriptionCategoryLaserDescription =>
      'Acceso a la sección Láser.';

  @override
  String get subscriptionCategoryConsoleDescription =>
      'Acceso a la sección Consola.';

  @override
  String get subscriptionCategoryProDescription =>
      'Acceso completo a todas las secciones.';

  @override
  String get electricityFreeSection => 'Gratis';

  @override
  String get electricityProSection => 'Suscripción de electricidad';

  @override
  String get riggingFreeSection => 'Gratis';

  @override
  String get riggingProSection => 'Suscripción Rigging';

  @override
  String get videoFreeSection => 'Gratis';

  @override
  String get videoProSection => 'Suscripción de vídeo';

  @override
  String get lumiereFreeSection => 'Gratis';

  @override
  String get lumiereProSection => 'Suscripción de iluminación';

  @override
  String get consoleFreeSection => 'Gratis';

  @override
  String get consoleProSection => 'Suscripción de consola';

  @override
  String get lumiereFilterEquivDescription =>
      'Equivalencias Lee ↔ Roscolux ↔ e-colour+';

  @override
  String get audioSplModeDistance => 'Distancia → SPL';

  @override
  String get audioSplModePower => 'Potencia → SPL';

  @override
  String get homeElectricityTitle => 'Electricidad';

  @override
  String get homeElectricitySubtitle =>
      'Potencia, corriente, secciones de cables y autonomía del SAI.';

  @override
  String get subscriptionCategoryElectricityTitle => 'Electricidad';

  @override
  String get subscriptionCategoryElectricityDescription =>
      'Herramientas eléctricas para potencia, fases, cables y UPS.';

  @override
  String get subscriptionCategoryRiggingTitle => '__TECNOLOGÍA_18__';

  @override
  String get subscriptionCategoryRiggingDescription =>
      'Herramientas de aparejo para brida, ángulos y verificación WLL / CMU.';

  @override
  String get subscriptionHeadlineElectricitySubtitle =>
      'Desbloquea todas las herramientas eléctricas profesionales.';

  @override
  String get subscriptionHeadlineRiggingSubtitle =>
      'Desbloquea todas las herramientas de montaje profesionales.';

  @override
  String get electricityTitle => 'Electricidad';

  @override
  String get electricityToolPowerCurrentTitle => 'Potencia/corriente';

  @override
  String get electricityToolPowerCurrentSubtitle =>
      'Calcula potencia, corriente, voltaje o energía en monofásico o trifásico.';

  @override
  String get electricityToolPhasePowerTitle => 'Potencia por fase';

  @override
  String get electricityToolPhasePowerSubtitle =>
      'Distribuir una potencia total y leer la corriente por fase.';

  @override
  String get electricityToolLoadBalancerTitle => 'Distribución de carga';

  @override
  String get electricityToolLoadBalancerSubtitle =>
      'Añade luminarias del catálogo, asigna por fase y consulta el amperaje de tu panel.';

  @override
  String get electricityToolGeneratorTitle => 'Grupo electrógeno';

  @override
  String get electricityPowerFactorToolTitle => 'Factor de potencia (kVA ↔ kW)';

  @override
  String get electricityToolPowerFactorSubtitle =>
      'Convierte potencia aparente (kVA) y activa (kW) mediante cos φ en ambos sentidos, con la potencia reactiva (kVAR).';

  @override
  String get electricityPowerFactorModeTitle => 'Sentido del cálculo';

  @override
  String get electricityPowerFactorModeKvaToKw => 'kVA → kW';

  @override
  String get electricityPowerFactorModeKwToKva => 'kW → kVA';

  @override
  String get electricityPowerFactorInputsTitle => 'Datos conocidos';

  @override
  String get electricityPowerFactorApparentLabel => 'Potencia aparente';

  @override
  String get electricityPowerFactorApparentHint => 'Ej.: 10';

  @override
  String get electricityPowerFactorActiveLabel => 'Potencia activa';

  @override
  String get electricityPowerFactorActiveHint => 'Ej.: 8';

  @override
  String get electricityPowerFactorCosPhiLabel => 'Factor de potencia (cos φ)';

  @override
  String get electricityPowerFactorCosPhiHint => '0.1 – 1.0, ej.: 0.8';

  @override
  String get electricityPowerFactorResultsTitle => 'Resultados';

  @override
  String get electricityPowerFactorReactiveLabel => 'Potencia reactiva';

  @override
  String get electricityPowerFactorAngleLabel => 'Ángulo de desfase';

  @override
  String get electricityPowerFactorEnterValues =>
      'Introduce los valores para ver el resultado.';

  @override
  String get electricityPowerFactorFormulaNote =>
      'kW = kVA × cos φ · kVA = kW / cos φ · kVAR = √(kVA² − kW²). cos φ = 1 significa una carga puramente resistiva (sin potencia reactiva).';

  @override
  String get electricityToolGeneratorSubtitle =>
      'Dimensionado: potencia activa → kVA, factor de simultaneidad, margen de seguridad, tamaño estándar recomendado.';

  @override
  String get electricityGeneratorInputsTitle => 'Carga a alimentar';

  @override
  String get electricityGeneratorActivePowerLabel =>
      'Potencia activa instalada';

  @override
  String get electricityGeneratorActivePowerHint =>
      'Suma de las potencias activas (ver repartidor de cargas)';

  @override
  String get electricityGeneratorCosPhiLabel => 'Cos φ medio';

  @override
  String get electricityGeneratorCosPhiHint =>
      '0,85–0,95 típico (reguladores, LED, amplis)';

  @override
  String get electricityGeneratorDiversityLabel => 'Factor de simultaneidad';

  @override
  String get electricityGeneratorDiversityHint =>
      '% de la potencia instalada realmente solicitada al mismo tiempo';

  @override
  String get electricityGeneratorMarginLabel => 'Margen de seguridad';

  @override
  String get electricityGeneratorMarginHint =>
      'Margen recomendado para arranques y picos';

  @override
  String get electricityGeneratorFuelRateLabel => 'Consumo específico';

  @override
  String get electricityGeneratorFuelRateHint =>
      '≈0,25 L/kWh típico para un diésel bien cargado';

  @override
  String get electricityGeneratorResultsTitle => 'Grupo recomendado';

  @override
  String get electricityGeneratorRecommendedLabel =>
      'Tamaño estándar recomendado';

  @override
  String get electricityGeneratorRecommendedOverMax =>
      '> 800 kVA — dimensionado a medida, consulta a un proveedor';

  @override
  String get electricityGeneratorApparentNeededLabel =>
      'Potencia aparente necesaria';

  @override
  String get electricityGeneratorCurrentLabel => 'Corriente estimada en salida';

  @override
  String get electricityGeneratorFuelPerHourLabel => 'Consumo estimado';

  @override
  String get electricityGeneratorFuelPerShowLabel => 'En 8 h de show';

  @override
  String get electricityGeneratorEnterValues =>
      'Introduce la potencia activa para calcular';

  @override
  String get electricityGeneratorDisclaimer =>
      'Estimación indicativa — verifica siempre con las recomendaciones del proveedor/fabricante del grupo (altitud, temperatura, cargas no lineales).';

  @override
  String get electricityToolCableSectionTitle => 'Sección de cables';

  @override
  String get electricityToolCableSectionSubtitle =>
      'Calcular una sección según corriente o potencia, longitud, caída de tensión y referencia del cable.';

  @override
  String get electricityToolUpsTitle => 'Autonomía del SAI';

  @override
  String get electricityToolUpsSubtitle =>
      'Estimar la autonomía de una batería o un SAI en función de la carga.';

  @override
  String get electricityInputsTitle => 'Entrantes';

  @override
  String get electricityResultsTitle => 'Resultados';

  @override
  String get electricityEnterValuesToCalculate =>
      'Ingresa valores válidos para calcular.';

  @override
  String get electricityTotalPowerLabel => 'poder total';

  @override
  String get electricityTotalPowerHint => 'Ex. 22000';

  @override
  String get electricityPowerPerPhaseLabel => 'Potencia por fase';

  @override
  String get electricityCurrentPerPhaseLabel => 'Corriente por fase';

  @override
  String get electricityCurrentLabel => 'Fluido';

  @override
  String get electricityPhaseCountLabel => 'Número de fases';

  @override
  String get electricityConsumptionCurrentLabel => 'Consumo / corriente real';

  @override
  String get electricityConsumptionCurrentHint => '32';

  @override
  String get electricityBreakerSizeLabel => 'Tamaño del disyuntor';

  @override
  String get electricityBreakerSizeHint => '32';

  @override
  String get electricityCableLengthLabel => 'Longitud del cable';

  @override
  String get electricityCableLengthHint => 'Ejemplo 30';

  @override
  String get electricityAllowedVoltageDropLabel => 'Caída de tensión máxima';

  @override
  String get electricityAllowedVoltageDropHint => 'Ejemplo 3';

  @override
  String get electricityRecommendedCableSectionLabel => 'Sección recomendada';

  @override
  String get electricityMaxCurrentForSectionLabel => 'Corriente permitida';

  @override
  String get electricityVoltageDropLabel => 'Caída de voltaje';

  @override
  String get electricityBreakerCheckLabel => 'Verificación del disyuntor';

  @override
  String get electricityStatusOk => 'Bueno';

  @override
  String get electricityStatusWarning => 'Para ser revisado';

  @override
  String get electricityImportantNoteTitle => 'Nota importante';

  @override
  String get electricityCableSectionDisclaimer =>
      'Cálculo indicativo basado en una tabla de referencia inspirada en la norma IEC 60364-5-52. Compruebe siempre el RGIE/AREI, el método de instalación real, la temperatura, la agrupación de cables y la protección con un electricista cualificado.';

  @override
  String get electricityConsumptionInputTypeTitle => 'Valor conocido';

  @override
  String get electricityInputCurrent => 'Corriente (A)';

  @override
  String get electricityInputPower => 'Potencia (W)';

  @override
  String get electricityVoltageLabel => 'Voltaje (U)';

  @override
  String get electricityVoltageHint => 'Ex. 230 o 400';

  @override
  String get electricityPowerFactorLabel => 'Factor de potencia (cos φ)';

  @override
  String get electricityPowerFactorHint => 'Ejemplo 1.0';

  @override
  String get electricityCableReferenceTitle => 'Referencia de cables';

  @override
  String get electricityCopper => 'Cobre';

  @override
  String get electricityAluminium => 'Aluminio';

  @override
  String get electricityInsulationPvc => 'PVC 70°C';

  @override
  String get electricityInsulationXlpe => 'XLPE 90°C';

  @override
  String get electricityInstallConduit => 'Impulsado';

  @override
  String get electricityInstallFreeAir => 'aire libre';

  @override
  String get electricityCalculatedCurrentLabel => 'Corriente calculada';

  @override
  String get electricityRecommendedBreakerLabel => 'Disyuntor recomendado';

  @override
  String get electricityNoStandardBreaker => 'Ningún calibre estándar adecuado';

  @override
  String get electricityStatusLabel => 'Estado';

  @override
  String get electricityCircuitTypeTitle => 'Tipo de circuito';

  @override
  String get electricitySinglePhase => 'monofásico';

  @override
  String get electricityThreePhase => 'trifásico';

  @override
  String get electricityResultActivePower => 'potencia activa';

  @override
  String get electricityResultCurrent => 'Fluido';

  @override
  String get electricityResultVoltage => 'Tensión';

  @override
  String get electricityResultEnergy => 'Energía';

  @override
  String get electricityInsufficient => 'Valores insuficientes';

  @override
  String get electricityCalcPower => 'Fuerza';

  @override
  String get electricityCalcCurrent => 'Fluido';

  @override
  String get electricityCalcVoltage => 'Tensión';

  @override
  String get electricityCalcEnergy => 'Energía';

  @override
  String get electricityRef16AMono => '16 A mono';

  @override
  String get electricityRef32AMono => '32 A mono';

  @override
  String get electricityRef32ATri => '32 Una especie';

  @override
  String get electricityRef63ATri => '63 ordenados';

  @override
  String get electricityRef125ATri => '125 un tri';

  @override
  String get electricityFormulaTri => 'P = √3 × U × I × cos φ';

  @override
  String get electricityFormulaMono => 'P = U × I × cos φ';

  @override
  String get electricityFormulaTriDesc =>
      'Fórmula trifásica para una carga equilibrada.';

  @override
  String get electricityFormulaMonoDesc => 'Fórmula monofásica.';

  @override
  String get electricityCircuitType => 'Tipo de circuito';

  @override
  String get electricityMono => 'Mononucleosis infecciosa';

  @override
  String get electricityMonoDesc => 'Circuito monofásico de 230 V.';

  @override
  String get electricityThreePhaseDesc => 'Circuito trifásico de 400 V.';

  @override
  String get electricityCalcFor => 'Calcular';

  @override
  String get electricityFieldPower => 'Fuerza';

  @override
  String get electricityFieldPowerHint => 'Ex. 3680';

  @override
  String get electricityFieldCurrent => 'Fluido';

  @override
  String get electricityFieldCurrentHint => 'Ejemplo 16';

  @override
  String get electricityFieldVoltage => 'Tensión';

  @override
  String get electricityFieldVoltageHint => '230';

  @override
  String get electricityFieldDuration => 'Duración';

  @override
  String get electricityFieldDurationHint => 'Ejemplo 2';

  @override
  String get electricityFieldPf => 'porque φ';

  @override
  String get electricityFieldPfHint => 'Ejemplo 1.0';

  @override
  String get electricityCalculate => 'Calcular';

  @override
  String get electricityRefTitle => 'Referencias rápidas';

  @override
  String electricityUpsEnergyAvail(String energy) {
    return '$energy Cuándo disponible';
  }

  @override
  String get electricityUpsBatterySection => 'Batería';

  @override
  String get electricityUpsCalculate => 'Calcular autonomía';

  @override
  String get electricityUpsCapacityHint => 'Ejemplo 100';

  @override
  String get electricityUpsCapacityLabel => 'Capacidad';

  @override
  String get electricityUpsCountHint => 'Ejemplo 1';

  @override
  String get electricityUpsCountLabel => 'Número de baterías';

  @override
  String get electricityUpsEfficiencyHint => 'Ex. 85';

  @override
  String get electricityUpsEfficiencyLabel => 'Producir';

  @override
  String get electricityUpsLoadDesc => 'Energía consumida por el equipo.';

  @override
  String get electricityUpsLoadHint => 'Ex. 500';

  @override
  String get electricityUpsLoadLabel => 'Cargar';

  @override
  String get electricityUpsLoadSectionTitle => 'Carga a suministrar';

  @override
  String get electricityUpsRef1 => '¿Está disponible?';

  @override
  String get electricityUpsRef1Detail =>
      'Capacidad × voltaje × número × eficiencia.';

  @override
  String get electricityUpsRef2 => 'Autonomía';

  @override
  String get electricityUpsRef2Detail =>
      'Energía disponible dividida por carga.';

  @override
  String get electricityUpsRef3Title => 'Resultado indicativo';

  @override
  String get electricityUpsRef3Value =>
      'El valor real depende de la eficiencia, el estado de las baterías y la carga.';

  @override
  String get electricityUpsRefTitle => 'Referencias';

  @override
  String get electricityUpsVoltageHint => 'Ejemplo 12';

  @override
  String get electricityUpsVoltageLabel => 'Voltaje de la batería';

  @override
  String get riggingToolBridleTitle => 'brida de 2 puntos';

  @override
  String get riggingToolBridleSubtitle =>
      'Cálculo completo de una brida: longitudes, ángulos, tensiones y estado de seguridad.';

  @override
  String get riggingToolAngleFactorTitle => 'factor de ángulo';

  @override
  String get riggingToolAngleFactorSubtitle =>
      'Vea rápidamente el efecto del ángulo sobre la tensión en los hilos.';

  @override
  String get riggingToolMultiPointTitle => 'Bridaje multipunto';

  @override
  String get riggingToolMultiPointSubtitle =>
      'Tensión por ramal para un bridaje simétrico de 2 a 8 puntos, con verificación WLL.';

  @override
  String get riggingLegCountLabel => 'Número de ramales';

  @override
  String get riggingWllPerLegLabel => 'WLL por ramal';

  @override
  String get riggingMultiPointSymmetricNote =>
      'Válido para un bridaje simétrico: ramales de igual longitud, carga centrada, tensión repartida por igual. Para una configuración asimétrica o compleja, recurre a un rigger cualificado o a un software certificado.';

  @override
  String get riggingToolHoistTitle => 'Selector de polipasto';

  @override
  String get riggingToolHoistSubtitle =>
      'Carga a izar → tamaño de polipasto estándar recomendado, con margen de seguridad.';

  @override
  String get riggingHoistRecommendedLabel => 'Polipasto recomendado';

  @override
  String get riggingHoistOverMaxLabel =>
      '> 10.000 kg — fuera de la gama estándar, consulta a un especialista en izado';

  @override
  String get riggingHoistAvailabilityNote =>
      'Tamaños estándar indicativos (0,125 a 10 t) — la disponibilidad real depende del fabricante y del proveedor.';

  @override
  String get riggingToolWllTitle => 'Verificación WLL / CMU';

  @override
  String get riggingToolWllSubtitle =>
      'Compare una carga aplicada con la capacidad del material.';

  @override
  String get riggingToolLengthTitle => 'Longitud de brida';

  @override
  String get riggingToolLengthSubtitle =>
      'Calcula longitudes y ángulos sin cálculo de carga.';

  @override
  String get riggingKnownDrop => 'Flecha';

  @override
  String get riggingKnownAngle => 'Esquina';

  @override
  String get riggingKnownLength => 'Longitud';

  @override
  String get riggingAngleFromHorizontalLabel => 'Ángulo desde la horizontal';

  @override
  String get riggingLegLengthKnownLabel => 'Longitud de una hebra';

  @override
  String get riggingLoadWeightLabel => 'Peso de carga';

  @override
  String get riggingLoadShortLabel => 'Cargar';

  @override
  String get riggingPointALabel => 'TIENE';

  @override
  String get riggingPointBLabel => 'B';

  @override
  String get riggingTensionLabel => 'Tensión';

  @override
  String get riggingTensionLeftLabel => 'tensión izquierda';

  @override
  String get riggingTensionRightLabel => 'tensión recta';

  @override
  String get riggingTensionPerLegLabel => 'Tensión por hebra';

  @override
  String get riggingStatusOk => 'Bueno';

  @override
  String get riggingStatusWatch => 'para mirar';

  @override
  String get riggingStatusHigh => 'Alumno';

  @override
  String get riggingStatusDanger => 'Peligroso';

  @override
  String get riggingStatusOkDescription =>
      'Ángulo cómodo. La tensión sigue siendo razonable.';

  @override
  String get riggingStatusWatchDescription =>
      'Ángulo utilizable, pero la tensión comienza a aumentar.';

  @override
  String get riggingStatusHighDescription =>
      'Ángulo bajo. La tensión aumenta bruscamente.';

  @override
  String get riggingStatusDangerDescription =>
      'Ángulo muy bajo. Configuración a evitar.';

  @override
  String get riggingSafetyDisclaimer =>
      'Resultado indicativo. Siempre verifique el CMU/WLL real, los factores de seguridad y las reglas aplicables.';

  @override
  String get riggingInvalidInputsMessage =>
      'Entre valores positivos y consistentes.';

  @override
  String get riggingAngleFactorLabel => 'factor multiplicador';

  @override
  String get riggingAngleFactorExplanation =>
      'Cuanto menor es el ángulo con respecto a la horizontal, más aumenta la tensión en cada hilo.';

  @override
  String get riggingWllLabel => 'WLL / CMU de hardware';

  @override
  String get riggingAppliedLoadLabel => 'Carga aplicada';

  @override
  String get riggingSafetyFactorLabel => 'factor de seguridad';

  @override
  String get riggingRequiredLoadLabel => 'Cargar para comprobar';

  @override
  String get riggingWllUsageLabel => 'Utilice WLL';

  @override
  String get riggingMarginLabel => 'Margen restante';

  @override
  String get riggingWllStatusOkDescription =>
      'La capacidad del hardware es suficiente para esta carga.';

  @override
  String get riggingWllStatusWatchDescription =>
      'La capacidad sigue siendo suficiente, pero el margen es bajo.';

  @override
  String get riggingWllStatusDangerDescription =>
      'La carga excede la capacidad indicada.';

  @override
  String get riggingLengthDifferenceLabel => 'Diferencia de longitud';

  @override
  String get riggingCalculationModeLabel => 'Tipo de cálculo';

  @override
  String get riggingGeometryOnlyLabel => 'sin carga';

  @override
  String get riggingWithLoadLabel => 'Con carga';

  @override
  String get riggingGeometryOnlyDescription =>
      'Sólo modo geometría: longitudes, flechas y ángulos. Sin cálculo de voltaje o carga.';

  @override
  String get riggingKnownInputLabel => 'Sé';

  @override
  String get homeConversionsTitle => 'Conversiones';

  @override
  String get homeConversionsSubtitle =>
      'Unidades, distancia, video, audio, DMX y conversiones de campo.';

  @override
  String get conversionsTitle => 'Conversiones';

  @override
  String get conversionsDistanceTitle => 'Distancia';

  @override
  String get conversionsTemperatureTitle => 'Temperatura';

  @override
  String get conversionsAnglesTitle => 'Anglos';

  @override
  String get conversionsVideoTitle => 'Video';

  @override
  String get conversionsAudioTitle => 'Audio';

  @override
  String get conversionsDmxTitle => '__TECNOLOGÍA_0__';

  @override
  String get conversionsSwap => 'Contrarrestar';

  @override
  String get conversionsDisclaimer =>
      'Sólo indicación. Verifique siempre los valores críticos con la documentación del fabricante.';

  @override
  String get conversionMetersFeet => 'Metros <> pies';

  @override
  String get conversionCentimetersInches => 'Centímetros <> pulgadas';

  @override
  String get conversionMetersYards => 'Metros <> yardas';

  @override
  String get conversionCelsiusFahrenheit => 'Celsius <> Fahrenheit';

  @override
  String get conversionDegreesRadians => 'Grados <> radianes';

  @override
  String get conversionSlopePercentDegrees => 'Pendiente % <> grados';

  @override
  String get conversionNitsFootLambert => 'Liendres <> foot-lambert';

  @override
  String get conversionFpsFrameTime => 'FPS <> duración del cuadro';

  @override
  String get conversionBpmMs => 'BPM <> milisegundos';

  @override
  String get conversionDelayDistance => 'Retraso <> distancia';

  @override
  String get conversionDmxPercent => 'DMX <>%';

  @override
  String get conversionEightBitSixteenBit => '8 bits <> 16 bits';

  @override
  String get subscriptionDurationYear => 'suscripción de 1 año';

  @override
  String get conversionAudioLevel => 'dBu/dBV/V';

  @override
  String get conversionDmxAbsolute => 'Universo <> DMX absoluto';

  @override
  String get conversionDmxToAbsoluteHint => 'Universo + dirección → absoluto';

  @override
  String get conversionDmxFromAbsoluteHint => 'Absoluto → universo + dirección';

  @override
  String get conversionDmxUniverseLabel => 'Universo';

  @override
  String get conversionDmxAddressLabel => 'Dirección';

  @override
  String get conversionDmxAbsoluteLabel => 'DMX absoluto';

  @override
  String get gdtfTitle => '__TECNOLOGÍA_24__';

  @override
  String get gdtfSearchTab => 'Investigación';

  @override
  String get gdtfGenerateFromPdfTab => 'Generar desde PDF';

  @override
  String get gdtfSearchHint => 'Ej: Martin MAC Aura, Chauvet Rogue…';

  @override
  String get gdtfFixtureNameLabel => 'Nombre del dispositivo';

  @override
  String get gdtfSearchInfo =>
      'Busque en la base de datos de acciones GDTF (más de 6000 partidos).\nSi no lo encuentra, utilice la pestaña \"Generar desde PDF\".';

  @override
  String get gdtfNoFixtureFound => 'No se encontraron accesorios';

  @override
  String get gdtfNoFixtureFoundHelp =>
      'Puede generar un GDTF a partir del PDF en el manual.';

  @override
  String get gdtfGenerateFromPdfTitle => 'Generar un GDTF a partir de un PDF';

  @override
  String get gdtfGenerateFromPdfIntro =>
      'Sube el manual técnico de tu aparato. La IA extrae los modos DMX: usted verifica y corrige antes de generar el archivo.\n\n⚠️ Clave del éxito: introduce el nombre exacto de la máquina tal y como aparece en el manual. Y si agrega modos manualmente, use los nombres de modo exactos DMX; de lo contrario, la IA no encontrará los datos correctos.';

  @override
  String get gdtfManufacturerHint => 'Ej: Martín, Chauvet, Robe…';

  @override
  String get gdtfModelHint => 'Ej: MAC Aura XIP, Rogue R2X…';

  @override
  String get gdtfSelectManualPdf => 'Seleccione PDF del manual';

  @override
  String get gdtfDetectingModes => 'Detección de modo…';

  @override
  String get gdtfAnalyzePdf => 'Analizar el PDF';

  @override
  String get gdtfAnalyzePdfHelp =>
      'La IA detecta los modos DMX disponibles en el manual. Luego elige cuáles extraer antes de generar el archivo.';

  @override
  String get gdtfBackToForm => 'Volver al formulario';

  @override
  String gdtfDetectedModesInManual(int count) {
    return '$count modo(s) DMX detectado en el manual';
  }

  @override
  String get gdtfSearchModeHint => 'Buscar un modo…';

  @override
  String get gdtfSelectAll => 'Todo';

  @override
  String get gdtfSelectNone => 'Ninguno';

  @override
  String gdtfSelectedModesCount(int selected, int total) {
    return '$selected seleccionado el $total';
  }

  @override
  String get gdtfNoModeMatchesSearch => 'Ningún modo coincide con la búsqueda.';

  @override
  String gdtfDmxChannelCount(int count) {
    return '$count canales DMX';
  }

  @override
  String get gdtfExtractionInProgressLong =>
      'Extracción en progreso... esto puede tardar hasta 10 minutos según el manual. No cierres la aplicación.';

  @override
  String get gdtfExtractionMayTakeLong =>
      'La extracción puede tardar hasta 10 minutos dependiendo del tamaño del manual y la cantidad de modos seleccionados.';

  @override
  String get gdtfExtractingChannels => 'Extracción de canales…';

  @override
  String gdtfExtractModes(int count) {
    return 'Extraer $count modo(s)';
  }

  @override
  String get gdtfBackToModeSelection => 'Volver a la selección de modo';

  @override
  String gdtfDetectedModesCount(int count) {
    return '$count modo(s) detectado(s)';
  }

  @override
  String gdtfUnextractedModesCount(int count) {
    return '$count modo(s) no extraídos';
  }

  @override
  String get gdtfGenerating => 'Generación…';

  @override
  String get gdtfGenerateGdtfFile => 'Generar el archivo .gdtf';

  @override
  String get gdtfModeNameHint => 'Nombre del modo';

  @override
  String gdtfChannelCount(int count) {
    return '$count canales';
  }

  @override
  String get gdtfChannelShort => 'Ch';

  @override
  String get gdtfBits => 'bits';

  @override
  String get gdtfName => 'Nombre';

  @override
  String get gdtfDefaultValueLabel => 'Valor predeterminado (0-255):';

  @override
  String get gdtfValueRangesLabel => 'Rangos de valores / Subfunciones:';

  @override
  String get gdtfValueRangesHint =>
      'ej: 0-9=cerrado, 10-100=estroboscópico lento, 255=abierto';

  @override
  String get gdtfAddChannel => 'Agregar un canal';

  @override
  String get gdtfFileGenerated => '¡Archivo generado!';

  @override
  String get gdtfShareGdtfFile => 'Comparte el archivo .gdtf';

  @override
  String get gdtfGenerateAnotherFile => 'Generar otro archivo';

  @override
  String get gdtfGmailIosTitle => '¿Gmail en iOS? Lee esto 👀';

  @override
  String get gdtfGmailIosWarning =>
      'Gmail en iOS a menudo bloquea los archivos adjuntos .gdtf (\"no se puede adjuntar el archivo\"). Consejo: cambie el nombre del archivo a .zip antes de enviarlo; el destinatario lo renombra a .gdtf después de recibirlo. WhatsApp, Messenger y AirDrop funcionan sin problemas.';

  @override
  String get gdtfDownload => 'Descargar';

  @override
  String gdtfModeFootprint(String name, int count) {
    return '$name (${count}canal)';
  }

  @override
  String gdtfDownloadingFixture(String fixture) {
    return 'Descargando $fixture…';
  }

  @override
  String gdtfErrorStatus(int statusCode) {
    return 'Error $statusCode';
  }

  @override
  String gdtfErrorStatusParentheses(int statusCode) {
    return 'Error ($statusCode)';
  }

  @override
  String gdtfNetworkError(String error) {
    return 'Error de red: $error';
  }

  @override
  String gdtfErrorDetails(String error) {
    return 'Error: $error';
  }

  @override
  String get gdtfErrorFillManufacturerAndModel =>
      'Complete el fabricante y modelo.';

  @override
  String get gdtfErrorSelectPdf => 'Selecciona un archivo PDF.';

  @override
  String get gdtfErrorCannotExtractDmxPages =>
      'No se pueden extraer las páginas DMX de PDF.';

  @override
  String get gdtfUnknownError => 'Error desconocido';

  @override
  String get gdtfUnknownErrorLowercase => 'error desconocido';

  @override
  String get gdtfNoDmxModeDetected =>
      'No se detectaron modos DMX en el manual.';

  @override
  String get gdtfErrorSelectAtLeastOneMode =>
      'Selecciona al menos un modo para extraer.';

  @override
  String get gdtfErrorManualDataLost =>
      'Datos manuales perdidos, reiniciar el análisis.';

  @override
  String get mireVideoPageTitle => 'Objetivos de pantalla de vídeo';

  @override
  String get mireVideoWidthPxLabel => 'Ancho (px)';

  @override
  String get mireVideoHeightPxLabel => 'Altura (píxeles)';

  @override
  String get mireVideoProjectorCountLabel => 'Número de proyectores (N)';

  @override
  String get mireVideoOverlapPercentLabel => 'Superposición (%)';

  @override
  String get mireVideoHint1920 => 'ejemplo: 1920';

  @override
  String get mireVideoHint1080 => 'por ejemplo: 1080';

  @override
  String get mireVideoHint3840 => 'Ej: 3840';

  @override
  String get mireVideoHint2160 => 'Ej: 2160';

  @override
  String get mireVideoHint2 => 'Ej: 2';

  @override
  String get mireVideoHint10Percent => 'por ejemplo: 10.0';

  @override
  String get mireVideoTestPatternTypeLabel => 'tipo de vista';

  @override
  String get mireVideoSimpleTypeComboAll =>
      'Combo (cuadrícula + círculos + 2 barras centradas)';

  @override
  String get mireVideoSimpleTypeGridSafe =>
      'Cuadrícula + caja fuerte + círculos';

  @override
  String get mireVideoSimpleTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoSimpleTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireVideoSimpleTypeCheckerboard => 'Tablero de ajedrez + círculos';

  @override
  String get mireVideoExportPngButton => 'Exportar PNG';

  @override
  String get mireVideoOrientationLabel => 'Orientación';

  @override
  String get mireVideoOrientationHorizontal => 'Horizontal';

  @override
  String get mireVideoOrientationVertical => 'Vertical';

  @override
  String get mireVideoMappingTypeLabel => 'Tipo de mapeo';

  @override
  String get mireVideoMappingTypeCombo =>
      'Combo (zonas + superposición + fusión)';

  @override
  String get mireVideoMappingTypeZonesAndOverlap => 'Zonas + superposición';

  @override
  String get mireVideoMappingTypeBlendRamps => 'Rampas de mezcla';

  @override
  String get mireVideoErrorInvalidWidthHeight => '❌ Ancho/alto (px) no válido.';

  @override
  String get mireVideoErrorInvalidProjectorCount =>
      '❌ Número de proyectores no válido (N > 0).';

  @override
  String get mireVideoErrorInvalidOverlap =>
      '❌ Superposición no válida (0 a 99,9).';

  @override
  String get cinemaTitle => 'Cine / Cine';

  @override
  String get cinemaIntroTitle => 'Herramientas de cine y filmación.';

  @override
  String get cinemaIntroBody =>
      'Cálculos útiles para óptica, encuadre, exposición, almacenamiento, código de tiempo y proyección cinematográfica.';

  @override
  String get cinemaFieldOfViewTitle => 'Ángulo de campo';

  @override
  String get cinemaFieldOfViewSubtitle =>
      'Cálculo horizontal, vertical y diagonal según sensor y distancia focal.';

  @override
  String get cinemaFieldOfViewDescription =>
      'Calcula el ángulo de visión según el formato del sensor y la distancia focal.';

  @override
  String get cinemaFieldOfViewInfo =>
      'Fórmula: ángulo = 2 × atan (tamaño del sensor ÷ (2 × distancia focal)).';

  @override
  String get cinemaSubjectDistanceTitle => 'Distancia cámara/sujeto';

  @override
  String get cinemaSubjectDistanceSubtitle =>
      'Estima la distancia necesaria para encuadrar a un sujeto.';

  @override
  String get cinemaSubjectDistanceDescription =>
      'Estima la distancia de la cámara necesaria para encuadrar un sujeto en altura.';

  @override
  String get cinemaSubjectDistanceInfo =>
      'Aproximación geométrica ideal. La distancia real puede variar según la óptica de respiración, el modo del sensor y el recorte.';

  @override
  String get cinemaDepthOfFieldTitle => 'Profundidad de campo';

  @override
  String get cinemaDepthOfFieldSubtitle =>
      'Zona aguda, límite cercano, límite lejano e hiperfocal.';

  @override
  String get cinemaDepthOfFieldDescription =>
      'Calcula la zona de nitidez teórica según distancia focal, apertura, distancia y círculo de confusión.';

  @override
  String get cinemaDepthOfFieldInfo =>
      'Resultado teórico. La percepción de la nitidez también depende de la resolución, el tamaño de la pantalla y la distancia de visión.';

  @override
  String get cinemaLensEquivalenceTitle => 'Equivalencia de distancia focal';

  @override
  String get cinemaLensEquivalenceSubtitle =>
      'Conversión de distancia focal entre formatos de sensores.';

  @override
  String get cinemaLensEquivalenceDescription =>
      'Convierte una distancia focal de un formato de sensor a otro manteniendo un ángulo de visión diagonal similar.';

  @override
  String get cinemaLensEquivalenceInfo =>
      'Conversión basada en diagonales. Para un encuadre estrictamente horizontal o vertical, el factor puede ser ligeramente diferente.';

  @override
  String get cinemaAnamorphicTitle => 'anamórfico';

  @override
  String get cinemaAnamorphicSubtitle =>
      'Descompresión, relación final y distancia focal horizontal equivalente.';

  @override
  String get cinemaAnamorphicDescription =>
      'Calcula la relación final después de descomprimir y la equivalencia horizontal de la distancia focal.';

  @override
  String get cinemaAnamorphicInfo =>
      'Una lente anamórfica amplía el campo horizontal después de la reducción, pero conserva el comportamiento vertical de la distancia focal.';

  @override
  String get cinemaShutterTitle =>
      'Ángulo de obturación/velocidad de obturación';

  @override
  String get cinemaShutterSubtitle =>
      'Conversión entre ángulo de obturación, FPS y velocidad.';

  @override
  String get cinemaShutterDescription =>
      'Convierte un ángulo de obturación de cine en velocidad de obturación.';

  @override
  String get cinemaShutterInfo =>
      'A 180°, la velocidad es de aproximadamente 1 ÷ (2 × fps). Ejemplo: 25 fps → 1/50 s.';

  @override
  String get cinemaFlickerTitle => 'Sin parpadeo';

  @override
  String get cinemaFlickerSubtitle =>
      'Velocidades de obturación seguras según 50 Hz o 60 Hz.';

  @override
  String get cinemaFlickerDescription =>
      'Lista de velocidades de obturación generalmente seguras basadas en la frecuencia de CA.';

  @override
  String get cinemaFlickerInfo =>
      'Los LED, las pantallas y las fuentes atenuadas aún pueden parpadear dependiendo de su electrónica, su PWM o su frecuencia de actualización.';

  @override
  String get cinemaNdExposureTitle => 'ND / exposición';

  @override
  String get cinemaNdExposureSubtitle =>
      'Paradas, densidad ND, factor ND y compensación de exposición.';

  @override
  String get cinemaNdExposureDescription =>
      'Convierte una corrección en paradas en densidad ND y factor de reducción de luz.';

  @override
  String get cinemaNdExposureInfo =>
      'Marcas: ND 0,3 = 1 paso, ND 0,6 = 2 pasos, ND 0,9 = 3 pasos, ND 1,2 = 4 pasos.';

  @override
  String get cinemaRecordingStorageTitle => 'tiempo de grabación';

  @override
  String get cinemaRecordingStorageSubtitle =>
      'Duración disponible según capacidad y bitrate.';

  @override
  String get cinemaRecordingStorageDescription =>
      'Calcula el tiempo disponible según la capacidad de la tarjeta/disco y la tasa de bits del vídeo.';

  @override
  String get cinemaRecordingStorageInfo =>
      'Cálculo decimal simplificado: 1 GB = 8000 Mb. Deje espacio para audio, metadatos, sistema de archivos y grupo de medios.';

  @override
  String get cinemaTimecodeTitle => 'Código de tiempo';

  @override
  String get cinemaTimecodeSubtitle =>
      'Conversión de código de tiempo ↔ fotogramas y duración entre dos TC.';

  @override
  String get cinemaTimecodeDescription =>
      'Convierte dos códigos de tiempo en fotogramas y calcula la duración entre los dos.';

  @override
  String get cinemaTimecodeInfo =>
      'Esta primera versión utiliza código de tiempo completo sin eliminación de fotogramas. El drop-frame de 29,97 se puede añadir por separado.';

  @override
  String get cinemaSlowMotionTitle => 'Cámara lenta/velocidad de fotogramas';

  @override
  String get cinemaSlowMotionSubtitle =>
      'Factor de cámara lenta y tiempo de reproducción.';

  @override
  String get cinemaSlowMotionDescription =>
      'Calcula el factor de cámara lenta y el tiempo de reproducción final.';

  @override
  String get cinemaSlowMotionInfo =>
      'Ejemplo: disparo a 100 fps, lectura a 25 fps = cámara lenta ×4.';

  @override
  String get cinemaProjectionTitle => 'Proyección de cine';

  @override
  String get cinemaProjectionSubtitle =>
      'Pantalla, relación, proyección, luminancia, liendres y pies-L.';

  @override
  String get cinemaProjectionDescription =>
      'Calcula las dimensiones de la pantalla, la distancia del proyector y la luminancia aproximada.';

  @override
  String get cinemaProjectionInfo =>
      'Luminancia aproximada: liendres ≈ lúmenes × ganancia ÷ (π × área). Las pérdidas ópticas, el zoom, el envejecimiento de la lámpara/láser y la calibración no están incluidos.';

  @override
  String get cinemaGlobalDisclaimer =>
      'Estas herramientas proporcionan valores técnicos indicativos. Los resultados pueden variar según la cámara, la óptica, el códec, el perfil de imagen, el proyector, el lienzo o las condiciones reales de filmación.';

  @override
  String get cinemaSensorLabel => 'Sensor';

  @override
  String get cinemaFocalLengthLabel => 'Longitud focal';

  @override
  String get cinemaHorizontalAngleResult => 'ángulo horizontal';

  @override
  String get cinemaVerticalAngleResult => 'ángulo vertical';

  @override
  String get cinemaDiagonalAngleResult => 'ángulo diagonal';

  @override
  String get cinemaSensorDiagonalResult => 'sensores diagonales';

  @override
  String get cinemaSubjectHeightLabel => 'Altura del sujeto';

  @override
  String get cinemaFrameFillLabel => 'Ocupación del marco de altura.';

  @override
  String get cinemaEstimatedDistanceResult => 'Distancia estimada';

  @override
  String get cinemaFrameHeightResult => 'Altura del marco a esta distancia';

  @override
  String get cinemaApertureLabel => 'Apertura';

  @override
  String get cinemaSubjectDistanceInputLabel => 'Distancia del sujeto';

  @override
  String get cinemaCocLabel => 'Círculo de confusión';

  @override
  String get cinemaCocHelper => 'Ejemplo de fotograma completo: 0,03 mm';

  @override
  String get cinemaHyperfocalResult => 'hiperfocal';

  @override
  String get cinemaNearLimitResult => 'Cerca del límite';

  @override
  String get cinemaFarLimitResult => 'límite lejano';

  @override
  String get cinemaTotalDepthResult => 'Profundidad total';

  @override
  String get cinemaSourceSensorLabel => 'Sensor de fuente';

  @override
  String get cinemaTargetSensorLabel => 'Sensor de objetivo';

  @override
  String get cinemaSourceFocalLengthLabel => 'Distancia focal de la fuente';

  @override
  String get cinemaEquivalentFocalResult => 'Distancia focal equivalente';

  @override
  String get cinemaAppliedFactorResult => 'factor aplicado';

  @override
  String get cinemaSensorRecordingRatioLabel => 'Relación sensor/grabación';

  @override
  String get cinemaSensorRecordingRatioHelper =>
      '16:9 = 1,78, 4:3 = 1,33, 3:2 = 1,50';

  @override
  String get cinemaAnamorphicFactorLabel => 'factor anamórfico';

  @override
  String get cinemaAnamorphicFactorHelper => '1,33, 1,5, 1,8, 2,0';

  @override
  String get cinemaOpticalFocalLengthLabel => 'Distancia focal óptica';

  @override
  String get cinemaFinalRatioResult => 'relación final';

  @override
  String get cinemaHorizontalEquivalentFocalResult =>
      'Distancia focal horizontal equivalente';

  @override
  String get cinemaVerticalFocalResult => 'distancia focal vertical';

  @override
  String get cinemaFramerateLabel => 'Velocidad de fotogramas';

  @override
  String get cinemaShutterAngleLabel => 'Ángulo de obturación';

  @override
  String get cinemaExposureTimeResult => 'Tiempo de exposición';

  @override
  String get cinemaEquivalentShutterSpeedResult => 'Velocidad equivalente';

  @override
  String get cinemaMainsFrequencyLabel => 'Frecuencia de red';

  @override
  String get cinemaMains50Hz => '50 Hz: Europa';

  @override
  String get cinemaMains60Hz => '60 Hz — EE. UU./otros';

  @override
  String get cinemaRecommendedSpeedsResult => 'Velocidades recomendadas';

  @override
  String get cinemaMainsBaseResult => 'Base sectorial';

  @override
  String get cinemaReductionLabel => 'Reducción deseada';

  @override
  String get cinemaNdDensityResult => 'Densidad ND';

  @override
  String get cinemaNdFactorResult => 'factor ND';

  @override
  String get cinemaApproxTransmissionResult => 'Transmisión aprox.';

  @override
  String get cinemaMediaCapacityLabel => 'Capacidad de medios';

  @override
  String get cinemaBitrateLabel => 'tasa de bits';

  @override
  String get cinemaBitrateHelper => 'Advertencia: Mb/s, no MB/s';

  @override
  String get cinemaAvailableDurationResult => 'Duración disponible';

  @override
  String get cinemaStorageConsumptionResult => 'Consumo';

  @override
  String get cinemaIntegerFramerateLabel => 'Velocidad de fotogramas entera';

  @override
  String get cinemaIntegerFramerateHelper => '24, 25, 30, 50, 60…';

  @override
  String get cinemaTcInLabel => 'TC ENTRADA';

  @override
  String get cinemaTcOutLabel => 'SALIDA TC';

  @override
  String get cinemaTimecodeFormatHelper => 'Formato HH:MM:SS:FF';

  @override
  String get cinemaTcInFramesResult => 'Marcos TC IN';

  @override
  String get cinemaTcOutFramesResult => 'Marcos TC OUT';

  @override
  String get cinemaDurationFramesResult => 'Duración en fotogramas';

  @override
  String get cinemaDurationTcResult => 'duración del CT';

  @override
  String get cinemaDurationResult => 'Duración';

  @override
  String get cinemaCaptureFramerateLabel => 'filmación por framerate';

  @override
  String get cinemaPlaybackFramerateLabel =>
      'Reproducción de velocidad de fotogramas';

  @override
  String get cinemaRealDurationLabel => 'Duración real filmada';

  @override
  String get cinemaSlowMotionFactorResult => 'factor inactivo';

  @override
  String get cinemaPlaybackDurationResult => 'tiempo de lectura';

  @override
  String get cinemaScreenWidthLabel => 'Ancho de pantalla';

  @override
  String get cinemaImageRatioLabel => 'Proporción de imagen';

  @override
  String get cinemaImageRatioHelper => '1,85, 2,39, 1,78…';

  @override
  String get cinemaThrowRatioLabel => 'Relación de lanzamiento';

  @override
  String get cinemaProjectorLumensLabel => 'Flujo del proyector';

  @override
  String get cinemaScreenGainLabel => 'Ganancia de lienzo';

  @override
  String get cinemaScreenHeightResult => 'Altura de la pantalla';

  @override
  String get cinemaScreenAreaResult => 'Superficie de la pantalla';

  @override
  String get cinemaProjectorDistanceResult => 'Distancia del proyector';

  @override
  String get cinemaApproxLuminanceResult => 'Luminancia aprox.';

  @override
  String get gdtfScannedPdfOcrEnabled =>
      'PDF escaneado detectado: modo OCR activado. La exploración puede tardar entre 1 y 2 minutos adicionales.';

  @override
  String get gdtfAddModeDialogTitle => 'Agregar un modo';

  @override
  String get gdtfModeNameExampleHint => 'Ej: Estándar, Fácil, Pixel Engine…';

  @override
  String get gdtfDmxChannelCountLabel => 'Número de canales DMX';

  @override
  String get gdtfDmxChannelCountHint => 'Ej: 24';

  @override
  String get gdtfCancel => 'Cancelar';

  @override
  String get gdtfAdd => 'Agregar';

  @override
  String get gdtfErrorModeNameRequired => 'El nombre es obligatorio';

  @override
  String get gdtfErrorInvalidChannelCount =>
      'Número de canales no válido (1-1000)';

  @override
  String get gdtfErrorModeAlreadyExists => 'Ya existe un modo con este nombre.';

  @override
  String get gdtfHowToUseThisPageTooltip => 'Cómo utilizar esta página';

  @override
  String get gdtfHowToGetGdtfTitle => 'Cómo conseguir un GDTF';

  @override
  String get gdtfWorkflowIntro =>
      'Para cada dispositivo, siga estos 3 pasos en orden.';

  @override
  String get gdtfWorkflowSearchTitle => 'Investigación';

  @override
  String get gdtfWorkflowSearchBody =>
      'Pestaña “Buscar”. Escriba el nombre de su dispositivo (por ejemplo: \"Spiider\", \"MAC Viper\", \"Q-10\"). La base de datos GDTF Share contiene más de 6000 luminarias oficiales validadas por los fabricantes. Es gratis, instantáneo y 100% confiable. Utilice PRIMERO en el 90% de los casos.';

  @override
  String get gdtfWorkflowPdfTitle => 'Generar desde PDF';

  @override
  String get gdtfWorkflowPdfBody =>
      'Si la búsqueda no arroja nada, vaya a la pestaña \"Generar desde PDF\". Cargue el manual/hoja de datos de PDF: la IA extrae los modos DMX automáticamente. ⚠️ Importante: ingrese el nombre exacto de la máquina (como está escrito en el manual) y, si agrega modos manualmente, use los nombres de modo exactos DMX; de lo contrario, la IA no encontrará los datos correctos. Funciona bien en PDFs limpios (Robe, Martin, etc.) y no tan bien en manuales chinos escaneados o traducidos.';

  @override
  String get gdtfWorkflowManualTitle => 'Adición/corrección manual';

  @override
  String get gdtfWorkflowManualBody =>
      'Cuando la IA haya terminado el análisis, llegarás a la página de selección de modo. El botón \"Agregar un modo manualmente\" SIEMPRE está disponible en la parte superior de la lista. Úselo para: (a) agregar un modo que la IA olvidó, (b) eliminar una alucinación a través de la papelera, (c) corregir un recuento de canales incorrecto (papelera + volver a agregar al número correcto). Esta es su última línea de defensa antes de generar GDTF; verifíquelo siempre.';

  @override
  String get gdtfWorkflowTip =>
      'Consejo: antes de extraer un PDF, siempre verifique gdtf-share; esto le evita la extracción de IA (más larga y menos confiable) cuando ya existe un GDTF oficial. Y recuerde: el nombre de la máquina y los nombres de los modos deben ser los mismos que aparecen en el manual: ¡la IA depende de ello!';

  @override
  String get gdtfUnderstood => 'Comprendido';

  @override
  String get gdtfWorkflowSearchShortBody =>
      'Escriba el nombre del dispositivo arriba. GDTF Base de datos compartida (más de 6000 partidos oficiales). Es gratis, instantáneo y validado por el fabricante. Resuelve el 90% de los casos.';

  @override
  String get gdtfWorkflowPdfShortBody =>
      '¿Extraviado? Pestaña “Generar desde PDF”. Cargue el manual: la IA extrae los modos DMX. Funciona mejor en PDF limpios.';

  @override
  String get gdtfWorkflowManualShortBody =>
      'En la página de modos, siempre verifique qué produce la IA. Puede: agregar un modo olvidado, eliminar una alucinación (icono de papelera) o corregir un recuento de canales falso (eliminar + volver a agregar al valor correcto). La IA es rápida pero no infalible: tú mantienes el control de la lista final.';

  @override
  String get gdtfAddModeManually => 'Agregar un modo manualmente';

  @override
  String get gdtfNoModeDetectedAutomatically =>
      'Ningún modo se detecta automáticamente.';

  @override
  String get gdtfNoModeDetectedHelp =>
      'El PDF probablemente esté escaneado o tenga un diseño complejo. Agregue los modos manualmente con el botón de arriba, y la extracción de los canales se realizará en el texto OCR/extraído del manual.';

  @override
  String get gdtfAddMode => 'Agregar un modo';

  @override
  String get gdtfDeleteModeTooltip => 'Eliminar este modo';

  @override
  String get audioHomeTitle => 'Su';

  @override
  String get audioHomeSubtitle =>
      'Sub cardioide, end-fire, retardos, SPL y herramientas para el ingeniero de sonido.';

  @override
  String get homeRfTitle => 'RF e inalámbrico';

  @override
  String get homeRfSubtitle =>
      'WiFi 2,4/5 GHz, convivencia, bandas UHF/VHF, calculador de antenas.';

  @override
  String get homeCinemaTitle => 'Cine / Cine';

  @override
  String get homeCinemaSubtitle =>
      'Óptica, encuadre, exposición, código de tiempo, almacenamiento y proyección cinematográfica.';

  @override
  String get audioSectionPlacementDirectivity => 'Colocación y directividad';

  @override
  String get audioSectionAcousticLevels => 'Acústica y niveles';

  @override
  String get audioSectionAmpCabling => 'Amplificador y cableado';

  @override
  String get audioSectionTimingAlignment => 'Sincronización y alineación';

  @override
  String get audioSubCardioidTitle => 'subcardioide';

  @override
  String get audioSubCardioidSubtitle =>
      'Retrasos para configuración cardioide (2 subs) o end-fire (N subs en línea). Cancelación trasera, refuerzo delantero.';

  @override
  String get audioSplDistanceTitle => 'SPL y distancia';

  @override
  String get audioSplDistanceSubtitle =>
      'Ley del cuadrado inverso: SPL dependiendo de la distancia. Cálculo a partir de potencia + sensibilidad del altavoz.';

  @override
  String get audioSplSumTitle => 'Adición de fuentes SPL';

  @override
  String get audioSplSumSubtitle =>
      'N fuentes incoherentes: +10·log(N) dB. O adición de 2 fuentes diferentes.';

  @override
  String get audioElectroacousticTitle => 'Electroacústica';

  @override
  String get audioElectroacousticSubtitle =>
      'SPL de sensibilidad del altavoz + potencia. Tabla de distancias. Acoplamiento coherente/inconsistente.';

  @override
  String get audioWavelengthTitle => 'Frecuencia y longitud de onda';

  @override
  String get audioWavelengthSubtitle =>
      'Conversión Hz ↔ λ (m), λ/4, λ/2. Tabla del espectro de audio por bandas.';

  @override
  String get audioAmpLoadTitle => 'Cargar amplificador/altavoces';

  @override
  String get audioCrossoverTitle => 'Frecuencia de Corte / Crossover';

  @override
  String get audioRt60Title => 'Tiempo de Reverberación (RT60)';

  @override
  String get audioRt60LengthLabel => 'Longitud';

  @override
  String get audioRt60WidthLabel => 'Anchura';

  @override
  String get audioRt60HeightLabel => 'Altura';

  @override
  String get audioRt60AbsorptionLabel => 'Coeficiente de absorción medio (α)';

  @override
  String get audioRt60PresetHard => 'Muy reverberante (hormigón, vidrio)';

  @override
  String get audioRt60PresetMedium => 'Sala media (oficinas, madera)';

  @override
  String get audioRt60PresetTreated => 'Sala tratada (cortinas, moqueta)';

  @override
  String get audioRt60PresetAbsorbent => 'Muy absorbente (estudio tratado)';

  @override
  String get audioRt60ResultTitle => 'RT60 estimado';

  @override
  String get audioRt60VolumeLabel => 'Volumen de la sala';

  @override
  String get audioRt60SurfaceLabel => 'Superficie total';

  @override
  String get audioRt60QualLive => 'Muy reverberante';

  @override
  String get audioRt60QualComfortable => 'Cómodo para la voz';

  @override
  String get audioRt60QualDry => 'Seco / controlado';

  @override
  String get audioRt60FormulaNote =>
      'RT60 = 0,161 × V / (α × S) — fórmula de Sabine, estimación con absorción media uniforme';

  @override
  String get audioSplMeterTitle => 'Sonómetro';

  @override
  String get audioDelayTimeTitle => 'Tiempo de Delay (BPM)';

  @override
  String get audioDelayTimeBpmLabel => 'BPM';

  @override
  String get audioDelayTimeResultsTitle => 'Tiempos por división';

  @override
  String get audioDelayTimeEmptyState =>
      'Introduce un BPM para calcular los tiempos de delay.';

  @override
  String get audioDelayTimeNormalLabel => 'Normal';

  @override
  String get audioDelayTimeDottedLabel => 'Con puntillo';

  @override
  String get audioDelayTimeTripletLabel => 'Tresillo';

  @override
  String get audioDelayTimeFormulaNote =>
      'Tiempo (ms) = 60000 / BPM × fracción de negra. Con puntillo ×1,5 · Tresillo ×2/3.';

  @override
  String get audioSplMeterPermissionTitle => 'Acceso al micrófono requerido';

  @override
  String get audioSplMeterPermissionBody =>
      'El sonómetro usa el micrófono del teléfono para estimar el nivel sonoro ambiental en tiempo real.';

  @override
  String get audioSplMeterAllowMic => 'Permitir micrófono';

  @override
  String get audioSplMeterOpenSettings => 'Abrir ajustes';

  @override
  String get audioSplMeterLiveTitle => 'Nivel en directo';

  @override
  String get audioSplMeterStartHint => 'Toca para iniciar';

  @override
  String get audioSplMeterStopHint => 'Toca para detener';

  @override
  String get audioSplMeterStatsTitle => 'Estadísticas de la sesión';

  @override
  String get audioSplMeterStatsEmpty =>
      'Inicia una medición para ver las estadísticas mín/media/máx.';

  @override
  String get audioSplMeterMinLabel => 'Mínimo';

  @override
  String get audioSplMeterAvgLabel => 'Media';

  @override
  String get audioSplMeterMaxLabel => 'Máximo';

  @override
  String get audioSplMeterReferenceTitle => 'Referencia de niveles sonoros';

  @override
  String get audioSplMeterRefQuiet => 'Habitación silenciosa';

  @override
  String get audioSplMeterRefConversation => 'Conversación normal';

  @override
  String get audioSplMeterRefTraffic => 'Tráfico urbano';

  @override
  String get audioSplMeterRefConcert => 'Concierto / sala amplificada';

  @override
  String get audioSplMeterRefPain => 'Umbral del dolor';

  @override
  String get audioSplMeterDisclaimer =>
      'Medición indicativa mediante el micrófono del teléfono (sin calibrar) — no sustituye a un sonómetro certificado IEC 61672.';

  @override
  String get audioCrossoverFreqLabel => 'Frecuencia de corte';

  @override
  String get audioCrossoverImpedanceLabel => 'Impedancia del altavoz';

  @override
  String get audioCrossoverCapacitorLabel => 'Condensador (paso alto)';

  @override
  String get audioCrossoverInductorLabel => 'Bobina (paso bajo)';

  @override
  String get audioCrossoverOrderNote => 'Filtro de 1er orden (6 dB/octava)';

  @override
  String get audioCrossoverReferenceTitle =>
      'Referencias de frecuencias de corte';

  @override
  String get audioCrossoverRefSubTop => 'Sub / Top';

  @override
  String get audioCrossoverRef2Way => '2 vías (LF/HF)';

  @override
  String get audioCrossoverRef3WayLow => '3 vías — LF/MF';

  @override
  String get audioCrossoverRef3WayHigh => '3 vías — MF/HF';

  @override
  String get audioCrossoverFormulaNote => 'C = 1 / (2π·f·Z)    L = Z / (2π·f)';

  @override
  String get audioAmpLoadSubtitle =>
      '¿Cuántos altavoces por canal de amplificador? Impedancia resultante, potencia por altavoz.';

  @override
  String get audioImpedanceTitle => 'Impedancia Serie / Paralelo';

  @override
  String get audioImpedanceModeLabel => 'Modo de cableado';

  @override
  String get audioImpedanceModeSeries => 'Serie';

  @override
  String get audioImpedanceModeParallel => 'Paralelo';

  @override
  String get audioImpedanceSpeakerLabel => 'Altavoz';

  @override
  String get audioImpedanceAddSpeaker => 'Añadir un altavoz';

  @override
  String get audioImpedanceTotalTitle => 'Impedancia total';

  @override
  String get audioImpedanceEmptyState =>
      'Introduce al menos una impedancia para calcular el total.';

  @override
  String get audioImpedanceWarningLow =>
      'Impedancia baja: comprueba que tu amplificador soporta esta carga (a menudo 2 Ω mínimo).';

  @override
  String get audioImpedanceFormulaNote =>
      'Serie: Zt = Z1 + Z2 + …    Paralelo: 1/Zt = 1/Z1 + 1/Z2 + …';

  @override
  String get audioLevelsTitle => 'Niveles y cables';

  @override
  String get audioLevelsSubtitle =>
      'Convertidor dBu/dBV/V rms. Niveles de referencia −10 dBV, +4 dBu, +18 dBu.';

  @override
  String get audioDelayDistanceTitle => 'Retraso de distancia';

  @override
  String get audioDelayDistanceSubtitle =>
      'Distancia → ms para alinear pilas de retardo, rellenos o difusión distribuida. Multipunto.';

  @override
  String get subscriptionCategorySonRfShort => 'SONIDO Y RF';

  @override
  String get subscriptionProShort => 'PRO';

  @override
  String get audioConditions => 'Términos';

  @override
  String get audioAmbientTemperature => 'Temperatura ambiente';

  @override
  String get audioSpeedOfSound => 'Velocidad del sonido';

  @override
  String get audioListeningPoints => 'Puntos de escucha';

  @override
  String audioDistancePoint(int index) {
    return 'Distancia del punto $index';
  }

  @override
  String get audioAddPoint => 'Añadir un punto';

  @override
  String get audioCalculatedDelays => 'Plazos calculados';

  @override
  String get audioTypicalUseCases => 'Casos de uso típicos';

  @override
  String get audioDelayStackFillsTitle => 'Retraso de pila/rellenos';

  @override
  String get audioDelayStackFillsText =>
      'Mida la distancia entre el sistema principal y la torre de retardo. Aplique este retraso a la torre de retraso para alinearla con las manos.';

  @override
  String get audioDistributedSoundTitle => 'Transmisión distribuida';

  @override
  String get audioDistributedSoundText =>
      'Para cada zona de altavoces, mida la distancia desde el sistema de referencia y aplique el retardo correspondiente.';

  @override
  String get audioRoomFillTitle => 'Llenado de la habitación';

  @override
  String get audioRoomFillText =>
      'Los oradores cercanos al público están retrasados ​​con respecto al sonido en el escenario para evitar la percepción de fuentes duales.';

  @override
  String get audioDelayNote =>
      'El retardo calculado corresponde a la propagación acústica en el aire libre.\nAjuste con precisión de oído o con un analizador de fase.';

  @override
  String get audioFromSpeakerSensitivity =>
      'SPL de la sensibilidad del altavoz';

  @override
  String get audioSensitivity => 'Sensibilidad';

  @override
  String get audioAmpPower => 'potencia del amplificador';

  @override
  String get audioMeasurementDistance => 'Distancia de medición';

  @override
  String get audioTypicalSensitivities => 'Sensibilidades típicas';

  @override
  String get audioSourceCoupling => 'Acoplamiento de fuente';

  @override
  String get audioSourceCouplingIntro =>
      'Al agregar fuentes idénticas una al lado de la otra, la ganancia depende del tipo de acoplamiento:';

  @override
  String audioSourcesCount(int count) {
    return '$count fuentes';
  }

  @override
  String get audioPracticalRules => 'Reglas practicas';

  @override
  String get audioRuleDoubleDistance =>
      'Duplica la distancia = −6 dB (campo libre). En una habitación la atenuación es menor gracias a los reflejos.';

  @override
  String get audioRuleDoublePower =>
      'Duplicar la potencia = +3 dB. Multiplicar por 10 = +10 dB. Se necesitan ×100 de potencia para ganar +20 dB.';

  @override
  String get audioRuleCoupling =>
      'Acoplamiento coherente (fuentes en fase, espalda con espalda): +6 dB por duplicación. Acoplamiento inconsistente: +3 dB.';

  @override
  String get audioRuleSafety =>
      'Umbral de dolor ≈ 120 dB SPL. Riesgo auditivo a partir de 85 dB (8h) según NIOSH. Cada +3 dB divide el tiempo de exposición por 2.';

  @override
  String get audioDistance => 'Distancia';

  @override
  String get audioSpl => 'SPL';

  @override
  String get audioIncoherent => 'Incoherente';

  @override
  String get audioCoherent => 'Coherente';

  @override
  String get audioIncoherentSubtitle =>
      'Fuentes poco convencionales\no no sincronizado';

  @override
  String get audioCoherentSubtitle => 'Fuentes en fase\nalineado';

  @override
  String get audioLevelConverter => 'Convertidor de nivel';

  @override
  String get audioReferenceLevels => 'Niveles de referencia';

  @override
  String get audioGainStagingRules =>
      'Ganar puesta en escena: reglas prácticas';

  @override
  String get audioAmplifierPerChannel => 'AMPLIFICADOR — por canal';

  @override
  String get audioMinimumImpedance => 'Z mín (Ω)';

  @override
  String get audioPowerW => 'Potencia (W)';

  @override
  String get audioAtOhm => 'a (Ω)';

  @override
  String get audioSpeaker => 'EMBARAZADA';

  @override
  String get audioNominalImpedance => 'Z nominal (Ω)';

  @override
  String get audioContinuousPower => 'P continúa (W)';

  @override
  String get audioParallelConnection => 'CONEXIÓN PARALELA';

  @override
  String get audioLoadImpedance => 'carga Z';

  @override
  String get audioPowerPerSpeaker => 'P/enc.';

  @override
  String get audioStatus => 'Estado';

  @override
  String audioTooLowImpedance(String diff) {
    return '✗ Z demasiado bajo (−$diff Ω)';
  }

  @override
  String get audioExceedsContinuousPower => '⚠ Supera P continúa';

  @override
  String audioNearLimit(int percent) {
    return '⚠ Cerca del límite (>$percent%)';
  }

  @override
  String audioOkContinuousPower(int percent) {
    return '✓ OK ($percent% P cont.)';
  }

  @override
  String get audioAmpLoadNote =>
      'Cálculo basado en la potencia publicada por el fabricante del amplificador para cada impedancia (interpolada). La potencia del canal se reparte entre los N altavoces en paralelo. Un margen de ×1,5 a ×2 sobre la potencia RMS/AES es habitual con un limitador ajustado. Valores de las fichas técnicas: verifique siempre con los presets y recomendaciones del fabricante.';

  @override
  String get audioConfiguration => 'Configuración';

  @override
  String get audioParameters => 'Ajustes';

  @override
  String get audioSubDistance => 'Distancia entre submarinos';

  @override
  String get audioSubCount => 'Número de suscriptores';

  @override
  String get audioCardioid2Subs => 'Cardioide — 2 subs';

  @override
  String get audioCardioid2SubsDescription =>
      '1 sub normal + 1 sub devuelto con retraso';

  @override
  String get audioEndFireNSubs => 'End-fire — N subs en línea';

  @override
  String get audioEndFireNSubsDescription =>
      'Todo orientado al frente, retrasos cambiados por fila.';

  @override
  String get audioResults => 'Resultados';

  @override
  String get audioEnterDistanceToCalculate =>
      'Introduzca una distancia para calcular';

  @override
  String get audioDelayToApply => 'Fecha límite para aplicar';

  @override
  String get audioRearSubDelaySublabel => 'en el sub volteado (trasero)';

  @override
  String get audioOptimalFrequency => 'Frecuencia óptima';

  @override
  String get audioFrontSub => 'Subdelantero';

  @override
  String get audioRearSubReversed => 'Sub trasero (invertido)';

  @override
  String get audioNormalPolarity => 'Normal ✓';

  @override
  String get audioInvertedPolarity => 'Invertido 🔄';

  @override
  String get audioDelayBetweenRows => 'Retraso entre cada fila';

  @override
  String get audioMaxDelayRearSub => 'Retardo máximo (sub trasero)';

  @override
  String get audioFrontReferenceSub => 'Sub frontal (referencia)';

  @override
  String audioSubNumber(int index) {
    return 'Sub $index';
  }

  @override
  String get audioEndFireReferenceNote =>
      '→ Sub 1 (frente) es la referencia. Los siguientes subs tienen un retraso creciente.';

  @override
  String get audioHowTo => '¿Cómo hacerlo?';

  @override
  String get audioCardioidStep1 =>
      'Coloque el sub A de cara al público (posición normal).';

  @override
  String get audioCardioidStep2 =>
      'Coloque el sub B justo detrás de él, físicamente volteado hacia la parte trasera del escenario.';

  @override
  String get audioCardioidStep3 =>
      'En tu procesador o consola, invierte la polaridad del sub B (botón Ø/Fase).';

  @override
  String get audioCardioidStep4 =>
      'Aplique el retraso calculado al sub B. No retrase el sub A.';

  @override
  String get audioCardioidStep5 =>
      'Verifique la cancelación trasera con un micrófono de medición o caminando detrás del conjunto.';

  @override
  String get audioCardioidTip =>
      '💡 La distancia ideal entre los subs corresponde a λ/4 de la frecuencia central del subs (por ejemplo, 90 Hz → ~0,95 m a 20 °C). Ajústelo para encontrar el mejor compromiso entre cancelación y potencia.';

  @override
  String get audioEndFireStep1 =>
      'Alinea todos los subs en fila, todos de cara al público, con la misma distancia entre cada uno.';

  @override
  String get audioEndFireStep2 =>
      'El sub más directo (sub 1) es la referencia: retraso = 0.';

  @override
  String get audioEndFireStep3 =>
      'Aplique un retraso creciente a cada rango posterior (sub 2 → 1 × retraso, sub 3 → 2 × retraso, etc.).';

  @override
  String get audioEndFireStep4 =>
      'Todos los subs mantienen la misma polaridad (sin inversión).';

  @override
  String get audioEndFireStep5 =>
      'Mida desde atrás para verificar la atenuación.';

  @override
  String get audioEndFireTip =>
      '💡 End-fire ofrece una ganancia de directividad ligeramente menor que el cardioide clásico, pero funciona con más de 2 subs y no requiere volteo físico.';

  @override
  String get audioConversion => 'Conversión';

  @override
  String get audioFrequency => 'Frecuencia';

  @override
  String get audioWavelength => 'Longitud de onda';

  @override
  String get audioResult => 'Resultado';

  @override
  String get audioEnterValueToCalculate => 'Introduzca un valor para calcular';

  @override
  String audioWavelengthAt(String frequency) {
    return 'Longitud de onda en $frequency';
  }

  @override
  String audioFrequencyForLambda(String lambda) {
    return 'Frecuencia para λ = $lambda m';
  }

  @override
  String get audioHalfWave => 'λ/2 (media onda)';

  @override
  String get audioQuarterWave => 'λ/4 (cuarto de onda)';

  @override
  String get audioSpectrumMarkers => 'Espectro de audio: puntos de referencia';

  @override
  String get audioWavelengthFormula =>
      'Fórmula: λ = v/f |    v = 331,3 + 0,606 × T (°C)';

  @override
  String get audioHzToLambda => 'Hz → λ (m)';

  @override
  String get audioLambdaToHz => 'λ (m) → Hz';

  @override
  String get audioSubBass => 'Subgrave';

  @override
  String get audioBass => 'Bajo';

  @override
  String get audioLowMid => 'Medios bajos';

  @override
  String get audioMid => 'Medios';

  @override
  String get audioHighMid => 'medios-altos';

  @override
  String get audioTreble => 'Triplicar';

  @override
  String get audioIncoherentSources => 'Fuentes inconsistentes';

  @override
  String get audioIdenticalSources => 'N fuentes idénticas';

  @override
  String get audioSingleSourceSpl => 'SPL de una fuente';

  @override
  String audioTotalSplSources(int count) {
    return 'SPL total (fuentes $count)';
  }

  @override
  String get audioTwoDifferentSources => '2 fuentes diferentes';

  @override
  String get audioSourceA => 'Fuente A';

  @override
  String get audioSourceB => 'Fuente B';

  @override
  String get audioTotalSplAB => 'SPL total (A+B)';

  @override
  String get audioDoublingReference => 'Referencia: duplicar la ganancia';

  @override
  String get audioIncoherentShort => 'Incoh. :';

  @override
  String get audioCoherentShort => 'Coherir. :';

  @override
  String get audioCalculationMode => 'Método de cálculo';

  @override
  String get audioReferenceSpl => 'SPL de referencia';

  @override
  String get audioReferenceDistance => 'Distancia de referencia';

  @override
  String get audioTargetDistance => 'Distancia objetivo';

  @override
  String get audioEnterValuesToCalculate => 'Introduce los valores a calcular';

  @override
  String audioSplAtDistance(String distance) {
    return 'SPL a $distance m';
  }

  @override
  String get audioVariation => 'Variación';

  @override
  String get audioListeningDistance => 'distancia de escucha';

  @override
  String get audioMaxSplAt1m => 'SPL máximo a 1 m';

  @override
  String get audioDistanceToSpl => 'Distancia → SPL';

  @override
  String get audioPowerToSpl => 'Energía → SPL';

  @override
  String get audioSoundLevelReference => 'Referencia de nivel de sonido';

  @override
  String get audioSectionSafety => 'Seguridad auditiva';

  @override
  String get audioNoiseDoseTitle => 'Dosis sonora y tiempo de exposición';

  @override
  String get audioNoiseDoseIntro =>
      'Cada +3 dB reduce a la mitad el tiempo de exposición permitido (regla de intercambio de 3 dB). Introduce el nivel sonoro medido o previsto para estimar el tiempo antes de alcanzar los umbrales reglamentarios de exposición al ruido.';

  @override
  String get audioNoiseDoseLevelCardTitle => 'Nivel medido';

  @override
  String get audioNoiseDoseLevelLabel => 'Nivel sonoro';

  @override
  String get audioNoiseDoseAllowedTimeTitle =>
      'Tiempo permitido antes de la dosis';

  @override
  String get audioNoiseDoseVaiLabel => 'Valor de acción inferior';

  @override
  String get audioNoiseDoseVasLabel => 'Valor de acción superior';

  @override
  String get audioNoiseDoseVleLabel => 'Valor límite de exposición';

  @override
  String get audioNoiseDoseUnlimited => '≥ 8 h (sin riesgo en un día)';

  @override
  String get audioNoiseDoseTableTitle =>
      'Referencia — tiempo permitido por nivel';

  @override
  String get audioNoiseDoseTableLevelHeader => 'Nivel';

  @override
  String get audioNoiseDoseTableTimeHeader => 'Tiempo permitido (VLE 87 dB)';

  @override
  String get audioNoiseDoseVenueTitle =>
      'Umbrales para recintos (decreto francés de espectáculos)';

  @override
  String get audioNoiseDoseVenueText =>
      'El decreto francés 2017-1244 limita el nivel medio (LAeq en 15 min) a 102 dB(A) (recinto ocasional) o 105 dB(A) (recinto habitual), con un nivel pico ≤ 118 o 120 dB(C). Se aplican al público de forma continua mediante un limitador, y son independientes de la exposición profesional calculada arriba.';

  @override
  String get audioNoiseDoseDisclaimer =>
      'Herramienta indicativa basada en la regla de intercambio de 3 dB (código laboral francés, art. R.4431-2). No sustituye a un sonómetro o dosímetro certificado, ni a una medición reglamentaria in situ.';

  @override
  String get audioSectionOrganization => 'Organización';

  @override
  String get audioInputListTitle => 'Lista de inputs';

  @override
  String get audioInputListIntro =>
      'Crea tu lista de inputs de micro/DI para la prueba de sonido o la hoja de patch. El orden de las filas define el número de canal — arrastra para reordenar.';

  @override
  String get audioInputListEmpty =>
      'Todavía no hay entradas. Añade la primera línea de tu lista de inputs.';

  @override
  String get audioInputListAddButton => 'Añadir entrada';

  @override
  String audioInputListChannel(Object n) {
    return 'Canal $n';
  }

  @override
  String get audioInputListNameLabel => 'Fuente';

  @override
  String get audioInputListPositionLabel => 'Posición';

  @override
  String get audioInputListNotesLabel => 'Notas';

  @override
  String get audioInputListTypeMic => 'Micro';

  @override
  String get audioInputListTypeDi => 'DI';

  @override
  String get audioInputListTypeLine => 'Línea';

  @override
  String get audioInputListTypeWireless => 'Inalámbrico';

  @override
  String get audioInputListTypeOther => 'Otro';

  @override
  String get audioInputListCopyAction => 'Copiar lista';

  @override
  String get audioInputListCopiedSnackbar => 'Lista copiada al portapapeles';

  @override
  String get audioInputListClearAction => 'Borrar todo';

  @override
  String get audioInputListClearConfirmTitle => '¿Borrar toda la lista?';

  @override
  String get audioInputListClearConfirmBody =>
      'Esto elimina todas las entradas de la lista de inputs. No se puede deshacer.';

  @override
  String get pluginCommunity => 'Comunidad de complementos';

  @override
  String get pluginCommunitySubtitle =>
      'Comparte y descubre complementos grandMA3 creados por la comunidad';

  @override
  String get pluginCommunitySubtitleAuth =>
      'Comparte y descubre complementos\ngrandMA3 creado por la comunidad.';

  @override
  String get continueWithGoogle => 'Continuar con Google';

  @override
  String get authChoosePseudo => 'Elige tu apodo';

  @override
  String get authPseudoHint => 'Tu apodo en la comunidad.';

  @override
  String get confirm => 'Confirmar';

  @override
  String get loginCancelled => 'Conexión cancelada.';

  @override
  String get anonymous => 'Anónimo';

  @override
  String get share => 'Compartir';

  @override
  String get searchPluginHint => 'Busque un complemento…';

  @override
  String get allPluginsFilter => '⭐ Todo';

  @override
  String get loginRequiredLike => 'Inicia sesión para dar me gusta 👋';

  @override
  String get noPluginsYet => 'Aún no hay complementos aquí.';

  @override
  String get beFirstToShare => '¡Sé el primero en compartir!';

  @override
  String get signOut => 'Finalizar la sesión';

  @override
  String get luaCode => 'código lua';

  @override
  String get copied => '¡Copiado!';

  @override
  String get copyCode => 'Copiar código';

  @override
  String get pluginPublished => '🚀 ¡Complemento lanzado!';

  @override
  String get sharePlugin => 'Compartir un complemento';

  @override
  String get pluginTitle => 'Título del complemento';

  @override
  String get pluginTitleHint =>
      'ej.: lote de colores RGB: 30 ajustes preestablecidos';

  @override
  String get pluginTitleRequired => 'Título requerido';

  @override
  String get category => 'Categoría';

  @override
  String get optionalDescription => 'Descripción (opcional)';

  @override
  String get pluginDescriptionHint =>
      'Qué hace el plugin, qué le pide al usuario...';

  @override
  String get codeRequired => 'Código requerido';

  @override
  String get codeMustContainReturnMain =>
      'El código debe contener \"return main\"';

  @override
  String get pluginTestedWarning =>
      'Asegúrese de que el complemento esté probado en MA3 antes de compartirlo.';

  @override
  String get attachFiles => 'Adjuntar archivos';

  @override
  String get addFiles => 'Agregar archivos (.lua, .xml…)';

  @override
  String filesSelected(Object count) {
    return '$count archivos seleccionados';
  }

  @override
  String get codeOptional => 'Pega el código (opcional)';

  @override
  String get codeOrFileRequired => 'Añade al menos un archivo o pega el código';

  @override
  String get downloadFile => 'Descargar';

  @override
  String get pluginFiles => 'Archivos';

  @override
  String get uploadingFiles => 'Enviando archivos…';

  @override
  String get publishPlugin => 'Publicar el complemento';

  @override
  String get free => 'GRATIS';

  @override
  String get pro => 'PRO';

  @override
  String get console => 'Consola';

  @override
  String pluginError(Object error) {
    return 'Error: $error';
  }

  @override
  String get pluginCategory_all => 'Todo';

  @override
  String get pluginCategory_color => 'Color';

  @override
  String get pluginCategory_movement => 'Movimiento';

  @override
  String get pluginCategory_effect => 'Efectos';

  @override
  String get pluginCategory_dimmer => 'Intensidad';

  @override
  String get pluginCategory_layout => 'Disposición';

  @override
  String get pluginCategory_select => 'Selección';

  @override
  String get pluginCategory_macro => 'Macro';

  @override
  String get pluginCategory_utility => 'Utilidad';

  @override
  String get pluginCategory_custom => 'Por encargo';

  @override
  String get ma3AppTitlePrefix => 'Complemento MA3';

  @override
  String get ma3AppTitleAccent => 'Forjado';

  @override
  String get ma3New => '↺ Nuevo';

  @override
  String get ma3StepCategory => 'Categoría';

  @override
  String get ma3StepSettings => 'Ajustes';

  @override
  String get ma3StepGeneratedCode => 'Código generado';

  @override
  String get ma3ChoosePluginType => '¿Qué tipo de complemento?';

  @override
  String get ma3ChooseCategorySubtitle => 'Elija una categoría para comenzar';

  @override
  String get ma3Continue => 'Continuar →';

  @override
  String get ma3PluginName => 'Nombre del complemento';

  @override
  String get ma3PluginNameHint => 'Mi complemento MA3';

  @override
  String get ma3PluginSettings => 'Configuración del complemento';

  @override
  String get ma3AdditionalDetails => '💬 Detalles adicionales (opcional)';

  @override
  String get ma3AdditionalDetailsHint =>
      'Añade detalles, casos especiales, restricciones...';

  @override
  String get ma3Back => '← Volver';

  @override
  String get ma3GeneratePlugin => '⚡ Generar el complemento';

  @override
  String get ma3GeneratedReady =>
      'Complemento generado: listo para pegar en MA3';

  @override
  String get ma3InstallInMa3 => 'Instalar en MA3:';

  @override
  String get ma3Menu => 'Menú';

  @override
  String get ma3Plugin => 'Complemento';

  @override
  String get ma3NewPlugin => 'Nuevo complemento';

  @override
  String get ma3PasteSaveAs => '→ pegar → guardar como';

  @override
  String get ma3Run => 'Correr';

  @override
  String get ma3Copied => '✓ ¡Copiado!';

  @override
  String get ma3Copy => '⎘ Copiar';

  @override
  String get ma3Edit => '← Editar';

  @override
  String get ma3Regenerate => '↺ Regenerar';

  @override
  String get ma3NewPluginButton => '+ Nuevo complemento';

  @override
  String get ma3Choose => '- Elegir -';

  @override
  String get ma3Add => 'Agregar...';

  @override
  String get ma3GeneratedPluginFallback => 'Complemento';

  @override
  String get ma3CategoryColor => 'Color';

  @override
  String get ma3CategoryColorDesc =>
      'Diseño RGB, paleta y ajustes preestablecidos de color.';

  @override
  String get ma3CategoryMovement => 'Movimiento';

  @override
  String get ma3CategoryMovementDesc =>
      'Pan/Tilt, círculo, figura 8, posiciones';

  @override
  String get ma3CategoryEffect => 'Efectos';

  @override
  String get ma3CategoryEffectDesc =>
      'Luz estroboscópica, pulso, persecución, secuencias.';

  @override
  String get ma3CategoryDimmer => 'Intensidad';

  @override
  String get ma3CategoryDimmerDesc =>
      'Atenuador, golpe, desvanecimiento, apagón';

  @override
  String get ma3CategoryLayout => 'Disposición';

  @override
  String get ma3CategoryLayoutDesc => 'Crear/organizar diseños MA3';

  @override
  String get ma3CategorySelect => 'Selección';

  @override
  String get ma3CategorySelectDesc =>
      'Selección de grupos, luminarias, filtros.';

  @override
  String get ma3CategoryMacro => 'Macro';

  @override
  String get ma3CategoryMacroDesc =>
      'Macros de varios pasos, secuencias de consola';

  @override
  String get ma3CategoryUtility => 'Utilidad';

  @override
  String get ma3CategoryUtilityDesc =>
      'Etiquetar, almacenar y organizar el archivo del programa.';

  @override
  String get ma3CategoryCustom => 'Por encargo';

  @override
  String get ma3CategoryCustomDesc => 'Describe libremente lo que quieres';

  @override
  String get ma3FieldColorSpace => 'Espacio de color de la máquina';

  @override
  String get ma3FieldColors =>
      'Colores para ofrecer como ajustes preestablecidos';

  @override
  String get ma3FieldGroupSelect =>
      'El complemento solicita el grupo en el momento del lanzamiento.';

  @override
  String get ma3YesViaMa3Dialog => 'Sí, a través del diálogo MA3';

  @override
  String get ma3NoUseCurrentSelection => 'No: utiliza la selección actual';

  @override
  String get ma3FieldMovementType => 'Tipo de movimiento a crear';

  @override
  String get ma3MovePresetPositions =>
      'Posiciones preestablecidas (escena, frente, laterales...)';

  @override
  String get ma3MoveCircle => 'Motor de efectos: círculo';

  @override
  String get ma3MoveFigure8 => 'Motor de efectos: Figura 8';

  @override
  String get ma3MovePanSweep => 'Motor de efectos: barrido panorámico';

  @override
  String get ma3MoveTiltSweep => 'Motor de efectos: barrido de inclinación';

  @override
  String get ma3MoveRandom => 'Motor de efectos: aleatorio';

  @override
  String get ma3FieldSpeedSourceEffects => 'Fuente de velocidad (para efectos)';

  @override
  String get ma3SpeedBpmConsole => 'BPM: valor ingresado en la consola';

  @override
  String get ma3SpeedExecutorConsole =>
      'Speed ​​​​Executor: número ingresado en la consola';

  @override
  String get ma3SpeedBothConsole => 'Ambos: opción ofrecida en la consola.';

  @override
  String get ma3FieldEffectType => 'Tipo de efecto a crear';

  @override
  String get ma3FieldOutput => 'Qué crea el complemento';

  @override
  String get ma3OutputEffectPresets => 'Preajustes de efectos';

  @override
  String get ma3OutputChaseSequence => 'secuencia de persecución';

  @override
  String get ma3OutputTriggerMacro => 'Disparador de macros';

  @override
  String get ma3FieldSpeedSource => 'Fuente de velocidad';

  @override
  String get ma3FieldFeatures => 'Características a incluir';

  @override
  String get ma3OutputIntensityMacros => 'Macros de intensidad';

  @override
  String get ma3OutputIntensityPresets => 'Preajustes de intensidad';

  @override
  String get ma3FieldLayoutSections => 'Secciones a incluir en el diseño.';

  @override
  String get ma3SectionColors => 'Bandera';

  @override
  String get ma3SectionGroups => 'Grupos';

  @override
  String get ma3SectionPresets => 'Preajustes';

  @override
  String get ma3FieldVisualStyle => 'estilo visual';

  @override
  String get ma3FieldGroupNameNumber =>
      'El complemento solicita el nombre/número al iniciarse';

  @override
  String get ma3NoHardcodedGenericName => 'No: nombre genérico codificado';

  @override
  String get ma3FieldSelectionCriteria => 'Criterios de selección a proponer';

  @override
  String get ma3CriteriaEvenOdd => 'Par/Impar';

  @override
  String get ma3CriteriaThirds => '1/3 — 2/3 — 3/3';

  @override
  String get ma3CriteriaPosition => 'Por posición (adelante/medio/atrás)';

  @override
  String get ma3CriteriaAll => 'Todo';

  @override
  String get ma3CriteriaFirstLast => 'Primero/Último';

  @override
  String get ma3OutputSelectionMacros => 'Macros de selección';

  @override
  String get ma3OutputGroupButtonsLayout => 'Botones de grupo en un diseño';

  @override
  String get ma3FieldMacroSteps => 'Describe los pasos de la macro.';

  @override
  String get ma3MacroStepsHint =>
      'ej.:\n1. Seleccione un grupo (diálogo)\n2. Apagón\n3. Espera 1s\n4. Fundido en 3';

  @override
  String get ma3FieldTrigger => 'Desencadenar';

  @override
  String get ma3TriggerManual => 'Manual';

  @override
  String get ma3FieldTask => 'Tarea a realizar';

  @override
  String get ma3TaskNameFixtures => 'Nombrar los dispositivos del parche';

  @override
  String get ma3TaskCreateGroups => 'Crear grupos automáticamente';

  @override
  String get ma3TaskStorePresets =>
      'Almacenar todos los ajustes preestablecidos';

  @override
  String get ma3TaskCleanEmptyObjects => 'Limpiar objetos vacíos';

  @override
  String get ma3TaskCloneLayout => 'Clonar un diseño';

  @override
  String get ma3TaskShowReport =>
      'Mostrar informe (accesorios, grupos, ajustes preestablecidos)';

  @override
  String get ma3FieldConfirmEachAction => 'Confirmar antes de cada acción';

  @override
  String get ma3Yes => 'Sí';

  @override
  String get ma3No => 'No';

  @override
  String get ma3FieldCustomDescription =>
      'Describe lo que debería hacer el complemento en MA3';

  @override
  String get ma3ColorRed => 'Rojo';

  @override
  String get ma3ColorGreen => 'Verde';

  @override
  String get ma3ColorBlue => 'Azul';

  @override
  String get ma3ColorYellow => 'AMARILLO';

  @override
  String get ma3ColorOrange => 'Naranja';

  @override
  String get ma3ColorPink => 'Rosa';

  @override
  String get ma3ColorColdWhite => 'blanco frio';

  @override
  String get ma3ColorWarmWhite => 'Blanco cálido';

  @override
  String get ma3EffectStrobe => 'estroboscópico';

  @override
  String get ma3EffectPulse => 'Legumbres';

  @override
  String get ma3EffectChase => 'Perseguir';

  @override
  String get ma3EffectTwinkle => 'Centelleo';

  @override
  String get ma3EffectFire => 'Fuego';

  @override
  String get ma3EffectSawtooth => 'Diente de sierra';

  @override
  String get ma3EffectRandom => 'Aleatorio';

  @override
  String get ma3Blackout => 'Apagón';

  @override
  String get ma3Full => 'Lleno';

  @override
  String get ma3Bump => 'Bulto';

  @override
  String get ma3FadeIn => 'Encadenar';

  @override
  String get ma3FadeOut => 'Desaparecer';

  @override
  String get ma3DimmerChase => 'Persecución del atenuador';

  @override
  String get ma3Compact => 'Compacto';

  @override
  String get ma3Large => 'Ancho';

  @override
  String get ma3Tablet => 'Tableta';

  @override
  String get ma3Wing => 'ala';

  @override
  String get ma3Random => 'Aleatorio';

  @override
  String get ma3FirstLast => 'Primero/Último';

  @override
  String ma3Error(Object error) {
    return 'Error: $error';
  }

  @override
  String get ma3Text_RGB => 'RGB';

  @override
  String get ma3Text_CMY => 'CMA';

  @override
  String get ma3Text_HSI => 'HSI';

  @override
  String get ma3Text_RGBW => 'RGBW';

  @override
  String get ma3Text_RGBWW => 'RGBWW';

  @override
  String get ma3Text_RGBA => 'RGBA';

  @override
  String get ma3Text_RGBL => 'RGBL';

  @override
  String get ma3Text_RGBWA => 'RGBWA';

  @override
  String get ma3Text_RGBUV => 'RGBUV';

  @override
  String get ma3Text_Gel_Color => 'colorante en gel';

  @override
  String get ma3Text_Cyan => 'cian';

  @override
  String get ma3Text_Magenta => 'Magenta';

  @override
  String get ma3Text_Lime => 'Cal';

  @override
  String get ma3Text_UV => 'ultravioleta';

  @override
  String get ma3Text_OFF => 'APAGADO';

  @override
  String get ma3Text_50 => '50%';

  @override
  String get ma3Text_25 => '25%';

  @override
  String get ma3Text_GO_button => 'botón IR';

  @override
  String get ma3Text_Timecode => 'Código de tiempo';

  @override
  String get ma3Text_OSC => 'OSC';

  @override
  String get ma3Text_MIDI => 'MEDIODÍA';

  @override
  String get gdtfShareAsZip => 'Compartir en .zip';

  @override
  String get gdtfZipShareHelp =>
      '💡 Útil si Gmail o su correo electrónico están bloqueando .gdtf: cambie el nombre del archivo a .gdtf después de recibirlo.';

  @override
  String get rfAntennaTitle => 'calculadora de antena';

  @override
  String get rfSplitterTitle => 'Pérdida de Repartidor / Combinador';

  @override
  String get rfCableAntennaTitle => 'Cable RF y Antenas';

  @override
  String get rfCableLossSectionTitle => 'Pérdida en el cable coaxial';

  @override
  String get rfCableLossCableTypeLabel => 'Tipo de cable';

  @override
  String get rfCableAntennaFrequencyLabel => 'Frecuencia';

  @override
  String get rfCableLossLengthLabel => 'Longitud del cable';

  @override
  String get rfCableAntennaEmptyState =>
      'Introduce los valores para ver el resultado.';

  @override
  String get rfCableLossResultLabel => 'Pérdida total';

  @override
  String get rfCableLossFormulaNote =>
      'Atenuación ≈ k1·√f + k2·f (dB/100 m) — modelo empírico por tipo de cable, típicamente ±5 % entre 100 MHz y 2,5 GHz. Valores orientativos: consulta la hoja de datos del cable para un presupuesto de enlace crítico.';

  @override
  String get rfDiversitySectionTitle => 'Separación de antenas diversity (λ/4)';

  @override
  String get rfDiversityResultLabel => 'Separación recomendada';

  @override
  String get rfDiversityFormulaNote =>
      'λ/4 = 75 / f(MHz) metros — separación mínima recomendada entre dos antenas diversity para limitar el desvanecimiento por multitrayecto.';

  @override
  String get rfPlannerTitle => 'Planificador de Frecuencias HF';

  @override
  String get rfPlannerBandLabel => 'Banda de frecuencias';

  @override
  String get rfPlannerCustomBand => 'Personalizada';

  @override
  String get rfPlannerMinFreqLabel => 'Frecuencia mín.';

  @override
  String get rfPlannerMaxFreqLabel => 'Frecuencia máx.';

  @override
  String get rfPlannerChannelCountLabel => 'Número de canales deseado';

  @override
  String get rfPlannerMinSpacingLabel => 'Espaciado mínimo entre canales';

  @override
  String get rfPlannerResultTitle => 'Frecuencias propuestas';

  @override
  String get rfPlannerFoundLabel => 'Canales encontrados';

  @override
  String get rfPlannerNotEnoughWarning =>
      'No se pudieron encontrar todos los canales solicitados en esta banda con este espaciado — prueba con una banda más ancha o reduce el número de canales/el espaciado mínimo.';

  @override
  String get rfPlannerFormulaNote =>
      'Evita productos de intermodulación de 3er orden (2fA−fB, fA+fB−fC) entre todos los canales, tolerancia ±200 kHz — no es una garantía absoluta, verifica en el terreno con un escaneo RF.';

  @override
  String get rfSplitterWaysLabel => 'Número de vías';

  @override
  String get rfSplitterExcessLossLabel => 'Pérdida excedente del repartidor';

  @override
  String get rfSplitterAdditionalLossLabel => 'Pérdidas de cables y conectores';

  @override
  String get rfSplitterTotalTitle => 'Pérdida total de inserción';

  @override
  String get rfSplitterTheoreticalLabel => 'Pérdida teórica (10·log₁₀N)';

  @override
  String get rfSplitterReferenceTitle => 'Referencia por número de vías';

  @override
  String get rfSplitterFormulaNote =>
      'Pérdida total ≈ pérdida teórica + pérdida excedente + pérdidas de cables/conectores';

  @override
  String get rfFrequency => 'Frecuencia';

  @override
  String get rfVelocityFactorTitle => 'Factor de velocidad (Vf)';

  @override
  String get rfAntennaLengths => 'Longitudes de antena';

  @override
  String get rfEnterFrequencyToCalculate =>
      'Introduzca una frecuencia para calcular';

  @override
  String get rfFullWave => 'Onda completa (λ)';

  @override
  String get rfHalfWave => 'Media onda (λ/2)';

  @override
  String get rfStandardDipole => 'Dipolo estándar';

  @override
  String get rfQuarterWave => 'Cuarto de onda (λ/4)';

  @override
  String get rfWhipAntenna => 'Antena de látigo: la más común';

  @override
  String get rfFiveEighthWave => '5/8 de onda (5λ/8)';

  @override
  String get rfFiveEighthWaveDescription => 'Ganancia +3 dB frente a λ/4';

  @override
  String get rfReferenceFrequencies => 'Frecuencias de referencia';

  @override
  String get rfFmRadio => 'Radio FM (88MHz)';

  @override
  String get rfVhfLow => 'VHF bajo (174 MHz)';

  @override
  String get rfUhf470 => 'frecuencia ultraelevada 470 mhz';

  @override
  String get rfUhf600 => 'frecuencia ultraelevada 600 mhz';

  @override
  String get rfUhf694 => 'UHF 694 MHz (límite FR)';

  @override
  String get rfIsm863 => 'ISMO 863MHz';

  @override
  String get rfWifi24 => 'Wi-Fi de 2,4 GHz';

  @override
  String get rfWifi5 => 'WiFi de 5 GHz (centro)';

  @override
  String get rfFormulaExplanation =>
      'λ = c/f × Vf |    c = 299,792 m/μs\nVf = factor de velocidad del cable (1,00 para aire libre)';

  @override
  String get rfPresetFreeSpace => 'aire libre';

  @override
  String get rfCoexTitle => 'Convivencia de 2,4 GHz';

  @override
  String get rfCoexBandOccupancyTitle => '¿Quién ocupa la banda de 2,4 GHz?';

  @override
  String get rfCoexAvProtocolsTitle => '⚡ Protocolos AV en 2,4 GHz';

  @override
  String get rfCoexAllProtocolsTitle => 'Todos los protocolos';

  @override
  String get rfCoexFrequentConflictsTitle =>
      'Conflictos frecuentes en eventos.';

  @override
  String get rfCoexFieldRecommendationsTitle => 'Recomendaciones de campo';

  @override
  String get rfCoexProtocolWifi24Name => 'Wi-Fi de 2,4 GHz';

  @override
  String get rfCoexProtocolWifi24Note =>
      'Canales fijos, banda ancha. Alta potencia de transmisión.';

  @override
  String get rfCoexProtocolBluetoothClassicName => 'Bluetooth clásico';

  @override
  String get rfCoexProtocolBluetoothClassicNote =>
      'Salta entre 1600 frecuencias/s. Convivencia con WiFi vía AFH.';

  @override
  String get rfCoexProtocolBluetoothLeName => 'Bluetooth LE';

  @override
  String get rfCoexProtocolBluetoothLeNote =>
      'Canales 37, 38, 39 = publicidad (fija). Riesgo con WiFi ch1.';

  @override
  String get rfCoexProtocolZigbeeName => 'Zigbee (IEEE 802.15.4)';

  @override
  String get rfCoexProtocolZigbeeNote =>
      'Canales 11 a 26, cada uno de 2 MHz de ancho. Compatible con WiFi canales 1/6/11.';

  @override
  String get rfCoexProtocolDigitalMics24Name => 'Micrófonos digitales 2,4GHz';

  @override
  String get rfCoexProtocolDigitalMics24Note =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D 2,4 GHz. Muy susceptible a las interferencias WiFi.';

  @override
  String get rfCoexProtocolWirelessDmxName => 'DMX / RDM inalámbrico';

  @override
  String get rfCoexProtocolWirelessDmxNote =>
      'Lumen Radio CRMX, W-DMX, Teatro de la Ciudad. FHSS = robusto pero con banda compartida.';

  @override
  String get rfCoexProtocolWirelessVideoName => 'Vídeo inalámbrico';

  @override
  String get rfCoexProtocolWirelessVideoNote =>
      'Hollyland Mars, DJI O3, Teradek Bolt 4K. Ancho de banda muy amplio, posibles conflictos importantes.';

  @override
  String get rfCoexTypeDsssOfdm => 'DSSS/OFDM';

  @override
  String get rfCoexTypeFhss79 => 'FHSS de 79 canales';

  @override
  String get rfCoexTypeFhss40 => 'FHSS de 40 canales';

  @override
  String get rfCoexTypeDsss16 => 'DSSS de 16 canales';

  @override
  String get rfCoexTypeFhssDsss => 'FHSS/DSSS';

  @override
  String get rfCoexTypeFhss => 'FHSS';

  @override
  String get rfCoexTypeOfdm => 'OFDM';

  @override
  String get rfCoexConflictWifiCh6 => 'Wifi canal 6';

  @override
  String get rfCoexConflictMic24 => 'Micrófono de 2,4 GHz';

  @override
  String get rfCoexConflictBleAdvertising => 'publicidad BLE';

  @override
  String get rfCoexConflictWifiCh1 => 'Wifi canal 1';

  @override
  String get rfCoexConflictWirelessVideo => 'Vídeo inalámbrico';

  @override
  String get rfCoexConflictEverythingElse => 'Todo lo demás';

  @override
  String get rfCoexConflictZigbeeCh11 => 'Zigbee capítulo 11';

  @override
  String get rfCoexRiskHigh => 'ALUMNO';

  @override
  String get rfCoexRiskMedium => 'PROMEDIO';

  @override
  String get rfCoexConflictWifiCh6Mic24Desc =>
      'WiFi ch6 se superpone directamente a las frecuencias preferidas de los micrófonos digitales.';

  @override
  String get rfCoexConflictBleWifiCh1Desc =>
      'Los canales BLE 37/38/39 están en 2402, 2426 y 2480 MHz.';

  @override
  String get rfCoexConflictVideoEverythingDesc =>
      'Los enlaces de vídeo inalámbricos utilizan un amplio ancho de banda y saturan fácilmente la banda.';

  @override
  String get rfCoexConflictZigbeeWifiCh1Desc =>
      'El canal Zigbee 11 (2405 MHz) está directamente en la banda del canal 1 de WiFi.';

  @override
  String get rfCoexTipWifiChannels =>
      'Reserva WiFi para los canales 1 y/o 11. Evita el canal 6 si tienes micrófonos de 2,4 GHz.';

  @override
  String get rfCoexTipUhfMics =>
      'Para micrófonos HF en áreas densas, prefiera sistemas UHF (470–694 MHz) a sistemas de 2,4 GHz.';

  @override
  String get rfCoexTipWirelessVideo5Ghz =>
      'Enlaces de vídeo inalámbricos: utilice absolutamente la banda de 5 GHz cuando sea posible.';

  @override
  String get rfCoexTipWirelessDmxFhss =>
      'El sistema inalámbrico DMX FHSS es el más robusto: omite automáticamente las frecuencias ocupadas.';

  @override
  String get rfCoexTipSpectrumScan =>
      'Realice un escaneo de espectro antes del evento con una aplicación de RF (WiFi Analyzer, Chanalyzer, etc.).';

  @override
  String get rfPageTitle => 'RF e inalámbrico';

  @override
  String get rfSectionMicrosHf => 'Micrófonos y antenas HF';

  @override
  String get rfSectionCalcHf => 'cálculos de alta frecuencia';

  @override
  String get rfSectionWifi => 'Wifi';

  @override
  String get rfSectionCoexistence => 'Coexistencia';

  @override
  String get rfSectionScanTerrain => 'Escaneo y campo';

  @override
  String get rfFreeLabel => 'GRATIS';

  @override
  String get rfToolUhfBandsTitle => 'Bandas UHF/VHF';

  @override
  String get rfToolUhfBandsSubtitle =>
      'Bandas legales Francia (ANFR), UHF 470–694 MHz, dividendo digital, DECT, ISM 863 MHz.';

  @override
  String get rfToolAntennaTitle => 'Calculadora de antena';

  @override
  String get rfToolAntennaSubtitle =>
      'Frecuencia → λ/4, λ/2, 5λ/8. Factor de velocidad para cables coaxiales. Referencias UHF/WiFi.';

  @override
  String get rfToolIm3Title => 'intermodulación IM3';

  @override
  String get rfToolIm3Subtitle =>
      'Calcula 2Fi−Fj para 2 a 16 frecuencias. Detecta productos que caen en tus canales.';

  @override
  String get rfToolWifi24Title => 'Canales WiFi de 2,4 GHz';

  @override
  String get rfToolWifi24Subtitle =>
      '13 canales, superposiciones visuales, simulador de conflictos. Canales no conflictivos 1, 6, 11.';

  @override
  String get rfToolWifi5Title => 'Canales WiFi de 5GHz';

  @override
  String get rfToolWifi5Subtitle =>
      'Bandas UNII-1/2A/2C, DFS, canales disponibles en Francia. Sin superposición a 80 MHz.';

  @override
  String get rfToolCoexTitle => 'Convivencia de 2,4 GHz';

  @override
  String get rfToolCoexSubtitle =>
      'Quién comparte banda: WiFi, Bluetooth, Zigbee, micrófonos digitales, inalámbricos DMX, video. Conflictos típicos.';

  @override
  String get rfToolScanWifiTitle => 'escaneo wifi';

  @override
  String get rfToolScanWifiSubtitle =>
      'Analiza las redes WiFi circundantes: canales, RSSI, bandas de 2,4/5 GHz. Visualización de ocupación del espectro.';

  @override
  String get rfToolScanLogTitle => 'Registro de escaneo de RF';

  @override
  String get rfToolScanLogSubtitle =>
      'Lectura manual de frecuencia: nivel de señal, estado (libre/límite/ocupado), notas de campo.';

  @override
  String get rfIm3PageTitle => 'intermodulación IM3';

  @override
  String get rfIm3WhatIs => '¿Qué es IM3?';

  @override
  String get rfIm3WhatIsBody =>
      'Cuando dos transmisores F1 y F2 ingresan a un amplificador o receptor, generan frecuencias espurias en 2F1-F2 y 2F2-F1. Estos productos de intermodulación de tercer orden se acercan a las frecuencias originales y pueden bloquear un canal de HF vecino.';

  @override
  String get rfIm3QuickMode => 'Modo rápido: 2 frecuencias';

  @override
  String get rfIm3AdvancedMode => 'Modo avanzado: hasta 16 frecuencias';

  @override
  String rfIm3FrequencyN(int index) {
    return 'Frecuencia $index';
  }

  @override
  String get rfIm3AddFrequency => 'Agregar una frecuencia';

  @override
  String get rfIm3Tips => 'Consejos de campo';

  @override
  String get rfIm3Tip1 =>
      'Separe sus frecuencias de manera irregular. Los espacios regulares generan IM3 que caen directamente en tus canales.';

  @override
  String get rfIm3Tip2 =>
      'Tolerancia de detección: ±200 kHz. Adáptese según el ancho de banda de sus sistemas (normalmente 200–400 kHz).';

  @override
  String get rfIm3Tip3 =>
      'Las herramientas Shure Wireless Workbench, Sennheiser WSM y Audio-Technica Frequency Manager incluyen cálculo IM3 para sus rangos; úselos para la implementación final.';

  @override
  String get rfIm3OutOfBand => 'Fuera de banda (< 0 MHz)';

  @override
  String get rfIm3ConflictOnFreq =>
      '⚠ Cae en una frecuencia utilizada (±200 kHz)';

  @override
  String get rfIm3TableFormula => 'Fórmula';

  @override
  String get rfIm3TableFreqIm3 => 'frecuencia IM3';

  @override
  String get rfIm3TableStatus => 'Estado';

  @override
  String get rfIm3Footnote =>
      'IM3 = 2×Fi − Fj |    Tolerancia al conflicto: ±200 kHz\nLos productos negativos (fuera del espectro) se muestran pero no entran en conflicto.';

  @override
  String rfIm3Conflicts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return '$count conflicto$_temp0';
  }

  @override
  String get rfScanLogTitle => 'Registro de escaneo de RF';

  @override
  String get rfScanLogClearAll => 'Borrar todo';

  @override
  String get rfScanLogAdd => 'Agregar';

  @override
  String get rfScanLogClearConfirmTitle => '¿Borrar registro?';

  @override
  String get rfScanLogClearConfirmContent =>
      'Se eliminarán todas las entradas.';

  @override
  String get rfScanLogCancel => 'Cancelar';

  @override
  String get rfScanLogDelete => 'para borrar';

  @override
  String get rfScanLogNewEntry => 'Nueva entrada';

  @override
  String get rfScanLogFrequency => 'Frecuencia';

  @override
  String get rfScanLogOptionalLevel => 'Nivel medido (opcional)';

  @override
  String get rfScanLogNote => 'Nota';

  @override
  String get rfScanLogNoteHint =>
      'ej: canal 36, sala B, interferencia de TV...';

  @override
  String get rfScanLogStatusLabel => 'Estado :';

  @override
  String get rfScanLogSave => 'Ahorrar';

  @override
  String get rfScanLogEmptyTitle => 'diario vacio';

  @override
  String get rfScanLogEmptyBody =>
      'Anote aquí sus mediciones de campo: frecuencia, nivel medido en el analizador, estado y comentario.';

  @override
  String get rfScanLogFirstEntry => 'Primera entrada';

  @override
  String get rfScanLogStatusFree => 'Gratis';

  @override
  String get rfScanLogStatusOccupied => 'Ocupado';

  @override
  String get rfScanLogStatusBorderline => 'Límite';

  @override
  String get rfScanLogInstant => 'Ahora mismo';

  @override
  String rfScanLogMinutesAgo(int n) {
    return 'Hace $n minutos';
  }

  @override
  String rfScanLogHoursAgo(int n) {
    return 'Hace $n horas';
  }

  @override
  String get rfScanLogFreePlural => 'Gratis';

  @override
  String get rfScanLogOccupiedPlural => 'Ocupado';

  @override
  String get rfScanLogBorderlinePlural => 'Borde.';

  @override
  String get rfScanLogTotal => 'Total';

  @override
  String get rfUhfBandsTitle => 'Bandas UHF/VHF';

  @override
  String get rfUhfBandsOverview => 'Descripción general: Francia';

  @override
  String get rfUhfBandsTips => 'Consejos para la selección de bandas';

  @override
  String get rfUhfBandsSource =>
      'Fuente: ANFR / ARCEP — Normativa francesa.\nLas reglas pueden variar según el país.\nCompruebe siempre la conformidad de su equipo.';

  @override
  String get rfUhfBand1Name => 'VHF Bajo';

  @override
  String get rfUhfBand1Status => 'Limitado';

  @override
  String get rfUhfBand1Desc =>
      'Antigua banda de TV analógica. Algunos sistemas HF usan este rango. Menos común en eventos en directo.';

  @override
  String get rfUhfBand1Examples =>
      'Algunos sistemas antiguos Sennheiser, Shure';

  @override
  String get rfUhfBand2Name => 'UHF — Bloque TV';

  @override
  String get rfUhfBand2Status => 'Pro (autorización)';

  @override
  String get rfUhfBand2Desc =>
      'Banda principal para micrófonos HF profesionales en Francia. Compartida con la TDT. Requiere autorización ANFR para uso comercial. Uso libre para producción audiovisual bajo condiciones.';

  @override
  String get rfUhfBand2Examples =>
      'Shure Axient, Sennheiser 2000, Sony DWX, Audio-Technica 3000';

  @override
  String get rfUhfBand3Name => 'Dividendo digital';

  @override
  String get rfUhfBand3Status => 'PROHIBIDO';

  @override
  String get rfUhfBand3Desc =>
      'Banda asignada a redes móviles 4G/5G en Francia desde 2017. Cualquier equipo de audio inalámbrico en esta banda es ilegal desde esa fecha.';

  @override
  String get rfUhfBand4Name => 'ISM / SRD 863 MHz';

  @override
  String get rfUhfBand4Status => 'Libre (10 mW)';

  @override
  String get rfUhfBand4Desc =>
      'Banda libre en Europa (SRD — Short Range Device). No requiere autorización. Límite de potencia: 10 mW ERP, 25 kHz de ancho de banda.';

  @override
  String get rfUhfBand4Examples =>
      'Algunos sistemas de gama básica, mandos a distancia';

  @override
  String get rfUhfBand5Name => 'DECT';

  @override
  String get rfUhfBand5Status => 'Libre (250 mW)';

  @override
  String get rfUhfBand5Desc =>
      'Estándar dedicado a la voz inalámbrica. Sin interferencias con WiFi/Bluetooth. Utilizado para sistemas de conferencia, intercomunicadores y algunos micrófonos inalámbricos.';

  @override
  String get rfUhfBand5Examples =>
      'Bosch CCS-800 Ultro, Sennheiser SpeechLine, Beyerdynamic Quinta';

  @override
  String get rfUhfBand6Name => 'Micro digital 2.4 GHz';

  @override
  String get rfUhfBand6Status => 'Libre (100 mW)';

  @override
  String get rfUhfBand6Desc =>
      'Banda ISM, libre sin autorización. Sujeta a interferencias de WiFi y Bluetooth. Adecuada para producciones pequeñas, evitar salas grandes con WiFi denso.';

  @override
  String get rfUhfBand6Examples =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D (variante 2.4G)';

  @override
  String get rfUhfBand7Name => 'Inalámbrico 5.8 GHz';

  @override
  String get rfUhfBand7Status => 'Limitado (FR)';

  @override
  String get rfUhfBand7Desc =>
      'No disponible para WiFi en Francia, pero algunos sistemas propietarios usan este rango. Verificar la conformidad ARCEP de cada equipo.';

  @override
  String get rfUhfBand7Examples => 'Algunos sistemas IEM de gama alta';

  @override
  String get rfUhfOverviewSublabel1 => 'VHF / transitorio';

  @override
  String get rfUhfOverviewSublabel2 => 'UHF pro (autorización)';

  @override
  String get rfUhfOverviewSublabel3 => '4G/5G — PROHIBIDO';

  @override
  String get rfUhfOverviewSublabel4 => 'ISM libre';

  @override
  String get rfUhfOverviewSublabel5 => 'DECT libre';

  @override
  String get rfUhfOverviewSublabel6 => 'ISM (WiFi + micros digitales)';

  @override
  String get rfUhfTip1 =>
      '470–694 MHz: óptimo para producciones profesionales. Amplia variedad de frecuencias, buen comportamiento de RF. Declarar el uso ante la ANFR para eventos profesionales.';

  @override
  String get rfUhfTip2 =>
      'Asegúrese de verificar que su equipo esté fuera de la banda 694–790 MHz. Los sistemas antiguos y no vendidos posteriores a 2017 son ilegales en el escenario.';

  @override
  String get rfUhfTip3 =>
      'DECT (1880–1900 MHz) es ideal para sistemas de conferencias: banda dedicada, sin interferencias WiFi/BT.';

  @override
  String get rfUhfTip4 =>
      'Los sistemas de 2,4 GHz son convenientes pero sensibles a entornos WiFi densos. Evite en salas de conferencias grandes.';

  @override
  String get rfLegendPro => 'Pro (autorización)';

  @override
  String get rfLegendFree => 'Gratis';

  @override
  String get rfLegendForbidden => 'Prohibido';

  @override
  String get rfWifi24PageTitle => 'Wi-Fi de 2,4 GHz';

  @override
  String get rfWifi24SpectrumTitle => 'Espectro de 2,4 GHz: se superpone';

  @override
  String get rfWifi24SimulateTitle => 'Simular la convivencia';

  @override
  String get rfWifi24SelectChannels =>
      'Seleccione los canales utilizados en su entorno:';

  @override
  String get rfWifi24ConflictWarning =>
      '⚠️ Los canales seleccionados se superponen: riesgo de interferencia mutua.';

  @override
  String get rfWifi24ChannelTableTitle => 'tabla de canales';

  @override
  String get rfWifi24BestPractices => 'Mejores prácticas';

  @override
  String get rfWifi24LegendNonOverlap => 'Canal no superpuesto';

  @override
  String get rfWifi24LegendOk => 'Seleccionado Aceptar';

  @override
  String get rfWifi24LegendConflict => 'Conflicto';

  @override
  String get rfWifi24HdrChannel => 'Canal';

  @override
  String get rfWifi24HdrCenter => 'Centro';

  @override
  String get rfWifi24HdrStart => 'Comienzo';

  @override
  String get rfWifi24HdrEnd => 'FIN';

  @override
  String get rfWifi24Tip1 =>
      'Utilice siempre los canales 1, 6 y 11 para 3 redes WiFi que no se superpongan.';

  @override
  String get rfWifi24Tip2 =>
      'En los canales de 20 MHz, los canales 1, 5, 9 y 13 tampoco se superponen.';

  @override
  String get rfWifi24Tip3 =>
      'El WiFi de 2,4 GHz comparte banda con Bluetooth, Zigbee y micrófonos digitales de 2,4 GHz.';

  @override
  String get rfWifi24Tip4 =>
      'En áreas densas, prefiera 5 GHz (menos congestionados) para equipos sensibles.';

  @override
  String get rfWifi5PageTitle => 'Wi-Fi de 5 GHz';

  @override
  String get rfWifi5RegulationTitle => 'Normativa francesa (ARCEP)';

  @override
  String get rfWifi5BandsAvailable => 'Bandas disponibles';

  @override
  String get rfWifi5Unii3Forbidden => 'UNII-3 (5725–5850)';

  @override
  String get rfWifi5ForbiddenLabel => 'Prohibido';

  @override
  String get rfWifi5DfsNote =>
      '⚠️ DFS (Selección dinámica de frecuencia): los canales UNII-2A y 2C requieren detección por radar. El equipo puede cambiar de canal automáticamente si se detecta un radar.';

  @override
  String get rfWifi5ChannelWidthsTitle => 'Anchos de canal';

  @override
  String get rfWifi5Bw20 => 'Máxima compatibilidad, flujo limitado';

  @override
  String get rfWifi5Bw40 => '2 canales vinculados: 802.11n';

  @override
  String get rfWifi5Bw80 => '4 canales vinculados: 802.11ac/ax';

  @override
  String get rfWifi5Bw160 => '8 canales vinculados: solo 802.11ax';

  @override
  String get rfWifi5NonOverlapTitle =>
      'Canales no superpuestos a 80 MHz (Francia)';

  @override
  String get rfWifi5NonOverlapFor3 =>
      'Para 3 redes de 80 MHz no superpuestas (Francia):';

  @override
  String get rfWifi5MaxNetworks =>
      '→ Hasta 6 redes de 80 MHz disponibles solo en UNII-2C.';

  @override
  String get rfWifi5ChannelsMhz => 'Canales (20MHz)';

  @override
  String get rfWifi5ForbiddenFR => 'Prohibido FR';

  @override
  String get rfWifi5Indoor => 'Interior';

  @override
  String get rfWifiScanTitle => 'escaneo wifi';

  @override
  String get rfWifiScanPlatformInfo =>
      'Escaneo activo en Android (se requiere permiso de localización). En iOS, sólo es visible la red conectada.';

  @override
  String get rfWifiScanStart => 'Iniciar el escaneo';

  @override
  String get rfWifiScanInProgress => 'Escaneo en progreso…';

  @override
  String get rfWifiScanGroupedTooltip => 'Vista de lista';

  @override
  String get rfWifiScanFlatTooltip => 'Vista de grupo';

  @override
  String get rfWifiScanNoResults =>
      'Inicie el escaneo para ver las redes vecinas.';

  @override
  String get rfWifiScanOccupation => 'Ocupación del canal de 2,4 GHz';

  @override
  String get rfWifiScanNonOverlapNote =>
      'Canales en negrita (1, 6, 11) = no superpuestos';

  @override
  String get rfWifiScanHidden => '(red oculta)';

  @override
  String rfWifiScanNetworks24(int count) {
    return '$count redes';
  }

  @override
  String rfWifiScanNetworks5(int count) {
    return '$count redes';
  }

  @override
  String rfWifiScanTotal(int count) {
    return '$count total';
  }

  @override
  String get rfWifiScanSub24 => '2,4 GHz';

  @override
  String get rfWifiScanSub5 => '5GHz';

  @override
  String get rfWifiScanSubTotal => 'redes';

  @override
  String get rfWifiRssiExcellent => 'Excelente';

  @override
  String get rfWifiRssiBon => 'Bien';

  @override
  String get rfWifiRssiMoyen => 'PROMEDIO';

  @override
  String get rfWifiRssiFaible => 'Débil';

  @override
  String get audioLevelInputDbu => 'Valor en dBu';

  @override
  String get audioLevelInputDbv => 'Valor en dBV';

  @override
  String get audioLevelInputVrms => 'voltaje eficaz';

  @override
  String get audioLevelDbfsNote =>
      '* dBFS relativo a +24 dBu = 0 dBFS (valor típico: varía según el sistema)';

  @override
  String get audioGainStagingTip1 =>
      'Apunte a +4 dBu nominales en cada etapa. Mantenga ~18 dB de espacio libre antes del clip.';

  @override
  String get audioGainStagingTip2 =>
      'La diferencia consumidor/profesional (+4 dBu frente a −10 dBV) es ~11,8 dB; compense la ganancia en cada interfaz.';

  @override
  String get audioGainStagingTip3 =>
      'Línea balanceada (XLR): +4 dBu. Línea no balanceada (jack TS): −10 dBV. Caja DI para adaptar impedancia y nivel.';

  @override
  String get audioGainStagingTip4 =>
      'dBu = dB referido a 0,775 V (600 Ω). dBV = dB relativo a 1 V. dBV = dBu − 2,218.';

  @override
  String get audioDiffTipEqual =>
      'Fuentes casi iguales: ganancia de ~+3 dB en las más fuertes.';

  @override
  String audioDiffTipSmall(String diff) {
    return 'Diferencia en $diff dB: el más bajo aporta poco.';
  }

  @override
  String audioDiffTipMedium(String diff, String gain) {
    return 'Diferencia de $diff dB: ganancia limitada a ~$gain dB en la fuente dominante.';
  }

  @override
  String get audioDiffTipLarge =>
      'Diferencia > 10 dB: la fuente débil es insignificante. Ganancia ≈ +0 dB.';

  @override
  String get audioIncoherentShortLabel => 'Incoh. :';

  @override
  String get audioCoherentShortLabel => 'Coherir. :';

  @override
  String audioAtDistance(String dist) {
    return 'A las ${dist}m';
  }

  @override
  String get rfWifiScanErrLocationRequired =>
      'Se requiere permiso de ubicación para el escaneo WiFi.';

  @override
  String get rfWifiScanErrLocationDenied =>
      'Permiso de ubicación denegado. Actívalo en la configuración.';

  @override
  String get rfWifiScanErrLocationDisabled =>
      'Servicio de localización desactivado. Habilítelo en el dispositivo.';

  @override
  String get rfWifiScanErrNotSupported =>
      'WiFi Scan no es compatible con este dispositivo o versión del sistema operativo.';

  @override
  String get rfWifiScanErrFailed => 'No se puede iniciar el escaneo.';

  @override
  String get rfWifiScanErrDefault =>
      'No se puede escanear en este dispositivo.';

  @override
  String get rfWifiScanErrReadResults =>
      'No se pueden leer los resultados del análisis.';

  @override
  String rfWifiScanErrGeneric(String error) {
    return 'Error durante el escaneo: $error';
  }

  @override
  String get homeNetworkTitle => 'Red';

  @override
  String get homeNetworkSubtitle =>
      'Escaneo de red local, Art-Net, sACN / E1.31.';

  @override
  String get networkPageTitle => 'Red';

  @override
  String get networkScanCardTitle => 'Escaneo de red';

  @override
  String get networkScanCardSubtitle =>
      'Detectar dispositivos activos en la red local.';

  @override
  String get networkArtNetCardTitle => 'Visualizador Art-Net';

  @override
  String get networkArtNetAddressingTitle => 'Direccionamiento Art-Net';

  @override
  String get networkArtNetToPortTitle =>
      'Net / Sub-Net / Universe → Port-Address';

  @override
  String get networkArtNetFromPortTitle =>
      'Port-Address → Net / Sub-Net / Universe';

  @override
  String get networkArtNetNetLabel => 'Net';

  @override
  String get networkArtNetSubNetLabel => 'Sub-Net';

  @override
  String get networkArtNetUniverseLabel => 'Universe';

  @override
  String get networkArtNetPortAddressLabel => 'Port-Address';

  @override
  String get networkArtNetEmptyState =>
      'Introduce valores válidos para ver el resultado.';

  @override
  String get networkArtNetFormulaNote =>
      'Port-Address (15 bits) = (Net << 8) | (Sub-Net << 4) | Universe — Net 0-127, Sub-Net 0-15, Universe 0-15, Port-Address 0-32767 (spec Art-Net 4).';

  @override
  String get networkArtNetCardSubtitle =>
      'Escuchar y analizar paquetes ArtDMX en tiempo real.';

  @override
  String get networkSacnCardTitle => 'Visualizador sACN / E1.31';

  @override
  String get networkSacnCardSubtitle =>
      'Escucha y análisis de paquetes sACN/E1.31 en tiempo real.';

  @override
  String get networkComingSoon => 'Futuro';

  @override
  String get networkFutureLuminex => 'Monitoreo Luminex';

  @override
  String get networkFutureMaNet => 'Detección MA-Net';

  @override
  String get networkFutureAlarms => 'Alarmas de red';

  @override
  String get networkFutureSnapshots => 'Instantáneas de red';

  @override
  String get networkFutureExport => 'Exportar PDF / CSV';

  @override
  String get networkScanTitle => 'Escaneo de red';

  @override
  String get networkPoeTitle => 'Calculadora PoE';

  @override
  String get networkFiberTitle => 'Presupuesto de Enlace de Fibra';

  @override
  String get networkSubnetTitle => 'Calculadora de Subred';

  @override
  String get networkSubnetIpLabel => 'Dirección IP';

  @override
  String get networkSubnetPrefixLabel => 'Prefijo (CIDR)';

  @override
  String get networkSubnetNetworkLabel => 'Dirección de red';

  @override
  String get networkSubnetBroadcastLabel => 'Dirección de broadcast';

  @override
  String get networkSubnetNetmaskLabel => 'Máscara de subred';

  @override
  String get networkSubnetWildcardLabel => 'Máscara comodín (wildcard)';

  @override
  String get networkSubnetFirstHostLabel => 'Primera IP utilizable';

  @override
  String get networkSubnetLastHostLabel => 'Última IP utilizable';

  @override
  String get networkSubnetHostCountLabel => 'Hosts utilizables';

  @override
  String get networkSubnetInvalidIp =>
      'Dirección IP inválida (formato esperado: 192.168.1.0)';

  @override
  String get networkSubnetDivideTitle => 'Dividir en subredes iguales';

  @override
  String get networkSubnetDivideNote =>
      'Elige en cuántas subredes dividir esta red.';

  @override
  String get networkFiberTypeLabel => 'Tipo de fibra';

  @override
  String get networkFiberDistanceLabel => 'Distancia';

  @override
  String get networkFiberAttenuationLabel => 'Atenuación (por km)';

  @override
  String get networkFiberAdditionalLossLabel =>
      'Pérdidas de conectores y empalmes';

  @override
  String get networkFiberBudgetLabel =>
      'Presupuesto del transceptor (opcional)';

  @override
  String get networkFiberTotalTitle => 'Pérdida total del enlace';

  @override
  String get networkFiberMarginLabel => 'Margen restante';

  @override
  String get networkFiberWarningOver =>
      'Margen superado: el enlace puede no funcionar correctamente a esta distancia.';

  @override
  String get networkFiberFormulaNote =>
      'Pérdida total = atenuación × distancia + pérdidas de conectores/empalmes';

  @override
  String get networkPoeBudgetLabel => 'Presupuesto del inyector / switch';

  @override
  String get networkPoeDeviceLabel => 'Dispositivo';

  @override
  String get networkPoeClassLabel => 'Clase PoE';

  @override
  String get networkPoeClassManual => 'Manual (valor libre)';

  @override
  String get networkPoeClassWord => 'Clase';

  @override
  String get networkPoeDevicePowerLabel => 'Potencia';

  @override
  String get networkPoeAddDevice => 'Añadir un dispositivo';

  @override
  String get networkPoeTotalTitle => 'Consumo total';

  @override
  String get networkPoeRemainingLabel => 'Presupuesto restante';

  @override
  String get networkPoeEmptyState =>
      'Añade al menos un dispositivo para calcular.';

  @override
  String get networkPoeWarningOver =>
      'Presupuesto superado: quita dispositivos o usa un switch/inyector más potente.';

  @override
  String get networkPoeFormulaNote =>
      'Consumo total = suma de dispositivos. Deja un margen de ~10-20% bajo el presupuesto total.';

  @override
  String get networkScanStartButton => 'Iniciar el escaneo';

  @override
  String get networkScanStopButton => 'Dejar de escanear';

  @override
  String get networkScanScanning => 'Escaneo en progreso…';

  @override
  String networkScanProgress(int done, int total) {
    return '$done / $total IP escaneadas';
  }

  @override
  String networkScanDevicesFound(int count) {
    return '$count dispositivo(s) encontrado(s)';
  }

  @override
  String get networkScanNoDevicesFound =>
      'No se encontraron dispositivos en esta red.';

  @override
  String get networkScanNoNetwork =>
      'No se detectó ninguna red local (Wi-Fi). Conéctese a una red.';

  @override
  String get networkScanIosLimitation =>
      'En iOS, las aplicaciones no pueden acceder a las direcciones MAC ni al fabricante (restricción de Apple).';

  @override
  String get networkScanLocalIp => 'IP local';

  @override
  String get networkScanSubnet => 'Mascarilla';

  @override
  String get networkScanStatusOnline => 'En línea';

  @override
  String networkScanResponseMs(int ms) {
    return '$ms ms';
  }

  @override
  String get networkScanPermissionDenied =>
      'Permiso de red denegado. Verificar permisos.';

  @override
  String get networkScanErrorGeneric => 'Error de red. Comprueba tu conexión.';

  @override
  String get networkScanHint =>
      'Toque \"Iniciar escaneo\" para detectar dispositivos.';

  @override
  String get artnetTitle => 'Visualizador Art-Net';

  @override
  String get artnetStartButton => 'Empezar a escuchar';

  @override
  String get artnetStopButton => 'Detener';

  @override
  String get artnetListening => 'Escuchando: puerto 6454';

  @override
  String get artnetNotListening => 'Inactivo';

  @override
  String get artnetNoPackets => 'Esperando paquetes Art-Net...';

  @override
  String get artnetUniversesTitle => 'Universo recibido';

  @override
  String artnetUniverseTitle(int universe) {
    return 'Universo $universe';
  }

  @override
  String artnetSourceIp(Object ip) {
    return 'Fuente: $ip';
  }

  @override
  String artnetPackets(int count) {
    return '$count paquetes';
  }

  @override
  String artnetFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get artnetShowActiveOnly => 'Solo canales activos';

  @override
  String artnetActiveCount(int count) {
    return '$count canales activos';
  }

  @override
  String get artnetPlatformInfo =>
      'Art-Net: puerto UDP 6454. Debe estar en la misma red que la fuente.';

  @override
  String get artnetErrorBind =>
      'No se puede abrir el socket UDP. Verifique los permisos de red.';

  @override
  String get sacnTitle => 'Visualizador sACN';

  @override
  String get sacnStartButton => 'Empezar a escuchar';

  @override
  String get sacnStopButton => 'Detener';

  @override
  String get sacnListening => 'Escuchando - Puerto 5568';

  @override
  String get sacnNotListening => 'Inactivo';

  @override
  String get sacnNoPackets => 'Esperando paquetes sACN...';

  @override
  String get sacnUniversesTitle => 'Universo recibido';

  @override
  String sacnUniverseTitle(int universe) {
    return 'Universo $universe';
  }

  @override
  String sacnSource(Object name) {
    return 'Fuente: $name';
  }

  @override
  String sacnPriority(int value) {
    return 'Prioridad: $value';
  }

  @override
  String sacnCid(Object cid) {
    return 'CID: $cid';
  }

  @override
  String sacnPackets(int count) {
    return '$count paquetes';
  }

  @override
  String sacnFps(Object fps) {
    return '$fps fps';
  }

  @override
  String get sacnShowActiveOnly => 'Solo canales activos';

  @override
  String sacnActiveCount(int count) {
    return '$count canales activos';
  }

  @override
  String get sacnPlatformInfo =>
      'sACN / E1.31: puerto UDP 5568. Se admite multidifusión 239.255.x.x y unidifusión.';

  @override
  String get sacnErrorBind =>
      'No se puede abrir el socket UDP. Verifique los permisos de red.';

  @override
  String get sacnIosMulticastNote =>
      'En iOS 14+, la multidifusión sACN puede requerir permiso de acceso a la red local.';

  @override
  String get diagCardTitle => 'Diagnóstico de red';

  @override
  String get diagCardSubtitle =>
      'Análisis automático de redes, Art-Net y sACN.';

  @override
  String get diagPageTitle => 'Diagnóstico de red';

  @override
  String get diagPlatformInfo =>
      'Ejecute un escaneo de red + escuche Art-Net/sACN durante unos segundos, luego busque posibles problemas.';

  @override
  String get diagAnalyseButton => 'Analizar';

  @override
  String get diagCancelButton => 'Cancelar';

  @override
  String get diagClearButton => 'para borrar';

  @override
  String get diagSnapshotButton => 'Instantánea';

  @override
  String get diagScoreLabel => 'Puntuación de salud de la red';

  @override
  String get diagStatusOk => 'Red correcta';

  @override
  String get diagStatusWarning => 'Atención';

  @override
  String get diagStatusCritical => 'Crítico';

  @override
  String diagAnalysisDate(Object date) {
    return 'Analizado el $date';
  }

  @override
  String get diagSeverityInfo => 'Información';

  @override
  String get diagSeverityWarning => 'Advertencia';

  @override
  String get diagSeverityCritical => 'Crítico';

  @override
  String get diagScanningNetwork => 'Escaneo de red en progreso...';

  @override
  String get diagCollectingFlux => 'Colección de flujos Art-Net / sACN…';

  @override
  String get diagAnalyzing => 'Análisis en curso...';

  @override
  String diagScanProgress(int done, int total) {
    return '$done / $total IP escaneadas';
  }

  @override
  String get diagNoResultYet =>
      'Presione \"Escanear\" para iniciar el diagnóstico de red.';

  @override
  String get diagAlertsTitle => 'Alertas';

  @override
  String get diagNoAlerts => 'No se detectaron alertas: red en buen estado.';

  @override
  String get diagSnapshotSaved => 'Instantánea guardada.';

  @override
  String get diagNoLocalIp =>
      'No se detectó ninguna dirección IP local o ésta no es válida.';

  @override
  String get diagNoDevices => 'No se detectaron dispositivos en la red.';

  @override
  String get diagNoArtNet => 'No se recibieron transmisiones de Art-Net.';

  @override
  String get diagNoSacn => 'No se recibieron transmisiones sACN/E1.31.';

  @override
  String diagDuplicateIp(Object ip) {
    return 'Dirección IP duplicada detectada: $ip.';
  }

  @override
  String diagArtNetLowFps(int universe, Object fps) {
    return 'Art-Net Universo $universe: FPS bajo ($fps fps).';
  }

  @override
  String diagSacnLowFps(int universe, Object fps) {
    return 'sACN Universo $universe: FPS bajo ($fps fps).';
  }

  @override
  String diagZeroDmxChannels(Object protocol, int universe) {
    return '$protocol Universo $universe: flujo activo pero todos los canales DMX están en cero.';
  }

  @override
  String diagManyUnknownDevices(int count) {
    return '$count dispositivos sin nombre detectados en la red.';
  }

  @override
  String get ndiCardTitle => 'Descubrimiento NDI';

  @override
  String get ndiCardSubtitle => 'Fuentes NDI / NewTek en la red vía mDNS.';

  @override
  String get ndiPageTitle => 'Descubrimiento NDI';

  @override
  String get ndiStartButton => 'para empezar';

  @override
  String get ndiStopButton => 'Detener';

  @override
  String get ndiDiscovering => 'Investigación en progreso…';

  @override
  String get ndiHint => 'Presione “Inicio” para buscar fuentes NDI en la red.';

  @override
  String get ndiNoSources => 'No se detectaron fuentes NDI en esta red.';

  @override
  String get ndiIosNote =>
      'En iOS, el descubrimiento de mDNS puede estar limitado según la configuración de la red.';

  @override
  String ndiSourcesFound(int count) {
    return '$count fuente(s) NDI encontradas';
  }

  @override
  String get ndiLabelName => 'Fuente';

  @override
  String get ndiLabelHost => 'Máquina';

  @override
  String get ndiLabelIp => 'IP';

  @override
  String get ndiLabelPort => 'Puerto';

  @override
  String get ndiLabelService => 'Servicio';

  @override
  String get snapshotCardTitle => 'Instantáneas de red';

  @override
  String get snapshotCardSubtitle =>
      'Registre y compare el estado de la red en diferentes momentos.';

  @override
  String get snapshotPageTitle => 'Instantáneas de red';

  @override
  String get snapshotEmpty => 'No se guardaron instantáneas.';

  @override
  String get snapshotDeleteConfirm => '¿Eliminar esta instantánea?';

  @override
  String get snapshotDeleteButton => 'BORRAR';

  @override
  String get snapshotCompareButton => 'Comparar';

  @override
  String get snapshotComparisonTitle => 'Comparación';

  @override
  String get snapshotComparisonSelectTwo =>
      'Seleccione dos instantáneas para comparar.';

  @override
  String get snapshotSnapshotA => 'Instantánea A';

  @override
  String get snapshotSnapshotB => 'Instantánea B';

  @override
  String get snapshotDevices => 'Dispositivos';

  @override
  String get snapshotArtnetUniverses => 'Universo Art-Net';

  @override
  String get snapshotSacnUniverses => 'Universo sACN';

  @override
  String get snapshotNdiSources => 'Fuentes NDI';

  @override
  String get snapshotAlerts => 'Alertas';

  @override
  String get snapshotAdded => 'Apareció';

  @override
  String get snapshotRemoved => 'Desaparecido';

  @override
  String get snapshotNoChanges =>
      'No hay diferencia entre las dos instantáneas.';

  @override
  String get snapshotNoScore => 'Puntuación no disponible';

  @override
  String get subscriptionCategoryNetworkTitle => 'Red profesional';

  @override
  String get subscriptionCategoryNetworkDescription =>
      'Herramientas de red avanzadas: Art-Net, sACN, NDI, diagnósticos e instantáneas.';

  @override
  String get subscriptionHeadlineNetworkSubtitle =>
      'Desbloquea el visor Art-Net, el visor sACN, NDI, diagnósticos de red e instantáneas.';

  @override
  String get networkPremiumLabel => 'DE PRIMERA CALIDAD';

  @override
  String get networkPremiumUnlockButton => 'Desatascar';

  @override
  String get networkPremiumBannerText =>
      'Art-Net, sACN, NDI, los diagnósticos y las instantáneas requieren una suscripción a Pro Network.';

  @override
  String get subscriptionCategoryNetworkShort => 'RED';

  @override
  String get dashboardPageTitle => 'Panel de red';

  @override
  String get dashboardCardTitle => 'Panel de red';

  @override
  String get dashboardCardSubtitle => 'Vista de red en tiempo real';

  @override
  String get dashboardStatusIdle => 'En espera';

  @override
  String get dashboardStatusScanning => 'Escaneo en progreso…';

  @override
  String get dashboardStatusCompleted => 'Escaneo completado';

  @override
  String get dashboardStatusError => 'error de red';

  @override
  String get dashboardStatusListening => 'Escucha activa';

  @override
  String get dashboardKpiDevices => 'Dispositivos';

  @override
  String get dashboardKpiArtnet => '__TECNOLOGÍA_1__';

  @override
  String get dashboardKpiSacn => '__TECNOLOGÍA_2__';

  @override
  String get dashboardKpiNdi => '__TECNOLOGÍA_9__';

  @override
  String get dashboardKpiScore => 'Puntaje';

  @override
  String get dashboardNoScore => '–';

  @override
  String get dashboardSectionAlerts => 'Alertas activas';

  @override
  String get dashboardNoAlerts => 'Ninguna alerta activa';

  @override
  String get dashboardSectionSnapshot => 'Última instantánea';

  @override
  String get dashboardNoSnapshot => 'No hay instantáneas guardadas';

  @override
  String get dashboardSectionQuickAccess => 'Acceso rápido';

  @override
  String get dashboardRescanButton => 'Volver a escanear';

  @override
  String get dashboardNdiRefreshButton => 'Actualización NDI';

  @override
  String get dashboardArtnetActive => 'Art-Net activo';

  @override
  String get dashboardSacnActive => 'sACN activo';

  @override
  String get dashboardNdiScanning => 'Descubrimiento NDI…';

  @override
  String dashboardAlertNewDevice(Object ip) {
    return 'Nuevo dispositivo: $ip';
  }

  @override
  String dashboardAlertLostDevice(Object ip) {
    return 'Falta dispositivo: $ip';
  }

  @override
  String dashboardAlertNewArtnetUniverse(int universe) {
    return 'Nuevo universo Art-Net: $universe';
  }

  @override
  String dashboardAlertLostArtnetUniverse(int universe) {
    return 'El universo Art-Net desapareció: $universe';
  }

  @override
  String dashboardAlertNewSacnUniverse(int universe) {
    return 'Nuevo universo sACN: $universe';
  }

  @override
  String dashboardAlertLostSacnUniverse(int universe) {
    return 'El universo sACN desapareció: $universe';
  }

  @override
  String dashboardAlertNewNdiSource(Object name) {
    return 'Nueva fuente NDI: $name';
  }

  @override
  String dashboardAlertLostNdiSource(Object name) {
    return 'Fuente NDI desapareció: $name';
  }

  @override
  String dashboardAlertArtnetLowFps(int universe, Object fps) {
    return 'Art-Net U$universe: FPS bajo ($fps)';
  }

  @override
  String dashboardAlertSacnLowFps(int universe, Object fps) {
    return 'sACN U$universe: FPS bajo ($fps)';
  }

  @override
  String dashboardAlertSacnDuplicate(int universe, int count) {
    return 'sACN U$universe: $count fuentes activas';
  }

  @override
  String dashboardAlertSacnPriority(int universe) {
    return 'sACN U$universe: conflicto de prioridad';
  }

  @override
  String dashboardScanProgress(int progress) {
    return 'Escaneo de red: $progress%';
  }

  @override
  String get luminexPageTitle => 'Luminex Monitorear';

  @override
  String get luminexMonitorCardTitle => 'Luminex Monitorear';

  @override
  String get luminexMonitorCardSubtitle =>
      'Interruptores de monitoreo GigaCore';

  @override
  String get luminexAddDevice => 'Agregar equipo';

  @override
  String get luminexAddDeviceTitle => 'Dirección IP del conmutador';

  @override
  String get luminexAddDeviceHint => '192.168.xx';

  @override
  String get luminexAddDeviceConfirm => 'Agregar';

  @override
  String get luminexAddDeviceCancel => 'Cancelar';

  @override
  String get luminexNoDevices => 'Sin interruptor Luminex';

  @override
  String get luminexNoDevicesHint =>
      'Agregue una IP manualmente o ejecute un escaneo de red.';

  @override
  String get luminexRefreshAll => 'Actualizar todo';

  @override
  String get luminexRemoveDevice => 'Retirar';

  @override
  String get luminexScanForDevices => 'buscar en la red';

  @override
  String get luminexReachable => 'Accesible';

  @override
  String get luminexUnreachable => 'Inaccesible';

  @override
  String get luminexPolling => 'Pregunta…';

  @override
  String get luminexNoAlarms => 'Sin alarma';

  @override
  String get luminexSectionSystem => 'Información del sistema';

  @override
  String get luminexSectionPorts => 'Puertos';

  @override
  String get luminexSectionAlarms => 'Alarmas activas';

  @override
  String get luminexLabelName => 'Nombre';

  @override
  String get luminexLabelModel => 'Modelo';

  @override
  String get luminexLabelFirmware => 'firmware';

  @override
  String get luminexLabelUptime => 'tiempo de actividad';

  @override
  String get luminexLabelTemperature => 'Temperatura';

  @override
  String get luminexLabelPsu => 'Alimento';

  @override
  String get luminexPsuOk => 'Bueno';

  @override
  String get luminexPsuAbsent => 'Ausente';

  @override
  String get luminexLabelApi => 'API';

  @override
  String get luminexGen1 => 'Generación 1 (texto)';

  @override
  String get luminexGen2 => 'Generación 2 (JSON)';

  @override
  String get luminexGenUnknown => 'Desconocido';

  @override
  String get luminexPortUp => 'Activo';

  @override
  String get luminexPortDown => 'Inactivo';

  @override
  String get luminexPortUnknown => 'Desconocido';

  @override
  String get luminexPortPoeActive => 'PoE activo';

  @override
  String get luminexPortPoeFault => 'PoE predeterminado';

  @override
  String get luminexPortPoeOff => 'PoE inactivo';

  @override
  String get luminexPortNoPoe => 'Sin PoE';

  @override
  String get luminexDetectedScan => 'Escaneo de red';

  @override
  String get luminexDetectedManual => 'Adición manual';

  @override
  String get luminexNotAvailable => 'N / A';

  @override
  String get luminexAlarmInaccessible => 'Cambiar inaccesible';

  @override
  String get luminexAlarmPsuAbsent => 'Sin fuente de alimentación';

  @override
  String luminexAlarmCount(int count) {
    return '$count alarma(s) activa(s)';
  }

  @override
  String luminexPortSpeed(int speed) {
    return '${speed}Mbps';
  }

  @override
  String luminexPortRxErrors(int count) {
    return 'RX: $count error.';
  }

  @override
  String luminexPortTxErrors(int count) {
    return 'TX: $count error.';
  }

  @override
  String luminexAlarmPortDown(int port) {
    return 'Puerto $port fuera de línea';
  }

  @override
  String luminexAlarmSpeedDegraded(int port, int speed) {
    return 'Puerto $port: velocidad degradada ($speed Mb/s)';
  }

  @override
  String luminexAlarmHighRxErrors(int port, int count) {
    return 'Puerto $port: Errores de RX altos ($count)';
  }

  @override
  String luminexAlarmHighTxErrors(int port, int count) {
    return 'Puerto $port: errores de TX altos ($count)';
  }

  @override
  String luminexAlarmPoeFault(int port) {
    return 'Puerto $port: predeterminado PoE';
  }

  @override
  String luminexAlarmHighTemp(Object temp) {
    return 'Temperatura alta: $temp°C';
  }

  @override
  String get manetPageTitle => 'MA-Net Monitorear';

  @override
  String get manetMonitorCardTitle => 'MA-Net Monitorear';

  @override
  String get manetMonitorCardSubtitle => 'Detección de nodos grandMA2/3';

  @override
  String get manetNoNodes => 'No se detectaron MA-Net nodos';

  @override
  String get manetListening => 'Escuchando en progreso...';

  @override
  String get manetNodeType => 'Amable';

  @override
  String get manetFirmware => 'firmware';

  @override
  String get manetMac => 'dirección MAC';

  @override
  String get manetLastSeen => 'visto hay';

  @override
  String get manetProtocol => '__TECNOLOGÍA_3__';

  @override
  String get manetProtocolMaNet2 => '__TECNOLOGÍA_3__2';

  @override
  String get manetProtocolMaNet3 => '__TECNOLOGÍA_3__3';

  @override
  String get manetEmptyHint =>
      'Asegúrese de estar en la misma red que el equipo MA Lighting';

  @override
  String manetNodeCount(int count) {
    return '$count nodo(s) en línea';
  }

  @override
  String manetPortListening(int port) {
    return 'UDP:$port';
  }

  @override
  String get helpPageTitle => 'Guía de herramientas de red';

  @override
  String get helpIntro =>
      'Todas las herramientas funcionan en modo de solo lectura en su red local. Toque una herramienta para ver los detalles.';

  @override
  String get helpSectionDoes => 'que hace';

  @override
  String get helpSectionDelay => 'límite de tiempo';

  @override
  String get helpSectionLimits => 'lo que no hace';

  @override
  String get helpSectionTip => 'Consejo';

  @override
  String get helpGeneralTitle => 'Consejos generales';

  @override
  String get helpGeneralSubnet =>
      'Todas las herramientas funcionan en la subred local /24. No se detectarán equipos en una VLAN diferente o detrás de un enrutador.';

  @override
  String get helpGeneralFirewall =>
      'Los cortafuegos de software pueden bloquear algunas sondas. En caso de faltar equipos, consulte las reglas de filtrado.';

  @override
  String get helpGeneralWifi =>
      'Las redes WiFi con aislamiento de cliente bloquean el descubrimiento. Prefiere una conexión por cable o WiFi en modo puente.';

  @override
  String get helpToolScanDoes =>
      'Explora la subred /24 en paralelo e identifica los dispositivos activos. Muestra la IP actual, el nombre de host, el fabricante (a través de OUI MAC) y los puertos abiertos.';

  @override
  String get helpToolScanDelay =>
      'De 15 a 30 segundos dependiendo del tamaño de la red. 50 sondas simultáneas.';

  @override
  String get helpToolScanLimits =>
      'No cruza VLAN ni enrutadores. No realiza escaneo completo de puertos ni escaneo WAN.';

  @override
  String get helpToolScanTip =>
      'Si los dispositivos no aparecen, verifique que su firewall no esté bloqueando las sondas TCP/ICMP entrantes.';

  @override
  String get helpToolDashboardDoes =>
      'Muestra el estado de los equipos detectados en tiempo real: disponibilidad, latencia, alertas de red activa.';

  @override
  String get helpToolDashboardDelay =>
      'Actualizado cada 30 segundos. Primera carga inmediata después del escaneo.';

  @override
  String get helpToolDashboardLimits =>
      'No retiene el historial entre sesiones. Requiere un escaneo previo para completar la lista de equipos.';

  @override
  String get helpToolDashboardTip =>
      'Ejecute un escaneo de red antes de abrir el panel para ver todos los equipos disponibles.';

  @override
  String get helpToolArtNetDoes =>
      'Escucha pasivamente paquetes Art-Net (UDP 6454) y muestra universos DMX activos con sus valores en tiempo real.';

  @override
  String get helpToolArtNetDelay =>
      'Tiempo real: los datos aparecen en menos de un segundo tras la recepción del paquete.';

  @override
  String get helpToolArtNetLimits =>
      'No hay salida DMX. No configura nodos Art-Net y no administra el protocolo RDM.';

  @override
  String get helpToolArtNetTip =>
      'Art-Net no atraviesa enrutadores. Todos los equipos deben estar en la misma red L2 (mismo conmutador o mismo segmento).';

  @override
  String get helpToolSacnDoes =>
      'Escucha transmisiones de multidifusión sACN/E1.31 (UDP 5568) y muestra universos activos, prioridades de fuente y valores DMX.';

  @override
  String get helpToolSacnDelay =>
      'Tiempo real: latencia inferior a un segundo.';

  @override
  String get helpToolSacnLimits =>
      'No hay salida DMX. No modifica las prioridades ni la configuración de las fuentes sACN.';

  @override
  String get helpToolSacnTip =>
      'La multidifusión sACN requiere un conmutador administrado con vigilancia IGMP habilitada para evitar tormentas de transmisión en la red.';

  @override
  String get helpToolNdiDoes =>
      'Descubre fuentes de vídeo NDI en la LAN a través del protocolo de descubrimiento NDI. Muestra el nombre, dirección IP y tipo de cada fuente.';

  @override
  String get helpToolNdiDelay =>
      'Las fuentes aparecen entre 5 y 15 segundos después de conectarse a la red.';

  @override
  String get helpToolNdiLimits =>
      'No hay reproducción de video ni enrutamiento NDI. No detecta fuentes NDI|HX sin descubrimiento mDNS activo.';

  @override
  String get helpToolNdiTip =>
      'NDI requiere un mínimo de 100 Mb/s por transmisión. Evite WiFi para producción; prefiera una conexión Gigabit por cable.';

  @override
  String get helpToolDiagDoes =>
      'Ejecuta una serie de pruebas de estado de la red: conectividad, resolución de DNS, latencia, pérdida de paquetes y disponibilidad del servicio.';

  @override
  String get helpToolDiagDelay => 'Diagnóstico completo en 20 a 30 segundos.';

  @override
  String get helpToolDiagLimits =>
      'Solo diagnóstico: sin reparaciones automáticas ni cambios de configuración.';

  @override
  String get helpToolDiagTip =>
      'Ejecute un diagnóstico antes y después de una intervención en la red para comparar el estado y aislar rápidamente las regresiones.';

  @override
  String get helpToolSnapshotDoes =>
      'Captura el estado de la red en un momento determinado (equipos, servicios) y permite comparar dos instantáneas para identificar cambios.';

  @override
  String get helpToolSnapshotDelay =>
      'Capture en 30 a 45 segundos dependiendo del tamaño de la red.';

  @override
  String get helpToolSnapshotLimits =>
      'Sin seguimiento continuo ni alertas automáticas. El historial se guarda únicamente en este dispositivo.';

  @override
  String get helpToolSnapshotTip =>
      'Ideal para documentar el estado antes/después de un cambio de infraestructura o para aislar una regresión durante la resolución de problemas.';

  @override
  String get helpToolLuminexDoes =>
      'Consulta los conmutadores GigaCore Luminex a través de su API HTTP. Muestra el estado del puerto (enlace, velocidad, PoE, errores), temperatura, fuentes de alimentación y activa alarmas.';

  @override
  String get helpToolLuminexDelay =>
      'Encuesta cada 30 segundos. Descubrimiento automático en la subred: de 15 a 30 segundos.';

  @override
  String get helpToolLuminexLimits =>
      'Solo lectura. No hay cambios en la configuración de VLAN, grupo o puerto. No admite videos MA-Net o NDI.';

  @override
  String get helpToolLuminexTip =>
      'Autenticación predeterminada: administrador/contraseña vacía. Los Gen2 exponen /api/v1/, los Gen1 responden en /stat/ports en texto sin formato.';

  @override
  String get helpToolManetDoes =>
      'Escucha pasivamente el puerto UDP 6549 y detecta consolas y nodos grandMA2/3 que se anuncian en la red. Muestra el nombre, el tipo de dispositivo, la versión de firmware y la dirección MAC.';

  @override
  String get helpToolManetDelay =>
      'Los dispositivos aparecen tan pronto como su próxima transmisión en red, generalmente en menos de 10 segundos.';

  @override
  String get helpToolManetLimits =>
      'Solo lectura. No se muestran datos, no hay valor DMX, no hay configuración. No cruza VLAN.';

  @override
  String get helpToolManetTip =>
      'Si no aparece ningún dispositivo: verifique que la emisora ​​​​grandMA esté en la LAN y que el puerto UDP 6549 no esté bloqueado por un firewall.';

  @override
  String get bwCardTitle => 'Ancho de banda';

  @override
  String get bwCardSubtitle => 'Broadcast + switch SNMP';

  @override
  String get bwHubTitle => 'Ancho de banda';

  @override
  String get bwHubSubtitle =>
      'Opción 1 — solo tráfico broadcast (sin equipo necesario). Opción 2 — ancho de banda real por puerto via SNMP (switch administrado requerido).';

  @override
  String get bwHubTagFree => 'GRATIS';

  @override
  String get bwHubCardBroadcastTitle => 'Broadcast de red';

  @override
  String get bwHubCardBroadcastSubtitle => 'Art-Net · sACN · MA-Net';

  @override
  String get bwHubCardBroadcastLimit =>
      'Tráfico unicast no visible (NDI, Dante…)';

  @override
  String get bwHubCardSnmpTitle => 'Puertos del switch';

  @override
  String get bwHubCardSnmpSubtitle => 'Vista por puerto, todo el tráfico';

  @override
  String get bwHubCardSnmpRequires => 'Switch administrado SNMP necesario';

  @override
  String get bwBroadcastPageTitle => 'Broadcast de red';

  @override
  String get bwBroadcastWarning =>
      'Solo broadcast y multicast. El tráfico unicast (NDI, Dante…) no es visible desde este dispositivo.';

  @override
  String get bwBroadcastListening => 'Escuchando';

  @override
  String get bwBroadcastTotal => 'Total';

  @override
  String get bwSnmpPageTitle => 'Puertos del switch';

  @override
  String get bwSnmpConfigTitle => 'Conexión SNMP';

  @override
  String get bwSnmpHost => 'IP del switch';

  @override
  String get bwSnmpHostHint => '192.168.1.1';

  @override
  String get bwSnmpCommunity => 'Community';

  @override
  String get bwSnmpCommunityHint => 'public';

  @override
  String get bwSnmpConnect => 'Conectar';

  @override
  String get bwSnmpDisconnect => 'Desconectar';

  @override
  String get bwSnmpConnecting => 'Conectando…';

  @override
  String get bwSnmpError => 'Error SNMP';

  @override
  String get bwSnmpReqTitle => 'Requisitos';

  @override
  String get bwSnmpReq1 => 'Switch administrado con SNMP v2c habilitado';

  @override
  String get bwSnmpReq2 =>
      'Cadena community (predeterminado: \"public\" en Luminex GigaCore)';

  @override
  String get bwSnmpReq3 => 'IP del switch accesible desde este dispositivo';

  @override
  String get bwSnmpPortUp => 'Activo';

  @override
  String get bwSnmpPortDown => 'Inactivo';

  @override
  String get bwSnmpNoData => 'Esperando datos…';

  @override
  String bwSnmpPortCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return '$count puerto$_temp0';
  }

  @override
  String get bwUnitKbps => 'kbps';

  @override
  String get bwUnitMbps => 'Mbps';

  @override
  String get bwUnitPkts => 'paq./s';

  @override
  String get bwLabelIn => '↓ Entrada';

  @override
  String get bwLabelOut => '↑ Salida';

  @override
  String get conversionsVolumesTitle => 'Volúmenes';

  @override
  String get volumeCalcCardTitle => 'Volumen — cubo, cilindro, esfera…';

  @override
  String get volumeCalcUnitLabel => 'Unidad de las dimensiones';

  @override
  String get volumeCalcPlaceholder =>
      'Completa las dimensiones para ver el volumen ✨';

  @override
  String get volumeShapeCube => 'Cubo';

  @override
  String get volumeShapeBox => 'Prisma rectangular';

  @override
  String get volumeShapeCylinder => 'Cilindro';

  @override
  String get volumeShapeSphere => 'Esfera';

  @override
  String get volumeShapeCone => 'Cono';

  @override
  String get volumeShapeSquarePyramid => 'Pirámide (base cuadrada)';

  @override
  String get volumeFieldSide => 'Lado';

  @override
  String get volumeFieldLength => 'Longitud';

  @override
  String get volumeFieldWidth => 'Anchura';

  @override
  String get volumeFieldHeight => 'Altura';

  @override
  String get volumeFieldRadius => 'Radio';

  @override
  String get volumeFieldRadiusBase => 'Radio (base)';

  @override
  String get volumeFieldSideBase => 'Lado (base)';

  @override
  String get aboutVesaTitle => 'Soportes VESA y tamaños de pantalla';

  @override
  String get aboutVesaSubtitle =>
      'Normas VESA, buscador de estándar y cálculo de diagonal';

  @override
  String get vesaIntroTitle => 'VESA y pantallas, de un vistazo';

  @override
  String get vesaIntroBody =>
      'VESA (Video Electronics Standards Association) estandariza la separación de los orificios de fijación en la parte trasera de pantallas, televisores y monitores. Cuanto más grande y pesada es la pantalla, mayor es la separación entre orificios. Comprueba siempre el peso y el patrón VESA indicados por el fabricante antes de elegir un soporte — esta página ofrece órdenes de magnitud, no valores garantizados.';

  @override
  String get vesaTableTitle => 'Estándares VESA habituales';

  @override
  String get vesaColEntraxe => 'Separación';

  @override
  String get vesaColScreenSize => 'Tamaño de pantalla';

  @override
  String get vesaColMaxWeight => 'Peso máx.';

  @override
  String get vesaTableFooterNote =>
      'Rangos indicativos: un fabricante puede perfectamente ofrecer un VESA más amplio que la media para una pantalla dada, especialmente en pantallas profesionales y muros de LED. Comprueba siempre la ficha técnica.';

  @override
  String get vesaLargeFormat => 'Grandes formatos / muros de LED';

  @override
  String get vesaFinderTitle => '¿Qué VESA he medido?';

  @override
  String get vesaFinderHint =>
      'Mide la separación entre dos orificios (horizontal y vertical) en la parte trasera de la pantalla, en milímetros.';

  @override
  String get vesaFieldHorizontal => 'Separación horizontal (mm)';

  @override
  String get vesaFieldVertical => 'Separación vertical (mm)';

  @override
  String get vesaFinderPlaceholder =>
      'Introduce ambas separaciones para identificar el estándar.';

  @override
  String vesaFinderExactMatch(Object pattern) {
    return 'Estándar VESA $pattern 🎯';
  }

  @override
  String vesaFinderNearestMatch(Object pattern, Object delta) {
    return 'Sin coincidencia exacta — el más cercano es $pattern (diferencia combinada de $delta mm). Comprueba tu medición.';
  }

  @override
  String get vesaScreenCalcTitle =>
      'Dimensiones de una pantalla a partir de su diagonal';

  @override
  String get vesaFieldDiagonal => 'Diagonal (pulgadas)';

  @override
  String get vesaScreenCalcPlaceholder => 'Indica una diagonal en pulgadas.';

  @override
  String get vesaResultDiagonal => 'Diagonal';

  @override
  String get vesaResultWidth => 'Anchura';

  @override
  String get vesaResultHeight => 'Altura';

  @override
  String get vesaResultArea => 'Superficie';

  @override
  String get vesaTipsTitle => 'Consejos de fijación';

  @override
  String get vesaTip1 =>
      'Utiliza siempre los 4 (o más) tornillos suministrados — nunca 2 en diagonal.';

  @override
  String get vesaTip2 =>
      'Respeta el par de apriete indicado: apretar demasiado puede agrietar el chasis.';

  @override
  String get vesaTip3 =>
      'Para un montaje en altura o en un puente, prevé una eslinga o una seguridad secundaria independiente del soporte VESA.';

  @override
  String get vesaTip4 =>
      'En carga dinámica (movimiento, vibraciones, transporte), reduce la carga admisible respecto a la carga estática del fabricante.';

  @override
  String get vesaTip5 =>
      'Comprueba la longitud de los tornillos: si son demasiado largos, pueden dañar la electrónica interna de la pantalla.';

  @override
  String get vesaTip6 =>
      'Un adaptador VESA (75→100, 100→200…) debe anotarse en la ficha de carga — añade peso y brazo de palanca.';

  @override
  String get cctFilterTitle => 'Filtro ↔ Temperatura de color (K)';

  @override
  String get cctFilterTileDescription =>
      'Qué CTO/CTB elegir entre dos temperaturas, en cualquier sentido';

  @override
  String get cctFilterIntro =>
      'Encuentra al instante el filtro CTO/CTB que necesitas, o comprueba el resultado de un filtro que ya tienes — en cualquier sentido ✨';

  @override
  String get cctModeFindFilter => '¿Qué filtro?';

  @override
  String get cctModeSourcePlusFilter => 'K + filtro → ¿K?';

  @override
  String get cctModeTargetPlusFilter => 'K objetivo + filtro → ¿K de partida?';

  @override
  String get cctFieldSourceK => 'Temperatura de partida (K)';

  @override
  String get cctFieldTargetK => 'Temperatura deseada (K)';

  @override
  String get cctFieldTargetKFinal => 'Temperatura final deseada (K)';

  @override
  String get cctFieldFilter => 'Filtro';

  @override
  String get cctDescEighthCtb => 'Enfría muy ligeramente';

  @override
  String get cctDescQuarterCtb => 'Enfría ligeramente';

  @override
  String get cctDescHalfCtb => 'Enfría moderadamente';

  @override
  String get cctDescThreeQuarterCtb => 'Enfría fuertemente';

  @override
  String get cctDescFullCtb => 'Tungsteno → luz de día';

  @override
  String get cctDescEighthCto => 'Calienta muy ligeramente';

  @override
  String get cctDescQuarterCto => 'Calienta ligeramente';

  @override
  String get cctDescHalfCto => 'Calienta moderadamente';

  @override
  String get cctDescThreeQuarterCto => 'Calienta fuertemente';

  @override
  String get cctDescFullCto => 'Luz de día → tungsteno';

  @override
  String get cctFindFilterPlaceholder =>
      'Introduce ambas temperaturas para encontrar el filtro adecuado.';

  @override
  String get cctRequiredShiftLabel => 'Desplazamiento necesario';

  @override
  String get cctMiredShiftLabel => 'Mired shift';

  @override
  String cctBestChoice(Object name, Object k) {
    return 'Mejor opción: $name → ≈ $k K';
  }

  @override
  String cctApproxKelvin(Object k) {
    return '≈ $k K';
  }

  @override
  String get cctOtherFiltersNearby => 'Otros filtros cercanos';

  @override
  String get cctDisclaimer =>
      'Valores de desplazamiento mired estándar, aproximados — consulta la ficha técnica del fabricante para un uso crítico.';

  @override
  String get cctSourcePlaceholder => 'Introduce la temperatura de partida.';

  @override
  String get cctTargetPlaceholder => 'Introduce la temperatura final deseada.';

  @override
  String get cctOutOfRange =>
      'Combinación fuera de rango (resultado no físico) — prueba con otra temperatura u otro filtro.';

  @override
  String get cctResultObtainedTemp => 'Temperatura obtenida';

  @override
  String get cctResultAppliedFilter => 'Filtro aplicado';

  @override
  String get cctResultRequiredSource => 'Fuente necesaria';

  @override
  String get cctResultFilterToApply => 'Filtro a aplicar';

  @override
  String get cctBrandLabel => 'Marca de filtro';

  @override
  String get cctAllBrands => 'Todas las marcas';

  @override
  String get timecodeHubTitle => 'Timecode';

  @override
  String get timecodeToolConverterLabel => 'Conversor\nde framerate';

  @override
  String get timecodeToolMathLabel => 'Duración y\ndesfase';

  @override
  String get timecodeToolDelayLabel => 'Frame ↔ ms';

  @override
  String get timecodeToolCountdownLabel => 'Cuenta\natrás';

  @override
  String get timecodeBadgeFree => 'GRATIS';

  @override
  String get timecodeBadgeNew => 'NUEVO';

  @override
  String get timecodeConverterTitle => 'Conversor de framerate';

  @override
  String get timecodeConverterSourceCardTitle => 'Timecode de origen';

  @override
  String get timecodeConverterFieldLabel => 'HH:MM:SS:FF';

  @override
  String get timecodeConverterFieldHint => '01:00:00:00';

  @override
  String get timecodeConverterSourceRateLabel => 'Framerate de origen';

  @override
  String get timecodeConverterSwapTooltip => 'Intercambiar origen / destino';

  @override
  String get timecodeConverterTargetCardTitle => 'Framerate de destino';

  @override
  String get timecodeConverterTargetRateLabel => 'Framerate de destino';

  @override
  String get timecodeConverterButton => 'Convertir';

  @override
  String timecodeConverterErrorInvalid(String rateLabel, int frameBase) {
    return '❌ Timecode no válido para $rateLabel (formato esperado: HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeConverterResult(String rateLabel, String tc, String seconds) {
    return 'TC en $rateLabel:\n$tc\n\n(≈ $seconds s transcurridos desde 00:00:00:00)';
  }

  @override
  String get timecodeMathTitle => 'Duración y desfase';

  @override
  String get timecodeMathModeDuration => 'Duración entre 2 TC';

  @override
  String get timecodeMathModeOffset => 'Desfasar un TC';

  @override
  String get timecodeMathRateCardTitle => 'Framerate';

  @override
  String get timecodeMathDurationCardTitle => 'Timecode In / Out';

  @override
  String get timecodeMathTcInLabel => 'TC In (HH:MM:SS:FF)';

  @override
  String get timecodeMathTcOutLabel => 'TC Out (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeDurationButton => 'Calcular duración';

  @override
  String timecodeMathErrorDuration(int frameBase) {
    return '❌ Comprueba ambos timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathDurationResult(
      String duration, int frames, String rateLabel) {
    return 'Duración: $duration\n($frames frame(s) a $rateLabel)';
  }

  @override
  String get timecodeMathOffsetCardTitle => 'Timecode de inicio + desfase';

  @override
  String get timecodeMathBaseTcLabel => 'TC de inicio (HH:MM:SS:FF)';

  @override
  String get timecodeMathAddLabel => '+ Sumar';

  @override
  String get timecodeMathSubtractLabel => '− Restar';

  @override
  String get timecodeMathOffsetLabel => 'Desfase — duración (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeOffsetButton => 'Calcular nuevo TC';

  @override
  String timecodeMathErrorOffset(int frameBase) {
    return '❌ Comprueba el timecode de inicio y el desfase (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathOffsetResult(String tc) {
    return 'Nuevo timecode:\n$tc';
  }

  @override
  String get timecodeDelayTitle => 'Frame ↔ ms';

  @override
  String get timecodeDelayCardTitle => 'Retardo de vídeo / audio';

  @override
  String get timecodeDelayIntro =>
      'Útil para corregir un desfase de lip-sync o un retardo de procesador de vídeo/LED: introduce un valor, elige su unidad y obtén el equivalente.';

  @override
  String get timecodeDelayRateLabel => 'Framerate';

  @override
  String get timecodeDelayUnitFrames => 'Frames';

  @override
  String get timecodeDelayUnitMs => 'Milisegundos';

  @override
  String get timecodeDelayValueLabelFrames => 'Número de frames';

  @override
  String get timecodeDelayValueLabelMs => 'Milisegundos';

  @override
  String get timecodeDelayButton => 'Convertir';

  @override
  String get timecodeDelayErrorInvalid => '❌ Valor no válido.';

  @override
  String timecodeDelayResultFromFrames(
      int frames, String rateLabel, String ms, String duration) {
    return '$frames frame(s) a $rateLabel\n= $ms ms\n= $duration';
  }

  @override
  String timecodeDelayResultFromMs(
      String ms, String rateLabel, int frames, String duration) {
    return '$ms ms a $rateLabel\n= $frames frame(s)\n= $duration';
  }

  @override
  String get timecodeCountdownTitle => 'Cuenta atrás';

  @override
  String get timecodeCountdownSettingsCardTitle => 'Ajustes';

  @override
  String get timecodeCountdownRateLabel => 'Framerate';

  @override
  String get timecodeCountdownCurrentTcLabel => 'TC actual (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownFillNowTooltip =>
      'Rellenar con la hora del teléfono';

  @override
  String get timecodeCountdownTargetTcLabel => 'TC objetivo (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownStartButton => 'Iniciar';

  @override
  String get timecodeCountdownStopButton => 'Detener';

  @override
  String timecodeCountdownErrorInvalid(int frameBase) {
    return '❌ Comprueba ambos timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String get timecodeCountdownLiveCardTitle => 'En directo';

  @override
  String timecodeCountdownLiveText(String tc, String remaining) {
    return 'TC actual (estimado): $tc\nTiempo restante: $remaining';
  }

  @override
  String timecodeCountdownOverdue(String duration) {
    return '−$duration (TC superado)';
  }

  @override
  String get homeTimecodeTitle => 'Timecode';

  @override
  String get homeTimecodeSubtitle => 'Framerate, duración, desfase, retardo';

  @override
  String get vconsoleTitle => 'Consola Virtual';

  @override
  String get vconsoleTileDescription =>
      'Envía Art-Net/sACN por WiFi para probar tus equipos';

  @override
  String get vconsoleSectionConnection => 'Conexión de red';

  @override
  String get vconsoleUniverseLabel => 'Universo de inicio';

  @override
  String get vconsoleUniverseCountLabel => 'Número de universos';

  @override
  String get rdmPageTitle => 'RDM';

  @override
  String get rdmScanButton => 'Escanear la red';

  @override
  String get rdmScanningStatus => 'Buscando fixtures RDM…';

  @override
  String get rdmEmptyState =>
      'No se encontraron fixtures RDM. Inicia una búsqueda.';

  @override
  String rdmDeviceCountLabel(Object count) {
    return '$count fixture(s) encontrado(s)';
  }

  @override
  String get rdmUidLabel => 'UID';

  @override
  String get rdmManufacturerLabel => 'Fabricante';

  @override
  String get rdmStartAddressLabel => 'Dirección DMX';

  @override
  String get rdmFootprintLabel => 'Huella (canales)';

  @override
  String get rdmPersonalityLabel => 'Personality (modo)';

  @override
  String get rdmSoftwareVersionLabel => 'Versión de software';

  @override
  String get rdmIdentifyButton => 'Identificar';

  @override
  String get rdmEditTitle => 'Editar fixture';

  @override
  String rdmConfirmSetStartAddress(Object uid, Object value) {
    return '¿Cambiar la dirección DMX de $uid a $value?';
  }

  @override
  String rdmConfirmSetPersonality(Object uid, Object value) {
    return '¿Cambiar el modo de $uid a $value?';
  }

  @override
  String rdmConfirmSetLabel(Object uid, Object value) {
    return '¿Renombrar $uid a «$value»?';
  }

  @override
  String get rdmConfirmButton => 'Confirmar';

  @override
  String get rdmCancelButton => 'Cancelar';

  @override
  String get rdmSetSuccess => 'Modificado con éxito';

  @override
  String get rdmSetFailed => 'Error al modificar';

  @override
  String get rdmNoResponse => 'Sin respuesta del fixture';

  @override
  String get rdmRefreshTooltip => 'Actualizar';

  @override
  String get rdmWriteWarning =>
      'Modificar un fixture en directo puede alterar un show en curso. Úsalo con precaución.';

  @override
  String get vconsoleTargetBroadcast => 'Broadcast (auto)';

  @override
  String get vconsoleTargetUnicast => 'IP específica';

  @override
  String get vconsoleManualIpLabel => 'IP del nodo (ej: 192.168.1.50)';

  @override
  String get vconsoleStop => 'Detener el envío';

  @override
  String get vconsoleStart => 'Iniciar el envío';

  @override
  String get vconsoleBlackout => 'Blackout';

  @override
  String vconsoleStatusLive(Object fps) {
    return 'En directo • $fps fps';
  }

  @override
  String get vconsoleStatusStopped => 'Detenido';

  @override
  String vconsoleUniversePill(Object universe) {
    return 'Universo $universe';
  }

  @override
  String vconsoleTargetPill(Object target) {
    return '→ $target';
  }

  @override
  String vconsoleErrorLabel(Object message) {
    return 'Error: $message';
  }

  @override
  String vconsoleStartFailed(Object message) {
    return 'No se pudo iniciar: $message';
  }

  @override
  String get vconsoleTabFaders => 'Faders simples';

  @override
  String get vconsoleTabGdtf => 'GDTF';

  @override
  String get vconsoleTabPatch => 'Mi Patch';

  @override
  String get vconsoleChannelCountLabel => 'Número de canales';

  @override
  String get vconsoleAllZero => 'Todo a 0';

  @override
  String get vconsoleAllFull => 'Todo a 255';

  @override
  String get vconsoleSearchTitle => 'Buscar en GDTF Share';

  @override
  String get vconsoleSearchHint => 'Ej: MAC Viper, Spiider...';

  @override
  String get vconsoleImportLocal => 'Importar un archivo .gdtf';

  @override
  String vconsoleModeDialogTitleFor(Object fixture) {
    return 'Modo DMX — $fixture';
  }

  @override
  String vconsoleModeDialogOption(Object mode, Object count) {
    return '$mode ($count ch)';
  }

  @override
  String get vconsoleModeDialogTitleGeneric => 'Modo DMX';

  @override
  String get vconsoleNoModeFound =>
      'No se encontró ningún modo DMX en este archivo .gdtf';

  @override
  String vconsolePickFailed(Object message) {
    return 'No se pudo seleccionar: $message';
  }

  @override
  String vconsoleDownloadFailed(Object code) {
    return 'Descarga fallida ($code)';
  }

  @override
  String vconsoleSearchResultSubtitle(Object count, Object size) {
    return '$count modo(s) • $size';
  }

  @override
  String get vconsoleChooseFixtureHint =>
      'Elige un aparato para ver sus faders.';

  @override
  String get vconsolePatchSectionTitle => 'Mi Patch (importación MVR)';

  @override
  String get vconsolePatchEmpty =>
      'Aún no hay aparatos patcheados. Importa un archivo MVR desde la herramienta Patch para verlos aquí.';

  @override
  String vconsolePatchEntrySubtitle(
      Object universe, Object start, Object end, Object count) {
    return 'Universo $universe • $start-$end • $count ch';
  }

  @override
  String get vconsoleChoosePatchedFixtureHint =>
      'Elige un aparato patcheado para ver sus faders.';

  @override
  String get vconsoleStartAddressLabel => 'Dirección de inicio';

  @override
  String get vconsoleFixtureFallbackTitle => 'Aparato';

  @override
  String vconsoleUniverseArrow(Object universe) {
    return '→ universo $universe';
  }

  @override
  String vconsoleSearchError(Object code) {
    return 'Error $code';
  }

  @override
  String vconsoleNetworkError(Object message) {
    return 'Error de red: $message';
  }

  @override
  String vconsoleChannelShortLabel(Object n) {
    return 'Ch $n';
  }

  @override
  String get vconsoleContinueToSource => 'Elegir la fuente';

  @override
  String get vconsoleContinueToSourceHint =>
      'Faders simples, fixture GDTF o una máquina ya patcheada (MVR).';

  @override
  String get vconsoleControlGroupTooltip => 'Controlar todo el grupo';

  @override
  String vconsoleGroupInfo(Object count, Object universe) {
    return '$count máquina(s) • universo $universe';
  }

  @override
  String vconsoleGroupInfoWithExcluded(
      Object count, Object universe, Object excluded) {
    return '$count máquina(s) • universo $universe • $excluded fuera del grupo (otro universo)';
  }

  @override
  String vconsoleGroupSubtitle(Object count, Object universes) {
    return '$count máquinas • universo $universes';
  }

  @override
  String get vconsoleOpenFaders => 'Abrir la consola';

  @override
  String vconsolePresetsTitleFor(Object channel) {
    return 'Presets — $channel';
  }

  @override
  String get vconsolePresetsTooltip => 'Presets';

  @override
  String get vconsoleSourceStepTitle => 'Elegir la fuente';

  @override
  String get vconsoleUnit8Bit => '8 bits';

  @override
  String get vconsoleUnitPercent => '%';

  @override
  String get vconsoleHomeTooltip =>
      'Posición Home (dimmer 100%, pan/tilt centrados, shutter abierto)';

  @override
  String get vconsoleHomeButton => 'Home';

  @override
  String get filterCorrespondenceTitle => 'Correspondencia de filtros';

  @override
  String get filterCorrespondenceSearchHint => 'Buscar (número o nombre)…';

  @override
  String get filterCorrespondenceColLeeName => 'Lee / Nombre';

  @override
  String get filterCorrespondenceEmpty => 'Sin correspondencia';

  @override
  String filterCorrespondenceResultsCount(Object count) {
    return '$count correspondencia(s)';
  }

  @override
  String filterCorrespondenceFilteredOf(Object total) {
    return ' (filtrado de $total)';
  }

  @override
  String get lbResetDialogTitle => '¿Reiniciar todo?';

  @override
  String get lbResetDialogBody =>
      'Se vaciará la lista de aparatos. La configuración del cuadro se conservará.';

  @override
  String get lbClearAction => 'Vaciar';

  @override
  String get lbPageTitle => 'Reparto de carga';

  @override
  String get lbResetTooltip => 'Reiniciar';

  @override
  String get lbPanelConfigTitle => 'Configuración del cuadro';

  @override
  String get lbVoltageTypeLabel => 'Tipo de red';

  @override
  String get lbPanelSizeLabel => 'Tamaño del cuadro';

  @override
  String get lbCosPhiLabel => 'Factor de potencia (cos φ)';

  @override
  String get lbPhaseGaugesTitle => 'Amperaje por fase';

  @override
  String lbFixturesListTitle(Object count, Object totalW) {
    return 'Aparatos — $count líneas · $totalW W total';
  }

  @override
  String get lbEmptyTitle => 'Aún no hay aparatos';

  @override
  String get lbEmptyBody => 'Toca + para añadir\ndesde el catálogo.';

  @override
  String get lbAddFixtureButton => 'Añadir un aparato';

  @override
  String get lbSheetTitleDefault => '⚡ Añadir un aparato';

  @override
  String get lbPickerSearchHint => 'Buscar fabricante o aparato…';

  @override
  String get lbNoResults => 'Sin resultados 🤷';

  @override
  String lbProductsWithPowerCount(Object count) {
    return '$count aparato(s) con datos de consumo';
  }

  @override
  String get lbUnknownPower => 'consumo desconocido';

  @override
  String get lbFixtureSectionLabel => 'Aparato';

  @override
  String get lbPowerLabel => 'Consumo (W)';

  @override
  String get lbQuantityLabel => 'Cantidad';

  @override
  String get lbPhaseLabel => 'Fase';

  @override
  String get lbPowerHint => 'ej: 350';

  @override
  String get lbAddToDistribution => 'Añadir a la distribución';

  @override
  String get filterLedFiltreLabel => 'Filtro';

  @override
  String get filterLedTransmissionLabel => 'Transmisión';

  @override
  String get filterLedSaveProfileTooltip => 'Guardar el perfil';

  @override
  String get filterLedColorComparisonTitle => 'Comparación de color';

  @override
  String get proHeaderBody =>
      'Desbloquea todas las herramientas avanzadas para técnicos de iluminación, vídeo y láser.';

  @override
  String get proPerYear => '/ año';

  @override
  String get proSubscribeButton => 'Suscribirse';

  @override
  String get proRestorePurchases => 'Restaurar compras';

  @override
  String get proPrivacyPolicy => 'Política de privacidad';

  @override
  String get proTermsOfUse => 'Términos de uso';

  @override
  String get rfIm3ConflictBadge => '⚠ CONFLICTO';

  @override
  String get filterLedHideCalibration => 'Ocultar calibración';

  @override
  String get filterLedShowCalibration => 'Calibrar mi aparato';

  @override
  String get aboutAudioTitle => 'Audio — sonido y PA';

  @override
  String get aboutAudioSubtitle =>
      'Gain staging, SPL/distancia, retardos, subs cardioides, cableado.';

  @override
  String get aboutAudioPageTitle => 'Audio — referencia de campo';

  @override
  String get audioRefTocCopyText => 'Copiar sumario';

  @override
  String get audioRefSection1Title => 'Cadena de señal y gain staging';

  @override
  String get audioRefSection1FormulasTitle => 'Referencias de nivel';

  @override
  String get audioRefSection1Formula1 =>
      '0 dBu ≈ 0,775 V RMS — referencia profesional analógica';

  @override
  String get audioRefSection1Formula2 =>
      '0 dBFS = nivel digital máximo antes del clipping — mantén siempre margen (headroom)';

  @override
  String get audioRefSection1Formula3 =>
      'Gain staging: ajusta cada etapa (fuente → consola → amplificador) para una buena relación señal/ruido, sin saturar';

  @override
  String get audioRefSection1FieldMarksTitle => 'Consejos de campo';

  @override
  String get audioRefSection1FieldMark1 =>
      'Busca un nivel de entrada que oscile en verde/amarillo, nunca en rojo de forma continua';

  @override
  String get audioRefSection1FieldMark2 =>
      'Un sistema mal ajustado suena ruidoso incluso a bajo volumen: el problema suele venir de una etapa saturada antes';

  @override
  String get audioRefSection2Title => 'SPL y distancia';

  @override
  String get audioRefSection2FormulaTitle => 'Ley del inverso del cuadrado';

  @override
  String get audioRefSection2Formula1 =>
      'Cada vez que se duplica la distancia = -6 dB SPL en campo libre';

  @override
  String get audioRefSection2Formula2 =>
      'SPL(d2) = SPL(d1) - 20 × log10(d2 / d1)';

  @override
  String get audioRefSection2NoteTitle => 'Matices sobre el terreno';

  @override
  String get audioRefSection2Note1 =>
      'En interiores, las reflexiones (paredes, techo) reducen la caída real respecto a la teoría';

  @override
  String get audioRefSection2Note2 =>
      'Un line array bien diseñado cae más despacio que una fuente puntual en el eje de cobertura';

  @override
  String get audioRefSection3Title => 'Alineación de retardo (time alignment)';

  @override
  String get audioRefSection3Paragraph =>
      'Un sistema secundario (torre de retardo, refuerzo frontal) debe retardarse para que su sonido llegue al mismo tiempo que el del sistema principal, percibido como una única fuente.';

  @override
  String get audioRefSection3FormulaTitle => 'Fórmula básica';

  @override
  String get audioRefSection3Formula1 =>
      'Retardo (ms) = distancia entre sistemas (m) / 0,343 m/ms (velocidad del sonido ≈ 343 m/s)';

  @override
  String get audioRefSection3TipsTitle => 'Buenas prácticas';

  @override
  String get audioRefSection3Tip1 =>
      'Mide la distancia real entre las dos fuentes, no solo la distancia al público';

  @override
  String get audioRefSection3Tip2 =>
      'Añade unos ms de retardo extra (2-5 ms) para reforzar el efecto de precedencia (efecto Haas) y mantener el sistema principal como fuente percibida';

  @override
  String get audioRefSection3Tip3 =>
      'Comprueba de oído y/o con un analizador (p. ej. correlación de fase) tras el ajuste';

  @override
  String get audioRefSection4Title =>
      'Directividad de subs (cardioide / end-fire)';

  @override
  String get audioRefSection4Paragraph =>
      'Una configuración cardioide o end-fire reduce la energía grave enviada hacia el escenario/FOH reforzando la que va hacia el público, jugando con el retardo y la polaridad entre subs.';

  @override
  String get audioRefSection4TypesTitle => 'Configuraciones habituales';

  @override
  String get audioRefSection4Type1 =>
      'End-fire: subs alineados en fila, el delantero avanzado y retardado electrónicamente';

  @override
  String get audioRefSection4Type2 =>
      'Cardioide de 2 subs: un sub delantero (normal), uno trasero con polaridad invertida y retardado';

  @override
  String get audioRefSection4Type3 =>
      'Cardioide de 3 subs: dos delanteros en fase, uno trasero invertido y retardado — mejor equilibrio nivel/rechazo trasero';

  @override
  String get audioRefSection5Title => 'Cableado y conectores';

  @override
  String get audioRefSection5XlrTitle => 'XLR simétrico';

  @override
  String get audioRefSection5XlrBullet1 =>
      'Prefiere siempre una conexión simétrica (XLR/TRS) en distancias largas para rechazar ruido';

  @override
  String get audioRefSection5XlrBullet2 =>
      'Más allá de ~50-100 m en analógico, plantéate una conexión digital (AES/EBU, Dante, etc.)';

  @override
  String get audioRefSection5SpeakonTitle => 'Speakon (altavoces)';

  @override
  String get audioRefSection5SpeakonBullet1 =>
      'Nunca uses XLR para altavoces: la potencia que circula puede dañar equipos pensados para señal de línea';

  @override
  String get audioRefSection5SpeakonBullet2 =>
      'Comprueba que la sección de cable sea adecuada a la potencia y distancia (caída de tensión) antes de un tendido largo';

  @override
  String get audioRefSection5GroundTitle => 'Masa y zumbido';

  @override
  String get audioRefSection5GroundBullet1 =>
      'Un bucle de masa entre dos equipos conectados a la red por caminos distintos puede generar zumbido de 50/60 Hz';

  @override
  String get audioRefSection5GroundBullet2 =>
      'Un ground lift o una DI box con aislamiento galvánico puede resolverlo sin cortar la tierra de seguridad';

  @override
  String get audioRefSection6Title => 'Seguridad auditiva y buenas prácticas';

  @override
  String get audioRefSection6DontDoTitle => 'Evita';

  @override
  String get audioRefSection6DontDoBullet1 =>
      'Exponer al público o al equipo a más de 100 dB SPL de forma continua sin límite de tiempo';

  @override
  String get audioRefSection6DontDoBullet2 =>
      'Forzar un sistema más allá de su potencia nominal para compensar una mala colocación';

  @override
  String get audioRefSection6WarningTitle => 'Referencias de exposición';

  @override
  String get audioRefSection6WarningBullet1 =>
      '85 dB SPL: límite recomendado para exposición prolongada (8h) sin protección';

  @override
  String get audioRefSection6WarningBullet2 =>
      '100 dB SPL: solo unos minutos antes del riesgo — la mayoría de conciertos superan este nivel';

  @override
  String get audioRefSection6WarningBullet3 =>
      'Usa siempre un limitador de sistema en la salida para proteger el equipo y al público';

  @override
  String get audioRefSection7Title => 'Checklist rápida';

  @override
  String get audioRefSection7QuickTitle => 'Antes del show';

  @override
  String get audioRefSection7Bullet1 =>
      'Gain staging comprobado de la fuente al amplificador, sin saturación';

  @override
  String get audioRefSection7Bullet2 =>
      'Retardos de los sistemas secundarios calculados y aplicados';

  @override
  String get audioRefSection7Bullet3 =>
      'Limitador de sistema activo y ajustado';

  @override
  String get audioRefSection7Bullet4 =>
      'Polaridad comprobada entre subs y tops (sin cancelación)';

  @override
  String get audioRefSection7Bullet5 =>
      'Nivel de SPL medido en FOH y al fondo de la sala';

  @override
  String get audioRefFooterNote =>
      'Estas son referencias generales — comprueba siempre las indicaciones del fabricante y la normativa local sobre niveles sonoros.';

  @override
  String get aboutRfTitle => 'RF — inalámbricos y Wi-Fi';

  @override
  String get aboutRfSubtitle =>
      'Bandas UHF, Wi-Fi, coexistencia IM3, antenas, escaneo RF.';

  @override
  String get aboutRfPageTitle => 'RF — referencia de campo';

  @override
  String get rfRefTocCopyText => 'Copiar sumario';

  @override
  String get rfRefSection1Title => 'Fundamentos del espectro RF';

  @override
  String get rfRefSection1FormulasTitle =>
      'Referencias de frecuencia / longitud de onda';

  @override
  String get rfRefSection1Formula1 =>
      'λ (m) = 300 / f (MHz) — longitud de onda aproximada';

  @override
  String get rfRefSection1Formula2 =>
      'Cuanto más alta la frecuencia, más corta la longitud de onda y menor el alcance en espacio libre';

  @override
  String get rfRefSection1FieldMarksTitle => 'Consejos de campo';

  @override
  String get rfRefSection1FieldMark1 =>
      'El cuerpo humano absorbe y refleja las ondas RF — la posición de un receptor inalámbrico en el cuerpo afecta a la recepción';

  @override
  String get rfRefSection1FieldMark2 =>
      'Prioriza siempre una línea de visión directa entre emisor y receptor';

  @override
  String get rfRefSection2Title => 'Bandas UHF para micros inalámbricos';

  @override
  String get rfRefSection2Paragraph =>
      'Los micros e in-ears inalámbricos usan principalmente la banda UHF (470-694 MHz en Europa según el país), compartida con la difusión de TV — la disponibilidad real depende de la normativa local.';

  @override
  String get rfRefSection2NoteTitle => 'Verifica antes de cada fecha';

  @override
  String get rfRefSection2Note1 =>
      'Las bandas disponibles varían según el país — comprueba la normativa local (ANFR en Francia, Ofcom en el Reino Unido, etc.)';

  @override
  String get rfRefSection2Note2 =>
      'Una banda libre en un sitio puede estar ocupada por un emisor de TV u otro proveedor en otro lugar';

  @override
  String get rfRefSection3Title => 'Wi-Fi 2,4 GHz frente a 5 GHz';

  @override
  String get rfRefSection3TableTitle => 'Diferencias clave';

  @override
  String get rfRefSection3Bullet1 =>
      '2,4 GHz: 3 canales no solapados (1, 6, 11), mejor alcance, más saturado (Bluetooth, micros inalámbricos de banda alta, otras redes)';

  @override
  String get rfRefSection3Bullet2 =>
      '5 GHz: muchos más canales no solapados, mayor rendimiento, alcance más corto, generalmente menos interferencias';

  @override
  String get rfRefSection3Bullet3 =>
      'Para control/monitorización (consolas, visualización), prioriza el 5 GHz cuando sea posible';

  @override
  String get rfRefSection4Title => 'Coexistencia e intermodulación (IM3)';

  @override
  String get rfRefSection4Paragraph =>
      'Cuando varios emisores inalámbricos funcionan juntos, sus frecuencias pueden crear productos de intermodulación (IM3) que caen sobre otras frecuencias en uso y provocan interferencias.';

  @override
  String get rfRefSection4FormulaTitle => 'Fórmula IM3 (3er orden)';

  @override
  String get rfRefSection4Formula1 => 'IM3 = 2×f1 − f2 y 2×f2 − f1';

  @override
  String get rfRefSection4Tip1 =>
      'Cuantos más canales inalámbricos se añaden, mayor es el riesgo de que un producto IM3 caiga sobre una frecuencia en uso — de ahí el valor de un plan de frecuencias calculado con antelación';

  @override
  String get rfRefSection5Title => 'Antenas y diversity';

  @override
  String get rfRefSection5Bullet1 =>
      'La recepción diversity usa dos antenas ligeramente desplazadas para evitar zonas de cancelación (huecos RF)';

  @override
  String get rfRefSection5Bullet2 =>
      'Separa las antenas al menos un cuarto de longitud de onda, sin alinearlas directamente con el emisor';

  @override
  String get rfRefSection5Bullet3 =>
      'Evita colocar las antenas directamente en el suelo o pegadas a una estructura metálica, que puede desafinar o bloquear la señal';

  @override
  String get rfRefSection6Title => 'Escaneo RF antes de un show';

  @override
  String get rfRefSection6Bullet1 =>
      'Escanea siempre la banda in situ, a la hora del show — el entorno RF cambia entre el día y la noche (otros proveedores, público con hotspots, etc.)';

  @override
  String get rfRefSection6Bullet2 =>
      'Anota las frecuencias ocupadas y documéntalas para la próxima fecha en el mismo lugar si es posible';

  @override
  String get rfRefSection6Bullet3 =>
      'Reserva un margen de frecuencias libres para un cambio de última hora (equipo averiado, interferencia imprevista)';

  @override
  String get rfRefSection7Title => 'Checklist rápida';

  @override
  String get rfRefSection7Bullet1 => 'Escaneo RF realizado a la hora del show';

  @override
  String get rfRefSection7Bullet2 =>
      'Plan de frecuencias calculado (IM3 verificado)';

  @override
  String get rfRefSection7Bullet3 =>
      'Antenas en línea de visión, bien separadas';

  @override
  String get rfRefSection7Bullet4 =>
      'Bandas UHF usadas conformes a la normativa local';

  @override
  String get rfRefFooterNote =>
      'La normativa RF varía mucho según el país — comprueba siempre las frecuencias autorizadas localmente antes de un show.';

  @override
  String get aboutLaserTitle => 'Láser — física y seguridad';

  @override
  String get aboutLaserSubtitle =>
      'Cómo funciona, escáneres, clases, normas, NOHD/SZED/CZED.';

  @override
  String get aboutLaserPageTitle => 'Láser — referencia de terreno';

  @override
  String get laserRefTocCopyText => 'Copiar sumario';

  @override
  String get laserRefSection1Title => '¿Qué es un láser?';

  @override
  String get laserRefSection1AcronymTitle => 'El acrónimo LASER';

  @override
  String get laserRefSection1AcronymBody =>
      'LASER significa «Light Amplification by Stimulated Emission of Radiation» (amplificación de luz por emisión estimulada de radiación).';

  @override
  String get laserRefSection1HowTitle => 'El principio físico';

  @override
  String get laserRefSection1HowBody =>
      'Un medio activo (diodo, cristal DPSS...) se «bombea» eléctrica u ópticamente, provocando una emisión estimulada de fotones. Una cavidad resonante (dos espejos, uno semirreflectante) amplifica esta luz, que sale coherente, monocromática y muy colimada — a diferencia de una fuente de luz normal.';

  @override
  String get laserRefSection1TypesTitle => 'Tipos habituales en espectáculos';

  @override
  String get laserRefSection1Type1 =>
      'Diodo directo: compacto, a menudo usado en RGB para mezclar colores';

  @override
  String get laserRefSection1Type2 =>
      'DPSS (Diode Pumped Solid State): un diodo bombea un cristal, usado históricamente para el verde y otras longitudes de onda específicas';

  @override
  String get laserRefSection2Title => 'Cómo se dibuja: escáneres y velocidad';

  @override
  String get laserRefSection2Paragraph =>
      'El haz se dirige mediante dos espejos galvanométricos («galvos»), uno para el eje X y otro para el eje Y, que giran extremadamente rápido. A diferencia del vídeo (barrido línea a línea), un show láser dibuja formas vectoriales, punto a punto, siguiendo el contorno de la imagen.';

  @override
  String get laserRefSection2SpeedTitle => 'Velocidad de escaneo';

  @override
  String get laserRefSection2Speed1 =>
      'La velocidad se mide en puntos por segundo (pps) o kilopuntos por segundo (kpps)';

  @override
  String get laserRefSection2Speed2 =>
      'ILDA (International Laser Display Association) estandariza el conector, el formato de archivo .ild y un patrón de prueba usado para evaluar objetivamente un escáner';

  @override
  String get laserRefSection2FieldTitle => 'Notas de terreno';

  @override
  String get laserRefSection2Field1 =>
      'Cuantos más puntos tenga una imagen, más pps se necesitan para evitar el parpadeo (flicker) — un show fluido suele rondar los 20 a 30 kpps';

  @override
  String get laserRefSection2Field2 =>
      'El patrón de prueba ILDA permite comparar dos escáneres con criterios objetivos (velocidad, precisión, amortiguación)';

  @override
  String get laserRefSection3Title => 'Clases de láser y normas';

  @override
  String get laserRefSection3ClassesTitle => 'Clases IEC 60825-1';

  @override
  String get laserRefSection3Class1 =>
      'Clase 1: segura en uso normal, sin precauciones especiales';

  @override
  String get laserRefSection3Class2 =>
      'Clase 1M / 2M: seguras a simple vista, pero peligrosas con instrumentos ópticos (prismáticos, lupa)';

  @override
  String get laserRefSection3Class3 =>
      'Clase 2: visible, protegida por el reflejo de parpadeo (< 1 mW)';

  @override
  String get laserRefSection3Class4 =>
      'Clase 3R: riesgo moderado, peligro directo limitado';

  @override
  String get laserRefSection3Class5 =>
      'Clase 3B: peligrosa para el ojo en visión directa — la mayoría de los láseres de espectáculo están en esta clase o en la clase 4';

  @override
  String get laserRefSection3Class6 =>
      'Clase 4: peligrosa para el ojo y la piel, riesgo de incendio — precauciones máximas';

  @override
  String get laserRefSection3StandardsTitle => 'Normas de referencia';

  @override
  String get laserRefSection3Standard1 =>
      'IEC 60825-1: seguridad del producto y clasificación de láseres';

  @override
  String get laserRefSection3Standard2 =>
      'IEC 60825-3: directrices específicas para shows y exhibiciones láser (concepto de MPE variable según la duración de exposición)';

  @override
  String get laserRefSection3Standard3 =>
      'Normativas locales: declaración/autorización según la potencia y el país (ej. FDA/CDRH 21 CFR 1040.10 en EE. UU., con procedimiento de variance para shows)';

  @override
  String get laserRefSection3FieldNote =>
      'Comprueba siempre la normativa local antes de un show, especialmente para el audience scanning y cerca de un aeropuerto.';

  @override
  String get laserRefSection4Title => 'Medidas de seguridad';

  @override
  String get laserRefSection4Bullet1 =>
      'Se designa un Laser Safety Officer (LSO) formado, responsable del show';

  @override
  String get laserRefSection4Bullet2 =>
      'Interruptor de llave y parada de emergencia fácilmente accesibles';

  @override
  String get laserRefSection4Bullet3 =>
      'Un enclavamiento (interlock) corta la emisión si se abre una tapa o carcasa';

  @override
  String get laserRefSection4Bullet4 =>
      'Detección de fallo de escaneo (scan-fail) que corta el haz si los galvos se detienen — indispensable para el audience scanning';

  @override
  String get laserRefSection4Bullet5 =>
      'Ningún haz fijo apuntado al público — solo audience scanning con las protecciones y cálculos de exposición dedicados';

  @override
  String get laserRefSection4Bullet6 =>
      'Nunca apuntar hacia el espacio aéreo, un avión o una superficie reflectante no controlada (cristal, espejo, pantalla)';

  @override
  String get laserRefSection5Title => 'NOHD, SZED, CZED explicados';

  @override
  String get laserRefSection5Paragraph =>
      'Estas distancias de seguridad las calcula la herramienta «Zonas de seguridad» de la app a partir de la potencia, la divergencia y el diámetro de salida del haz.';

  @override
  String get laserRefSection5NohdTitle =>
      'NOHD — Nominal Ocular Hazard Distance';

  @override
  String get laserRefSection5NohdBody =>
      'Distancia ocular de peligro nominal: más allá de esta distancia, la irradiancia directa del haz cae por debajo del límite de exposición máxima permitida (MPE) para una exposición accidental y breve. Es la referencia base definida por la IEC 60825-1.';

  @override
  String get laserRefSection5SzedTitle => 'SZED — Show Zone Exposure Distance';

  @override
  String get laserRefSection5SzedBody =>
      'Distancia de exposición de la zona de show: delimita la zona donde puede estar el público durante un show con barrido (audience scanning), con un umbral MPE más prudente que el NOHD.';

  @override
  String get laserRefSection5CzedTitle =>
      'CZED — Controlled Zone Exposure Distance';

  @override
  String get laserRefSection5CzedBody =>
      'Distancia de exposición de la zona controlada: la más prudente de las tres, reservada a la zona donde solo puede estar el personal formado (operadores, técnicos), teniendo en cuenta una exposición potencialmente más larga.';

  @override
  String get laserRefSection5FieldNote =>
      'En la app, cuanto más bajo es el umbral MPE usado, mayor es la distancia calculada — de ahí el orden CZED > SZED > NOHD. Estas distancias siguen siendo indicativas: no sustituyen un estudio realizado por un Laser Safety Officer cualificado, ni la normativa local vigente.';

  @override
  String get laserRefSection6Title => 'Checklist rápida';

  @override
  String get laserRefSection6Bullet1 =>
      'Clase del láser identificada, declarada si es necesario';

  @override
  String get laserRefSection6Bullet2 =>
      'LSO designado y presente durante todo el show';

  @override
  String get laserRefSection6Bullet3 =>
      'Zonas NOHD/SZED/CZED calculadas y señalizadas';

  @override
  String get laserRefSection6Bullet4 =>
      'Detección de fallo de escaneo activa si hay audience scanning';

  @override
  String get laserRefSection6Bullet5 =>
      'Parada de emergencia probada y accesible';

  @override
  String get laserRefSection6Bullet6 =>
      'Ninguna orientación hacia el espacio aéreo o una superficie reflectante no controlada';

  @override
  String get laserRefFooterNote =>
      'Esta información es general y educativa — no sustituye una formación de Laser Safety Officer ni la normativa local (IEC 60825, FDA/CDRH, autoridades aeronáuticas...).';

  @override
  String get aboutRiggingTitle => 'Rigging';

  @override
  String get aboutRiggingSubtitle => 'Bases, bridas y factor de ángulo';

  @override
  String get aboutRiggingPageTitle => 'Rigging — curso rápido';

  @override
  String get riggingRefTocCopyText => 'Copiar resumen';

  @override
  String get riggingRefSection1Title => 'Bases del rigging';

  @override
  String get riggingRefSection2Title => 'Eslingado a 2 puntos (bridle)';

  @override
  String get riggingRefSection3Title => 'Factor de ángulo';

  @override
  String get riggingRefSection4Title => 'Checklist';

  @override
  String get riggingRefSection1Bullet1 =>
      'WLL (Working Load Limit): carga máxima de uso autorizada para un accesorio, indicada por el fabricante.';

  @override
  String get riggingRefSection1Bullet2 =>
      'Coeficiente de seguridad: relación entre la carga de rotura y la WLL, generalmente 5:1 o 10:1 según el material y la normativa.';

  @override
  String get riggingRefSection1Bullet3 =>
      'Cadena de carga: cada eslabón (punto de anclaje, eslinga, grillete, estructura) debe estar dimensionado para la carga total — el eslabón más débil fija el límite del conjunto.';

  @override
  String get riggingRefSection2Bullet1 =>
      'Un bridado a 2 puntos reparte la carga entre dos eslingas que forman un ángulo respecto a la vertical.';

  @override
  String get riggingRefSection2Bullet2 =>
      'Cuanto mayor es el ángulo respecto a la vertical, mayor es la tensión en cada eslinga.';

  @override
  String get riggingRefSection2Bullet3 =>
      'Recomendación habitual: mantener el ángulo incluido entre los dos ramales por debajo de 90° para limitar la tensión adicional.';

  @override
  String get riggingRefSection3FormulaTitle => 'Fórmula';

  @override
  String get riggingRefSection3Formula1 =>
      'Tensión por eslinga = (Carga / número de eslingas) × factor de ángulo, con factor de ángulo = 1 / cos(ángulo respecto a la vertical).';

  @override
  String get riggingRefSection3Bullet1 =>
      'Ejemplos: 0° → factor 1.0; 45° → factor aproximadamente 1.41; 60° → factor 2.0.';

  @override
  String get riggingRefSection3Bullet2 =>
      'Cuanto mayor es el ángulo respecto a la vertical, más rápido aumenta el factor — y por tanto la tensión.';

  @override
  String get riggingRefSection4Bullet1 =>
      'Verificar la WLL de cada accesorio (eslinga, grillete, mosquetón, estructura) antes de izar.';

  @override
  String get riggingRefSection4Bullet2 =>
      'Calcular la tensión real por eslinga teniendo en cuenta el factor de ángulo, no solo la carga total dividida entre el número de ramales.';

  @override
  String get riggingRefSection4Bullet3 =>
      'Inspeccionar visualmente los accesorios (deformación, corrosión, desgaste) antes de cada uso.';

  @override
  String get riggingRefSection4Bullet4 =>
      'Hacer revisar el conjunto por una persona competente o un rigger cualificado para cargas importantes o configuraciones complejas.';

  @override
  String get riggingRefFooterNote =>
      'Este contenido es un recordatorio pedagógico general y no sustituye las normas locales, la formación de rigger ni la verificación por una persona competente.';

  @override
  String get aboutConsoleTitle => 'Consola y patch';

  @override
  String get aboutConsoleSubtitle => 'Consola virtual, GDTF y patch DMX';

  @override
  String get aboutConsolePageTitle => 'Consola — curso rápido';

  @override
  String get consoleRefTocCopyText => 'Copiar resumen';

  @override
  String get consoleRefSection1Title => 'Consola virtual y DMX inalámbrico';

  @override
  String get consoleRefSection2Title => 'GDTF y GDTF Share';

  @override
  String get consoleRefSection3Title => 'Patch y universos';

  @override
  String get consoleRefSection4Title => 'Checklist';

  @override
  String get consoleRefSection1Paragraph =>
      'Una consola virtual permite controlar un show desde una tablet o smartphone, enviando DMX por red (Art-Net o sACN) en lugar de un cable DMX directo.';

  @override
  String get consoleRefSection1Bullet1 =>
      'El Wi-Fi añade latencia y riesgo de cortes: reservarlo para ajustes, no para momentos críticos del show sin una solución cableada de respaldo.';

  @override
  String get consoleRefSection1Bullet2 =>
      'Verificar que el nodo/interfaz DMX-sobre-IP recibe realmente el universo Art-Net o sACN configurado en la consola virtual.';

  @override
  String get consoleRefSection1Bullet3 =>
      'Prever un acceso cableado de respaldo (DMX directo o Ethernet) para los momentos críticos del show.';

  @override
  String get consoleRefSection2GdtfTitle => 'GDTF (General Device Type Format)';

  @override
  String get consoleRefSection2GdtfBody =>
      'Formato de archivo estandarizado que describe las características de un proyector (modos DMX, ruedas de color, geometría 3D) para una importación fiable en cualquier consola compatible.';

  @override
  String get consoleRefSection2ShareTitle => 'GDTF Share';

  @override
  String get consoleRefSection2ShareBody =>
      'Base de datos en línea oficial donde los fabricantes publican los archivos GDTF de sus equipos, descargables gratuitamente para el patch.';

  @override
  String get consoleRefSection3Bullet1 =>
      'Un universo DMX contiene 512 canales; cada equipo ocupa uno o más canales según el modo DMX elegido.';

  @override
  String get consoleRefSection3Bullet2 =>
      'Verificar siempre el modo DMX realmente configurado en el equipo físico: debe coincidir con el seleccionado en el patch de la consola.';

  @override
  String get consoleRefSection3Bullet3 =>
      'Documentar el patch (direcciones, universos, modos) facilita la resolución de problemas y el relevo por otra persona.';

  @override
  String get consoleRefSection4Bullet1 =>
      'Verificar la conexión de red (Wi-Fi o cableada) entre la consola virtual y el nodo DMX antes del show.';

  @override
  String get consoleRefSection4Bullet2 =>
      'Confirmar que cada equipo está patcheado en el universo y la dirección de inicio correctos.';

  @override
  String get consoleRefSection4Bullet3 =>
      'Usar un archivo GDTF actualizado desde GDTF Share en lugar de un perfil genérico.';

  @override
  String get consoleRefSection4Bullet4 =>
      'Prever un plan de respaldo en caso de corte de red o Wi-Fi durante el show.';

  @override
  String get consoleRefFooterNote =>
      'Este contenido es un recordatorio general; consultar la documentación del fabricante para los modos DMX y procedimientos específicos.';

  @override
  String get aboutCinemaTitle => 'Cine';

  @override
  String get aboutCinemaSubtitle => 'Cámara, profundidad de campo y cadencia';

  @override
  String get aboutCinemaPageTitle => 'Cine — curso rápido';

  @override
  String get cinemaRefTocCopyText => 'Copiar resumen';

  @override
  String get cinemaRefSection1Title => 'Nociones básicas de cámara';

  @override
  String get cinemaRefSection2Title => 'Profundidad de campo y enfoque';

  @override
  String get cinemaRefSection3Title => 'Cadencia y obturador';

  @override
  String get cinemaRefSection4Title => 'Checklist';

  @override
  String get cinemaRefSection1Bullet1 =>
      'Sensor: superficie fotosensible que captura la imagen; su tamaño influye en el campo de visión y la profundidad de campo para una distancia focal dada.';

  @override
  String get cinemaRefSection1Bullet2 =>
      'Distancia focal: distancia (en mm) que determina el ángulo de campo — una focal corta es gran angular, una focal larga es teleobjetivo.';

  @override
  String get cinemaRefSection1Bullet3 =>
      'Apertura (f/): tamaño del diafragma, que controla la cantidad de luz entrante y la profundidad de campo.';

  @override
  String get cinemaRefSection2Paragraph =>
      'La profundidad de campo es la zona de nitidez aceptable delante y detrás del sujeto enfocado.';

  @override
  String get cinemaRefSection2Bullet1 =>
      'Una apertura amplia (f/1.4, f/2) da una profundidad de campo reducida (fondo desenfocado).';

  @override
  String get cinemaRefSection2Bullet2 =>
      'Una apertura cerrada (f/11, f/16) da una profundidad de campo extendida (todo nítido).';

  @override
  String get cinemaRefSection3FormulaTitle =>
      'Fórmula del ángulo de obturación';

  @override
  String get cinemaRefSection3Formula1 =>
      'Velocidad de obturación = 1 / (2 × cadencia en fotogramas/segundo) para un ángulo de obturación de 180°, la referencia estándar en cine.';

  @override
  String get cinemaRefSection3Bullet1 =>
      '24 fotogramas/segundo es la cadencia estándar del cine; 25 o 30 fps son habituales en broadcast según la norma de vídeo (PAL/NTSC).';

  @override
  String get cinemaRefSection3Bullet2 =>
      'Un ángulo de obturación más cerrado (90°, 45°) da un aspecto más entrecortado, usado en escenas de acción estilizadas.';

  @override
  String get cinemaRefSection4Bullet1 =>
      'Verificar que la cadencia de la cámara coincide con la frecuencia de las fuentes de luz (evitar el parpadeo/flicker).';

  @override
  String get cinemaRefSection4Bullet2 =>
      'Adaptar la apertura al resultado de profundidad de campo deseado, no solo a la exposición.';

  @override
  String get cinemaRefSection4Bullet3 =>
      'Mantener un ángulo de obturación coherente durante todo el rodaje para una textura de movimiento uniforme.';

  @override
  String get cinemaRefSection4Bullet4 =>
      'Probar siempre en condiciones reales de plató antes del rodaje definitivo.';

  @override
  String get cinemaRefFooterNote =>
      'Este contenido es un recordatorio pedagógico general; los ajustes definitivos dependen del equipo y de la intención artística.';

  @override
  String get aboutTimecodeTitle => 'Timecode';

  @override
  String get aboutTimecodeSubtitle => 'SMPTE, drop-frame y cadencias';

  @override
  String get aboutTimecodePageTitle => 'Timecode — curso rápido';

  @override
  String get timecodeRefTocCopyText => 'Copiar resumen';

  @override
  String get timecodeRefSection1Title => 'Qué es el timecode SMPTE';

  @override
  String get timecodeRefSection2Title => 'Drop-frame vs non-drop-frame';

  @override
  String get timecodeRefSection3Title => 'Cadencias habituales';

  @override
  String get timecodeRefSection4Title => 'Checklist';

  @override
  String get timecodeRefSection1FormatTitle => 'Formato';

  @override
  String get timecodeRefSection1FormatBody =>
      'HH:MM:SS:FF — horas, minutos, segundos y número de fotograma (frame), que se reinicia en cada cadencia completa.';

  @override
  String get timecodeRefSection1Bullet1 =>
      'El timecode SMPTE sincroniza imagen, sonido e iluminación con una referencia temporal común.';

  @override
  String get timecodeRefSection1Bullet2 =>
      'Cada fotograma lleva una dirección única, lo que permite un referenciado preciso tanto en postproducción como en el control en directo.';

  @override
  String get timecodeRefSection2Paragraph =>
      'El drop-frame (DF) existe porque algunas cadencias (29.97 fps) no son un número entero de fotogramas por segundo, lo que desfasa el timecode respecto al tiempo real si no se corrige.';

  @override
  String get timecodeRefSection2Bullet1 =>
      'Non-drop-frame (NDF): cuenta los fotogramas sin saltos; simple, pero se desvía ligeramente del tiempo real a 29.97 fps.';

  @override
  String get timecodeRefSection2Bullet2 =>
      'Drop-frame (DF): salta periódicamente números de fotograma (no fotogramas reales) para realinear el timecode con el tiempo real.';

  @override
  String get timecodeRefSection3Bullet1 => '24 fps: cadencia clásica del cine.';

  @override
  String get timecodeRefSection3Bullet2 =>
      '25 fps: estándar PAL (Europa); 30 fps (o 29.97 DF/NDF): estándar NTSC (Norteamérica, Japón).';

  @override
  String get timecodeRefSection3Bullet3 =>
      '50 fps y 59.94/60 fps: cadencias de alta frecuencia usadas en broadcast y para cámara lenta.';

  @override
  String get timecodeRefSection3Bullet4 =>
      'Verificar siempre que todas las fuentes (cámara, sonido, iluminación, vídeo) usan la misma cadencia de referencia.';

  @override
  String get timecodeRefSection4Bullet1 =>
      'Confirmar la cadencia y el modo (DF/NDF) en todas las fuentes antes de empezar el show o el rodaje.';

  @override
  String get timecodeRefSection4Bullet2 =>
      'Verificar que la fuente maestra de timecode (master clock) está claramente identificada y distribuida a todos los equipos.';

  @override
  String get timecodeRefSection4Bullet3 =>
      'Si se sospecha de un desfase, comparar el timecode mostrado con un reloj de referencia durante un periodo suficiente.';

  @override
  String get timecodeRefFooterNote =>
      'Este contenido es un recordatorio general; consultar las especificaciones SMPTE y la documentación de los equipos utilizados.';

  @override
  String get aboutConversionsTitle => 'Conversiones y BPM';

  @override
  String get aboutConversionsSubtitle => 'Unidades, BPM y DMX de un vistazo';

  @override
  String get aboutConversionsPageTitle => 'Conversiones y BPM — curso rápido';

  @override
  String get conversionsRefTocCopyText => 'Copiar resumen';

  @override
  String get conversionsRefSection1Title => 'Por qué convertir';

  @override
  String get conversionsRefSection2Title => 'BPM ↔ milisegundos';

  @override
  String get conversionsRefSection3Title => 'DMX ↔ porcentaje / 8-bit ↔ 16-bit';

  @override
  String get conversionsRefSection4Title => 'Checklist';

  @override
  String get conversionsRefSection1Paragraph =>
      'En el control técnico las unidades se mezclan a menudo (BPM musicales, milisegundos de delay, porcentajes DMX, valores de 8/16-bit): convertir rápido y sin errores evita desajustes entre efectos de luz, sonido y vídeo.';

  @override
  String get conversionsRefSection2FormulaTitle => 'Fórmula';

  @override
  String get conversionsRefSection2Formula1 =>
      'Duración de un pulso (ms) = 60 000 / BPM.';

  @override
  String get conversionsRefSection2Bullet1 =>
      'Ejemplo: a 120 BPM, un pulso dura 500 ms; una semicorchea (1/4 de pulso) dura 125 ms.';

  @override
  String get conversionsRefSection2Bullet2 =>
      'Útil para sincronizar un efecto de luz, un delay de audio o un clip de vídeo con el tempo de un tema.';

  @override
  String get conversionsRefSection3Bullet1 =>
      'Un valor DMX de 8-bit va de 0 a 255; en porcentaje, 255 corresponde al 100%.';

  @override
  String get conversionsRefSection3Bullet2 =>
      'En 16-bit, dos canales combinados (fino/grueso) dan una resolución de 0 a 65 535 para un control más preciso (dimmer, pan/tilt).';

  @override
  String get conversionsRefSection3Bullet3 =>
      'Verificar el modo (8-bit o 16-bit) realmente configurado en el equipo antes de patchear, o los valores no coincidirán.';

  @override
  String get conversionsRefSection4Bullet1 =>
      'Verificar siempre la unidad mostrada antes de introducir un valor (ms, BPM, %, 8-bit, 16-bit).';

  @override
  String get conversionsRefSection4Bullet2 =>
      'Recalcular en lugar de redondear de memoria para valores críticos (sincronización, seguridad).';

  @override
  String get conversionsRefSection4Bullet3 =>
      'Documentar las conversiones usadas en la ficha técnica para facilitar el relevo del show.';

  @override
  String get conversionsRefFooterNote =>
      'Este contenido es un recordatorio general; consultar la documentación del equipo para sus modos exactos de resolución.';

  @override
  String get aboutCategoryNetworkTitle => 'Red y protocolos';

  @override
  String get aboutCategoryAudioRfTitle => 'Audio y RF';

  @override
  String get aboutCategoryVideoCinemaTitle => 'Vídeo y cine';

  @override
  String get aboutCategoryLightingTitle => 'Iluminación, láser y consola';

  @override
  String get aboutCategoryRiggingElecTitle => 'Rigging y electricidad';

  @override
  String get aboutCategoryToolsTitle => 'Herramientas prácticas';

  @override
  String get pinnedItemsTitle => 'Mis fijados';

  @override
  String get homePinnedItemsSubtitle =>
      'Encuentra rápidamente tus herramientas y referencias fijadas.';

  @override
  String get pinnedItemsEmpty =>
      'Aún no hay herramientas ni referencias fijadas.';

  @override
  String get fixtureInfoSectionIdentification => 'Identificación';

  @override
  String get fixtureInfoLabelName => 'Nombre';

  @override
  String get fixtureInfoLabelId => 'ID';

  @override
  String get fixtureInfoSectionDmx => 'DMX / Red';

  @override
  String get fixtureInfoLabelUniverse => 'Universo';

  @override
  String get fixtureInfoLabelAddress => 'Dirección';

  @override
  String get fixtureInfoLabelMode => 'Modo';

  @override
  String get fixtureInfoLabelChannelCount => 'Canales';

  @override
  String get fixtureInfoLabelGdtfSpec => 'Archivo GDTF';

  @override
  String get fixtureInfoSectionPhysical => 'Física';

  @override
  String get fixtureInfoLabelWeight => 'Peso';

  @override
  String fixtureInfoValueKg(Object kg) {
    return '$kg kg';
  }

  @override
  String get fixtureInfoLabelDimensions => 'Dimensiones';

  @override
  String fixtureInfoValueDimensionsCm(
      Object heightCm, Object lengthCm, Object widthCm) {
    return '$lengthCm × $widthCm × $heightCm cm';
  }

  @override
  String get fixtureInfoLabelLegHeight => 'Altura de las patas';

  @override
  String fixtureInfoValueCm(Object cm) {
    return '$cm cm';
  }

  @override
  String get fixtureInfoSectionElectrical => 'Eléctrica';

  @override
  String get fixtureInfoLabelPower => 'Potencia';

  @override
  String fixtureInfoValueWatts(Object watts) {
    return '$watts W';
  }

  @override
  String get fixtureInfoSectionEnvironment => 'Entorno';

  @override
  String get fixtureInfoLabelOperatingTemp => 'Temperatura de funcionamiento';

  @override
  String fixtureInfoValueTempRange(Object highC, Object lowC) {
    return '$lowC°C – $highC°C';
  }

  @override
  String get fixtureInfoNoGdtfData =>
      'No hay información física disponible (GDTF ausente o incompleto).';

  @override
  String get patch3dTitle => 'Visor 3D';

  @override
  String get patch3dOpenButton => 'Ver en 3D';

  @override
  String get patch3dResetCameraTooltip => 'Recentrar cámara';

  @override
  String get patch3dFiltersTooltip => 'Filtros y colores';

  @override
  String get patch3dZoomToFitTooltip => 'Ajustar todo';

  @override
  String get patch3dCameraViewsTooltip => 'Vistas de cámara';

  @override
  String get patch3dCameraViewFront => 'Frontal';

  @override
  String get patch3dCameraViewTop => 'Superior';

  @override
  String get patch3dCameraViewSide => 'Lateral';

  @override
  String get patch3dCameraViewIso => 'Isométrica';

  @override
  String get patch3dBackgroundColorLabel => 'Color de fondo';

  @override
  String patch3dEntriesWithoutPosition(Object count) {
    return '$count fixture(s) sin posición 3D (sin Matrix en el MVR).';
  }

  @override
  String get patch3dNoPositionedFixtures =>
      'No hay fixtures posicionados para mostrar. Importa un MVR con posiciones 3D.';

  @override
  String get patch3dMissingModelTitle => 'Modelos 3D faltantes';

  @override
  String patch3dMissingModelBody(Object count) {
    return '$count tipo(s) de aparato no tienen modelo 3D en su GDTF. Se usa un cubo genérico (30×30×30 cm) en su lugar:';
  }

  @override
  String get patch3dColorModeLabel => 'Coloración';

  @override
  String get patch3dColorModeByType => 'Por tipo';

  @override
  String get patch3dColorModeByUniverse => 'Por universo';

  @override
  String get patch3dFilterUniverseLabel => 'Universo';

  @override
  String get patch3dFilterTypeLabel => 'Tipo de aparato';

  @override
  String get patch3dFilterShowAll => 'Mostrar todo';

  @override
  String get gdtfWizardSuggestionOpen => 'Abierto';

  @override
  String get gdtfWizardSuggestionClosed => 'Cerrado';

  @override
  String gdtfWizardSuggestionGoboSlot(int n) {
    return 'Gobo $n';
  }

  @override
  String gdtfWizardSuggestionColorSlot(int n) {
    return 'Color $n';
  }

  @override
  String get gdtfWizardColorWhite => 'Blanco';

  @override
  String get gdtfWizardColorRed => 'Rojo';

  @override
  String get gdtfWizardColorGreen => 'Verde';

  @override
  String get gdtfWizardColorBlue => 'Azul';

  @override
  String get gdtfWizardColorYellow => 'Amarillo';

  @override
  String get gdtfWizardColorCyan => 'Cian';

  @override
  String get gdtfWizardColorMagenta => 'Magenta';

  @override
  String get gdtfWizardColorRainbow => 'Arcoíris';

  @override
  String get gdtfWizardStrobeSlowToFast => 'Estrobo lento → rápido';

  @override
  String get gdtfWizardStrobeRandom => 'Estrobo aleatorio';

  @override
  String get gdtfWizardAppBarTitle => 'Asistente manual GDTF';

  @override
  String get gdtfWizardStepTitleStyle => 'Estilo del proyector';

  @override
  String get gdtfWizardStepTitleFunction => 'Función';

  @override
  String get gdtfWizardStepTitleChannels => 'Canales';

  @override
  String get gdtfWizardStepTitlePixels => 'Píxeles';

  @override
  String get gdtfWizardStepTitleStructure => 'Estructura';

  @override
  String gdtfWizardStepHeader(int step, String title) {
    return 'Paso $step/5 — $title';
  }

  @override
  String get gdtfWizardErrStyle =>
      'Elige un estilo de proyector para continuar.';

  @override
  String get gdtfWizardErrFunction =>
      'Selecciona al menos una función (wash, spot o beam).';

  @override
  String get gdtfWizardErrChannels =>
      'Marca al menos un canal — ¡el proyector tiene que controlar algo!';

  @override
  String get gdtfWizardErrPixelCount =>
      'Se necesitan al menos 2 píxeles/instancias para una estructura multipíxel.';

  @override
  String get gdtfWizardErrRepeatCount =>
      'Selecciona al menos 2 canales repetibles (por ejemplo Red + Green, o Pan/Tilt) para que cada píxel se reconozca correctamente como una instancia distinta.';

  @override
  String get gdtfWizardErrRowsCols =>
      'Introduce un número válido de filas y columnas.';

  @override
  String get gdtfWizardErrModeName => 'Ponle un nombre a este modo DMX.';

  @override
  String get gdtfWizardStyleIntro => '¿Qué tipo de proyector estás creando?';

  @override
  String get gdtfWizardStyleLyreTitle => 'Cabeza móvil (moving head)';

  @override
  String get gdtfWizardStyleLyreSubtitle =>
      'Cabeza motorizada con pan/tilt — spot, wash o beam.';

  @override
  String get gdtfWizardStyleParTitle => 'PAR / Fijo';

  @override
  String get gdtfWizardStyleParSubtitle =>
      'Proyector estático, sin movimiento (PAR LED, recortes fijos…).';

  @override
  String get gdtfWizardStyleBarreTitle => 'Barra';

  @override
  String get gdtfWizardStyleBarreSubtitle =>
      'Barra lineal, a menudo por píxeles (barra LED, X4 Bar…).';

  @override
  String get gdtfWizardPanTiltCheckTitle =>
      'Este proyector tiene motor Pan/Tilt';

  @override
  String get gdtfWizardPanTiltCheckSubtitle =>
      'Añade los canales Pan/Tilt en 16 bits (norma GDTF).';

  @override
  String get gdtfWizardFunctionIntro =>
      '¿Qué función(es) tiene este proyector? (selección múltiple)';

  @override
  String get gdtfWizardFunctionWash => 'Wash';

  @override
  String get gdtfWizardFunctionSpot => 'Spot';

  @override
  String get gdtfWizardFunctionBeam => 'Beam';

  @override
  String get gdtfWizardFunctionHint =>
      'Esto solo preselecciona canales útiles para el siguiente paso (Wash → Frost/Zoom, Spot → Gobo/Focus/Prisma, Beam → haz estrecho). Podrás ajustarlo todo justo después.';

  @override
  String get gdtfWizardChannelsIntro => 'Marca los canales DMX del proyector.';

  @override
  String get gdtfWizardSectionIntensity => 'INTENSIDAD';

  @override
  String get gdtfWizardChannelDimmer => 'Dimmer';

  @override
  String get gdtfWizardChannelStrobe => 'Obturador / Strobe';

  @override
  String get gdtfWizardSectionColor => 'COLOR';

  @override
  String get gdtfWizardChannelCto => 'Rueda CTO (temperatura de color)';

  @override
  String get gdtfWizardChannelColorMacro => 'Macro de color (preajustes)';

  @override
  String get gdtfWizardSectionPosition => 'POSICIÓN';

  @override
  String get gdtfWizardPanTiltNote =>
      'Pan/Tilt se añade automáticamente (16 bits). Para un proyector con varias cabezas móviles independientes, podrás repartirlo por cabeza en el paso Píxeles.';

  @override
  String get gdtfWizardSectionBeamShaping => 'HAZ';

  @override
  String get gdtfWizardChannelZoom => 'Zoom';

  @override
  String get gdtfWizardChannelFocus => 'Focus';

  @override
  String get gdtfWizardChannelIris => 'Iris';

  @override
  String get gdtfWizardChannelFrost => 'Frost';

  @override
  String get gdtfWizardChannelPrism => 'Prisma';

  @override
  String get gdtfWizardChannelPrismRot => 'Rotación del prisma';

  @override
  String get gdtfWizardSectionGobos => 'GOBOS';

  @override
  String get gdtfWizardChannelGobo1 => 'Rueda de gobos 1';

  @override
  String get gdtfWizardChannelGobo1Rot => 'Rotación gobo 1';

  @override
  String get gdtfWizardChannelGobo2 => 'Rueda de gobos 2';

  @override
  String get gdtfWizardChannelGobo2Rot => 'Rotación gobo 2';

  @override
  String get gdtfWizardSectionEffectsControl => 'EFECTOS Y CONTROL';

  @override
  String get gdtfWizardChannelEffects => 'Efectos / macros';

  @override
  String get gdtfWizardChannelReset => 'Reset';

  @override
  String get gdtfWizardSlotsHint =>
      'Slots (uno por línea, opcional) — ej.: Abierto, Gobo 1…';

  @override
  String get gdtfWizardSlotsTooltip => 'Sugerencia';

  @override
  String get gdtfWizardChannelPanTiltPerHead => 'Pan/Tilt (por cabeza)';

  @override
  String get gdtfWizardPixelsIntro =>
      '¿Este proyector tiene varios píxeles/celdas controlables por separado (matriz LED, barra de píxeles…)?';

  @override
  String get gdtfWizardMultiplePixelsTitle => 'Varios píxeles / instancias';

  @override
  String get gdtfWizardMultiplePixelsSubtitle =>
      'Si no, todos los canales marcados en el paso anterior siguen siendo únicos (una sola salida).';

  @override
  String get gdtfWizardSectionPixelCount => 'NÚMERO DE PÍXELES';

  @override
  String get gdtfWizardSectionPixelContent => 'CONTENIDO DE UN PÍXEL';

  @override
  String get gdtfWizardNoRepeatableChannels =>
      'Todavía no hay ningún canal repetible. Vuelve al paso «Estilo» (Pan/Tilt) o «Canales» (Dimmer, Obturador/Strobe, color…) y marca al menos un atributo para repetir por cabeza/píxel.';

  @override
  String gdtfWizardRepeatPerPixelSubtitle(String label) {
    return 'Un canal por píxel (ej.: $label 1, $label 2…)';
  }

  @override
  String get gdtfWizardRepeatGlobalSubtitle =>
      'Sigue siendo un único canal global para todo el proyector';

  @override
  String get gdtfWizardModeNameLabel => 'Nombre del modo DMX';

  @override
  String get gdtfWizardModeNameHint => 'ej.: Standard, 16 bits, Pixel Mode…';

  @override
  String get gdtfWizardSingleOutputNote =>
      'Proyector de una sola salida (sin varios píxeles): nada que configurar aquí, cada canal marcado sigue siendo único.';

  @override
  String get gdtfWizardSectionLayout => 'DISPOSICIÓN';

  @override
  String get gdtfWizardArrangementLinearTitle => 'Barra lineal';

  @override
  String gdtfWizardArrangementLinearSubtitle(int count) {
    return 'Píxeles alineados en fila (ej.: X4 Bar). Numerados del 1 al $count.';
  }

  @override
  String get gdtfWizardArrangementMatrixTitle => 'Matriz (rejilla)';

  @override
  String get gdtfWizardArrangementMatrixSubtitle =>
      'Píxeles organizados en filas × columnas (ej.: pared LED, JDC1 pixel curve).';

  @override
  String get gdtfWizardArrangementModulesTitle => 'Módulos independientes';

  @override
  String get gdtfWizardArrangementModulesSubtitle =>
      'Varias cabezas/módulos idénticos en un mismo chasis (ej.: JDC1).';

  @override
  String get gdtfWizardRowsLabel => 'Filas';

  @override
  String get gdtfWizardColsLabel => 'Columnas';

  @override
  String gdtfWizardMatrixTotal(int count) {
    return 'Total: $count píxeles (numerados fila por fila).';
  }

  @override
  String get gdtfWizardModulesNote =>
      'Cada módulo puede tener su propio color/dimmer/strobe Y su propio zoom/focus/iris/frost/prisma/gobo — vuelve al paso «Píxeles» y marca, para cada canal de haz correspondiente, que debe repetirse por módulo en lugar de quedar compartido por todos.';

  @override
  String get gdtfWizardCancel => 'Cancelar';

  @override
  String get gdtfWizardBack => 'Atrás';

  @override
  String get gdtfWizardValidateAndEdit => 'Confirmar y editar';

  @override
  String get gdtfWizardNext => 'Siguiente';

  @override
  String get gdtfWizardDefaultModeName => 'Manual';

  @override
  String get gdtfWizardOrDivider => 'O';

  @override
  String get gdtfWizardManualButtonLabel =>
      'Asistente manual (sin PDF) — estilo, canales, píxeles…';

  @override
  String get gdtfWizardColorModeNone => 'Ninguna';

  @override
  String get gdtfWizardColorModeRgb => 'RGB';

  @override
  String get gdtfWizardColorModeRgbw => 'RGB + Blanco';

  @override
  String get gdtfWizardColorModeRgbwaUv => 'RGB + Blanco + Ámbar + UV';

  @override
  String get gdtfWizardColorModeCmy => 'CMY (Cian/Magenta/Amarillo)';

  @override
  String get gdtfWizardColorModeWheel => 'Rueda de color';

  @override
  String get gdtfWizardColorAmber => 'Ámbar';

  @override
  String get gdtfWizardColorUv => 'UV';

  @override
  String get gdtfWizardChannelCtoShort => 'CTO';

  @override
  String get gdtfManualTab => 'Asistente manual';

  @override
  String get gdtfWizardManualTabTitle => 'Crear un GDTF sin PDF';

  @override
  String get gdtfWizardManualTabIntro =>
      '¿No tienes un manual en PDF a mano, o el aparato es demasiado simple para eso? Describe tu equipo en 5 pasos (estilo, funciones, canales, píxeles, estructura) y la app genera directamente un GDTF conforme, sin IA ni subida de archivos.';

  @override
  String get gdtfWizardSlotsAddButton => 'Añadir';

  @override
  String get gdtfWizardSlotsRowHint => 'Nombre del slot';

  @override
  String get gdtfWizardSlotsRemoveTooltip => 'Eliminar';

  @override
  String get gdtfWizardSlotsEmptyHint =>
      'Aún no hay slots con nombre — añade uno o usa una sugerencia.';

  @override
  String get ma3CalcTitle => 'Parámetros MA3';

  @override
  String get ma3CalcTileDescription =>
      '¿Cuántos parámetros necesita tu show y cuántas PU?';

  @override
  String get ma3CalcTabMvr => 'Desde un MVR';

  @override
  String get ma3CalcTabList => 'Lista de aparatos';

  @override
  String get ma3CalcAddFixture => 'Añadir un aparato';

  @override
  String get ma3CalcAddSheetTitle => '¿Qué aparato?';

  @override
  String get ma3CalcAddSheetSubtitle =>
      'Busca en GDTF Share, importa un .gdtf o escribe el valor tú mismo.';

  @override
  String get ma3CalcSearchHint => 'p. ej. MAC Aura, Robe Spiider…';

  @override
  String get ma3CalcSearchFailed =>
      'Búsqueda no disponible ahora. Revisa tu conexión.';

  @override
  String get ma3CalcNoResult =>
      'Sin resultados. Prueba otro nombre o la entrada manual.';

  @override
  String get ma3CalcImportGdtf => 'Archivo .gdtf';

  @override
  String get ma3CalcManualEntry => 'Entrada manual';

  @override
  String get ma3CalcManualName => 'Nombre del aparato';

  @override
  String get ma3CalcChooseMode => '¿Qué modo DMX?';

  @override
  String ma3CalcModeSummary(int params, int channels) {
    return '$params parám. MA3 · $channels canales DMX';
  }

  @override
  String get ma3CalcModeUnknown => 'Modo sin canales legibles';

  @override
  String get ma3CalcHowMany => '¿Cuántos aparatos?';

  @override
  String get ma3CalcDownloadFailed => 'No se pudo descargar el GDTF.';

  @override
  String get ma3CalcGdtfUnreadable =>
      'Este GDTF no se puede leer (¿archivo dañado?).';

  @override
  String get ma3CalcGdtfNoMode => 'No hay modo DMX en este GDTF.';

  @override
  String ma3CalcNotGdtf(String name) {
    return '«$name» no es un archivo .gdtf.';
  }

  @override
  String ma3CalcNotMvr(String name) {
    return '«$name» no es un archivo .mvr.';
  }

  @override
  String get ma3CalcPickFailed => 'No se pudo abrir el archivo.';

  @override
  String get ma3CalcMvrUnreadable =>
      'Este MVR no se puede leer (no es un archivo válido).';

  @override
  String get ma3CalcMvrNoScene =>
      'No hay GeneralSceneDescription.xml en este MVR.';

  @override
  String get ma3CalcMvrNoFixtures => 'No hay aparatos en este MVR.';

  @override
  String get ma3CalcMvrEmptyTitle => 'Carga tu MVR 🎛️';

  @override
  String get ma3CalcMvrEmptyBody =>
      'Exportación de Vectorworks, Capture, grandMA3, Depence… Contamos los aparatos, leemos sus GDTF y te decimos cuántos parámetros (y PU) necesitas.';

  @override
  String get ma3CalcPickMvr => 'Elegir un archivo .mvr';

  @override
  String get ma3CalcChangeFile => 'Cambiar';

  @override
  String get ma3CalcListEmptyTitle => 'Tu rig, aparato por aparato';

  @override
  String get ma3CalcListEmptyBody =>
      'Tipo 6 × MAC Aura, 23 × Studio Color… Añade tus aparatos, elige el modo y el total aparece solo.';

  @override
  String get ma3CalcYourSystem => 'Tu consola';

  @override
  String get ma3CalcSafetyMargin => 'Margen de seguridad';

  @override
  String get ma3CalcNoMargin => 'Ninguno';

  @override
  String get ma3CalcTotalParams => 'Parámetros MA3';

  @override
  String ma3CalcFixturesAndUniverses(int fixtures, int universes) {
    return '$fixtures aparatos · ≈ $universes universos DMX';
  }

  @override
  String ma3CalcWithMargin(int percent, String value) {
    return 'Con $percent % de margen: $value';
  }

  @override
  String get ma3CalcCopySummary => 'Copiar resumen';

  @override
  String ma3CalcVerdictSessionMax(String max) {
    return 'Más de $max parámetros: es el máximo de una sesión grandMA3.';
  }

  @override
  String ma3CalcVerdictOnPcTooSmall(String max) {
    return 'onPC se limita a $max parámetros';
  }

  @override
  String get ma3CalcVerdictOnPcTooSmallSub =>
      'Necesitas una consola grandMA3 (+ PU si hace falta): elígela arriba para ver la configuración.';

  @override
  String get ma3CalcVerdictOnPcOk => 'onPC es suficiente 👌';

  @override
  String ma3CalcVerdictOnPcOkSub(String max) {
    return 'Cualquier hardware onPC (command wing, fader wing, node 4k, rack-unit…) desbloquea $max parámetros.';
  }

  @override
  String ma3CalcVerdictBaseOk(String console) {
    return 'Tu $console es suficiente, no hace falta PU 🎉';
  }

  @override
  String ma3CalcVerdictCapacity(String capacity) {
    return 'Capacidad total: $capacity parámetros.';
  }

  @override
  String ma3CalcVerdictAddPu(String units) {
    return 'Añade $units';
  }

  @override
  String ma3CalcVerdictXlOnly(int count) {
    return 'O, más sencillo: $count × PU XL.';
  }

  @override
  String ma3CalcUnknownNotCounted(int count) {
    return '$count aparato(s) sin datos no se cuentan: corrígelos abajo.';
  }

  @override
  String ma3CalcFixtureTypes(int count) {
    return 'Tipos de aparatos ($count)';
  }

  @override
  String ma3CalcMvrCounts(int fixtures, int unpatched) {
    return '$fixtures aparatos · $unpatched sin patch';
  }

  @override
  String ma3CalcMultipatchNote(int count) {
    return 'De ellos $count multipatch, contados por seguridad.';
  }

  @override
  String ma3CalcPerUnit(int params) {
    return '$params parám. por aparato';
  }

  @override
  String get ma3CalcUnknownParams => 'Parámetros desconocidos';

  @override
  String get ma3CalcTapToFix => 'Toca para escribir el valor tú mismo →';

  @override
  String get ma3CalcSwipeHint =>
      'Desliza una fila a la izquierda para borrarla · tócala para corregir sus parámetros.';

  @override
  String get ma3CalcClear => 'Vaciar';

  @override
  String get ma3CalcClearListTitle => '¿Vaciar la lista?';

  @override
  String get ma3CalcClearListBody =>
      'Se eliminarán todos los aparatos de la lista.';

  @override
  String get ma3CalcCancel => 'Cancelar';

  @override
  String get ma3CalcOk => 'OK';

  @override
  String get ma3CalcParamsPerUnitTitle => 'Parámetros por aparato';

  @override
  String get ma3CalcParamsUnit => 'parám.';

  @override
  String ma3CalcGdtfValue(int value) {
    return 'Valor calculado desde el GDTF: $value';
  }

  @override
  String get ma3CalcParamsHelp =>
      'Truco: 1 parámetro = 1 canal DMX, los canales «fine» de 16 bits no cuentan.';

  @override
  String get ma3CalcBackToGdtf => 'Valor del GDTF';

  @override
  String get ma3CalcReliabilityOkTitle => 'Los GDTF parecen completos ✅';

  @override
  String get ma3CalcReliabilityOkBody =>
      'Todos los modos se encontraron y son coherentes. El cálculo sigue basándose en estos GDTF.';

  @override
  String ma3CalcReliabilityWarnTitle(int count) {
    return '$count tipo(s) de aparato por revisar';
  }

  @override
  String get ma3CalcReliabilityWarnBody =>
      'Algunos GDTF parecen incompletos o incoherentes: el total puede ser erróneo. Detalles bajo cada aparato.';

  @override
  String ma3CalcReliabilityBadTitle(int count) {
    return '$count tipo(s) de aparato sin datos';
  }

  @override
  String get ma3CalcReliabilityBadBody =>
      'Falta el GDTF o no se encuentra el modo: estos aparatos no se cuentan, así que el total es demasiado bajo. Tócalos para escribir el valor.';

  @override
  String get ma3CalcDisclaimer =>
      'El cálculo se basa en los GDTF. Si un GDTF está incompleto o mal, el resultado también. Compruébalo siempre en la grandMA3 (ventana System Information o Patch › DMX Universes, columna Coarse Params).';

  @override
  String get ma3CalcDisclaimerShort =>
      'Basado en los GDTF: comprobar en la grandMA3.';

  @override
  String get ma3CalcHowTitle => '¿Cómo se calcula?';

  @override
  String get ma3CalcHowBody =>
      'En grandMA3, 1 parámetro = 1 atributo controlado = 1 canal DMX «coarse». Los canales fine (16/24 bits) son gratis y los canales virtuales (dimmer virtual…) no cuentan para la licencia. Los aparatos multi-instancia (píxeles, celdas) se despliegan instancia por instancia. La recomendación busca el menor número de equipos.';

  @override
  String get ma3CalcHowHardware => 'Parámetros por equipo (doc. MA, v2.3)';

  @override
  String ma3CalcHowSessionMax(String max) {
    return 'Máximo por sesión: $max';
  }

  @override
  String get ma3CalcIssueGdtfMissing =>
      'Falta el GDTF en el MVR: parámetros desconocidos.';

  @override
  String get ma3CalcIssueUnreadable => 'GDTF ilegible.';

  @override
  String ma3CalcIssueModeMissing(String modes) {
    return 'El MVR no indica modo. Modos del GDTF: $modes';
  }

  @override
  String ma3CalcIssueModeNotFound(String mode, String modes) {
    return 'Modo «$mode» no encontrado en el GDTF. Disponibles: $modes';
  }

  @override
  String get ma3CalcIssueModeGuessed =>
      'No hay modo en el MVR: se ha usado el único modo del GDTF.';

  @override
  String ma3CalcIssueModePartial(String mode) {
    return 'Modo encontrado por nombre parecido: «$mode».';
  }

  @override
  String get ma3CalcIssueNoChannels => 'Este modo no tiene canales DMX.';

  @override
  String ma3CalcIssueNoFunction(int count) {
    return '$count canal(es) sin función ni atributo: GDTF probablemente incompleto.';
  }

  @override
  String ma3CalcIssueOverlap(int count) {
    return '$count canal(es) en una dirección DMX ya ocupada: GDTF incoherente.';
  }

  @override
  String ma3CalcIssueGaps(int count) {
    return '$count dirección(es) DMX vacía(s) en el modo: ¿faltan canales?';
  }

  @override
  String ma3CalcIssueNameMismatch(int announced, int found) {
    return 'El nombre del modo indica $announced canales, el GDTF describe $found.';
  }

  @override
  String ma3CalcIssueUnknownGeometry(int count) {
    return '$count canal(es) vinculados a una geometría inexistente.';
  }

  @override
  String get ma3CalcIssueManual => 'Valor introducido a mano.';

  @override
  String ma3CalcMarginChip(int percent) {
    return '+$percent %';
  }

  @override
  String ma3CalcHwLine(String name, String value) {
    return '$name: $value';
  }

  @override
  String ma3CalcHowOnPcMax(String max) {
    return 'onPC: máx. $max (con cualquier hardware onPC)';
  }

  @override
  String get accountSignInCta => 'Iniciar sesión';

  @override
  String get accountSignInCtaSubtitle =>
      'Tu Pro y tus plugins, en todos tus dispositivos ✨';

  @override
  String get accountAuthTitle => 'Tu cuenta ShowTech';

  @override
  String get accountAuthSubtitle =>
      'Inicia sesión para recuperar tu suscripción Pro\ny participar en la comunidad.';

  @override
  String get accountSignedInSnack => '¡Sesión iniciada! Bienvenido a bordo 🎉';

  @override
  String get accountSignedOutSnack => 'Sesión cerrada. ¡Hasta pronto! 👋';

  @override
  String get accountSignOutConfirmTitle => '¿Cerrar sesión?';

  @override
  String get accountSignOutConfirmBody =>
      'Tu suscripción Pro sigue vinculada a tu cuenta de Google: vuelve a iniciar sesión cuando quieras para recuperarla.';

  @override
  String get videoLmCalcDistTitle =>
      'Distancia de proyección (Ratio × Pantalla)';

  @override
  String get videoLmSizeModeLabel => 'Tamaño de pantalla conocido';

  @override
  String get videoLmModeWidth => 'Ancho';

  @override
  String get videoLmModeHeight => 'Alto';

  @override
  String get videoLmModeDiagonal => 'Diagonal';

  @override
  String get videoLmImageHeightLabel => 'Alto de imagen (m)';

  @override
  String get videoLmImageHeightHint => 'ej: 3.375';

  @override
  String get videoLmDiagonalLabel => 'Diagonal (pulgadas)';

  @override
  String get videoLmDiagonalHint => 'ej: 200';

  @override
  String get videoLmRatioMinLabel => 'Ratio de proyección (o mín. si zoom)';

  @override
  String get videoLmRatioMaxLabel => 'Ratio máx. (opcional, zoom)';

  @override
  String get videoLmRatioMaxHint => 'ej: 2.10';

  @override
  String get videoLmErrMissingSizeRatio =>
      '❌ Faltan datos: Tamaño de pantalla + Ratio.';

  @override
  String get videoLmErrSizeGt0 => '❌ El tamaño de pantalla debe ser > 0.';

  @override
  String videoLmResultImage(Object width, Object height, Object format) {
    return '📐 Imagen: $width × $height m ($format)';
  }

  @override
  String videoLmResultDistance(Object distance) {
    return '✅ Distancia = $distance m';
  }

  @override
  String videoLmResultDistanceRange(Object min, Object max) {
    return '✅ Distancia: de $min m a $max m';
  }

  @override
  String get videoLmDistanceNote =>
      'ℹ️ Distancia medida desde el objetivo: comprueba la referencia del fabricante (frente del objetivo o carcasa).';

  @override
  String get menuViewModeList => 'Vista de lista';

  @override
  String get menuViewModeGrid => 'Vista de cuadrícula';

  @override
  String get audioRt60Subtitle => 'Tiempo de reverberación de una sala';

  @override
  String get audioSplMeterSubtitle =>
      'Mide el nivel sonoro con el micro del móvil';

  @override
  String get audioImpedanceSubtitle => 'Altavoces en serie o en paralelo';

  @override
  String get audioCrossoverSubtitle => 'Frecuencias de corte y filtros';

  @override
  String get audioDelayTimeSubtitle => 'Tiempos de delay ajustados al tempo';

  @override
  String get audioNoiseDoseSubtitle => 'Exposición sonora y duración máxima';

  @override
  String get audioInputListSubtitle =>
      'Prepara y comparte tu lista de entradas';

  @override
  String get networkPoeSubtitle => 'Presupuesto de potencia PoE de un switch';

  @override
  String get networkFiberSubtitle => 'Pérdidas y margen de un enlace de fibra';

  @override
  String get networkSubnetSubtitle =>
      'Máscara, rango de direcciones y broadcast';

  @override
  String get networkArtNetAddressingSubtitle =>
      'Universo DMX ↔ Net / Sub-Net / Universo';

  @override
  String get rdmPageSubtitle => 'Detecta y configura equipos RDM';

  @override
  String get rfSplitterSubtitle =>
      'Pérdidas de inserción de divisores y combinadores';

  @override
  String get rfCableAntennaSubtitle => 'Pérdidas de cable y ganancia de antena';

  @override
  String get rfPlannerSubtitle =>
      'Plan de frecuencias inalámbricas sin intermodulación';

  @override
  String get timecodeToolConverterSubtitle =>
      'Convierte timecode entre cadencias';

  @override
  String get timecodeToolMathSubtitle => 'Suma, resta y desplaza timecode';

  @override
  String get timecodeToolDelaySubtitle => 'Convierte frames y milisegundos';

  @override
  String get timecodeToolCountdownSubtitle => 'Cuenta atrás hasta un timecode';

  @override
  String get filterCorrespondenceSubtitle =>
      'Equivalencias entre gamas de filtros';

  @override
  String get ma3CalcEditSheetTitle => 'EDITAR ESTE APARATO';

  @override
  String get ma3CalcActionChangeMode => 'Cambiar de modo';

  @override
  String get ma3CalcActionChangeModeSub =>
      'Mantener el aparato, elegir otro modo DMX';

  @override
  String get ma3CalcActionChangeType => 'Cambiar de aparato (GDTF)';

  @override
  String get ma3CalcActionChangeTypeSub =>
      'Sustituir o añadir el GDTF: GDTF Share o archivo';

  @override
  String get ma3CalcActionManual => 'Introducir los parámetros a mano';

  @override
  String get ma3CalcActionManualSub => 'Forzar un valor por aparato';

  @override
  String get ma3CalcNeedGdtfFirst =>
      'No hay GDTF para este aparato: elígelo primero.';

  @override
  String get ma3CalcReplaceSheetTitle => 'Elegir el aparato';

  @override
  String ma3CalcLineUpdated(Object label) {
    return '✅ $label actualizado';
  }

  @override
  String get audioPickAmplifier => 'Elegir un amplificador';

  @override
  String get audioPickSpeaker => 'Elegir un altavoz';

  @override
  String get audioSearchBrandModel => 'Buscar marca o modelo';

  @override
  String get audioCustomPreset => 'Personalizado';

  @override
  String get audioCustomPresetHint => 'Introducir sus propios valores';

  @override
  String audioModelsCount(Object count) {
    return '$count modelos';
  }

  @override
  String get audioNoResults => 'Sin resultados';

  @override
  String audioChannelsCount(Object count) {
    return '$count canales';
  }

  @override
  String audioRecommendedAmp(Object range) {
    return 'Amplificador recomendado: $range';
  }

  @override
  String audioPowerHandling(Object watts) {
    return 'Potencia admisible: $watts W';
  }

  @override
  String get audioNoPowerData =>
      'Potencia admisible no publicada por el fabricante: solo se comprueba la impedancia. Use sus presets / controladores.';

  @override
  String get audioActiveSection =>
      'Recinto activo: un canal de amplificador por sección.';

  @override
  String audioStatusZTooLow(Object diff) {
    return '✗  Z demasiado baja (−$diff Ω)';
  }

  @override
  String audioStatusOkPct(Object pct) {
    return '✓  OK ($pct % RMS)';
  }

  @override
  String audioStatusUnderpowered(Object pct) {
    return '↓  Poca potencia ($pct % RMS)';
  }

  @override
  String audioStatusHeadroom(Object ratio) {
    return '✓  Margen ×$ratio';
  }

  @override
  String audioStatusOverpowered(Object ratio) {
    return '✗  Demasiada potencia ×$ratio';
  }

  @override
  String get audioStatusInRange => '✓  En el rango del fabricante';

  @override
  String get audioStatusBelowRange => '↓  Bajo el rango recomendado';

  @override
  String get audioStatusAboveRange => '⚠  Por encima del rango';

  @override
  String get audioStatusZOkNoData => '✓  Z OK — P no publicada';

  @override
  String audioStatusLimiterRequired(Object ratio) {
    return '⚠  ×$ratio — limitador obligatorio';
  }

  @override
  String get catalogSearchHint => 'Buscar marca, modelo, tipo…';

  @override
  String get catalogSearchNoResults => 'Sin resultados';

  @override
  String catalogSearchResultsCount(Object count) {
    return '$count resultados';
  }

  @override
  String get soundCatalogTitle => 'Catálogo de sonido';

  @override
  String get soundCatalogSubtitle =>
      'Amplificadores y altavoces: especificaciones y manuales';

  @override
  String get laserCatalogTitle => 'Catálogo láser';

  @override
  String get laserCatalogSubtitle =>
      'Proyectores láser: potencia, haz, divergencia';

  @override
  String get catalogAmplifiers => 'Amplificadores';

  @override
  String get catalogSpeakers => 'Altavoces';

  @override
  String get catalogUseValues => 'Usar';

  @override
  String get laserPickFromCatalog => 'Elegir del catálogo';

  @override
  String get laserCatalogDisclaimer =>
      'Valores declarados por el fabricante, no medidos.';

  @override
  String get laserCatalogMissingValues =>
      'Diámetro o divergencia no publicados para este láser: complételos manualmente.';

  @override
  String get catalogFieldChannels => 'Canales';

  @override
  String get catalogFieldPowerPerChannel => 'Potencia por canal';

  @override
  String get catalogFieldType => 'Tipo';

  @override
  String get catalogFieldSection => 'Sección';

  @override
  String get catalogFieldPowerHandling => 'Potencia admisible (RMS/AES)';

  @override
  String get catalogFieldRecommendedAmp => 'Amplificador recomendado';

  @override
  String get catalogFieldOpticalPower => 'Potencia óptica';

  @override
  String get catalogFieldColors => 'Colores';

  @override
  String get catalogFieldScanner => 'Escáneres';

  @override
  String get catalogFieldClass => 'Clase láser';

  @override
  String get catalogFieldConsumption => 'Consumo';

  @override
  String get homeSafetyTitle =>
      'Seguridad';

  @override
  String get homeSafetySubtitle =>
      'Planes de seguridad, certificado de montaje';

  @override
  String get subscriptionCategorySafetyTitle =>
      'Seguridad';

  @override
  String get subscriptionCategorySafetyDescription =>
      'Planes de seguridad, certificado de montaje con fotos, reservas y firma, exportación PDF.';

  @override
  String get subscriptionHeadlineSafetySubtitle =>
      'Redacte sus planes de seguridad y certificados de montaje sobre el terreno, con exportación PDF firmada.';

  @override
  String get safetyPageTitle =>
      'Seguridad';

  @override
  String get safetySectionDocuments =>
      'Documentos';

  @override
  String get safetyPpspsTitle =>
      'Planes de seguridad';

  @override
  String get safetyPpspsSubtitle =>
      'PPSPS (Francia), plan de seguridad (Bélgica)';

  @override
  String get safetyAttestationTitle =>
      'Montaje correcto';

  @override
  String get safetyAttestationSubtitle =>
      'Controles, reservas y firma';

  @override
  String get safetyComingSoon =>
      'Disponible en una próxima versión.';

  @override
  String get safetyLibraryTitle =>
      'Biblioteca';

  @override
  String safetyLibrarySummary(Object risks, Object measures, Object controls) {
    return '$risks riesgos · $measures medidas · $controls controles';
  }

  @override
  String safetyLibraryUpdated(Object date) {
    return 'Actualizado: $date';
  }

  @override
  String get safetyLibraryOffline =>
      'Copia local, funciona sin conexión';

  @override
  String get safetyDisclaimer =>
      'Herramienta de ayuda a la redacción. El contenido de los documentos sigue siendo responsabilidad de la empresa firmante.';
}
