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
  String get elecToc1 => 'Section 1';

  @override
  String get elecToc2 => 'Section 2';

  @override
  String get elecToc3 => 'Section 3';

  @override
  String get elecToc4 => 'Section 4';

  @override
  String get elecToc5 => 'Section 5';

  @override
  String get elecToc6 => 'Section 6';

  @override
  String get elecToc7 => 'Section 7';

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
  String get aboutUniverseToHexColHex => 'Hex';

  @override
  String get aboutUniverseToHexNote => 'Index = Univers − 1 (base 0).';

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
  String get sunTimesPageTitle => 'Lever / coucher du soleil';

  @override
  String get sunTimesSelectionTitle => 'Paramètres';

  @override
  String get sunTimesCityLabel => 'Cidade';

  @override
  String get sunTimesDateLabel => 'Data';

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
  String get sunTimesTitle => 'Nascer / pôr do sol';

  @override
  String get sunTimesParamsTitle => 'Configurações';

  @override
  String get sunTimesPickDate => 'Escolher data';

  @override
  String get sunTimesSunrise => 'Nascer do sol';

  @override
  String get sunTimesSunset => 'Pôr do sol';

  @override
  String get sunTimesDayLength => 'Duração do dia';

  @override
  String get sunTimesPolarNote =>
      'Se o sol não nascer/pôr (perto dos polos), o valor pode não estar disponível.';

  @override
  String get sunTimesLuxThresholdTitle =>
      'Limiares de luminosidade (indicativos)';

  @override
  String get sunTimesLuxBulletNightDark =>
      '~0.001–0.01 lux: Noite escura (sem lua).';

  @override
  String get sunTimesLuxBulletNightMoon =>
      '~0.01–0.1 lux: Noite com lua / céu limpo.';

  @override
  String get sunTimesLuxBulletFullMoon =>
      '~0.3 lux: Lua cheia (ordem de grandeza).';

  @override
  String get sunTimesLuxBulletCivilTwilight =>
      '~3.4 lux: Crepúsculo civil (sol a -6°).';

  @override
  String get sunTimesLuxBulletUrbanLow =>
      '~10–50 lux: Iluminação urbana fraca / manhã cedo.';

  @override
  String get sunTimesLuxBulletOfficeLow =>
      '~100 lux: Escritório fraco / corredor bem iluminado.';

  @override
  String get sunTimesLuxBulletOfficeStd => '~500 lux: Escritório “padrão”.';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      '~1 000–10 000 lux: Dia nublado a ensolarado.';

  @override
  String get sunTimesLuxBulletDirectSun =>
      '~100 000 lux: Sol direto (meio-dia, céu limpo).';

  @override
  String get sunTimesLuxDisclaimer =>
      '⚠️ Indicativo. Clima, obstáculos, latitude/altitude e exposição alteram bastante a iluminância real.';

  @override
  String get sunTimesTwilightTitle => 'Crepúsculos: o que significam?';

  @override
  String get sunTimesTwilightIntro =>
      'Os crepúsculos são definidos pelo ângulo do sol abaixo do horizonte, padronizando a transição entre dia e noite.';

  @override
  String get sunTimesTwilightCivil => 'Crepúsculo civil: sol entre 0° e -6°.';

  @override
  String get sunTimesTwilightNautical =>
      'Crepúsculo náutico: sol entre -6° e -12°.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Crepúsculo astronômico: sol entre -12° e -18°.';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Abaixo de -18°, geralmente é considerado “noite” (sem iluminação difusa do sol).';

  @override
  String get sunTimesLabelCity => 'Ville';

  @override
  String get sunTimesLabelDate => 'Date';

  @override
  String get sunTimesNoteApprox =>
      'Heures indicatives — peuvent varier selon l’altitude, la réfraction et la météo.';

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
  String get sunTimesSectionSettings => 'Paramètres';

  @override
  String get sunTimesIntro =>
      'Choisis une ville et une date. Les horaires sont indicatifs (arrondis).';

  @override
  String get sunTimesSectionResults => 'Résultats';

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
  String get sunTimesNoData => '—';

  @override
  String get sunTimesSectionTimeline => 'Timeline (pas de 30 min)';

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
  String get sunTimesSectionTwilight =>
      'À quoi correspondent les crépuscules ?';

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
  String get sunTimesSectionLux => 'Seuils de luminosité (repères)';

  @override
  String get sunTimesLuxNote =>
      'Ces valeurs sont des repères typiques (météo, saison, environnement → variations).';
}
