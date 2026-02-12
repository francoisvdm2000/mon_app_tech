// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Meu App Tech';

  @override
  String get homeTitle => 'Início';

  @override
  String get menuTitle => 'Menu';

  @override
  String get settings => 'Configurações';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Sistema (automático)';

  @override
  String get languageSystemCurrent => 'Idioma do telefone';

  @override
  String get legalNotices => 'Avisos legais';

  @override
  String get resetConsents => 'Reiniciar consentimentos';

  @override
  String get consentsReset => 'Consentimentos reiniciados.';

  @override
  String get homeVideoTitle => 'Vídeo';

  @override
  String get homeVideoSubtitle =>
      'Lente e medição, luminosidade, multiprojetor, LED e padrões de teste.';

  @override
  String get homeLightTitle => 'Luz';

  @override
  String get homeLightSubtitle =>
      'Tamanho de projeção, dip-switch DMX, fotometria, catálogo, patch DMX.';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLaserSubtitle =>
      'Cálculos e segurança laser (consentimento exigido a cada entrada).';

  @override
  String get homeReferencesTitle => 'Referências';

  @override
  String get homeReferencesSubtitle =>
      'DMX / rede / vídeo: fichas e referências de campo.';

  @override
  String get disclaimerTitle => '⚠️ AVISO LEGAL & ISENÇÃO DE RESPONSABILIDADE';

  @override
  String get disclaimerText =>
      'USO APENAS INDICATIVO\n\nOs cálculos fornecidos por esta aplicação (vídeo, luz, laser) são apresentados apenas para fins informativos e indicativos.\nNão substituem, em caso algum:\n- cálculos certificados,\n- estudos técnicos,\n- as normas oficiais em vigor,\n- nem a validação por um profissional qualificado.\n\nRESPONSABILIDADE\nO editor desta aplicação não pode ser responsabilizado por erros de cálculo, omissões, danos materiais,\nlesões corporais, ou qualquer incidente ocorrido durante a instalação, operação ou utilização dos equipamentos.\n\nVÍDEO & PROJEÇÃO\nOs resultados (tamanhos, rácios, luminosidade, overlaps, etc.) baseiam-se em modelos teóricos e podem variar conforme:\nótica, zoom, uniformidade, iluminação ambiente, suporte/superfície, afinações, etc.\nVerifica sempre a documentação oficial do fabricante.\n\nLUZ\nOs cálculos são indicativos e não têm em conta todas as condições reais (tolerâncias, perdas óticas,\ndegeneração das fontes, normas locais, condições ambientais…).\n\nLASER – SEGURANÇA\nOs cálculos NOHD, SZED e CZED baseiam-se em hipóteses padrão e limites teóricos.\nNão consideram, nomeadamente:\n- instrumentos óticos (binóculos, câmaras, telescópios…),\n- condições atmosféricas (nevoeiro, chuva, poeiras…),\n- reflexos imprevistos, usos indevidos, ajustes específicos.\nA utilização de um sistema laser implica responsabilidade direta do operador e uma análise de risco adequada.\n\nACEITAÇÃO DE RISCOS\nAo utilizar esta aplicação, o utilizador reconhece:\n- ter tomado conhecimento das regras de segurança aplicáveis,\n- ser o único responsável pelas suas instalações,\n- assumir a responsabilidade total pelos riscos ligados ao uso dos equipamentos (vídeo, luz, laser),\n- verificar sistematicamente os dados com os manuais oficiais do fabricante.';

  @override
  String get disclaimerCertify => 'Certifico que li e aceitei estas condições.';

  @override
  String get disclaimerAccept => 'Aceito';

  @override
  String get laserConsentTitle => '🔴 CONSENTIMENTO LASER (OBRIGATÓRIO)';

  @override
  String get laserConsentText =>
      'ACESSO À PARTE LASER\n\nA parte LASER desta aplicação diz respeito a cálculos de segurança (ex.: NOHD, SZED, CZED).\nEstes cálculos são indicativos e não substituem:\n- uma análise de risco,\n- as normas em vigor,\n- os procedimentos de exploração/operação,\n- nem a validação por uma pessoa qualificada.\n\nIMPORTANTE\n- Risco de lesões oculares / cutâneas em caso de utilização inadequada.\n- O cálculo pode estar errado se os parâmetros introduzidos forem incompletos/errados ou se o contexto real diferir (ótica,\n  condições atmosféricas, reflexos, alinhamento, etc.).\n- O operador é o único responsável pela instalação, operação e conformidade.\n\nAo validar, confirmas:\n- compreender os riscos,\n- respeitar as regras de segurança aplicáveis,\n- assumir a responsabilidade total em caso de negligência ou mau uso.';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonRename => 'Renomear';

  @override
  String get commonSearch => 'Pesquisar';

  @override
  String get commonNone => 'Nenhum registo';

  @override
  String get commonCalculate => 'Calcular';

  @override
  String get commonCopyResultTooltip => 'Copiar o resultado';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonTooLowWithCross => 'Demasiado baixo ❌';

  @override
  String get lightProjectionTitle => 'Tamanho de projeção';

  @override
  String get lightProjectionDescription =>
      'Cálculo indicativo do tamanho da mancha conforme ângulo, distância e diâmetro.';

  @override
  String get lightDmxSwitchTitle => 'Dip-switch DMX';

  @override
  String get lightDmxSwitchDescription =>
      'Conversão indicativa entre endereço DMX e interruptores, com navegação por intervalos.';

  @override
  String get lightPhotometryTitle => 'Fotometria';

  @override
  String get lightPhotometryDescription =>
      'Conversões indicativas entre lux, candela e lúmen, com distância e ângulo.';

  @override
  String get lightCatalogTitle => 'Catálogo';

  @override
  String get lightCatalogDescription =>
      'Seleção por fabricante, tipo e produto, com informações e manual.';

  @override
  String get lightPatchTitle => 'Patch DMX';

  @override
  String get lightPatchDescription =>
      'Importar um ficheiro MVR ou criar um patch manualmente a partir da biblioteca.';

  @override
  String get lightDisclaimerShort =>
      'Ferramentas indicativas. Verifica sempre a documentação do fabricante.';

  @override
  String get laserInputsTitle => 'Entradas';

  @override
  String get laserPowerLabel => 'Potência (mW)';

  @override
  String get laserPowerHint => 'ex: 5000';

  @override
  String get laserDivergenceLabel => 'Divergência (mrad)';

  @override
  String get laserDivergenceHint => 'ex: 1.2';

  @override
  String get laserDiameterLabel => 'Diâmetro de saída (mm)';

  @override
  String get laserDiameterHint => 'ex: 3.0';

  @override
  String get laserSaveCurrentProjector => 'Guardar este projetor';

  @override
  String get laserSafetyResultsTitle => 'Resultados de segurança';

  @override
  String get laserZoneNohdDesc => 'Perigo ocular';

  @override
  String get laserZoneSzedDesc => 'Zona sensível';

  @override
  String get laserZoneCzedDesc => 'Zona crítica';

  @override
  String get laserTargetDistanceLabel => 'Distância alvo (m)';

  @override
  String get laserTargetDistanceHint => 'ex: 10';

  @override
  String get laserAdviceFullPower => 'Potência total permitida (100 %)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Potência máxima recomendada: $percent';
  }

  @override
  String get laserSavedProjectorsTitle => 'Projetores guardados';

  @override
  String get laserSearchHint => 'ex: “RGB 5W”';

  @override
  String laserPresetSubtitle(Object p, Object div, Object diam) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserSaveProjectorTitle => 'Guardar um projetor';

  @override
  String get laserRenameProjectorTitle => 'Renomear o projetor';

  @override
  String get laserProjectorNameLabel => 'Nome do projetor';

  @override
  String get laserInvalidInputs =>
      'Introduz valores válidos de potência, divergência e diâmetro.';

  @override
  String get laserPresetAdded => 'Registo adicionado.';

  @override
  String get laserPresetDeleted => 'Registo eliminado.';

  @override
  String get laserNameUpdated => 'Nome atualizado.';

  @override
  String get laserNormativeParamsTitle => 'Parâmetros de segurança utilizados';

  @override
  String get laserNormativeParamsBody =>
      'MPE para a distância nominal de perigo ocular (NOHD): 25,4 W/m²\n(Norma IEC 60825-1, edição 3.0)\n\nMPE para a distância de exposição da zona sensível (SZED): 1 W/m²\n(Norma ANSI Z136.6)\n\nMPE para a distância de exposição da zona crítica (CZED): 0,05 W/m²\n(Norma ANSI Z136.6)';

  @override
  String get laserDisclaimerShort =>
      'Cálculo indicativo. Não substitui uma análise de segurança laser.';

  @override
  String get aboutDmxTitle => 'DMX — funcionamento (simples & completo)';

  @override
  String get aboutDmxSubtitle =>
      'Universos, endereços, tramas, cablagem RS-485, terminação, erros de campo.\nInclui esquemas + checklist.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX sobre IP (nodes, unicast/broadcast)';

  @override
  String get aboutArtNetSubtitle =>
      'Universos DMX sobre Ethernet/UDP, nodes, broadcast vs unicast.\nLimites reais, estabilidade de rede, RDM conforme hardware.';

  @override
  String get aboutSacnTitle => 'sACN / E1.31 — multicast, IGMP, prioridades';

  @override
  String get aboutSacnSubtitle =>
      'Standard DMX sobre IP orientado a rede “pro”.\nMulticast/unicast, IGMP snooping/querier, prioridades multi-fontes.';

  @override
  String get aboutIpBasicsTitle =>
      'Rede — bases IP / máscara / DHCP (essencial)';

  @override
  String get aboutIpBasicsSubtitle =>
      'Compreender IP, máscara, gateway, DHCP vs estático.\nExemplos concretos (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutLightNetworkTitle => 'Rede luz — VLAN, IGMP, Wi-Fi vs cabo';

  @override
  String get aboutLightNetworkSubtitle =>
      'Arquitetura simples e robusta para Art-Net/sACN.\nVLAN, IGMP snooping/querier, Wi-Fi (jitter), switches, esquemas + checklist.';

  @override
  String get aboutCablingFiberTitle =>
      'Rede — RJ45 / Fibra / débitos & distâncias';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distâncias típicas, boas práticas em show.';

  @override
  String get aboutVideoTitle => 'Vídeo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutVideoSubtitle =>
      'Escolher conforme latência, fiabilidade, cablagem, LAN vs WAN.\nTabelas + esquema.';

  @override
  String get aboutElectricityTitle => 'Elétrica — Schuko / P17 / potências';

  @override
  String get aboutElectricitySubtitle =>
      'Conectores, mono/tri, tabelas rápidas de kW (16A→400A), armadilhas de campo.';

  @override
  String get aboutComputingTitle =>
      'Informática — USB / HDMI / DP / SATA / NVMe…';

  @override
  String get aboutComputingSubtitle =>
      'Débitos úteis, versões, limites reais, armadilhas de marketing.';

  @override
  String get videoTitle => 'Vídeo';

  @override
  String get videoToolsTitle => 'Ferramentas de vídeo';

  @override
  String get videoDisclaimerShort =>
      'Cálculos indicativos. Verifica sempre a documentação do fabricante.';

  @override
  String get videoLensMeasureTitle => 'Lente & medição';

  @override
  String get videoLensMeasureSubtitle =>
      'Rácio / largura / altura (cálculos 1 a 3).';

  @override
  String get videoBrightnessTitle => 'Luminosidade';

  @override
  String get videoBrightnessSubtitle =>
      'Lux / nits / ft-L + limiar (cálculo 4).';

  @override
  String get videoMultiprojectorTitle => 'Multiprojetor';

  @override
  String get videoMultiprojectorSubtitle =>
      'Overlap + largura/projetor + número de projetores (cálculos 5 & 6).';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLedSubtitle =>
      'Píxeis do wall LED conforme tamanho, pitch e dimensões das tiles.';

  @override
  String get videoTestPatternTitle => 'Padrão de teste';

  @override
  String get videoTestPatternSubtitle =>
      'Criação de padrões de teste para ecrãs e walls LED (mais tarde).';

  @override
  String get videoMpFormatLabel => 'Formato (rácio)';

  @override
  String get videoMpCalc5Title => 'Cálculo 5 — Largura por projetor';

  @override
  String get videoMpCalc6Title =>
      'Cálculo 6 — Nº de projetores (rácio min/max)';

  @override
  String get videoMpTotalWidthLabel => 'Largura total de projeção (m)';

  @override
  String get videoMpTotalWidthHint => 'ex: 18.0';

  @override
  String get videoMpDistanceLabel => 'Distância de projeção (m)';

  @override
  String get videoMpDistanceHint => 'ex: 12.0';

  @override
  String get videoMpOverlapLabel => 'Overlap (%)';

  @override
  String get videoMpOverlapHint => 'ex: 10';

  @override
  String get videoMpProjectorCountLabel => 'Número de projetores (N)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpRatioMinLabel => 'Rácio min';

  @override
  String get videoMpRatioMinHint => 'ex: 1.20';

  @override
  String get videoMpRatioMaxLabel => 'Rácio max';

  @override
  String get videoMpRatioMaxHint => 'ex: 1.80';

  @override
  String get videoMpOptionalLuminanceTitle => 'Opcional: luminosidade';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lúmens por projetor';

  @override
  String get videoMpLumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoMpGainLabel => 'Ganho';

  @override
  String get videoMpGainHint => 'ex: 1.0';

  @override
  String get videoMpErrMissing5 =>
      '❌ Dados em falta: Largura total + Overlap% + N.';

  @override
  String get videoMpErrWidthGt0 => '❌ A largura total deve ser > 0.';

  @override
  String get videoMpErrNGte2 => '❌ N deve ser ≥ 2.';

  @override
  String get videoMpErrOverlapRange => '❌ Overlap% deve estar entre 0 e 99.9.';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Parâmetros impossíveis (denom ≤ 0).';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Dados em falta: Largura total + Distância + Overlap%.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ A largura total e a distância devem ser > 0.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Dados em falta: Rácio min e/ou Rácio max.';

  @override
  String get videoMpErrInvalidRatio => '❌ Rácio inválido (deve ser > 0).';

  @override
  String get videoMpLumiOptionalHint =>
      'Luminosidade (opcional): indica Lúmens/projetor + Ganho para estimar.';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Luminosidade: ❌ Lúmens/projetor e ganho devem ser > 0.';

  @override
  String videoMpCaseOpenMin(Object n, Object coverage) {
    return 'Caso rácio mais aberto (min) = $n projetores | cobertura ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object n, Object coverage) {
    return 'Caso rácio mais fechado (max) = $n projetores | cobertura ≈ $coverage m';
  }

  @override
  String videoMpLumiEstimated(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Luminosidade estimada (N=$n)\nÁrea: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpNoteIndicative => 'Nota: estimativa indicativa.';

  @override
  String get videoLmFormatLabel => 'Formato (rácio)';

  @override
  String get videoLmCalc1Title => 'Cálculo 1 — Rácio (Distância / Largura)';

  @override
  String get videoLmCalc2Title => 'Cálculo 2 — Largura (Distância / Rácio)';

  @override
  String get videoLmCalc3Title => 'Cálculo 3 — Altura (Largura + Formato)';

  @override
  String get videoLmDistanceLabel => 'Distância de projeção (m)';

  @override
  String get videoLmDistanceHint => 'ex: 12.0';

  @override
  String get videoLmImageWidthLabel => 'Largura de imagem (m)';

  @override
  String get videoLmImageWidthHint => 'ex: 6.0';

  @override
  String get videoLmThrowRatioLabel => 'Rácio de projeção';

  @override
  String get videoLmThrowRatioHint => 'ex: 1.60';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Dados em falta: Distância + Largura.';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Dados em falta: Distância + Rácio.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Dado em falta: Largura.';

  @override
  String get videoLmErrWidthGt0 => '❌ A largura deve ser > 0.';

  @override
  String get videoLmErrRatioGt0 => '❌ O rácio deve ser > 0.';

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Rácio de projeção = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Largura da imagem = $width m';
  }

  @override
  String videoLmResultHeight(Object height, Object format) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String get videoLedCalcTitle => 'Cálculo — Píxeis / tiles';

  @override
  String get videoLedTilesXLabel => 'Tiles horizontais (X)';

  @override
  String get videoLedTilesXHint => 'ex: 15';

  @override
  String get videoLedTilesYLabel => 'Tiles verticais (Y)';

  @override
  String get videoLedTilesYHint => 'ex: 8';

  @override
  String get videoLedTileWpxLabel => 'Tile largura (px)';

  @override
  String get videoLedTileWpxHint => 'ex: 128';

  @override
  String get videoLedTileHpxLabel => 'Tile altura (px)';

  @override
  String get videoLedTileHpxHint => 'ex: 128';

  @override
  String get videoLedTileWcmLabel => 'Tile largura (cm)';

  @override
  String get videoLedTileWcmHint => 'ex: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Tile altura (cm)';

  @override
  String get videoLedTileHcmHint => 'ex: 33.28';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Dados em falta: Tiles X/Y + Tile px + Tile cm.';

  @override
  String get videoLedErrAllGt0 => '❌ Todos os valores devem ser > 0.';

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
    return '✅ Resolução do wall: $wallWpx × $wallHpx px\n✅ Tamanho do wall: $wallWm × $wallHm m\nTile: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nPitch calculado: $pitch';
  }

  @override
  String get videoCalculationsTitle => 'Cálculos de vídeo';

  @override
  String get videoCopyAllTooltip => 'Copiar todos os resultados';

  @override
  String get videoExportPdfTooltip => 'Exportar PDF';

  @override
  String get videoCalculateAll => 'Calcular tudo';

  @override
  String get videoSummaryPillsTitle => 'Resumo (pastilhas)';

  @override
  String get videoCopySummaryTooltip => 'Copiar o resumo';

  @override
  String get videoCommonParamsTitle => 'Parâmetros comuns';

  @override
  String get videoFormatLabel => 'Formato (rácio)';

  @override
  String get videoDistanceLabel => 'Distância de projeção (m)';

  @override
  String get videoDistanceHint => 'ex: 12.0';

  @override
  String get videoImageWidthLabel => 'Largura da imagem (m)';

  @override
  String get videoImageWidthHint => 'ex: 6.0';

  @override
  String get videoThrowRatioLabel => 'Rácio de projeção';

  @override
  String get videoThrowRatioHint => 'ex: 1.60';

  @override
  String get videoLumensLabel => 'Lúmens (ANSI)';

  @override
  String get videoLumensHint => 'ex: 20000';

  @override
  String get videoGainLabel => 'Ganho';

  @override
  String get videoGainHint => 'ex: 1.0';

  @override
  String get videoScreenPresetLabel => 'Ecrã / Superfície (preset)';

  @override
  String get videoPresetFrontWhite => 'Frontal - ecrã branco mate (ganho 1.0)';

  @override
  String get videoPresetFrontGrey => 'Frontal - ecrã cinzento (ganho 0.8)';

  @override
  String get videoPresetFrontHighGain => 'Frontal - ecrã high gain (ganho 1.3)';

  @override
  String get videoPresetRearDiffusion => 'Retro - tela de difusão (ganho 0.7)';

  @override
  String get videoPresetRearClear => 'Retro - tela clara (ganho 0.9)';

  @override
  String get videoPresetMappingMatte => 'Mapping - tinta mate (ganho 0.75)';

  @override
  String get videoPresetMappingSatin => 'Mapping - tinta acetinada (ganho 0.9)';

  @override
  String get videoPresetMappingLightStone =>
      'Mapping - pedra clara (ganho 0.6)';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapping - pedra escura (ganho 0.35)';

  @override
  String get videoPresetMappingGlass => 'Mapping - vidro (ganho 0.15)';

  @override
  String get videoPresetFrontWhiteShort => 'Frontal - ecrã branco mate';

  @override
  String get videoPresetFrontGreyShort => 'Frontal - ecrã cinzento';

  @override
  String get videoPresetFrontHighGainShort => 'Frontal - ecrã high gain';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - tela de difusão';

  @override
  String get videoPresetRearClearShort => 'Retro - tela clara';

  @override
  String get videoPresetMappingMatteShort => 'Mapping - tinta mate';

  @override
  String get videoPresetMappingSatinShort => 'Mapping - tinta acetinada';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapping - pedra clara';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapping - pedra escura';

  @override
  String get videoPresetMappingGlassShort => 'Mapping - vidro';

  @override
  String get videoOverlapLabel => 'Overlap (%)';

  @override
  String get videoOverlapHint => 'ex: 10';

  @override
  String get videoTotalWidthLabel => 'Largura total de projeção (m)';

  @override
  String get videoTotalWidthHint => 'ex: 18.0';

  @override
  String get videoCalc1Title => 'Cálculo 1 — Rácio (Distância / Largura)';

  @override
  String get videoCalc2Title => 'Cálculo 2 — Largura (Distância / Rácio)';

  @override
  String get videoCalc3Title => 'Cálculo 3 — Altura (Largura + Formato)';

  @override
  String get videoCalc4Title =>
      'Cálculo 4 — Luminosidade (lux / nits / ft-L + limiar)';

  @override
  String get videoCalc5Title => 'Cálculo 5 — Overlap (Largura total + N)';

  @override
  String get videoCalc6Title => 'Cálculo 6 — Nº projetores auto + luminosidade';

  @override
  String get videoCalc5NLabel => 'Número de projetores (N)';

  @override
  String get videoCalc5NHint => 'ex: 2';

  @override
  String get videoCalc6RatioMinLabel => 'Rácio min';

  @override
  String get videoCalc6RatioMinHint => 'ex: 1.20';

  @override
  String get videoCalc6RatioMaxLabel => 'Rácio max';

  @override
  String get videoCalc6RatioMaxHint => 'ex: 1.80';

  @override
  String get videoOptionalBrightnessTitle => 'Opcional: luminosidade';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lúmens por projetor';

  @override
  String get videoCalc6LumensPerProjectorHint => 'ex: 20000';

  @override
  String get videoCalc6GainLabel => 'Ganho (calc 6)';

  @override
  String get videoCalc6GainHint => 'ex: 1.0';

  @override
  String get videoCalc1ErrMissing => '❌ Dados em falta: Distância + Largura.';

  @override
  String get videoCalc2ErrMissing => '❌ Dados em falta: Distância + Rácio.';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Dado em falta: Largura.';

  @override
  String get videoErrWidthGt0 => '❌ A largura deve ser > 0.';

  @override
  String get videoErrRatioGt0 => '❌ O rácio deve ser > 0.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Rácio de projeção = $ratio';
  }

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Largura da imagem = $width m';
  }

  @override
  String videoCalc3Ok(Object height, Object format) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String get videoCalc4ErrMissing =>
      '❌ Dados em falta: Lúmens + Ganho + Largura.';

  @override
  String get videoCalc4ErrGt0 => '❌ Lúmens/Ganho/Largura devem ser > 0.';

  @override
  String videoCalc4Result(Object area, Object format, Object lux, Object luxEq,
      Object nits, Object fl, Object presetLabel, Object minFl, Object status) {
    return 'Área: $area m² (formato $format)\nLux (lm/m²): $lux\nLux eq (ganho): $luxEq\nLuminância: $nits nits | $fl ft-L\nLimiar mínimo ($presetLabel): $minFl ft-L → $status\nNota: conversão nits/ft-L baseada numa hipótese Lambertiana (aprox).';
  }

  @override
  String get videoCalc5ErrMissing =>
      '❌ Dados em falta: Largura total + Overlap% + Número de projetores.';

  @override
  String get videoErrTotalWidthGt0 => '❌ A largura total deve ser > 0.';

  @override
  String get videoCalc5ErrNMin2 => '❌ O número de projetores deve ser ≥ 2.';

  @override
  String get videoErrOverlapRange => '❌ Overlap% deve estar entre 0 e 99.9.';

  @override
  String get videoErrImpossibleDenom => '❌ Parâmetros impossíveis (denom ≤ 0).';

  @override
  String videoCalc5Result(Object wTot, Object n, Object overlapPct, Object wPer,
      Object overlapM, Object format, Object hTot) {
    return 'Largura total: $wTot m\nN: $n | Overlap: $overlapPct% (sobre a largura do projetor)\n\n- Largura por projetor: $wPer m\n- Overlap entre 2 projetores: $overlapM m\n- Altura total (formato $format): $hTot m';
  }

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Dados em falta: Largura total + Distância + Overlap%.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ A largura total e a distância devem ser > 0.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Dados em falta: Rácio min e/ou Rácio max.';

  @override
  String get videoCalc6LumiOptional =>
      'Luminosidade (opcional): indica Lúmens/projetor + Ganho para a estimativa.';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Luminosidade: ❌ Lúmens/projetor e ganho devem ser > 0.';

  @override
  String videoCalc6LumiForN(
      Object n, Object area, Object lux, Object nits, Object fl) {
    return 'Luminosidade estimada (N=$n)\nÁrea: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6NoteIndicative =>
      'Nota: estimativa indicativa (blend/overlap reais podem reduzir um pouco).';

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
    return 'Largura total=$wTot m | Distância=$distance m | Overlap=$overlapPct%\nFormato $format → Altura total=$hTot m | Área=$area m²\nRácio min/max: $ratioMin → $ratioMax\n\nCaso rácio mais aberto (min) = $nMin projetores | cobertura ≈ $covMin m\n$lumiMin\n\nCaso rácio mais fechado (max) = $nMax projetores | cobertura ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String videoCommonPillFormat(Object format) {
    return 'Formato: $format';
  }

  @override
  String videoCommonPillDistance(Object value) {
    return 'Distância: $value';
  }

  @override
  String videoCommonPillWidth(Object value) {
    return 'Largura: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Rácio: $value';
  }

  @override
  String videoCommonPillHeight(Object value) {
    return 'Altura: $value';
  }

  @override
  String videoCommonPillArea(Object value) {
    return 'Área: $value';
  }

  @override
  String videoCommonPillTotalWidth(Object value) {
    return 'Largura total: $value';
  }

  @override
  String videoCommonPillOverlap(Object value) {
    return 'Overlap: $value';
  }

  @override
  String get videoPdfTitle => 'Mon App Technique – Export Vídeo';

  @override
  String get videoPdfDate => 'Data';

  @override
  String get videoPdfFormat => 'Formato';

  @override
  String get videoPdfDistance => 'Distância (m)';

  @override
  String get videoPdfImageWidth => 'Largura da imagem (m)';

  @override
  String get videoPdfRatio => 'Rácio';

  @override
  String get videoPdfLumens => 'Lúmens';

  @override
  String get videoPdfGain => 'Ganho';

  @override
  String get videoPdfScreenPreset => 'Preset ecrã';

  @override
  String get videoPdfOverlap => 'Overlap (%)';

  @override
  String get videoPdfTotalWidth => 'Largura total (m)';

  @override
  String get videoPdfCalc5N => 'N (calc5)';

  @override
  String get videoPdfCalc6RatioMin => 'Rácio min (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Rácio max (calc6)';

  @override
  String get videoPdfCalc6LumensPerProj => 'Lúmens/projetor (calc6)';

  @override
  String get videoPdfCalc6Gain => 'Ganho (calc6)';

  @override
  String get videoPdfParams => 'Parâmetros';

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
      'Cálculo 4 — Lux / nits / ft-L + limiar';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Dados em falta: Largura + Lúmens + Ganho.';

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
    return 'Formato: $format\nÁrea: $area m²\nLux (lm/m²): $lux\nLux eq (ganho): $luxEq\nLuminância: $nits nits | $fl ft-L\nLimiar mínimo ($presetLabel): $minFl ft-L → $status\nNota: estimativa indicativa (Lambert).';
  }

  @override
  String get videoMireTitle => 'Padrão';

  @override
  String get videoMireHeaderTitle => 'Gerador de padrões';

  @override
  String get videoMireHeaderSubtitle =>
      'Padrões indicativos (alinhamento, foco, geometria, blend, pixel perfect).';

  @override
  String get videoMireScreenVideoTitle => 'Padrão ecrã vídeo';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simples (LxA px) + mapping multiprojetor (N + overlap).';

  @override
  String get videoMireScreenLedTitle => 'Padrão ecrã LED';

  @override
  String get videoMireScreenLedSubtitle =>
      'Padrão conforme LxA px (pixel perfect, uniformidade, grelha).';

  @override
  String get mireVideoSimpleTitle => 'VÍDEO / PADRÃO SIMPLES';

  @override
  String get mireVideoComboTitle => 'VÍDEO / PADRÃO COMBO';

  @override
  String get mireVideoMappingTitle => 'VÍDEO / PADRÃO MAPPING';

  @override
  String get mireLedTitle => 'LED / PADRÃO';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireSimpleSubtitleGridSafe => 'Grelha + safe + círculos';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Xadrez + círculos';

  @override
  String get mireSimpleSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformidade + círculos';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Grelha + safe + 2 barras centradas + círculos';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedSubtitleGridLabels => 'Grelha + referências + círculos';

  @override
  String get mireLedSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedSubtitleUniformity => 'Uniformidade + círculos';

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
    return 'PROJO $index';
  }

  @override
  String get mireBlendLabel => 'BLEND';

  @override
  String get mireTileMissingPx => 'Indica Tile (px) para numeração.';

  @override
  String get mireWallNotMultipleOfTiles => 'WALL NÃO MÚLTIPLO DE TILES';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Tile ${tw}x$th px • Grelha $nx x $ny';
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
    return 'Wall ~ $wm×$hm m';
  }

  @override
  String get mireSimpleSectionTitle => 'Padrão ecrã simples';

  @override
  String get mireMappingSectionTitle => 'Padrão mapping multiprojetor';

  @override
  String get mireVideoSimpleSectionTitle => 'Padrão ecrã simples';

  @override
  String get mireVideoMappingSectionTitle => 'Padrão mapping multiprojetor';

  @override
  String get mireWidthPxLabel => 'Largura (px)';

  @override
  String get mireHeightPxLabel => 'Altura (px)';

  @override
  String get mireWidthPxHint => 'ex: 1920';

  @override
  String get mireHeightPxHint => 'ex: 1080';

  @override
  String get mireWidthPxHintMapping => 'ex: 3840';

  @override
  String get mireHeightPxHintMapping => 'ex: 2160';

  @override
  String get mireTypeLabel => 'Tipo de padrão';

  @override
  String get mireExportPng => 'Exportar PNG';

  @override
  String get mireErrInvalidWHpx => '❌ Largura/altura inválidas (px).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Número de projetores inválido (N > 0).';

  @override
  String get mireErrInvalidOverlap => '❌ Overlap inválido (0 a 99.9).';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (grelha + círculos + 2 barras centradas)';

  @override
  String get mireSimpleTypeGridSafe => 'Grelha + safe + círculos';

  @override
  String get mireSimpleTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireSimpleTypeCheckerboard => 'Xadrez + círculos';

  @override
  String get mireProjectorsNLabel => 'Número de projetores (N)';

  @override
  String get mireProjectorsNHint => 'ex: 2';

  @override
  String get mireOverlapLabel => 'Overlap (%)';

  @override
  String get mireOverlapHint => 'ex: 10.0';

  @override
  String get mireOrientationLabel => 'Orientação';

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
  String get mireLedParamsTitle => 'Parâmetros do wall LED';

  @override
  String get mireLedTilesXLabel => 'Tiles horizontais (X)';

  @override
  String get mireLedTilesYLabel => 'Tiles verticais (Y)';

  @override
  String get mireLedTileWpxLabel => 'Tile largura (px)';

  @override
  String get mireLedTileHpxLabel => 'Tile altura (px)';

  @override
  String get mireLedTileWcmLabel => 'Tile largura (cm)';

  @override
  String get mireLedTileHcmLabel => 'Tile altura (cm)';

  @override
  String mireLedWallResolution(Object w, Object h) {
    return 'Resolução do wall: $w × $h px';
  }

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Pitch calculado: $pitch';
  }

  @override
  String get mireLedErrTilesXY => '❌ Indica Tiles X/Y (>0).';

  @override
  String get mireLedErrTilePx => '❌ Indica Tile px (largura/altura >0).';

  @override
  String get mireLedErrTileCm => '❌ Indica Tile cm (largura/altura >0).';

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Pitch calculado fora do intervalo (0.5–20 mm). Verifica Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Pitch X ≠ Pitch Y (tile não homogénea). Verifica dimensões em cm e px.';

  @override
  String get mireLedTypeTilesId => 'Tiles ID (número + cores)';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedTypeGridLabels => 'Grelha + referências + círculos';

  @override
  String get mireLedTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireVideoTypeCombo =>
      'Combo (grelha + círculos + 2 barras centradas)';

  @override
  String get mireVideoTypeGridSafe => 'Grelha + safe + círculos';

  @override
  String get mireVideoTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireVideoTypeCheckerboard => 'Xadrez + círculos';

  @override
  String get laserConsentCheckboxLabel =>
      'Je comprends les risques et j’assume ma responsabilité.';

  @override
  String get laserConsentAcceptContinue => 'J\'accepte et continuer';

  @override
  String get laserConsentContinue => 'J\'accepte et continuer';

  @override
  String get laserZoneLabelNohd => 'NOHD';

  @override
  String get laserZoneLabelSzed => 'SZED';

  @override
  String get laserZoneLabelCzed => 'CZED';

  @override
  String laserValueMeter(Object value) {
    return '$value m';
  }

  @override
  String laserPercentValue(Object value) {
    return '$value %';
  }

  @override
  String get catalogUpdateTooltip => 'Mettre à jour';

  @override
  String get catalogResetTooltip => 'Réinitialiser';

  @override
  String catalogLastUpdate(Object date) {
    return 'Dernière mise à jour : $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Constructeur ($count)';
  }

  @override
  String catalogTypeTitle(Object count) {
    return 'Type de projecteur ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Modèle ($count)';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'Mode DMX ($count)';
  }

  @override
  String catalogDmxModeItem(Object name, Object channels) {
    return '$name ($channels canaux)';
  }

  @override
  String get catalogInfoDmxChannels => 'Canaux DMX';

  @override
  String get catalogInfoWeight => 'Poids';

  @override
  String get catalogInfoPower => 'Puissance';

  @override
  String get catalogInfoLuminousFlux => 'Flux lumineux';

  @override
  String get catalogNotProvided => 'Non renseigné';

  @override
  String get catalogUpdated => 'Catalogue mis à jour.';

  @override
  String get catalogSyncFailedUnknown =>
      'Synchronisation impossible (raison inconnue).';

  @override
  String catalogSyncFailed(Object reason) {
    return 'Synchronisation impossible : $reason';
  }

  @override
  String catalogSyncError(Object error) {
    return 'Échec synchronisation : $error';
  }

  @override
  String get dipSwitchResetTooltip => 'Réinitialiser';

  @override
  String get dipSwitchInputsTitle => 'Entrées';

  @override
  String get dipSwitchSectionTitle => 'Dip-switch';

  @override
  String get dipSwitchSummaryTitle => 'Résumé';

  @override
  String get dipSwitchAddressLabel => 'Adresse DMX (1 à 512)';

  @override
  String get dipSwitchAddressHint => 'Exemple : 1';

  @override
  String get dipSwitchIntervalLabel => 'Intervalle (nombre de canaux)';

  @override
  String get dipSwitchIntervalHint => 'Exemple : 16';

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Utiliser adresse moins 1';

  @override
  String get dipSwitchNextAddressButton =>
      'Adresse suivante selon l’intervalle';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Fin de l’univers : l’adresse suivante dépasserait 512.';

  @override
  String get dipSwitchScrollHint =>
      'Fais défiler horizontalement si nécessaire.';

  @override
  String get dipSwitchOnLabel => 'ON';

  @override
  String get dipSwitchOffLabel => 'OFF';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Switch $index';
  }

  @override
  String get dipSwitchResultHeader =>
      'Conversion indicative dip-switch / adresse DMX';

  @override
  String get dipSwitchModeAddressMinusOne => 'Adresse moins 1';

  @override
  String get dipSwitchModeAddressDirect => 'Adresse directe';

  @override
  String dipSwitchResultModeLine(Object mode) {
    return 'Mode : $mode';
  }

  @override
  String get dipSwitchResultAddressNotProvided =>
      'Adresse DMX : non renseignée';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Adresse DMX : $address';
  }

  @override
  String get photometrySection1Title => 'Lux et candela';

  @override
  String get photometrySection2Title => 'Lumen et candela';

  @override
  String get photometrySection3Title => 'Lux à partir de lumen';

  @override
  String get photometryLuxLabel => 'Éclairement (lux)';

  @override
  String get photometryLuxHint => 'Exemple : 500';

  @override
  String get photometryCandelaLabel => 'Intensité lumineuse (candela)';

  @override
  String get photometryCandelaHint1 => 'Exemple : 20000';

  @override
  String get photometryCandelaHint2 => 'Exemple : 150000';

  @override
  String get photometryDistanceLabel => 'Distance (mètre)';

  @override
  String get photometryDistanceHint1 => 'Exemple : 5';

  @override
  String get photometryDistanceHint3 => 'Exemple : 8';

  @override
  String get photometryLumensLabel => 'Flux lumineux (lumen)';

  @override
  String get photometryLumensHint2 => 'Exemple : 20000';

  @override
  String get photometryLumensHint3 => 'Exemple : 20000';

  @override
  String get photometryBeamAngleLabel => 'Angle de faisceau (degré)';

  @override
  String get photometryBeamAngleHint2 => 'Exemple : 10';

  @override
  String get photometryBeamAngleHint3 => 'Exemple : 15';

  @override
  String photometrySummary1(Object lux, Object candela, Object distance) {
    return 'Éclairement : $lux lux\nIntensité lumineuse : $candela candela\nDistance : $distance mètre';
  }

  @override
  String photometrySummary2(
      Object lumens, Object candela, Object angle, Object omega) {
    return 'Flux lumineux : $lumens lumen\nIntensité lumineuse : $candela candela\nAngle de faisceau : $angle degré\nAngle solide : $omega stéradian';
  }

  @override
  String get projectionInputsTitle => 'Entrées';

  @override
  String get projectionResultsTitle => 'Résultats';

  @override
  String get projectionAngleLabel => 'Angle de faisceau (degré)';

  @override
  String get projectionAngleHint => 'Exemple : 15';

  @override
  String get projectionDistanceLabel => 'Distance (mètre)';

  @override
  String get projectionDistanceHint => 'Exemple : 10';

  @override
  String get projectionDiameterLabel => 'Diamètre de tache (mètre)';

  @override
  String get projectionDiameterHint => 'Exemple : 2,60';

  @override
  String get projectionAutoHelp =>
      'Le calcul automatique se met à jour lorsque deux champs sont renseignés.';

  @override
  String get projectionHeaderNeedTwoValues =>
      'Saisis deux valeurs pour calculer automatiquement la troisième.';

  @override
  String get projectionHeaderAutoActive => 'Calcul automatique actif.';

  @override
  String projectionDetailAngle(Object value) {
    return 'Angle de faisceau : $value degré';
  }

  @override
  String projectionDetailDistance(Object value) {
    return 'Distance : $value mètre';
  }

  @override
  String projectionDetailDiameter(Object value) {
    return 'Diamètre de tache : $value mètre';
  }

  @override
  String projectionConeAngle(Object angle) {
    return 'Angle $angle°';
  }

  @override
  String projectionConeDistance(Object distance) {
    return '$distance m';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return '$diameter m';
  }

  @override
  String photometrySummary3(
      Object lumens, Object distance, Object angle, Object lux) {
    return 'Flux lumineux : $lumens lumen\nDistance : $distance mètre\nAngle de faisceau : $angle degré\nÉclairement estimé : $lux lux';
  }

  @override
  String get photometryDisclaimerShort =>
      'Calculs indicatifs. Les résultats dépendent du faisceau réel, des optiques et des conditions de mesure.';

  @override
  String dipSwitchResultBinaryValueLine(Object value) {
    return 'Valeur binaire utilisée : $value';
  }

  @override
  String dipSwitchChannelUnit(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'canaux',
      one: 'canal',
    );
    return '$_temp0';
  }

  @override
  String dipSwitchResultIntervalLine(Object step, Object unit) {
    return 'Intervalle : $step $unit';
  }

  @override
  String get catalogOpenManual => 'Ouvrir le manuel';

  @override
  String get catalogOpenDmxChart => 'Ouvrir la charte DMX';

  @override
  String get laserLegalDisclaimerText =>
      'AVERTISSEMENT LÉGAL ET CLAUSE DE NON-RESPONSABILITÉ\n\nL\'utilisation de ce calculateur est strictement réservée à titre informatif et indicatif.\nLes résultats obtenus ne constituent pas une expertise technique et ne sauraient engager la responsabilité de l\'éditeur en cas d\'erreur de calcul, d\'omission ou d\'accident survenus lors de l\'installation ou de l\'exploitation du matériel.\n\nCalculs NOHD et Instruments Optiques :\nDans certaines circonstances, des instruments optiques spéciaux (jumelles, télescopes) peuvent être utilisés pour visualiser le laser à une distance plus éloignée.\nCe fait doit être pris en compte lors de la détermination du NOHD.\nDans le calcul ci-joint, aucun instrument optique n\'est pris en compte, car il est très peu probable que cela doive être pris en compte dans l\'industrie courante du laser.\nCependant, il incombe à l\'opérateur de procéder à une évaluation appropriée des risques pour la sécurité.\n\nZones d\'Interférence Visuelle (SZED et CZED) :\nLes calculs des distances SZED (aveuglement temporaire) et CZED (éblouissement) sont basés sur des seuils d\'éclairement énergétique standards pour la vision humaine.\nCes valeurs ne sont valables que pour un observateur dont l\'œil est adapté à l\'obscurité (conditions de spectacle).\nCes résultats ne tiennent pas compte des conditions atmosphériques (brume, pluie, pollution) qui peuvent réduire ou diffuser la portée théorique du faisceau.\n\nParamètres Techniques :\nLe calculateur n\'est applicable que pour les sources laser en mode continu (CW) et n\'est valable que pour la plage de longueur d\'onde de 400 à 700 nm – paramètres standards pour les systèmes laser de spectacle.\n\nAcceptation des Risques :\nCe calculateur est fourni \"tel quel\".\nNous ne garantissons pas l\'exactitude et la précision des résultats.\nEn activant cet outil, l\'utilisateur reconnaît être un professionnel formé aux règles de sécurité en vigueur et accepte l\'entière responsabilité des risques liés à la mise en œuvre des équipements (laser, lumière, vidéo).\nVérifiez systématiquement les données avec les manuels constructeurs officiels.';

  @override
  String get laserLegalDisclaimerTextLong =>
      'AVERTISSEMENT LÉGAL ET CLAUSE DE NON-RESPONSABILITÉ\n\nL\'utilisation de ce calculateur est strictement réservée à titre informatif et indicatif.\nLes résultats obtenus ne constituent pas une expertise technique et ne sauraient engager la responsabilité de l\'éditeur en cas d\'erreur de calcul, d\'omission ou d\'accident survenus lors de l\'installation ou de l\'exploitation du matériel.\n\nCalculs NOHD et Instruments Optiques :\nDans certaines circonstances, des instruments optiques spéciaux (jumelles, télescopes) peuvent être utilisés pour visualiser le laser à une distance plus éloignée.\nCe fait doit être pris en compte lors de la détermination du NOHD.\nDans le calcul ci-joint, aucun instrument optique n\'est pris en compte, car il est très peu probable que cela doive être pris en compte dans l\'industrie courante du laser.\nCependant, il incombe à l\'opérateur de procéder à une évaluation appropriée des risques pour la sécurité.\n\nZones d\'Interférence Visuelle (SZED et CZED) :\nLes calculs des distances SZED (aveuglement temporaire) et CZED (éblouissement) sont basés sur des seuils d\'éclairement énergétique standards pour la vision humaine.\nCes valeurs ne sont valables que pour un observateur dont l\'œil est adapté à l\'obscurité (conditions de spectacle).\nCes résultats ne tiennent pas compte des conditions atmosphériques (brume, pluie, pollution) qui peuvent réduire ou diffuser la portée théorique du faisceau.\n\nParamètres Techniques :\nLe calculateur n\'est applicable que pour les sources laser en mode continu (CW) et n\'est valable que pour la plage de longueur d\'onde de 400 à 700 nm – paramètres standards pour les systèmes laser de spectacle.\n\nAcceptation des Risques :\nCe calculateur est fourni \"tel quel\".\nNous ne garantissons pas l\'exactitude et la précision des résultats.\nEn activant cet outil, l\'utilisateur reconnaît être un professionnel formé aux règles de sécurité en vigueur et accepte l\'entière responsabilité des risques liés à la mise en œuvre des équipements (laser, lumière, vidéo).\nVérifiez systématiquement les données avec les manuels constructeurs officiels.';

  @override
  String get commonDash => '—';
}
