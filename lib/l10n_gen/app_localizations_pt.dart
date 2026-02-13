// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'Universos DMX sobre Ethernet/UDP, nodes, broadcast vs unicast.\nLimites reais, estabilidade de rede, RDM conforme hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX sobre IP (nodes, unicast/broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distâncias típicas, boas práticas em show.';

  @override
  String get aboutCablingFiberTitle =>
      'Rede — RJ45 / Fibra / débitos & distâncias';

  @override
  String get aboutComputingSubtitle =>
      'Débitos úteis, versões, limites reais, armadilhas de marketing.';

  @override
  String get aboutComputingTitle =>
      'Informática — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutDmxSubtitle =>
      'Universos, endereços, tramas, cablagem RS-485, terminação, erros de campo.\nInclui esquemas + checklist.';

  @override
  String get aboutDmxTitle => 'DMX — funcionamento (simples & completo)';

  @override
  String get aboutElectricitySubtitle =>
      'Conectores, mono/tri, tabelas rápidas de kW (16A→400A), armadilhas de campo.';

  @override
  String get aboutElectricityTitle => 'Elétrica — Schuko / P17 / potências';

  @override
  String get aboutIpBasicsSubtitle =>
      'Compreender IP, máscara, gateway, DHCP vs estático.\nExemplos concretos (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutIpBasicsTitle =>
      'Rede — bases IP / máscara / DHCP (essencial)';

  @override
  String get aboutLightNetworkSubtitle =>
      'Arquitetura simples e robusta para Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switches, esquemas + checklist.';

  @override
  String get aboutLightNetworkTitle => 'Rede luz — VLAN, IGMP, Wi-Fi vs cabo';

  @override
  String get aboutSacnSubtitle =>
      'Standard DMX sobre IP orientado a rede “pro”.\nMulticast/unicast, IGMP snooping/querier, prioridades multi-fontes.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — multicast, IGMP, prioridades';

  @override
  String get aboutVideoSubtitle =>
      'Escolher conforme latência, fiabilidade, cablagem, LAN vs WAN.\nTabelas + esquema.';

  @override
  String get aboutVideoTitle => 'Vídeo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get appTitle => 'Meu App Tech';

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
  String get commonCopyResultTooltip => 'Copiar o resultado';

  @override
  String get commonDash => '—';

  @override
  String get commonNone => 'Nenhum registo';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonRename => 'Renomear';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonSearch => 'Pesquisar';

  @override
  String get commonTooLowWithCross => 'Demasiado baixo ❌';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Consentimentos reiniciados.';

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
  String get disclaimerAccept => 'Aceito';

  @override
  String get disclaimerCertify => 'Certifico que li e aceitei estas condições.';

  @override
  String get disclaimerText =>
      'USO APENAS INDICATIVO\n\nOs cálculos fornecidos por esta aplicação (vídeo, luz, laser) são apresentados apenas para fins informativos e indicativos.\nNão substituem, em caso algum:\n- cálculos certificados,\n- estudos técnicos,\n- as normas oficiais em vigor,\n- nem a validação por um profissional qualificado.\n\nRESPONSABILIDADE\nO editor desta aplicação não pode ser responsabilizado por erros de cálculo, omissões, danos materiais,\nlesões corporais, ou qualquer incidente ocorrido durante a instalação, operação ou utilização dos equipamentos.\n\nVÍDEO & PROJEÇÃO\nOs resultados (tamanhos, rácios, luminosidade, overlaps, etc.) baseiam-se em modelos teóricos e podem variar conforme:\nótica, zoom, uniformidade, iluminação ambiente, suporte/superfície, afinações, etc.\nVerifica sempre a documentação oficial do fabricante.\n\nLUZ\nOs cálculos são indicativos e não têm em conta todas as condições reais (tolerâncias, perdas óticas,\ndegeneração das fontes, normas locais, condições ambientais…).\n\nLASER – SEGURANÇA\nOs cálculos NOHD, SZED e CZED baseiam-se em hipóteses padrão e limites teóricos.\nNão consideram, nomeadamente:\n- instrumentos óticos (binóculos, câmaras, telescópios…),\n- condições atmosféricas (nevoeiro, chuva, poeiras…),\n- reflexos imprevistos, usos indevidos, ajustes específicos.\nA utilização de um sistema laser implica responsabilidade direta do operador e uma análise de risco adequada.\n\nACEITAÇÃO DE RISCOS\nAo utilizar esta aplicação, o utilizador reconhece:\n- ter tomado conhecimento das regras de segurança aplicáveis,\n- ser o único responsável pelas suas instalações,\n- assumir a responsabilidade total pelos riscos ligados ao uso dos equipamentos (vídeo, luz, laser),\n- verificar sistematicamente os dados com os manuais oficiais do fabricante.';

  @override
  String get disclaimerTitle => '⚠️ AVISO LEGAL & ISENÇÃO DE RESPONSABILIDADE';

  @override
  String get homeLaserSubtitle =>
      'Cálculos e segurança laser (consentimento exigido a cada entrada).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Tamanho de projeção, dip-switch DMX, fotometria, catálogo, patch DMX.';

  @override
  String get homeLightTitle => 'Luz';

  @override
  String get homeReferencesSubtitle =>
      'DMX / rede / vídeo: fichas e referências de campo.';

  @override
  String get homeReferencesTitle => 'Referências';

  @override
  String get homeTitle => 'Início';

  @override
  String get homeVideoSubtitle =>
      'Lente e medição, luminosidade, multiprojetor, LED e padrões de teste.';

  @override
  String get homeVideoTitle => 'Vídeo';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Sistema (automático)';

  @override
  String get languageSystemCurrent => 'Idioma do telefone';

  @override
  String get laserAdviceFullPower => 'Potência total permitida (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Potência máxima recomendada: $percent';
  }

  @override
  String get laserConsentCheckboxLabel =>
      'J’accepte et je comprends les risques.';

  @override
  String get laserConsentContinue => 'Continuer';

  @override
  String get laserConsentText =>
      'ACESSO À PARTE LASER\n\nA parte LASER desta aplicação diz respeito a cálculos de segurança (ex.: NOHD, SZED, CZED).\nEstes cálculos são indicativos e não substituem:\n- uma análise de risco,\n- as normas em vigor,\n- os procedimentos de exploração/operação,\n- nem a validação por uma pessoa qualificada.\n\nIMPORTANTE\n- Risco de lesões oculares / cutâneas em caso de utilização inadequada.\n- O cálculo pode estar errado se os parâmetros introduzidos forem incompletos/errados ou se o contexto real diferir (ótica,\n  condições atmosféricas, reflexos, alinhamento, etc.).\n- O operador é o único responsável pela instalação, operação e conformidade.\n\nAo validar, confirmas:\n- compreender os riscos,\n- respeitar as regras de segurança aplicáveis,\n- assumir a responsabilidade total em caso de negligência ou mau uso.';

  @override
  String get laserConsentTitle => '🔴 CONSENTIMENTO LASER (OBRIGATÓRIO)';

  @override
  String get laserDiameterHint => 'ex: 3.0';

  @override
  String get laserDiameterLabel => 'Diâmetro de saída (mm)';

  @override
  String get laserDisclaimerShort =>
      'Cálculo indicativo. Não substitui uma análise de segurança laser.';

  @override
  String get laserDivergenceHint => 'ex: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergência (mrad)';

  @override
  String get laserInputsTitle => 'Entradas';

  @override
  String get laserInvalidInputs =>
      'Introduz valores válidos de potência, divergência e diâmetro.';

  @override
  String get laserNameUpdated => 'Nome atualizado.';

  @override
  String get laserNormativeParamsBody =>
      'MPE para a distância nominal de perigo ocular (NOHD): 25,4 W/m²\n(Norma IEC 60825-1, edição 3.0)\n\nMPE para a distância de exposição da zona sensível (SZED): 1 W/m²\n(Norma ANSI Z136.6)\n\nMPE para a distância de exposição da zona crítica (CZED): 0,05 W/m²\n(Norma ANSI Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Parâmetros de segurança utilizados';

  @override
  String get laserPowerHint => 'ex: 5000';

  @override
  String get laserPowerLabel => 'Potência (mW)';

  @override
  String get laserPresetAdded => 'Registo adicionado.';

  @override
  String get laserPresetDeleted => 'Registo eliminado.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Nome do projetor';

  @override
  String get laserRenameProjectorTitle => 'Renomear o projetor';

  @override
  String get laserSafetyResultsTitle => 'Resultados de segurança';

  @override
  String get laserSaveCurrentProjector => 'Guardar este projetor';

  @override
  String get laserSaveProjectorTitle => 'Guardar um projetor';

  @override
  String get laserSavedProjectorsTitle => 'Projetores guardados';

  @override
  String get laserSearchHint => 'ex: “RGB 5W”';

  @override
  String get laserTargetDistanceHint => 'ex: 10';

  @override
  String get laserTargetDistanceLabel => 'Distância alvo (m)';

  @override
  String get laserZoneCzedDesc => 'Zona crítica';

  @override
  String get laserZoneNohdDesc => 'Perigo ocular';

  @override
  String get laserZoneSzedDesc => 'Zona sensível';

  @override
  String get legalNotices => 'Avisos legais';

  @override
  String get lightCatalogDescription =>
      'Seleção por fabricante, tipo e produto, com informações e manual.';

  @override
  String get lightCatalogTitle => 'Catálogo';

  @override
  String get lightDisclaimerShort =>
      'Ferramentas indicativas. Verifica sempre a documentação do fabricante.';

  @override
  String get lightDmxSwitchDescription =>
      'Conversão indicativa entre endereço DMX e interruptores, com navegação por intervalos.';

  @override
  String get lightDmxSwitchTitle => 'Dip-switch DMX';

  @override
  String get lightPatchDescription =>
      'Importar um ficheiro MVR ou criar um patch manualmente a partir da biblioteca.';

  @override
  String get lightPatchTitle => 'Patch DMX';

  @override
  String get lightPhotometryDescription =>
      'Conversões indicativas entre lux, candela e lúmen, com distância e ângulo.';

  @override
  String get lightPhotometryTitle => 'Fotometria';

  @override
  String get lightProjectionDescription =>
      'Cálculo indicativo do tamanho da mancha conforme ângulo, distância e diâmetro.';

  @override
  String get lightProjectionTitle => 'Tamanho de projeção';

  @override
  String get menuTitle => 'Menu';

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireDash => '—';

  @override
  String get mireErrInvalidOverlap => '❌ Overlap inválido (0 a 99.9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Número de projetores inválido (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Largura/altura inválidas (px).';

  @override
  String get mireExportPng => 'Exportar PNG';

  @override
  String get mireHeightPxHint => 'ex: 1080';

  @override
  String get mireHeightPxHintMapping => 'ex: 2160';

  @override
  String get mireHeightPxLabel => 'Altura (px)';

  @override
  String get mireLedErrTileCm => '❌ Indica Tile cm (largura/altura >0).';

  @override
  String get mireLedErrTilePx => '❌ Indica Tile px (largura/altura >0).';

  @override
  String get mireLedErrTilesXY => '❌ Indica Tiles X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'Parâmetros do wall LED';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Pitch calculado: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedSubtitleGridLabels => 'Grelha + referências + círculos';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedSubtitleUniformity => 'Uniformidade + círculos';

  @override
  String get mireLedTileHcmLabel => 'Tile altura (cm)';

  @override
  String get mireLedTileHpxLabel => 'Tile altura (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile largura (cm)';

  @override
  String get mireLedTileWpxLabel => 'Tile largura (px)';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireLedTilesXLabel => 'Tiles horizontais (X)';

  @override
  String get mireLedTilesYLabel => 'Tiles verticais (Y)';

  @override
  String get mireLedTitle => 'LED / PADRÃO';

  @override
  String get mireLedTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedTypeGridLabels => 'Grelha + referências + círculos';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedTypeTilesId => 'Tiles ID (número + cores)';

  @override
  String get mireLedTypeUniformity => 'Uniformidade + círculos';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Resolução do wall: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Pitch calculado fora do intervalo (0.5–20 mm). Verifica Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (tile não homogénea). Verifica dimensões em cm e px.';

  @override
  String get mireMappingSectionTitle => 'Padrão mapping multiprojetor';

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
  String get mireOrientationLabel => 'Orientação';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String get mireOverlapHint => 'ex: 10.0';

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
    return 'PROJO $index';
  }

  @override
  String get mireProjectorsNHint => 'ex: 2';

  @override
  String get mireProjectorsNLabel => 'Número de projetores (N)';

  @override
  String get mireSimpleSectionTitle => 'Padrão ecrã simples';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Xadrez + círculos';

  @override
  String get mireSimpleSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Grelha + safe + 2 barras centradas + círculos';

  @override
  String get mireSimpleSubtitleGridSafe => 'Grelha + safe + círculos';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformidade + círculos';

  @override
  String get mireSimpleTypeCheckerboard => 'Xadrez + círculos';

  @override
  String get mireSimpleTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (grelha + círculos + 2 barras centradas)';

  @override
  String get mireSimpleTypeGridSafe => 'Grelha + safe + círculos';

  @override
  String get mireSimpleTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireTileMissingPx => 'Indica Tile (px) para numeração.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px • Grelha $nx x $ny';
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
    return 'Wall ~ $wm×$hm m';
  }

  @override
  String get mireTypeLabel => 'Tipo de padrão';

  @override
  String get mireVideoComboTitle => 'VÍDEO / PADRÃO COMBO';

  @override
  String get mireVideoMappingSectionTitle => 'Padrão mapping multiprojetor';

  @override
  String get mireVideoMappingTitle => 'VÍDEO / PADRÃO MAPPING';

  @override
  String get mireVideoSimpleSectionTitle => 'Padrão ecrã simples';

  @override
  String get mireVideoSimpleTitle => 'VÍDEO / PADRÃO SIMPLES';

  @override
  String get mireVideoTypeCheckerboard => 'Xadrez + círculos';

  @override
  String get mireVideoTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoTypeCombo =>
      'Combo (grelha + círculos + 2 barras centradas)';

  @override
  String get mireVideoTypeGridSafe => 'Grelha + safe + círculos';

  @override
  String get mireVideoTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireWallNotMultipleOfTiles => 'WALL NÃO MÚLTIPLO DE TILES';

  @override
  String get mireWidthPxHint => 'ex: 1920';

  @override
  String get mireWidthPxHintMapping => 'ex: 3840';

  @override
  String get mireWidthPxLabel => 'Largura (px)';

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
  String get resetConsents => 'Reiniciar consentimentos';

  @override
  String get settings => 'Configurações';

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
    return 'Formato: $format\nÁrea: $area m²\nLux (lm/m²): $lux\nLux eq (ganho): $luxEq\nLuminância: $nits nits | $fl ft-L\nLimiar mínimo ($presetLabel): $minFl ft-L → $status\nNota: estimativa indicativa (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle =>
      'Cálculo 4 — Lux / nits / ft-L + limiar';

  @override
  String get videoBrightnessSubtitle =>
      'Lux / nits / ft-L + limiar (cálculo 4).';

  @override
  String get videoBrightnessTitle => 'Luminosidade';

  @override
  String get videoCalc1ErrMissing => '❌ Dados em falta: Distância + Largura.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Rácio de projeção = $ratio';
  }

  @override
  String get videoCalc1Title => 'Cálculo 1 — Rácio (Distância / Largura)';

  @override
  String get videoCalc2ErrMissing => '❌ Dados em falta: Distância + Rácio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Largura da imagem = $width m';
  }

  @override
  String get videoCalc2Title => 'Cálculo 2 — Largura (Distância / Rácio)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Dado em falta: Largura.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String get videoCalc3Title => 'Cálculo 3 — Altura (Largura + Formato)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lúmens/Ganho/Largura devem ser > 0.';

  @override
  String get videoCalc4ErrMissing =>
      '❌ Dados em falta: Lúmens + Ganho + Largura.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Dados em falta: Largura + Lúmens + Ganho.';

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
    return 'Área: $area m² (formato $format)\nLux (lm/m²): $lux\nLux eq (ganho): $luxEq\nLuminância: $nits nits | $fl ft-L\nLimiar mínimo ($presetLabel): $minFl ft-L → $status\nNota: conversão nits/ft-L baseada numa hipótese Lambertiana (aprox).';
  }

  @override
  String get videoCalc4Title =>
      'Cálculo 4 — Luminosidade (lux / nits / ft-L + limiar)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Dados em falta: Largura total + Overlap% + Número de projetores.';

  @override
  String get videoCalc5ErrNMin2 => '❌ O número de projetores deve ser ≥ 2.';

  @override
  String get videoCalc5NHint => 'ex: 2';

  @override
  String get videoCalc5NLabel => 'Número de projetores (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Largura total: $wTot m\nN: $n | Overlap: $overlapPct% (sobre a largura do projetor)\n\n- Largura por projetor: $wPer m\n- Overlap entre 2 projetores: $overlapM m\n- Altura total (formato $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Cálculo 5 — Overlap (Largura total + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Dados em falta: Largura total + Distância + Overlap%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Dados em falta: Rácio min e/ou Rácio max.';

  @override
  String get videoCalc6GainHint => 'ex: 1.0';

  @override
  String get videoCalc6GainLabel => 'Ganho (calc 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lúmens por projetor';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Luminosidade: ❌ Lúmens/projetor e ganho devem ser > 0.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosidade estimada (N=$n)\nÁrea: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Luminosidade (opcional): indica Lúmens/projetor + Ganho para a estimativa.';

  @override
  String get videoCalc6NoteIndicative =>
      'Nota: estimativa indicativa (blend/overlap reais podem reduzir um pouco).';

  @override
  String get videoCalc6RatioMaxHint => 'ex: 1.80';

  @override
  String get videoCalc6RatioMaxLabel => 'Rácio max';

  @override
  String get videoCalc6RatioMinHint => 'ex: 1.20';

  @override
  String get videoCalc6RatioMinLabel => 'Rácio min';

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
    return 'Largura total=$wTot m | Distância=$distance m | Overlap=$overlapPct%\nFormato $format → Altura total=$hTot m | Área=$area m²\nRácio min/max: $ratioMin → $ratioMax\n\nCaso rácio mais aberto (min) = $nMin projetores | cobertura ≈ $covMin m\n$lumiMin\n\nCaso rácio mais fechado (max) = $nMax projetores | cobertura ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'Cálculo 6 — Nº projetores auto + luminosidade';

  @override
  String videoCalcLabel(Object n) {
    return 'Cálculo $n';
  }

  @override
  String get videoCalculateAll => 'Calcular tudo';

  @override
  String get videoCalculationsTitle => 'Cálculos de vídeo';

  @override
  String get videoCommonParamsTitle => 'Parâmetros comuns';

  @override
  String videoCommonPillArea(Object value) {
    return 'Área: $value';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Distância: $value';
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
    return 'Overlap: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Rácio: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Largura total: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Largura: $value';
  }

  @override
  String get videoCopyAllTooltip => 'Copiar todos os resultados';

  @override
  String get videoCopySummaryTooltip => 'Copiar o resumo';

  @override
  String get videoDisclaimerShort =>
      'Cálculos indicativos. Verifica sempre a documentação do fabricante.';

  @override
  String get videoDistanceHint => 'ex: 12.0';

  @override
  String get videoDistanceLabel => 'Distância de projeção (m)';

  @override
  String get videoErrImpossibleDenom => '❌ Parâmetros impossíveis (denom ≤ 0).';

  @override
  String get videoErrOverlapRange => '❌ Overlap% deve estar entre 0 e 99.9.';

  @override
  String get videoErrRatioGt0 => '❌ O rácio deve ser > 0.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ A largura total e a distância devem ser > 0.';

  @override
  String get videoErrTotalWidthGt0 => '❌ A largura total deve ser > 0.';

  @override
  String get videoErrWidthGt0 => '❌ A largura deve ser > 0.';

  @override
  String get videoExportPdfTooltip => 'Exportar PDF';

  @override
  String get videoFormatLabel => 'Formato (rácio)';

  @override
  String get videoGainHint => 'ex: 1.0';

  @override
  String get videoGainLabel => 'Ganho';

  @override
  String get videoImageWidthHint => 'ex: 6.0';

  @override
  String get videoImageWidthLabel => 'Largura da imagem (m)';

  @override
  String get videoLedCalcTitle => 'Cálculo — Píxeis / tiles';

  @override
  String get videoLedErrAllGt0 => '❌ Todos os valores devem ser > 0.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Dados em falta: Tiles X/Y + Tile px + Tile cm.';

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
    return '✅ Resolução do wall: $wallWpx × $wallHpx px\n✅ Tamanho do wall: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nPitch calculado: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Píxeis do wall LED conforme tamanho, pitch e dimensões das tiles.';

  @override
  String get videoLedTileHcmHint => 'ex: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile altura (cm)';

  @override
  String get videoLedTileHpxHint => 'ex: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile altura (px)';

  @override
  String get videoLedTileWcmHint => 'ex: 33.28';

  @override
  String get videoLedTileWcmLabel => 'Tile largura (cm)';

  @override
  String get videoLedTileWpxHint => 'ex: 128';

  @override
  String get videoLedTileWpxLabel => 'Tile largura (px)';

  @override
  String get videoLedTilesXHint => 'ex: 15';

  @override
  String get videoLedTilesXLabel => 'Tiles horizontais (X)';

  @override
  String get videoLedTilesYHint => 'ex: 8';

  @override
  String get videoLedTilesYLabel => 'Tiles verticais (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Rácio / largura / altura (cálculos 1 a 3).';

  @override
  String get videoLensMeasureTitle => 'Lente & medição';

  @override
  String get videoLmCalc1Title => 'Cálculo 1 — Rácio (Distância / Largura)';

  @override
  String get videoLmCalc2Title => 'Cálculo 2 — Largura (Distância / Rácio)';

  @override
  String get videoLmCalc3Title => 'Cálculo 3 — Altura (Largura + Formato)';

  @override
  String get videoLmDistanceHint => 'ex: 12.0';

  @override
  String get videoLmDistanceLabel => 'Distância de projeção (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Dados em falta: Distância + Rácio.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Dados em falta: Distância + Largura.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Dado em falta: Largura.';

  @override
  String get videoLmErrRatioGt0 => '❌ O rácio deve ser > 0.';

  @override
  String get videoLmErrWidthGt0 => '❌ A largura deve ser > 0.';

  @override
  String get videoLmFormatLabel => 'Formato (rácio)';

  @override
  String get videoLmImageWidthHint => 'ex: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Largura de imagem (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Rácio de projeção = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Largura da imagem = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'ex: 1.60';

  @override
  String get videoLmThrowRatioLabel => 'Rácio de projeção';

  @override
  String get videoLumensHint => 'ex: 20000';

  @override
  String get videoLumensLabel => 'Lúmens (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Padrões indicativos (alinhamento, foco, geometria, blend, pixel perfect).';

  @override
  String get videoMireHeaderTitle => 'Gerador de padrões';

  @override
  String get videoMireScreenLedSubtitle =>
      'Padrão conforme LxA px (pixel perfect, uniformidade, grelha).';

  @override
  String get videoMireScreenLedTitle => 'Padrão ecrã LED';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simples (LxA px) + mapping multiprojetor (N + overlap).';

  @override
  String get videoMireScreenVideoTitle => 'Padrão ecrã vídeo';

  @override
  String get videoMireTitle => 'Padrão';

  @override
  String get videoMpCalc5Title => 'Cálculo 5 — Largura por projetor';

  @override
  String get videoMpCalc6Title =>
      'Cálculo 6 — Nº de projetores (rácio min/max)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Caso rácio mais aberto (min) = $n projetores | cobertura ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Caso rácio mais fechado (max) = $n projetores | cobertura ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'ex: 12.0';

  @override
  String get videoMpDistanceLabel => 'Distância de projeção (m)';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Parâmetros impossíveis (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => '❌ Rácio inválido (deve ser > 0).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Dados em falta: Largura total + Overlap% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Dados em falta: Largura total + Distância + Overlap%.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Dados em falta: Rácio min e/ou Rácio max.';

  @override
  String get videoMpErrNGte2 => '❌ N deve ser ≥ 2.';

  @override
  String get videoMpErrOverlapRange => '❌ Overlap% deve estar entre 0 e 99.9.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ A largura total e a distância devem ser > 0.';

  @override
  String get videoMpErrWidthGt0 => '❌ A largura total deve ser > 0.';

  @override
  String get videoMpFormatLabel => 'Formato (rácio)';

  @override
  String get videoMpGainHint => 'ex: 1.0';

  @override
  String get videoMpGainLabel => 'Ganho';

  @override
  String get videoMpLumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lúmens por projetor';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Luminosidade: ❌ Lúmens/projetor e ganho devem ser > 0.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosidade estimada (N=$n)\nÁrea: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Luminosidade (opcional): indica Lúmens/projetor + Ganho para estimar.';

  @override
  String get videoMpNoteIndicative => 'Nota: estimativa indicativa.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Opcional: luminosidade';

  @override
  String get videoMpOverlapHint => 'ex: 10';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpProjectorCountLabel => 'Número de projetores (N)';

  @override
  String get videoMpRatioMaxHint => 'ex: 1.80';

  @override
  String get videoMpRatioMaxLabel => 'Rácio max';

  @override
  String get videoMpRatioMinHint => 'ex: 1.20';

  @override
  String get videoMpRatioMinLabel => 'Rácio min';

  @override
  String get videoMpTotalWidthHint => 'ex: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Largura total de projeção (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + largura/projetor + número de projetores (cálculos 5 & 6).';

  @override
  String get videoMultiprojectorTitle => 'Multiprojetor';

  @override
  String get videoOptionalBrightnessTitle => 'Opcional: luminosidade';

  @override
  String get videoOverlapHint => 'ex: 10';

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
  String get videoPdfCalc5N => 'N (calc5)';

  @override
  String get videoPdfCalc6 => 'Cálculo 6';

  @override
  String get videoPdfCalc6Gain => 'Ganho (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lúmens/projetor (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Rácio max (calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Rácio min (calc6)';

  @override
  String get videoPdfDate => 'Data';

  @override
  String get videoPdfDistance => 'Distância (m)';

  @override
  String get videoPdfFormat => 'Formato';

  @override
  String get videoPdfGain => 'Ganho';

  @override
  String get videoPdfImageWidth => 'Largura da imagem (m)';

  @override
  String get videoPdfLumens => 'Lúmens';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfParams => 'Parâmetros';

  @override
  String get videoPdfRatio => 'Rácio';

  @override
  String get videoPdfResults => 'Resultados';

  @override
  String get videoPdfScreenPreset => 'Preset ecrã';

  @override
  String get videoPdfTitle => 'Mon App Technique – Export Vídeo';

  @override
  String get videoPdfTotalWidth => 'Largura total (m)';

  @override
  String get videoPresetFrontGrey => 'Frontal - ecrã cinzento (ganho 0.8)';

  @override
  String get videoPresetFrontGreyShort => 'Frontal - ecrã cinzento';

  @override
  String get videoPresetFrontHighGain => 'Frontal - ecrã high gain (ganho 1.3)';

  @override
  String get videoPresetFrontHighGainShort => 'Frontal - ecrã high gain';

  @override
  String get videoPresetFrontWhite => 'Frontal - ecrã branco mate (ganho 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Frontal - ecrã branco mate';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping - pedra escura (ganho 0.35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping - pedra escura';

  @override
  String get videoPresetMappingGlass => 'Mapping - vidro (ganho 0.15)';

  @override
  String get videoPresetMappingGlassShort => 'Mapping - vidro';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping - pedra clara (ganho 0.6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping - pedra clara';

  @override
  String get videoPresetMappingMatte => 'Mapping - tinta mate (ganho 0.75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - tinta mate';

  @override
  String get videoPresetMappingSatin => 'Mapping - tinta acetinada (ganho 0.9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - tinta acetinada';

  @override
  String get videoPresetRearClear => 'Retro - tela clara (ganho 0.9)';

  @override
  String get videoPresetRearClearShort => 'Retro - tela clara';

  @override
  String get videoPresetRearDiffusion => 'Retro - tela de difusão (ganho 0.7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - tela de difusão';

  @override
  String get videoScreenPresetLabel => 'Ecrã / Superfície (preset)';

  @override
  String get videoSummaryPillsTitle => 'Resumo (pastilhas)';

  @override
  String get videoTestPatternSubtitle =>
      'Criação de padrões de teste para ecrãs e walls LED (mais tarde).';

  @override
  String get videoTestPatternTitle => 'Padrão de teste';

  @override
  String get videoThrowRatioHint => 'ex: 1.60';

  @override
  String get videoThrowRatioLabel => 'Rácio de projeção';

  @override
  String get videoTitle => 'Vídeo';

  @override
  String get videoToolsTitle => 'Ferramentas de vídeo';

  @override
  String get videoTotalWidthHint => 'ex: 18.0';

  @override
  String get videoTotalWidthLabel => 'Largura total de projeção (m)';
}
