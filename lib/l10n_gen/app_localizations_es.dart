// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'Universo DMX en Ethernet/UDP, nodos, broadcast vs. unicast.\nLímites reales, estabilidad de la red, RDM en función del hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net - DMX sobre IP (nodos, unidifusión/difusión)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distancias típicas, espectáculo de buenas prácticas.';

  @override
  String get aboutCablingFiberTitle =>
      'Red - RJ45 / Fibra / velocidades y longitudes';

  @override
  String get aboutComputingSubtitle =>
      'Velocidades útiles, versiones, límites reales, trampas del marketing.';

  @override
  String get aboutComputingTitle => 'TI - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutDmxSubtitle =>
      'Universo, direcciones, tramas, cableado RS-485, terminación, errores de campo.\nIncluye diagramas y lista de comprobación.';

  @override
  String get aboutDmxTitle => 'DMX';

  @override
  String get aboutElectricitySubtitle =>
      'Conectores, mono/tri, paneles kW rápidos (16A→400A), trampas de campo.';

  @override
  String get aboutElectricityTitle => 'Eléctrico - Schuko / P17 / potencias';

  @override
  String get aboutIpBasicsSubtitle =>
      'Comprensión de IP, máscara, puerta de enlace, DHCP vs estática.\nEjemplos concretos (2.x, 10.x, 192.168.x) + lista de comprobación.';

  @override
  String get aboutIpBasicsTitle => 'Bases IP';

  @override
  String get aboutLightNetworkSubtitle =>
      'Arquitectura sencilla y robusta para Art-Net/sACN.\nVLAN, IGMP snooping/query, Wi-Fi (jitter), switches, diagramas + lista de comprobación.';

  @override
  String get aboutLightNetworkTitle =>
      'Red ligera: VLAN, IGMP, Wi-Fi frente a cableado';

  @override
  String get aboutSacnSubtitle =>
      'Estándar DMX sobre IP orientado a redes profesionales.\nMultidifusión/unidifusión, IGMP snooping/query, prioridades multifuente.';

  @override
  String get aboutSacnTitle => 'sACN';

  @override
  String get aboutVideoSubtitle =>
      'Elegir según latencia, fiabilidad, cableado, LAN vs WAN.\nTablas + diagrama.';

  @override
  String get aboutVideoTitle => 'Vídeo';

  @override
  String get appTitle => 'Mi aplicación tecnológica';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name - $channels canales';
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
  String get catalogInfoPower => 'Potencia';

  @override
  String get catalogInfoWeight => 'Peso';

  @override
  String catalogLastUpdate(Object date) {
    return 'Última actualización : $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Constructor ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Modelo ($count)';
  }

  @override
  String get catalogNotProvided => 'No hay información';

  @override
  String get catalogOpenDmxChart => 'Abrir la tabla DMX';

  @override
  String get catalogOpenManual => 'Abrir el manual';

  @override
  String get catalogResetTooltip => 'Restablecer';

  @override
  String catalogSyncError(Object message) {
    return 'Error: $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Fallo de sincronización: $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Fallo de sincronización (motivo desconocido).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Tipo ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Actualización';

  @override
  String get catalogUpdated => 'Catálogo actualizado.';

  @override
  String get commonCalculate => 'Calcule';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonCopyResultTooltip => 'Copiar el resultado';

  @override
  String get commonDash => '-';

  @override
  String get commonNone => 'Sin registro';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonRename => 'Cambie el nombre de';

  @override
  String get commonReset => 'Restablecer';

  @override
  String get commonSave => 'Regístrese en';

  @override
  String get commonSearch => 'Buscar en';

  @override
  String get commonTooLowWithCross => 'Demasiado bajo ❌';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Consentimientos restablecidos.';

  @override
  String get dipSwitchAddressHint => 'Ej: de 1 a 512';

  @override
  String get dipSwitchAddressLabel => 'Dirección DMX';

  @override
  String get dipSwitchChannelUnit => 'canal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Advertencia: fin del universo DMX alcanzado.';

  @override
  String get dipSwitchInputsTitle => 'Entradas';

  @override
  String get dipSwitchIntervalHint => 'Ex : 4 (canales)';

  @override
  String get dipSwitchIntervalLabel => 'Intervalo';

  @override
  String get dipSwitchModeAddressDirect => 'Dirección directa';

  @override
  String get dipSwitchModeAddressMinusOne => 'Dirección - 1';

  @override
  String get dipSwitchNextAddressButton => 'Dirección';

  @override
  String get dipSwitchOffLabel => 'OFF';

  @override
  String get dipSwitchOnLabel => 'EN';

  @override
  String get dipSwitchResetTooltip => 'Restablecer';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Dirección : $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Dirección no indicada';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binario: $binary';
  }

  @override
  String get dipSwitchResultHeader => 'Resultados';

  @override
  String dipSwitchResultIntervalLine(Object end, Object start) {
    return 'Intervalo: $start → $end';
  }

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Modo : $mode';
  }

  @override
  String get dipSwitchScrollHint =>
      'Desplácese hacia abajo para ver todos los interruptores.';

  @override
  String get dipSwitchSectionTitle => 'Interruptores';

  @override
  String get dipSwitchSummaryTitle => 'Resumen';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Interruptor $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel =>
      'Utilizar el modo Dirección - 1';

  @override
  String get disclaimerAccept => 'Acepto';

  @override
  String get disclaimerCertify =>
      'Certifico que he leído y acepto estas condiciones.';

  @override
  String get disclaimerText =>
      'SÓLO CON FINES INFORMATIVOS\n\nLos cálculos proporcionados por esta aplicación (vídeo, luz, láser) son meramente informativos.\nEn ningún caso sustituyen a :\n- cálculos certificados,\n- estudios técnicos\n- normas oficiales en vigor\n- o la validación por un profesional cualificado.\n\nRESPONSABILIDAD\nEl editor de esta aplicación no se hace responsable de los errores de cálculo, omisiones, daños materiales, daños personales o cualquier incidente que se produzca durante la instalación, funcionamiento o uso de esta aplicación,\ndaños personales o cualquier incidente derivado de la instalación, el funcionamiento o el uso del equipo.\n\nVÍDEO Y PROYECCIÓN\nLos resultados (tamaños, proporciones, brillo, superposiciones, etc.) se basan en modelos teóricos y pueden variar en función de :\nóptica, zoom, uniformidad, entorno de iluminación, soporte, ajustes, etc.\nConsulte siempre la documentación oficial del fabricante.\n\nLUZ\nLos cálculos son indicativos y no tienen en cuenta todas las condiciones reales (tolerancias, pérdidas ópticas,\ndegradación de las fuentes, normas locales, condiciones ambientales, etc.).\n\nLÁSER - SEGURIDAD\nLos cálculos NOHD, SZED y CZED se basan en hipótesis estándar y umbrales teóricos.\nEn particular, no tienen en cuenta\n- los instrumentos ópticos (prismáticos, cámaras, telescopios, etc.),\n- las condiciones atmosféricas (niebla, lluvia, polvo, etc.),\n- los reflejos imprevistos, el mal uso, los ajustes específicos.\nEl uso de un sistema láser implica la responsabilidad directa del operador y un análisis de riesgos adecuado.\n\nACEPTACIÓN DE LOS RIESGOS\nAl utilizar esta aplicación, el usuario reconoce :\n- que conoce las normas de seguridad aplicables\n- que es el único responsable de sus instalaciones\n- asumir toda la responsabilidad de los riesgos asociados a la utilización del material (vídeo, luz, láser),\n- comprobar sistemáticamente los datos con los manuales oficiales de los fabricantes.';

  @override
  String get disclaimerTitle => '⚠️ AVISO LEGAL Y EXENCIÓN DE RESPONSABILIDAD';

  @override
  String get homeLaserSubtitle =>
      'Cálculos y seguridad láser (se requiere consentimiento para cada entrada).';

  @override
  String get homeLaserTitle => 'Láser';

  @override
  String get homeLightSubtitle =>
      'Tamaño de proyección, dip-switch DMX, fotometría, catálogo, parche DMX.';

  @override
  String get homeLightTitle => 'Luz';

  @override
  String get homeReferencesSubtitle =>
      'DMX / red / vídeo: fichas técnicas y referencias.';

  @override
  String get homeReferencesTitle => 'Referencias';

  @override
  String get homeTitle => 'Inicio';

  @override
  String get homeVideoSubtitle =>
      'Lente y medición, brillo, multiproyector, LED y patrones de prueba.';

  @override
  String get homeVideoTitle => 'Vídeo';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Sistema (automático)';

  @override
  String get languageSystemCurrent => 'Idioma del teléfono';

  @override
  String get laserAdviceFullPower => 'Plena potencia autorizada (100%)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Potencia máxima recomendada: $percent';
  }

  @override
  String get laserConsentCheckboxLabel => 'Acepto y comprendo los riesgos.';

  @override
  String get laserConsentContinue => 'Continúe en';

  @override
  String get laserConsentText =>
      'ACCESO A LA SECCIÓN LÁSER\n\nLa parte LÁSER de esta aplicación se refiere a los cálculos de seguridad (por ejemplo, NOHD, SZED, CZED).\nEstos cálculos son indicativos y no sustituyen :\n- un análisis de riesgos,\n- las normas vigentes\n- los procedimientos de explotación\n- o la validación por una persona cualificada.\n\nIMPORTANTE\n- Riesgo de lesiones oculares o cutáneas si se utiliza incorrectamente.\n- El cálculo puede ser incorrecto si los parámetros introducidos son incompletos o incorrectos, o si el contexto real difiere (óptica, condiciones atmosféricas, reflejos, alineación, etc.),\n  condiciones atmosféricas, reflejos, alineación, etc.).\n- El operador es el único responsable de la instalación, el funcionamiento y la conformidad.\n\nAl validar, usted confirma que :\n- comprende los riesgos,\n- respeta las normas de seguridad aplicables\n- asume toda la responsabilidad en caso de negligencia o uso indebido.';

  @override
  String get laserConsentTitle => '🔴 CONSENTIMIENTO LÁSER (OBLIGATORIO)';

  @override
  String get laserDiameterHint => 'ex: 3.0';

  @override
  String get laserDiameterLabel => 'Diámetro de salida (mm)';

  @override
  String get laserDisclaimerShort =>
      'Cálculo orientativo. No sustituye a un análisis de seguridad láser.';

  @override
  String get laserDivergenceHint => 'ej: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergencia (mrad)';

  @override
  String get laserInputsTitle => 'Entradas';

  @override
  String get laserInvalidInputs =>
      'Introduzca una potencia, divergencia y diámetro válidos.';

  @override
  String get laserNameUpdated => 'Nombre actualizado.';

  @override
  String get laserNormativeParamsBody =>
      'MEP para la distancia nominal de peligro para los ojos (NOHD): 25,4 W/m².\n(Norma IEC 60825-1, edición 3.0)\n\nMEP para distancia de exposición de zona sensible (SZED): 1 W/m².\n(Norma ANSI Z136.6)\n\nMPE para distancia de exposición de zona crítica (CZED): 0,05 W/m² (norma ANSI Z136.6)\n(Norma ANSI Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Parámetros de seguridad';

  @override
  String get laserPowerHint => 'por ejemplo: 5000';

  @override
  String get laserPowerLabel => 'Potencia (mW)';

  @override
  String get laserPresetAdded => 'Grabación añadida.';

  @override
  String get laserPresetDeleted => 'Registro borrado.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW - Div: $div mrad - Ø: $diam mm';
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
  String get laserSearchHint => 'por ejemplo, \"RGB 5W';

  @override
  String get laserTargetDistanceHint => 'ej: 10';

  @override
  String get laserTargetDistanceLabel => 'Distancia al objetivo (m)';

  @override
  String get laserZoneCzedDesc => 'Zona crítica';

  @override
  String get laserZoneNohdDesc => 'Peligro para los ojos';

  @override
  String get laserZoneSzedDesc => 'Zona sensible';

  @override
  String get legalNotices => 'Información jurídica';

  @override
  String get lightCatalogDescription =>
      'Selección por fabricante, tipo y producto, con información y manual.';

  @override
  String get lightCatalogTitle => 'Catálogo';

  @override
  String get lightDisclaimerShort =>
      'Herramientas indicativas. Consulte siempre la documentación del fabricante.';

  @override
  String get lightDmxSwitchDescription =>
      'Conversión indicativa entre dirección DMX e interruptores, con navegación por intervalos.';

  @override
  String get lightDmxSwitchTitle => 'Interruptor DMX';

  @override
  String get lightPatchDescription => 'Importar y visualizar un archivo MVR.';

  @override
  String get lightPatchTitle => 'Conexión DMX';

  @override
  String get lightPhotometryDescription =>
      'Conversiones indicativas entre lux, candela y lumen, con distancia y ángulo.';

  @override
  String get lightPhotometryTitle => 'Fotometría';

  @override
  String get lightProjectionDescription =>
      'Cálculo indicativo del tamaño del punto en función del ángulo, la distancia y el diámetro.';

  @override
  String get lightProjectionTitle => 'Tamaño de proyección';

  @override
  String get menuTitle => 'Menú';

  @override
  String get mireBlendLabel => 'MEZCLA';

  @override
  String get mireDash => '-';

  @override
  String get mireErrInvalidOverlap => '❌ Solapamiento no válido (0 a 99,9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Número de proyectores no válido (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Anchura/Altura (px) no válida.';

  @override
  String get mireExportPng => 'Exportar PNG';

  @override
  String get mireHeightPxHint => 'Por ejemplo, 1080';

  @override
  String get mireHeightPxHintMapping => 'ej: 2160';

  @override
  String get mireHeightPxLabel => 'Altura (px)';

  @override
  String get mireLedErrTileCm => '❌ Introduzca Mosaico cm (anchura/altura >0).';

  @override
  String get mireLedErrTilePx => '❌ Introduzca Mosaico px (anchura/altura >0).';

  @override
  String get mireLedErrTilesXY => '❌ Introduzca las baldosas X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'Ajustes de pared LED';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Paso calculado: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedSubtitleGridLabels => 'Cuadrícula + marcadores + círculos';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedSubtitleUniformity => 'Uniformidad + círculos';

  @override
  String get mireLedTileHcmLabel => 'Altura de la baldosa (cm)';

  @override
  String get mireLedTileHpxLabel => 'Altura de la baldosa (px)';

  @override
  String get mireLedTileWcmLabel => 'Anchura de la baldosa (cm)';

  @override
  String get mireLedTileWpxLabel => 'Anchura de la baldosa (px)';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireLedTilesXLabel => 'Baldosas horizontales (X)';

  @override
  String get mireLedTilesYLabel => 'Baldosas verticales (Y)';

  @override
  String get mireLedTitle => 'LED / MIRE';

  @override
  String get mireLedTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedTypeGridLabels => 'Cuadrícula + marcadores + círculos';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedTypeTilesId =>
      'Identificación de las baldosas (número + colores)';

  @override
  String get mireLedTypeUniformity => 'Uniformidad + círculos';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Resolución de la pared: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Paso calculado fuera de rango (0,5-20 mm). Compruebe Mosaico cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Paso X ≠ Paso Y (baldosa no homogénea). Comprobar dimensiones cm y px.';

  @override
  String get mireMappingSectionTitle =>
      'Patrón de prueba de mapeo multiproyector';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n - Solapamiento $percent% - $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Rampas de mezcla';

  @override
  String get mireMappingTypeCombo => 'Combo (zonas + superposición + mezcla)';

  @override
  String get mireMappingTypeLabel => 'Mapa de tipos';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonas + solapamiento';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientación';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String get mireOverlapHint => 'ex: 10.0';

  @override
  String get mireOverlapLabel => 'Solapamiento (%)';

  @override
  String mirePitchEqual(Object value) {
    return '$value mm';
  }

  @override
  String mirePitchXY(Object x, Object y) {
    return 'X $x mm - Y $y mm';
  }

  @override
  String mireProjectorLabelPattern(Object index) {
    return 'PROJO $index';
  }

  @override
  String get mireProjectorsNHint => 'ej: 2';

  @override
  String get mireProjectorsNLabel => 'Número de focos (N)';

  @override
  String get mireSimpleSectionTitle => 'Patrón de prueba de una sola pantalla';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Tablero de ajedrez + círculos';

  @override
  String get mireSimpleSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Cuadrícula + seguro + 2 barras centradas + círculos';

  @override
  String get mireSimpleSubtitleGridSafe => 'Cuadrícula + seguro + círculos';

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
  String get mireSimpleTypeGridSafe => 'Cuadrícula + seguro + círculos';

  @override
  String get mireSimpleTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireTileMissingPx => 'Introduzca Mosaico (px) para la numeración.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Baldosa ${tw}x$th px - Cuadrícula $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Paso ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Paso X $px - Y $py mm';
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
  String get mireTypeLabel => 'Tipo de vista';

  @override
  String get mireVideoComboTitle => 'VÍDEO / VISTA COMBINADA';

  @override
  String get mireVideoMappingSectionTitle =>
      'Patrón de prueba de mapeo multiproyector';

  @override
  String get mireVideoMappingTitle => 'VIDEO / TEST PATTERN MAPPING';

  @override
  String get mireVideoSimpleSectionTitle =>
      'Patrón de prueba de una sola pantalla';

  @override
  String get mireVideoSimpleTitle => 'VÍDEO / PATRÓN DE PRUEBA ÚNICO';

  @override
  String get mireVideoTypeCheckerboard => 'Tablero de ajedrez + círculos';

  @override
  String get mireVideoTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoTypeCombo =>
      'Combo (cuadrícula + círculos + 2 barras centradas)';

  @override
  String get mireVideoTypeGridSafe => 'Cuadrícula + seguro + círculos';

  @override
  String get mireVideoTypeUniformity => 'Uniformidad + círculos';

  @override
  String get mireWallNotMultipleOfTiles => 'PARED DE AZULEJOS NO MÚLTIPLE';

  @override
  String get mireWidthPxHint => 'por ejemplo: 1920';

  @override
  String get mireWidthPxHintMapping => 'ej: 3840';

  @override
  String get mireWidthPxLabel => 'Anchura (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Dirección : $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Canales utilizados: $count / 512';
  }

  @override
  String get patchConflictError => 'Direcciones conflictivas (solapadas).';

  @override
  String get patchConflictShort => 'Conflicto';

  @override
  String patchConflicts(Object count) {
    return 'Conflictos : $count';
  }

  @override
  String get patchEditChannelsLabel => 'Canales';

  @override
  String get patchEditHint => 'Comprueba el modo y el número de canales.';

  @override
  String get patchEditModeLabel => 'Modo';

  @override
  String get patchEditTitle => 'Edición';

  @override
  String get patchEmptyUniverse => 'No hay máquinas en este universo.';

  @override
  String patchFixturesCount(Object count) {
    return 'Máquinas : $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'Los resultados son indicativos. Compruébalos siempre con la consola.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analiza un archivo MVR y carga el parche como referencia.';

  @override
  String get patchHomeImportMvrTitle => 'Importar un MVR';

  @override
  String get patchHomeTitle => 'Conexión DMX';

  @override
  String get patchHomeViewPatchDescription =>
      'Lista y conflictos por universo.';

  @override
  String get patchHomeViewPatchTitle => 'Ver el parche';

  @override
  String get patchHubOpenGridButton => 'Rejilla abierta';

  @override
  String get patchHubOpenMvrButton => 'Abrir MVR';

  @override
  String get patchHubStateEmpty => 'No hay referencias cargadas.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Cargado: $count universo';
  }

  @override
  String get patchHubStateTitle => 'Estado';

  @override
  String get patchHubTitle => 'Parche de cubo';

  @override
  String get patchHubWorksiteBody =>
      'Importe un MVR o consulte la tabla de ocupación.';

  @override
  String get patchHubWorksiteTitle => 'Página web';

  @override
  String get patchInvalidChannelCount => 'Número de canales no válido.';

  @override
  String get patchIssueInvalidChannelCount =>
      'El número de canales debe ser mayor o igual a 1.';

  @override
  String get patchIssueInvalidStartAddress =>
      'La dirección DMX debe estar comprendida entre 1 y 512.';

  @override
  String get patchIssueInvalidUniverse =>
      'El universo debe ser mayor o igual a 1.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'La gama de canales supera los 512 en este universo.';

  @override
  String get patchIssueUnknown => 'Error desconocido.';

  @override
  String get patchListTitle => 'Lista';

  @override
  String get patchManualDisabledBody =>
      'El parche es de sólo lectura cuando se carga una referencia MVR.';

  @override
  String get patchManualDisabledTitle => 'Fuera de';

  @override
  String get patchManualTitle => 'Parche manual';

  @override
  String patchModeLabel(Object mode) {
    return 'Modo : $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Análisis...';

  @override
  String get patchMvrButtonLoadAsReference => 'Cargar como referencia';

  @override
  String get patchMvrButtonPickFile => 'Elija un archivo';

  @override
  String get patchMvrClearTooltip => 'Borrar';

  @override
  String get patchMvrColAddress => 'Dirección';

  @override
  String get patchMvrColChannels => 'Canales';

  @override
  String get patchMvrColId => 'ID';

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
  String get patchMvrOrderAsc => 'Media luna';

  @override
  String get patchMvrOrderDesc => 'Descendente';

  @override
  String get patchMvrOrderLabel => 'Pida';

  @override
  String get patchMvrSortAddress => 'Dirección';

  @override
  String get patchMvrSortByLabel => 'Ordenar por';

  @override
  String get patchMvrSortChannels => 'Canales';

  @override
  String get patchMvrSortId => 'ID';

  @override
  String get patchMvrSortName => 'Nombre';

  @override
  String get patchMvrSortUniverse => 'Universo';

  @override
  String get patchMvrSortUniverseThenAddress => 'Universo entonces dirección';

  @override
  String get patchMvrStatusCleared => 'Referencia suprimida.';

  @override
  String get patchMvrStatusEmptyBytes => 'Archivo vacío.';

  @override
  String get patchMvrStatusExtractingZip => 'Extrayendo el ZIP...';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'No es posible seleccionar el archivo: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Máquinas encontradas: $count (multicanal: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Cargando GDTFs...';

  @override
  String get patchMvrStatusNoContentToLoad => 'No hay contenido para cargar.';

  @override
  String get patchMvrStatusNoFileSelected => 'No hay archivos seleccionados.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'No se han encontrado máquinas utilizables.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Error de análisis sintáctico: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Análisis de contenido...';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Referencia cargada: $count máquina(s) (ignorada: $skipped, huellas GDTF: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Catering : $count máquinas';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml no se encuentra en el MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'Selección de archivos...';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Archivo no soportado: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Resumen';

  @override
  String get patchMvrTitle => 'Importación de MVR';

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
    return 'Conflictos : $count canal(es)';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Limitado por la anchura de la pantalla.';

  @override
  String get patchUniverseGridTitle => 'Ocupación (de 1 a 512)';

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
    return '- $fixture\n  $mode - $channels canal(aux)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Ocupado : $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universo $universe - Dirección $address\nEstado : $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Varias máquinas ocupan este canal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '... y $count otro(s).';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Conflicto';

  @override
  String get patchUniversePopupTitleFree => 'Canal gratuito';

  @override
  String get patchUniversePopupTitleOccupied => 'Canal ocupado';

  @override
  String get patchUniverseReferenceNone => 'Ninguna referencia cargada';

  @override
  String get patchUniverseReferenceReadOnly => 'Sólo lectura (de MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Referencia';

  @override
  String get patchUniverseResetConfirm => 'Restablecer';

  @override
  String get patchUniverseResetContent =>
      'Esto borra el parche cargado desde el MVR en la aplicación.\nNo se modifica ningún dato del archivo.';

  @override
  String get patchUniverseResetTitle => '¿Restablecer la referencia?';

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
  String get patchUniverseTapHint => 'Toca una casilla para ver los detalles.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'Universo DMX';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Universo $universe';
  }

  @override
  String get patchUniverseUniverseTitle => 'Universo';

  @override
  String get patchUniverseZoomIn => 'Ampliar';

  @override
  String get patchUniverseZoomOut => 'Reduzca';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'En grados';

  @override
  String get photometryBeamAngleHint3 => 'En grados';

  @override
  String get photometryBeamAngleLabel => 'Ángulo del haz';

  @override
  String get photometryCandelaHint1 => 'Introduzca un valor en cd';

  @override
  String get photometryCandelaHint2 => 'Introduzca un valor en cd';

  @override
  String get photometryCandelaLabel => 'Candela';

  @override
  String get photometryDisclaimerShort =>
      'Sólo indicación. Consulte la documentación del fabricante.';

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
  String get photometryLumensLabel => 'Lúmenes';

  @override
  String get photometryLuxHint => 'Introduzca un valor en lux';

  @override
  String get photometryLuxLabel => 'Lux';

  @override
  String get photometrySection1Title => 'Lux <> Candela';

  @override
  String get photometrySection2Title => 'Lúmenes <> Candela';

  @override
  String get photometrySection3Title => 'Lúmenes < Lux';

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
    return 'Lúmenes: $lumens lm - Distancia: $distance m - Ángulo: $angle° - Lux: $lux lx.';
  }

  @override
  String get projectionAngleHint => 'En grados';

  @override
  String get projectionAngleLabel => 'Ángulo';

  @override
  String get projectionAutoHelp => 'Auto: calcula el valor que falta.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Ángulo : $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diámetro : $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Distancia : $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Ángulo : $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Diámetro : $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Distancia : $distance m';
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
  String get projectionInputsTitle => 'Entradas';

  @override
  String get projectionResultsTitle => 'Resultados';

  @override
  String get resetConsents => 'Restablecer consentimientos';

  @override
  String get settings => 'Parámetros';

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
    return 'Formato: $format\nSuperficie: $area m²\nLux (lm/m²): $lux\nLux eq (ganancia): $luxEq\nLuminancia: $nits nits | $fl ft-L\nUmbral mínimo ($presetLabel): $minFl ft-L → $status\nNota: estimación indicativa (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle => 'Lux / nits / ft-L + umbral';

  @override
  String get videoBrightnessSubtitle => 'Lux / nits / ft-L + umbral';

  @override
  String get videoBrightnessTitle => 'Luminosidad';

  @override
  String get videoCalc1ErrMissing => '❌ Datos que faltan: Distancia + Anchura.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Ratio de proyección = $ratio';
  }

  @override
  String get videoCalc1Title => 'Relación (Distancia / Anchura)';

  @override
  String get videoCalc2ErrMissing => '❌ Datos que faltan: Distancia + Ratio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Anchura de la imagen = $width m';
  }

  @override
  String get videoCalc2Title => 'Anchura (Distancia / Relación)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Datos que faltan: Anchura.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return 'Altura = $height m (formato $format)';
  }

  @override
  String get videoCalc3Title => 'Altura (Anchura + Formato)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lúmenes/Ganancia/Ancho debe ser > 0.';

  @override
  String get videoCalc4ErrMissing =>
      '❌ Datos que faltan: Lúmenes + Ganancia + Anchura.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Datos que faltan: Anchura + Lumens + Ganancia.';

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
    return 'Superficie: $area m² (formato $format)\nLux (lm/m²): $lux\nLux eq (ganancia): $luxEq\nLuminancia: $nits nits | $fl ft-L\nUmbral mínimo ($presetLabel): $minFl ft-L → $status\nNota: conversión nits/pies-L basada en una suposición lambertiana (aprox).';
  }

  @override
  String get videoCalc4Title => 'Brillo (lux / nits / ft-L + umbral)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Datos que faltan: Anchura total + Solapamiento% + Número de focos.';

  @override
  String get videoCalc5ErrNMin2 => '❌ El número de focos debe ser ≥ 2.';

  @override
  String get videoCalc5NHint => 'ej: 2';

  @override
  String get videoCalc5NLabel => 'Número de focos (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Anchura total: $wTot m\nN: $n | Solapamiento: $overlapPct% (sobre anchura projo)\n\n- Anchura por proyector: $wPer m\n- Solapamiento entre 2 proyectores: $overlapM m\n- Altura total (formato $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Solapamiento (Anchura total + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Datos que faltan: Anchura total + Distancia + Solapamiento%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Datos que faltan: Ratio mín. y/o Ratio máx.';

  @override
  String get videoCalc6GainHint => 'ex: 1.0';

  @override
  String get videoCalc6GainLabel => 'Ganancia (calc 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'por ejemplo, 20.000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lúmenes por proyector';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Luminosidad: ❌ Lúmenes/projo y ganancia debe ser > 0.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosidad estimada (N=$n)\nSuperficie: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Luminosidad (opcional): introduce Lumens/projo + Ganancia para la estimación.';

  @override
  String get videoCalc6NoteIndicative =>
      'Nota: estimación indicativa (la mezcla/solapamiento real puede reducirse ligeramente).';

  @override
  String get videoCalc6RatioMaxHint => 'ej: 1,80';

  @override
  String get videoCalc6RatioMaxLabel => 'Proporción máxima';

  @override
  String get videoCalc6RatioMinHint => 'ej: 1,20';

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
    return 'Total width=$wTot m | Distancia=$distance m | Solapamiento=$overlapPct%%.\nFormato $format → Total height=$hTot m | Área=$area m²\nRelación mín/máx: $ratioMin → $ratioMax\n\nRatio caso más abierto (min) = $nMin projos | cobertura ≈ $covMin m\n$lumiMin\n\nRatio caso más abierto (max) = $nMax projos | cobertura ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'Nº de focos automáticos + luminosidad';

  @override
  String videoCalcLabel(Object n) {
    return 'Cálculo $n';
  }

  @override
  String get videoCalculateAll => 'Calcular todos';

  @override
  String get videoCalculationsTitle => 'Cálculos en vídeo';

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
    return 'Altura: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Solapamiento: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Ratio: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Anchura total: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Anchura: $value';
  }

  @override
  String get videoCopyAllTooltip => 'Copiar todos los resultados';

  @override
  String get videoCopySummaryTooltip => 'Copiar el resumen';

  @override
  String get videoDisclaimerShort =>
      'Cálculos orientativos. Consulte siempre la documentación del fabricante.';

  @override
  String get videoDistanceHint => 'ex: 12.0';

  @override
  String get videoDistanceLabel => 'Distancia de proyección (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Parámetros imposibles (denom ≤ 0).';

  @override
  String get videoErrOverlapRange =>
      '❌ El porcentaje de solapamiento debe estar comprendido entre 0 y 99,9.';

  @override
  String get videoErrRatioGt0 => '❌ La proporción debe ser > 0.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ La anchura y la distancia totales deben ser > 0.';

  @override
  String get videoErrTotalWidthGt0 => '❌ La anchura total debe ser > 0.';

  @override
  String get videoErrWidthGt0 => '❌ La anchura debe ser > 0.';

  @override
  String get videoExportPdfTooltip => 'Exportar PDF';

  @override
  String get videoFormatLabel => 'Formato (proporción)';

  @override
  String get videoGainHint => 'ex: 1.0';

  @override
  String get videoGainLabel => 'Gane';

  @override
  String get videoImageWidthHint => 'ex: 6.0';

  @override
  String get videoImageWidthLabel => 'Anchura de la imagen (m)';

  @override
  String get videoLedCalcTitle => 'Cálculo - Píxeles / baldosas';

  @override
  String get videoLedErrAllGt0 => '❌ Todos los valores deben ser > 0.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Datos que faltan: Baldosas X/Y + Baldosas px + Baldosas cm.';

  @override
  String videoLedPitchUniform(Object value) {
    return '$value mm';
  }

  @override
  String videoLedPitchXY(Object x, Object y) {
    return 'X $x mm - Y $y mm';
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
    return '✅ Resolución de la pared: $wallWpx × $wallHpx px\n✅ Tamaño de la pared: $wallWm × $wallHm m\nBaldosa: $tileWpx×$tileHpx px - $tileWcm×$tileHcm cm\nPaso calculado: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Píxeles LED de pared en función del tamaño, el paso y las dimensiones de las baldosas.';

  @override
  String get videoLedTileHcmHint => 'ex: 33,28';

  @override
  String get videoLedTileHcmLabel => 'Altura de la baldosa (cm)';

  @override
  String get videoLedTileHpxHint => 'ej: 128';

  @override
  String get videoLedTileHpxLabel => 'Altura de la baldosa (px)';

  @override
  String get videoLedTileWcmHint => 'ex: 33,28';

  @override
  String get videoLedTileWcmLabel => 'Anchura de la baldosa (cm)';

  @override
  String get videoLedTileWpxHint => 'ej: 128';

  @override
  String get videoLedTileWpxLabel => 'Anchura de la baldosa (px)';

  @override
  String get videoLedTilesXHint => 'ej: 15';

  @override
  String get videoLedTilesXLabel => 'Baldosas horizontales (X)';

  @override
  String get videoLedTilesYHint => 'ej: 8';

  @override
  String get videoLedTilesYLabel => 'Baldosas verticales (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Relación / anchura / altura (cálculos 1 a 3).';

  @override
  String get videoLensMeasureTitle => 'Lente y medición';

  @override
  String get videoLmCalc1Title => 'Relación (Distancia / Anchura)';

  @override
  String get videoLmCalc2Title => 'Anchura (Distancia / Relación)';

  @override
  String get videoLmCalc3Title => 'Altura (Anchura + Formato)';

  @override
  String get videoLmDistanceHint => 'ex: 12.0';

  @override
  String get videoLmDistanceLabel => 'Distancia de proyección (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Datos que faltan: Distancia + Ratio.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Datos que faltan: Distancia + Anchura.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Datos que faltan: Anchura.';

  @override
  String get videoLmErrRatioGt0 => '❌ La proporción debe ser > 0.';

  @override
  String get videoLmErrWidthGt0 => '❌ La anchura debe ser > 0.';

  @override
  String get videoLmFormatLabel => 'Formato (proporción)';

  @override
  String get videoLmImageWidthHint => 'ex: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Anchura de la imagen (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return 'Altura = $height m (formato $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Ratio de proyección = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Anchura de la imagen = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'ej: 1,60';

  @override
  String get videoLmThrowRatioLabel => 'Ratio de proyección';

  @override
  String get videoLumensHint => 'por ejemplo, 20.000';

  @override
  String get videoLumensLabel => 'Lúmenes (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Patrones de prueba indicativos (calibrado, enfoque, geometría, mezcla, pixel perfect).';

  @override
  String get videoMireHeaderTitle => 'Generador de patrones';

  @override
  String get videoMireScreenLedSubtitle =>
      'Patrón de prueba según WxH px (píxel perfecto, uniformidad, cuadrícula).';

  @override
  String get videoMireScreenLedTitle => 'Pantalla LED';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Cartografía simple (WxH px) + Multiproyecto (N + solapamiento).';

  @override
  String get videoMireScreenVideoTitle =>
      'Patrón de prueba de la pantalla de vídeo';

  @override
  String get videoMireTitle => 'Vista';

  @override
  String get videoMpCalc5Title => 'Anchura por foco';

  @override
  String get videoMpCalc6Title => 'Número de focos (relación mín./máx.)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Ratio de casos más abiertos (min) = $n projos | cobertura ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Caso de ratio más ajustado (max) = $n projos | cobertura ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'ex: 12.0';

  @override
  String get videoMpDistanceLabel => 'Distancia de proyección (m)';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Parámetros imposibles (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => '❌ Relación no válida (debe ser > 0).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Datos que faltan: Anchura total + Solapamiento% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Datos que faltan: Anchura total + Distancia + Solapamiento%.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Datos que faltan: Ratio min y/o Ratio max.';

  @override
  String get videoMpErrNGte2 => '❌ N debe ser ≥ 2.';

  @override
  String get videoMpErrOverlapRange =>
      '❌ El porcentaje de solapamiento debe estar comprendido entre 0 y 99,9.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ La anchura y la distancia totales deben ser > 0.';

  @override
  String get videoMpErrWidthGt0 => '❌ La anchura total debe ser > 0.';

  @override
  String get videoMpFormatLabel => 'Formato (proporción)';

  @override
  String get videoMpGainHint => 'ex: 1.0';

  @override
  String get videoMpGainLabel => 'Gane';

  @override
  String get videoMpLumensPerProjectorHint => 'por ejemplo, 20.000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lúmenes por proyector';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Luminosidad: ❌ Lúmenes/projo y ganancia debe ser > 0.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosidad estimada (N=$n)\nSuperficie: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Brillo (opcional): Introduzca Lumens/projo + Ganancia para estimar.';

  @override
  String get videoMpNoteIndicative => 'Nota: estimación indicativa.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Opcional: brillo';

  @override
  String get videoMpOverlapHint => 'ej: 10';

  @override
  String get videoMpOverlapLabel => 'Solapamiento (%)';

  @override
  String get videoMpProjectorCountHint => 'ej: 2';

  @override
  String get videoMpProjectorCountLabel => 'Número de focos (N)';

  @override
  String get videoMpRatioMaxHint => 'ej: 1,80';

  @override
  String get videoMpRatioMaxLabel => 'Proporción máxima';

  @override
  String get videoMpRatioMinHint => 'ej: 1,20';

  @override
  String get videoMpRatioMinLabel => 'Ratio min';

  @override
  String get videoMpTotalWidthHint => 'ex: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Anchura total de proyección (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Solapamiento + anchura/projo + número de proyectos (cálculos 5 y 6).';

  @override
  String get videoMultiprojectorTitle => 'Multiproyector';

  @override
  String get videoOptionalBrightnessTitle => 'Opcional: brillo';

  @override
  String get videoOverlapHint => 'ej: 10';

  @override
  String get videoOverlapLabel => 'Solapamiento (%)';

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
  String get videoPdfCalc5N => 'N (calc5)';

  @override
  String get videoPdfCalc6 => 'Cálculo 6';

  @override
  String get videoPdfCalc6Gain => 'Ganancia (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lúmenes/projo (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Relación máxima (calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Ratio min (calc6)';

  @override
  String get videoPdfDate => 'Fecha';

  @override
  String get videoPdfDistance => 'Distancia (m)';

  @override
  String get videoPdfFormat => 'Formato';

  @override
  String get videoPdfGain => 'Gane';

  @override
  String get videoPdfImageWidth => 'Anchura de la imagen (m)';

  @override
  String get videoPdfLumens => 'Lúmenes';

  @override
  String get videoPdfOverlap => 'Solapamiento (%)';

  @override
  String get videoPdfParams => 'Parámetros';

  @override
  String get videoPdfRatio => 'Ratio';

  @override
  String get videoPdfResults => 'Resultados';

  @override
  String get videoPdfScreenPreset => 'Preselección de pantalla';

  @override
  String get videoPdfTitle => 'My Technical App - Exportación de vídeos';

  @override
  String get videoPdfTotalWidth => 'Anchura total (m)';

  @override
  String get videoPresetFrontGrey => 'Frontal - pantalla gris (ganancia 0,8)';

  @override
  String get videoPresetFrontGreyShort => 'Frontal - pantalla gris';

  @override
  String get videoPresetFrontHighGain =>
      'Frontal - pantalla de alta ganancia (ganancia 1,3)';

  @override
  String get videoPresetFrontHighGainShort =>
      'Frontal - pantalla de alta ganancia';

  @override
  String get videoPresetFrontWhite =>
      'Frontal - pantalla blanca mate (ganancia 1,0)';

  @override
  String get videoPresetFrontWhiteShort => 'Frontal - pantalla blanca mate';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapeado - piedra oscura (ganancia 0,35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Cartografía - piedra oscura';

  @override
  String get videoPresetMappingGlass => 'Cartografía - vidrio (ganancia 0,15)';

  @override
  String get videoPresetMappingGlassShort => 'Cartografía - vidrio';

  @override
  String get videoPresetMappingLightStone =>
      'Mapeado - piedra clara (ganancia 0,6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Cartografía - piedra clara';

  @override
  String get videoPresetMappingMatte =>
      'Mapeado - pintura mate (ganancia 0,75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapeado - pintura mate';

  @override
  String get videoPresetMappingSatin =>
      'Mapeado - pintura satinada (ganancia 0,9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapeado - pintura satinada';

  @override
  String get videoPresetRearClear => 'Retro - lienzo claro (ganancia 0,9)';

  @override
  String get videoPresetRearClearShort => 'Retro - lona clara';

  @override
  String get videoPresetRearDiffusion =>
      'Retro - lona de difusión (ganancia 0,7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - lona de difusión';

  @override
  String get videoScreenPresetLabel => 'Pantalla / Soporte (preestablecido)';

  @override
  String get videoSummaryPillsTitle => 'Resumen (comprimidos)';

  @override
  String get videoTestPatternSubtitle =>
      'Creación de patrones de prueba de vídeo para pantallas y paredes LED (se hará más adelante).';

  @override
  String get videoTestPatternTitle => 'Vista';

  @override
  String get videoThrowRatioHint => 'ej: 1,60';

  @override
  String get videoThrowRatioLabel => 'Ratio de proyección';

  @override
  String get videoTitle => 'Vídeo';

  @override
  String get videoToolsTitle => 'Herramientas de vídeo';

  @override
  String get videoTotalWidthHint => 'ex: 18.0';

  @override
  String get videoTotalWidthLabel => 'Anchura total de proyección (m)';

  @override
  String get aboutArtnetTitle => 'Art-Net';

  @override
  String get aboutArtnetToc01 => '1) Art-Net: qué es y por qué';

  @override
  String get aboutArtnetToc02 =>
      '2) Direccionamiento y universo - cartografía propia';

  @override
  String get aboutArtnetToc03 =>
      '3) Límites y perfección: lo que se rompe primero';

  @override
  String get aboutArtnetToc04 => '4) Nodos, divisores y RDM';

  @override
  String get aboutArtnetToc05 =>
      '5) Resolución de problemas - síntomas → causas';

  @override
  String get aboutArtnetToc06 => '6) Diagramas (red / unicast vs broadcast)';

  @override
  String get aboutArtnetToc07 =>
      '6bis) Imágenes (activos) - RJ45/interruptor/cables';

  @override
  String get aboutArtnetToc08 => '7) Lista de comprobación rápida';

  @override
  String get aboutDmxToc01 =>
      '1) DMX, universos, direcciones: conceptos básicos';

  @override
  String get aboutDmxToc02 => '2) trama DMX - pausa, código de inicio, canales';

  @override
  String get aboutDmxToc03 => '3) Cableado RS-485 - topología y cable';

  @override
  String get aboutDmxToc04 =>
      '4) Terminación y divisores: evitar las reflexiones';

  @override
  String get aboutDmxToc05 => '4bis) RDM - límites y compatibilidades';

  @override
  String get aboutDmxToc06 =>
      '5) Resolución de problemas sobre el terreno: síntomas → causas.';

  @override
  String get aboutDmxToc07 => '6) Art-Net - hitos';

  @override
  String get aboutDmxToc08 =>
      '7) sACN / E1.31 - multidifusión, IGMP, prioridades';

  @override
  String get aboutDmxToc09 => '8) DMX vs Art-Net vs sACN - elegir';

  @override
  String get aboutDmxToc10 => '10) Lista de comprobación rápida';

  @override
  String get aboutDmxToc11 => '10) Lista de comprobación rápida';

  @override
  String get aboutElectriciteTitle => 'Electricidad';

  @override
  String get aboutElectriciteToc01 => '1) Bases (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono / Tri (¿cuál es la diferencia?)';

  @override
  String get aboutElectriciteToc04 => '4) Tabla rápida (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Seguridad y riesgos';

  @override
  String get aboutElectriciteToc06 => '6) Lista de control';

  @override
  String get aboutInformatiqueTitle => 'TI';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Almacenamiento (SATA / NVMe / SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Enlaces de vídeo (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe / GPU (pruebas)';

  @override
  String get aboutInformatiqueToc05 => '5) Lista de control (bandeja)';

  @override
  String get aboutIpBasicsToc01 => '1) ¿Qué es una IP y para qué sirve?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) ¿Por qué 192.x / 10.x / 172.x? (direcciones privadas)';

  @override
  String get aboutIpBasicsToc03 => '3) Máscara y subredes: entender de verdad';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, pasarela, DNS: ¿quién hace qué?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Cómo se comunican dos dispositivos (LAN frente a no LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Planos \"show\" IP sencillos (ejemplos listos para copiar)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Resolución de problemas: síntomas → causas (método de campo).';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Miniejercicios (comprobar rápidamente una máscara / una red)';

  @override
  String get aboutIpBasicsToc09 => '9) Lista de comprobación rápida';

  @override
  String get aboutNetworkTitle => 'Red (EN)';

  @override
  String get aboutNetworkToc01 => '1) Objetivo: red estable';

  @override
  String get aboutNetworkToc02 => '2) Plan PI (sencillo)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (separación)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (multidifusión sACN)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi frente a cable';

  @override
  String get aboutNetworkToc06 => '6) Cambio: lo que necesita';

  @override
  String get aboutNetworkToc07 => '7) Diagramas';

  @override
  String get aboutNetworkToc08 => '7bis) Imágenes (activos)';

  @override
  String get aboutNetworkToc09 => '8) Lista de control';

  @override
  String get aboutReseauTitle => 'Red';

  @override
  String get aboutReseauToc01 =>
      '1) Aspectos básicos de la red (LAN / IP / caudal)';

  @override
  String get aboutReseauToc02 => '2) RJ45 y categorías (Cat5e/6/6A/...)';

  @override
  String get aboutReseauToc03 => '3) PoE (alimentación de red)';

  @override
  String get aboutReseauToc04 => '4) Fibra (SM/MM) + conectores (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (módulos)';

  @override
  String get aboutReseauToc06 => '6) Conmutadores (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN en red (asesoramiento)';

  @override
  String get aboutReseauToc08 => '8) Lista de control';

  @override
  String get aboutSacnToc01 => '1) ¿Para qué sirve el sACN?';

  @override
  String get aboutSacnToc02 => '2) Universo (numeración)';

  @override
  String get aboutSacnToc03 => '3) Multidifusión / Unidifusión + IGMP';

  @override
  String get aboutSacnToc04 => '4) Prioridades (fuentes múltiples)';

  @override
  String get aboutSacnToc05 => '5) Límites / rendimiento';

  @override
  String get aboutSacnToc06 => '6) RDM y sACN (proxy / en función del equipo)';

  @override
  String get aboutSacnToc07 => '7) Diagramas';

  @override
  String get aboutSacnToc08 => '7bis) Imágenes (activos)';

  @override
  String get aboutSacnToc09 => '8) Lista de control';

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
  String get aboutVideoToc06 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI - campo';

  @override
  String get aboutVideoToc08 => '8) IDN - cuándo / por qué / límites';

  @override
  String get aboutVideoToc09 => '9) Mapping / LED / multiprojo';

  @override
  String get aboutVideoToc10 => '10) Lista de control de campo';

  @override
  String get aboutTileDmxTitle => 'DMX - funcionamiento (sencillo y completo)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net - DMX sobre IP (nodos, unidifusión/difusión)';

  @override
  String get aboutTileSacnTitle =>
      'sACN / E1.31 - multidifusión, IGMP, prioridades';

  @override
  String get aboutTileIpBasicsTitle =>
      'Red - bases IP / máscara / DHCP (esencial)';

  @override
  String get aboutTileReseauTitle =>
      'Red - RJ45 / Fibra / velocidades y longitudes';

  @override
  String get aboutTileNetworkTitle =>
      'Red ligera: VLAN, IGMP, Wi-Fi frente a cableado';

  @override
  String get aboutTileVideoTitle => 'Vídeo - SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle =>
      'Eléctrico - Schuko / P17 / potencias';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Conectores, mono/tri, paneles kW rápidos (16A→400A), trampas de campo.';

  @override
  String get aboutTileInformatiqueTitle =>
      'TI - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Velocidades útiles, versiones, límites reales, trampas del marketing.';

  @override
  String get aboutTitle => 'Quiénes somos';

  @override
  String get homeRiggingTitle => 'Aparejo';

  @override
  String get homeRiggingSubtitle =>
      'Bridas: ángulos y longitudes de las eslingas.';

  @override
  String get riggingTitle => 'Aparejo';

  @override
  String get riggingAngleLengthTitle => 'Ángulo y longitud de la eslinga';

  @override
  String get riggingSymmetryNote =>
      'Hipótesis: brida simétrica (2 cordones idénticos). Sin cálculo de carga.';

  @override
  String get riggingInputsTitle => 'Entradas';

  @override
  String get riggingSpanLabel => 'Distancia central (distancia entre puntos)';

  @override
  String get riggingSpanHint => 'Ej : 2.40';

  @override
  String get riggingDropLabel => 'Flecha (caída vertical)';

  @override
  String get riggingDropHint => 'Ex : 0.60';

  @override
  String get riggingUnitMeters => 'm';

  @override
  String get riggingResultsTitle => 'Resultados';

  @override
  String get riggingNeedPositiveValues => 'Introduzca valores > 0.';

  @override
  String get riggingLegLengthLabel => 'Longitud de una hebra';

  @override
  String get riggingAngleToHorizontalLabel => 'Ángulo respecto a la horizontal';

  @override
  String get riggingAngleToVerticalLabel => 'Ángulo respecto a la vertical';

  @override
  String get riggingDisclaimerShort =>
      'Resultados indicativos. A validar según su contexto y prácticas de aparejo.';

  @override
  String get riggingCalcLegDropTitle => 'Longitud + desviación → luz';

  @override
  String get riggingCalcLegDropHelp =>
      'Eslinga simétrica (2 ramales): calcula la luz a partir de la longitud de la eslinga y la flexión.';

  @override
  String get riggingLegLengthInputLabel => 'Longitud de una hebra';

  @override
  String get riggingLegLengthInputHint => 'Ej: 2.50';

  @override
  String get riggingInvalidTriangle =>
      'Imposible: la longitud debe ser mayor que la flecha.';

  @override
  String get riggingCalcLegAngleTitle => 'Longitud + ángulo → luz + desviación';

  @override
  String get riggingCalcLegAngleHelp =>
      'Eslinga simétrica (2 ramales): calcula el alcance y la desviación a partir de la longitud y el ángulo respecto a la horizontal.';

  @override
  String get riggingAngleHorizontalInputLabel =>
      'Ángulo respecto a la horizontal';

  @override
  String get riggingAngleHorizontalInputHint => 'Ej: 30';

  @override
  String get riggingInvalidAngle =>
      'Ángulo no válido: entre 0° y 90° (excluido).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title =>
      'Distancia de centro a centro + desviación → longitud y ángulos.';

  @override
  String get riggingCalc1Subtitle =>
      'Brida simétrica (2 cabos idénticos). Peso indicado (info). Sin cálculo de carga.';

  @override
  String get riggingCalc2Title =>
      'Distancia entre ejes + ángulo(H) → desviación y longitud.';

  @override
  String get riggingCalc2Subtitle =>
      'Ángulo en relación con la horizontal. Brida simétrica. Sin cálculo de carga.';

  @override
  String get riggingCalc3Title =>
      'Distancia de centro a centro + longitud → desviación y ángulos.';

  @override
  String get riggingCalc3Subtitle =>
      'Longitud de una hebra conocida. Brida simétrica. Sin cálculo de carga.';

  @override
  String get riggingLegLengthHint => 'Ej: 4.70';

  @override
  String get riggingAngleHint => 'Ex : 45';

  @override
  String get riggingInvalidGeometry =>
      'Geometría imposible (longitud demasiado corta para la distancia entre ejes).';

  @override
  String get riggingSchemaTitle => 'Diagrama';

  @override
  String get riggingSchemaCaption1 =>
      'Entradas: envergadura + deflexión. Salidas: longitud de la eslinga + ángulos.';

  @override
  String get riggingSchemaCaption2 =>
      'Entradas: envergadura + longitud de la eslinga. Salidas: deflexión + ángulos.';

  @override
  String get riggingSchemaCaption3 =>
      'Entradas: vano + ángulo (horizontal). Salidas: flecha + longitud.';

  @override
  String get riggingAngleHInputLabel => 'Ángulo (respecto a la horizontal)';

  @override
  String get riggingAngleHInputHint => 'Ej: 45';

  @override
  String get riggingDropResultLabel => 'Flecha (caída)';

  @override
  String get riggingSchemaLabelSpan => 'De centro a centro';

  @override
  String get riggingSchemaLabelDrop => 'Flecha';

  @override
  String get riggingSchemaLabelLeg => 'Brin';

  @override
  String get riggingWeightLabel => 'Peso (info)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Geometría imposible: la longitud de una hebra debe ser > (distancia de centro a centro / 2).';

  @override
  String get riggingDisclaimerNoLoad =>
      'Peso indicado a título indicativo. Sin cálculo de carga/tensión. Válido en su contexto de aparejo.';

  @override
  String get riggingCalcCommonSubtitle =>
      'Cabezada de 2 cabos. Peso indicado (info). Sin cálculo de carga.';

  @override
  String get riggingOffCenterToggle => 'Carga descentrada';

  @override
  String get riggingOffsetLabel => 'Desplazamiento A → carga';

  @override
  String get riggingInvalidOffset =>
      'Desplazamiento no válido: debe ser > 0 y < distancia entre ejes.';

  @override
  String get riggingLegLeftLabel => 'Longitud de la hebra izquierda';

  @override
  String get riggingLegRightLabel => 'Longitud del hilo recto';

  @override
  String get riggingAngleHLeftLabel => 'Ángulo H (izquierda)';

  @override
  String get riggingAngleHRightLabel => 'Ángulo H (recto)';

  @override
  String get riggingAngleVLeftLabel => 'Ángulo V (izquierda)';

  @override
  String get riggingAngleVRightLabel => 'Ángulo V (recto)';

  @override
  String get riggingIncludedAngleLabel => 'Ángulo entre hilos';

  @override
  String get riggingAngleHLeftInputLabel => 'Ángulo H (ramal izquierdo)';

  @override
  String get riggingLegLeftInputLabel => 'Longitud (hebra izquierda)';

  @override
  String get riggingNeedValidValues => 'Introduzca valores positivos válidos.';

  @override
  String get photometrySection4Title => 'Lux → Lumen';

  @override
  String get photometryAreaLabel => 'Superficie (m²)';

  @override
  String get photometryAreaHint4 => 'Ej: 12.5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx - S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversiones';

  @override
  String get aboutArtnetConversionIntro =>
      'Útiles herramientas de conversión para valores DMX, Art-Net y hexadecimales.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universo → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Buscar subred + universo (red/dirección de puerto) de un universo DMX.';

  @override
  String get aboutUniverseToHexTitle => 'Universo → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Convierte un universo (1...N) en un índice y un valor hexadecimal.';

  @override
  String get aboutArtnetConversionNote =>
      'Nota: Las convenciones Art-Net pueden variar de una consola a otra (direccionamiento, base 0/1). Consulte siempre la documentación de su sistema.';

  @override
  String get elecTocCopyText => 'Copiar el índice';

  @override
  String get elecToc1 => '1) Bases (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono / Tri (¿cuál es la diferencia?)';

  @override
  String get elecToc4 => '4) Tabla rápida (16A → 400A)';

  @override
  String get elecToc5 => 'Conversión kVA → kW / A';

  @override
  String get elecToc6 => '6) Seguridad y riesgos';

  @override
  String get elecToc7 => '6) Lista de control';

  @override
  String get elecKvaTitle => 'Tabla kVA → kW (según cos φ)';

  @override
  String get elecKvaFormula => 'Fórmula: kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Esta tabla ofrece una estimación rápida de la potencia activa (kW) a partir de la potencia aparente (kVA).';

  @override
  String get elecKvaNote =>
      'Valores indicativos. Utiliza los valores reales de cos φ cuando los conozcas.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1,0)';

  @override
  String get commonTocTitle => 'Contenido';

  @override
  String get commonCopySummaryTooltip => 'Copiar el índice';

  @override
  String get aboutLightReferenceTitle => 'Referencias de iluminación';

  @override
  String get refCriTitle => 'IRC / CRI';

  @override
  String get refKelvinTitle => 'Temperatura de color (K)';

  @override
  String get refBeamFieldTitle => 'Haz / Campo';

  @override
  String get refLuxTitle => 'Niveles de iluminación (lux)';

  @override
  String get refCriContent =>
      'El CRI mide la fidelidad del color. Cuanto más alto sea, más naturales parecerán los colores.';

  @override
  String get refKelvinContent =>
      'La temperatura de color describe el tono de blanco (de cálido a frío).';

  @override
  String get refBeamFieldContent =>
      'El Haz es el ángulo del haz principal; el Campo es el ángulo en el que la intensidad se debilita (borde).';

  @override
  String get refBeamLegendBeam => 'Viga';

  @override
  String get refBeamLegendField => 'Campo';

  @override
  String get refLuxIntro =>
      'Referencias indicativas de iluminancia según el uso.';

  @override
  String get refLuxColUse => 'Utilización';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Corredor / circulación';

  @override
  String get refLuxUseBackstage => 'Entre bastidores / técnica';

  @override
  String get refLuxUseMeeting => 'Sala de reuniones';

  @override
  String get refLuxUseExpo => 'Exposición / sala de exposiciones';

  @override
  String get refLuxUseStageGeneral => 'Escenario - general';

  @override
  String get refLuxUseStageTv => 'Escenario - TV / grabación';

  @override
  String get refLuxNote =>
      'Estos valores varían en función de las normas y limitaciones (cámara, contraste, ambiente).';

  @override
  String get refLightDisclaimerShort =>
      'Referencias indicativas - no una norma.';

  @override
  String get refCri90 => 'Excelente (≥ 90)';

  @override
  String get refCri80 => 'Bueno (≈ 80)';

  @override
  String get refCriLow => 'Bajo (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Importante';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Algunas consolas utilizan una base 0 (Universo 0..15) y otras una base 1 (Universo 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Tabla Universo → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Correspondencia típica entre el universo DMX y el direccionamiento Art-Net.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Compruebe siempre la convención de su consola / nodo.';

  @override
  String get aboutUniverseToArtnetColDmx => 'Universo DMX';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Uni (hex)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Subred $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Principio';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'Un universo (1...N) puede convertirse en un índice (base 0) y luego en hexadecimal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Tabla Univers → Hex';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Tabla de conversión del universo DMX → índice / hex.';

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
      'Art-Net - DMX sobre IP (sencillo y completo)';

  @override
  String get aboutArtnetTocTitle => 'Contenido';

  @override
  String get aboutArtnetTocCopyTooltip => 'Marcadores de copia';

  @override
  String get aboutArtnetCopyLine1 =>
      'Art-Net = DMX a través de Ethernet vía UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Escala: muchos universos mediante nodos distribuidos (DMX-out).';

  @override
  String get aboutArtnetCopyLine3 =>
      'Distribución: broadcast (simple pero flood) o unicast (más limpia).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Límites reales: Wi-Fi, interruptor básico, nodos de firmware, ajustes de universo/mapa.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: posible mediante proxy RDM en función de los nodos (soporte variable).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net: qué es y por qué';

  @override
  String get aboutArtnetSection2Title =>
      '2) Direccionamiento y universo - cartografía propia';

  @override
  String get aboutArtnetSection3Title =>
      '3) Límites y perfección: lo que se rompe primero';

  @override
  String get aboutArtnetSection4Title => '4) Nodos, divisores y RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Resolución de problemas - síntomas → causas';

  @override
  String get aboutArtnetSection6Title =>
      '6) Diagramas (red / unicast vs broadcast)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Imágenes (activos) - RJ45/interruptor/cables';

  @override
  String get aboutArtnetSection7Title => '7) Lista de comprobación rápida';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Conversión / tablas (Universo 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Universo DMX sobre IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'Nodos de salida DMX';

  @override
  String get aboutArtnetSection1Paragraph =>
      'Art-Net transporta universos DMX a través de una red Ethernet (IP). En lugar de trazar una línea DMX por universo, se envían \"paquetes\" por la red y un nodo los convierte en DMX cerca de las máquinas.';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Por qué es útil';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Escalable: muchos universos en un solo cable de red.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distribución: nodos cerca de proyectores/dimmers → menos líneas DMX largas.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Parche flexible: cambia un universo o mueve un nodo rápidamente.';

  @override
  String get aboutArtnetSection1Subtitle => 'Dos palabras para recordar';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net no sustituye a DMX: lo transporta por IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'La estabilidad suele depender más de la red (switch, Wi-Fi, broadcast) que del protocolo.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universo';

  @override
  String get aboutArtnetSection2PillNodePort => 'Nodo / Puerto';

  @override
  String get aboutArtnetSection2PillMapping => 'Cartografía';

  @override
  String get aboutDmxPageTitle => 'DMX - funcionamiento (sencillo y completo)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 canales (ranuras) por universo, valores 0-255 (8 bits).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Temporización: 250 kbaudios, universo completo ≈ ~44 Hz (orden de magnitud).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topología: cadena tipo margarita (sin Y pasiva). Terminación de 120Ω en el último.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = DMX bidireccional (configuración/monitorización) → compatibilidad de splitter/nodo que debe comprobarse.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = universos DMX transportados en Ethernet/IP a través de nodos.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multidifusión + prioridades (se recomienda IGMP snooping).';

  @override
  String get aboutDmxToc1 =>
      '1) DMX, universos, direcciones: conceptos básicos';

  @override
  String get aboutDmxToc2 => '2) trama DMX - pausa, código de inicio, canales';

  @override
  String get aboutDmxToc3 => '3) Cableado RS-485 - topología y cable';

  @override
  String get aboutDmxToc4 =>
      '4) Terminación y divisores: evitar las reflexiones';

  @override
  String get aboutDmxToc4bis => '4bis) RDM - límites y compatibilidades';

  @override
  String get aboutDmxToc5 =>
      '5) Resolución de problemas sobre el terreno: síntomas → causas.';

  @override
  String get aboutDmxToc6 => '6) Art-Net - hitos';

  @override
  String get aboutDmxToc7 =>
      '7) sACN / E1.31 - multidifusión, IGMP, prioridades';

  @override
  String get aboutDmxToc8 => '8) DMX vs Art-Net vs sACN - elegir';

  @override
  String get aboutDmxToc9 => '9) Diagramas de campo (DMX / IP / pinout)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX - Lista de control de campo';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN - Lista de control sobre el terreno';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Modo de dispositivo correcto (número de canales)';

  @override
  String get aboutDmxChecklistCopyB2 =>
      'Dirección DMX correcta (sin solapamiento)';

  @override
  String get aboutDmxChecklistCopyB3 => 'En cadena (sin Y pasiva)';

  @override
  String get aboutDmxChecklistCopyB4 =>
      'Terminación de 120Ω en el último dispositivo';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'Cable DMX/RS-485 (par trenzado de 120Ω) si es posible.';

  @override
  String get aboutDmxChecklistCopyB6 => 'Splitter opto si varias ramas';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Si es posible, mantenga la señal DMX alejada de fuentes de interferencia (fuentes de alimentación, atenuadores).';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Si es RDM: compruebe la compatibilidad del divisor/nodo y un cableado impecable.';

  @override
  String get aboutDmxChecklistCopyB9 => 'Red dedicada si es posible (o VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Switch correcto; IGMP snooping recomendado (sACN multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (a menudo) o multidifusión controlada (evitar inundaciones)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Mapeo universo ↔ puertos/nodo comprobado';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Plan de IP claro (direcciones, máscara, DHCP frente a estática)';

  @override
  String get aboutDmxS1Title =>
      '1) DMX, universos, direcciones: conceptos básicos';

  @override
  String get aboutDmxS1Pill1 => '1 universo = 512 ranuras';

  @override
  String get aboutDmxS1Pill2 => '0-255 (8 bits)';

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
  String get aboutDmxS4bisTitle => '4bis) RDM - límites y compatibilidades';

  @override
  String get aboutDmxS4bisPlaceholder =>
      '... (mantenga el contenido existente)';

  @override
  String get aboutDmxS9Title => '9) Diagramas de campo (DMX / IP / pinout)';

  @override
  String get aboutDmxS9Diagram1 => 'Temporización DMX (pausa / MAB / ranuras)';

  @override
  String get aboutDmxS9Diagram2 => 'Topología DMX: en cadena';

  @override
  String get aboutDmxS9Diagram3 => 'Terminación de 120Ω';

  @override
  String get aboutDmxS9Diagram4 =>
      'multidifusión sACN: recordatorio IGMP (red)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → nodos → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Conector XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Lista de comprobación rápida';

  @override
  String get aboutDmxS10CopyTooltip => 'Copie la lista de control';

  @override
  String get aboutDmxS10CalloutTitle => 'Antes de que cunda el pánico';

  @override
  String get aboutDmxS10B1 =>
      'Modo de dispositivo + dirección DMX (comprobar siempre).';

  @override
  String get aboutDmxS10B2 =>
      'Cadena corta con un cable \"conocido OK\" para el aislamiento.';

  @override
  String get aboutDmxS10B3 => 'En cadena (sin Y pasiva).';

  @override
  String get aboutDmxS10B4 =>
      'Terminación de 120Ω sólo en el último dispositivo.';

  @override
  String get aboutDmxS10B5 => 'Splitter opto si varias ramas.';

  @override
  String get aboutDmxS10B6 =>
      'Si es RDM: splitter/nodo compat + cableado impecable.';

  @override
  String get aboutDmxS10B7 =>
      'En IP (Art-Net/sACN): switch correcto, IGMP para sACN multicast, unicast en caso de duda.';

  @override
  String get aboutDmxFooterNote =>
      'Información indicativa (campo). El comportamiento exacto puede variar entre consolas, nodos, conmutadores y firmware.\nEl objetivo aquí es entender y solucionar problemas rápidamente, utilizando un método fiable.';

  @override
  String get aboutDmxPainterBreak => 'DESCANSO';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Inicio\ncódigo';

  @override
  String get aboutDmxPainterSlots => 'Ranuras 1...N\n(hasta 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Bucle (refresco) - universo completo ≈ ~44 Hz (orden de magnitud)';

  @override
  String get aboutDmxPainterSourceA => 'FUENTE A\n(prio 100)';

  @override
  String get aboutDmxPainterSourceB => 'FUENTE B\n(prio 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'SWITCH\nIGMP snooping';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniverso U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Sin IGMP: flood\nCon IGMP: sólo puertos suscritos';

  @override
  String get aboutDmxPainterConsole => 'CONSOLA';

  @override
  String get aboutDmxPainterFix1 => 'ARREGLAR 1';

  @override
  String get aboutDmxPainterFix2 => 'ARREGLAR 2';

  @override
  String get aboutDmxPainterFix3 => 'ARREGLAR 3';

  @override
  String get aboutElectricitePageTitle =>
      'Eléctrico - puntos de referencia sobre el terreno';

  @override
  String get elecSection1Title => '1) Bases (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 fórmulas útiles';

  @override
  String get elecSection1Formula1 => 'P (W) = U (V) × I (A)';

  @override
  String get elecSection1Formula2 => 'I (A) = P (W) / U (V)';

  @override
  String get elecSection1Formula3 => 'P (kW) = P (W) / 1000';

  @override
  String get elecSection1FieldMarksTitle => 'Hitos';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V: 16A ≈ 3,7 kW | 32A ≈ 7,4 kW | 63A ≈ 14,5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Tres 400V: 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW';

  @override
  String get elecSection2Title => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (tomas domésticas)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Normalmente 16 A máx. (≈ 3,7 kW a 230 V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Ten cuidado con las regletas y los alargadores: pueden calentarse.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (azul/rojo)';

  @override
  String get elecSection2P17Bullet1 =>
      'Azul: 230 V mono (camping, pequeña distro).';

  @override
  String get elecSection2P17Bullet2 =>
      'Rojo: 400V trifásico (distro, alta potencia).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (audio/iluminación)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = más \"campo\" (bloqueo, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Compruebe la sección y la protección del cable.';

  @override
  String get elecSection3Title => '3) Mono / Tri (¿cuál es la diferencia?)';

  @override
  String get elecSection3Paragraph =>
      'Mono = una fase + neutro (230 V). Tri = 3 fases (400 V entre fases).';

  @override
  String get elecSection3PitfallsTitle => 'Errores frecuentes';

  @override
  String get elecSection3Pitfall1 =>
      'Desequilibrio de fases (una fase sobrecargada).';

  @override
  String get elecSection3Pitfall2 =>
      'El neutro se calienta si hay armónicos altos (LEDs, dimmers).';

  @override
  String get elecSection3Pitfall3 => 'Suelo ausente/dudoso en algunos sitios.';

  @override
  String get elecSection3MethodTitle => 'Método sencillo';

  @override
  String get elecSection3MethodBullet1 =>
      'Reparte las cargas pesadas entre L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Controlar el neutro si hay muchos LEDs.';

  @override
  String get elecSection3MethodBullet3 => 'Medición con pinza si es posible.';

  @override
  String get elecSection4Title => '4) Tabla rápida (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Mono 230V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3,7 kW\n32A ≈ 7,4 kW\n63A ≈ 14,5 kW\n125A ≈ 28,8 kW\n200A ≈ 46 kW\n';

  @override
  String get elecSection4TriTitle => 'Tres 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW\n';

  @override
  String get elecSection4ImportantTitle => 'Importante';

  @override
  String get elecSection4ImportantBullet1 =>
      'Se trata de órdenes de magnitud (cosφ, armónicos, pérdidas).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Valide siempre protecciones + secciones + temperatura.';

  @override
  String get elecSection5Title => '6) Seguridad y riesgos';

  @override
  String get elecSection5DontDoTitle => 'Lo que no hay que hacer';

  @override
  String get elecSection5DontDoBullet1 =>
      'Regletas de enchufes/alargadores en cadena.';

  @override
  String get elecSection5DontDoBullet2 => 'Mezclar fases sin saber.';

  @override
  String get elecSection5DontDoBullet3 => '\"Bridger\" una tierra dudosa.';

  @override
  String get elecSection5WarningTitle => 'Señales de advertencia';

  @override
  String get elecSection5WarningBullet1 =>
      'Olor caliente, agarres cálidos, gatillos repetidos.';

  @override
  String get elecSection5WarningBullet2 =>
      'Caída de la tensión arterial (bajada de tensión).';

  @override
  String get elecSection5WarningBullet3 =>
      'Disyuntor \"cansado\" o inadecuado.';

  @override
  String get elecSection6Title => '6) Lista de control';

  @override
  String get elecSection6QuickTitle => 'Rápido';

  @override
  String get elecSection6Bullet1 =>
      'Tipo de alimentación disponible (mono/tri) + potencia (A).';

  @override
  String get elecSection6Bullet2 =>
      'Distribución de fases (cargas principales).';

  @override
  String get elecSection6Bullet3 =>
      'Protecciones (diff/disj) y estado de la centralita.';

  @override
  String get elecSection6Bullet4 =>
      'Cables: sección / longitud / aumento de temperatura.';

  @override
  String get elecSection6Bullet5 => 'Tierra: ¿Bien? (probador si es posible).';

  @override
  String get elecFooterNote =>
      'Nota: este contenido es una lista de comprobación sobre el terreno. En un emplazamiento real, respete siempre las normas, reglamentos locales y medidas de protección vigentes.';

  @override
  String get infoPageTitle => 'TI: puntos de referencia sobre el terreno';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Almacenamiento (SATA / NVMe / SSD)';

  @override
  String get infoVideoLinksTitle => '3) Enlaces de vídeo (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe / GPU (pruebas)';

  @override
  String get infoChecklistTitle => '5) Lista de control (bandeja)';

  @override
  String get infoSummaryCopy =>
      'INFO - puntos de referencia sobre el terreno\n- USB-C = forma, no velocidad: consulta el estándar.\n- NVMe (M.2) mucho más rápido que SATA.\n- DisplayPort/HDMI = estándares, pero cuidado con las versiones/cables.\n- En servidores de vídeo: almacenamiento + GPU + rendimiento son la base.';

  @override
  String get infoChecklistCopy =>
      'INFO - Lista de comprobación\n☐ Cables USB-C certificados (datos/vídeo si es necesario).\n☐ Almacenamiento adecuado (NVMe si se trata de grandes flujos)\n☐ Controladores de GPU estables (versión conocida).\n☐ Prueba de resolución real/FPS\n☐ Evitar adaptadores baratos';

  @override
  String get infoUsbCriticalTitle => 'Punto crítico';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = conector (forma). No dice la velocidad.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Un cable USB-C puede ser \"solo de carga\" y no pasar datos/vídeo.';

  @override
  String get infoUsbSpeedTitle => 'Velocidad de referencia (orden de magnitud)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: lento (teclados, dongles, periféricos pequeños).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x: mucho más rápido (discos, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt: muy alta velocidad (dock, eGPU, vídeo dependiendo del hardware).';

  @override
  String get infoUsbParagraph =>
      'En espectáculo: si un aparato se \"desconecta\", sospeche del cable (calidad/estándar) antes que del aparato.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA frente a NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SSD SATA: buena y estable, pero limitada (interfaz antigua).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'SSD NVMe (M.2): mucho más rápida (ideal para servidores multimedia, archivos de gran tamaño).';

  @override
  String get infoStorageFieldTitle => 'Vídeo del terreno';

  @override
  String get infoStorageFieldBullet1 =>
      'Reproducción de archivos 4K/ProRes de gran tamaño → Se recomienda NVMe.';

  @override
  String get infoStorageFieldBullet2 =>
      'Cuidado con la temperatura: un NVMe puede ralentizarse si se calienta demasiado.';

  @override
  String get infoStorageFieldBullet3 =>
      'Pruebe siempre en condiciones reales antes del espectáculo.';

  @override
  String get infoVideoLinksImportantTitle => 'Un hito importante';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Las versiones que cuentan: cable + puerto + dispositivo deben ser compatibles.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Larga distancia = a menudo se necesitan convertidores activos/fibra.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs HDMI (muy simplificado)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: omnipresente (TV, procesadores), pero EDID/HDCP puede ser un problema.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: muy común en los PC, a menudo muy \"capaz\" en términos de velocidad de datos.';

  @override
  String get infoPcieGpuParagraph =>
      'Para servidores de vídeo/mapping: GPU + bus + controladores = estabilidad. Problemas típicos: controladores, cables, conversión y limitaciones de salida.';

  @override
  String get infoPcieGpuFieldTitle => 'Terreno';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Bloquear una versión estable del controlador antes de un gran espectáculo.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Evita los adaptadores baratos.';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Prueba a la resolución/FPS real del programa.';

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
  String get infoChecklistBullet5 => 'Evita los adaptadores baratos.';

  @override
  String get infoFooterNote =>
      'Información orientativa (terreno). Las capacidades exactas varían según los equipos/versiones.\nObjetivo: puntos de referencia sencillos + método fiable.';

  @override
  String get ipBasicsPageTitle => 'Red - bases IP / máscara / DHCP (esencial)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Copiar nota';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Copie la lista de control';

  @override
  String get ipBasicsMemo1 =>
      'IP = dirección lógica para unirse a un dispositivo en una red.';

  @override
  String get ipBasicsMemo2 =>
      'Privada (LAN): 10.x.x.x, 172.16-31.x.x, 192.168.x.x (no enrutada a Internet).';

  @override
  String get ipBasicsMemo3 =>
      'Máscara / subred = indica qué parte es \"red\" frente a \"máquina\".';

  @override
  String get ipBasicsMemo4 =>
      'Misma subred = comunicación directa. En caso contrario → pasarela (router).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP asigna IP automáticamente; estática = útil para nodos/consola.';

  @override
  String get ipBasicsToc1 => '1) ¿Qué es una IP y para qué sirve?';

  @override
  String get ipBasicsToc2 =>
      '2) ¿Por qué 192.x / 10.x / 172.x? (direcciones privadas)';

  @override
  String get ipBasicsToc3 => '3) Máscara y subredes: entender de verdad';

  @override
  String get ipBasicsToc4 => '4) DHCP, pasarela, DNS: ¿quién hace qué?';

  @override
  String get ipBasicsToc5 =>
      '5) Cómo se comunican dos dispositivos (LAN frente a no LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Planos \"show\" IP sencillos (ejemplos listos para copiar)';

  @override
  String get ipBasicsToc7 =>
      '7) Resolución de problemas: síntomas → causas (método de campo).';

  @override
  String get ipBasicsToc8 =>
      '8) Miniejercicios (comprobar rápidamente una máscara / una red)';

  @override
  String get ipBasicsToc9 => '9) Lista de comprobación rápida';

  @override
  String get ipBasicsSection1Paragraph =>
      'Una dirección IP (IPv4) es un identificador lógico en una red. Se utiliza para decir \"envía este paquete a este dispositivo\".\n\nCuando se conecta una consola, un nodo Art-Net/sACN, un PC, un conmutador gestionado, etc., todo lo que habla en la red debe tener una IP coherente para que los dispositivos puedan encontrarse entre sí.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Imagen mental';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = identificador de hardware (tarjeta de red).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = dirección \"postal\" en una red (modificable).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Máscara = \"distrito / código postal\" (define la subred).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Pasarela = \"salida del barrio\" (router).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 en 10 segundos';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Formato: A.B.C.D (4 números de 0 a 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Ej: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'No es magia: son 32 bits (4 bytes).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'Lo que cuenta para usted: IP + máscara debe ser coherente entre los dispositivos.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Algunos rangos de direcciones IPv4 están reservados para redes privadas (LAN). No se enrutan en Internet. Por eso se utilizan en espectáculos: puedes montar tu propia red local sin \"consumir\" IP públicas.';

  @override
  String get ipBasicsSection2CalloutTitle =>
      'Las 3 grandes playas privadas (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (a menudo escrito \"10.x.x.x\")';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (a menudo \"172.16-31.x.x\")';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (a menudo \"192.168.x.x\")';

  @override
  String get ipBasicsSection2Subtitle1 =>
      '¿Por qué vemos a menudo 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Las cajas/routers de consumo suelen utilizar 192.168.0.x o 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'Esto se ha convertido en un estándar de facto en las pequeñas LAN.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Pero en modo show, 10.x.x.x es práctico si quieres muchas direcciones o varias VLANs.';

  @override
  String get ipBasicsSection2Subtitle2 => '¿Y el famoso 2.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Muchos equipos Art-Net salen de fábrica con una IP de 2.x.x.x (red cerrada).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'Es \"práctico\" en plug&play (sin DHCP), pero sorprendente si tu PC está en 192.168.x.x.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Importante: no hay nada mágico en \"2.x\" para broadcast/unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'Lo que cambia el alcance de la difusión es la máscara (a menudo /8 = 255.0.0.0 en legado).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Ejemplo: red 2.0.0.0/8 → broadcast = 2.255.255.255 (muy grande).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Solución sencilla: poner PC/consola en el mismo rango + misma máscara, o reconfigurar el nodo en un plano 192/10.';

  @override
  String get ipBasicsSection3Paragraph =>
      'La máscara de subred indica qué direcciones están \"en la misma red\". Sin máscara, una IP no significa gran cosa.\n\nRegla básica: si dos dispositivos están en la misma subred, se comunican directamente. Si no, necesitan una pasarela (router).';

  @override
  String get ipBasicsSection3Callout1Title => 'Las máscaras más comunes';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8) → 10.x.x.x típica red \"grande\".';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → 10.10.x.x o 192.168.x.x Red \"grande\".';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → red \"clásica\" 192.168.0.x (254 dispositivos)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Máscara → dirección de difusión (muy útil de entender).';

  @override
  String get ipBasicsSection3Bullet4 =>
      'La difusión depende de la subred, es decir, de la máscara (no \"2 frente a 192\").';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → broadcast = 192.168.10.255 (red pequeña).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → broadcast = 2.255.255.255 (red enorme).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Cuanto más \"grande\" sea la red, más ruido puede hacer una emisión (si la usas a menudo).';

  @override
  String get ipBasicsSection3Subtitle1 => 'Ejemplo concreto (el más útil): /24';

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
  String get ipBasicsSection3Subtitle2 => '¿Por qué crear subredes?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organización: \"luces\", \"vídeo\", \"interfono\", \"internet\", etc., por separado.';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Rendimiento: limitar el ruido (difusión/multidifusión) a un solo grupo.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Seguridad: impedir que un PC \"invitado\" vea/interrumpa la red de espectáculos.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnóstico: es más fácil saber \"dónde\" está un dispositivo.';

  @override
  String get ipBasicsSection3Callout3Title => 'Trampa clásica';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Mismo \"inicio\" IP ≠ misma red si la máscara no es idéntica.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Ej: 10.0.0.5/8 y 10.0.0.200/24 → no son el mismo perímetro lógico.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (asignación automática)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Un servidor DHCP \"da\": IP + máscara + pasarela + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 => 'Práctico: enchúfalo y funciona.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Riesgo mostrar: si DHCP gotas/cambios/conflictos → síntomas extraños.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Estática (IP fija)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'Se define IP + máscara (y posiblemente puerta de enlace/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Muy útil para: consola, nodos, switch gestionado, AP Wi-Fi show.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Riesgo: duplicación de PI si el plan no está claro (conflicto).';

  @override
  String get ipBasicsSection4Callout1Title => 'Pasarela';

  @override
  String get ipBasicsSection4Bullet1 =>
      'Es la dirección del router: sirve para salir \"fuera de la red local\".';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Si se configura una red de espectáculos aislada (sin Internet) → pasarela a menudo inútil.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Pero si desea salir a otra VLAN / Internet → esencial.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = \"directorio\": transforma un nombre (por ejemplo, ejemplo.com) en una IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'En espectáculo (Art-Net/sACN), a menudo inútil: se trabaja en IP directo.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Si utilizas servicios (actualizaciones, licencias, servidor de tiempo, streaming) → DNS vuelve a ser útil.';

  @override
  String get ipBasicsSection4Subtitle3 =>
      'Regla sencilla (apta para principiantes)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Pequeño espectáculo cerrado: estática en todas partes, sin puerta de enlace, sin DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Mostrar con Internet / múltiples redes: DHCP controlado + reservas DHCP, o plan estático + router.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Cuando A quiere hablar con B, mira la máscara :\n- Si B está en la misma subred → A envía directamente a la red local.\n- Si B está fuera de la subred → A envía a la pasarela (router), que se encarga del resto.';

  @override
  String get ipBasicsSection5Callout1Title => 'Ejemplo (fácil)';

  @override
  String get ipBasicsSection5Bullet1 => 'A = 192.168.0.10 /24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → misma red → OK directo.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → red diferente → se necesita router/gateway.';

  @override
  String get ipBasicsSection5Subtitle => '¿Por qué no hace ping?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Máscara diferente → A piensa que B está \"en otro lugar\" (o viceversa).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Sin puerta de enlace → imposible salir de la subred.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'Firewall del PC → ping bloqueado (Windows muy común).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Cable / conmutador / VLAN: físicamente no se encuentran en el mismo segmento.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Difusión frente a unidifusión (bonificación útil)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast: a una IP específica (limpia).';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Difusión: \"a todo el mundo\" en la subred (ruidoso).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'En resumen: la difusión puede funcionar en redes pequeñas, pero se convierte rápidamente en una fuente de ruido en redes grandes.';

  @override
  String get ipBasicsSection6Subtitle1 => 'Plan A - ultra simple (una red /24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Red: 192.168.10.0/24 (máscara 255.255.255.0)\n\nConsola: 192.168.10.10\nPC (control): 192.168.10.20\nNodo 1: 192.168.10.101\nNodo 2: 192.168.10.102\nConmutador gestionado: 192.168.10.2\nPuerta de enlace: (vacía) o 192.168.10.1 si hay router';

  @override
  String get ipBasicsSection6Callout1Title => 'Por qué funciona';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Todos en la misma subred → sin sorpresas.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Fácil de explicar, fácil de solucionar.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Ideal para principiantes / espectáculos pequeños y medianos.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plan B - \"10.x\" cuando quieras crecer';

  @override
  String get ipBasicsSection6Code2 =>
      'Red: 10.10.0.0/16 (máscara 255.255.0.0)\n\nConsola: 10.10.0.10\nPC: 10.10.0.20\nNodos: 10.10.1.10 → 10.10.1.200\nConmutador: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Cuándo utilizarlo';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Cuando tienes muchos equipos (o varias zonas).';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Cuando planifique VLAN más adelante (luz/vídeo/IT).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plan C - compat Art-Net \"2.x.x.x\" (legacy)';

  @override
  String get ipBasicsSection6Code3 =>
      'Red: 2.0.0.0/8 (máscara 255.0.0.0)\n\nPC/consola: 2.0.0.10\nNodo 1: 2.0.0.100\nNodo 2: 2.0.0.101\n\n⚠️ Red aislada, sin Internet, sin enrutamiento.';

  @override
  String get ipBasicsSection6Callout3Title => 'Atención';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Este plan es práctico para equipos antiguos / predeterminados.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Pero evita mezclarlo con una LAN \"normal\" (192.168.x.x) sin router.';

  @override
  String get ipBasicsSection7Callout1Title => 'Síntomas → causas probables';

  @override
  String get ipBasicsSection7Bullet1 =>
      '\"Puedo ver el nodo pero no responde\". → Máscara / VLAN / cortafuegos diferentes.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '\"Un dispositivo funciona y luego desaparece\" → DHCP inestable / conflicto de IP.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '\"Nada funciona excepto en el switch\" → IP no en la misma red / cable equivocado / puerto VLAN.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '\"Todo se arrastra / pérdidas\" → broadcast/multicast demasiado amplio / switch de gama baja / bucle de red.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '\"Funciona con cable pero no con Wi-Fi\" → jitter / roaming / saturación de banda / ahorro de energía.';

  @override
  String get ipBasicsSection7Subtitle => 'Método Pro en 5 minutos';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Mira la IP + máscara de la consola/PC y del nodo.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Comprobación: misma subred (por ejemplo, 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (si es posible) + prueba de acceso a la interfaz web del nodo.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Si es DHCP: lista quién tiene qué IP (tabla DHCP) y comprueba si hay duplicados.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Si sACN multicast: comprobar IGMP snooping/querier (en caso contrario flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Trampa muy común';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Máscara \"heredada\" en un PC (255.255.0.0 en lugar de 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Resultado: crees que estás \"en la misma red\", pero no como el otro dispositivo.';

  @override
  String get ipBasicsSection8Subtitle1 => 'Ejercicio 1: misma red o no (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'A = 192.168.10.50 /24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ misma red.';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ no es la misma red.';

  @override
  String get ipBasicsSection8Subtitle2 => 'Ejercicio 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10 /16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ misma red (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ no es la misma red.';

  @override
  String get ipBasicsSection8CalloutTitle => 'Consejo visual';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → los 3 primeros números idénticos (A.B.C) = misma red.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → los 2 primeros números idénticos (A.B) = misma red.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → el 1er número idéntico (A) = misma red.';

  @override
  String get ipBasicsSection8Subtitle3 => 'Ejercicio 3: evitar IP \"raras';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x: reservada (no es una IP de host normal).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x: loopback (el propio PC).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x: auto-IP cuando DHCP ausente (APIPA) → señal de problema DHCP.';

  @override
  String get ipBasicsSection9CalloutTitle =>
      'Antes de buscar el almuerzo a las 14:00';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Misma subred = IP + máscara coherentes.';

  @override
  String get ipBasicsSection9Bullet2 => 'No hay IP duplicadas (conflicto).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK si se domina; en caso contrario, borrar plan estático.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'Firewall del PC: puede bloquear el ping / descubrimiento.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: puerto correcto, VLAN correcta, sin bucles.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN multicast: se recomienda IGMP snooping/querier.';

  @override
  String get ipBasicsChecklistCopy =>
      'Red - Lista de comprobación rápida (IP)\n☐ Todos los dispositivos están en la misma subred (IP + máscara coherentes)\n☐ No hay IPs duplicadas (conflicto)\n☐ DHCP: o todos en DHCP, o plan estático claro (evitar mezcla difusa)\n☐ Para Art-Net/sACN: red dedicada o VLAN si es posible.\n☐ Conmutador gestionado si hay multidifusión/IGMP (sACN).\n☐ Wi-Fi: evitar para mostrar datos críticos (jitter), preferir cableado.\n☐ Prueba simple: ping + comprobar máscara/gateway.';

  @override
  String get ipBasicsFooterNote =>
      'Objetivo: entender lo suficiente para cablear / configurar / solucionar problemas rápidamente en un espectáculo.\nLos detalles de la red pueden ser más profundos, pero estos conceptos básicos cubren el 90% de los fallos de campo.';

  @override
  String get aboutDmxPainterTerm120 => 'TÉRMINO\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote => '✅ Daisy-chain\n❌ No pasivo Y';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) - marcador rápido';

  @override
  String get aboutDmxPainterPin1 => 'Clavija 1: blindaje / masa';

  @override
  String get aboutDmxPainterPin2 => 'Pin 2: Datos';

  @override
  String get aboutDmxPainterPin3 => 'Pin 3 : Datos+';

  @override
  String get aboutDmxPainterPin45 => 'Pin 4/5: \"datos 2\" (raro / opcional)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'En la práctica: a menudo se utiliza XLR3 (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'ÚLTIMOS\nAPARATOS';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Terminación = 120Ω al final de la línea';

  @override
  String get aboutDmxPainter120Between => '120Ω\nentre\nDatos- y Datos+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ Un único final\n❌ No en el centro\n❌ No en cada rama';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLA\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SWITCH\n(IGMP para sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NODO 1\nSALIDA DMX';

  @override
  String get aboutDmxPainterNode2 => 'NODO 2\nSALIDA DMX';

  @override
  String get aboutDmxPainterFix => 'FIX';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Muchos universos\n✅ Nodos cercanos a las máquinas';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Su objetivo: que cada universo emitido por la fuente llegue al nodo (y puerto DMX) correcto sin ambigüedad. La mayoría de los fallos de Art-Net = universo equivocado, subred/red equivocada o saturación de difusión.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Método sencillo (evita el 80% de los errores)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Escribe en un papel: \"Universo 1 → Nodo A puerto 1\", \"Universo 2 → Nodo A puerto 2\", etc.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Establezca IPs estables (DHCP reservado o estático).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Utiliza unicast si tienes más de un nodo o una red compartida.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Difusión frente a unidifusión';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Difusión: se envía a todo el mundo → fácil pero puede \"inundar\" un conmutador.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: se envía a la IP del nodo → más limpio y predecible.';

  @override
  String get aboutArtnetSection2SubBullet3 =>
      'En show: en caso de duda → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universo: experiencia práctica';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'La numeración debe ser sencilla (por ejemplo, 1...N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Evite \"un universo en todas partes\": documente sus correspondencias.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'En algunas configuraciones, existe \"Red/Subred/Universo\": piensa en \"mapeo\", no en \"magia\".';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'Los límites \"reales\" (por orden)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi: latencia variable + pérdidas → parpadeo o caídas.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Difusión: sobrecarga una LAN (todo el mundo recibe todo).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Conmutador de \"gama baja\": búferes limitados, gestión de multidifusión/broadcast mediocre.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Nodos: límite firmware/CPU (número de universos, frecuencia, opciones).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/fuente: controlador, carga de la CPU, antivirus, tarjeta de red, etc.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Velocidad de actualización';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      'El DMX \"clásico\" suele ser de ~20-44 fps según el fotograma.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'En IP, puedes enviar más, pero los nodos no siempre te siguen (y no siempre es útil).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Estabilidad > frecuencia: estable a 30-40 fps es mejor que \"rápido\" pero inestable.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Reglas sencillas';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Red dedicada (o VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 => 'Unicast si hay varios nodos.';

  @override
  String get aboutArtnetSection3SubBullet6 =>
      'Cableado para espectáculos críticos.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Un nodo = IP → DMX. Puede tener 1, 2, 4 u 8 puertos DMX. La estabilidad depende del nodo Y del cableado DMX en el lado de salida (terminación, topología, divisores).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Nodos frente a divisores';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Nodo: convierte IP→DMX (y a veces DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'Divisor DMX: divide una línea DMX en ramificaciones (se recomienda opto).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Buen diseño: IP hasta el más mínimo detalle, luego DMX corto y limpio.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM en Art-Net (apoyo variable)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Algunos nodos soportan un proxy RDM: la consola ve/configura los dispositivos RDM vía IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Otros no admiten RDM en absoluto, o sólo parcialmente.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Un opto splitter \"clásico\" puede bloquear el retorno RDM (según el modelo).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Consejo: si desea RDM, elija explícitamente el hardware marcado como compatible con RDM.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Buenos reflejos sobre el terreno';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Si DMX es inestable: ajustar primero DMX (terminación, cable, Y pasivo) y luego sólo IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Si RDM inestable: desactiva RDM para comprobar que el DMX puro es estable.';

  @override
  String get aboutArtnetSection5CalloutTitle => 'Síntomas → causas probables';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Parpadeo en todo el conjunto → Wi-Fi, inundación de emisión, interruptor saturado.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Un nodo OK, el otro no → universo/mapeo, IP, unicast mal configurado.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Caídas aleatorias → cable RJ45 defectuoso, conmutador inestable, PC que deja caer paquetes.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Un solo puerto DMX en un nodo KO → cable DMX, terminación, aparato que rompe la línea.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'Descubrimiento RDM imposible → nodo/distribuidor no compatible con RDM, cableado DMX limítrofe.';

  @override
  String get aboutArtnetSection5Subtitle => 'Método rápido';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Unidifusión a un único nodo (prueba sencilla).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Comprueba el universo/mapeo (papel + configuración de nodos).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Prueba directa por cable (PC → interruptor → nodo) con cable conocido OK.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Aísle el DMX: nodo → 1 dispositivo + terminación.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Arquitectura propia (IP → nodos → DMX corto)';

  @override
  String get aboutArtnetSection6Subtitle2 =>
      'Difusión frente a unidifusión (idea)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Activos recomendados (opcional)';

  @override
  String get aboutArtnetExampleLabel => 'ejemplo';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Copiar lista de activos';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Sección utilizada para ilustrar la red (RJ45, conmutador, cables). Si los activos no existen, la app muestra un fallback limpio.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Ejemplos';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Conector Ethernet';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Interruptor';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Conmutador (idealmente gestionado si IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Cable Ethernet';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = base fiable';

  @override
  String get aboutArtnetChecklistCopyTitle => 'Art-Net - Lista de control';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Copie la lista de control';

  @override
  String get aboutArtnetChecklistTitle => 'Antes de que cunda el pánico';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unicast si hay varios nodos.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Red dedicada (o VLAN) si es posible.';

  @override
  String get aboutArtnetChecklistBullet3 =>
      'Cableado para el espectáculo crítico.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Universo/mapa documentado.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Prueba IP simple → 1 nodo → 1 dispositivo + terminación.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Si RDM: nodo \"proxy RDM\" confirmado + cableado DMX estable';

  @override
  String get aboutArtnetFooterNote =>
      'Información indicativa (campo). El comportamiento puede variar según los nodos/interruptor/firmware.\nEl objetivo aquí es entender y diagnosticar rápidamente.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'FUENTE\n(PC/consola)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'INTERRUPTOR';

  @override
  String get aboutArtnetDiagramNode1Label => 'NODO 1\nSALIDA DMX';

  @override
  String get aboutArtnetDiagramNode2Label => 'NODO 2\nSALIDA DMX';

  @override
  String get aboutArtnetDiagramFixLabel => 'FIX';

  @override
  String get aboutArtnetDiagramInfoLabel => 'IP largo / DMX corto';

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
  String get aboutArtnetDiagramBroadcastLabel =>
      'Difusión: todo el mundo recibe';

  @override
  String get aboutArtnetMissingAssetLabel => 'Activo ausente';

  @override
  String get aboutRegistryDmxTitle =>
      'DMX - funcionamiento (sencillo y completo)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universo, direcciones, tramas, cableado RS-485, terminación, errores de campo.\nIncluye diagramas y lista de comprobación.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net - DMX sobre IP (nodos, unidifusión/difusión)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'Universo DMX en Ethernet/UDP, nodos, broadcast vs unicast.\nLímites reales, estabilidad de la red, RDM en función de los equipos, esquemas + lista de comprobación.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 - multidifusión, IGMP, prioridades';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Estándar DMX sobre IP para redes profesionales.\nMultidifusión/unidifusión, IGMP snooping/query, prioridades multifuente, esquemas + lista de comprobación.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Red - bases IP / máscara / DHCP (esencial)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Comprensión de IP, máscara, puerta de enlace, DHCP vs estática.\nEjemplos concretos (2.x.x.x, 10.x, 192.168.x), pruebas rápidas, mostrar trampas.';

  @override
  String get aboutRegistryReseauTitle =>
      'Red - RJ45 / Fibra / velocidades y longitudes';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distancias típicas, espectáculo de buenas prácticas.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Red ligera: VLAN, IGMP, Wi-Fi frente a cableado';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Arquitectura sencilla y robusta para Art-Net/sACN.\nVLAN, IGMP snooping/query, Wi-Fi (jitter), switches, diagramas + lista de comprobación.';

  @override
  String get aboutRegistryVideoTitle => 'Vídeo - SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Elegir según latencia, fiabilidad, cableado, LAN vs WAN.\nTablas + diagrama.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Eléctrico - Schuko / P17 / potencias';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Conectores, mono/tri, paneles kW rápidos (16A→400A), trampas de campo.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'TI - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Velocidades útiles, versiones, límites reales, trampas del marketing.';

  @override
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Índice = Universo - 1 (base 0).';

  @override
  String get aboutNetworkPageTitle => 'Red ligera - VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Marcadores de copia';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Copia';

  @override
  String get aboutNetworkChecklistTitle => 'Antes de abrir Wireshark 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Información indicativa (campo). Dependiendo del hardware de la red, IGMP/VLAN puede ser esencial.\nObjetivo: que sea sencillo y robusto.';

  @override
  String get aboutNetworkCopy1 =>
      'Red ligera: objetivo sencillo, dedicado y estable.';

  @override
  String get aboutNetworkCopy2 =>
      'VLAN = tráfico separado (ligero frente a resto).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = esencial si sACN multicast a gran escala.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = aceptable para la resolución de problemas, raramente aceptable para la producción crítica.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Red de iluminación - Lista de comprobación\n☐ Red dedicada o VLAN de iluminación.\n☐ Plan IP claro (DHCP o estático) + máscara correcta\n☐ Conmutador correcto; se evitan los bucles\n☐ Multicast sACN: IGMP snooping ON\n☐ IGMP querier presente en la VLAN (si la infra lo requiere)\n☐ Unicast para la resolución de problemas (especialmente Art-Net).\n☐ Wi-Fi: evitar prod críticos (jitter/pérdidas).\n☐ Pruebas: ping estable + carga progresiva (universo).';

  @override
  String get aboutNetworkToc1 => '1) Objetivo: red estable';

  @override
  String get aboutNetworkToc2 => '2) Plan PI (sencillo)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (separación)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (multidifusión sACN)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi frente a cable';

  @override
  String get aboutNetworkToc6 => '6) Cambio: lo que necesita';

  @override
  String get aboutNetworkToc7 => '7) Diagramas';

  @override
  String get aboutNetworkToc8 => '8) Lista de control';

  @override
  String get aboutNetworkBasicsPill1 => 'Dedicado/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Cableado';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP si multidifusión';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Una red ligera debe ser predecible: pocas pérdidas, poca fluctuación, arquitectura sencilla. Cuando las cosas van mal, rara vez es \"el protocolo\" y a menudo es la infraestructura (switch, Wi-Fi, bucles, flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Regla básica';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'Si puede: cableado + conmutador correcto + red dedicada (o VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'Si tiene que compartir: VLAN + reglas claras.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multicast: IGMP se convierte rápidamente en obligatorio.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Elige una estrategia sencilla y coherente. Dos enfoques: DHCP (sencillo) o estático (predecible). En el peor de los casos: una mezcla indocumentada.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Ejemplo de plan (sencillo)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'VLAN ligera: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Consola/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Nodos: 10.10.0.100-150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Switch mgmt: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Errores clásicos';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Máscara diferente (por ejemplo, /24 frente a /16) → máquinas invisibles.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Dos dispositivos con la misma IP → comportamiento aleatorio.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + estática en el mismo rango sin control → conflictos.';

  @override
  String get aboutNetworkVlanParagraph =>
      'Una VLAN le permite aislar la luz del resto (Internet, producción de vídeo, invitados...). Así evitas el ruido de la red y reduces el riesgo de que otro servicio interrumpa tu espectáculo.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'Lo que ganas';

  @override
  String get aboutNetworkVlanBullet1 => 'Menos tráfico parasitario.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Menos riesgo (DHCP externo, difusión no deseada).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Depuración más fácil (todo en la VLAN = luz).';

  @override
  String get aboutNetworkVlanSubtitle => 'Atención';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'Una VLAN = todos los puertos deben estar correctamente configurados (acceso/troncal).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'Si no sabes cómo: una red \"física\" dedicada suele ser más sencilla.';

  @override
  String get aboutNetworkIgmpPill1 => 'IGMP snooping';

  @override
  String get aboutNetworkIgmpPill2 => 'Consultor IGMP';

  @override
  String get aboutNetworkIgmpPill3 => 'Inundación multicast';

  @override
  String get aboutNetworkIgmpParagraph =>
      'IGMP snooping permite al switch saber qué puertos quieren qué multidifusión. Sin esto, la multidifusión puede inundar todos los puertos → saturación.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'IGMP querier (idea simple)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'En algunas redes/VLAN, se requiere un querier para mantener las suscripciones IGMP.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'No hay problema: según el interruptor, las suscripciones caducan y se ven \"fallos\".';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'Si tienes una red pequeña dedicada: a veces todo funciona, pero con una red grande: es crítico.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Diagrama : IGMP (idea)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'Cableado';

  @override
  String get aboutNetworkWifiSubtitle2 => 'Wi-Fi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Latencia estable, bajas pérdidas (si es infra limpio).';

  @override
  String get aboutNetworkWifiSubBullet2 => '✅ Recomendado para prod.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      '✅ Práctico (configuración rápida, tableta).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌ Latencia variable (jitter), pérdidas, interferencias.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      '❌ Multicast a veces mal gestionado según AP/config.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK para la solución de problemas / configuraciones pequeñas, no críticos, rara vez OK cuando se muestra cargado.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Regla simple';

  @override
  String get aboutNetworkWifiBullet1 => 'Espectáculo crítico = cableado.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = comodidad del operador (UI), no transporte DMX/IP principal si el volumen es grande.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Mínimo recomendado';

  @override
  String get aboutNetworkSwitchBullet1 =>
      'Conmutador Ethernet correcto (no concentrador).';

  @override
  String get aboutNetworkSwitchBullet2 => 'Cables OK (RJ45, conectores).';

  @override
  String get aboutNetworkSwitchBullet3 => 'Evitar bucles (o STP controlado).';

  @override
  String get aboutNetworkSwitchBullet4 => 'Si sACN multicast: IGMP snooping.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Gestionado frente a no gestionado';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'No gestionada: ok pequeña red dedicada (simple).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Gestionado: útil para VLAN/IGMP/diagnóstico (redes grandes).';

  @override
  String get aboutNetworkDiagramsSubtitle1 => 'VLAN: separar luz / descanso';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi vs cableado (idea)';

  @override
  String get aboutNetworkChecklistBullet1 =>
      'Plan IP claro, máscara coherente.';

  @override
  String get aboutNetworkChecklistBullet2 => 'Red dedicada / VLAN ligera.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Interruptor OK, sin bucles.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP para sACN multidifusión.';

  @override
  String get aboutNetworkChecklistBullet5 =>
      'Se evita el Wi-Fi en los puntos críticos.';

  @override
  String get videoCameraExposureTitle => 'Exposición de la cámara';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, velocidad y apertura.';

  @override
  String get videoCamPageTitle => 'Exposición de la cámara';

  @override
  String get videoCamInfoTitle => 'Información';

  @override
  String get videoCamIntro =>
      'Cálculos indicativos para relacionar lux, ISO, velocidad y diafragma.';

  @override
  String get videoCamInputsTitle => 'Entradas';

  @override
  String get videoCamLuxLabel => 'Lux';

  @override
  String get videoCamLuxHint => 'Ej: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Ex: 800';

  @override
  String get videoCamShutterLabel => 'Velocidad (s)';

  @override
  String get videoCamShutterHint => 'Ej: 1/50';

  @override
  String get videoCamApertureLabel => 'Apertura (f/)';

  @override
  String get videoCamApertureHint => 'Ej: 2,8';

  @override
  String get videoCamEvEmpty => '-';

  @override
  String get videoCamNote =>
      'Valores indicativos: el calibrado depende del sensor, de la escena y de las normas.';

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
    return 'Velocidad: $shutter s';
  }

  @override
  String get aboutDmxS2Title =>
      '2) trama DMX - pausa, código de inicio, canales';

  @override
  String get aboutDmxS2PillBreak => 'Pausa';

  @override
  String get aboutDmxS2PillStartCode => 'Código de inicio';

  @override
  String get aboutDmxS2PillSlots512 => '512 ranuras';

  @override
  String get aboutDmxS2PillRefresh => 'Actualizar';

  @override
  String get aboutDmxS2Intro =>
      'Una trama DMX se envía en bucle. Comienza con una \"pausa\" (silencio), luego un código de inicio y, a continuación, hasta 512 valores (0-255). Cada aparato lee únicamente los canales que le corresponden (en función de su dirección y modo).';

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
      'Ranuras 1→512: cada ranura = 1 canal (0-255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'La trama vuelve a empezar de forma continua: es normal que se \"sobrescriba\" el valor antiguo.';

  @override
  String get aboutDmxS2PracticalTitle => 'En la práctica';

  @override
  String get aboutDmxS2PracticalB1 =>
      'Un modo de 16 bits utiliza 2 canales para la misma función (por ejemplo, Pan grueso + Pan fino).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'Cuantos más universos envíes, mayor será la carga total (consolas/nodos/red).';

  @override
  String get aboutDmxS2PracticalB3 =>
      'Si tienes parpadeo, piensa primero en el cable/terminación/conexiones antes de sospechar de la consola.';

  @override
  String get aboutDmxS3Title => '3) Cableado DMX - RS-485, topología, pinout';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Cadena';

  @override
  String get aboutDmxS3PillNoY => 'No Y';

  @override
  String get aboutDmxS3Pill120ohm => '120 Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 se basa en RS-485: un bus diferencial al que le gustan las líneas limpias. La regla de oro: una cadena tipo margarita desde la fuente hasta los dispositivos y una terminación al final.';

  @override
  String get aboutDmxS3TopologyTitle => 'Topología recomendada';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Fuente → Dispositivo 1 → Dispositivo 2 → ... → último dispositivo.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Evite las ramas en Y: crean reflejos (inestabilidad).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'Si necesitas hacer derivaciones: utiliza un divisor DMX optoaislado.';

  @override
  String get aboutDmxS3PinoutTitle => 'Conectores (recordatorio)';

  @override
  String get aboutDmxS3CablesTitle => 'Cables: lo que realmente funciona';

  @override
  String get aboutDmxS3CablesB1 =>
      'Utilice un cable DMX (impedancia ~120 Ω), no un micrófono cualquiera (excepto para solucionar problemas breves).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Mantenga longitudes razonables y evite bobinados apretados cerca de fuentes de alimentación/dimmers.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Un cable en mal estado a veces \"funciona\"... hasta que deja de hacerlo (humedad, longitud, carga).';

  @override
  String get aboutDmxS4Title =>
      '4) Terminación y divisores - estabilidad del bus';

  @override
  String get aboutDmxS4Intro =>
      'En un bus RS-485, la terminación evita las reflexiones al final de la línea. Se utilizan divisores optoaislados para crear ramas limpias y proteger la fuente.';

  @override
  String get aboutDmxS4TerminatorTitle => 'Terminación (120 Ω): cuándo y cómo';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Coloca una terminación en el último dispositivo (o un conector XLR).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Sólo una terminación por línea (no en todas partes).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Indispensable en líneas largas, cargas pesadas y entornos ruidosos.';

  @override
  String get aboutDmxS4SplittersTitle => 'Divisores / optoaislamiento';

  @override
  String get aboutDmxS4SplittersB1 => 'Permite hacer 2, 4 u 8 ramas sin \"Y\".';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Aísla eléctricamente: limita los bucles de masa y protege la consola/el nodo.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Práctico para redirigir una señal a largas distancias.';

  @override
  String get aboutDmxS5Title =>
      '5) Solución de problemas - método sencillo (rápido y fiable)';

  @override
  String get aboutDmxS5Intro =>
      'Cuando un aparato no responde, la clave está en aislarlo: ¿es la dirección, el modo, la línea DMX o el aparato? Sigue una breve lista de comprobación antes de reconfigurarlo todo.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Lista rápida';

  @override
  String get aboutDmxS5QuickB1 =>
      'Dirección DMX correcta (y no 001 vs 000 según la pantalla).';

  @override
  String get aboutDmxS5QuickB2 => '¿Modo DMX correcto (número de canales)?';

  @override
  String get aboutDmxS5QuickB3 =>
      '¿Buen universo / salida (consola, nodo, puerto)?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Pruebe con un cable que sepa que está bien y, a continuación, sustitúyalo uno a uno.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Añade/elimina una terminación al final de la línea para ver el efecto.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'Si parpadea / se enciende';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Busque una \"Y\" oculta, un divisor inadecuado o un adaptador XLR defectuoso.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Aleja el DMX de fuentes de alimentación/dimmers, evita grandes bucles de cables.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Reducir la complejidad: 1 universo, 1 línea, 1 dispositivo, y luego reconstruir.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Regla de oro';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'Tienes que poder utilizar un solo dispositivo en una sola línea. Si esta prueba básica falla, el problema no es \"el parche completo\": es el direccionamiento, el cableado o el hardware.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net - DMX sobre IP (vocabulario y dificultades)';

  @override
  String get aboutDmxS6PillUdp => 'UDP';

  @override
  String get aboutDmxS6PillNodes => 'Nodos';

  @override
  String get aboutDmxS6PillBroadcast => 'Difusión';

  @override
  String get aboutDmxS6PillUnicast => 'Unicast';

  @override
  String get aboutDmxS6Intro =>
      'Art-Net transporta universos DMX a través de Ethernet (UDP). Una consola/software envía universos a través de la red, y un nodo los convierte en salidas físicas DMX.';

  @override
  String get aboutDmxS6BasicsTitle => 'Para recordar';

  @override
  String get aboutDmxS6BasicsB1 => 'Un nodo = red ↔ DMX (varios puertos).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Difusión envía a todo el mundo (simple pero puede saturar).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'Unicast sólo envía al nodo de destino (suele ser más estable en equipos grandes).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Tenga cuidado al contar universos: Art-Net suele empezar en 0 (Universo 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => '¿Cuándo elegir Art-Net?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Equipos pequeños/medianos, montajes rápidos, mucho hardware compatible.';

  @override
  String get aboutDmxS6WhenB2 =>
      'OK si la red está limpia (interruptor correcto, cables, sin Wi-Fi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'Si se satura: cambiar a unicast y segmentar la red (VLAN / red dedicada).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) - multidifusión, prioridades, red propia';

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
      'sACN (ANSI E1.31) es un estándar moderno para el transporte de universos DMX sobre IP. Se utiliza ampliamente en grandes sistemas porque gestiona bien la multidifusión y las prioridades.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Ideas clave';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multidifusión: un universo es un \"grupo\" de red (los nodos se suscriben entre sí).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'IGMP snooping en switches = esencial a gran escala (de lo contrario se inunda).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Prioridad: varias fuentes posibles, gana la de mayor prioridad.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Como Art-Net: red limpia + cables/interruptores de calidad = estabilidad.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN - resumen (¿qué elegir?)';

  @override
  String get aboutDmxS8Intro =>
      'Los tres hacen lo mismo: controlar canales. La diferencia radica en la distribución (cable DMX frente a red), la escala y la robustez.';

  @override
  String get aboutDmxS8QuickTableTitle => 'Resumen en 4 líneas';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX: sencillo, robusto, 1 cable = 1 línea (512 canales).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net: muy común, fácil de desplegar, cuidado con la difusión.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN: más \"pro grandes sistemas\", multidifusión + prioridades, requiere una red bien configurada.';

  @override
  String get aboutDmxS8QuickB4 =>
      'En todos los casos: documentación + pruebas progresivas = enorme ahorro de tiempo.';

  @override
  String get aboutDmxS8ChooseTitle => 'Selección rápida';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Pequeña configuración: DMX directo o Art-Net (sencillo).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Muchos universos: red dedicada + nodos; Art-Net en unicast o sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Plataformas / infraestructuras muy grandes: sACN + conmutadores/IGMP bien gestionados.';

  @override
  String get aboutSunTimesTitle => 'Salida/puesta del sol';

  @override
  String get aboutSunTimesSubtitle =>
      'Elección de ciudad y fecha, horas de salida/puesta del sol + umbrales (lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'Red - puntos de referencia';

  @override
  String get aboutReseauSummaryCopy =>
      'RED - marcadores de campo\n- RJ45: Cat5e/6/6A → 1G/10G en función de la distancia.\n- Fibra: larga distancia + inmunidad EMI.\n- Switch: IGMP importante para sACN multidifusión.\n- VLAN: luz/vídeo/IT separados = estabilidad.';

  @override
  String get aboutReseauChecklistCopy =>
      'RED - Lista de comprobación\n☐ Borrar plan de IP (rango / máscaras).\n☐ Conmutador correcto (IGMP si sACN multidifusión).\n☐ VLAN si varios \"mundos\" (luz/vídeo/IT).\n☐ Cables probados + etiquetados\n☐ Fibra: módulos compatibles + conectores propios.\n☐ Evitar bucles (STP) + evitar Wi-Fi pública en la LAN del espectáculo';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Copia';

  @override
  String get aboutReseauFooterNote =>
      'Información orientativa (campo). Las capacidades exactas varían en función de los equipos / cables / módulos.\nObjetivo: puntos de referencia sencillos + método fiable.';

  @override
  String get aboutReseauToc1 =>
      '1) Aspectos básicos de la red (LAN / IP / caudal)';

  @override
  String get aboutReseauToc2 => '2) RJ45 y categorías (Cat5e/6/6A/...)';

  @override
  String get aboutReseauToc3 => '3) PoE (alimentación de red)';

  @override
  String get aboutReseauToc4 => '4) Fibra (SM/MM) + conectores (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP / SFP+ / QSFP (módulos)';

  @override
  String get aboutReseauToc6 => '6) Conmutadores (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN en la red (asesoramiento)';

  @override
  String get aboutReseauToc8 => '8) Lista de control';

  @override
  String get aboutReseauSection1Title => '3 ideas sencillas';

  @override
  String get aboutReseauSection1Bullet1 =>
      'IP = dirección (por ejemplo, 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = red local a través de conmutador (no \"internet\").';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Rendimiento = capacidad (1G, 10G...), pero la estabilidad también depende del conmutador.';

  @override
  String get aboutReseauSection1Title2 => 'Mostrar topología (limpia)';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Consola/PC → conmutador central → nodos/servidores.';

  @override
  String get aboutReseauSection1Bullet5 =>
      'Evita las redes en cadena aleatorias.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Si es posible: una red dedicada al espectáculo (no Wi-Fi pública).';

  @override
  String get aboutReseauSection2Title => 'Puntos de referencia rápida';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e: 1 Gbit/s \"clásico\" (hasta 100 m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6: 1G/10G (10G para distancias más cortas).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A: 10G hasta 100 m (referencia práctica).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Más allá de eso: existen Cat7/8, pero Cat6A suele ser el punto dulce sobre el terreno.';

  @override
  String get aboutReseauSection2Title2 => 'Terreno';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Pruebe y etiquete siempre los cables (sobre todo si los alquila).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Evite los conectores dañados: un RJ45 \"cansado\" = fallos fantasma.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Planifica 10G si vas a hacer mucho vídeo IP.';

  @override
  String get aboutReseauSection3Paragraph =>
      'PoE puede utilizarse para alimentar equipos a través de RJ45 (cámaras IP, AP Wi-Fi, pequeños nodos, etc.). El punto crítico: el presupuesto PoE total del switch.';

  @override
  String get aboutReseauSection3Title => 'Hitos';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt superior.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'El interruptor tiene un \"presupuesto\" total (por ejemplo, 120 W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'Si te pasas del presupuesto: algunos puertos ya no se encienden / reinician.';

  @override
  String get aboutReseauSection4Title => 'Por qué fibra en el espectáculo';

  @override
  String get aboutReseauSection4Bullet1 => 'Distancias muy largas.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Inmunidad a las interferencias (EMI), lo mejor en entornos con mucho tráfico.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Práctico para conectar FOH ↔ plató ↔ sala de control.';

  @override
  String get aboutReseauSection4Title2 =>
      'Multimodo frente a monomodo (marcador único)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimodo (MM): distancias \"medias\" (a menudo edificio/plataforma).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Monomodo (SM): distancias muy largas.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'Los módulos (SFP) deben coincidir con el tipo de fibra.';

  @override
  String get aboutReseauSection4Title3 => 'Conectores';

  @override
  String get aboutReseauSection4Bullet7 => 'LC: pequeño, muy común en SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC: más grande, común en infraestructuras.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Proteger/limpiar siempre (polvo = pérdidas).';

  @override
  String get aboutReseauSection5Title => 'Hitos';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP: a menudo 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+: a menudo 10G.';

  @override
  String get aboutReseauSection5Bullet3 =>
      'QSFP/QSFP+: 40G (dependiendo del uso).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'Un módulo = velocidad + tipo de fibra + longitud (todo debe ser coherente).';

  @override
  String get aboutReseauSection5Paragraph =>
      'En la práctica: utilice módulos compatibles con el conmutador (e idealmente del mismo proveedor/modelo) para evitar sorpresas.';

  @override
  String get aboutReseauSection6Title => 'Funciones útiles';

  @override
  String get aboutReseauSection6Bullet1 =>
      'VLAN: iluminación / vídeo / informática por separado.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'IGMP snooping: esencial si utiliza la multidifusión sACN a gran escala.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS: útil si se mezclan muchos flujos (dependiendo del contexto).';

  @override
  String get aboutReseauSection6Title2 => 'Errores comunes';

  @override
  String get aboutReseauSection6Bullet4 =>
      'Conmutador barato que inunda la red multicast → se colapsa.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Bucle de red sin STP → tormenta de difusión.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Wi-Fi público en la misma LAN que el espectáculo → inestabilidad.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (terreno)';

  @override
  String get aboutReseauSection7Bullet1 => 'Suelen ser fáciles de instalar.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'La difusión es posible en una pequeña LAN dedicada, pero la unidifusión es más limpia.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Asignación de universos/puertos = punto número 1 a comprobar.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (tierra)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multidifusión: eficaz, pero requiere un conmutador adecuado (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Prioridades: útil si hay varias fuentes.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'En grandes espectáculos: sACN + IGMP suele ser la opción \"limpia\".';

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
  String get aboutSacnPageTitle => 'sACN / E1.31 - multidifusión y prioridades';

  @override
  String get aboutSacnCopyTooltip => 'Marcadores de copia';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Copia';

  @override
  String get aboutSacnFooterNote =>
      'Información indicativa (campo). El comportamiento depende de los conmutadores (IGMP), los nodos y el firmware.\nObjetivo: comprender y estabilizar una red sACN.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX sobre IP (UDP), mostrar estándar.';

  @override
  String get aboutSacnCopy2 => 'Universo sACN = 1..63999 (intervalo estándar).';

  @override
  String get aboutSacnCopy3 =>
      'Multidifusión: se recomienda IGMP snooping, de lo contrario flood.';

  @override
  String get aboutSacnCopy4 =>
      'Prioridad: útil con múltiples fuentes (consola + copia de seguridad).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) - Lista de comprobación sobre el terreno\n☐ Conmutador correcto (idealmente gestionable).\n☐ IGMP snooping habilitado si es multidifusión\n☐ (Si es posible) IGMP querier presente en la VLAN (de lo contrario es posible un comportamiento extraño)\n☐ Unicast si la red no está bajo control / solución de problemas\n☐ Prioridades: comprobar múltiples fuentes (consola/respaldo).\n☐ Mapeo universo ↔ puertos nodo comprobado.\n☐ Wi-Fi evitado en producción';

  @override
  String get aboutSacnToc1 => '1) ¿Para qué sirve el sACN?';

  @override
  String get aboutSacnToc2 => '2) Universo (numeración)';

  @override
  String get aboutSacnToc3 => '3) Multidifusión / Unidifusión + IGMP';

  @override
  String get aboutSacnToc4 => '4) Prioridades (fuentes múltiples)';

  @override
  String get aboutSacnToc5 => '5) Límites / rendimiento';

  @override
  String get aboutSacnToc6 => '6) RDM y sACN (proxy / en función del equipo)';

  @override
  String get aboutSacnToc7 => '7) Diagramas';

  @override
  String get aboutSacnToc8 => '8) Lista de control';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multidifusión';

  @override
  String get aboutSacnSection1Pill3 => 'Prioridad';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) es un estándar ampliamente utilizado para transportar universos DMX sobre IP. Suele preferirse cuando se desea una arquitectura de red limpia: multidifusión bien gestionada, prioridades estandarizadas y un comportamiento más \"pro red\".';

  @override
  String get aboutSacnSection1Title => 'Cuando está arriba';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Muchos universos en una red bien gestionada.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Instalaciones / grandes redes con varias fuentes (prioridades).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'Cuando se quiere evitar la \"difusión en todas partes\".';

  @override
  String get aboutSacnSection2Pill1 => 'Universo 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 ranuras/universo';

  @override
  String get aboutSacnSection2Paragraph =>
      'Un universo sACN corresponde a un universo DMX: hasta 512 ranuras. La numeración sACN estándar es 1..63999. En la práctica, lo importante es el mapeo consola ↔ nodo ↔ puerto DMX.';

  @override
  String get aboutSacnSection2Title => 'Error clásico';

  @override
  String get aboutSacnSection2Bullet1 =>
      'Se cambia el número de universo en el lado de la consola, pero no en el lado del nodo (o viceversa).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'Parcheas \"Universo 0\" cuando el hardware espera una base 1.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Estás mezclando convenciones de numeración entre herramientas.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN suele utilizar la multidifusión: cada universo \"vive\" en un grupo multidifusión, y los nodos se suscriben a los universos que necesitan.';

  @override
  String get aboutSacnSection3Title => 'IGMP snooping (por qué es importante)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Sin IGMP: el switch \"inunda\" de multidifusión todas partes → posible sobrecarga.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Con IGMP: el switch envía sólo a los puertos suscritos → red estable.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'Para grandes volúmenes: IGMP es a menudo LA diferencia entre \"funciona\" y \"es un infierno\".';

  @override
  String get aboutSacnSection3Subtitle => 'Diagrama: multidifusión e IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (opción)';

  @override
  String get aboutSacnSection3SubBullet1 =>
      'Posible en función de las consolas/nodos.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Útil para solucionar problemas o si la red multidifusión está fuera de control.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Menos elegante, pero a veces más sencillo.';

  @override
  String get aboutSacnSection4Pill1 => 'Fuente A prio 100';

  @override
  String get aboutSacnSection4Pill2 => 'Fuente B prio 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN maneja una noción de prioridad: si varias fuentes envían el mismo universo, el receptor se queda con la fuente de mayor prioridad. Muy útil con una consola principal + una consola de reserva + un servidor de medios.';

  @override
  String get aboutSacnSection4Title => 'Trampas';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Dos fuentes no deseadas en el mismo universo → \"se pelea\".';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Prioridad configurada incorrectamente → copia de seguridad tomando el control.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Depurar: corta una fuente y comprueba quién gana.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Interruptor';

  @override
  String get aboutSacnSection5Pill3 => 'Wi-Fi no';

  @override
  String get aboutSacnSection5Pill4 => 'Nodo CPU';

  @override
  String get aboutSacnSection5Title => 'Lo que se rompe primero';

  @override
  String get aboutSacnSection5Bullet1 => 'Multicast sin IGMP → flood.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Interruptor no adaptado (buffers/CPU) → pérdidas.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → fluctuaciones/pérdidas.';

  @override
  String get aboutSacnSection5Bullet4 => 'Nodos limitados (puertos, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Reglas sencillas';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Conmutador gestionado + IGMP snooping si hay muchos universos.';

  @override
  String get aboutSacnSection5SubBullet2 =>
      'VLAN ligera dedicada si es posible.';

  @override
  String get aboutSacnSection5SubBullet3 =>
      'Unicast para la resolución de problemas.';

  @override
  String get aboutSacnSection6Paragraph =>
      'Al igual que con Art-Net, RDM \"sobre IP\" a menudo depende de un mecanismo proxy en los nodos. El estándar sACN no implica automáticamente que su nodo esté haciendo RDM correctamente.';

  @override
  String get aboutSacnSection6Title => 'Consulte la documentación del nodo';

  @override
  String get aboutSacnSection6Bullet1 => 'Soporte RDM proxy / RDM sobre IP.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Limitaciones (sólo descubrimiento, comandos parciales).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatible con splitters/opto en el lado DMX.';

  @override
  String get aboutSacnSection6Subtitle => 'Método de campo';

  @override
  String get aboutSacnSection6SubBullet1 => 'Estabilizar DMX sin RDM.';

  @override
  String get aboutSacnSection6SubBullet2 =>
      'Pruebe RDM en una línea simple y limpia.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'Si surgen problemas: desactive RDM y, a continuación, aísle el nodo/distribuidor.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multidifusión + IGMP (idea)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Prioridades (2 fuentes)';

  @override
  String get aboutSacnChecklistTitle => 'Antes de culpar al \"protocolo';

  @override
  String get aboutSacnChecklistBullet1 =>
      'IGMP snooping activado si es multidifusión.';

  @override
  String get aboutSacnChecklistBullet2 => 'VLAN dedicada si es posible.';

  @override
  String get aboutSacnChecklistBullet3 =>
      'Unicast para la resolución de problemas.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Prioridades coherentes si hay varias fuentes.';

  @override
  String get aboutSacnChecklistBullet5 => 'Wi-Fi evitado en prod.';

  @override
  String get sunTimesTitle => 'Amanecer / atardecer';

  @override
  String get sunTimesSectionSettings => 'Parámetros';

  @override
  String get sunTimesSectionResults => 'Resultados';

  @override
  String get sunTimesSectionTimeline => 'Calendario (pasos de 30 minutos)';

  @override
  String get sunTimesSectionTwilight => '¿Qué es el crepúsculo?';

  @override
  String get sunTimesSectionLux => 'Umbrales de luminosidad (marcadores)';

  @override
  String get sunTimesIntro =>
      'Elija una ciudad y una fecha. Los horarios son orientativos (redondeados).';

  @override
  String get sunTimesLabelCity => 'Ciudad';

  @override
  String get sunTimesLabelDate => 'Fecha';

  @override
  String get sunTimesNoteApprox =>
      'Los tiempos son aproximados - pueden variar según la altitud, la refracción y el tiempo.';

  @override
  String get sunTimesNoData => '-';

  @override
  String get sunTimesResultSunrise => 'Amanecer';

  @override
  String get sunTimesResultSunset => 'Puesta de sol';

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
  String get sunTimesTimelineStep30 => 'Paso: 30 min';

  @override
  String get sunTimesTimelineDay => 'Día';

  @override
  String get sunTimesTimelineCivil => 'Civil';

  @override
  String get sunTimesTimelineNautical => 'Náutica';

  @override
  String get sunTimesTimelineAstronomical => 'Astronómico';

  @override
  String get sunTimesTimelineNight => 'Noche';

  @override
  String get sunTimesTwilightIntro =>
      'El crepúsculo se define por la altura del Sol por debajo del horizonte. Estas definiciones están normalizadas.';

  @override
  String get sunTimesTwilightCivilTitle => 'Civil (≈ 0° a -6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Fin/principio del día. El paisaje sigue siendo claramente visible.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Náutica (≈ -6° a -12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'El horizonte se vuelve difícil de distinguir. El cielo es mucho más oscuro.';

  @override
  String get sunTimesTwilightAstronomicalTitle => 'Astronómico (≈ -12° a -18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'El cielo está cerca de la oscuridad total (poca luz residual).';

  @override
  String get sunTimesLuxNight => 'Noche negra';

  @override
  String get sunTimesLuxAstro => 'Astro crepúsculo';

  @override
  String get sunTimesLuxNautical => 'Nace Crepúsculo.';

  @override
  String get sunTimesLuxCivil => 'Crepúsculo civil';

  @override
  String get sunTimesLuxVeryLow => 'Muy bajo';

  @override
  String get sunTimesLuxLow => 'Bajo';

  @override
  String get sunTimesLuxDay => 'Día';

  @override
  String get sunTimesLuxFullDay => 'Luz diurna';

  @override
  String get sunTimesLuxNote =>
      'Estos valores son puntos de referencia típicos (tiempo, estación, entorno → variaciones).';

  @override
  String get aboutVideoPageTitle => 'Vídeo - hitos';

  @override
  String get aboutVideoSummaryCopy =>
      'VÍDEO - puntos de referencia\n- Resolución = tamaño (px). FPS = fluidez / latencia.\n- 4:2:2 / 4:4:4 + 10 bits = calidad del color.\n- SDI = robusto + larga distancia.\n- HDMI = frágil + corta.\n- NDI = IP (red), depende de la LAN.\n- Genlock / Timecode = sincronización.';

  @override
  String get aboutVideoChecklistCopy =>
      'VIDEO - Lista de comprobación\n☐ Misma resolución y FPS en todas partes.\n☐ HDMI: EDID / HDCP dominado\n☐ SDI: cable de 75Ω + buen estándar\n☐ NDI/IP: LAN limpia (conmutador, velocidad).\n☐ Genlock / código de tiempo si se requiere sincronización\n☐ Fuente de prueba → pantalla directa';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Copia';

  @override
  String get aboutVideoFooterNote =>
      'Información orientativa (campo). El comportamiento varía en función del equipo.\nObjetivo: comprender rápidamente y solucionar los problemas de forma limpia.';

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
  String get aboutVideoToc6 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI - campo';

  @override
  String get aboutVideoToc8 => '8) IDN - cuándo / por qué / límites';

  @override
  String get aboutVideoToc9 => '9) Mapping / LED / multiprojo';

  @override
  String get aboutVideoSection1Paragraph =>
      'El vídeo es una imagen (píxeles) enviada a una velocidad (FPS), con una estructura de color (muestreo / profundidad de bits), transportada por un enlace (SDI / HDMI / IP) y a veces sincronizada.';

  @override
  String get aboutVideoSection1Title => 'Vocabulario útil';

  @override
  String get aboutVideoSection1Bullet1 => 'Resolución: anchura×altura (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS: fluidez/latencia.';

  @override
  String get aboutVideoSection1Bullet3 =>
      'Progresivo (p) frente a entrelazado (i).';

  @override
  String get aboutVideoSection1Bullet4 =>
      'Códec: compresión (H.264, H.265...).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latency: reseña en directo.';

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
  String get aboutVideoSection2Bullet5 => '25/50: Norma europea.';

  @override
  String get aboutVideoSection2Bullet6 =>
      '30/60: norma estadounidense / dispositivos.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Evite mezclar 50 y 60 sin conversión.';

  @override
  String get aboutVideoSection3Title => 'Muestreo';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4: gráficos / incrustación.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2: pro courant.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0: archivos / flujos.';

  @override
  String get aboutVideoSection3Title2 => 'Profundidad de bits';

  @override
  String get aboutVideoSection3Bullet4 => '8 bits: estándar.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10 bits: mejor gradación (HDR / LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 =>
      'Sincroniza la actualización de la imagen.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Útil para multicámara / LED / broadcast.';

  @override
  String get aboutVideoSection4Title2 => 'Código de tiempo';

  @override
  String get aboutVideoSection4Bullet3 => 'Sincronización horaria.';

  @override
  String get aboutVideoSection4Bullet4 => 'No sustituye al genlock.';

  @override
  String get aboutVideoSection5Title => 'Reglas sencillas';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI: frágil, corto.';

  @override
  String get aboutVideoSection5Bullet2 => 'SDI: robusto, largo.';

  @override
  String get aboutVideoSection5Bullet3 => 'Fibra: muy larga + libre de EMI.';

  @override
  String get aboutVideoSection6Title => 'Hitos';

  @override
  String get aboutVideoSection6Bullet1 => '3G: 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G: 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G: 2160p60';

  @override
  String get aboutVideoSection7Title => 'Qué hay que tener en cuenta';

  @override
  String get aboutVideoSection7Bullet1 => 'EDID';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Longitudes';

  @override
  String get aboutVideoSection8Title => 'Vídeo IP';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexible.';

  @override
  String get aboutVideoSection8Bullet2 => 'Carga de red.';

  @override
  String get aboutVideoSection8Bullet3 => 'Se requiere una LAN limpia.';

  @override
  String get aboutVideoSection9Title => 'Terreno';

  @override
  String get aboutVideoSection9Bullet1 => 'Misma resolución / FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Asignación correcta.';

  @override
  String get aboutVideoSection9Bullet3 => 'Prueba con patrones de prueba.';

  @override
  String get aboutVideoChecklistTitle => 'Antes de que cunda el pánico';

  @override
  String get aboutVideoChecklistBullet1 => 'Comprueba la resolución / FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Fuente de prueba → pantalla.';

  @override
  String get aboutVideoChecklistBullet3 => 'Simplifique la cadena.';

  @override
  String get homeBpmSubtitle => 'Tap tempo, conversión BPM ↔ ms, Hz, bar.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tap tempo';

  @override
  String get bpmTapButton => 'Tipo';

  @override
  String get bpmResetTap => 'Reiniciar grifos';

  @override
  String get bpmDetectedLabel => 'BPM detectado';

  @override
  String get bpmTapHint =>
      'Dé varios golpecitos (lo ideal es de 4 a 8 golpecitos) para obtener una media estable.';

  @override
  String get bpmManualTitle => 'BPM manual';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ej. 128';

  @override
  String get commonAdd => 'Añadir';

  @override
  String get commonEdit => 'Modifique';

  @override
  String get commonDelete => 'Borrar';

  @override
  String get commonCopied => 'Copiado en el portapapeles.';

  @override
  String get patchCreateGdtfTitle => 'Crear un GDTF (sencillo)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Creación manual de un dispositivo en forma de tabla.';

  @override
  String get gdtfSimpleTitle => 'Creador de GDTF (simple)';

  @override
  String get gdtfDeviceSectionTitle => 'Dispositivo';

  @override
  String get gdtfChannelsSectionTitle => 'Canales';

  @override
  String get gdtfImportJsonTitle => 'Importar JSON';

  @override
  String get gdtfExportJsonTitle => 'Exportar JSON';

  @override
  String get gdtfImportJsonHint => 'Pegue el JSON aquí';

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
  String get gdtfColDmx => 'DMX';

  @override
  String get gdtfColType => 'Tipo';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Fallo';

  @override
  String get gdtfColActions => 'Acciones';

  @override
  String get gdtfMoveUp => 'Subir';

  @override
  String get gdtfMoveDown => 'Bajar';

  @override
  String get gdtfChannelAddTitle => 'Añadir un canal';

  @override
  String get gdtfChannelEditTitle => 'Modificar canal';

  @override
  String get gdtfFieldName => 'Nombre';

  @override
  String get gdtfFieldDmx => 'Dirección DMX';

  @override
  String get gdtfFieldType => 'Tipo';

  @override
  String get gdtfFieldResolution => 'Resolución';

  @override
  String get gdtfRes8 => '8 bits';

  @override
  String get gdtfRes16 => '16 bits';

  @override
  String get gdtfFieldDefault8 => 'Valor por defecto (0-255)';

  @override
  String get gdtfFieldDefault16 => 'Valor por defecto (0-65535)';

  @override
  String get gdtfDefaultChannelName => 'Canal';

  @override
  String get gdtfMvpHint =>
      'MVP: Exportación JSON (portapapeles). La exportación GDTF real (XML+ZIP) vendrá después.';

  @override
  String get gdtfTypeDimmer => 'Regulador de intensidad';

  @override
  String get gdtfTypePan => 'Pan';

  @override
  String get gdtfTypeTilt => 'Inclinación';

  @override
  String get gdtfTypeColor => 'Color';

  @override
  String get gdtfTypeGobo => 'Gobo';

  @override
  String get gdtfTypeShutter => 'Persiana';

  @override
  String get gdtfTypePrism => 'Prisma';

  @override
  String get gdtfTypeZoom => 'Zoom';

  @override
  String get gdtfTypeFocus => 'Enfoque';

  @override
  String get gdtfTypeIris => 'Iris';

  @override
  String get gdtfTypeEffect => 'Efecto';

  @override
  String get gdtfTypeCustom => 'Personalizado';

  @override
  String get gdtfEasyTitle => 'Crear un GDTF (sencillo)';

  @override
  String get gdtfTemplatesTitle => 'Preselecciones';

  @override
  String get gdtfCreateDefaultPreset => 'Crear el preajuste por defecto';

  @override
  String get gdtfTemplatesHint =>
      'Crea una base rápida (dimmer, shutter, pan, tilt, RGB, etc.) y luego rellena las direcciones DMX y los fallos.';

  @override
  String get gdtfExportButton => 'Exportar GDTF';

  @override
  String get gdtfExportHint =>
      'Mínima exportación .gdtf (description.xml) y luego compartir (Mail, WhatsApp, AirDrop, Drive...).';

  @override
  String get gdtfExportNeedDmx =>
      'Añade al menos una dirección DMX para exportar.';

  @override
  String get gdtfExportDone => 'GDTF exportado.';

  @override
  String get gdtfExportError => 'No se puede exportar el GDTF.';

  @override
  String get gdtfShareSubject => 'Archivo GDTF';

  @override
  String get gdtfShareText => 'Este es el archivo GDTF exportado.';

  @override
  String get gdtfFieldRole => 'Parámetro';

  @override
  String get gdtfDmxHint => 'Vacío o 1-512';

  @override
  String get gdtfFieldDefault => 'Fallo';

  @override
  String get gdtfDefaultHint8 => '0-255';

  @override
  String get gdtfDefaultHint16 => '0-65535';

  @override
  String get gdtfChannelDefaultName => 'Canal';

  @override
  String get gdtfRoleEmpty => 'Vacío / Desconocido';

  @override
  String get gdtfRoleDimmer => 'Regulador de intensidad';

  @override
  String get gdtfRoleShutter => 'Persiana';

  @override
  String get gdtfRolePan => 'Pan';

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
  String get gdtfRoleGobo => 'Gobo';

  @override
  String get gdtfRoleZoom => 'Zoom';

  @override
  String get gdtfRoleFocus => 'Enfoque';

  @override
  String get gdtfRolePrism => 'Prisma';

  @override
  String get gdtfRoleEffect => 'Efecto';

  @override
  String get gdtfRoleControl => 'Controlar';

  @override
  String get gdtfRoleCustom => 'A medida';

  @override
  String get gdtfResUnknown => 'Vacío';

  @override
  String get gdtfPresetDimmer => 'Regulador de intensidad';

  @override
  String get gdtfPresetShutter => 'Persiana';

  @override
  String get gdtfPresetPan => 'Pan';

  @override
  String get gdtfPresetTilt => 'Inclinación';

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
  String get gdtfPresetFocus => 'Enfoque';

  @override
  String get gdtfPresetPrism => 'Prisma';

  @override
  String get gdtfPresetEffect => 'Efecto';

  @override
  String get gdtfPresetControl => 'Controlar';

  @override
  String get commonApply => 'Solicitar';

  @override
  String get gdtfPresetLabel => 'Elección';

  @override
  String get gdtfPresetFixtureSimple => 'Una sola luminaria';

  @override
  String get gdtfPresetBarreLed => 'Barra LED';

  @override
  String get gdtfTemplatesHintShort =>
      'Elige un preajuste y aplícalo. A continuación, puede ajustar DMX, valores predeterminados y reordenar mediante arrastrar y soltar.';

  @override
  String get gdtfExportNeedChannels =>
      'Añade al menos un canal para la exportación.';

  @override
  String get homeDrawerContact => 'Contactar con el desarrollador';

  @override
  String get homeDrawerSuggestItem => 'Añadir un artículo al catálogo';

  @override
  String get homeErrorOpenEmail =>
      'No se puede abrir la aplicación de correo electrónico.';

  @override
  String get homeErrorOpenForm => 'No se puede abrir el formulario.';

  @override
  String get homeContactEmailSubject => 'Pregunta sobre My App Tech';

  @override
  String get bpmManualHelp =>
      'Si se introduce un BPM manual, tiene prioridad sobre el tap tempo.';

  @override
  String get bpmConversionsTitle => 'Conversiones';

  @override
  String get bpmActiveLabel => 'BPM activo';

  @override
  String get bpmMsPerBeat => 'Duración de un latido';

  @override
  String get bpmHz => 'Frecuencia';

  @override
  String get bpmSecPerBar44 => 'Duración de un compás (4/4)';

  @override
  String get bpmDisclaimer =>
      'Indicación aproximada. Compruébalo con el metrónomo si es crítico.';

  @override
  String get laserToolsTitle => 'Herramientas';

  @override
  String get laserBeamSizeTitle => 'Tamaño del haz';

  @override
  String get laserBeamSizeSubtitle =>
      'Diámetro, radio y superficie de la mancha a una distancia determinada.';

  @override
  String get laserBeamInputsTitle => 'Parámetros';

  @override
  String get laserBeamDistanceLabel => 'Distancia';

  @override
  String get laserBeamDistanceHint => 'm (ej. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Cálculo: D(z) = D0 + θ - z (θ en rad, ángulo completo).';

  @override
  String get laserBeamResultsTitle => 'Resultados';

  @override
  String get laserBeamDiameterAtDistance => 'Diámetro a distancia';

  @override
  String get laserBeamRadiusAtDistance => 'Radio a distancia';

  @override
  String get laserBeamAreaAtDistance => 'Superficie puntual';

  @override
  String get sunTimesPageTitle => 'Amanecer / atardecer';

  @override
  String get sunTimesSelectionTitle => 'Parámetros';

  @override
  String get sunTimesCityLabel => 'Ciudad';

  @override
  String get sunTimesDateLabel => 'Fecha';

  @override
  String get sunTimesResultsTitle => 'Resultados';

  @override
  String get sunTimesSunriseLabel => 'Amanecer';

  @override
  String get sunTimesSunsetLabel => 'Puesta de sol';

  @override
  String get sunTimesDayLengthLabel => 'Duración del día';

  @override
  String get sunTimesDisclaimer =>
      'Valores indicativos (modelo astronómico). Consulte con una fuente oficial si es necesario (evento, seguridad, filmación).';

  @override
  String get sunTimesThresholdTitle => 'Umbrales de luminosidad (marcadores)';

  @override
  String get sunTimesThresholdIntro =>
      'Órdenes de magnitud útiles para anticipar la luz ambiente (muy variable en función del tiempo, la latitud, la estación, los obstáculos, la contaminación lumínica).';

  @override
  String get sunTimesLuxDaylight =>
      'Luz diurna (excluida la luz solar directa)';

  @override
  String get sunTimesLuxOvercast => 'Nublado (típico)';

  @override
  String get sunTimesLuxSunrise => 'Ascenso/descenso (claro)';

  @override
  String get sunTimesLuxCivilTwilight => 'Límite crepuscular civil (claro)';

  @override
  String get sunTimesLuxFullMoon => 'Luna llena (despejado)';

  @override
  String get sunTimesThresholdNote =>
      'Sugerencia: para la localización \"utilizable sin iluminación\", a menudo buscamos > 100-300 lx. Para trabajos finos, apunta a 500 lx o más.';

  @override
  String get sunTimesParamsTitle => 'Parámetros';

  @override
  String get sunTimesPickDate => 'Elija una fecha';

  @override
  String get sunTimesSunrise => 'Subir';

  @override
  String get sunTimesSunset => 'Hora de dormir';

  @override
  String get sunTimesDayLength => 'Duración del día';

  @override
  String get sunTimesPolarNote =>
      'Nota: en las zonas cercanas a los polos, la salida/puesta del sol puede estar ausente según la estación.';

  @override
  String get sunTimesLuxThresholdTitle =>
      'Umbrales de luminosidad (marcadores)';

  @override
  String get sunTimesLuxBulletNightDark => 'Noche oscura: < 1 lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Noche (luna): ~ 0,1-1 lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Luna llena: ~ 0,1-0,3 lux';

  @override
  String get sunTimesLuxBulletCivilTwilight => 'Crepúsculo civil: Sol a -6°.';

  @override
  String get sunTimesLuxBulletUrbanLow =>
      'Iluminación urbana débil: ~ 5-20 lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Oficina débil: ~ 100-300 lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Oficina estándar: ~ 300-500 lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'En exteriores durante el día: ~ 10.000-25.000 lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Luz solar directa: ~ 100.000 lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Puntos de referencia: el tiempo/nubes, el entorno, la estación y el terreno pueden variar considerablemente.';

  @override
  String get sunTimesTwilightTitle => 'Crepúsculo: ¿qué significa?';

  @override
  String get sunTimesTwilightCivil =>
      'Civil (-6°): luz aún suficiente para distinguir el entorno sin iluminación artificial.';

  @override
  String get sunTimesTwilightNautical =>
      'Náutica (-12°): el horizonte se vuelve difícil de distinguir; estrellas visibles.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Astronómico (-18°): el cielo se considera \"negro\" (excluida la contaminación lumínica).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Ángulos expresados en grados por debajo del horizonte (sol negativo).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Crepúsculo astronómico: Sol a -18°.';

  @override
  String get sunTimesTimelineTitleStep30 => 'Calendario (no 30 min)';

  @override
  String get sunTimesTimelineColTime => 'Tiempo';

  @override
  String get sunTimesTimelineColElevation => 'Elevación';

  @override
  String get sunTimesTimelineColMarker => 'Referencia';

  @override
  String get sunTimesTimelineColLux => 'Lux (pedido)';

  @override
  String get sunTimesTimelineFootnote =>
      'Puntos de referencia indicativos (tiempo/nubes, medio ambiente, estación) - útiles para preparar un espectáculo.';

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
  String get videoLedResultWallResolution => 'Resolución mural';

  @override
  String get videoLedResultWallSize => 'Tamaño de la pared';

  @override
  String get videoLedResultTile => 'Losa';

  @override
  String get videoLedResultPitch => 'Pitch';

  @override
  String get lightFilterLedTabConvert => 'Conversión';

  @override
  String get lightFilterLedTabProfiles => 'Mis accesorios';

  @override
  String get lightFilterLedSourceLabel => 'Fuente de luz';

  @override
  String get lightFilterLedEngineRgbww => 'RGBWW (blanco cálido + blanco frío)';

  @override
  String get lightFilterLedEngineRgbaw => 'RGBAW';

  @override
  String get lightFilterLedEngineRgbauv => 'RGBAUV';

  @override
  String get lightFilterLedEngineRgbwauv => 'RGBWAUV';

  @override
  String get lightFilterLedEngineRgbrcl => 'RGBRCL (rojo, cian, lima)';

  @override
  String get lightFilterLedEngineCmy => 'CMY';

  @override
  String get lightFilterLedSaveProfileTitle =>
      'Guardar el perfil de la luminaria';

  @override
  String get lightFilterLedProfileNameLabel => 'Nombre de la instalación';

  @override
  String get patchMvrViewTable => 'Table';

  @override
  String get patchMvrViewVisual => 'Visual';

  @override
  String get consoleTitle => 'Console';

  @override
  String get consoleSubtitle => 'Patch DMX et outils GDTF';

  @override
  String get consolePatchTitle => 'Patch DMX';

  @override
  String get consolePatchSubtitle => 'Importer un MVR et analyser le patch';

  @override
  String get consoleGdtfTitle => 'GDTF';

  @override
  String get consoleGdtfSubtitle => 'Créer ou analyser un fichier GDTF';

  @override
  String lightFilterLedProfileSaved(String name) {
    return 'Perfil \"$name\" guardado';
  }

  @override
  String get lightFilterLedNoProfiles =>
      'No se ha guardado ningún perfil de fijación';

  @override
  String get lightFilterLedNoProfilesHint =>
      'Calibre los canales en la pestaña Conversión,\ny guárdalos con el icono 💾.';

  @override
  String get lightFilterLedTitle => 'Filtros LED a juego';

  @override
  String get lightFilterLedDescription =>
      'Conversión de filtros LEE, Rosco... a motores LED (RGB, RGBA, RGBW, etc.).';

  @override
  String get lightFilterLedBrandLabel => 'Marca';

  @override
  String get lightFilterLedSearchLabel => 'Buscar en';

  @override
  String get lightFilterLedSearchHint => 'Código o nombre del filtro';

  @override
  String get lightFilterLedFilterLabel => 'Filtro';

  @override
  String get lightFilterLedEngineLabel => 'Motor LED';

  @override
  String get lightFilterLedShowPercentLabel => 'Indicación en porcentaje';

  @override
  String get lightFilterLedShowPercentHint =>
      'De lo contrario, los valores se muestran en DMX 0-255.';

  @override
  String get lightFilterLedHexLabel => 'Color de referencia';

  @override
  String get lightFilterLedChromaticityLabel => 'Cromaticidad';

  @override
  String get lightFilterLedTransmissionLabel => 'Transmisión';

  @override
  String get lightFilterLedResultTitle => 'Resultados';

  @override
  String get lightFilterLedOriginalPreviewLabel => 'Resumen de filtros';

  @override
  String get lightFilterLedApproximatePreviewLabel =>
      'Visión general aproximada de los LED';

  @override
  String get lightFilterLedDisclaimer =>
      'Resultado meramente indicativo. La reproducción real depende del proyector, su espectro, calibración, modo de color y contexto de uso.';

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
  String get aboutSearchNoResults => 'No se han encontrado resultados.';

  @override
  String get homePinnedTitle => 'Alfileres';

  @override
  String get homePinnedSubtitle =>
      'Encuentra rápidamente tus referencias ancladas.';

  @override
  String get pinnedReferencesTitle => 'Referencias fijadas';

  @override
  String get pinnedReferencesEmpty => 'Aún no hay referencias fijadas.';

  @override
  String get aboutPinAddTooltip => 'Anclar esta referencia';

  @override
  String get aboutPinRemoveTooltip => 'Retire este pasador';

  @override
  String get aboutPinAddedMessage => 'Referencia anclada.';

  @override
  String get aboutPinRemovedMessage => 'Alfiler quitado.';

  @override
  String get homeDrawerSubscriptions => 'Suscripciones';

  @override
  String get subscriptionPageTitle => 'Suscripciones';

  @override
  String get subscriptionHeadlineAllTitle => 'Elige tu plan';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'Consulta aquí tus compras actuales y las suscripciones aún disponibles.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return 'Desbloquear $module';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'Puedes comprar solo Vídeo o elegir Pro para desbloquearlo todo.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'Puedes comprar solo Iluminación o elegir Pro para desbloquearlo todo.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'Puedes comprar solo Láser o elegir Pro para desbloquearlo todo.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'Puedes comprar solo Consola o elegir Pro para desbloquearlo todo.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Acceso completo a todas las secciones avanzadas.';

  @override
  String get subscriptionStoreUnavailable =>
      'Tienda no disponible en este momento.';

  @override
  String get subscriptionLoadError => 'No se pueden cargar las suscripciones.';

  @override
  String get subscriptionRestorePurchases => 'Restaurar mis compras';

  @override
  String get subscriptionPrivacy => 'Privacidad';

  @override
  String get subscriptionTerms => 'Términos';

  @override
  String get subscriptionBestValue => 'MEJOR VALOR';

  @override
  String get subscriptionOwned => 'Comprado';

  @override
  String get subscriptionIncludedInPro => 'Incluido en Pro';

  @override
  String get subscriptionProductUnavailable => 'Producto no disponible.';

  @override
  String get subscriptionSubscribeAll => 'Suscribirse — Desbloquear todo';

  @override
  String subscriptionSubscribeModule(Object module) {
    return 'Suscribirse — $module';
  }

  @override
  String get subscriptionCategoryVideoTitle => 'Vídeo';

  @override
  String get subscriptionCategoryLightTitle => 'Iluminación';

  @override
  String get subscriptionCategoryLaserTitle => 'Láser';

  @override
  String get subscriptionCategoryConsoleTitle => 'Consola';

  @override
  String get subscriptionCategoryProTitle => 'ShowTech Tools Pro';

  @override
  String get subscriptionCategoryVideoDescription =>
      'Acceso a la sección Vídeo.';

  @override
  String get subscriptionCategoryLightDescription =>
      'Acceso a la sección Iluminación.';

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
  String get electricityFreeSection => 'Gratuito';

  @override
  String get electricityProSection => 'Suscripción Electricidad';

  @override
  String get riggingFreeSection => 'Gratuito';

  @override
  String get riggingProSection => 'Suscripción Rigging';

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
  String get subscriptionCategoryRiggingTitle => '__TECNOLOGÍA_8__';

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
}
