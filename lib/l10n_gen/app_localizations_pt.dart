// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'Universo DMX em Ethernet/UDP, nós, broadcast vs unicast.\nLimites reais, estabilidade da rede, RDM dependendo do hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net — DMX sobre IP (nós, unicast/broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distâncias típicas, mostram as melhores práticas.';

  @override
  String get aboutCablingFiberTitle =>
      'Rede — RJ45/Fibra/velocidades e comprimentos';

  @override
  String get aboutComputingSubtitle =>
      'Velocidades úteis, versões, limites reais, armadilhas de marketing.';

  @override
  String get aboutComputingTitle => 'Computadores — USB/HDMI/DP/SATA/NVMe…';

  @override
  String get aboutDmxSubtitle =>
      'Universo, endereços, frames, cabeamento RS-485, terminação, erros de campo.\nInclui diagramas + lista de verificação.';

  @override
  String get aboutDmxTitle => '__TECNOLOGIA_0__';

  @override
  String get aboutElectricitySubtitle =>
      'Conectores, mono/tri, tabelas de kW rápido (16A→400A), coletores de campo.';

  @override
  String get aboutElectricityTitle => 'Elétrico – Schuko / P17 / poderes';

  @override
  String get aboutIpBasicsSubtitle =>
      'Entenda IP, máscara, gateway, DHCP versus estático.\nExemplos concretos (2.x, 10.x, 192.168.x) + checklist.';

  @override
  String get aboutIpBasicsTitle => 'Noções básicas de IP';

  @override
  String get aboutLightNetworkSubtitle =>
      'Arquitetura simples e robusta para Art-Net/sACN.\nVLAN, espionagem/consulta IGMP, Wi-Fi (jitter), switches, diagramas + lista de verificação.';

  @override
  String get aboutLightNetworkTitle =>
      'Rede leve – VLAN, IGMP, Wi-Fi vs com fio';

  @override
  String get aboutSacnSubtitle =>
      'Padrão DMX em rede \"pro\" orientada para IP.\nMulticast/unicast, espionagem/consulta IGMP, prioridades de múltiplas fontes.';

  @override
  String get aboutSacnTitle => '__TECNOLOGIA_2__';

  @override
  String get aboutVideoSubtitle =>
      'Escolha com base na latência, confiabilidade, cabeamento, rede LAN vs WAN.\nTabelas + diagrama.';

  @override
  String get aboutVideoTitle => 'Vídeo';

  @override
  String get appTitle => 'Meu aplicativo de tecnologia';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name — $channels canais';
  }

  @override
  String catalogDmxModeTitle(Object count) {
    return 'Modo DMX ($count)';
  }

  @override
  String get catalogInfoDmxChannels => 'Canais DMX';

  @override
  String get catalogInfoLuminousFlux => 'Fluxo luminoso';

  @override
  String get catalogInfoPower => 'Poder';

  @override
  String get catalogInfoWeight => 'Peso';

  @override
  String catalogLastUpdate(Object date) {
    return 'Última atualização: $date';
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
  String get catalogNotProvided => 'Não especificado';

  @override
  String get catalogOpenDmxChart => 'Abrir mesa DMX';

  @override
  String get catalogOpenManual => 'Abra o manual';

  @override
  String get catalogResetTooltip => 'Reiniciar';

  @override
  String catalogSyncError(Object message) {
    return 'Erro: $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Falha na sincronização: $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Falha de sincronização (motivo desconhecido).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Tipo ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Para atualizar';

  @override
  String get catalogUpdated => 'Catálogo atualizado.';

  @override
  String get commonCalculate => 'Calcular';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonCopyResultTooltip => 'Copiar resultado';

  @override
  String get commonDash => '-';

  @override
  String get commonNone => 'Sem gravação';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'Ok ✅';

  @override
  String get commonRename => 'Renomear';

  @override
  String get commonReset => 'Reiniciar';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonSearch => 'Para pesquisar';

  @override
  String get commonTooLowWithCross => 'Muito fraco ❌';

  @override
  String get commonUnitMeter => 'eu';

  @override
  String get consentsReset => 'Consentimentos redefinidos.';

  @override
  String get dipSwitchAddressHint => 'Ex: 1 a 512';

  @override
  String get dipSwitchAddressLabel => 'Endereço DMX';

  @override
  String get dipSwitchChannelUnit => 'canal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Aviso: fim do universo DMX alcançado.';

  @override
  String get dipSwitchInputsTitle => 'Entradas';

  @override
  String get dipSwitchIntervalHint => 'Ex: 4 (canais)';

  @override
  String get dipSwitchIntervalLabel => 'Intervalo';

  @override
  String get dipSwitchModeAddressDirect => 'Endereço direto';

  @override
  String get dipSwitchModeAddressMinusOne => 'Endereço - 1';

  @override
  String get dipSwitchNextAddressButton => 'Próximo endereço';

  @override
  String get dipSwitchOffLabel => 'DESLIGADO';

  @override
  String get dipSwitchOnLabel => 'SOBRE';

  @override
  String get dipSwitchResetTooltip => 'Reiniciar';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Endereço: $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Endereço não fornecido';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binário: $binary';
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
  String get dipSwitchScrollHint => 'Role para ver todas as opções.';

  @override
  String get dipSwitchSectionTitle => 'Interruptores';

  @override
  String get dipSwitchSummaryTitle => 'Resumo';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Alternar $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel => 'Usar modo de endereço - 1';

  @override
  String get disclaimerAccept => 'aceito';

  @override
  String get disclaimerCertify => 'Certifico que li e aceito estas condições.';

  @override
  String get disclaimerText =>
      'USE SOMENTE PARA FINS INDICATIVOS\n\nOs cálculos fornecidos por esta aplicação (vídeo, luz, laser) são fornecidos apenas para fins informativos e indicativos.\nEles não substituem de forma alguma:\n- cálculos certificados,\n- estudos técnicos,\n- as normas oficiais em vigor,\n- nem validação por profissional qualificado.\n\nRESPONSABILIDADE\nO editor deste aplicativo não pode ser responsabilizado por erros de cálculo, omissões, danos materiais,\nacidentes pessoais ou qualquer incidente ocorrido durante a instalação, operação ou uso do equipamento.\n\nVÍDEO E EXIBIÇÃO\nOs resultados (tamanhos, proporções, luminosidade, sobreposições, etc.) baseiam-se em modelos teóricos e podem variar dependendo de:\nóptica, zoom, uniformidade, ambiente de luz, suporte, configurações, etc.\nVerifique sempre a documentação oficial do fabricante.\n\nLUZ\nOs cálculos são indicativos e não levam em conta todas as condições reais (tolerâncias, perdas ópticas,\ndegradação de fontes, padrões locais, condições ambientais, etc.).\n\nLASER – SEGURANÇA\nOs cálculos NOHD, SZED e CZED baseiam-se em pressupostos padrão e limiares teóricos.\nEles não levam em consideração em particular:\n- instrumentos ópticos (binóculos, câmeras, telescópios, etc.),\n- condições atmosféricas (nevoeiro, chuva, poeira, etc.),\n- reflexões imprevistas, usos desviados, configurações específicas.\nA utilização de um sistema laser implica a responsabilidade direta do operador e uma análise de risco adequada.\n\nACEITAÇÃO DE RISCOS\nAo utilizar este aplicativo, o usuário reconhece:\n- leu as regras de segurança aplicáveis,\n- ser o único responsável pelas suas instalações,\n- assumir total responsabilidade pelos riscos associados à utilização de equipamentos (vídeo, luz, laser),\n- verificar sistematicamente os dados com os manuais oficiais do fabricante.';

  @override
  String get disclaimerTitle => '⚠️ AVISO LEGAL E ISENÇÃO DE RESPONSABILIDADE';

  @override
  String get homeLaserSubtitle =>
      'Cálculos de laser e segurança (consentimento necessário em cada entrada).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Tamanho de projeção, dip-switch DMX, fotometria, catálogo, patch DMX.';

  @override
  String get homeLightTitle => 'Luz';

  @override
  String get homeReferencesSubtitle =>
      'DMX / rede / vídeo: fichas técnicas e referências de campo.';

  @override
  String get homeReferencesTitle => 'Referências';

  @override
  String get homeTitle => 'Bem-vindo';

  @override
  String get homeVideoSubtitle =>
      'Lente e medição, brilho, multiprojetor, LED e padrões de teste.';

  @override
  String get homeVideoTitle => 'Vídeo';

  @override
  String get language => 'Linguagem';

  @override
  String get languageSystem => 'Sistema (automático)';

  @override
  String get languageSystemCurrent => 'Idioma do telefone';

  @override
  String get laserAdviceFullPower => 'Potência total permitida (100%)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Potência máxima recomendada: $percent';
  }

  @override
  String get laserConsentCheckboxLabel => 'Aceito e entendo os riscos.';

  @override
  String get laserConsentContinue => 'Continuar';

  @override
  String get laserConsentText =>
      'ACESSO À PARTE LASER\n\nA parte LASER desta aplicação diz respeito a cálculos de segurança (por exemplo: NOHD, SZED, CZED).\nEstes cálculos são indicativos e não substituem:\n- uma análise de risco,\n- as normas em vigor,\n- procedimentos operacionais,\n- nem validação por pessoa qualificada.\n\nIMPORTANTE\n- Risco de danos aos olhos/pele se usado incorretamente.\n- O cálculo pode estar incorreto se os parâmetros inseridos estiverem incompletos, incorretos ou se o contexto real for diferente (óptico,\n  condições atmosféricas, reflexões, alinhamento, etc.).\n- O operador é o único responsável pela instalação, operação e conformidade.\n\nAo validar, você confirma:\n- compreender os riscos,\n- cumprir as regras de segurança aplicáveis,\n- assumir total responsabilidade em caso de negligência ou uso indevido.';

  @override
  String get laserConsentTitle => '🔴 CONSENTIMENTO DE LASER (OBRIGATÓRIO)';

  @override
  String get laserDiameterHint => 'por exemplo: 3,0';

  @override
  String get laserDiameterLabel => 'Diâmetro de saída (mm)';

  @override
  String get laserDisclaimerShort =>
      'Cálculo indicativo. Não substitui uma análise de segurança do laser.';

  @override
  String get laserDivergenceHint => 'ex: 1,2';

  @override
  String get laserDivergenceLabel => 'Divergência (mrad)';

  @override
  String get laserInputsTitle => 'Entradas';

  @override
  String get laserInvalidInputs =>
      'Insira uma potência, divergência e diâmetro válidos.';

  @override
  String get laserNameUpdated => 'Nome atualizado.';

  @override
  String get laserNormativeParamsBody =>
      'MPE para distância nominal de risco ocular (NOHD): 25,4 W/m²\n(Norma IEC 60825-1, edição 3.0)\n\nMPE para distância de exposição de zona sensível (SZED): 1 W/m²\n(Padrão ANSI Z136.6)\n\nMPE para distância de exposição em zona crítica (CZED): 0,05 W/m²\n(Padrão ANSI Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Configurações de segurança mantidas';

  @override
  String get laserPowerHint => 'ex: 5000';

  @override
  String get laserPowerLabel => 'Potência (mW)';

  @override
  String get laserPresetAdded => 'Gravação adicionada.';

  @override
  String get laserPresetDeleted => 'Registro excluído.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW • Div: $div mrad • Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Nome do projetor';

  @override
  String get laserRenameProjectorTitle => 'Renomeie o projetor';

  @override
  String get laserSafetyResultsTitle => 'Resultados de segurança';

  @override
  String get laserSaveCurrentProjector => 'Registre este projetor';

  @override
  String get laserSaveProjectorTitle => 'Registrar um projetor';

  @override
  String get laserSavedProjectorsTitle => 'Projetores registrados';

  @override
  String get laserSearchHint => 'por exemplo “RGB 5W”';

  @override
  String get laserTargetDistanceHint => 'por exemplo: 10';

  @override
  String get laserTargetDistanceLabel => 'Distância alvo (m)';

  @override
  String get laserZoneCzedDesc => 'Zona crítica';

  @override
  String get laserZoneNohdDesc => 'Perigo para os olhos';

  @override
  String get laserZoneSzedDesc => 'Área sensível';

  @override
  String get legalNotices => 'Avisos legais';

  @override
  String get lightCatalogDescription =>
      'Seleção por fabricante, tipo e produto, com informações e manual.';

  @override
  String get lightCatalogTitle => 'Catálogo de iluminação';

  @override
  String get lightDisclaimerShort =>
      'Ferramentas indicativas. Verifique sempre a documentação do fabricante.';

  @override
  String get lightDmxSwitchDescription =>
      'Conversão indicativa entre endereço DMX e switches, com navegação intervalar.';

  @override
  String get lightDmxSwitchTitle => 'Interruptor DIP DMX';

  @override
  String get lightPatchDescription => 'Importe e visualize um arquivo MVR.';

  @override
  String get lightPatchTitle => 'Atualização DMX';

  @override
  String get lightPhotometryDescription =>
      'Conversões indicativas entre lux, candela e lúmen, com distância e ângulo.';

  @override
  String get lightPhotometryTitle => 'Fotometria';

  @override
  String get lightExposureMeterTitle => 'Fotômetro (lux)';

  @override
  String get lightExposureMeterDescription =>
      'Calcula a iluminância em lux a partir dos ajustes de ISO / abertura / velocidade de uma câmera.';

  @override
  String get lightExposureMeterIsoLabel => 'Sensibilidade ISO';

  @override
  String get lightExposureMeterApertureLabel => 'Abertura';

  @override
  String get lightExposureMeterShutterLabel => 'Velocidade do obturador';

  @override
  String get lightExposureMeterShutterDenomLabel =>
      'Velocidade (denominador, 1/x s)';

  @override
  String get lightExposureMeterResultTitle => 'Iluminância estimada';

  @override
  String get lightExposureMeterReferenceTitle => 'Referência de iluminância';

  @override
  String get lightExposureMeterRefMoonlight => 'Luar';

  @override
  String get lightExposureMeterRefDimStage => 'Palco pouco iluminado';

  @override
  String get lightExposureMeterRefOffice => 'Escritório';

  @override
  String get lightExposureMeterRefOvercast => 'Dia nublado (externo)';

  @override
  String get lightExposureMeterRefFollowSpot =>
      'Canhão de luz / recortado no palco';

  @override
  String get lightExposureMeterRefSunlight => 'Sol direto';

  @override
  String get lightExposureMeterFormulaNote =>
      'Lux = (N² × 250 × 1/t) / ISO — método do fotômetro de luz incidente. Leia os valores na câmera (modo manual ou dados EXIF).';

  @override
  String get lightProjectionDescription =>
      'Cálculo indicativo do tamanho do ponto de acordo com ângulo, distância e diâmetro.';

  @override
  String get lightProjectionTitle => 'Tamanho da projeção';

  @override
  String get menuTitle => 'Menu';

  @override
  String get homeGreetingMorning => 'Bom dia';

  @override
  String get homeGreetingAfternoon => 'Boa tarde';

  @override
  String get homeGreetingEvening => 'Boa noite';

  @override
  String get homeGreetingTagline =>
      'Todas as suas ferramentas técnicas, prontas para usar.';

  @override
  String get mireBlendLabel => 'MISTURA';

  @override
  String get mireDash => '-';

  @override
  String get mireErrInvalidOverlap => '❌ Sobreposição inválida (0 a 99,9).';

  @override
  String get mireErrInvalidProjectors =>
      '❌ Número de projetores inválido (N > 0).';

  @override
  String get mireErrInvalidWHpx => '❌ Largura/altura inválida (px).';

  @override
  String get mireExportPng => 'Exportar PNG';

  @override
  String get mireHeightPxHint => 'por exemplo: 1080';

  @override
  String get mireHeightPxHintMapping => 'ex: 2160';

  @override
  String get mireHeightPxLabel => 'Altura (px)';

  @override
  String get mireLedErrTileCm => '❌ Indica Tile cm (largura/altura >0).';

  @override
  String get mireLedErrTilePx => '❌ Indica Tile px (largura/altura >0).';

  @override
  String get mireLedErrTilesXY => '❌ Indica blocos X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'Parâmetros de parede LED';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Passo calculado: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedSubtitleGridLabels => 'Grade + marcadores + círculos';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfeito + círculos';

  @override
  String get mireLedSubtitleUniformity => 'Uniformidade + círculos';

  @override
  String get mireLedTileHcmLabel => 'Altura do ladrilho (cm)';

  @override
  String get mireLedTileHpxLabel => 'Altura do bloco (px)';

  @override
  String get mireLedTileWcmLabel => 'Largura do ladrilho (cm)';

  @override
  String get mireLedTileWpxLabel => 'Largura do bloco (px)';

  @override
  String get mireLedTilesIdTitle => 'TELHAS DE LED / ID';

  @override
  String get mireLedTilesXLabel => 'Ladrilhos horizontais (X)';

  @override
  String get mireLedTilesYLabel => 'Ladrilhos verticais (Y)';

  @override
  String get mireLedTitle => 'LED / MARCA';

  @override
  String get mireLedTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedTypeGridLabels => 'Grade + marcadores + círculos';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfeito + círculos';

  @override
  String get mireLedTypeTilesId => 'ID dos blocos (número + cores)';

  @override
  String get mireLedTypeUniformity => 'Uniformidade + círculos';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Resolução da parede: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Passo calculado fora da faixa (0,5–20 mm). Verifica o bloco cm/px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Passo X ≠ Passo Y (ladrilho não homogêneo). Verifique as dimensões cm e px.';

  @override
  String get mireMappingSectionTitle => 'Alvo de mapeamento multiprojetor';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n • Sobreposição $percent% • $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Rampas de mistura';

  @override
  String get mireMappingTypeCombo => 'Combo (zonas + sobreposição + mistura)';

  @override
  String get mireMappingTypeLabel => 'Mapeamento de tipo';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonas + sobreposição';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientação';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String get mireOverlapHint => 'por exemplo: 10,0';

  @override
  String get mireOverlapLabel => 'Sobreposição (%)';

  @override
  String mirePitchEqual(Object value) {
    return '$value milímetros';
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
  String get mireSimpleSectionTitle => 'Teste de tela simples';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Tabuleiro de damas + círculos';

  @override
  String get mireSimpleSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Grade + cofre + 2 barras centralizadas + círculos';

  @override
  String get mireSimpleSubtitleGridSafe => 'Grade + seguro + círculos';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformidade + círculos';

  @override
  String get mireSimpleTypeCheckerboard => 'Tabuleiro de damas + círculos';

  @override
  String get mireSimpleTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (grade + círculos + 2 barras centralizadas)';

  @override
  String get mireSimpleTypeGridSafe => 'Grade + seguro + círculos';

  @override
  String get mireSimpleTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireTileMissingPx => 'Especifica o bloco (px) para numeração.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Bloco ${tw}x$th px • Grade $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Passo ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Passo X $px • Y $py mm';
  }

  @override
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm) {
    return 'Ladrilho $wcm×$hcm cm';
  }

  @override
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Parede ~ $wm×${hm}m';
  }

  @override
  String get mireTypeLabel => 'Tipo de visão';

  @override
  String get mireVideoComboTitle => 'MARCA DE VÍDEO / COMBO';

  @override
  String get mireVideoMappingSectionTitle => 'Alvo de mapeamento multiprojetor';

  @override
  String get mireVideoMappingTitle => 'VÍDEO / MAPEAMENTO ALVO';

  @override
  String get mireVideoSimpleSectionTitle => 'Teste de tela simples';

  @override
  String get mireVideoSimpleTitle => 'VÍDEO / TELA SIMPLES';

  @override
  String get mireVideoTypeCheckerboard => 'Tabuleiro de damas + círculos';

  @override
  String get mireVideoTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoTypeCombo =>
      'Combo (grade + círculos + 2 barras centralizadas)';

  @override
  String get mireVideoTypeGridSafe => 'Grade + seguro + círculos';

  @override
  String get mireVideoTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireWallNotMultipleOfTiles => 'PAREDE NÃO MÚLTIPLA DE AZULEJO';

  @override
  String get mireWidthPxHint => 'ex: 1920';

  @override
  String get mireWidthPxHintMapping => 'ex: 3840';

  @override
  String get mireWidthPxLabel => 'Largura (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Endereço: $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Canais usados: $count/512';
  }

  @override
  String get patchConflictError => 'Resolver conflito (sobreposição).';

  @override
  String get patchConflictShort => 'Conflito';

  @override
  String patchConflicts(Object count) {
    return 'Conflitos: $count';
  }

  @override
  String get patchEditChannelsLabel => 'Canais';

  @override
  String get patchEditHint => 'Verifica o modo e o número de canais.';

  @override
  String get patchEditModeLabel => 'Moda';

  @override
  String get patchEditTitle => 'Edição';

  @override
  String get patchEmptyUniverse => 'Não há máquinas neste universo.';

  @override
  String patchFixturesCount(Object count) {
    return 'Máquinas: $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'Os resultados são indicativos. Sempre verifique com o console.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analise um arquivo MVR e carregue o patch como referência.';

  @override
  String get patchHomeImportMvrTitle => 'Importe um MVR';

  @override
  String get patchHomeTitle => 'Atualização DMX';

  @override
  String get patchHomeViewPatchDescription => 'Lista e conflitos por universo.';

  @override
  String get patchHomeViewPatchTitle => 'Ver patch';

  @override
  String get patchHubOpenGridButton => 'Grade aberta';

  @override
  String get patchHubOpenMvrButton => 'Abra MVR';

  @override
  String get patchHubStateEmpty => 'Nenhuma referência carregada.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Carregado: universo $count';
  }

  @override
  String get patchHubStateTitle => 'Estado';

  @override
  String get patchHubTitle => 'Patch do hub';

  @override
  String get patchHubWorksiteBody =>
      'Importe um MVR ou consulte a grade de ocupação.';

  @override
  String get patchHubWorksiteTitle => 'Canteiro de obras';

  @override
  String get patchInvalidChannelCount => 'Número de canais inválido.';

  @override
  String get patchIssueInvalidChannelCount =>
      'O número de canais deve ser maior ou igual a 1.';

  @override
  String get patchIssueInvalidStartAddress =>
      'O endereço DMX deve estar entre 1 e 512.';

  @override
  String get patchIssueInvalidUniverse =>
      'O universo deve ser maior ou igual a 1.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'O alcance do canal excede 512 neste universo.';

  @override
  String get patchIssueUnknown => 'Erro desconhecido.';

  @override
  String get patchListTitle => 'Lista';

  @override
  String get patchManualDisabledBody =>
      'O patch é somente leitura quando uma referência MVR é carregada.';

  @override
  String get patchManualDisabledTitle => 'Desabilitado';

  @override
  String get patchManualTitle => 'Correção manual';

  @override
  String patchModeLabel(Object mode) {
    return 'Modo: $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Análise…';

  @override
  String get patchMvrButtonLoadAsReference => 'Carregar como referência';

  @override
  String get patchMvrButtonPickFile => 'Escolha um arquivo';

  @override
  String get patchMvrClearTooltip => 'Para apagar';

  @override
  String get patchMvrColAddress => 'Endereço';

  @override
  String get patchMvrColChannels => 'Canais';

  @override
  String get patchMvrColId => 'EU IA';

  @override
  String get patchMvrColName => 'Nome';

  @override
  String get patchMvrColUniverse => 'Universo';

  @override
  String get patchMvrColumnsHint =>
      'Colunas: ID, Nome, Universo, Endereço, Canais';

  @override
  String get patchMvrFileCardHelp =>
      'Seleciona um arquivo .mvr (ZIP) para analisar o patch.';

  @override
  String get patchMvrFileCardTitle => 'Arquivo';

  @override
  String get patchMvrFilterAllUniverses => 'Todos os universos';

  @override
  String get patchMvrFilterUniverseLabel => 'Filtrar por universo';

  @override
  String get patchMvrModeNotProvided => 'Modo não especificado';

  @override
  String get patchMvrOrderAsc => 'Croissant';

  @override
  String get patchMvrOrderDesc => 'Descendente';

  @override
  String get patchMvrOrderLabel => 'Ordem';

  @override
  String get patchMvrSortAddress => 'Endereço';

  @override
  String get patchMvrSortByLabel => 'ordenar por';

  @override
  String get patchMvrSortChannels => 'Canais';

  @override
  String get patchMvrSortId => 'EU IA';

  @override
  String get patchMvrSortName => 'Nome';

  @override
  String get patchMvrSortUniverse => 'Universo';

  @override
  String get patchMvrSortUniverseThenAddress => 'Universo então endereço';

  @override
  String get patchMvrStatusCleared => 'Referência excluída.';

  @override
  String get patchMvrStatusEmptyBytes => 'Arquivo vazio.';

  @override
  String get patchMvrStatusExtractingZip => 'Extraindo o ZIP…';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'Não foi possível selecionar o arquivo: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Máquinas encontradas: $count (multicanal: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Carregando GDTF…';

  @override
  String get patchMvrStatusNoContentToLoad => 'Nenhum conteúdo para carregar.';

  @override
  String get patchMvrStatusNoFileSelected => 'Nenhum arquivo selecionado.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'Nenhuma máquina explorável encontrada.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Erro de análise: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Análise de conteúdo…';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Referência carregada: $count máquina(s) (ignorada: $skipped, impressões digitais GDTF: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Catering: $count máquinas';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'cena.xml não encontrado em MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'Selecionando o arquivo…';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Arquivo não suportado: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Resumo';

  @override
  String get patchMvrTitle => 'Importar MVR';

  @override
  String patchMvrUniverseItem(Object universe) {
    return 'Universo $universe';
  }

  @override
  String get patchPageTitle => 'Correção';

  @override
  String get patchSummaryTitle => 'Resumo';

  @override
  String get patchUniverseAppBarTitle => 'Correção';

  @override
  String patchUniverseConflictCount(Object count) {
    return 'Conflitos: $count canal(is)';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Limitado pela largura da tela.';

  @override
  String get patchUniverseGridTitle => 'Ocupação (1 a 512)';

  @override
  String patchUniverseItem(Object universe) {
    return 'Universo $universe';
  }

  @override
  String get patchUniverseLabel => 'Universo';

  @override
  String get patchUniverseLegendConflict => 'Conflito';

  @override
  String get patchUniverseLegendFree => 'Livre';

  @override
  String get patchUniverseLegendOccupied => 'Ocupado';

  @override
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start) {
    return '• $fixture\n  $mode — $channels canal(is)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Ocupado: $count/512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universo $universe — Endereço $address\nEstado: $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Várias máquinas ocupam este canal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '…e $count outro(s).';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Conflito';

  @override
  String get patchUniversePopupTitleFree => 'Canal grátis';

  @override
  String get patchUniversePopupTitleOccupied => 'Canal ocupado';

  @override
  String get patchUniverseReferenceNone => 'Nenhuma referência carregada';

  @override
  String get patchUniverseReferenceReadOnly => 'Somente leitura (desde MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Referência';

  @override
  String get patchUniverseResetConfirm => 'Reiniciar';

  @override
  String get patchUniverseResetContent =>
      'Isso apaga o patch carregado de MVR no aplicativo.\nNenhum dado no arquivo é modificado.';

  @override
  String get patchUniverseResetTitle => 'Redefinir referência?';

  @override
  String get patchUniverseResetTooltip => 'Redefinir referência';

  @override
  String get patchUniverseSelected => 'Universo selecionado';

  @override
  String get patchUniverseStateConflict => 'Conflito';

  @override
  String get patchUniverseStateFree => 'Livre';

  @override
  String get patchUniverseStateOccupied => 'Ocupado';

  @override
  String get patchUniverseTapHint => 'Toque em uma caixa para ver os detalhes.';

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
  String get patchUniverseZoomOut => 'Reduzir';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'Em graus';

  @override
  String get photometryBeamAngleHint3 => 'Em graus';

  @override
  String get photometryBeamAngleLabel => 'Ângulo de feixe';

  @override
  String get photometryCandelaHint1 => 'Insira um valor em cd';

  @override
  String get photometryCandelaHint2 => 'Insira um valor em cd';

  @override
  String get photometryCandelaLabel => '__TECNOLOGIA_15__';

  @override
  String get photometryDisclaimerShort =>
      'Apenas indicação. Verifique com a documentação do fabricante.';

  @override
  String get photometryDistanceHint1 => 'Em metros';

  @override
  String get photometryDistanceHint3 => 'Em metros';

  @override
  String get photometryDistanceLabel => 'Distância';

  @override
  String get photometryLumensHint2 => 'Insira um valor em lm';

  @override
  String get photometryLumensHint3 => 'Insira um valor em lm';

  @override
  String get photometryLumensLabel => 'Lumens';

  @override
  String get photometryLuxHint => 'Insira um valor em lux';

  @override
  String get photometryLuxLabel => '__TECNOLOGIA_13__';

  @override
  String get photometrySection1Title => 'Lux <> Candela';

  @override
  String get photometrySection2Title => 'Lumens <> Candela';

  @override
  String get photometrySection3Title => 'Lumens < Lux';

  @override
  String photometrySummary1(Object candela, Object distance, Object lux) {
    return 'Em $distance m, $candela cd ≈ $lux lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'Em $distance m, $lumens lm ≈ $lux lux (aprox.).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumens: $lumens lm — Distância: $distance m — Ângulo: $angle° — Lux: $lux lx.';
  }

  @override
  String get projectionAngleHint => 'Em graus';

  @override
  String get projectionAngleLabel => 'Canto';

  @override
  String get projectionAutoHelp => 'Automático: calcula o valor ausente.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Ângulo: $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diâmetro: $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Distância: ${distance}m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Ângulo: $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Diâmetro: $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Distância: ${distance}m';
  }

  @override
  String get projectionDiameterHint => 'Em metros';

  @override
  String get projectionDiameterLabel => 'Diâmetro';

  @override
  String get projectionDistanceHint => 'Em metros';

  @override
  String get projectionDistanceLabel => 'Distância';

  @override
  String get projectionHeaderAutoActive => 'Ativo automático';

  @override
  String get projectionHeaderNeedTwoValues => 'Insira pelo menos dois valores.';

  @override
  String get projectionInputsTitle => 'Entradas';

  @override
  String get projectionResultsTitle => 'Resultados';

  @override
  String get resetConsents => 'Redefinir consentimentos';

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
    return 'Formato: $format\nÁrea: $area m²\nLux (lm/m²): $lux\nLux eq (ganho): $luxEq\nLuminância: $nits lêndeas | $fl pés-L\nLimite mínimo ($presetLabel): $minFl pés-L → $status\nNota: estimativa indicativa (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle => 'Lux / lêndeas / pés-L + limite';

  @override
  String get videoBrightnessSubtitle => 'Lux / lêndeas / pés-L + limite';

  @override
  String get videoBrightnessTitle => 'Brilho';

  @override
  String get videoCalc1ErrMissing => '❌ Dados faltantes: Distância + Largura.';

  @override
  String videoCalc1Ok(Object ratio) {
    return '✅ Proporção de projeção = $ratio';
  }

  @override
  String get videoCalc1Title => 'Proporção (Distância / Largura)';

  @override
  String get videoCalc2ErrMissing =>
      '❌ Dados faltantes: Distância + Proporção.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Largura da imagem = $width m';
  }

  @override
  String get videoCalc2Title => 'Largura (Distância / Proporção)';

  @override
  String get videoCalc3ErrMissingWidth => '❌ Dados faltantes: Largura.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String get videoCalc3Title => 'Altura (Largura + Formato)';

  @override
  String get videoCalc4ErrGt0 => '❌ Lumens/Ganho/Largura deve ser > 0.';

  @override
  String get videoCalc4ErrMissing =>
      '❌ Dados faltantes: Lumens + Ganho + Largura.';

  @override
  String get videoCalc4ErrMissingSimple =>
      '❌ Dados faltantes: Largura + Lumens + Ganho.';

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
    return 'Área: $area m² (formato $format)\nLux (lm/m²): $lux\nLux eq (ganho): $luxEq\nLuminância: $nits lêndeas | $fl pés-L\nLimite mínimo ($presetLabel): $minFl pés-L → $status\nNota: conversão de nits/ft-L baseada em uma suposição Lambertiana (aproximadamente).';
  }

  @override
  String get videoCalc4Title => 'Brilho (lux/nits/ft-L + limite)';

  @override
  String get videoCalc5ErrMissing =>
      '❌ Dados faltantes: Largura total + % de sobreposição + Número de destaques.';

  @override
  String get videoCalc5ErrNMin2 => '❌ O número de projetores deve ser ≥ 2.';

  @override
  String get videoCalc5NHint => 'ex: 2';

  @override
  String get videoCalc5NLabel => 'Número de projetores (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Largura total: $wTot m\nN: $n | Sobreposição: $overlapPct% (na largura do projeto)\n\n- Largura por projetor: $wPer m\n- Sobreposição entre 2 projetos: $overlapM m\n- Altura total (formato $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Sobreposição (largura total + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      '❌ Dados faltantes: Largura total + Distância + Sobreposição%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      '❌ Dados faltantes: Proporção mínima e/ou Proporção máxima.';

  @override
  String get videoCalc6GainHint => 'por exemplo: 1,0';

  @override
  String get videoCalc6GainLabel => 'Ganho (cálculo 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'ex: 20.000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lumens por projetor';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Brilho: ❌ Lumens/projo e ganho devem ser > 0.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Brilho estimado (N=$n)\nÁrea: $area m²\nLux eq: $lux (lm/m²)\nLêndeas: $nits | pés-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Brilho (opcional): fornece Lumens/projo + Ganho para estimativa.';

  @override
  String get videoCalc6NoteIndicative =>
      'Nota: estimativa indicativa (a mistura/sobreposição real pode reduzir um pouco).';

  @override
  String get videoCalc6RatioMaxHint => 'por exemplo: 1,80';

  @override
  String get videoCalc6RatioMaxLabel => 'Proporção máxima';

  @override
  String get videoCalc6RatioMinHint => 'por exemplo: 1,20';

  @override
  String get videoCalc6RatioMinLabel => 'Proporção mínima';

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
    return 'Largura total=$wTot m | Distância=$distance m | Sobreposição=$overlapPct%\nFormato $format → Altura total=$hTot m | Área=$area m²\nRazão mín/máx: $ratioMin → $ratioMax\n\nProporção de casos mais abertos (min) = $nMin projos | cobertura ≈ $covMin m\n$lumiMin\n\nCaso de proporção mais estreita (máx.) = $nMax projos | cobertura ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'Número de faróis automáticos + brilho';

  @override
  String videoCalcLabel(Object n) {
    return 'Cálculo $n';
  }

  @override
  String get videoCalculateAll => 'Calcule tudo';

  @override
  String get videoCalculationsTitle => 'Cálculos de vídeo';

  @override
  String get videoCommonParamsTitle => 'Configurações comuns';

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
    return 'Sobreposição: $value';
  }

  @override
  String videoCommonPillRatio(Object value) {
    return 'Proporção: $value';
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
  String get videoCopySummaryTooltip => 'Copiar resumo';

  @override
  String get videoDisclaimerShort =>
      'Cálculos indicativos. Verifique sempre a documentação do fabricante.';

  @override
  String get videoDistanceHint => 'por exemplo: 12,0';

  @override
  String get videoDistanceLabel => 'Distância de lançamento (m)';

  @override
  String get videoErrImpossibleDenom =>
      '❌ Parâmetros impossíveis (denominação ≤ 0).';

  @override
  String get videoErrOverlapRange =>
      '❌% de sobreposição deve estar entre 0 e 99,9.';

  @override
  String get videoErrRatioGt0 => '❌ A proporção deve ser > 0.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      '❌ A largura e distância total devem ser > 0.';

  @override
  String get videoErrTotalWidthGt0 => '❌ A largura total deve ser > 0.';

  @override
  String get videoErrWidthGt0 => '❌ A largura deve ser > 0.';

  @override
  String get videoExportPdfTooltip => 'Exportar PDF';

  @override
  String get videoFormatLabel => 'Formato (proporção)';

  @override
  String get videoGainHint => 'por exemplo: 1,0';

  @override
  String get videoGainLabel => 'Ganho';

  @override
  String get videoImageWidthHint => 'por exemplo: 6,0';

  @override
  String get videoImageWidthLabel => 'Largura da imagem (m)';

  @override
  String get videoLedCalcTitle => 'Cálculo – Pixels/blocos';

  @override
  String get videoLedErrAllGt0 => '❌ Todos os valores devem ser > 0.';

  @override
  String get videoLedErrMissingInputs =>
      '❌ Dados faltantes: Blocos X/Y + Bloco px + Bloco cm.';

  @override
  String videoLedPitchUniform(Object value) {
    return '$value milímetros';
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
    return '✅ Resolução da parede: $wallWpx × $wallHpx px\n✅ Tamanho da parede: $wallWm × $wallHm m\nBloco: $tileWpx×$tileHpx px • $tileWcm×$tileHcm cm\nPasso calculado: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Pixels da parede LED de acordo com tamanho, passo, dimensão dos ladrilhos.';

  @override
  String get videoLedTileHcmHint => 'por exemplo: 33,28';

  @override
  String get videoLedTileHcmLabel => 'Altura do ladrilho (cm)';

  @override
  String get videoLedTileHpxHint => 'por exemplo: 128';

  @override
  String get videoLedTileHpxLabel => 'Altura do bloco (px)';

  @override
  String get videoLedTileWcmHint => 'por exemplo: 33,28';

  @override
  String get videoLedTileWcmLabel => 'Largura do ladrilho (cm)';

  @override
  String get videoLedTileWpxHint => 'por exemplo: 128';

  @override
  String get videoLedTileWpxLabel => 'Largura do bloco (px)';

  @override
  String get videoLedTilesXHint => 'ex: 15';

  @override
  String get videoLedTilesXLabel => 'Ladrilhos horizontais (X)';

  @override
  String get videoLedTilesYHint => 'ex: 8';

  @override
  String get videoLedTilesYLabel => 'Ladrilhos verticais (Y)';

  @override
  String get videoLedTitle => 'LIDERADO';

  @override
  String get videoLensMeasureSubtitle =>
      'Relação/largura/altura (cálculos 1 a 3).';

  @override
  String get videoLensMeasureTitle => 'Lente e medição';

  @override
  String get videoLmCalc1Title => 'Proporção (Distância / Largura)';

  @override
  String get videoLmCalc2Title => 'Largura (Distância / Proporção)';

  @override
  String get videoLmCalc3Title => 'Altura (Largura + Formato)';

  @override
  String get videoLmDistanceHint => 'por exemplo: 12,0';

  @override
  String get videoLmDistanceLabel => 'Distância de lançamento (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      '❌ Dados faltantes: Distância + Proporção.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      '❌ Dados faltantes: Distância + Largura.';

  @override
  String get videoLmErrMissingWidthOnly => '❌ Dados faltantes: Largura.';

  @override
  String get videoLmErrRatioGt0 => '❌ A proporção deve ser > 0.';

  @override
  String get videoLmErrWidthGt0 => '❌ A largura deve ser > 0.';

  @override
  String get videoLmFormatLabel => 'Formato (proporção)';

  @override
  String get videoLmImageWidthHint => 'por exemplo: 6,0';

  @override
  String get videoLmImageWidthLabel => 'Largura da imagem (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return '✅ Proporção de projeção = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Largura da imagem = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'por exemplo: 1,60';

  @override
  String get videoLmThrowRatioLabel => 'Proporção de lançamento';

  @override
  String get videoLumensHint => 'ex: 20.000';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Alvos indicativos (caling, foco, geometria, mesclagem, pixel perfeito).';

  @override
  String get videoMireHeaderTitle => 'Gerador de padrões';

  @override
  String get videoMireScreenLedSubtitle =>
      'Alvo de acordo com LxA px (pixel perfeito, uniformidade, grade).';

  @override
  String get videoMireScreenLedTitle => 'Alvo de tela LED';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simples (LxA px) + Mapeamento multiprojeto (N + sobreposição).';

  @override
  String get videoMireScreenVideoTitle => 'Teste de tela de vídeo';

  @override
  String get videoMireTitle => 'Lama';

  @override
  String get videoMpCalc5Title => 'Largura por projetor';

  @override
  String get videoMpCalc6Title => 'Número de projetores (relação mín/máx)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Proporção de casos mais abertos (min) = $n projos | cobertura ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Caso de proporção mais estreita (máx.) = $n projos | cobertura ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'por exemplo: 12,0';

  @override
  String get videoMpDistanceLabel => 'Distância de lançamento (m)';

  @override
  String get videoMpErrImpossibleDenom =>
      '❌ Parâmetros impossíveis (denominação ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => '❌ Proporção inválida (deve ser > 0).';

  @override
  String get videoMpErrMissing5 =>
      '❌ Dados faltantes: Largura total + Sobreposição% + N.';

  @override
  String get videoMpErrMissing6Main =>
      '❌ Dados faltantes: Largura total + Distância + Sobreposição%.';

  @override
  String get videoMpErrMissingRatios =>
      '❌ Dados faltantes: Proporção mínima e/ou Proporção máxima.';

  @override
  String get videoMpErrNGte2 => '❌ N deve ser ≥ 2.';

  @override
  String get videoMpErrOverlapRange =>
      '❌% de sobreposição deve estar entre 0 e 99,9.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      '❌ A largura e distância total devem ser > 0.';

  @override
  String get videoMpErrWidthGt0 => '❌ A largura total deve ser > 0.';

  @override
  String get videoMpFormatLabel => 'Formato (proporção)';

  @override
  String get videoMpGainHint => 'por exemplo: 1,0';

  @override
  String get videoMpGainLabel => 'Ganho';

  @override
  String get videoMpLumensPerProjectorHint => 'ex: 20.000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lumens por projetor';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Brilho: ❌ Lumens/projo e ganho devem ser > 0.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Brilho estimado (N=$n)\nÁrea: $area m²\nLux equação: $lux\nLêndeas: $nits | pés-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Brilho (opcional): insira Lumens/projo + Ganho para estimar.';

  @override
  String get videoMpNoteIndicative => 'Nota: estimativa indicativa.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Opcional: brilho';

  @override
  String get videoMpOverlapHint => 'por exemplo: 10';

  @override
  String get videoMpOverlapLabel => 'Sobreposição (%)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpProjectorCountLabel => 'Número de projetores (N)';

  @override
  String get videoMpRatioMaxHint => 'por exemplo: 1,80';

  @override
  String get videoMpRatioMaxLabel => 'Proporção máxima';

  @override
  String get videoMpRatioMinHint => 'por exemplo: 1,20';

  @override
  String get videoMpRatioMinLabel => 'Proporção mínima';

  @override
  String get videoMpTotalWidthHint => 'ex: 18,0';

  @override
  String get videoMpTotalWidthLabel => 'Largura total de projeção (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Sobreposição + largura/projo + número de projos (cálculos 5 e 6).';

  @override
  String get videoMultiprojectorTitle => 'Multiprojetor';

  @override
  String get videoOptionalBrightnessTitle => 'Opcional: brilho';

  @override
  String get videoOverlapHint => 'por exemplo: 10';

  @override
  String get videoOverlapLabel => 'Sobreposição (%)';

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
  String get videoPdfCalc6LumensPerProj => 'Lumens/projo (calc6)';

  @override
  String get videoPdfCalc6RatioMax => 'Proporção máxima (calc6)';

  @override
  String get videoPdfCalc6RatioMin => 'Proporção mínima (calc6)';

  @override
  String get videoPdfDate => 'Data';

  @override
  String get videoPdfDistance => 'Distância (m)';

  @override
  String get videoPdfFormat => 'Formatar';

  @override
  String get videoPdfGain => 'Ganho';

  @override
  String get videoPdfImageWidth => 'Largura da imagem (m)';

  @override
  String get videoPdfLumens => 'Lumens';

  @override
  String get videoPdfOverlap => 'Sobreposição (%)';

  @override
  String get videoPdfParams => 'Configurações';

  @override
  String get videoPdfRatio => 'Razão';

  @override
  String get videoPdfResults => 'Resultados';

  @override
  String get videoPdfScreenPreset => 'Predefinição de tela';

  @override
  String get videoPdfTitle => 'Meu aplicativo técnico – Exportação de vídeo';

  @override
  String get videoPdfTotalWidth => 'Largura total (m)';

  @override
  String get videoPresetFrontGrey => 'Frente - tela cinza (ganho 0,8)';

  @override
  String get videoPresetFrontGreyShort => 'Frente - tela cinza';

  @override
  String get videoPresetFrontHighGain =>
      'Frontal – tela de alto ganho (ganho 1,3)';

  @override
  String get videoPresetFrontHighGainShort => 'Frontal – tela de alto ganho';

  @override
  String get videoPresetFrontWhite => 'Frente – tela branca fosca (ganho 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Frente - tela branca fosca';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapeamento - pedra escura (ganho 0,35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapeamento - pedra escura';

  @override
  String get videoPresetMappingGlass => 'Mapeamento - janela (ganho 0,15)';

  @override
  String get videoPresetMappingGlassShort => 'Mapeamento - janela';

  @override
  String get videoPresetMappingLightStone =>
      'Mapeamento - pedra leve (ganho 0,6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapeamento - pedra clara';

  @override
  String get videoPresetMappingMatte => 'Mapeamento - tinta fosca (ganho 0,75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapeamento - tinta fosca';

  @override
  String get videoPresetMappingSatin =>
      'Mapeamento - tinta acetinada (ganho 0,9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapeamento - tinta acetinada';

  @override
  String get videoPresetRearClear => 'Retro - tela clara (ganho 0,9)';

  @override
  String get videoPresetRearClearShort => 'Retro - tela leve';

  @override
  String get videoPresetRearDiffusion => 'Retro - tela de difusão (ganho 0,7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - tela de difusão';

  @override
  String get videoScreenPresetLabel => 'Tela / Suporte (predefinido)';

  @override
  String get videoSummaryPillsTitle => 'Resumo (pelotas)';

  @override
  String get videoTestPatternSubtitle =>
      'Criação de padrão de vídeo para tela e parede de LED (a ser feito posteriormente).';

  @override
  String get videoTestPatternTitle => 'Lama';

  @override
  String get videoThrowRatioHint => 'por exemplo: 1,60';

  @override
  String get videoThrowRatioLabel => 'Proporção de lançamento';

  @override
  String get videoTitle => 'Vídeo';

  @override
  String get videoToolsTitle => 'Ferramentas de vídeo';

  @override
  String get videoTotalWidthHint => 'ex: 18,0';

  @override
  String get videoTotalWidthLabel => 'Largura total de projeção (m)';

  @override
  String get aboutArtnetTitle => '__TECNOLOGIA_1__';

  @override
  String get aboutArtnetToc01 => '1) Art-Net — o que é e por quê';

  @override
  String get aboutArtnetToc02 =>
      '2) Endereçamento e universo — mapeamento próprio';

  @override
  String get aboutArtnetToc03 =>
      '3) Limites e desempenho – o que quebra primeiro';

  @override
  String get aboutArtnetToc04 => '4) Nós, divisores e RDM';

  @override
  String get aboutArtnetToc05 => '5) Solução de problemas — sintomas → causas';

  @override
  String get aboutArtnetToc06 => '6) Esquemas (rede/unicast vs transmissão)';

  @override
  String get aboutArtnetToc07 => '6bis) Imagens (ativos) — RJ45/switch/cabos';

  @override
  String get aboutArtnetToc08 => '7) Lista de verificação rápida';

  @override
  String get aboutDmxToc01 => '1) DMX, universo, endereços — a base';

  @override
  String get aboutDmxToc02 => '2) Quadro DMX — quebra, código inicial, canais';

  @override
  String get aboutDmxToc03 => '3) Cabeamento RS-485 – topologia e cabo';

  @override
  String get aboutDmxToc04 => '4) Terminação e divisores – evite reflexos';

  @override
  String get aboutDmxToc05 => '4bis) MDR — limites e compatibilidades';

  @override
  String get aboutDmxToc06 =>
      '5) Solução de problemas em campo — sintomas → causas';

  @override
  String get aboutDmxToc07 => '6) Art-Net — benchmarks de campo';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 — multicast, IGMP, prioridades';

  @override
  String get aboutDmxToc09 => '8) DMX vs Art-Net vs sACN – escolha';

  @override
  String get aboutDmxToc10 => '10) Lista de verificação rápida';

  @override
  String get aboutDmxToc11 => '10) Lista de verificação rápida';

  @override
  String get aboutElectriciteTitle => 'Eletricidade';

  @override
  String get aboutElectriciteToc01 => '1) Noções básicas (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono/Tri (o que muda)';

  @override
  String get aboutElectriciteToc04 => '4) Mesa rápida (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Segurança e armadilhas de terreno';

  @override
  String get aboutElectriciteToc06 => '6) Lista de verificação';

  @override
  String get aboutInformatiqueTitle => 'Ciência da Computação';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Armazenamento (SATA/NVMe/SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Conexões de vídeo (DP/HDMI)';

  @override
  String get aboutInformatiqueToc04 =>
      '4) PCIe/GPU (referências de referência)';

  @override
  String get aboutInformatiqueToc05 => '5) Lista de verificação (bandeja)';

  @override
  String get aboutIpBasicsToc01 => '1) O que é um IP e para que serve?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Por que 192.x/10.x/172.x? (endereços privados)';

  @override
  String get aboutIpBasicsToc03 => '3) Máscara e sub-redes: entenda de verdade';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, gateway, DNS: quem faz o quê?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Como dois dispositivos se comunicam (LAN vs. off-LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Planos IP simples de “mostrar” (exemplos prontos para copiar)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Solução de problemas: sintomas → causas (método de campo)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-exercícios (verifique rapidamente uma máscara/rede)';

  @override
  String get aboutIpBasicsToc09 => '9) Lista de verificação rápida';

  @override
  String get aboutNetworkTitle => 'Rede (PT)';

  @override
  String get aboutNetworkToc01 => '1) Objetivo: rede estável';

  @override
  String get aboutNetworkToc02 => '2) Plano IP (simples)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (separação)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (multicastsACN)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi x com fio';

  @override
  String get aboutNetworkToc06 => '6) Trocar: o que você precisa';

  @override
  String get aboutNetworkToc07 => '7) Esquemas';

  @override
  String get aboutNetworkToc08 => '7bis) Imagens (ativos)';

  @override
  String get aboutNetworkToc09 => '8) Lista de verificação';

  @override
  String get aboutReseauTitle => 'Rede';

  @override
  String get aboutReseauToc01 =>
      '1) Noções básicas de rede (LAN/IP/taxa de transferência)';

  @override
  String get aboutReseauToc02 => '2) RJ45 e categorias (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc03 => '3) PoE (fonte de alimentação de rede)';

  @override
  String get aboutReseauToc04 => '4) Fibra (SM/MM) + conectores (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP/SFP+/QSFP (módulos)';

  @override
  String get aboutReseauToc06 => '6) Switches (VLAN/IGMP/QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN na rede (conselho)';

  @override
  String get aboutReseauToc08 => '8) Lista de verificação';

  @override
  String get aboutSacnToc01 => '1) Para que é usado sACN?';

  @override
  String get aboutSacnToc02 => '2) Universo (numeração)';

  @override
  String get aboutSacnToc03 => '3) Multicast/Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Prioridades (multifontes)';

  @override
  String get aboutSacnToc05 => '5) Limites/desempenho';

  @override
  String get aboutSacnToc06 => '6) RDM & sACN (proxy / dependendo do hardware)';

  @override
  String get aboutSacnToc07 => '7) Esquemas';

  @override
  String get aboutSacnToc08 => '7bis) Imagens (ativos)';

  @override
  String get aboutSacnToc09 => '8) Lista de verificação';

  @override
  String get aboutVideoToc01 => '1) Noções básicas de vídeo (palavras-chave)';

  @override
  String get aboutVideoToc02 => '2) Resolução e FPS';

  @override
  String get aboutVideoToc03 => '3) Cor (4:4:4/4:2:2/10 bits)';

  @override
  String get aboutVideoToc04 => '4) Sincronização (Genlock/Timecode)';

  @override
  String get aboutVideoToc05 => '5) Cabos e distâncias';

  @override
  String get aboutVideoToc06 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI – campo';

  @override
  String get aboutVideoToc08 => '8) NDI — quando/por que/limites';

  @override
  String get aboutVideoToc09 => '9) Mapeamento / LED / multiprojeto';

  @override
  String get aboutVideoToc10 => '10) Lista de verificação de campo';

  @override
  String get aboutTileDmxTitle => 'DMX — operação (simples e completa)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net — DMX sobre IP (nós, unicast/broadcast)';

  @override
  String get aboutTileSacnTitle =>
      'sACN / E1.31 — multicast, IGMP, prioridades';

  @override
  String get aboutTileIpBasicsTitle =>
      'Rede — bases IP/máscara/DHCP (essencial)';

  @override
  String get aboutTileReseauTitle =>
      'Rede — RJ45/Fibra/velocidades e comprimentos';

  @override
  String get aboutTileNetworkTitle =>
      'Rede leve – VLAN, IGMP, Wi-Fi vs com fio';

  @override
  String get aboutTileVideoTitle => 'Vídeo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle => 'Elétrico – Schuko / P17 / poderes';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Conectores, mono/tri, tabelas de kW rápido (16A→400A), coletores de campo.';

  @override
  String get aboutTileInformatiqueTitle =>
      'Computadores — USB/HDMI/DP/SATA/NVMe…';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Velocidades úteis, versões, limites reais, armadilhas de marketing.';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String get homeRiggingTitle => '__TECNOLOGIA_18__';

  @override
  String get homeRiggingSubtitle => 'Freios: ângulos e comprimentos da funda.';

  @override
  String get riggingTitle => '__TECNOLOGIA_18__';

  @override
  String get riggingAngleLengthTitle =>
      'Ângulo do freio e comprimento da funda';

  @override
  String get riggingSymmetryNote =>
      'Hipótese: freio simétrico (2 fios idênticos). Sem cálculo de carga.';

  @override
  String get riggingInputsTitle => 'Entradas';

  @override
  String get riggingSpanLabel => 'Distância central (distância entre pontos)';

  @override
  String get riggingSpanHint => 'Ex: 2,40';

  @override
  String get riggingDropLabel => 'Seta (queda vertical)';

  @override
  String get riggingDropHint => 'Ex: 0,60';

  @override
  String get riggingUnitMeters => 'eu';

  @override
  String get riggingResultsTitle => 'Resultados';

  @override
  String get riggingNeedPositiveValues => 'Insira valores> 0.';

  @override
  String get riggingLegLengthLabel => 'Comprimento de um fio';

  @override
  String get riggingAngleToHorizontalLabel => 'Ângulo em relação à horizontal';

  @override
  String get riggingAngleToVerticalLabel => 'Ângulo em relação à vertical';

  @override
  String get riggingDisclaimerShort =>
      'Resultados indicativos. Para ser validado de acordo com seu contexto e práticas de rigging.';

  @override
  String get riggingCalcLegDropTitle => 'Comprimento + seta → alcance';

  @override
  String get riggingCalcLegDropHelp =>
      'Funda simétrica (2 pernas): calcula o alcance a partir do comprimento da funda e da flecha.';

  @override
  String get riggingLegLengthInputLabel => 'Comprimento de um fio';

  @override
  String get riggingLegLengthInputHint => 'Ex: 2,50';

  @override
  String get riggingInvalidTriangle =>
      'Impossível: o comprimento deve ser maior que a seta.';

  @override
  String get riggingCalcLegAngleTitle =>
      'Comprimento + ângulo → alcance + seta';

  @override
  String get riggingCalcLegAngleHelp =>
      'Funda simétrica (2 pernas): calcula o alcance e a flecha a partir do comprimento e ângulo em relação à horizontal.';

  @override
  String get riggingAngleHorizontalInputLabel =>
      'Ângulo em relação à horizontal';

  @override
  String get riggingAngleHorizontalInputHint => 'Exemplo: 30';

  @override
  String get riggingInvalidAngle =>
      'Ângulo inválido: entre 0° e 90° (excluído).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title =>
      'Distância central + seta → comprimento e ângulos';

  @override
  String get riggingCalc1Subtitle =>
      'Freio simétrico (2 fios idênticos). Peso exibido (informações). Sem cálculo de carga.';

  @override
  String get riggingCalc2Title =>
      'Distância central + ângulo (H) → seta e comprimento';

  @override
  String get riggingCalc2Subtitle =>
      'Ângulo relativo à horizontal. Freio simétrico. Sem cálculo de carga.';

  @override
  String get riggingCalc3Title =>
      'Distância central + comprimento → seta e ângulos';

  @override
  String get riggingCalc3Subtitle =>
      'Comprimento de um fio conhecido. Freio simétrico. Sem cálculo de carga.';

  @override
  String get riggingLegLengthHint => 'Ex: 4,70';

  @override
  String get riggingAngleHint => 'Exemplo: 45';

  @override
  String get riggingInvalidGeometry =>
      'Geometria impossível (comprimento muito curto para a distância central).';

  @override
  String get riggingSchemaTitle => 'Plano';

  @override
  String get riggingSchemaCaption1 =>
      'Entradas: intervalo + seta. Saídas: comprimento da funda + ângulos.';

  @override
  String get riggingSchemaCaption2 =>
      'Entradas: alcance + comprimento da funda. Saídas: seta + ângulos.';

  @override
  String get riggingSchemaCaption3 =>
      'Entradas: faixa + ângulo (horizontal). Saídas: seta + comprimento.';

  @override
  String get riggingAngleHInputLabel => 'Ângulo (em relação à horizontal)';

  @override
  String get riggingAngleHInputHint => 'Exemplo: 45';

  @override
  String get riggingDropResultLabel => 'Flecha (queda)';

  @override
  String get riggingSchemaLabelSpan => 'Distância central';

  @override
  String get riggingSchemaLabelDrop => 'Seta';

  @override
  String get riggingSchemaLabelLeg => 'Praia';

  @override
  String get riggingWeightLabel => 'Peso (informações)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Geometria impossível: o comprimento de um fio deve ser > (distância ao centro / 2).';

  @override
  String get riggingDisclaimerNoLoad =>
      'Peso exibido apenas para fins informativos. Sem cálculo de carga/tensão. Válido de acordo com o seu contexto de rigging.';

  @override
  String get riggingCalcCommonSubtitle =>
      'Freio de 2 fios. Peso exibido (informações). Sem cálculo de carga.';

  @override
  String get riggingOffCenterToggle => 'Carga descentralizada';

  @override
  String get riggingOffsetLabel => 'Offset A → carregar';

  @override
  String get riggingInvalidOffset =>
      'Offset inválido: deve ser > 0 e < distância central.';

  @override
  String get riggingLegLeftLabel => 'Comprimento do fio esquerdo';

  @override
  String get riggingLegRightLabel => 'Comprimento do fio reto';

  @override
  String get riggingAngleHLeftLabel => 'Ângulo H (esquerda)';

  @override
  String get riggingAngleHRightLabel => 'Ângulo H (direita)';

  @override
  String get riggingAngleVLeftLabel => 'Ângulo V (esquerda)';

  @override
  String get riggingAngleVRightLabel => 'Ângulo V (direita)';

  @override
  String get riggingBridleAnglesLegend => 'Ângulos';

  @override
  String get riggingIncludedAngleLabel => 'Ângulo entre fios';

  @override
  String get riggingAngleHLeftInputLabel => 'Ângulo H (fio esquerdo)';

  @override
  String get riggingLegLeftInputLabel => 'Comprimento (fio esquerdo)';

  @override
  String get riggingNeedValidValues => 'Insira valores positivos válidos.';

  @override
  String get photometrySection4Title => 'Lux → Lumen';

  @override
  String get photometryAreaLabel => 'Área (m²)';

  @override
  String get photometryAreaHint4 => 'Exemplo: 12,5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx • S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversões';

  @override
  String get aboutArtnetConversionIntro =>
      'Ferramentas úteis de conversão em torno dos universos DMX, Art-Net e valores hexadecimais.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universo → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Encontre Sub-rede + Universo (Endereço de Rede/Porta) de um universo DMX.';

  @override
  String get aboutUniverseToHexTitle => 'Universo → Hex';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Converta um universo (1…N) em índice e valor hexadecimal.';

  @override
  String get aboutArtnetConversionNote =>
      'Nota: As convenções Art-Net podem variar dependendo dos consoles (endereço, base 0/1). Sempre verifique a documentação do seu sistema.';

  @override
  String get elecTocCopyText => 'Copiar resumo';

  @override
  String get elecToc1 => '1) Noções básicas (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono/Tri (o que muda)';

  @override
  String get elecToc4 => '4) Mesa rápida (16A → 400A)';

  @override
  String get elecToc5 => 'Conversão kVA → kW/A';

  @override
  String get elecToc6 => '6) Segurança e armadilhas de campo';

  @override
  String get elecToc7 => '6) Lista de verificação';

  @override
  String get elecKvaTitle => 'Tabela kVA → kW (de acordo com cos φ)';

  @override
  String get elecKvaFormula => 'Fórmula: kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Esta tabela fornece uma estimativa rápida da potência ativa (kW) a partir de uma potência aparente (kVA).';

  @override
  String get elecKvaNote =>
      'Valores indicativos. Use os valores reais de cos φ quando os conhecer.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cosφ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cosφ = 1,0)';

  @override
  String get commonTocTitle => 'Resumo';

  @override
  String get commonCopySummaryTooltip => 'Copiar resumo';

  @override
  String get aboutLightReferenceTitle => 'Referências de iluminação';

  @override
  String get refCriTitle => 'IRC/CRI';

  @override
  String get refKelvinTitle => 'Temperatura de cor (K)';

  @override
  String get refBeamFieldTitle => 'Feixe/Campo';

  @override
  String get refLuxTitle => 'Níveis de iluminação (lux)';

  @override
  String get refCriContent =>
      'CRI (CRI) mede a fidelidade das cores. Quanto mais alto, mais naturais aparecem as cores.';

  @override
  String get refKelvinContent =>
      'A temperatura da cor descreve a tonalidade do branco (quente a frio).';

  @override
  String get refBeamFieldContent =>
      'A viga é o ângulo da viga principal; o Campo é o ângulo onde a intensidade se torna fraca (fronteira).';

  @override
  String get refBeamLegendBeam => 'feixe';

  @override
  String get refBeamLegendField => 'Campo';

  @override
  String get refLuxIntro =>
      'Referências indicativas de iluminação de acordo com o uso.';

  @override
  String get refLuxColUse => 'Usar';

  @override
  String get refLuxColLux => '__TECNOLOGIA_13__';

  @override
  String get refLuxUseCorridor => 'Corredor/circulação';

  @override
  String get refLuxUseBackstage => 'Bastidores / técnico';

  @override
  String get refLuxUseMeeting => 'Sala de reuniões';

  @override
  String get refLuxUseExpo => 'Exposição/showroom';

  @override
  String get refLuxUseStageGeneral => 'Cena – geral';

  @override
  String get refLuxUseStageTv => 'Palco – TV/captura';

  @override
  String get refLuxNote =>
      'Estes valores variam de acordo com padrões e restrições (câmera, contraste, atmosfera).';

  @override
  String get refLightDisclaimerShort =>
      'Referências indicativas – não um padrão.';

  @override
  String get refCri90 => 'Excelente (≥90)';

  @override
  String get refCri80 => 'Bom (≈ 80)';

  @override
  String get refCriLow => 'Baixo (<80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Importante';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Alguns consoles usam base 0 (Universo 0..15) e outros usam base 1 (Universo 1..16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Tabela Universo → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Correspondência típica entre o universo DMX e o endereçamento Art-Net.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Sempre verifique sua convenção de console/nó.';

  @override
  String get aboutUniverseToArtnetColDmx => 'Universo DMX';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Simples (hexágono)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Sub-rede $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Princípio';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'Um universo (1…N) pode ser convertido em índice (base 0) e depois em hexadecimal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Universo → Tabela hexadecimal';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Tabela de conversão de universo DMX → índice/hex.';

  @override
  String aboutUniverseToHexBlockTitle(Object p0, Object p1) {
    return 'Bloco $p0 $p1';
  }

  @override
  String get aboutUniverseToHexColDmx => 'Universo DMX';

  @override
  String get aboutUniverseToHexColIndex => 'Índice';

  @override
  String get aboutArtnetPageTitle =>
      'Art-Net — DMX universo em IP (simples e completo)';

  @override
  String get aboutArtnetTocTitle => 'Resumo';

  @override
  String get aboutArtnetTocCopyTooltip => 'Copiar marcadores';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX sobre Ethernet via UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Escala: muitos universos através de nós distribuídos (DMX-out).';

  @override
  String get aboutArtnetCopyLine3 =>
      'Difusão: broadcast (simples mas inundado) ou unicast (mais limpo).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Limites reais: Wi-Fi, switch básico, nós de firmware, configurações de universo/mapeamento.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: possível via \"proxy RDM\" dependendo dos nós (suporte variável).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net — o que é e por quê';

  @override
  String get aboutArtnetSection2Title =>
      '2) Endereçamento e universo — mapeamento próprio';

  @override
  String get aboutArtnetSection3Title =>
      '3) Limites e desempenho – o que quebra primeiro';

  @override
  String get aboutArtnetSection4Title => '4) Nós, divisores e RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Solução de problemas — sintomas → causas';

  @override
  String get aboutArtnetSection6Title =>
      '6) Esquemas (rede/unicast vs transmissão)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Imagens (ativos) — RJ45/switch/cabos';

  @override
  String get aboutArtnetSection7Title => '7) Lista de verificação rápida';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Conversão/tabelas (Universo 1..256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Universo DMX em IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'Nós DMX-out';

  @override
  String get aboutArtnetSection1Paragraph => '\"pacotes\" na rede';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Por que é útil';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Escalável: muitos universos em um único cabo de rede.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distribuição: nós próximos a projetores/dimmers → menos filas longas DMX.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Patching flexível: mudar um universo ou mover um nó é rápido.';

  @override
  String get aboutArtnetSection1Subtitle => 'Duas palavras para lembrar';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'Art-Net não substitui DMX: ele o transporta por IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'A estabilidade muitas vezes depende mais da rede (switch, Wi-Fi, transmissão) do que do protocolo.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universo';

  @override
  String get aboutArtnetSection2PillNodePort => 'Nó/Porta';

  @override
  String get aboutArtnetSection2PillMapping => 'Mapeamento';

  @override
  String get aboutDmxPageTitle => 'DMX — operação (simples e completa)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 canais (slots) por universo, valores 0–255 (8 bits).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Tempo: 250 kbaud, universo completo ≈ ~44 Hz (ordem de grandeza).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topologia: ligação em série (sem Y passivo). Terminação de 120Ω no último.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = DMX bidirecional (configuração/monitoramento) → compatibilidade do divisor/nó a ser verificada.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = universo DMX transportado por Ethernet/IP via nós.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multicast + prioridades (recomenda-se espionagem IGMP).';

  @override
  String get aboutDmxToc1 => '1) DMX, universo, endereços — a base';

  @override
  String get aboutDmxToc2 => '2) Quadro DMX — quebra, código inicial, canais';

  @override
  String get aboutDmxToc3 => '3) Cabeamento RS-485 – topologia e cabo';

  @override
  String get aboutDmxToc4 => '4) Terminação e divisores – evite reflexos';

  @override
  String get aboutDmxToc4bis => '4bis) MDR — limites e compatibilidades';

  @override
  String get aboutDmxToc5 =>
      '5) Solução de problemas em campo — sintomas → causas';

  @override
  String get aboutDmxToc6 => '6) Art-Net — benchmarks de campo';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 — multicast, IGMP, prioridades';

  @override
  String get aboutDmxToc8 => '8) DMX vs Art-Net vs sACN – escolha';

  @override
  String get aboutDmxToc9 => '9) Diagramas de campo (DMX / IP / pinagem)';

  @override
  String get aboutDmxChecklistCopyTitle =>
      'DMX — Lista de verificação de campo';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN — Lista de verificação de campo';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Modo correto do dispositivo (número de canais)';

  @override
  String get aboutDmxChecklistCopyB2 =>
      'Endereço DMX correto (sem sobreposição)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Daisy-chain (sem Y passivo)';

  @override
  String get aboutDmxChecklistCopyB4 =>
      'Terminação de 120Ω no último dispositivo';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'Cabo DMX/RS-485 (par trançado de 120Ω), se possível';

  @override
  String get aboutDmxChecklistCopyB6 => 'Dividir opto se vários ramos';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Mantenha DMX longe de fontes parasitas (fontes de alimentação, dimmers), se possível';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Se for RDM: verifique a compatibilidade do divisor/nó + cabeamento impecável';

  @override
  String get aboutDmxChecklistCopyB9 => 'Rede dedicada, se possível (ou VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Interruptor correto; Espionagem IGMP recomendada (sACN multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (frequentemente) ou multicast controlado (evite inundação)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Mapeamento de universo ↔ portas/nó verificados';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Plano IP claro (endereços, máscara, DHCP vs estático)';

  @override
  String get aboutDmxS1Title => '1) DMX, universo, endereços — a base';

  @override
  String get aboutDmxS1Pill1 => '1 universo = 512 slots';

  @override
  String get aboutDmxS1Pill2 => '0–255 (8 bits)';

  @override
  String get aboutDmxS1Pill3 => '16 bits = 2 canais';

  @override
  String get aboutDmxS1Intro =>
      'DMX512 é um protocolo de controle amplamente utilizado em shows (iluminação, efeitos, dimmers). É um fluxo serial (RS-485) que faz um loop em um “quadro” contendo até 512 valores. Cada valor = um canal (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'Para lembrar';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 universo DMX = 512 canais (slots) numerados de 1→512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'Um dispositivo escuta um endereço inicial (por exemplo: 101) e consome N canais (dependendo do seu modo).';

  @override
  String get aboutDmxS1RememberB3 =>
      'O controlador envia tudo de volta continuamente: se você parar de transmitir, os dispositivos “congelam” (ou entram em fallback).';

  @override
  String get aboutDmxS4bisTitle => '4bis) MDR — limites e compatibilidades';

  @override
  String get aboutDmxS4bisPlaceholder =>
      '... (mantenha seu conteúdo existente)';

  @override
  String get aboutDmxS9Title => '9) Diagramas de campo (DMX / IP / pinagem)';

  @override
  String get aboutDmxS9Diagram1 => 'Tempo DMX (pausa/MAB/slots)';

  @override
  String get aboutDmxS9Diagram2 => 'Topologia DMX: ligação em série';

  @override
  String get aboutDmxS9Diagram3 => 'Terminação de 120Ω';

  @override
  String get aboutDmxS9Diagram4 =>
      'sACN multicast: retorno de chamada IGMP (rede)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → nós → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Pinagem XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Lista de verificação rápida';

  @override
  String get aboutDmxS10CopyTooltip => 'Copiar lista de verificação';

  @override
  String get aboutDmxS10CalloutTitle => 'Antes de entrar em pânico';

  @override
  String get aboutDmxS10B1 =>
      'Modo do dispositivo + endereço DMX (verifique sempre).';

  @override
  String get aboutDmxS10B2 =>
      'Corrente curta com um cabo \"OK conhecido\" para isolar.';

  @override
  String get aboutDmxS10B3 => 'Daisy-chain (sem Y passivo).';

  @override
  String get aboutDmxS10B4 =>
      'Terminação de 120Ω apenas no último dispositivo.';

  @override
  String get aboutDmxS10B5 => 'Splitter opto se vários ramos.';

  @override
  String get aboutDmxS10B6 =>
      'Se RDM: divisor/nó compatível + cabeamento impecável.';

  @override
  String get aboutDmxS10B7 =>
      'Em IP (Art-Net/sACN): switch correto, IGMP para sACN multicast, unicast em caso de dúvida.';

  @override
  String get aboutDmxFooterNote =>
      'Informação indicativa (terreno). Os comportamentos exatos podem variar dependendo dos consoles, nós, switches e firmware.\nObjetivo aqui: compreender e solucionar problemas rapidamente, com um método confiável.';

  @override
  String get aboutDmxPainterBreak => 'QUEBRAR';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Começar\ncódigo';

  @override
  String get aboutDmxPainterSlots => 'Slots 1…N\n(até 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Loop (atualização) — universo completo ≈ ~44 Hz (ordem de magnitude)';

  @override
  String get aboutDmxPainterSourceA => 'FONTE A\n(prioridade 100)';

  @override
  String get aboutDmxPainterSourceB => 'FONTE B\n(antes de 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'INTERRUPTOR\nEspionagem IGMP';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniverso U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Sem IGMP: inundação\nCom IGMP: apenas portas de assinante';

  @override
  String get aboutDmxPainterConsole => 'CONSOLE';

  @override
  String get aboutDmxPainterFix1 => 'CORREÇÃO 1';

  @override
  String get aboutDmxPainterFix2 => 'CORREÇÃO 2';

  @override
  String get aboutDmxPainterFix3 => 'CORREÇÃO 3';

  @override
  String get aboutElectricitePageTitle => 'Elétrica - referências de campo';

  @override
  String get elecSection1Title => '1) Noções básicas (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 fórmulas úteis';

  @override
  String get elecSection1Formula1 => 'P(W) = U(V) × I(A)';

  @override
  String get elecSection1Formula2 => 'Eu(A) = P(W)/U(V)';

  @override
  String get elecSection1Formula3 => 'P(kW) = P(W)/1000';

  @override
  String get elecSection1FieldMarksTitle => 'Referências de campo';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V: 16A ≈ 3,7 kW | 32A ≈ 7,4 kW | 63A ≈ 14,5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Tri 400V: 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44kW';

  @override
  String get elecSection2Title => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (tomadas domésticas)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Normalmente 16A máx. (≈ 3,7 kW a 230V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Tenha cuidado com múltiplas tomadas e extensões: possível superaquecimento.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (azul/vermelho)';

  @override
  String get elecSection2P17Bullet1 =>
      'Azul: 230V mono (camping, pequena distro).';

  @override
  String get elecSection2P17Bullet2 =>
      'Vermelho: 400V tri (distro, altas potências).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (áudio/iluminação)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = mais “campo” (travamento, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Verifique a seção do cabo e as proteções.';

  @override
  String get elecSection3Title => '3) Mono/Tri (o que muda)';

  @override
  String get elecSection3Paragraph =>
      'Mono = monofásico + neutro (230V). Tri = 3 fases (400V entre fases).';

  @override
  String get elecSection3PitfallsTitle => 'Armadilhas comuns';

  @override
  String get elecSection3Pitfall1 =>
      'Desequilíbrio de fase (sobrecarga de uma fase).';

  @override
  String get elecSection3Pitfall2 =>
      'Neutro que aquece se houver grandes harmônicos (LED, dimmers).';

  @override
  String get elecSection3Pitfall3 =>
      'Terreno ausente/duvidoso em alguns locais.';

  @override
  String get elecSection3MethodTitle => 'Método simples';

  @override
  String get elecSection3MethodBullet1 =>
      'Distribua grandes cargas em L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Monitore o neutro se houver muitos LEDs.';

  @override
  String get elecSection3MethodBullet3 => 'Meça com uma pinça, se possível.';

  @override
  String get elecSection4Title => '4) Mesa rápida (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Mono 230 V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3,7 kW\n32A ≈ 7,4 kW\n63A ≈ 14,5 kW\n125A ≈ 28,8 kW\n200A ≈ 46 kW';

  @override
  String get elecSection4TriTitle => 'Tri 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16A ≈ 11kW\n32A ≈ 22kW\n63A ≈ 44kW\n125A ≈ 86 kW\n200A ≈ 138kW\n400A ≈ 277 kW';

  @override
  String get elecSection4ImportantTitle => 'Importante';

  @override
  String get elecSection4ImportantBullet1 =>
      'Estas são ordens de grandeza (cosφ, harmônicos, perdas).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Valide sempre as proteções + seções + temperatura.';

  @override
  String get elecSection5Title => '6) Segurança e armadilhas de campo';

  @override
  String get elecSection5DontDoTitle => 'O que não fazer';

  @override
  String get elecSection5DontDoBullet1 =>
      'Encadeie vários soquetes/cabos de extensão a granel.';

  @override
  String get elecSection5DontDoBullet2 => 'Misturar fases sem saber.';

  @override
  String get elecSection5DontDoBullet3 => '“Bridger” uma terra duvidosa.';

  @override
  String get elecSection5WarningTitle => 'Sinais de alerta';

  @override
  String get elecSection5WarningBullet1 =>
      'Cheiro quente, tiros mornos, disparos repetidos.';

  @override
  String get elecSection5WarningBullet2 => 'Queda de tensão (queda).';

  @override
  String get elecSection5WarningBullet3 => 'Disjuntor “cansado” ou inadequado.';

  @override
  String get elecSection6Title => '6) Lista de verificação';

  @override
  String get elecSection6QuickTitle => 'Rápido';

  @override
  String get elecSection6Bullet1 =>
      'Tipo de fonte de alimentação disponível (mono/tri) + classificação (A).';

  @override
  String get elecSection6Bullet2 =>
      'Distribuição de fases (cargas principais).';

  @override
  String get elecSection6Bullet3 => 'Proteções (diff/disj) e status da tabela.';

  @override
  String get elecSection6Bullet4 =>
      'Cabos: seção/comprimento/elevação de temperatura.';

  @override
  String get elecSection6Bullet5 => 'Terra: OK? (testador, se possível).';

  @override
  String get elecFooterNote =>
      'Observação: este conteúdo é um auxílio à memória de campo. Num site real, respeita sempre as normas, os regulamentos do local e as proteções em vigor.';

  @override
  String get infoPageTitle => 'TI – benchmarks de campo';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Armazenamento (SATA/NVMe/SSD)';

  @override
  String get infoVideoLinksTitle => '3) Conexões de vídeo (DP/HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe/GPU (referências de referência)';

  @override
  String get infoChecklistTitle => '5) Lista de verificação (bandeja)';

  @override
  String get infoSummaryCopy =>
      'INFO – marcadores de campo\n• USB-C = forma, não velocidade: verifique o padrão.\n• NVMe (M.2) muito mais rápido que SATA.\n• DisplayPort/HDMI = padrões, preste atenção nas versões/cabos.\n• Em servidores de vídeo: armazenamento + GPU + rendimento são a base.';

  @override
  String get infoChecklistCopy =>
      'INFORMAÇÕES - Lista de verificação\n☐ Cabos USB-C certificados (dados/vídeo, se necessário)\n☐ Armazenamento adaptado (NVMe se fluxo grande)\n☐ Drivers GPU estáveis (versão conhecida)\n☐ Resolução real/teste FPS\n☐ Evite adaptadores baratos';

  @override
  String get infoUsbCriticalTitle => 'Ponto crítico';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = conector (formato). Não diz velocidade.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Um cabo USB-C pode ser “somente carga” e não passar dados/vídeo.';

  @override
  String get infoUsbSpeedTitle =>
      'Benchmarks de velocidade (ordem de magnitude)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: lento (teclados, dongles, pequenos dispositivos).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x: muito mais rápido (discos, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt: velocidade muito alta (dock, eGPU, vídeo dependendo do hardware).';

  @override
  String get infoUsbParagraph =>
      'Em show: se um aparelho “dá errado”, desconfie do cabo (qualidade/padrão) antes do aparelho.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA x NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SSD SATA: bom e estável, mas limitado (interface antiga).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'SSD NVMe (M.2): muito mais rápido (ideal para servidores de mídia, arquivos grandes).';

  @override
  String get infoStorageFieldTitle => 'Terreno de vídeo';

  @override
  String get infoStorageFieldBullet1 =>
      'Reprodução de arquivos grandes 4K/ProRes → NVMe recomendado.';

  @override
  String get infoStorageFieldBullet2 =>
      'Tenha cuidado com a temperatura: um NVMe pode acelerar (desacelerar) se esquentar.';

  @override
  String get infoStorageFieldBullet3 =>
      'Sempre teste em condições reais antes do show.';

  @override
  String get infoVideoLinksImportantTitle => 'Marco importante';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'Contagem de versões: cabo + porta + dispositivo devem ser compatíveis.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Longa distância = conversores ativos/de fibra frequentemente necessários.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs HDMI (muito simplificado)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: onipresente (TV, processadores), mas EDID/HDCP pode atrapalhar.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: PC muito comum, muitas vezes muito “capaz” de rendimento.';

  @override
  String get infoPcieGpuParagraph =>
      'Para servidores de vídeo/mapeamento: GPU + barramento + drivers = estabilidade. Problemas típicos: drivers, cabos, conversão e limitações de saída.';

  @override
  String get infoPcieGpuFieldTitle => 'Chão';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Bloqueie uma versão estável do driver antes de um grande show.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Evite adaptadores “baratos”.';

  @override
  String get infoPcieGpuFieldBullet3 => 'Teste na resolução/FPS real da tela.';

  @override
  String get infoChecklistQuickTitle => 'Rápido';

  @override
  String get infoChecklistBullet1 => 'Cabo/padrão correto.';

  @override
  String get infoChecklistBullet2 => 'Armazenamento adaptado ao fluxo.';

  @override
  String get infoChecklistBullet3 => 'Drivers estáveis.';

  @override
  String get infoChecklistBullet4 => 'Teste real antes do show.';

  @override
  String get infoChecklistBullet5 => 'Evite adaptadores baratos.';

  @override
  String get infoFooterNote =>
      'Informação indicativa (terreno). Os recursos exatos variam de acordo com o hardware/versão.\nObjetivo: benchmarks simples + método confiável.';

  @override
  String get ipBasicsPageTitle => 'Rede — bases IP/máscara/DHCP (essencial)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Copiar memorando';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Copiar lista de verificação';

  @override
  String get ipBasicsMemo1 =>
      'IP = endereço lógico para acessar um dispositivo em uma rede.';

  @override
  String get ipBasicsMemo2 =>
      'Privado (LAN): 10.x.x.x, 172.16–31.x.x, 192.168.x.x (não roteado pela Internet).';

  @override
  String get ipBasicsMemo3 =>
      'Máscara/sub-rede = diz qual parte é \"rede\" versus \"máquina\".';

  @override
  String get ipBasicsMemo4 =>
      'Mesma sub-rede = comunicação direta. Caso contrário → gateway (roteador).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP atribui IP automaticamente; static = útil para nós/console.';

  @override
  String get ipBasicsToc1 => '1) O que é um IP e para que serve?';

  @override
  String get ipBasicsToc2 =>
      '2) Por que 192.x/10.x/172.x? (endereços privados)';

  @override
  String get ipBasicsToc3 => '3) Máscara e sub-redes: entenda de verdade';

  @override
  String get ipBasicsToc4 => '4) DHCP, gateway, DNS: quem faz o quê?';

  @override
  String get ipBasicsToc5 =>
      '5) Como dois dispositivos se comunicam (LAN vs. off-LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Planos IP simples de “mostrar” (exemplos prontos para copiar)';

  @override
  String get ipBasicsToc7 =>
      '7) Solução de problemas: sintomas → causas (método de campo)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini-exercícios (verifique rapidamente uma máscara/rede)';

  @override
  String get ipBasicsToc9 => '9) Lista de verificação rápida';

  @override
  String get ipBasicsSection1Paragraph =>
      'Um endereço IP (IPv4) é um identificador lógico em uma rede. Permite dizer: “envie este pacote para este dispositivo”.\n\nQuando você conecta um console, um nó Art-Net/sACN, um PC, um switch gerenciado... tudo que fala na rede deve ter um IP consistente para que os dispositivos se encontrem.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Imagem mental';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = identificador de hardware (placa de rede).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = endereço “postal” em uma rede (alterável).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Máscara = “distrito/código postal” (delimita a sub-rede).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Gateway = “saída do bairro” (roteador).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 em 10 segundos';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Formato: A.B.C.D (4 ​​números de 0 a 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Ex: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'Não é mágica: são 32 bits (4 bytes).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'O que importa para você: a máscara IP+ deve ser consistente entre os dispositivos.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Certos intervalos de endereços IPv4 são reservados para redes privadas (LAN). Eles não são roteados pela Internet. É por isso que os usamos em shows: você pode criar sua rede local sem “consumir” IPs públicos.';

  @override
  String get ipBasicsSection2CalloutTitle =>
      'As 3 grandes praias privadas (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (geralmente escrito \"10.x.x.x\")';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (geralmente \"172.16–31.x.x\")';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (geralmente \"192.168.x.x\")';

  @override
  String get ipBasicsSection2Subtitle1 =>
      'Por que vemos frequentemente 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'Caixas/roteadores de consumo geralmente usam 192.168.0.x ou 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'Tornou-se um “padrão de fato” em pequenas LANs.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Mas, na verdade, 10.x.x.x é útil se você quiser muitos endereços ou várias VLANs.';

  @override
  String get ipBasicsSection2Subtitle2 => 'E o famoso 2.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Muitos hardwares Art-Net saem de fábrica com IP 2.x.x.x (rede fechada).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'É \"prático\" em plug&play (sem DHCP), mas é surpreendente se o seu PC estiver em 192.168.x.x.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Importante: \"2.x\" não é mágico para transmissão/unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'O que muda o escopo da transmissão é a máscara (geralmente /8 = 255.0.0.0 no legado).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Exemplo: rede 2.0.0.0/8 → broadcast = 2.255.255.255 (muito ampla).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Solução simples: colocar PC/console no mesmo intervalo + mesma máscara, ou reconfigurar o nó em um plano 192/10.';

  @override
  String get ipBasicsSection3Paragraph =>
      'A máscara de sub-rede indica quais endereços estão “na mesma rede”. Sem máscara, um IP não significa muito.\n\nRegra de campo: se dois dispositivos estiverem na mesma sub-rede, eles conversam diretamente entre si. Caso contrário, eles precisam de um gateway (roteador).';

  @override
  String get ipBasicsSection3Callout1Title => 'Máscaras mais comuns';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 ) → rede 10.x.x.x “ampla” típica';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → rede 10.10.x.x ou 192.168.x.x \"larga\"';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → 192.168.0.x rede “clássica” (254 dispositivos)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Máscara → endereço de transmissão (muito útil para entender)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'A transmissão depende da sub-rede, portanto da máscara (não \"2 vs 192\").';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → transmissão = 192.168.10.255 (rede pequena).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → transmissão = 2.255.255.255 (rede enorme).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Quanto “maior” a rede, mais ruído uma transmissão pode produzir (se você a usar com frequência).';

  @override
  String get ipBasicsSection3Subtitle1 => 'Exemplo concreto (mais útil): /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP: 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Máscara: 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Rede: 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Dispositivos “na mesma rede”: 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'Se você for para 192.168.1.50 → NÃO é mais a mesma rede.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Por que criar sub-redes?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organização: “luz”, “vídeo”, “intercomunicador”, “internet” separados…';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Desempenho: limite o ruído (transmissão/multicast) para um grupo.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Segurança: evita que um PC “convidado” veja/interrompa a rede do programa.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnóstico: mais fácil saber “onde” está um dispositivo.';

  @override
  String get ipBasicsSection3Callout3Title => 'Armadilha clássica';

  @override
  String get ipBasicsSection3Bullet8 =>
      'Mesmo “início” de IP ≠ mesma rede se a máscara não for idêntica.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Ex: 10.0.0.5/8 e 10.0.0.200/24 ​​​​→ não são o mesmo perímetro lógico.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (atribuição automática)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Um servidor DHCP “dá”: IP + máscara + gateway + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 => 'Prático: você conecta, funciona.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Mostrar risco: se o DHCP cair/alterar/conflitar → sintomas estranhos.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Estático (IP fixo)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'Você define IP + máscara (e possivelmente gateway/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Muito útil para: console, nós, switch gerenciado, show AP Wi-Fi.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risco: IP duplicado se o plano não for claro (conflito).';

  @override
  String get ipBasicsSection4Callout1Title => 'Portal';

  @override
  String get ipBasicsSection4Bullet1 =>
      'Este é o endereço do roteador: serve para sair “fora da rede local”.';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Se você fizer uma rede de show isolada (sem Internet) → gateway muitas vezes inútil.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Mas se quiser sair para outra VLAN/Internet → essencial.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = \"diretório\": transforma um nome (ex: exemplo.com) em um IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'Em show (Art-Net/sACN), muitas vezes inútil: você trabalha em IP direto.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Se você usa serviços (UPDATE, licenças, servidor de horário, streaming) → O DNS torna-se útil novamente.';

  @override
  String get ipBasicsSection4Subtitle3 => 'Regra simples (para iniciantes)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Pequeno show fechado: estático em todos os lugares, sem gateway, sem DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Mostrar com Internet/múltiplas redes: DHCP controlado + reservas DHCP ou plano estático + roteador.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Quando A quer falar com B, ele olha para a máscara:\n• Se B estiver na mesma sub-rede → A envia diretamente para a rede local.\n• Se B estiver fora da sub-rede → A envia para o gateway (roteador), que cuida do resto.';

  @override
  String get ipBasicsSection5Callout1Title => 'Exemplo (fácil)';

  @override
  String get ipBasicsSection5Bullet1 => 'UMA = 192.168.0.10/24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → mesma rede → OK direto.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → rede diferente → precisa de roteador/gateway.';

  @override
  String get ipBasicsSection5Subtitle => 'Por que não pinga?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Máscara diferente → A pensa que B está “em outro lugar” (ou vice-versa).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Nenhum gateway → não é possível sair da sub-rede.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'Firewall do PC → ping bloqueado (Windows muito comum).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Cabo/switch/VLAN: fisicamente não estão no mesmo segmento.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Broadcast vs unicast (bônus útil)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast: para um IP específico (próprio).';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Broadcast: \"para todos\" na sub-rede (ruído).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'In show: a transmissão pode funcionar em pequena escala, mas rapidamente se torna uma fonte de ruído em uma grande rede.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plano A – ultra simples (uma rede/24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Rede: 192.168.10.0/24 (máscara 255.255.255.0)\n\nConsole: 192.168.10.10\nPC (controle): 192.168.10.20\nNó 1: 192.168.10.101\nNó 2: 192.168.10.102\nSwitch gerenciado: 192.168.10.2\nGateway: (vazio) ou 192.168.10.1 se houver roteador';

  @override
  String get ipBasicsSection6Callout1Title => 'Por que funciona bem';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Todos na mesma sub-rede → sem surpresas.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Fácil de explicar, fácil de solucionar.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Show ideal para iniciantes/pequenos e médios.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plano B – “10.x” quando você quiser crescer';

  @override
  String get ipBasicsSection6Code2 =>
      'Rede: 10.10.0.0/16 (máscara 255.255.0.0)\n\nConsole: 10.10.0.10\nComputador: 10.10.0.20\nNós: 10.10.1.10 → 10.10.1.200\nInterruptor: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Quando usar';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Quando você tem muitos equipamentos (ou várias zonas).';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Quando você planeja a VLAN mais tarde (luz/vídeo/TI).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plano C — compatibilidade Art-Net \"2.x.x.x\" (legado)';

  @override
  String get ipBasicsSection6Code3 =>
      'Rede: 2.0.0.0/8 (máscara 255.0.0.0)\n\nPC/console: 2.0.0.10\nNó 1: 2.0.0.100\nNó 2: 2.0.0.101\n\n⚠️ Rede isolada, sem internet, sem roteamento.';

  @override
  String get ipBasicsSection6Callout3Title => 'Atenção';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Este plano é prático para hardware antigo/padrão.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Mas evite misturar com uma LAN \"normal\" (192.168.x.x) sem roteador.';

  @override
  String get ipBasicsSection7Callout1Title => 'Sintomas → causas prováveis';

  @override
  String get ipBasicsSection7Bullet1 =>
      '“Vejo o nó, mas ele não responde” → máscara/VLAN/firewall diferente.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '“Um dispositivo funciona e depois desaparece” → Conflito DHCP / IP instável.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '“Nada funciona exceto no switch” → IP não está na mesma rede/cabo/porta VLAN errados.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '“Todas as linhas/perdas” → transmissão/multicast muito ampla/switch low-end/loop de rede.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '“Funciona com fio, mas não com Wi-Fi” → jitter / roaming / banda saturada / economia de energia.';

  @override
  String get ipBasicsSection7Subtitle => 'Método profissional em 5 minutos';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Observe IP + console/PC e máscara de nó.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Verifique: mesma sub-rede? (ex: 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (se possível) + teste de acesso à interface web do nó.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Se for DHCP: liste quem possui qual IP (tabela DHCP) e verifique se há duplicatas.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Se multicast sACN: verifique espionagem/consulta IGMP (caso contrário, inundação).';

  @override
  String get ipBasicsSection7Callout2Title => 'Armadilha muito comum';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Máscara \"Legacy\" em um PC (255.255.0.0 em vez de 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Resultado: você acredita que está “na mesma rede”, mas não como o outro dispositivo.';

  @override
  String get ipBasicsSection8Subtitle1 =>
      'Exercício 1: mesma rede ou não? (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'UMA = 192.168.10.50/24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ mesma rede';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ não é a mesma rede';

  @override
  String get ipBasicsSection8Subtitle2 => 'Exercício 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10/16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20/16 → ✅ mesma rede (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20/16 → ❌ não é a mesma rede';

  @override
  String get ipBasicsSection8CalloutTitle => 'Dica visual';

  @override
  String get ipBasicsSection8Bullet1 =>
      '/24 → os 3 primeiros números idênticos (A.B.C) = mesma rede.';

  @override
  String get ipBasicsSection8Bullet2 =>
      '/16 → os 2 primeiros números idênticos (A.B) = mesma rede.';

  @override
  String get ipBasicsSection8Bullet3 =>
      '/8 → o 1º número idêntico (A) = mesma rede.';

  @override
  String get ipBasicsSection8Subtitle3 => 'Exercício 3: Evite IPs “estranhos”';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x: Reservado (não é um IP de host normal).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x: loopback (seu próprio PC).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x: IP automático quando DHCP ausente (APIPA) → sinal de problema de DHCP.';

  @override
  String get ipBasicsSection9CalloutTitle =>
      'Antes de pesquisar do meio-dia às 14h.';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Mesma sub-rede = IP + máscara consistente.';

  @override
  String get ipBasicsSection9Bullet2 => 'Nenhum IP duplicado (conflito).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK se for masterizado; caso contrário, limpe o plano estático.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'Firewall do PC: pode bloquear ping/descoberta.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: boa porta, boa VLAN, sem loopback.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'sACN multicast: espionagem/consulta IGMP recomendada.';

  @override
  String get ipBasicsChecklistCopy =>
      'Rede – Lista de Verificação Rápida (IP)\n☐ Todos os dispositivos estão na mesma sub-rede (IP + máscara consistente)\n☐ Sem IP duplicado (conflito)\n☐ DHCP: todos no DHCP ou plano estático claro (evite mixagem borrada)\n☐ Para Art-Net/sACN: rede dedicada ou VLAN, se possível\n☐ Switch gerenciado se multicast/IGMP (sACN)\n☐ Wi-Fi: evite exibições de dados críticos (jitter), prefira com fio\n☐ Teste simples: ping + verificação de máscara/gateway';

  @override
  String get ipBasicsFooterNote =>
      'Objetivo: entender o suficiente para conectar/configurar/solucionar problemas rapidamente no show.\nOs detalhes da rede podem ser mais profundos, mas esses princípios básicos cobrem 90% das falhas de campo.';

  @override
  String get aboutDmxPainterTerm120 => 'PRAZO\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote =>
      '✅ Corrente de margarida\n❌ Sem Y passivo';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) — dica rápida';

  @override
  String get aboutDmxPainterPin1 => 'Pino 1: Blindagem/massa';

  @override
  String get aboutDmxPainterPin2 => 'Pino 2: Dados–';

  @override
  String get aboutDmxPainterPin3 => 'Pino 3: Dados +';

  @override
  String get aboutDmxPainterPin45 => 'Pino 4/5: “dados 2” (raro/opcional)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'Na prática: XLR3 frequentemente usado (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'ÚLTIMO\nDISPOSITIVO';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Terminação = 120Ω no final da linha';

  @override
  String get aboutDmxPainter120Between => '120Ω\nentre\nDados− e Dados+';

  @override
  String get aboutDmxPainterOneTermination =>
      '✅ Apenas um final\n❌ Não no meio\n❌ Não em todas as filiais';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLA\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'INTERRUPTOR\n(IGMP para sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NÓ 1\nDMX FORA';

  @override
  String get aboutDmxPainterNode2 => 'NÓ 2\nDMX FORA';

  @override
  String get aboutDmxPainterFix => 'CONSERTAR';

  @override
  String get aboutDmxPainterManyUniverses =>
      '✅ Muitos universos\n✅ Nós próximos às máquinas';

  @override
  String get aboutArtnetSection2Paragraph =>
      'Seu objetivo: que cada universo emitido pela fonte chegue ao nó certo (e à porta certa DMX) sem ambigüidade. A maioria das falhas de Art-Net = universo ruim, sub-rede/rede ruim ou transmissão saturada.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Método simples (que evita 80% dos erros)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Escreva no papel: “Universo 1 → Nó A porta 1”, “Universo 2 → Nó A porta 2”, etc.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Defina IPs estáveis ​​(DHCP reservado ou estático).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Prefira unicast se você tiver mais de um nó ou uma rede compartilhada.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Transmissão vs. Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast: você envia para todos → fácil, mas pode “inundar” um switch.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: você envia para o IP do nó → mais limpo e previsível.';

  @override
  String get aboutArtnetSection2SubBullet3 =>
      'Em exibição: em caso de dúvida → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universo: prática de campo';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Mantenha a numeração simples (ex.: 1…N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Evite “um universo em todos os lugares”: documente seus mapeamentos.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'Em certas configurações, existe \"Rede/Sub-rede/Universo\": pense em \"mapeamento\", não em \"mágica\".';

  @override
  String get aboutArtnetSection3CalloutTitle => 'Os limites “reais” (em ordem)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi: latência variável + perdas → oscilações ou interrupções.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Broadcast: sobrecarrega uma LAN (todos recebem tudo).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Switch “low-end”: buffers limitados, gerenciamento deficiente de multicast/broadcast.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Nós: limite de firmware/CPU (número de universos, frequência, opções).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/fonte: driver, carga de CPU, antivírus, placa de rede, etc.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Velocidade de atualização';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      '\"Clássico\" DMX geralmente tem ~20–44 fps dependendo do quadro.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'No IP você pode enviar mais, mas os nós nem sempre seguem (e nem sempre é útil).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Estabilidade > frequência: melhor estável a 30–40 fps do que “rápido”, mas instável.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Regras simples';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Rede dedicada (ou VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 => 'Unicast se houver vários nós.';

  @override
  String get aboutArtnetSection3SubBullet6 => 'Conectado para shows críticos.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Um nó = IP → DMX. Pode ter 1, 2, 4, 8 portas DMX. A estabilidade depende do nó E do cabeamento DMX no lado da saída (terminação, topologia, divisores).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Nós vs Divisores';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Nó: converte IP→DMX (e às vezes DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'Divisor DMX: distribui uma linha DMX em filiais (opto recomendado).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Bom design: IP até o mais próximo, então DMX curto e limpo.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM em Art-Net (suporte variável)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Alguns nós suportam um \"proxy RDM\": o console vê/configura dispositivos RDM via IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Outros não oferecem suporte total ou parcial ao RDM.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Um divisor óptico “clássico” pode bloquear o retorno RDM (dependendo do modelo).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Dica: Se você deseja RDM, escolha explicitamente o hardware marcado como compatível com RDM.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Bom reflexo de campo';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Se DMX instável: regra DMX primeiro (terminação, cabo, Y passivo) e depois apenas IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Se o RDM estiver instável: desativa o RDM para verificar se DMX puro está estável.';

  @override
  String get aboutArtnetSection5CalloutTitle => 'Sintomas → causas prováveis';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Cintilação em todo o quadro → Wi-Fi, inundação de transmissão, switch saturado.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Um nó OK, o outro não → universo/mapeamento, IP, unicast mal configurado.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Quedas aleatórias → cabo RJ45 com defeito, switch instável, perda de pacotes do PC.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Uma única porta DMX de um nó KO → cabo DMX, terminação, dispositivo que interrompe a linha.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'Descoberta RDM impossível → nó/divisor não compatível com RDM, cabeamento DMX “limítrofe”.';

  @override
  String get aboutArtnetSection5Subtitle => 'Método rápido';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Unicast para um único nó (teste simples).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Verifique universo/mapeamento (configuração de papel + nó).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Teste de fiação direta (PC → switch → nó) com cabo conhecido OK.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isole o DMX: nó → 1 dispositivo + terminação.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Arquitetura limpa (IP → nós → DMX abreviado)';

  @override
  String get aboutArtnetSection6Subtitle2 => 'Transmissão vs Unicast (ideia)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Recursos recomendados (opcional)';

  @override
  String get aboutArtnetExampleLabel => 'exemplo';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Copiar lista de ativos';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Seção destinada a ilustrar a rede (RJ45, switch, cabos). Se os ativos não existirem, o aplicativo exibirá seu próprio substituto.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Exemplos';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Conector Ethernet';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Trocar';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (idealmente gerenciado se for IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Cabo Ethernet';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = base confiável';

  @override
  String get aboutArtnetChecklistCopyTitle =>
      'Art-Net — Lista de verificação de campo';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Copiar lista de verificação';

  @override
  String get aboutArtnetChecklistTitle => 'Antes de entrar em pânico';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unicast se houver vários nós.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Rede dedicada (ou VLAN), se possível.';

  @override
  String get aboutArtnetChecklistBullet3 => 'Preparado para show crítico.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Universo/mapeamento documentado.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Teste IP simples → 1 nó → 1 dispositivo + terminação.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Se RDM: nó “proxy RDM” confirmado + cabeamento DMX estável';

  @override
  String get aboutArtnetFooterNote =>
      'Informação indicativa (terreno). Dependendo dos nós/switch/firmwares, o comportamento pode variar.\nObjetivo aqui: compreender e diagnosticar rapidamente.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'FONTE\n(PC/consola)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'TROCAR';

  @override
  String get aboutArtnetDiagramNode1Label => 'NÓ 1\nDMX FORA';

  @override
  String get aboutArtnetDiagramNode2Label => 'NÓ 2\nDMX FORA';

  @override
  String get aboutArtnetDiagramFixLabel => 'CONSERTAR';

  @override
  String get aboutArtnetDiagramInfoLabel => 'IP longo/curto DMX';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'FONTE';

  @override
  String get aboutArtnetDiagramNodeALabel => 'NÓ A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'NÓ B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'NÓ C';

  @override
  String get aboutArtnetDiagramUnicastLabel => 'Unicast: pacotes para um nó';

  @override
  String get aboutArtnetDiagramBroadcastLabel => 'Transmissão: todos recebem';

  @override
  String get aboutArtnetMissingAssetLabel => 'Recurso ausente';

  @override
  String get aboutRegistryDmxTitle => 'DMX — operação (simples e completa)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universo, endereços, frames, cabeamento RS-485, terminação, erros de campo.\nInclui diagramas + lista de verificação.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net — DMX sobre IP (nós, unicast/broadcast)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'Universo DMX em Ethernet/UDP, nós, broadcast vs unicast.\nLimites reais, estabilidade da rede, RDM de acordo com hardware, diagramas + checklist.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 — multicast, IGMP, prioridades';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Padrão DMX em rede profissional orientada a IP.\nMulticast/unicast, espionagem/consulta IGMP, prioridades de múltiplas fontes, esquemas + lista de verificação.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Rede — bases IP/máscara/DHCP (essencial)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Entenda IP, máscara, gateway, DHCP versus estático.\nExemplos concretos (2.x.x.x, 10.x, 192.168.x), testes rápidos, mostrar armadilhas.';

  @override
  String get aboutRegistryReseauTitle =>
      'Rede — RJ45/Fibra/velocidades e comprimentos';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distâncias típicas, mostram as melhores práticas.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Rede leve – VLAN, IGMP, Wi-Fi vs com fio';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Arquitetura simples e robusta para Art-Net/sACN.\nVLAN, espionagem/consulta IGMP, Wi-Fi (jitter), switches, diagramas + lista de verificação.';

  @override
  String get aboutRegistryVideoTitle => 'Vídeo — SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Escolha com base na latência, confiabilidade, cabeamento, rede LAN vs WAN.\nTabelas + diagrama.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Elétrico – Schuko / P17 / poderes';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Conectores, mono/tri, tabelas de kW rápido (16A→400A), coletores de campo.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'Computadores — USB/HDMI/DP/SATA/NVMe…';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Velocidades úteis, versões, limites reais, armadilhas de marketing.';

  @override
  String get aboutUniverseToHexColHex => 'Feitiço';

  @override
  String get aboutUniverseToHexNote => 'Índice = Universo − 1 (base 0).';

  @override
  String get aboutNetworkPageTitle => 'Rede leve – VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Copiar marcadores';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Cópia';

  @override
  String get aboutNetworkChecklistTitle => 'Antes de abrir o Wireshark 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Informação indicativa (terreno). Dependendo do hardware da rede, pode ser necessário IGMP/VLAN.\nObjetivo: permanecer simples e robusto.';

  @override
  String get aboutNetworkCopy1 =>
      'Rede leve: mira simples, dedicada e estável.';

  @override
  String get aboutNetworkCopy2 => 'VLAN = tráfego separado (leve vs. repouso).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = essencial se sACN multicast em grande escala.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = solução de problemas ok, raramente ok em produção crítica.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Rede leve — Lista de verificação\n☐ Rede dedicada ou VLAN leve\n☐ Limpar plano IP (DHCP ou estático) + máscara ok\n☐ Chave correta; loops evitados\n☐ Multicast sACN: espionagem IGMP ATIVADA\n☐ Consultador IGMP presente na VLAN (se necessário)\n☐ Unicast na solução de problemas (especialmente Art-Net)\n☐ Wi-Fi: evite produção crítica (jitter/perdas)\n☐ Testes: ping estável + carga progressiva (universo)';

  @override
  String get aboutNetworkToc1 => '1) Objetivo: rede estável';

  @override
  String get aboutNetworkToc2 => '2) Plano IP (simples)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (separação)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (multicastsACN)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi x com fio';

  @override
  String get aboutNetworkToc6 => '6) Trocar: o que você precisa';

  @override
  String get aboutNetworkToc7 => '7) Esquemas';

  @override
  String get aboutNetworkToc8 => '8) Lista de verificação';

  @override
  String get aboutNetworkBasicsPill1 => 'Dedicado/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Com fio';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP se multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Uma rede de iluminação deve ser previsível: baixas perdas, baixo jitter e arquitetura simples. Quando as coisas dão errado, raramente é “o protocolo” e muitas vezes a infraestrutura (switch, Wi-Fi, loops, inundação).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Regra básica';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'Se puder: com fio + switch correto + rede dedicada (ou VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'Se você tiver que compartilhar: VLAN + regras claras.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multicast: IGMP rapidamente se torna obrigatório.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Escolha uma estratégia simples e consistente. Duas abordagens: DHCP (simples) ou estática (previsível). O pior: uma mistura indocumentada.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Plano de exemplo (simples)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'VLAN leve: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Consola/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Nós: 10.10.0.100–150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Gerenciamento de mudança: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Erros clássicos';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Máscara diferente (ex: /24 vs /16) → máquinas invisíveis.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Dois dispositivos com o mesmo IP → comportamento aleatório.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + estático no mesmo intervalo sem controle → conflitos.';

  @override
  String get aboutNetworkVlanParagraph =>
      'Uma VLAN permite isolar a luz do resto (internet, produção de vídeo, convidados, etc.). Isso evita ruído na rede e reduz o risco de outro serviço interromper seu programa.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'O que você ganha';

  @override
  String get aboutNetworkVlanBullet1 => 'Tráfego menos espúrio.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Menos risco (DHCP externo, transmissão indesejada).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Depuração mais simples (tudo na VLAN = light).';

  @override
  String get aboutNetworkVlanSubtitle => 'Atenção';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'A VLAN = todas as portas devem estar configuradas corretamente (acesso/tronco).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'Se você não sabe: a rede “física” dedicada costuma ser mais simples.';

  @override
  String get aboutNetworkIgmpPill1 => 'Espionagem IGMP';

  @override
  String get aboutNetworkIgmpPill2 => 'Consultador IGMP';

  @override
  String get aboutNetworkIgmpPill3 => 'Inundação multicast';

  @override
  String get aboutNetworkIgmpParagraph =>
      'A espionagem IGMP permite que o switch saiba quais portas desejam qual multicast. Sem isso, o multicast pode ser inundado em todas as portas → saturação.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'Consultador IGMP (ideia simples)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'Em algumas redes/VLANs, é necessário um questionador para manter assinaturas IGMP.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'Sem dúvida: dependendo das opções, as assinaturas expiram e você vê “falhas”.';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'Se você estiver em uma rede dedicada pequena: às vezes tudo funciona, mas em uma rede grande: é fundamental.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Esquema: IGMP (ideia)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'Com fio';

  @override
  String get aboutNetworkWifiSubtitle2 => 'Wi-fi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      '✅ Latência estável, baixas perdas (se infraestrutura limpa).';

  @override
  String get aboutNetworkWifiSubBullet2 => '✅ Recomendado em produção.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      '✅ Prático (configuração rápida, tablet).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      '❌ Latência variável (jitter), perdas, interferências.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      '❌ Multicast às vezes é mal gerenciado dependendo do AP/config.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'Solução de problemas OK/configurações pequenas não críticas, raramente OK no show carregado.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Regra simples';

  @override
  String get aboutNetworkWifiBullet1 => 'Show crítico = conectado.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = conforto do operador (UI), não transporte principal DMX/IP se for grande volume.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Mínimo recomendado';

  @override
  String get aboutNetworkSwitchBullet1 => 'Switch Ethernet correto (não hub).';

  @override
  String get aboutNetworkSwitchBullet2 => 'Cabos OK (RJ45, conectores).';

  @override
  String get aboutNetworkSwitchBullet3 => 'Evite loops (ou STP controlado).';

  @override
  String get aboutNetworkSwitchBullet4 => 'Se sACN multicast: espionagem IGMP.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Gerenciado versus não gerenciado';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'Não gerenciado: ok pequena rede dedicada (simples).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Gerenciado: útil para VLAN/IGMP/diagnóstico (rede grande).';

  @override
  String get aboutNetworkDiagramsSubtitle1 => 'VLAN: luz/repouso separados';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi vs com fio (ideia)';

  @override
  String get aboutNetworkChecklistBullet1 =>
      'Plano IP claro, máscara consistente.';

  @override
  String get aboutNetworkChecklistBullet2 => 'Rede dedicada/VLAN leve.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Mude OK, sem loops.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP para multicast sACN.';

  @override
  String get aboutNetworkChecklistBullet5 =>
      'Wi-Fi evitado em produção crítica.';

  @override
  String get videoCameraExposureTitle => 'Exposição da câmera';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, velocidade e abertura.';

  @override
  String get videoCamPageTitle => 'Exposição da câmera';

  @override
  String get videoCamInfoTitle => 'Informação';

  @override
  String get videoCamIntro =>
      'Cálculos indicativos para relacionar lux, ISO, velocidade e abertura.';

  @override
  String get videoCamInputsTitle => 'Entradas';

  @override
  String get videoCamLuxLabel => '__TECNOLOGIA_13__';

  @override
  String get videoCamLuxHint => 'Exemplo: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Exemplo: 800';

  @override
  String get videoCamShutterLabel => 'Velocidade(s)';

  @override
  String get videoCamShutterHint => 'Exemplo: 1/50';

  @override
  String get videoCamApertureLabel => 'Abertura (f/)';

  @override
  String get videoCamApertureHint => 'Exemplo: 2,8';

  @override
  String get videoCamEvEmpty => '-';

  @override
  String get videoCamNote =>
      'Valores indicativos: a calibração depende do sensor, do cenário e dos padrões.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV$ev';
  }

  @override
  String videoCamApertureResult(Object aperture) {
    return 'Abertura: f/$aperture';
  }

  @override
  String videoCamShutterResult(Object shutter) {
    return 'Velocidade: ${shutter}s';
  }

  @override
  String get aboutDmxS2Title =>
      '2) Quadro DMX — quebra, código inicial, canais';

  @override
  String get aboutDmxS2PillBreak => 'Quebrar';

  @override
  String get aboutDmxS2PillStartCode => 'Código inicial';

  @override
  String get aboutDmxS2PillSlots512 => '512 vagas';

  @override
  String get aboutDmxS2PillRefresh => 'Atualizar';

  @override
  String get aboutDmxS2Intro =>
      'Um quadro DMX é enviado em loop. Começa com uma “pausa” (silêncio), depois um código de início e depois até 512 valores (0–255). Cada dispositivo lê apenas os canais que lhe dizem respeito (de acordo com o seu endereço e modo).';

  @override
  String get aboutDmxS2HowToReadTitle =>
      'Leia um quadro (de forma muito simples)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Break + MAB: marca o início do quadro (ressincronização).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Código inicial: geralmente 0x00 (dados de iluminação).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Slots 1→512: cada slot = 1 canal (0–255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'O quadro recomeça continuamente: é normal “sobrescrever” o valor antigo.';

  @override
  String get aboutDmxS2PracticalTitle => 'Na prática';

  @override
  String get aboutDmxS2PracticalB1 =>
      'Um modo de 16 bits utiliza 2 canais para a mesma função (por exemplo: Pan grosseiro + Pan fino).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'Quanto mais universos você envia, mais aumenta a carga geral (consoles/nós/rede).';

  @override
  String get aboutDmxS2PracticalB3 =>
      'Se você tiver cintilação, pense primeiro nos cabos/terminações/conexões antes de suspeitar do console.';

  @override
  String get aboutDmxS3Title =>
      '3) Cabeamento DMX — RS-485, topologia, pinagem';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Corrente de margarida';

  @override
  String get aboutDmxS3PillNoY => 'Não S';

  @override
  String get aboutDmxS3Pill120ohm => '120Ω';

  @override
  String get aboutDmxS3Intro =>
      'DMX512 é baseado em RS-485: um barramento diferencial que gosta de linhas limpas. A regra de ouro: uma cadeia (em cadeia) da fonte até os dispositivos, depois uma terminação no final.';

  @override
  String get aboutDmxS3TopologyTitle => 'Topologia recomendada';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Fonte → Dispositivo 1 → Dispositivo 2 → … → último dispositivo.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Evite desvios em Y: eles criam reflexos (instabilidade).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'Se você tiver que fazer ramificações: use um divisor DMX com isolamento opto.';

  @override
  String get aboutDmxS3PinoutTitle => 'Conexões (lembrete)';

  @override
  String get aboutDmxS3CablesTitle => 'Cabos: o que realmente funciona';

  @override
  String get aboutDmxS3CablesB1 =>
      'Usa um cabo DMX (impedância ~120 Ω), não um microfone aleatório (a menos que seja uma solução de problemas curta).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Mantenha os comprimentos razoáveis ​​e evite enrolamentos apertados perto de fontes de alimentação/dimmers.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Cabo ruim = às vezes “funciona”… até o dia em que não funciona (umidade, comprimento, carga).';

  @override
  String get aboutDmxS4Title =>
      '4) Terminação e divisores – estabilidade do barramento';

  @override
  String get aboutDmxS4Intro =>
      'Em um barramento RS-485, a terminação evita reflexões no final da linha. Divisores (opto-isolados) são usados ​​para criar galhos limpos e proteger a fonte.';

  @override
  String get aboutDmxS4TerminatorTitle => 'Terminação (120 Ω): quando e como';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Coloca uma terminação no último dispositivo (ou um plugue XLR).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Apenas uma terminação por linha (não em todos os lugares).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Essencial em longas filas, grandes cargas, ambientes ruidosos.';

  @override
  String get aboutDmxS4SplittersTitle => 'Divisores / opto-isolamento';

  @override
  String get aboutDmxS4SplittersB1 => 'Permite fazer 2, 4, 8 ramos sem “Y”.';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Isola eletricamente: limita os loops de aterramento e protege o console/nó.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Prático para “reconduzir” um sinal em longas distâncias.';

  @override
  String get aboutDmxS5Title =>
      '5) Solução de problemas — método simples (rápido e confiável)';

  @override
  String get aboutDmxS5Intro =>
      'Quando um dispositivo não está respondendo, o segredo é isolar: é o endereço, o modo, a linha DMX ou o dispositivo? Siga uma pequena lista de verificação antes de reconfigurar tudo.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Lista de verificação rápida';

  @override
  String get aboutDmxS5QuickB1 =>
      'Endereço DMX correto? (e não 001 vs 000 dependendo da tela).';

  @override
  String get aboutDmxS5QuickB2 => 'Modo DMX correto (número de canais)?';

  @override
  String get aboutDmxS5QuickB3 => 'Bom universo/saída (console, nó, porta)?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Teste com um cabo OK conhecido e substitua um por um.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Adicione/remova um final no final da linha para ver o efeito.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'Se piscar / pegar';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Procure um \"Y\" oculto, um divisor inadequado ou um adaptador XLR defeituoso.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Mantém DMX longe de fontes de alimentação/dimmers, evita grandes laços de cabos.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Reduza a complexidade: 1 universo, 1 linha, 1 dispositivo e então você reconstrói.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Regra de ouro';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'Você deve ser capaz de operar um único dispositivo em uma única linha. Se esse teste básico falhar, o problema não é “todo o patch”: é o endereçamento, o cabeamento ou o hardware.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net — DMX em IP (vocabulário e armadilhas)';

  @override
  String get aboutDmxS6PillUdp => 'UDP';

  @override
  String get aboutDmxS6PillNodes => 'Nós';

  @override
  String get aboutDmxS6PillBroadcast => 'transmissão';

  @override
  String get aboutDmxS6PillUnicast => 'Unicast';

  @override
  String get aboutDmxS6Intro =>
      'Art-Net transporta universos DMX através de Ethernet (UDP). Um console/software envia universos pela rede e um nó os converte em saídas físicas DMX.';

  @override
  String get aboutDmxS6BasicsTitle => 'Para lembrar';

  @override
  String get aboutDmxS6BasicsB1 => 'Um nó = rede ↔ DMX (várias portas).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'Broadcast envia para todos (simples mas pode saturar).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'O Unicast envia apenas para o nó de destino (geralmente mais estável em plataformas grandes).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Tenha cuidado ao contar universos: muitas vezes Art-Net começa em 0 (Universo 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => 'Quando escolher Art-Net?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Equipamentos pequenos/médios, configurações rápidas, muitos equipamentos compatíveis.';

  @override
  String get aboutDmxS6WhenB2 =>
      'OK se a rede estiver limpa (switch correto, cabos, sem Wi-Fi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'Se saturar: mude para unicast e segmente a rede (VLAN/rede dedicada).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) — multicast, prioridades, rede própria';

  @override
  String get aboutDmxS7PillE131 => 'E1.31';

  @override
  String get aboutDmxS7PillMulticast => 'Multitransmissão';

  @override
  String get aboutDmxS7PillPriority => 'Prioridade';

  @override
  String get aboutDmxS7PillIgmp => 'IGMP';

  @override
  String get aboutDmxS7Intro =>
      'sACN (ANSI E1.31) é um padrão moderno para transporte de universos DMX por IP. É amplamente utilizado em grandes sistemas porque gerencia bem o multicast e as prioridades.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Ideias-chave';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast: um universo é um “grupo” de rede (os nós se inscrevem).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'Espionagem IGMP em switches = essencial em grande escala (caso contrário, inunda).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Prioridade: várias fontes possíveis, vence aquela que tiver maior prioridade.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Como Art-Net: rede limpa + cabos/switch de qualidade = estabilidade.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN — resumo (o que escolher?)';

  @override
  String get aboutDmxS8Intro =>
      'Em última análise, todos os três fazem a mesma coisa: controlar canais. A diferença se resume à distribuição (cabo DMX vs. rede), escala e robustez.';

  @override
  String get aboutDmxS8QuickTableTitle => 'Resumo em 4 linhas';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX: simples, robusto, 1 cabo = 1 linha (512 canais).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net: muito comum, fácil de implantar, cuidado com a transmissão.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN: mais \"sistemas pró-grandes\", multicast + prioridades, requer uma rede bem configurada.';

  @override
  String get aboutDmxS8QuickB4 =>
      'Em todos os casos: documentação + testes progressivos = enorme economia de tempo.';

  @override
  String get aboutDmxS8ChooseTitle => 'Escolha rápida';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Configuração pequena: DMX direto ou Art-Net (simples).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Muitos universos: rede dedicada + nós; Art-Net em unicast ou sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Plataformas/infraestruturas muito grandes: sACN + switches/IGMP bem gerenciados.';

  @override
  String get aboutSunTimesTitle => 'Sol (nascer/pôr)';

  @override
  String get aboutSunTimesSubtitle =>
      'Escolha de uma cidade e uma data, nascer do sol/horas definidas + limiares (lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'Rede – benchmarks de campo';

  @override
  String get aboutReseauSummaryCopy =>
      'REDE — benchmarks de campo\n• RJ45: Cat5e/6/6A → 1G/10G dependendo da distância.\n• Fibra: longa distância + imunidade EMI.\n• Switch: IGMP importante para multicast sACN.\n• VLAN: luz/vídeo/TI separados = estabilidade.';

  @override
  String get aboutReseauChecklistCopy =>
      'REDE – Lista de verificação\n☐ Plano IP claro (alcance/máscaras)\n☐ Chave correta (IGMP se sACN multicast)\n☐ VLAN se vários “mundos” (luz/vídeo/TI)\n☐ Cabos testados e etiquetados\n☐ Fibra: módulos compatíveis + conectores próprios\n☐ Evite loops (STP) + evite Wi-Fi público na LAN show';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Cópia';

  @override
  String get aboutReseauFooterNote =>
      'Informação indicativa (terreno). As capacidades exatas variam dependendo do hardware/cabos/módulos.\nObjetivo: benchmarks simples + método confiável.';

  @override
  String get aboutReseauToc1 =>
      '1) Noções básicas de rede (LAN/IP/taxa de transferência)';

  @override
  String get aboutReseauToc2 => '2) RJ45 e categorias (Cat5e/6/6A/…)';

  @override
  String get aboutReseauToc3 => '3) PoE (fonte de alimentação de rede)';

  @override
  String get aboutReseauToc4 => '4) Fibra (SM/MM) + conectores (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP/SFP+/QSFP (módulos)';

  @override
  String get aboutReseauToc6 => '6) Switches (VLAN/IGMP/QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN na rede (conselho)';

  @override
  String get aboutReseauToc8 => '8) Lista de verificação';

  @override
  String get aboutReseauSection1Title => 'As 3 ideias simples';

  @override
  String get aboutReseauSection1Bullet1 => 'IP = endereço (ex: 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = rede local via switch (não “internet”).';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Fluxo = capacidade (1G, 10G, etc.), mas a estabilidade também depende do switch.';

  @override
  String get aboutReseauSection1Title2 => 'Mostrar topologia (limpa)';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Console/PC → switch central → nós/servidores.';

  @override
  String get aboutReseauSection1Bullet5 =>
      'Evite “redes em cadeia” aleatórias.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Se possível: uma rede de shows dedicada (não Wi-Fi público).';

  @override
  String get aboutReseauSection2Title => 'Referências rápidas';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e: 1 Gbit/s “clássico” (até 100m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6: 1G/10G (10G em distâncias mais curtas).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A: 10G até 100m (referência prática).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Além: Cat7/8 existe, mas Cat6A costuma ser o ponto ideal no campo.';

  @override
  String get aboutReseauSection2Title2 => 'Chão';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Sempre teste/etiquete os cabos (especialmente quando alugados).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Evite conectores danificados: um RJ45 “cansado” = falhas fantasmas.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Planeje 10G se você fizer vídeo IP pesado.';

  @override
  String get aboutReseauSection3Paragraph =>
      'PoE permite alimentar equipamentos via RJ45 (câmera IP, AP Wi-Fi, pequenos nós, etc.). O ponto crítico: o orçamento total de PoE da mudança.';

  @override
  String get aboutReseauSection3Title => 'Marcos';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt superior.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'O switch tem um “orçamento” total (ex.: 120W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'Se você exceder o orçamento: algumas portas não acendem/reiniciam mais.';

  @override
  String get aboutReseauSection4Title => 'Por que a fibra está em exibição';

  @override
  String get aboutReseauSection4Bullet1 => 'Distâncias muito longas.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Imunidade a parasitas (EMI), superior em ambientes movimentados.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Prático para conectar FOH ↔ estágio ↔ sala de controle.';

  @override
  String get aboutReseauSection4Title2 => 'Multimodo vs Monomodo (marca única)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimodo (MM): distâncias “médias” (geralmente edifício/plataforma).';

  @override
  String get aboutReseauSection4Bullet5 =>
      'Modo único (SM): distâncias muito longas.';

  @override
  String get aboutReseauSection4Bullet6 =>
      'Os módulos (SFP) devem corresponder ao tipo de fibra.';

  @override
  String get aboutReseauSection4Title3 => 'Conectores';

  @override
  String get aboutReseauSection4Bullet7 => 'LC: pequeno, muito comum em SFP.';

  @override
  String get aboutReseauSection4Bullet8 =>
      'SC: maior, comum em infraestrutura.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Sempre proteja/limpe (poeira = perdas).';

  @override
  String get aboutReseauSection5Title => 'Marcos';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP: geralmente 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+: geralmente 10G.';

  @override
  String get aboutReseauSection5Bullet3 =>
      'QSFP/QSFP+: 40G (dependendo do uso).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'Um módulo = velocidade + tipo de fibra + comprimento (tudo deve ser consistente).';

  @override
  String get aboutReseauSection5Paragraph =>
      'Na prática: leve módulos compatíveis com o switch (e idealmente do mesmo fornecedor/modelo) para evitar surpresas.';

  @override
  String get aboutReseauSection6Title => 'Funções úteis em exibição';

  @override
  String get aboutReseauSection6Bullet1 => 'VLAN: luz/vídeo/TI separados.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'Espionagem IGMP: essencial se você usar multicast sACN em grande escala.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS: útil se você misturar muitos fluxos (dependendo do contexto).';

  @override
  String get aboutReseauSection6Title2 => 'Erros comuns';

  @override
  String get aboutReseauSection6Bullet4 =>
      'Switch “barato” que inunda o multicast → rede que entra em colapso.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Loop de rede sem STP → tempestade de transmissão.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Wi-Fi público na mesma LAN do programa → instabilidade.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (campo)';

  @override
  String get aboutReseauSection7Bullet1 =>
      'Muitas vezes simples de configurar.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'A transmissão é possível em pequenas LANs dedicadas, mas o unicast é mais limpo.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Mapeamento de universo/porta = ponto número 1 a ser verificado.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (campo)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast: eficaz, mas requer uma troca correta (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Prioridades: útil se houver múltiplas fontes.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'Em grandes programas: sACN + IGMP costuma ser a escolha “limpa”.';

  @override
  String get aboutReseauChecklistTitle => 'Rápido';

  @override
  String get aboutReseauChecklistBullet1 => 'Chave correta + cabos limpos.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP se sACN multicast.';

  @override
  String get aboutReseauChecklistBullet3 => 'Usos separados (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 – multicast e prioridades';

  @override
  String get aboutSacnCopyTooltip => 'Copiar marcadores';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Cópia';

  @override
  String get aboutSacnFooterNote =>
      'Informação indicativa (terreno). Os comportamentos dependem de switches (IGMP), nós e firmware.\nObjetivo: compreender e estabilizar uma rede sACN.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX sobre IP (UDP), mostra padrão.';

  @override
  String get aboutSacnCopy2 => 'Universo sACN = 1..63999 (faixa padrão).';

  @override
  String get aboutSacnCopy3 =>
      'Multicast: espionagem IGMP recomendada, caso contrário, inundação.';

  @override
  String get aboutSacnCopy4 =>
      'Prioridade: útil com múltiplas fontes (console + backup).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) — Lista de verificação de campo\n☐ Chave correta (idealmente gerenciável)\n☐ Snooping IGMP habilitado se multicast\n☐ (Se possível) Consultador IGMP presente na VLAN (caso contrário, é possível um comportamento estranho)\n☐ Unicast se a rede não for controlada/solução de problemas\n☐ Prioridades: verifique múltiplas fontes (console/backup)\n☐ Mapeamento de universo ↔ portas de nós verificadas\n☐ Wi-Fi evitado na produção';

  @override
  String get aboutSacnToc1 => '1) Para que é usado sACN?';

  @override
  String get aboutSacnToc2 => '2) Universo (numeração)';

  @override
  String get aboutSacnToc3 => '3) Multicast/Unicast + IGMP';

  @override
  String get aboutSacnToc4 => '4) Prioridades (multifontes)';

  @override
  String get aboutSacnToc5 => '5) Limites/desempenho';

  @override
  String get aboutSacnToc6 => '6) RDM & sACN (proxy / dependendo do hardware)';

  @override
  String get aboutSacnToc7 => '7) Esquemas';

  @override
  String get aboutSacnToc8 => '8) Lista de verificação';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multitransmissão';

  @override
  String get aboutSacnSection1Pill3 => 'Prioridade';

  @override
  String get aboutSacnSection1Paragraph =>
      'sACN (E1.31) é um padrão amplamente utilizado para transportar universos DMX por IP. Geralmente é preferido quando você deseja uma arquitetura de rede limpa: multicast bem gerenciado, prioridades padronizadas e comportamento de rede mais profissional.';

  @override
  String get aboutSacnSection1Title => 'Quando está ótimo';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Muitos universos em uma rede bem gerenciada.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Instalações/grandes redes com diversas fontes (prioridades).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'Quando você deseja evitar “transmissão para todos os lugares”.';

  @override
  String get aboutSacnSection2Pill1 => 'Universo 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 slots/universo';

  @override
  String get aboutSacnSection2Paragraph =>
      'Um universo sACN corresponde a um universo DMX: até 512 slots. A numeração padrão sACN é 1..63999. Na prática, o importante é o mapeamento console ↔ nó ↔ porta DMX.';

  @override
  String get aboutSacnSection2Title => 'Erro clássico';

  @override
  String get aboutSacnSection2Bullet1 =>
      'Você altera o número do universo no lado do console, mas não no lado do nó (ou vice-versa).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'Você corrige o \"Universo 0\" enquanto o hardware espera uma base 1.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Você está misturando convenções de numeração entre ferramentas.';

  @override
  String get aboutSacnSection3Paragraph =>
      'sACN geralmente usa multicast: cada universo “vive” em um grupo multicast e os nós assinam os universos de que precisam.';

  @override
  String get aboutSacnSection3Title => 'Espionagem IGMP (por que é importante)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Sem IGMP: o switch inunda o multicast em todos os lugares → possível sobrecarga.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Com IGMP: o switch envia apenas para portas de assinante → rede estável.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'Em grandes volumes: IGMP costuma ser A diferença entre “funciona” e “é um inferno”.';

  @override
  String get aboutSacnSection3Subtitle => 'Esquema: multicast e IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (opção)';

  @override
  String get aboutSacnSection3SubBullet1 =>
      'Possível dependendo dos consoles/nós.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Útil para solução de problemas ou se a rede multicast não for controlada.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Menos elegante, mas às vezes mais simples.';

  @override
  String get aboutSacnSection4Pill1 => 'Fonte A prior 100';

  @override
  String get aboutSacnSection4Pill2 => 'Fonte B anterior 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'sACN gerencia uma noção de prioridade: se diversas fontes enviam o mesmo universo, o receptor mantém a fonte com maior prioridade. Muito útil com um console principal + console de backup + servidor de mídia.';

  @override
  String get aboutSacnSection4Title => 'Armadilhas';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Duas fontes indesejadas no mesmo universo → “está brigando”.';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Prioridade mal definida → backup que assume o controle.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Depurar: corte uma fonte e verifique quem ganha.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Trocar';

  @override
  String get aboutSacnSection5Pill3 => 'Wi-Fi não';

  @override
  String get aboutSacnSection5Pill4 => 'Nó CPU';

  @override
  String get aboutSacnSection5Title => 'O que quebra primeiro';

  @override
  String get aboutSacnSection5Bullet1 => 'Multicast sem IGMP → inundação.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Chave inadequada (buffers/CPU) → perdas.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → instabilidade/quedas.';

  @override
  String get aboutSacnSection5Bullet4 => 'Nós limitados (portas, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Regras simples';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Switch gerenciado + espionagem IGMP em muitos universos.';

  @override
  String get aboutSacnSection5SubBullet2 => 'VLAN leve dedicada, se possível.';

  @override
  String get aboutSacnSection5SubBullet3 =>
      'Unicast para isolar na solução de problemas.';

  @override
  String get aboutSacnSection6Paragraph =>
      'Tal como acontece com Art-Net, o RDM \"sobre IP\" geralmente depende de um mecanismo de proxy nos nós. O padrão sACN não implica automaticamente que seu nó execute RDM corretamente.';

  @override
  String get aboutSacnSection6Title => 'Para verificar no documento do nó';

  @override
  String get aboutSacnSection6Bullet1 => 'Proxy RDM / suporte RDM sobre IP.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Limitações (somente descoberta, pedidos parciais).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatibilidade com divisores/lado óptico DMX.';

  @override
  String get aboutSacnSection6Subtitle => 'Método de campo';

  @override
  String get aboutSacnSection6SubBullet1 => 'Estabilize DMX sem RDM.';

  @override
  String get aboutSacnSection6SubBullet2 =>
      'Teste o RDM em uma linha simples e limpa.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'Se você tiver problemas: desative o RDM e isole o nó/divisor.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multicast + IGMP (ideia)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Prioridades (2 fontes)';

  @override
  String get aboutSacnChecklistTitle => 'Antes de acusar “o protocolo”';

  @override
  String get aboutSacnChecklistBullet1 =>
      'A espionagem IGMP está habilitada se for multicast.';

  @override
  String get aboutSacnChecklistBullet2 => 'VLAN dedicada, se possível.';

  @override
  String get aboutSacnChecklistBullet3 => 'Unicast na solução de problemas.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Prioridades consistentes se forem de múltiplas fontes.';

  @override
  String get aboutSacnChecklistBullet5 => 'Wi-Fi evitado na produção.';

  @override
  String get sunTimesTitle => 'Nascer/pôr do sol';

  @override
  String get sunTimesSectionSettings => 'Configurações';

  @override
  String get sunTimesSectionResults => 'Resultados';

  @override
  String get sunTimesSectionTimeline => 'Linha do tempo (etapas de 30 minutos)';

  @override
  String get sunTimesSectionTwilight => 'O que são crepúsculos?';

  @override
  String get sunTimesSectionLux => 'Limites de brilho (benchmarks)';

  @override
  String get sunTimesIntro =>
      'Escolha uma cidade e uma data. Os tempos são indicativos (arredondados).';

  @override
  String get sunTimesLabelCity => 'Cidade';

  @override
  String get sunTimesLabelDate => 'Data';

  @override
  String get sunTimesNoteApprox =>
      'Tempos indicativos — podem variar dependendo da altitude, refração e clima.';

  @override
  String get sunTimesNoData => '-';

  @override
  String get sunTimesResultSunrise => 'Nascer do sol';

  @override
  String get sunTimesResultSunset => 'Pôr do sol';

  @override
  String get sunTimesResultCivilDawn => 'Amanhecer civil';

  @override
  String get sunTimesResultCivilDusk => 'Crepúsculo civil';

  @override
  String get sunTimesResultNauticalDawn => 'Amanhecer náutico';

  @override
  String get sunTimesResultNauticalDusk => 'Crepúsculo náutico';

  @override
  String get sunTimesResultAstronomicalDawn => 'Amanhecer astronômico';

  @override
  String get sunTimesResultAstronomicalDusk => 'Crepúsculo astronômico';

  @override
  String get sunTimesTimelineStep30 => 'Etapas: 30 minutos';

  @override
  String get sunTimesTimelineDay => 'Dia';

  @override
  String get sunTimesTimelineCivil => 'Civil';

  @override
  String get sunTimesTimelineNautical => 'Náutico';

  @override
  String get sunTimesTimelineAstronomical => 'Astronômico';

  @override
  String get sunTimesTimelineNight => 'Noite';

  @override
  String get sunTimesTwilightIntro =>
      'Os crepúsculos são definidos pela altura do Sol abaixo do horizonte. Essas definições são padronizadas.';

  @override
  String get sunTimesTwilightCivilTitle => 'Civil (≈ 0° a −6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Fim/início do dia. Ainda podemos ver claramente a paisagem.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Náutico (≈ −6° a −12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'A linha do horizonte torna-se difícil de distinguir. O céu está visivelmente mais escuro.';

  @override
  String get sunTimesTwilightAstronomicalTitle => 'Astronômico (≈ −12° a −18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'O céu está próximo da escuridão total (pouca luz residual).';

  @override
  String get sunTimesLuxNight => 'Noite escura';

  @override
  String get sunTimesLuxAstro => 'Astro Crepúsculo';

  @override
  String get sunTimesLuxNautical => 'Anoitecer.';

  @override
  String get sunTimesLuxCivil => 'Crepúsculo civil';

  @override
  String get sunTimesLuxVeryLow => 'Muito fraco';

  @override
  String get sunTimesLuxLow => 'Fraco';

  @override
  String get sunTimesLuxDay => 'Dia';

  @override
  String get sunTimesLuxFullDay => 'Dia inteiro';

  @override
  String get sunTimesLuxNote =>
      'Esses valores são referências típicas (clima, estação do ano, ambiente → variações).';

  @override
  String get aboutVideoPageTitle => 'Vídeo — marcadores de campo';

  @override
  String get aboutVideoSummaryCopy =>
      'VÍDEO — referências de campo\n• Resolução = tamanho (px). FPS = fluidez/latência.\n• 4:2:2 / 4:4:4 + 10 bits = qualidade de cor.\n• SDI = robusto + longa distância.\n• HDMI = frágil + curto.\n• NDI = IP (rede), depende da LAN.\n• Genlock / Timecode = sincronização.';

  @override
  String get aboutVideoChecklistCopy =>
      'VÍDEO - Lista de verificação\n☐ Mesma resolução e FPS em todos os lugares\n☐ HDMI: EDID / HDCP masterizado\n☐ SDI: cabo 75Ω + bom padrão\n☐ NDI/IP: própria LAN (switch, velocidade)\n☐ Genlock / Timecode se for necessária sincronização\n☐ Fonte de teste → tela direta';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Cópia';

  @override
  String get aboutVideoFooterNote =>
      'Informação indicativa (terreno). Os comportamentos variam dependendo do hardware.\nObjetivo: compreender rapidamente e solucionar problemas adequadamente.';

  @override
  String get aboutVideoToc1 => '1) Noções básicas de vídeo (palavras-chave)';

  @override
  String get aboutVideoToc2 => '2) Resolução e FPS';

  @override
  String get aboutVideoToc3 => '3) Cor (4:4:4/4:2:2/10 bits)';

  @override
  String get aboutVideoToc4 => '4) Sincronização (Genlock/Timecode)';

  @override
  String get aboutVideoToc5 => '5) Cabos e distâncias';

  @override
  String get aboutVideoToc6 => '6) SDI (3G/6G/12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI – campo';

  @override
  String get aboutVideoToc8 => '8) NDI — quando/por que/limites';

  @override
  String get aboutVideoToc9 => '9) Mapeamento / LED / multiprojeto';

  @override
  String get aboutVideoSection1Paragraph =>
      'Vídeo é uma imagem (pixels) enviada em uma taxa (FPS), com estrutura de cores (amostragem/profundidade de bits), transportada por um link (SDI/HDMI/IP) e às vezes sincronizada.';

  @override
  String get aboutVideoSection1Title => 'Vocabulário útil';

  @override
  String get aboutVideoSection1Bullet1 => 'Resolução: largura×altura (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS: fluidez/latência.';

  @override
  String get aboutVideoSection1Bullet3 => 'Progressivo (p) vs entrelaçado (i).';

  @override
  String get aboutVideoSection1Bullet4 => 'Codec: compressão (H.264, H.265…).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latência: revisão ao vivo.';

  @override
  String get aboutVideoSection2Title => 'Resolução';

  @override
  String get aboutVideoSection2Bullet1 => '1080p = 1920×1080.';

  @override
  String get aboutVideoSection2Bullet2 => '4KUHD = 3840×2160.';

  @override
  String get aboutVideoSection2Bullet3 => 'DCI 4K = 4096×2160 (cinema).';

  @override
  String get aboutVideoSection2Bullet4 => 'Mais pixels = mais rendimento.';

  @override
  String get aboutVideoSection2Title2 => 'FPS';

  @override
  String get aboutVideoSection2Bullet5 => '25/50: padrão europeu.';

  @override
  String get aboutVideoSection2Bullet6 => '30/60: Padrão/dispositivos dos EUA.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Evite misturar 50 e 60 sem conversão.';

  @override
  String get aboutVideoSection3Title => 'Amostragem';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4: gráficos/codificação.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2: profissional atual.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0: arquivos/stream.';

  @override
  String get aboutVideoSection3Title2 => 'Profundidade de bits';

  @override
  String get aboutVideoSection3Bullet4 => '8 bits: padrão.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10 bits: melhores gradientes (HDR/LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 => 'Sincroniza a atualização da imagem.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Útil em multi-câmaras/LED/transmissão.';

  @override
  String get aboutVideoSection4Title2 => 'Código de tempo';

  @override
  String get aboutVideoSection4Bullet3 => 'Sincronização de tempo.';

  @override
  String get aboutVideoSection4Bullet4 => 'Não substitui o genlock.';

  @override
  String get aboutVideoSection5Title => 'Regras simples';

  @override
  String get aboutVideoSection5Bullet1 => 'HDMI: frágil, curto.';

  @override
  String get aboutVideoSection5Bullet2 => 'SDI: robusto, longo.';

  @override
  String get aboutVideoSection5Bullet3 => 'Fibra: muito longa + livre de EMI.';

  @override
  String get aboutVideoSection6Title => 'Marcos';

  @override
  String get aboutVideoSection6Bullet1 => '3G: 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G: 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G: 2160p60';

  @override
  String get aboutVideoSection7Title => 'Para assistir';

  @override
  String get aboutVideoSection7Bullet1 => 'EDI';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Comprimentos';

  @override
  String get aboutVideoSection8Title => 'IP de vídeo';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexível.';

  @override
  String get aboutVideoSection8Bullet2 => 'Carga de rede.';

  @override
  String get aboutVideoSection8Bullet3 => 'É necessária LAN própria.';

  @override
  String get aboutVideoSection9Title => 'Chão';

  @override
  String get aboutVideoSection9Bullet1 => 'Mesma resolução/FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Mapeamento correto.';

  @override
  String get aboutVideoSection9Bullet3 => 'Teste com mira.';

  @override
  String get aboutVideoChecklistTitle => 'Antes de entrar em pânico';

  @override
  String get aboutVideoChecklistBullet1 => 'Verifique a resolução/FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Fonte de teste → tela.';

  @override
  String get aboutVideoChecklistBullet3 => 'Simplifique a cadeia.';

  @override
  String get homeBpmSubtitle => 'Tap tempo, conversão BPM ↔ ms, Hz, medição.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Toque no ritmo';

  @override
  String get bpmTapButton => 'Tipo';

  @override
  String get bpmResetTap => 'Redefinir torneiras';

  @override
  String get bpmDetectedLabel => 'BPM detectado';

  @override
  String get bpmTapHint =>
      'Toque várias vezes (de preferência 4 a 8 toques) para obter uma média estável.';

  @override
  String get bpmManualTitle => 'BPM manual';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ex. 128';

  @override
  String get commonAdd => 'Adicionar';

  @override
  String get commonEdit => 'Para modificar';

  @override
  String get commonDelete => 'EXCLUIR';

  @override
  String get commonCopied => 'Copiado para a área de transferência.';

  @override
  String get patchCreateGdtfTitle => 'Crie um GDTF (simples)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Criação manual de um dispositivo em forma de tabela.';

  @override
  String get gdtfSimpleTitle => 'Criador GDTF (simples)';

  @override
  String get gdtfDeviceSectionTitle => 'Dispositivo';

  @override
  String get gdtfChannelsSectionTitle => 'Canais';

  @override
  String get gdtfImportJsonTitle => 'Importar JSON';

  @override
  String get gdtfExportJsonTitle => 'Exportar JSON';

  @override
  String get gdtfImportJsonHint => 'Cole o JSON aqui';

  @override
  String get gdtfManufacturerLabel => 'Fabricante';

  @override
  String get gdtfModelLabel => 'Modelo';

  @override
  String get gdtfModeNameLabel => 'Nome do modo';

  @override
  String get gdtfChannelsCountLabel => 'Canais';

  @override
  String get gdtfFootprintLabel => 'Pegada';

  @override
  String get gdtfColIndex => '#';

  @override
  String get gdtfColName => 'Nome';

  @override
  String get gdtfColDmx => '__TECNOLOGIA_0__';

  @override
  String get gdtfColType => 'Tipo';

  @override
  String get gdtfColRes => '16/08';

  @override
  String get gdtfColDefault => 'Padrão';

  @override
  String get gdtfColActions => 'Ações';

  @override
  String get gdtfMoveUp => 'Para subir';

  @override
  String get gdtfMoveDown => 'Para descer';

  @override
  String get gdtfChannelAddTitle => 'Adicionar um canal';

  @override
  String get gdtfChannelEditTitle => 'Editar canal';

  @override
  String get gdtfFieldName => 'Nome';

  @override
  String get gdtfFieldDmx => 'Endereço DMX';

  @override
  String get gdtfFieldType => 'Tipo';

  @override
  String get gdtfFieldResolution => 'Resolução';

  @override
  String get gdtfRes8 => '8 bits';

  @override
  String get gdtfRes16 => '16 bits';

  @override
  String get gdtfFieldDefault8 => 'Valor padrão (0–255)';

  @override
  String get gdtfFieldDefault16 => 'Valor padrão (0–65535)';

  @override
  String get gdtfDefaultChannelName => 'Canal';

  @override
  String get gdtfMvpHint =>
      'MVP: exportação JSON (área de transferência). A exportação real de GDTF (XML+ZIP) virá a seguir.';

  @override
  String get gdtfTypeDimmer => 'Dimmer';

  @override
  String get gdtfTypePan => 'Bang';

  @override
  String get gdtfTypeTilt => 'Inclinar';

  @override
  String get gdtfTypeColor => 'Cor';

  @override
  String get gdtfTypeGobo => 'Gobo';

  @override
  String get gdtfTypeShutter => 'Obturador';

  @override
  String get gdtfTypePrism => 'Prisma';

  @override
  String get gdtfTypeZoom => 'Zoom';

  @override
  String get gdtfTypeFocus => 'Foco';

  @override
  String get gdtfTypeIris => 'Íris';

  @override
  String get gdtfTypeEffect => 'Efeito';

  @override
  String get gdtfTypeCustom => 'Personalizado';

  @override
  String get gdtfEasyTitle => 'Crie um GDTF (simples)';

  @override
  String get gdtfTemplatesTitle => 'Pré-seleções';

  @override
  String get gdtfCreateDefaultPreset => 'Crie a predefinição padrão';

  @override
  String get gdtfTemplatesHint =>
      'Cria uma base rápida (dimmer, obturador, pan, tilt, RGB, etc.) e depois completa os endereços DMX e os padrões.';

  @override
  String get gdtfExportButton => 'Exportar GDTF';

  @override
  String get gdtfExportHint =>
      'Exportação mínima de .gdtf (description.xml) e depois compartilhamento (Mail, WhatsApp, AirDrop, Drive…).';

  @override
  String get gdtfExportNeedDmx =>
      'Adicione pelo menos um endereço DMX para exportar.';

  @override
  String get gdtfExportDone => 'GDTF exportado.';

  @override
  String get gdtfExportError => 'Não foi possível exportar GDTF.';

  @override
  String get gdtfShareSubject => 'Arquivo GDTF';

  @override
  String get gdtfShareText => 'Aqui está o arquivo GDTF exportado.';

  @override
  String get gdtfFieldRole => 'Contexto';

  @override
  String get gdtfDmxHint => 'Em branco ou 1–512';

  @override
  String get gdtfFieldDefault => 'Padrão';

  @override
  String get gdtfDefaultHint8 => '0–255';

  @override
  String get gdtfDefaultHint16 => '0–65535';

  @override
  String get gdtfChannelDefaultName => 'Canal';

  @override
  String get gdtfRoleEmpty => 'Vazio/Desconhecido';

  @override
  String get gdtfRoleDimmer => 'Dimmer';

  @override
  String get gdtfRoleShutter => 'Obturador';

  @override
  String get gdtfRolePan => 'Bang';

  @override
  String get gdtfRoleTilt => 'Inclinar';

  @override
  String get gdtfRoleRed => 'Vermelho (R)';

  @override
  String get gdtfRoleGreen => 'Verde (G)';

  @override
  String get gdtfRoleBlue => 'Azul (B)';

  @override
  String get gdtfRoleColor => 'Cor';

  @override
  String get gdtfRoleGobo => 'Gobo';

  @override
  String get gdtfRoleZoom => 'Zoom';

  @override
  String get gdtfRoleFocus => 'Foco';

  @override
  String get gdtfRolePrism => 'Prisma';

  @override
  String get gdtfRoleEffect => 'Efeito';

  @override
  String get gdtfRoleControl => 'Controlar';

  @override
  String get gdtfRoleCustom => 'Personalizado';

  @override
  String get gdtfResUnknown => 'Vazio';

  @override
  String get gdtfPresetDimmer => 'Dimmer';

  @override
  String get gdtfPresetShutter => 'Obturador';

  @override
  String get gdtfPresetPan => 'Bang';

  @override
  String get gdtfPresetTilt => 'Inclinar';

  @override
  String get gdtfPresetRed => 'R';

  @override
  String get gdtfPresetGreen => 'G';

  @override
  String get gdtfPresetBlue => 'B';

  @override
  String get gdtfPresetColor1 => 'Cor 1';

  @override
  String get gdtfPresetGobo1 => 'Gobo 1';

  @override
  String get gdtfPresetZoom => 'Zoom';

  @override
  String get gdtfPresetFocus => 'Foco';

  @override
  String get gdtfPresetPrism => 'Prisma';

  @override
  String get gdtfPresetEffect => 'Efeito';

  @override
  String get gdtfPresetControl => 'Controlar';

  @override
  String get commonApply => 'Aplicar';

  @override
  String get gdtfPresetLabel => 'Escolha';

  @override
  String get gdtfPresetFixtureSimple => 'Fixação simples';

  @override
  String get gdtfPresetBarreLed => 'Barra de LED';

  @override
  String get gdtfTemplatesHintShort =>
      'Escolha uma predefinição e aplique. Você pode então ajustar DMX, padrões e reordenar usando arrastar e soltar.';

  @override
  String get gdtfExportNeedChannels =>
      'Adiciona pelo menos um canal para exportar.';

  @override
  String get homeDrawerContact => 'Entre em contato com o desenvolvedor';

  @override
  String get homeDrawerSuggestItem => 'Envie um item para o catálogo';

  @override
  String get homeErrorOpenEmail =>
      'Não é possível abrir o aplicativo de e-mail.';

  @override
  String get homeErrorOpenForm => 'Não foi possível abrir o formulário.';

  @override
  String get homeContactEmailSubject => 'Pergunta sobre My Tech App';

  @override
  String get bpmManualHelp =>
      'Se um BPM manual for inserido, ele terá prioridade sobre o tap tempo.';

  @override
  String get bpmConversionsTitle => 'Conversões';

  @override
  String get bpmActiveLabel => 'BPM ativo';

  @override
  String get bpmMsPerBeat => 'Duração de uma batida';

  @override
  String get bpmHz => 'Freqüência';

  @override
  String get bpmSecPerBar44 => 'Duração de um compasso (4/4)';

  @override
  String get bpmDisclaimer =>
      'Indicação aproximada. Verifique com o metrônomo se é crítico.';

  @override
  String get laserToolsTitle => 'Ferramentas';

  @override
  String get laserBeamSizeTitle => 'Tamanho do feixe';

  @override
  String get laserBeamSizeSubtitle =>
      'Diâmetro, raio e área do ponto a uma determinada distância.';

  @override
  String get laserBeamInputsTitle => 'Configurações';

  @override
  String get laserBeamDistanceLabel => 'Distância';

  @override
  String get laserBeamDistanceHint => 'm (ex. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Cálculo: D(z) = D0 + θ · z (θ em rad, ângulo completo).';

  @override
  String get laserBeamResultsTitle => 'Resultados';

  @override
  String get laserBeamDiameterAtDistance => 'Diâmetro à distância';

  @override
  String get laserBeamRadiusAtDistance => 'Raio para distância';

  @override
  String get laserBeamAreaAtDistance => 'Superfície pontual';

  @override
  String get sunTimesPageTitle => 'Nascer/pôr do sol';

  @override
  String get sunTimesSelectionTitle => 'Configurações';

  @override
  String get sunTimesCityLabel => 'Cidade';

  @override
  String get sunTimesDateLabel => 'Data';

  @override
  String get sunTimesResultsTitle => 'Resultados';

  @override
  String get sunTimesSunriseLabel => 'Nascer do sol';

  @override
  String get sunTimesSunsetLabel => 'Pôr do sol';

  @override
  String get sunTimesDayLengthLabel => 'Duração do dia';

  @override
  String get sunTimesDisclaimer =>
      'Valores indicativos (modelo astronômico). Verifique com fonte oficial se necessário (evento, segurança, filmagens).';

  @override
  String get sunTimesThresholdTitle => 'Limites de brilho (benchmarks)';

  @override
  String get sunTimesThresholdIntro =>
      'Ordens de grandeza úteis para antecipar a luz ambiente (muito variável dependendo do clima, latitude, estação do ano, obstáculos, poluição luminosa).';

  @override
  String get sunTimesLuxDaylight => 'Plena luz do dia (excluindo sol direto)';

  @override
  String get sunTimesLuxOvercast => 'Nublado (típico)';

  @override
  String get sunTimesLuxSunrise => 'Nascer do sol/pôr do sol (claro)';

  @override
  String get sunTimesLuxCivilTwilight => 'Limite do crepúsculo civil (claro)';

  @override
  String get sunTimesLuxFullMoon => 'Lua cheia (brilhante)';

  @override
  String get sunTimesThresholdNote =>
      'Dica: para marcação “utilizável sem iluminação”, geralmente buscamos > 100–300 lx. Para um bom trabalho, 500 lx e mais.';

  @override
  String get sunTimesParamsTitle => 'Configurações';

  @override
  String get sunTimesPickDate => 'Escolha uma data';

  @override
  String get sunTimesSunrise => 'Elevador';

  @override
  String get sunTimesSunset => 'Dormir';

  @override
  String get sunTimesDayLength => 'Duração do dia';

  @override
  String get sunTimesPolarNote =>
      'Nota: em áreas próximas aos pólos, o nascer/pôr do sol pode estar ausente dependendo da estação.';

  @override
  String get sunTimesLuxThresholdTitle => 'Limites de brilho (benchmarks)';

  @override
  String get sunTimesLuxBulletNightDark => 'Noite escura: <1 lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Noite (lua): ~0,1–1 lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Lua cheia: ~0,1–0,3 lux';

  @override
  String get sunTimesLuxBulletCivilTwilight => 'Crepúsculo civil: Sol a -6°';

  @override
  String get sunTimesLuxBulletUrbanLow => 'Baixa iluminação urbana: ~5–20 lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Escritório baixo: ~100–300 lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Escritório padrão: ~300–500 lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'Diurno ao ar livre: ~10.000–25.000 lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Luz solar direta: ~100.000 lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Referências indicativas: tempo/nuvens, ambiente, estação do ano e relevo podem variar muito.';

  @override
  String get sunTimesTwilightTitle => 'Crepúsculo: o que significa?';

  @override
  String get sunTimesTwilightCivil =>
      'Civil (-6°): luz ainda suficiente para distinguir o ambiente sem iluminação artificial.';

  @override
  String get sunTimesTwilightNautical =>
      'Náutico (-12°): o horizonte torna-se difícil de distinguir; estrelas visíveis.';

  @override
  String get sunTimesTwilightAstronomical =>
      'Astronómico (-18°): o céu é considerado “preto” (excluindo poluição luminosa).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Ângulos expressos em graus abaixo do horizonte (Sol negativo).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Crepúsculo astronômico: Sol a -18°';

  @override
  String get sunTimesTimelineTitleStep30 => 'Linha do tempo (não 30 minutos)';

  @override
  String get sunTimesTimelineColTime => 'Hora';

  @override
  String get sunTimesTimelineColElevation => 'Elevação';

  @override
  String get sunTimesTimelineColMarker => 'Marco';

  @override
  String get sunTimesTimelineColLux => 'Lux (pedido)';

  @override
  String get sunTimesTimelineFootnote =>
      'Referências indicativas (clima/nuvens, ambiente, estação do ano) — úteis para preparar um espetáculo.';

  @override
  String get aboutUniverseToArtnetColSubnet => 'Sub-rede';

  @override
  String appVersionLabel(Object version, Object build) {
    return 'Versão $version ($build)';
  }

  @override
  String appVersionLabelNoBuild(Object version) {
    return 'Versão $version';
  }

  @override
  String get aboutUniverseToArtnetColUniverse => 'Universo';

  @override
  String get videoLedResultWallResolution => 'Resolução da parede';

  @override
  String get videoLedResultWallSize => 'Tamanho da parede';

  @override
  String get videoLedResultTile => 'Laje';

  @override
  String get videoLedResultPitch => 'Tom';

  @override
  String get lightFilterLedTabConvert => 'Conversão';

  @override
  String get lightFilterLedTabProfiles => 'Meus jogos';

  @override
  String get lightFilterLedSourceLabel => 'Fonte de luz';

  @override
  String get lightFilterLedEngineRgbww => 'RGBWW (branco quente + frio)';

  @override
  String get lightFilterLedEngineRgbaw => 'RGBAW';

  @override
  String get lightFilterLedEngineRgbauv => 'RGBAUV';

  @override
  String get lightFilterLedEngineRgbwauv => 'RGBWAUV';

  @override
  String get lightFilterLedEngineRgbrcl => 'RGBRCL (vermelho, ciano, limão)';

  @override
  String get lightFilterLedEngineCmy => 'CMY';

  @override
  String get lightFilterLedSaveProfileTitle => 'Salvar perfil do aparelho';

  @override
  String get lightFilterLedProfileNameLabel => 'Nome do equipamento';

  @override
  String get patchMvrViewTable => 'Planilha';

  @override
  String get patchMvrViewVisual => 'Visual';

  @override
  String get consoleTitle => 'Console';

  @override
  String get consoleSubtitle => 'Patch DMX e ferramentas GDTF';

  @override
  String get consolePatchTitle => 'Atualização DMX';

  @override
  String get consolePatchSubtitle => 'Importe um MVR e analise o patch';

  @override
  String get consoleGdtfTitle => '__TECNOLOGIA_24__';

  @override
  String get consoleGdtfSubtitle => 'Crie ou analise um arquivo GDTF';

  @override
  String get consoleMa3ForgeTitle => 'Forja de plug-ins MA3';

  @override
  String get consoleMa3ForgeSubtitle =>
      'Gere plug-ins Lua para grandMA3 com IA';

  @override
  String lightFilterLedProfileSaved(String name) {
    return 'Perfil “$name” salvo';
  }

  @override
  String get lightFilterLedNoProfiles => 'Nenhum perfil de aparelho salvo';

  @override
  String get lightFilterLedNoProfilesHint =>
      'Calibre os canais na aba Conversão,\nem seguida, salve com o ícone 💾.';

  @override
  String get lightFilterLedTitle => 'Filtros LED correspondentes';

  @override
  String get lightFilterLedDescription =>
      'Conversão de filtros LEE, Rosco… em motores LED (RGB, RGBA, RGBW, etc.).';

  @override
  String get lightFilterLedBrandLabel => 'Marca';

  @override
  String get lightFilterLedSearchLabel => 'Pesquisar';

  @override
  String get lightFilterLedSearchHint => 'Filtrar código ou nome';

  @override
  String get lightFilterLedFilterLabel => 'Filtrado';

  @override
  String get lightFilterLedEngineLabel => 'Motor LED';

  @override
  String get lightFilterLedShowPercentLabel => 'Mostrar como porcentagem';

  @override
  String get lightFilterLedShowPercentHint =>
      'Caso contrário, os valores serão exibidos como DMX 0–255.';

  @override
  String get lightFilterLedHexLabel => 'Cor de referência';

  @override
  String get lightFilterLedChromaticityLabel => 'Cromaticidade';

  @override
  String get lightFilterLedTransmissionLabel => 'Transmissão';

  @override
  String get lightFilterLedResultTitle => 'Resultado';

  @override
  String get lightFilterLedOriginalPreviewLabel => 'Pré-visualização do filtro';

  @override
  String get lightFilterLedApproximatePreviewLabel =>
      'Visão geral aproximada do LED';

  @override
  String get lightFilterLedDisclaimer =>
      'Resultado apenas indicativo. A renderização real depende do projetor, do seu espectro, da sua calibração, do seu modo de cor e do contexto de utilização.';

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
  String get aboutSearchHint => 'Pesquisar em referências';

  @override
  String get aboutSearchNoResults => 'Nenhum resultado encontrado.';

  @override
  String get homePinnedTitle => 'Alfinetes';

  @override
  String get homePinnedSubtitle =>
      'Encontre rapidamente suas referências fixadas.';

  @override
  String get pinnedReferencesTitle => 'Referências fixadas';

  @override
  String get pinnedReferencesEmpty => 'Nenhuma referência fixada no momento.';

  @override
  String get aboutPinAddTooltip => 'Fixe esta referência';

  @override
  String get aboutPinRemoveTooltip => 'Remova este pino';

  @override
  String get aboutPinAddedMessage => 'Referência fixada.';

  @override
  String get aboutPinRemovedMessage => 'Pino removido.';

  @override
  String get homeDrawerSubscriptions => 'Assinaturas';

  @override
  String get subscriptionPageTitle => 'Assinaturas';

  @override
  String get subscriptionHeadlineAllTitle => 'Escolha sua fórmula';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'Encontre suas compras e assinaturas atuais ainda disponíveis aqui.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return 'Desbloquear $module';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'Você pode comprar apenas vídeo ou escolher Pro para desbloquear tudo.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'Você pode comprar apenas Light ou escolher Pro para desbloquear tudo.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'Você pode comprar apenas o Laser ou escolher o Pro para desbloquear tudo.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'Você pode comprar apenas o Console ou escolher o Pro para desbloquear tudo.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Acesso total a todas as seções avançadas.';

  @override
  String get subscriptionStoreUnavailable => 'Loja indisponível no momento.';

  @override
  String get subscriptionLoadError => 'Não foi possível carregar assinaturas.';

  @override
  String get subscriptionRestorePurchases => 'Restaurar minhas compras';

  @override
  String get subscriptionPrivacy => 'Confidencialidade';

  @override
  String get subscriptionTerms => 'CGU';

  @override
  String get subscriptionBestValue => 'MELHOR VALOR';

  @override
  String get subscriptionOwned => 'Comprado';

  @override
  String get subscriptionIncludedInPro => 'Incluído no Pró';

  @override
  String get subscriptionProductUnavailable => 'Produto indisponível.';

  @override
  String get subscriptionSubscribeAll => 'Inscreva-se – desbloqueie tudo';

  @override
  String subscriptionSubscribeModule(Object module) {
    return 'Inscrever-se — $module';
  }

  @override
  String get subscriptionCategoryVideoTitle => 'Vídeo';

  @override
  String get subscriptionCategoryLightTitle => 'Luz';

  @override
  String get subscriptionCategoryLaserTitle => 'Laser';

  @override
  String get subscriptionCategoryConsoleTitle => 'Console';

  @override
  String get subscriptionCategoryProTitle => 'Ferramentas ShowTech Pro';

  @override
  String get subscriptionCategoryVideoDescription => 'Acesso à seção Vídeo.';

  @override
  String get subscriptionCategoryLightDescription => 'Acesso à seção Luz.';

  @override
  String get subscriptionCategoryLaserDescription => 'Acesso à seção Laser.';

  @override
  String get subscriptionCategoryConsoleDescription =>
      'Acesso à seção Console.';

  @override
  String get subscriptionCategoryProDescription =>
      'Acesso total a todas as seções.';

  @override
  String get electricityFreeSection => 'Livre';

  @override
  String get electricityProSection => 'Assinatura de eletricidade';

  @override
  String get riggingFreeSection => 'Livre';

  @override
  String get riggingProSection => 'Assinatura Rigging';

  @override
  String get videoFreeSection => 'Livre';

  @override
  String get videoProSection => 'Assinatura de vídeo';

  @override
  String get lumiereFreeSection => 'Livre';

  @override
  String get lumiereProSection => 'Assinatura de iluminação';

  @override
  String get consoleFreeSection => 'Livre';

  @override
  String get consoleProSection => 'Assinatura de console';

  @override
  String get lumiereFilterEquivDescription =>
      'Equivalências Lee ↔ Roscolux ↔ e-colour+';

  @override
  String get audioSplModeDistance => 'Distância → SPL';

  @override
  String get audioSplModePower => 'Potência → SPL';

  @override
  String get homeElectricityTitle => 'Eletricidade';

  @override
  String get homeElectricitySubtitle =>
      'Potência, corrente, seções de cabos e autonomia do UPS.';

  @override
  String get subscriptionCategoryElectricityTitle => 'Eletricidade';

  @override
  String get subscriptionCategoryElectricityDescription =>
      'Ferramentas elétricas para alimentação, fases, cabos e UPS.';

  @override
  String get subscriptionCategoryRiggingTitle => '__TECNOLOGIA_18__';

  @override
  String get subscriptionCategoryRiggingDescription =>
      'Ferramentas de amarração para freio, ângulos e verificação WLL / CMU.';

  @override
  String get subscriptionHeadlineElectricitySubtitle =>
      'Desbloqueia todas as ferramentas elétricas profissionais.';

  @override
  String get subscriptionHeadlineRiggingSubtitle =>
      'Desbloqueia todas as ferramentas profissionais de rigging.';

  @override
  String get electricityTitle => 'Eletricidade';

  @override
  String get electricityToolPowerCurrentTitle => 'Potência / corrente';

  @override
  String get electricityToolPowerCurrentSubtitle =>
      'Calcule potência, corrente, tensão ou energia em monofásico ou trifásico.';

  @override
  String get electricityToolPhasePowerTitle => 'Potência por fase';

  @override
  String get electricityToolPhasePowerSubtitle =>
      'Distribua uma potência total e leia a corrente por fase.';

  @override
  String get electricityToolLoadBalancerTitle => 'Distribuição de carga';

  @override
  String get electricityToolLoadBalancerSubtitle =>
      'Adicione luminárias do catálogo, atribua por fase e verifique a amperagem do seu painel.';

  @override
  String get electricityToolGeneratorTitle => 'Gerador';

  @override
  String get electricityPowerFactorToolTitle => 'Fator de potência (kVA ↔ kW)';

  @override
  String get electricityToolPowerFactorSubtitle =>
      'Converte potência aparente (kVA) e ativa (kW) através de cos φ nos dois sentidos, com a potência reativa (kVAR).';

  @override
  String get electricityPowerFactorModeTitle => 'Sentido do cálculo';

  @override
  String get electricityPowerFactorModeKvaToKw => 'kVA → kW';

  @override
  String get electricityPowerFactorModeKwToKva => 'kW → kVA';

  @override
  String get electricityPowerFactorInputsTitle => 'Dados conhecidos';

  @override
  String get electricityPowerFactorApparentLabel => 'Potência aparente';

  @override
  String get electricityPowerFactorApparentHint => 'Ex.: 10';

  @override
  String get electricityPowerFactorActiveLabel => 'Potência ativa';

  @override
  String get electricityPowerFactorActiveHint => 'Ex.: 8';

  @override
  String get electricityPowerFactorCosPhiLabel => 'Fator de potência (cos φ)';

  @override
  String get electricityPowerFactorCosPhiHint => '0.1 – 1.0, ex.: 0.8';

  @override
  String get electricityPowerFactorResultsTitle => 'Resultados';

  @override
  String get electricityPowerFactorReactiveLabel => 'Potência reativa';

  @override
  String get electricityPowerFactorAngleLabel => 'Ângulo de fase';

  @override
  String get electricityPowerFactorEnterValues =>
      'Insira os valores para ver o resultado.';

  @override
  String get electricityPowerFactorFormulaNote =>
      'kW = kVA × cos φ · kVA = kW / cos φ · kVAR = √(kVA² − kW²). cos φ = 1 significa uma carga puramente resistiva (sem potência reativa).';

  @override
  String get electricityToolGeneratorSubtitle =>
      'Dimensionamento: potência ativa → kVA, fator de simultaneidade, margem de segurança, tamanho padrão recomendado.';

  @override
  String get electricityGeneratorInputsTitle => 'Carga a alimentar';

  @override
  String get electricityGeneratorActivePowerLabel => 'Potência ativa instalada';

  @override
  String get electricityGeneratorActivePowerHint =>
      'Soma das potências ativas (ver repartidor de cargas)';

  @override
  String get electricityGeneratorCosPhiLabel => 'Cos φ médio';

  @override
  String get electricityGeneratorCosPhiHint =>
      '0,85–0,95 típico (dimmers, LED, amplificadores)';

  @override
  String get electricityGeneratorDiversityLabel => 'Fator de simultaneidade';

  @override
  String get electricityGeneratorDiversityHint =>
      '% da potência instalada realmente solicitada em simultâneo';

  @override
  String get electricityGeneratorMarginLabel => 'Margem de segurança';

  @override
  String get electricityGeneratorMarginHint =>
      'Margem recomendada para arranques e picos';

  @override
  String get electricityGeneratorFuelRateLabel => 'Consumo específico';

  @override
  String get electricityGeneratorFuelRateHint =>
      '≈0,25 L/kWh típico para um diesel bem carregado';

  @override
  String get electricityGeneratorResultsTitle => 'Gerador recomendado';

  @override
  String get electricityGeneratorRecommendedLabel =>
      'Tamanho padrão recomendado';

  @override
  String get electricityGeneratorRecommendedOverMax =>
      '> 800 kVA — dimensionamento personalizado, consulte um fornecedor';

  @override
  String get electricityGeneratorApparentNeededLabel =>
      'Potência aparente necessária';

  @override
  String get electricityGeneratorCurrentLabel => 'Corrente estimada à saída';

  @override
  String get electricityGeneratorFuelPerHourLabel => 'Consumo estimado';

  @override
  String get electricityGeneratorFuelPerShowLabel => 'Em 8 h de show';

  @override
  String get electricityGeneratorEnterValues =>
      'Introduza a potência ativa para calcular';

  @override
  String get electricityGeneratorDisclaimer =>
      'Estimativa indicativa — verifique sempre as recomendações do fornecedor/fabricante do gerador (altitude, temperatura, cargas não lineares).';

  @override
  String get electricityToolCableSectionTitle => 'Seção de cabo';

  @override
  String get electricityToolCableSectionSubtitle =>
      'Calcule uma seção de acordo com a corrente ou potência, comprimento, queda de tensão e referência do cabo.';

  @override
  String get electricityToolUpsTitle => 'Autonomia do UPS';

  @override
  String get electricityToolUpsSubtitle =>
      'Estime a autonomia de uma bateria ou de um UPS dependendo da carga.';

  @override
  String get electricityInputsTitle => 'Entradas';

  @override
  String get electricityResultsTitle => 'Resultados';

  @override
  String get electricityEnterValuesToCalculate =>
      'Insere valores válidos para calcular.';

  @override
  String get electricityTotalPowerLabel => 'Potência total';

  @override
  String get electricityTotalPowerHint => 'Ex. 22.000';

  @override
  String get electricityPowerPerPhaseLabel => 'Potência por fase';

  @override
  String get electricityCurrentPerPhaseLabel => 'Corrente por fase';

  @override
  String get electricityCurrentLabel => 'Fluente';

  @override
  String get electricityPhaseCountLabel => 'Número de fases';

  @override
  String get electricityConsumptionCurrentLabel => 'Consumo/corrente real';

  @override
  String get electricityConsumptionCurrentHint => '32';

  @override
  String get electricityBreakerSizeLabel => 'Tamanho do disjuntor';

  @override
  String get electricityBreakerSizeHint => '32';

  @override
  String get electricityCableLengthLabel => 'Comprimento do cabo';

  @override
  String get electricityCableLengthHint => 'Exemplo 30';

  @override
  String get electricityAllowedVoltageDropLabel => 'Queda máxima de tensão';

  @override
  String get electricityAllowedVoltageDropHint => 'Exemplo 3';

  @override
  String get electricityRecommendedCableSectionLabel => 'Seção recomendada';

  @override
  String get electricityMaxCurrentForSectionLabel => 'Corrente permitida';

  @override
  String get electricityVoltageDropLabel => 'Queda de tensão';

  @override
  String get electricityBreakerCheckLabel => 'Verificação do disjuntor';

  @override
  String get electricityStatusOk => 'OK';

  @override
  String get electricityStatusWarning => 'Para ser verificado';

  @override
  String get electricityImportantNoteTitle => 'Nota importante';

  @override
  String get electricityCableSectionDisclaimer =>
      'Cálculo indicativo baseado em tabela de referência inspirada na IEC 60364-5-52. Verifique sempre o RGIE/AREI, o próprio método de instalação, a temperatura, o agrupamento dos cabos e a proteção com um eletricista qualificado.';

  @override
  String get electricityConsumptionInputTypeTitle => 'Valor conhecido';

  @override
  String get electricityInputCurrent => 'Corrente (A)';

  @override
  String get electricityInputPower => 'Potência (W)';

  @override
  String get electricityVoltageLabel => 'Tensão (U)';

  @override
  String get electricityVoltageHint => 'Ex. 230 ou 400';

  @override
  String get electricityPowerFactorLabel => 'Fator de potência (cos φ)';

  @override
  String get electricityPowerFactorHint => 'Exemplo 1.0';

  @override
  String get electricityCableReferenceTitle => 'Referência de cabo';

  @override
  String get electricityCopper => 'Cobre';

  @override
  String get electricityAluminium => 'Alumínio';

  @override
  String get electricityInsulationPvc => 'PVC 70°C';

  @override
  String get electricityInsulationXlpe => 'XLPE 90°C';

  @override
  String get electricityInstallConduit => 'Dirigido';

  @override
  String get electricityInstallFreeAir => 'Ar livre';

  @override
  String get electricityCalculatedCurrentLabel => 'Corrente calculada';

  @override
  String get electricityRecommendedBreakerLabel => 'Disjuntor recomendado';

  @override
  String get electricityNoStandardBreaker => 'Nenhum calibre padrão adequado';

  @override
  String get electricityStatusLabel => 'Status';

  @override
  String get electricityCircuitTypeTitle => 'Tipo de circuito';

  @override
  String get electricitySinglePhase => 'Monofásico';

  @override
  String get electricityThreePhase => 'Trifásico';

  @override
  String get electricityResultActivePower => 'Poder ativo';

  @override
  String get electricityResultCurrent => 'Fluente';

  @override
  String get electricityResultVoltage => 'Tensão';

  @override
  String get electricityResultEnergy => 'Energia';

  @override
  String get electricityInsufficient => 'Valores insuficientes';

  @override
  String get electricityCalcPower => 'Poder';

  @override
  String get electricityCalcCurrent => 'Fluente';

  @override
  String get electricityCalcVoltage => 'Tensão';

  @override
  String get electricityCalcEnergy => 'Energia';

  @override
  String get electricityRef16AMono => '16 Um mono';

  @override
  String get electricityRef32AMono => '32 Um mono';

  @override
  String get electricityRef32ATri => '32 Uma espécie';

  @override
  String get electricityRef63ATri => '63 Classificado';

  @override
  String get electricityRef125ATri => '125 Um tri';

  @override
  String get electricityFormulaTri => 'P = √3 × U × I × cos φ';

  @override
  String get electricityFormulaMono => 'P = U × I × cos φ';

  @override
  String get electricityFormulaTriDesc =>
      'Fórmula trifásica para carregamento equilibrado.';

  @override
  String get electricityFormulaMonoDesc => 'Fórmula monofásica.';

  @override
  String get electricityCircuitType => 'Tipo de circuito';

  @override
  String get electricityMono => 'Mono';

  @override
  String get electricityMonoDesc => 'Circuito monofásico de 230 V.';

  @override
  String get electricityThreePhaseDesc => 'Circuito trifásico de 400 V.';

  @override
  String get electricityCalcFor => 'Calcular';

  @override
  String get electricityFieldPower => 'Poder';

  @override
  String get electricityFieldPowerHint => 'Ex. 3680';

  @override
  String get electricityFieldCurrent => 'Fluente';

  @override
  String get electricityFieldCurrentHint => 'Exemplo 16';

  @override
  String get electricityFieldVoltage => 'Tensão';

  @override
  String get electricityFieldVoltageHint => '230';

  @override
  String get electricityFieldDuration => 'Duração';

  @override
  String get electricityFieldDurationHint => 'Exemplo 2';

  @override
  String get electricityFieldPf => 'cosφ';

  @override
  String get electricityFieldPfHint => 'Exemplo 1.0';

  @override
  String get electricityCalculate => 'Calcular';

  @override
  String get electricityRefTitle => 'Referências rápidas';

  @override
  String electricityUpsEnergyAvail(String energy) {
    return '$energy Quando disponível';
  }

  @override
  String get electricityUpsBatterySection => 'Bateria';

  @override
  String get electricityUpsCalculate => 'Calcular autonomia';

  @override
  String get electricityUpsCapacityHint => 'Exemplo 100';

  @override
  String get electricityUpsCapacityLabel => 'Habilidade';

  @override
  String get electricityUpsCountHint => 'Exemplo 1';

  @override
  String get electricityUpsCountLabel => 'Número de baterias';

  @override
  String get electricityUpsEfficiencyHint => 'Ex. 85';

  @override
  String get electricityUpsEfficiencyLabel => 'Colheita';

  @override
  String get electricityUpsLoadDesc => 'Potência consumida pelo equipamento.';

  @override
  String get electricityUpsLoadHint => 'Ex. 500';

  @override
  String get electricityUpsLoadLabel => 'Cobrar';

  @override
  String get electricityUpsLoadSectionTitle => 'Carga a ser fornecida';

  @override
  String get electricityUpsRef1 => 'O que está disponível';

  @override
  String get electricityUpsRef1Detail =>
      'Capacidade × tensão × número × eficiência.';

  @override
  String get electricityUpsRef2 => 'Autonomia';

  @override
  String get electricityUpsRef2Detail =>
      'Energia disponível dividida por carga.';

  @override
  String get electricityUpsRef3Title => 'Resultado indicativo';

  @override
  String get electricityUpsRef3Value =>
      'O valor real depende da eficiência, do estado das baterias e da carga.';

  @override
  String get electricityUpsRefTitle => 'Referências';

  @override
  String get electricityUpsVoltageHint => 'Exemplo 12';

  @override
  String get electricityUpsVoltageLabel => 'Tensão da bateria';

  @override
  String get riggingToolBridleTitle => 'freio de 2 pontas';

  @override
  String get riggingToolBridleSubtitle =>
      'Cálculo completo de uma rédea: comprimentos, ângulos, tensões e estado de segurança.';

  @override
  String get riggingToolAngleFactorTitle => 'Fator de ângulo';

  @override
  String get riggingToolAngleFactorSubtitle =>
      'Veja rapidamente o efeito do ângulo na tensão dos fios.';

  @override
  String get riggingToolMultiPointTitle => 'Bridagem multiponto';

  @override
  String get riggingToolMultiPointSubtitle =>
      'Tensão por ramal para uma bridagem simétrica de 2 a 8 pontos, com verificação WLL.';

  @override
  String get riggingLegCountLabel => 'Número de ramais';

  @override
  String get riggingWllPerLegLabel => 'WLL por ramal';

  @override
  String get riggingMultiPointSymmetricNote =>
      'Válido para uma bridagem simétrica: ramais de igual comprimento, carga centrada, tensão distribuída igualmente. Para uma configuração assimétrica ou complexa, recorra a um rigger qualificado ou a um software certificado.';

  @override
  String get riggingToolHoistTitle => 'Seletor de talha';

  @override
  String get riggingToolHoistSubtitle =>
      'Carga a içar → tamanho padrão de talha recomendado, com margem de segurança.';

  @override
  String get riggingHoistRecommendedLabel => 'Talha recomendada';

  @override
  String get riggingHoistOverMaxLabel =>
      '> 10 000 kg — fora da gama padrão, consulte um especialista em içamento';

  @override
  String get riggingHoistAvailabilityNote =>
      'Tamanhos padrão indicativos (0,125 a 10 t) — a disponibilidade real depende do fabricante e do fornecedor.';

  @override
  String get riggingToolWllTitle => 'Verificação WLL / CMU';

  @override
  String get riggingToolWllSubtitle =>
      'Compare uma carga aplicada com a capacidade do material.';

  @override
  String get riggingToolLengthTitle => 'Comprimento do freio';

  @override
  String get riggingToolLengthSubtitle =>
      'Calcule comprimentos e ângulos sem cálculo de carga.';

  @override
  String get riggingKnownDrop => 'Seta';

  @override
  String get riggingKnownAngle => 'Canto';

  @override
  String get riggingKnownLength => 'Comprimento';

  @override
  String get riggingAngleFromHorizontalLabel => 'Ângulo da horizontal';

  @override
  String get riggingLegLengthKnownLabel => 'Comprimento de um fio';

  @override
  String get riggingLoadWeightLabel => 'Peso da carga';

  @override
  String get riggingLoadShortLabel => 'Cobrar';

  @override
  String get riggingPointALabel => 'TEM';

  @override
  String get riggingPointBLabel => 'B';

  @override
  String get riggingTensionLabel => 'Tensão';

  @override
  String get riggingTensionLeftLabel => 'Tensão esquerda';

  @override
  String get riggingTensionRightLabel => 'Tensão reta';

  @override
  String get riggingTensionPerLegLabel => 'Tensão por fio';

  @override
  String get riggingStatusOk => 'OK';

  @override
  String get riggingStatusWatch => 'Para assistir';

  @override
  String get riggingStatusHigh => 'Aluno';

  @override
  String get riggingStatusDanger => 'Perigoso';

  @override
  String get riggingStatusOkDescription =>
      'Ângulo confortável. A tensão permanece razoável.';

  @override
  String get riggingStatusWatchDescription =>
      'Ângulo utilizável, mas a tensão começa a aumentar.';

  @override
  String get riggingStatusHighDescription =>
      'Ângulo baixo. A tensão aumenta acentuadamente.';

  @override
  String get riggingStatusDangerDescription =>
      'Ângulo muito baixo. Configuração a evitar.';

  @override
  String get riggingSafetyDisclaimer =>
      'Resultado indicativo. Verifique sempre o CMU/WLL real, os fatores de segurança e as regras aplicáveis.';

  @override
  String get riggingInvalidInputsMessage =>
      'Entre valores positivos e consistentes.';

  @override
  String get riggingAngleFactorLabel => 'Fator multiplicador';

  @override
  String get riggingAngleFactorExplanation =>
      'Quanto menor o ângulo em relação à horizontal, mais aumenta a tensão em cada fio.';

  @override
  String get riggingWllLabel => 'WLL / CMU de hardware';

  @override
  String get riggingAppliedLoadLabel => 'Carga aplicada';

  @override
  String get riggingSafetyFactorLabel => 'Fator de segurança';

  @override
  String get riggingRequiredLoadLabel => 'Carregar para verificar';

  @override
  String get riggingWllUsageLabel => 'Usar WLL';

  @override
  String get riggingMarginLabel => 'Margem restante';

  @override
  String get riggingWllStatusOkDescription =>
      'A capacidade do hardware é suficiente para esta carga.';

  @override
  String get riggingWllStatusWatchDescription =>
      'A capacidade ainda é suficiente, mas a margem é baixa.';

  @override
  String get riggingWllStatusDangerDescription =>
      'A carga excede a capacidade indicada.';

  @override
  String get riggingLengthDifferenceLabel => 'Diferença de comprimento';

  @override
  String get riggingCalculationModeLabel => 'Tipo de cálculo';

  @override
  String get riggingGeometryOnlyLabel => 'Sem carga';

  @override
  String get riggingWithLoadLabel => 'Com carga';

  @override
  String get riggingGeometryOnlyDescription =>
      'Somente modo Geometria: comprimentos, setas e ângulos. Sem cálculo de tensão ou carga.';

  @override
  String get riggingKnownInputLabel => 'Eu sei';

  @override
  String get homeConversionsTitle => 'Conversões';

  @override
  String get homeConversionsSubtitle =>
      'Unidades, distância, vídeo, áudio, DMX e conversões de campo.';

  @override
  String get conversionsTitle => 'Conversões';

  @override
  String get conversionsDistanceTitle => 'Distância';

  @override
  String get conversionsTemperatureTitle => 'Temperatura';

  @override
  String get conversionsAnglesTitle => 'Ângulos';

  @override
  String get conversionsVideoTitle => 'Vídeo';

  @override
  String get conversionsAudioTitle => 'Áudio';

  @override
  String get conversionsDmxTitle => '__TECNOLOGIA_0__';

  @override
  String get conversionsSwap => 'Reverter';

  @override
  String get conversionsDisclaimer =>
      'Apenas indicação. Verifique sempre os valores críticos com a documentação do fabricante.';

  @override
  String get conversionMetersFeet => 'Metros <> pés';

  @override
  String get conversionCentimetersInches => 'Centímetros <> polegadas';

  @override
  String get conversionMetersYards => 'Metros <> jardas';

  @override
  String get conversionCelsiusFahrenheit => 'Celsius <> Fahrenheit';

  @override
  String get conversionDegreesRadians => 'Graus <> radianos';

  @override
  String get conversionSlopePercentDegrees => 'Inclinação % <> graus';

  @override
  String get conversionNitsFootLambert => 'Nits <> lambert de pé';

  @override
  String get conversionFpsFrameTime => 'FPS <> duração do quadro';

  @override
  String get conversionBpmMs => 'BPM <> milissegundos';

  @override
  String get conversionDelayDistance => 'Atraso <> distância';

  @override
  String get conversionDmxPercent => 'DMX <>%';

  @override
  String get conversionEightBitSixteenBit => '8 bits <> 16 bits';

  @override
  String get subscriptionDurationYear => 'Assinatura de 1 ano';

  @override
  String get conversionAudioLevel => 'dBu/dBV/V';

  @override
  String get conversionDmxAbsolute => 'Universo <> DMX absoluto';

  @override
  String get conversionDmxToAbsoluteHint => 'Universo + endereço → absoluto';

  @override
  String get conversionDmxFromAbsoluteHint => 'Absoluto → universo + endereço';

  @override
  String get conversionDmxUniverseLabel => 'Universo';

  @override
  String get conversionDmxAddressLabel => 'Endereço';

  @override
  String get conversionDmxAbsoluteLabel => 'DMX absoluto';

  @override
  String get gdtfTitle => '__TECNOLOGIA_24__';

  @override
  String get gdtfSearchTab => 'Pesquisar';

  @override
  String get gdtfGenerateFromPdfTab => 'Gerar de PDF';

  @override
  String get gdtfSearchHint => 'ex: Martin MAC Aura, Chauvet Rogue…';

  @override
  String get gdtfFixtureNameLabel => 'Nome do equipamento';

  @override
  String get gdtfSearchInfo =>
      'Pesquise no banco de dados de compartilhamento GDTF (mais de 6.000 equipamentos).\nSe não for encontrado, use a guia \"Gerar de PDF\".';

  @override
  String get gdtfNoFixtureFound => 'Nenhum equipamento encontrado';

  @override
  String get gdtfNoFixtureFoundHelp =>
      'Você pode gerar um GDTF a partir do PDF no manual.';

  @override
  String get gdtfGenerateFromPdfTitle => 'Gere um GDTF a partir de um PDF';

  @override
  String get gdtfGenerateFromPdfIntro =>
      'Carregue o manual técnico do seu equipamento. A IA extrai os modos DMX — você verifica e corrige antes de gerar o arquivo.\n\n⚠️ Chave para o sucesso: insira o nome exato da máquina conforme aparece no manual. E se você adicionar modos manualmente, use os nomes exatos dos modos DMX – caso contrário, a IA não encontrará os dados corretos.';

  @override
  String get gdtfManufacturerHint => 'ex: Martin, Chauvet, Robe…';

  @override
  String get gdtfModelHint => 'ex: MAC Aura XIP, Rogue R2X…';

  @override
  String get gdtfSelectManualPdf => 'Selecione PDF no manual';

  @override
  String get gdtfDetectingModes => 'Detecção de modo…';

  @override
  String get gdtfAnalyzePdf => 'Analise o PDF';

  @override
  String get gdtfAnalyzePdfHelp =>
      'A IA detecta os modos DMX disponíveis no manual. Você então escolhe quais extrair antes de gerar o arquivo.';

  @override
  String get gdtfBackToForm => 'Voltar ao formulário';

  @override
  String gdtfDetectedModesInManual(int count) {
    return '$count modo(s) DMX detectado(s) no manual';
  }

  @override
  String get gdtfSearchModeHint => 'Procure um modo…';

  @override
  String get gdtfSelectAll => 'Todos';

  @override
  String get gdtfSelectNone => 'Nenhum';

  @override
  String gdtfSelectedModesCount(int selected, int total) {
    return '$selected selecionado em $total';
  }

  @override
  String get gdtfNoModeMatchesSearch => 'Nenhum modo corresponde à pesquisa.';

  @override
  String gdtfDmxChannelCount(int count) {
    return '$count canais DMX';
  }

  @override
  String get gdtfExtractionInProgressLong =>
      'Extração em andamento...isso pode levar até 10 minutos de acordo com o manual. Não feche o aplicativo.';

  @override
  String get gdtfExtractionMayTakeLong =>
      'A extração pode levar até 10 minutos dependendo do tamanho do manual e do número de modos selecionados.';

  @override
  String get gdtfExtractingChannels => 'Extração de canais…';

  @override
  String gdtfExtractModes(int count) {
    return 'Extrair modo(s) $count';
  }

  @override
  String get gdtfBackToModeSelection => 'Retornar à seleção de modo';

  @override
  String gdtfDetectedModesCount(int count) {
    return '$count modo(s) detectado(s)';
  }

  @override
  String gdtfUnextractedModesCount(int count) {
    return '$count modo(s) não extraído(s)';
  }

  @override
  String get gdtfGenerating => 'Geração…';

  @override
  String get gdtfGenerateGdtfFile => 'Gere o arquivo .gdtf';

  @override
  String get gdtfModeNameHint => 'Nome do modo';

  @override
  String gdtfChannelCount(int count) {
    return '$count canais';
  }

  @override
  String get gdtfChannelShort => 'Capítulo';

  @override
  String get gdtfBits => 'Pedaços';

  @override
  String get gdtfName => 'Nome';

  @override
  String get gdtfDefaultValueLabel => 'Valor padrão (0-255):';

  @override
  String get gdtfValueRangesLabel => 'Faixas de valores/subfunções:';

  @override
  String get gdtfValueRangesHint =>
      'ex: 0-9 = fechado, 10-100 = estroboscópio lento, 255 = aberto';

  @override
  String get gdtfAddChannel => 'Adicionar um canal';

  @override
  String get gdtfFileGenerated => 'Arquivo gerado!';

  @override
  String get gdtfShareGdtfFile => 'Compartilhe o arquivo .gdtf';

  @override
  String get gdtfGenerateAnotherFile => 'Gerar outro arquivo';

  @override
  String get gdtfGmailIosTitle => 'Gmail no iOS? Leia isto 👀';

  @override
  String get gdtfGmailIosWarning =>
      'O Gmail no iOS geralmente bloqueia anexos .gdtf (\"não é possível anexar arquivo\"). Dica: Renomeie o arquivo para .zip antes de enviar – o destinatário o renomeia para .gdtf após recebê-lo. WhatsApp, Messenger e AirDrop funcionam sem problemas.';

  @override
  String get gdtfDownload => 'Download';

  @override
  String gdtfModeFootprint(String name, int count) {
    return '$name (${count}ch)';
  }

  @override
  String gdtfDownloadingFixture(String fixture) {
    return 'Baixando $fixture…';
  }

  @override
  String gdtfErrorStatus(int statusCode) {
    return 'Erro $statusCode';
  }

  @override
  String gdtfErrorStatusParentheses(int statusCode) {
    return 'Erro ($statusCode)';
  }

  @override
  String gdtfNetworkError(String error) {
    return 'Erro de rede: $error';
  }

  @override
  String gdtfErrorDetails(String error) {
    return 'Erro: $error';
  }

  @override
  String get gdtfErrorFillManufacturerAndModel =>
      'Preencha o fabricante e modelo.';

  @override
  String get gdtfErrorSelectPdf => 'Seleciona um arquivo PDF.';

  @override
  String get gdtfErrorCannotExtractDmxPages =>
      'Não foi possível extrair as páginas DMX de PDF.';

  @override
  String get gdtfUnknownError => 'Erro desconhecido';

  @override
  String get gdtfUnknownErrorLowercase => 'erro desconhecido';

  @override
  String get gdtfNoDmxModeDetected => 'Nenhum modo DMX detectado no manual.';

  @override
  String get gdtfErrorSelectAtLeastOneMode =>
      'Seleciona pelo menos um modo para extrair.';

  @override
  String get gdtfErrorManualDataLost =>
      'Dados manuais perdidos, reinicie a análise.';

  @override
  String get mireVideoPageTitle => 'Alvos de tela de vídeo';

  @override
  String get mireVideoWidthPxLabel => 'Largura (px)';

  @override
  String get mireVideoHeightPxLabel => 'Altura (px)';

  @override
  String get mireVideoProjectorCountLabel => 'Número de projetores (N)';

  @override
  String get mireVideoOverlapPercentLabel => 'Sobreposição (%)';

  @override
  String get mireVideoHint1920 => 'ex: 1920';

  @override
  String get mireVideoHint1080 => 'por exemplo: 1080';

  @override
  String get mireVideoHint3840 => 'ex: 3840';

  @override
  String get mireVideoHint2160 => 'ex: 2160';

  @override
  String get mireVideoHint2 => 'ex: 2';

  @override
  String get mireVideoHint10Percent => 'por exemplo: 10,0';

  @override
  String get mireVideoTestPatternTypeLabel => 'Tipo de visão';

  @override
  String get mireVideoSimpleTypeComboAll =>
      'Combo (grade + círculos + 2 barras centralizadas)';

  @override
  String get mireVideoSimpleTypeGridSafe => 'Grade + seguro + círculos';

  @override
  String get mireVideoSimpleTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoSimpleTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireVideoSimpleTypeCheckerboard => 'Tabuleiro de damas + círculos';

  @override
  String get mireVideoExportPngButton => 'Exportar PNG';

  @override
  String get mireVideoOrientationLabel => 'Orientação';

  @override
  String get mireVideoOrientationHorizontal => 'Horizontal';

  @override
  String get mireVideoOrientationVertical => 'Vertical';

  @override
  String get mireVideoMappingTypeLabel => 'Mapeamento de tipo';

  @override
  String get mireVideoMappingTypeCombo =>
      'Combo (zonas + sobreposição + mistura)';

  @override
  String get mireVideoMappingTypeZonesAndOverlap => 'Zonas + sobreposição';

  @override
  String get mireVideoMappingTypeBlendRamps => 'Rampas de mistura';

  @override
  String get mireVideoErrorInvalidWidthHeight =>
      '❌ Largura/altura inválida (px).';

  @override
  String get mireVideoErrorInvalidProjectorCount =>
      '❌ Número de projetores inválido (N > 0).';

  @override
  String get mireVideoErrorInvalidOverlap =>
      '❌ Sobreposição inválida (0 a 99,9).';

  @override
  String get cinemaTitle => 'Cinema / Filme';

  @override
  String get cinemaIntroTitle => 'Ferramentas de cinema e filmagem';

  @override
  String get cinemaIntroBody =>
      'Cálculos úteis para óptica, enquadramento, exposição, armazenamento, timecode e projeção de cinema.';

  @override
  String get cinemaFieldOfViewTitle => 'Ângulo de campo';

  @override
  String get cinemaFieldOfViewSubtitle =>
      'Cálculo horizontal, vertical e diagonal dependendo do sensor e da distância focal.';

  @override
  String get cinemaFieldOfViewDescription =>
      'Calcula o ângulo de visão de acordo com o formato do sensor e a distância focal.';

  @override
  String get cinemaFieldOfViewInfo =>
      'Fórmula: ângulo = 2 × atan (tamanho do sensor ÷ (2 × distância focal)).';

  @override
  String get cinemaSubjectDistanceTitle => 'Distância câmera/assunto';

  @override
  String get cinemaSubjectDistanceSubtitle =>
      'Estime a distância necessária para enquadrar um assunto.';

  @override
  String get cinemaSubjectDistanceDescription =>
      'Estima a distância da câmera necessária para enquadrar um objeto em altura.';

  @override
  String get cinemaSubjectDistanceInfo =>
      'Aproximação geométrica ideal. A distância real pode variar dependendo da óptica da respiração, do modo do sensor e do corte.';

  @override
  String get cinemaDepthOfFieldTitle => 'Profundidade de campo';

  @override
  String get cinemaDepthOfFieldSubtitle =>
      'Zona nítida, limite próximo, limite distante e hiperfocal.';

  @override
  String get cinemaDepthOfFieldDescription =>
      'Calcula a zona de nitidez teórica de acordo com a distância focal, abertura, distância e círculo de confusão.';

  @override
  String get cinemaDepthOfFieldInfo =>
      'Resultado teórico. A percepção de nitidez também depende da resolução, tamanho da tela e distância de visualização.';

  @override
  String get cinemaLensEquivalenceTitle => 'Equivalência de distância focal';

  @override
  String get cinemaLensEquivalenceSubtitle =>
      'Conversão de distância focal entre formatos de sensores.';

  @override
  String get cinemaLensEquivalenceDescription =>
      'Converte uma distância focal de um formato de sensor para outro, mantendo um ângulo de visão diagonal semelhante.';

  @override
  String get cinemaLensEquivalenceInfo =>
      'Conversão baseada em diagonal. Para enquadramentos estritamente horizontais ou verticais, o fator pode ser ligeiramente diferente.';

  @override
  String get cinemaAnamorphicTitle => 'Anamórfico';

  @override
  String get cinemaAnamorphicSubtitle =>
      'Descompressão, proporção final e distância focal horizontal equivalente.';

  @override
  String get cinemaAnamorphicDescription =>
      'Calcula a proporção final após a compressão e a equivalência horizontal da distância focal.';

  @override
  String get cinemaAnamorphicInfo =>
      'Uma lente anamórfica amplia o campo horizontal após a compressão, mas mantém o comportamento vertical da distância focal.';

  @override
  String get cinemaShutterTitle =>
      'Ângulo do obturador / velocidade do obturador';

  @override
  String get cinemaShutterSubtitle =>
      'Conversão entre ângulo do obturador, FPS e velocidade.';

  @override
  String get cinemaShutterDescription =>
      'Converte um ângulo do obturador de cinema em velocidade do obturador.';

  @override
  String get cinemaShutterInfo =>
      'A 180°, a velocidade é de aproximadamente 1 ÷ (2 × fps). Exemplo: 25 fps → 1/50 s.';

  @override
  String get cinemaFlickerTitle => 'Sem cintilação';

  @override
  String get cinemaFlickerSubtitle =>
      'Velocidades seguras do obturador de acordo com 50 Hz ou 60 Hz.';

  @override
  String get cinemaFlickerDescription =>
      'Lista de velocidades do obturador geralmente seguras com base na frequência AC.';

  @override
  String get cinemaFlickerInfo =>
      'LEDs, telas e fontes escurecidas ainda podem piscar dependendo de seus componentes eletrônicos, PWM ou frequência de atualização.';

  @override
  String get cinemaNdExposureTitle => 'ND / exposição';

  @override
  String get cinemaNdExposureSubtitle =>
      'Paradas, densidade ND, fator ND e compensação de exposição.';

  @override
  String get cinemaNdExposureDescription =>
      'Converte uma correção em pontos em densidade ND e fator de redução de luz.';

  @override
  String get cinemaNdExposureInfo =>
      'Marcas: ND 0,3 = 1 ponto, ND 0,6 = 2 pontos, ND 0,9 = 3 pontos, ND 1,2 = 4 pontos.';

  @override
  String get cinemaRecordingStorageTitle => 'Tempo de gravação';

  @override
  String get cinemaRecordingStorageSubtitle =>
      'Duração disponível dependendo da capacidade e taxa de bits.';

  @override
  String get cinemaRecordingStorageDescription =>
      'Estima o tempo disponível com base na capacidade do cartão/disco e na taxa de bits do vídeo.';

  @override
  String get cinemaRecordingStorageInfo =>
      'Cálculo decimal simplificado: 1 GB = 8.000 Mb. Deixe espaço para áudio, metadados, sistema de arquivos e pool de mídia.';

  @override
  String get cinemaTimecodeTitle => 'Código de tempo';

  @override
  String get cinemaTimecodeSubtitle =>
      'Conversão de timecode ↔ frames e duração entre dois TCs.';

  @override
  String get cinemaTimecodeDescription =>
      'Converte dois timecodes em quadros e calcula a duração entre os dois.';

  @override
  String get cinemaTimecodeInfo =>
      'Esta primeira versão usa timecode completo sem queda de quadro. O drop-frame 29,97 pode então ser adicionado separadamente.';

  @override
  String get cinemaSlowMotionTitle => 'Câmera lenta / taxa de quadros';

  @override
  String get cinemaSlowMotionSubtitle =>
      'Fator de câmera lenta e tempo de reprodução.';

  @override
  String get cinemaSlowMotionDescription =>
      'Calcula o fator de câmera lenta e o tempo final de reprodução.';

  @override
  String get cinemaSlowMotionInfo =>
      'Exemplo: captura de 100 fps, leitura de 25 fps = câmera lenta ×4.';

  @override
  String get cinemaProjectionTitle => 'Exibição de cinema';

  @override
  String get cinemaProjectionSubtitle =>
      'Tela, proporção, projeção, luminância, nits e ft-L.';

  @override
  String get cinemaProjectionDescription =>
      'Calcula as dimensões da tela, a distância do projetor e a luminância aproximada.';

  @override
  String get cinemaProjectionInfo =>
      'Luminância aproximada: lêndeas ≈ lúmens × ganho ÷ (π × área). Perdas ópticas, zoom, envelhecimento da lâmpada/laser e calibração não estão incluídos.';

  @override
  String get cinemaGlobalDisclaimer =>
      'Essas ferramentas fornecem valores técnicos indicativos. Os resultados podem variar dependendo da câmera, óptica, codec, perfil de imagem, projetor, tela ou condições reais de filmagem.';

  @override
  String get cinemaSensorLabel => 'Sensor';

  @override
  String get cinemaFocalLengthLabel => 'Distância focal';

  @override
  String get cinemaHorizontalAngleResult => 'Ângulo horizontal';

  @override
  String get cinemaVerticalAngleResult => 'Ângulo vertical';

  @override
  String get cinemaDiagonalAngleResult => 'Ângulo diagonal';

  @override
  String get cinemaSensorDiagonalResult => 'Sensor diagonal';

  @override
  String get cinemaSubjectHeightLabel => 'Altura do assunto';

  @override
  String get cinemaFrameFillLabel => 'Ocupação do quadro de altura';

  @override
  String get cinemaEstimatedDistanceResult => 'Distância estimada';

  @override
  String get cinemaFrameHeightResult => 'Altura do quadro a esta distância';

  @override
  String get cinemaApertureLabel => 'Abertura';

  @override
  String get cinemaSubjectDistanceInputLabel => 'Distância do assunto';

  @override
  String get cinemaCocLabel => 'Círculo de confusão';

  @override
  String get cinemaCocHelper => 'Exemplo de quadro completo: 0,03 mm';

  @override
  String get cinemaHyperfocalResult => 'Hiperfocal';

  @override
  String get cinemaNearLimitResult => 'Perto do limite';

  @override
  String get cinemaFarLimitResult => 'Limite distante';

  @override
  String get cinemaTotalDepthResult => 'Profundidade total';

  @override
  String get cinemaSourceSensorLabel => 'Sensor de origem';

  @override
  String get cinemaTargetSensorLabel => 'Sensor alvo';

  @override
  String get cinemaSourceFocalLengthLabel => 'Distância focal da fonte';

  @override
  String get cinemaEquivalentFocalResult => 'Distância focal equivalente';

  @override
  String get cinemaAppliedFactorResult => 'Fator aplicado';

  @override
  String get cinemaSensorRecordingRatioLabel => 'Relação sensor/gravação';

  @override
  String get cinemaSensorRecordingRatioHelper =>
      '16:9 = 1,78, 4:3 = 1,33, 3:2 = 1,50';

  @override
  String get cinemaAnamorphicFactorLabel => 'Fator anamórfico';

  @override
  String get cinemaAnamorphicFactorHelper => '1,33, 1,5, 1,8, 2,0';

  @override
  String get cinemaOpticalFocalLengthLabel => 'Distância focal óptica';

  @override
  String get cinemaFinalRatioResult => 'Proporção final';

  @override
  String get cinemaHorizontalEquivalentFocalResult =>
      'Distância focal horizontal equivalente';

  @override
  String get cinemaVerticalFocalResult => 'Distância focal vertical';

  @override
  String get cinemaFramerateLabel => 'Taxa de quadros';

  @override
  String get cinemaShutterAngleLabel => 'Ângulo do obturador';

  @override
  String get cinemaExposureTimeResult => 'Período de exposição';

  @override
  String get cinemaEquivalentShutterSpeedResult => 'Velocidade equivalente';

  @override
  String get cinemaMainsFrequencyLabel => 'Frequência da rede';

  @override
  String get cinemaMains50Hz => '50 Hz — Europa';

  @override
  String get cinemaMains60Hz => '60 Hz — EUA/outros';

  @override
  String get cinemaRecommendedSpeedsResult => 'Velocidades recomendadas';

  @override
  String get cinemaMainsBaseResult => 'Base setorial';

  @override
  String get cinemaReductionLabel => 'Redução desejada';

  @override
  String get cinemaNdDensityResult => 'Densidade ND';

  @override
  String get cinemaNdFactorResult => 'Fator ND';

  @override
  String get cinemaApproxTransmissionResult => 'Transmissão aprox.';

  @override
  String get cinemaMediaCapacityLabel => 'Capacidade de mídia';

  @override
  String get cinemaBitrateLabel => 'Taxa de bits';

  @override
  String get cinemaBitrateHelper => 'Aviso: Mb/s, não MB/s';

  @override
  String get cinemaAvailableDurationResult => 'Duração disponível';

  @override
  String get cinemaStorageConsumptionResult => 'Consumo';

  @override
  String get cinemaIntegerFramerateLabel => 'Taxa de quadros inteira';

  @override
  String get cinemaIntegerFramerateHelper => '24, 25, 30, 50, 60…';

  @override
  String get cinemaTcInLabel => 'TC ENTRADA';

  @override
  String get cinemaTcOutLabel => 'TC FORA';

  @override
  String get cinemaTimecodeFormatHelper => 'Formato HH:MM:SS:FF';

  @override
  String get cinemaTcInFramesResult => 'Quadros TC IN';

  @override
  String get cinemaTcOutFramesResult => 'Quadros TC OUT';

  @override
  String get cinemaDurationFramesResult => 'Duração em quadros';

  @override
  String get cinemaDurationTcResult => 'Duração do TC';

  @override
  String get cinemaDurationResult => 'Duração';

  @override
  String get cinemaCaptureFramerateLabel => 'Filmagem com taxa de quadros';

  @override
  String get cinemaPlaybackFramerateLabel => 'Reprodução com taxa de quadros';

  @override
  String get cinemaRealDurationLabel => 'Duração real filmada';

  @override
  String get cinemaSlowMotionFactorResult => 'Fator ocioso';

  @override
  String get cinemaPlaybackDurationResult => 'Tempo de leitura';

  @override
  String get cinemaScreenWidthLabel => 'Largura da tela';

  @override
  String get cinemaImageRatioLabel => 'Proporção da imagem';

  @override
  String get cinemaImageRatioHelper => '1,85, 2,39, 1,78…';

  @override
  String get cinemaThrowRatioLabel => 'Proporção de lançamento';

  @override
  String get cinemaProjectorLumensLabel => 'Fluxo do projetor';

  @override
  String get cinemaScreenGainLabel => 'Ganho de tela';

  @override
  String get cinemaScreenHeightResult => 'Altura da tela';

  @override
  String get cinemaScreenAreaResult => 'Superfície da tela';

  @override
  String get cinemaProjectorDistanceResult => 'Distância do projetor';

  @override
  String get cinemaApproxLuminanceResult => 'Luminância aprox.';

  @override
  String get gdtfScannedPdfOcrEnabled =>
      'PDF digitalizado detectado: modo OCR ativado. A verificação pode levar mais 1-2 minutos.';

  @override
  String get gdtfAddModeDialogTitle => 'Adicionar um modo';

  @override
  String get gdtfModeNameExampleHint => 'Ex: Padrão, Fácil, Pixel Engine…';

  @override
  String get gdtfDmxChannelCountLabel => 'Número de canais DMX';

  @override
  String get gdtfDmxChannelCountHint => 'Exemplo: 24';

  @override
  String get gdtfCancel => 'Cancelar';

  @override
  String get gdtfAdd => 'Adicionar';

  @override
  String get gdtfErrorModeNameRequired => 'O nome é obrigatório';

  @override
  String get gdtfErrorInvalidChannelCount =>
      'Número inválido de canais (1-1000)';

  @override
  String get gdtfErrorModeAlreadyExists => 'Já existe um modo com este nome';

  @override
  String get gdtfHowToUseThisPageTooltip => 'Como usar esta página';

  @override
  String get gdtfHowToGetGdtfTitle => 'Como obter um GDTF';

  @override
  String get gdtfWorkflowIntro =>
      'Para cada acessório, siga estas 3 etapas em ordem.';

  @override
  String get gdtfWorkflowSearchTitle => 'Pesquisar';

  @override
  String get gdtfWorkflowSearchBody =>
      'Aba “Pesquisar”. Digite o nome do seu aparelho (ex: \"Spiider\", \"MAC Viper\", \"Q-10\"). O banco de dados GDTF Share contém mais de 6.000 acessórios oficiais validados pelos fabricantes. É gratuito, instantâneo e 100% confiável. Use PRIMEIRO para 90% dos casos.';

  @override
  String get gdtfWorkflowPdfTitle => 'Gerar de PDF';

  @override
  String get gdtfWorkflowPdfBody =>
      'Se a pesquisa não der nada, vá para a aba “Gerar de PDF”. Carregue o manual/folha de dados PDF — a IA extrai os modos DMX automaticamente. ⚠️ Importante: insira o nome exato da máquina (conforme escrito no manual) e, se você adicionar modos manualmente, use os nomes exatos dos modos DMX — caso contrário, a IA não encontrará os dados corretos. Funciona bem em PDFs limpos (Robe, Martin, etc.) e menos bem em manuais chineses digitalizados ou traduzidos.';

  @override
  String get gdtfWorkflowManualTitle => 'Adição/correção manual';

  @override
  String get gdtfWorkflowManualBody =>
      'Quando a IA terminar a análise, você chegará à página de seleção de modo. O botão “Adicionar um modo manualmente” está SEMPRE disponível no topo da lista. Use-o para: (a) adicionar um modo que a IA esqueceu, (b) excluir uma alucinação via lixeira, (c) corrigir uma contagem incorreta de canais (lixeira + adicionar novamente ao número correto). Esta é sua última linha de defesa antes de gerar GDTF – sempre verifique.';

  @override
  String get gdtfWorkflowTip =>
      'Dica: antes de extrair um PDF, sempre verifique gdtf-share — isso evita a extração de IA (mais longa e menos confiável) quando um GDTF oficial já existe. E lembre-se: o nome da máquina e os nomes dos modos devem ser exatamente os mesmos do manual — a IA depende disso!';

  @override
  String get gdtfUnderstood => 'Entendido';

  @override
  String get gdtfWorkflowSearchShortBody =>
      'Digite o nome do fixture acima. GDTF Compartilhe banco de dados (mais de 6.000 jogos oficiais). É gratuito, instantâneo e validado pelo fabricante. Resolve 90% dos casos.';

  @override
  String get gdtfWorkflowPdfShortBody =>
      'Não foi encontrado? Guia “Gerar de PDF”. Carregue o manual — a IA extrai os modos DMX. Funciona melhor em PDFs limpos.';

  @override
  String get gdtfWorkflowManualShortBody =>
      'Na página de modos, verifique sempre o que a IA produz. Você pode: adicionar um modo esquecido, excluir uma alucinação (ícone de lixeira) ou corrigir uma contagem falsa de canais (excluir + adicionar novamente ao valor correto). A IA é rápida, mas não infalível — você permanece no controle da lista final.';

  @override
  String get gdtfAddModeManually => 'Adicionar um modo manualmente';

  @override
  String get gdtfNoModeDetectedAutomatically =>
      'Nenhum modo detectado automaticamente.';

  @override
  String get gdtfNoModeDetectedHelp =>
      'O PDF provavelmente está digitalizado ou com um layout complexo. Adicione os modos manualmente com o botão acima, e a extração dos canais será então feita no texto OCR/extraído do manual.';

  @override
  String get gdtfAddMode => 'Adicionar um modo';

  @override
  String get gdtfDeleteModeTooltip => 'Remover este modo';

  @override
  String get audioHomeTitle => 'Dela';

  @override
  String get audioHomeSubtitle =>
      'Sub cardióide, end-fire, delays, SPL e ferramentas para o engenheiro de som.';

  @override
  String get homeRfTitle => 'RF e sem fio';

  @override
  String get homeRfSubtitle =>
      'WiFi 2,4/5 GHz, coexistência, bandas UHF/VHF, calculadora de antena.';

  @override
  String get homeCinemaTitle => 'Cinema / Filme';

  @override
  String get homeCinemaSubtitle =>
      'Óptica, enquadramento, exposição, timecode, armazenamento e projeção cinematográfica.';

  @override
  String get audioSectionPlacementDirectivity => 'Colocação e diretividade';

  @override
  String get audioSectionAcousticLevels => 'Acústica e níveis';

  @override
  String get audioSectionAmpCabling => 'Amplificador e fiação';

  @override
  String get audioSectionTimingAlignment => 'Tempo e alinhamento';

  @override
  String get audioSubCardioidTitle => 'Subcardióide';

  @override
  String get audioSubCardioidSubtitle =>
      'Atrasos para configuração cardióide (2 subs) ou fim de disparo (N subs em linha). Cancelamento traseiro, reforço frontal.';

  @override
  String get audioSplDistanceTitle => 'SPL e distância';

  @override
  String get audioSplDistanceSubtitle =>
      'Lei do inverso do quadrado: SPL dependendo da distância. Cálculo da potência + sensibilidade do alto-falante.';

  @override
  String get audioSplSumTitle => 'Adição de fontes SPL';

  @override
  String get audioSplSumSubtitle =>
      'N fontes incoerentes: +10·log(N) dB. Ou adição de 2 fontes diferentes.';

  @override
  String get audioElectroacousticTitle => 'Eletroacústica';

  @override
  String get audioElectroacousticSubtitle =>
      'SPL da sensibilidade do alto-falante + potência. Tabela de distância. Acoplamento coerente/inconsistente.';

  @override
  String get audioWavelengthTitle => 'Frequência e comprimento de onda';

  @override
  String get audioWavelengthSubtitle =>
      'Conversão Hz ↔ λ (m), λ/4, λ/2. Tabela de espectro de áudio por bandas.';

  @override
  String get audioAmpLoadTitle => 'Carregar amplificador/alto-falantes';

  @override
  String get audioCrossoverTitle => 'Frequência de Corte / Crossover';

  @override
  String get audioRt60Title => 'Tempo de Reverberação (RT60)';

  @override
  String get audioRt60LengthLabel => 'Comprimento';

  @override
  String get audioRt60WidthLabel => 'Largura';

  @override
  String get audioRt60HeightLabel => 'Altura';

  @override
  String get audioRt60AbsorptionLabel => 'Coeficiente de absorção médio (α)';

  @override
  String get audioRt60PresetHard => 'Muito reverberante (betão, vidro)';

  @override
  String get audioRt60PresetMedium => 'Sala média (escritórios, madeira)';

  @override
  String get audioRt60PresetTreated => 'Sala tratada (cortinas, carpete)';

  @override
  String get audioRt60PresetAbsorbent => 'Muito absorvente (estúdio tratado)';

  @override
  String get audioRt60ResultTitle => 'RT60 estimado';

  @override
  String get audioRt60VolumeLabel => 'Volume da sala';

  @override
  String get audioRt60SurfaceLabel => 'Superfície total';

  @override
  String get audioRt60QualLive => 'Muito reverberante';

  @override
  String get audioRt60QualComfortable => 'Confortável para a voz';

  @override
  String get audioRt60QualDry => 'Seco / controlado';

  @override
  String get audioRt60FormulaNote =>
      'RT60 = 0,161 × V / (α × S) — fórmula de Sabine, estimativa com absorção média uniforme';

  @override
  String get audioSplMeterTitle => 'Sonômetro';

  @override
  String get audioDelayTimeTitle => 'Tempo de Delay (BPM)';

  @override
  String get audioDelayTimeBpmLabel => 'BPM';

  @override
  String get audioDelayTimeResultsTitle => 'Tempos por divisão';

  @override
  String get audioDelayTimeEmptyState =>
      'Insere um BPM para calcular os tempos de delay.';

  @override
  String get audioDelayTimeNormalLabel => 'Normal';

  @override
  String get audioDelayTimeDottedLabel => 'Pontuada';

  @override
  String get audioDelayTimeTripletLabel => 'Tercina';

  @override
  String get audioDelayTimeFormulaNote =>
      'Tempo (ms) = 60000 / BPM × fração da semínima. Pontuada ×1,5 · Tercina ×2/3.';

  @override
  String get audioSplMeterPermissionTitle => 'Acesso ao microfone necessário';

  @override
  String get audioSplMeterPermissionBody =>
      'O sonômetro usa o microfone do telefone para estimar o nível sonoro ambiente em tempo real.';

  @override
  String get audioSplMeterAllowMic => 'Permitir microfone';

  @override
  String get audioSplMeterOpenSettings => 'Abrir configurações';

  @override
  String get audioSplMeterLiveTitle => 'Nível em tempo real';

  @override
  String get audioSplMeterStartHint => 'Toque para iniciar';

  @override
  String get audioSplMeterStopHint => 'Toque para parar';

  @override
  String get audioSplMeterStatsTitle => 'Estatísticas da sessão';

  @override
  String get audioSplMeterStatsEmpty =>
      'Inicie uma medição para ver as estatísticas mín/média/máx.';

  @override
  String get audioSplMeterMinLabel => 'Mínimo';

  @override
  String get audioSplMeterAvgLabel => 'Média';

  @override
  String get audioSplMeterMaxLabel => 'Máximo';

  @override
  String get audioSplMeterReferenceTitle => 'Referência de níveis sonoros';

  @override
  String get audioSplMeterRefQuiet => 'Sala silenciosa';

  @override
  String get audioSplMeterRefConversation => 'Conversa normal';

  @override
  String get audioSplMeterRefTraffic => 'Trânsito urbano';

  @override
  String get audioSplMeterRefConcert => 'Show / local amplificado';

  @override
  String get audioSplMeterRefPain => 'Limiar da dor';

  @override
  String get audioSplMeterDisclaimer =>
      'Medição indicativa via microfone do telefone (não calibrado) — não substitui um sonômetro certificado IEC 61672.';

  @override
  String get audioCrossoverFreqLabel => 'Frequência de corte';

  @override
  String get audioCrossoverImpedanceLabel => 'Impedância do alto-falante';

  @override
  String get audioCrossoverCapacitorLabel => 'Capacitor (passa-alta)';

  @override
  String get audioCrossoverInductorLabel => 'Bobina (passa-baixa)';

  @override
  String get audioCrossoverOrderNote => 'Filtro de 1ª ordem (6 dB/oitava)';

  @override
  String get audioCrossoverReferenceTitle =>
      'Referências de frequência de corte';

  @override
  String get audioCrossoverRefSubTop => 'Sub / Top';

  @override
  String get audioCrossoverRef2Way => '2 vias (LF/HF)';

  @override
  String get audioCrossoverRef3WayLow => '3 vias — LF/MF';

  @override
  String get audioCrossoverRef3WayHigh => '3 vias — MF/HF';

  @override
  String get audioCrossoverFormulaNote => 'C = 1 / (2π·f·Z)    L = Z / (2π·f)';

  @override
  String get audioAmpLoadSubtitle =>
      'Quantos alto-falantes por canal de amplificador. Impedância resultante, potência por alto-falante.';

  @override
  String get audioImpedanceTitle => 'Impedância Série / Paralelo';

  @override
  String get audioImpedanceModeLabel => 'Modo de cabeamento';

  @override
  String get audioImpedanceModeSeries => 'Série';

  @override
  String get audioImpedanceModeParallel => 'Paralelo';

  @override
  String get audioImpedanceSpeakerLabel => 'Alto-falante';

  @override
  String get audioImpedanceAddSpeaker => 'Adicionar um alto-falante';

  @override
  String get audioImpedanceTotalTitle => 'Impedância total';

  @override
  String get audioImpedanceEmptyState =>
      'Insira pelo menos uma impedância para calcular o total.';

  @override
  String get audioImpedanceWarningLow =>
      'Impedância baixa: verifique se seu amplificador suporta essa carga (geralmente 2 Ω no mínimo).';

  @override
  String get audioImpedanceFormulaNote =>
      'Série: Zt = Z1 + Z2 + …    Paralelo: 1/Zt = 1/Z1 + 1/Z2 + …';

  @override
  String get audioLevelsTitle => 'Níveis e cabos';

  @override
  String get audioLevelsSubtitle =>
      'Conversor dBu/dBV/V rms. Níveis de referência −10 dBV, +4 dBu, +18 dBu.';

  @override
  String get audioDelayDistanceTitle => 'Atraso de distância';

  @override
  String get audioDelayDistanceSubtitle =>
      'Distância → ms para alinhar pilhas de atraso, preenchimentos ou difusão distribuída. Multiponto.';

  @override
  String get subscriptionCategorySonRfShort => 'SOM E RF';

  @override
  String get subscriptionProShort => 'PRÓ';

  @override
  String get audioConditions => 'Termos';

  @override
  String get audioAmbientTemperature => 'Temperatura ambiente';

  @override
  String get audioSpeedOfSound => 'Velocidade do som';

  @override
  String get audioListeningPoints => 'Pontos de escuta';

  @override
  String audioDistancePoint(int index) {
    return 'Distância do ponto $index';
  }

  @override
  String get audioAddPoint => 'Adicione um ponto';

  @override
  String get audioCalculatedDelays => 'Prazos calculados';

  @override
  String get audioTypicalUseCases => 'Casos de uso típicos';

  @override
  String get audioDelayStackFillsTitle => 'Pilha de atraso/preenchimentos';

  @override
  String get audioDelayStackFillsText =>
      'Meça a distância entre o sistema principal e a torre de retardo. Aplique esse atraso à torre de atraso para alinhá-la com os ponteiros.';

  @override
  String get audioDistributedSoundTitle => 'Transmissão distribuída';

  @override
  String get audioDistributedSoundText =>
      'Para cada zona de alto-falantes, meça a distância do sistema de referência e aplique o atraso correspondente.';

  @override
  String get audioRoomFillTitle => 'Enchimento da sala';

  @override
  String get audioRoomFillText =>
      'Os alto-falantes próximos ao público são atrasados ​​em relação ao som no palco para evitar a percepção de fontes duplas.';

  @override
  String get audioDelayNote =>
      'O atraso calculado corresponde à propagação acústica no ar livre.\nAjuste fino de ouvido ou com um analisador de fase.';

  @override
  String get audioFromSpeakerSensitivity =>
      'SPL da sensibilidade do alto-falante';

  @override
  String get audioSensitivity => 'Sensibilidade';

  @override
  String get audioAmpPower => 'Potência do amplificador';

  @override
  String get audioMeasurementDistance => 'Medindo distância';

  @override
  String get audioTypicalSensitivities => 'Sensibilidades Típicas';

  @override
  String get audioSourceCoupling => 'Acoplamento de fonte';

  @override
  String get audioSourceCouplingIntro =>
      'Ao adicionar fontes idênticas lado a lado, o ganho depende do tipo de acoplamento:';

  @override
  String audioSourcesCount(int count) {
    return '$count fontes';
  }

  @override
  String get audioPracticalRules => 'Regras práticas';

  @override
  String get audioRuleDoubleDistance =>
      'Dobre a distância = −6 dB (campo livre). Numa sala, a atenuação é menor graças aos reflexos.';

  @override
  String get audioRuleDoublePower =>
      'Dobre a potência = +3 dB. Multiplique por 10 = +10 dB. É necessária uma potência de ×100 para ganhar +20 dB.';

  @override
  String get audioRuleCoupling =>
      'Acoplamento coerente (fontes em fase, costas com costas): +6 dB por duplicação. Acoplamento inconsistente: +3 dB.';

  @override
  String get audioRuleSafety =>
      'Limiar de dor ≈ 120 dB NPS. Risco auditivo a partir de 85 dB (8h) segundo NIOSH. Cada +3 dB divide o tempo de exposição por 2.';

  @override
  String get audioDistance => 'Distância';

  @override
  String get audioSpl => 'SPL';

  @override
  String get audioIncoherent => 'Incoerente';

  @override
  String get audioCoherent => 'Consistente';

  @override
  String get audioIncoherentSubtitle =>
      'Fontes inusitadas\nou não sincronizado';

  @override
  String get audioCoherentSubtitle => 'Fontes em fase\nalinhado';

  @override
  String get audioLevelConverter => 'Conversor de nível';

  @override
  String get audioReferenceLevels => 'Níveis de referência';

  @override
  String get audioGainStagingRules => 'Ganho de estadiamento – regras práticas';

  @override
  String get audioAmplifierPerChannel => 'AMPLIFICADOR — por canal';

  @override
  String get audioMinimumImpedance => 'Zmin (Ω)';

  @override
  String get audioPowerW => 'Potência (W)';

  @override
  String get audioAtOhm => 'para (Ω)';

  @override
  String get audioSpeaker => 'GRÁVIDA';

  @override
  String get audioNominalImpedance => 'Z nominal (Ω)';

  @override
  String get audioContinuousPower => 'P continua (W)';

  @override
  String get audioParallelConnection => 'CONEXÃO PARALELA';

  @override
  String get audioLoadImpedance => 'Carga Z';

  @override
  String get audioPowerPerSpeaker => 'P/enc.';

  @override
  String get audioStatus => 'Status';

  @override
  String audioTooLowImpedance(String diff) {
    return '✗ Z muito baixo (−$diff Ω)';
  }

  @override
  String get audioExceedsContinuousPower => '⚠ Excede P continua';

  @override
  String audioNearLimit(int percent) {
    return '⚠ Perto do limite (>$percent%)';
  }

  @override
  String audioOkContinuousPower(int percent) {
    return '✓ OK ($percent% P cont.)';
  }

  @override
  String get audioAmpLoadNote =>
      'Cálculo baseado na potência publicada pelo fabricante do amplificador para cada impedância (interpolada). A potência do canal é repartida pelas N colunas em paralelo. Uma margem de ×1,5 a ×2 sobre a potência RMS/AES é comum com um limitador ajustado. Valores das fichas técnicas: confirme sempre com os presets e recomendações do fabricante.';

  @override
  String get audioConfiguration => 'Configuração';

  @override
  String get audioParameters => 'Configurações';

  @override
  String get audioSubDistance => 'Distância entre submarinos';

  @override
  String get audioSubCount => 'Número de inscritos';

  @override
  String get audioCardioid2Subs => 'Cardióide – 2 suplentes';

  @override
  String get audioCardioid2SubsDescription =>
      '1 sub normal + 1 sub retornado com atraso';

  @override
  String get audioEndFireNSubs => 'End-fire – N inscritos online';

  @override
  String get audioEndFireNSubsDescription =>
      'Todos voltados para a frente, atrasos deslocados por linha';

  @override
  String get audioResults => 'Resultados';

  @override
  String get audioEnterDistanceToCalculate =>
      'Insira uma distância para calcular';

  @override
  String get audioDelayToApply => 'Prazo para inscrição';

  @override
  String get audioRearSubDelaySublabel => 'no sub virado (traseiro)';

  @override
  String get audioOptimalFrequency => 'Frequência ideal';

  @override
  String get audioFrontSub => 'Sub Frontal';

  @override
  String get audioRearSubReversed => 'Sub traseiro (invertido)';

  @override
  String get audioNormalPolarity => 'Normais ✓';

  @override
  String get audioInvertedPolarity => 'Invertida 🔄';

  @override
  String get audioDelayBetweenRows => 'Atraso entre cada linha';

  @override
  String get audioMaxDelayRearSub => 'Atraso máximo (sub traseiro)';

  @override
  String get audioFrontReferenceSub => 'Sub frontal (referência)';

  @override
  String audioSubNumber(int index) {
    return 'Sub$index';
  }

  @override
  String get audioEndFireReferenceNote =>
      '→ Sub 1 (frente) é a referência. Os seguintes subs têm um atraso crescente.';

  @override
  String get audioHowTo => 'Como fazer isso?';

  @override
  String get audioCardioidStep1 =>
      'Coloque o sub A de frente para o público (posição normal).';

  @override
  String get audioCardioidStep2 =>
      'Coloque o sub B logo atrás dele, fisicamente virado de cabeça para baixo, voltado para a parte de trás do palco.';

  @override
  String get audioCardioidStep3 =>
      'No seu processador ou console, inverta a polaridade do sub B (botão Ø/Fase).';

  @override
  String get audioCardioidStep4 =>
      'Aplique o atraso calculado ao sub B. Não atrase o sub A.';

  @override
  String get audioCardioidStep5 =>
      'Verifique o cancelamento traseiro com um microfone de medição ou andando atrás do conjunto.';

  @override
  String get audioCardioidTip =>
      '💡 A distância ideal entre os subs corresponde a λ/4 da frequência central do sub (por exemplo, 90 Hz → ~0,95 m a 20 °C). Ajuste para encontrar o melhor compromisso entre cancelamento e potência.';

  @override
  String get audioEndFireStep1 =>
      'Alinhe todos os substitutos em fila, todos de frente para o público, com a mesma distância entre cada um.';

  @override
  String get audioEndFireStep2 =>
      'O sub mais avançado (sub 1) é a referência: atraso = 0.';

  @override
  String get audioEndFireStep3 =>
      'Aplique um atraso crescente a cada classificação subsequente (sub 2 → 1×delay, sub 3 → 2×delay, etc.).';

  @override
  String get audioEndFireStep4 =>
      'Todos os subs mantêm a mesma polaridade (sem inversão).';

  @override
  String get audioEndFireStep5 =>
      'Meça na parte de trás para verificar a atenuação.';

  @override
  String get audioEndFireTip =>
      '💡 End-fire oferece um ganho de diretividade um pouco menor que o cardióide clássico, mas funciona com mais de 2 subs e não requer inversão física.';

  @override
  String get audioConversion => 'Conversão';

  @override
  String get audioFrequency => 'Freqüência';

  @override
  String get audioWavelength => 'Comprimento de onda';

  @override
  String get audioResult => 'Resultado';

  @override
  String get audioEnterValueToCalculate => 'Insira um valor para calcular';

  @override
  String audioWavelengthAt(String frequency) {
    return 'Comprimento de onda em $frequency';
  }

  @override
  String audioFrequencyForLambda(String lambda) {
    return 'Frequência para λ = $lambda m';
  }

  @override
  String get audioHalfWave => 'λ/2 (meia onda)';

  @override
  String get audioQuarterWave => 'λ/4 (quarto de onda)';

  @override
  String get audioSpectrumMarkers => 'Espectro de áudio – benchmarks';

  @override
  String get audioWavelengthFormula =>
      'Fórmula: λ = v/f |    v = 331,3 + 0,606 × T (°C)';

  @override
  String get audioHzToLambda => 'Hz → λ (m)';

  @override
  String get audioLambdaToHz => 'λ(m)→Hz';

  @override
  String get audioSubBass => 'Sub-baixo';

  @override
  String get audioBass => 'Baixo';

  @override
  String get audioLowMid => 'Médios-baixos';

  @override
  String get audioMid => 'Médiuns';

  @override
  String get audioHighMid => 'Médios altos';

  @override
  String get audioTreble => 'Agudos';

  @override
  String get audioIncoherentSources => 'Fontes inconsistentes';

  @override
  String get audioIdenticalSources => 'N fontes idênticas';

  @override
  String get audioSingleSourceSpl => 'SPL de uma fonte';

  @override
  String audioTotalSplSources(int count) {
    return 'SPL total (fontes $count)';
  }

  @override
  String get audioTwoDifferentSources => '2 fontes diferentes';

  @override
  String get audioSourceA => 'Fonte A';

  @override
  String get audioSourceB => 'Fonte B';

  @override
  String get audioTotalSplAB => 'NPS Total (A + B)';

  @override
  String get audioDoublingReference => 'Referência - duplicando o ganho';

  @override
  String get audioIncoherentShort => 'Incoh. :';

  @override
  String get audioCoherentShort => 'Coer. :';

  @override
  String get audioCalculationMode => 'Método de cálculo';

  @override
  String get audioReferenceSpl => 'Referência SPL';

  @override
  String get audioReferenceDistance => 'Distância de referência';

  @override
  String get audioTargetDistance => 'Distância alvo';

  @override
  String get audioEnterValuesToCalculate => 'Insira os valores para calcular';

  @override
  String audioSplAtDistance(String distance) {
    return 'SPL em ${distance}m';
  }

  @override
  String get audioVariation => 'Variação';

  @override
  String get audioListeningDistance => 'Distância de audição';

  @override
  String get audioMaxSplAt1m => 'SPL máximo a 1m';

  @override
  String get audioDistanceToSpl => 'Distância → SPL';

  @override
  String get audioPowerToSpl => 'Potência → SPL';

  @override
  String get audioSoundLevelReference => 'Referência de nível de som';

  @override
  String get audioSectionSafety => 'Segurança auditiva';

  @override
  String get audioNoiseDoseTitle => 'Dose sonora e tempo de exposição';

  @override
  String get audioNoiseDoseIntro =>
      'Cada +3 dB reduz para metade o tempo de exposição permitido (regra de troca de 3 dB). Introduza o nível sonoro medido ou previsto para estimar o tempo até atingir os limites regulamentares de exposição ao ruído.';

  @override
  String get audioNoiseDoseLevelCardTitle => 'Nível medido';

  @override
  String get audioNoiseDoseLevelLabel => 'Nível sonoro';

  @override
  String get audioNoiseDoseAllowedTimeTitle => 'Tempo permitido até à dose';

  @override
  String get audioNoiseDoseVaiLabel => 'Valor de ação inferior';

  @override
  String get audioNoiseDoseVasLabel => 'Valor de ação superior';

  @override
  String get audioNoiseDoseVleLabel => 'Valor limite de exposição';

  @override
  String get audioNoiseDoseUnlimited => '≥ 8 h (sem risco num dia)';

  @override
  String get audioNoiseDoseTableTitle =>
      'Referência — tempo permitido por nível';

  @override
  String get audioNoiseDoseTableLevelHeader => 'Nível';

  @override
  String get audioNoiseDoseTableTimeHeader => 'Tempo permitido (VLE 87 dB)';

  @override
  String get audioNoiseDoseVenueTitle =>
      'Limites para recintos (decreto francês de espetáculos)';

  @override
  String get audioNoiseDoseVenueText =>
      'O decreto francês 2017-1244 limita o nível médio (LAeq em 15 min) a 102 dB(A) (recinto ocasional) ou 105 dB(A) (recinto habitual), com um nível de pico ≤ 118 ou 120 dB(C). Aplicam-se ao público de forma contínua através de um limitador — independentes da exposição profissional calculada acima.';

  @override
  String get audioNoiseDoseDisclaimer =>
      'Ferramenta indicativa baseada na regra de troca de 3 dB (código do trabalho francês, art. R.4431-2). Não substitui um sonómetro ou dosímetro certificado, nem uma medição regulamentar no local.';

  @override
  String get audioSectionOrganization => 'Organização';

  @override
  String get audioInputListTitle => 'Lista de inputs';

  @override
  String get audioInputListIntro =>
      'Monte a sua lista de inputs de microfone/DI para a passagem de som ou a folha de patch. A ordem das linhas define o número do canal — arraste para reorganizar.';

  @override
  String get audioInputListEmpty =>
      'Ainda sem entradas. Adicione a primeira linha da sua lista de inputs.';

  @override
  String get audioInputListAddButton => 'Adicionar entrada';

  @override
  String audioInputListChannel(Object n) {
    return 'Canal $n';
  }

  @override
  String get audioInputListNameLabel => 'Fonte';

  @override
  String get audioInputListPositionLabel => 'Posição';

  @override
  String get audioInputListNotesLabel => 'Notas';

  @override
  String get audioInputListTypeMic => 'Microfone';

  @override
  String get audioInputListTypeDi => 'DI';

  @override
  String get audioInputListTypeLine => 'Linha';

  @override
  String get audioInputListTypeWireless => 'Sem fios';

  @override
  String get audioInputListTypeOther => 'Outro';

  @override
  String get audioInputListCopyAction => 'Copiar lista';

  @override
  String get audioInputListCopiedSnackbar =>
      'Lista copiada para a área de transferência';

  @override
  String get audioInputListClearAction => 'Limpar tudo';

  @override
  String get audioInputListClearConfirmTitle => 'Limpar toda a lista?';

  @override
  String get audioInputListClearConfirmBody =>
      'Isto remove todas as entradas da lista de inputs. Não é possível desfazer.';

  @override
  String get pluginCommunity => 'Comunidade de plug-ins';

  @override
  String get pluginCommunitySubtitle =>
      'Compartilhe e descubra grandMA3 plugins criados pela comunidade';

  @override
  String get pluginCommunitySubtitleAuth =>
      'Compartilhe e descubra plug-ins\ngrandMA3 criado pela comunidade.';

  @override
  String get continueWithGoogle => 'Continuar com o Google';

  @override
  String get authChoosePseudo => 'Escolha seu apelido';

  @override
  String get authPseudoHint => 'Seu apelido na comunidade';

  @override
  String get confirm => 'Confirmar';

  @override
  String get loginCancelled => 'Conexão cancelada.';

  @override
  String get anonymous => 'Anônimo';

  @override
  String get share => 'Compartilhar';

  @override
  String get searchPluginHint => 'Procure um plug-in…';

  @override
  String get allPluginsFilter => '⭐ Todos';

  @override
  String get loginRequiredLike => 'Faça login para curtir 👋';

  @override
  String get noPluginsYet => 'Nenhum plug-in aqui ainda.';

  @override
  String get beFirstToShare => 'Seja o primeiro a compartilhar!';

  @override
  String get signOut => 'Sair';

  @override
  String get luaCode => 'Código Lua';

  @override
  String get copied => 'Copiado!';

  @override
  String get copyCode => 'Copiar código';

  @override
  String get pluginPublished => '🚀 Plugin lançado!';

  @override
  String get sharePlugin => 'Compartilhe um plug-in';

  @override
  String get pluginTitle => 'Título do plug-in';

  @override
  String get pluginTitleHint => 'ex: lote de cores RGB – 30 predefinições';

  @override
  String get pluginTitleRequired => 'Título obrigatório';

  @override
  String get category => 'Categoria';

  @override
  String get optionalDescription => 'Descrição (opcional)';

  @override
  String get pluginDescriptionHint =>
      'O que o plugin faz, o que pede ao usuário...';

  @override
  String get codeRequired => 'Código obrigatório';

  @override
  String get codeMustContainReturnMain =>
      'O código deve conter \"return main\"';

  @override
  String get pluginTestedWarning =>
      'Certifique-se de que o plugin foi testado no MA3 antes de compartilhá-lo.';

  @override
  String get attachFiles => 'Anexar arquivos';

  @override
  String get addFiles => 'Adicionar arquivos (.lua, .xml…)';

  @override
  String filesSelected(Object count) {
    return '$count arquivo(s) selecionado(s)';
  }

  @override
  String get codeOptional => 'Cole o código (opcional)';

  @override
  String get codeOrFileRequired =>
      'Adicione pelo menos um arquivo ou cole o código';

  @override
  String get downloadFile => 'Download';

  @override
  String get pluginFiles => 'Arquivos';

  @override
  String get uploadingFiles => 'Enviando arquivos…';

  @override
  String get publishPlugin => 'Publique o plug-in';

  @override
  String get free => 'LIVRE';

  @override
  String get pro => 'PRÓ';

  @override
  String get console => 'Console';

  @override
  String pluginError(Object error) {
    return 'Erro: $error';
  }

  @override
  String get pluginCategory_all => 'Todos';

  @override
  String get pluginCategory_color => 'Cor';

  @override
  String get pluginCategory_movement => 'Movimento';

  @override
  String get pluginCategory_effect => 'Efeitos';

  @override
  String get pluginCategory_dimmer => 'Intensidade';

  @override
  String get pluginCategory_layout => 'Disposição';

  @override
  String get pluginCategory_select => 'Seleção';

  @override
  String get pluginCategory_macro => 'macro';

  @override
  String get pluginCategory_utility => 'Utilitário';

  @override
  String get pluginCategory_custom => 'Personalizado';

  @override
  String get ma3AppTitlePrefix => 'Plug-in MA3';

  @override
  String get ma3AppTitleAccent => 'Forjado';

  @override
  String get ma3New => '↺ Novo';

  @override
  String get ma3StepCategory => 'Categoria';

  @override
  String get ma3StepSettings => 'Configurações';

  @override
  String get ma3StepGeneratedCode => 'Código gerado';

  @override
  String get ma3ChoosePluginType => 'Que tipo de plugin?';

  @override
  String get ma3ChooseCategorySubtitle => 'Escolha uma categoria para começar';

  @override
  String get ma3Continue => 'Continuar →';

  @override
  String get ma3PluginName => 'Nome do plug-in';

  @override
  String get ma3PluginNameHint => 'Meu plug-in MA3';

  @override
  String get ma3PluginSettings => 'Configurações de plug-in';

  @override
  String get ma3AdditionalDetails => '💬 Detalhes adicionais (opcional)';

  @override
  String get ma3AdditionalDetailsHint =>
      'Adiciona detalhes, casos especiais, restrições...';

  @override
  String get ma3Back => '← Voltar';

  @override
  String get ma3GeneratePlugin => '⚡ Gere o plug-in';

  @override
  String get ma3GeneratedReady => 'Plugin gerado — pronto para colar no MA3';

  @override
  String get ma3InstallInMa3 => 'Instale no MA3:';

  @override
  String get ma3Menu => 'Menu';

  @override
  String get ma3Plugin => 'Plug-in';

  @override
  String get ma3NewPlugin => 'Novo plug-in';

  @override
  String get ma3PasteSaveAs => '→ colar → salvar como';

  @override
  String get ma3Run => 'Correr';

  @override
  String get ma3Copied => '✓ Copiado!';

  @override
  String get ma3Copy => '⎘ Copiar';

  @override
  String get ma3Edit => '← Editar';

  @override
  String get ma3Regenerate => '↺ Regenerar';

  @override
  String get ma3NewPluginButton => '+ Novo plug-in';

  @override
  String get ma3Choose => '- Escolher -';

  @override
  String get ma3Add => 'Adicionar...';

  @override
  String get ma3GeneratedPluginFallback => 'Plug-in';

  @override
  String get ma3CategoryColor => 'Cor';

  @override
  String get ma3CategoryColorDesc =>
      'Layout RGB, paleta, predefinições de cores';

  @override
  String get ma3CategoryMovement => 'Movimento';

  @override
  String get ma3CategoryMovementDesc => 'Pan/Tilt, círculo, figura 8, posições';

  @override
  String get ma3CategoryEffect => 'Efeitos';

  @override
  String get ma3CategoryEffectDesc => 'Strobe, pulso, perseguição, sequências';

  @override
  String get ma3CategoryDimmer => 'Intensidade';

  @override
  String get ma3CategoryDimmerDesc => 'Dimmer, colisão, desbotamento, apagão';

  @override
  String get ma3CategoryLayout => 'Disposição';

  @override
  String get ma3CategoryLayoutDesc => 'Criar/organizar layouts MA3';

  @override
  String get ma3CategorySelect => 'Seleção';

  @override
  String get ma3CategorySelectDesc => 'Seleção de grupos, fixtures, filtros';

  @override
  String get ma3CategoryMacro => 'macro';

  @override
  String get ma3CategoryMacroDesc =>
      'Macros de várias etapas, sequências de console';

  @override
  String get ma3CategoryUtility => 'Utilitário';

  @override
  String get ma3CategoryUtilityDesc =>
      'Rotule, armazene e organize o arquivo do show';

  @override
  String get ma3CategoryCustom => 'Personalizado';

  @override
  String get ma3CategoryCustomDesc => 'Descreva livremente o que você deseja';

  @override
  String get ma3FieldColorSpace => 'Espaço de cores da máquina';

  @override
  String get ma3FieldColors => 'Cores para oferecer como predefinições';

  @override
  String get ma3FieldGroupSelect => 'O plugin pede o grupo no lançamento';

  @override
  String get ma3YesViaMa3Dialog => 'Sim - via diálogo MA3';

  @override
  String get ma3NoUseCurrentSelection => 'Não — usa a seleção atual';

  @override
  String get ma3FieldMovementType => 'Tipo de movimento a ser criado';

  @override
  String get ma3MovePresetPositions =>
      'Posições predefinidas (cena, frente, laterais...)';

  @override
  String get ma3MoveCircle => 'Mecanismo de Efeito - Círculo';

  @override
  String get ma3MoveFigure8 => 'Mecanismo de Efeito – Figura 8';

  @override
  String get ma3MovePanSweep => 'Mecanismo de efeitos - varredura panorâmica';

  @override
  String get ma3MoveTiltSweep =>
      'Mecanismo de efeito – varredura de inclinação';

  @override
  String get ma3MoveRandom => 'Mecanismo de Efeito – Aleatório';

  @override
  String get ma3FieldSpeedSourceEffects => 'Fonte de velocidade (para efeitos)';

  @override
  String get ma3SpeedBpmConsole => 'BPM — valor inserido no console';

  @override
  String get ma3SpeedExecutorConsole =>
      'Speed ​​​​Executor — número inserido no console';

  @override
  String get ma3SpeedBothConsole => 'Ambos — escolha oferecida no console';

  @override
  String get ma3FieldEffectType => 'Tipo de efeito a ser criado';

  @override
  String get ma3FieldOutput => 'O que o plugin cria';

  @override
  String get ma3OutputEffectPresets => 'Predefinições de efeitos';

  @override
  String get ma3OutputChaseSequence => 'Sequência de perseguição';

  @override
  String get ma3OutputTriggerMacro => 'Gatilho macro';

  @override
  String get ma3FieldSpeedSource => 'Fonte de velocidade';

  @override
  String get ma3FieldFeatures => 'Recursos a serem incluídos';

  @override
  String get ma3OutputIntensityMacros => 'Macros de intensidade';

  @override
  String get ma3OutputIntensityPresets => 'Predefinições de intensidade';

  @override
  String get ma3FieldLayoutSections => 'Seções a serem incluídas no layout';

  @override
  String get ma3SectionColors => 'Cores';

  @override
  String get ma3SectionGroups => 'Grupos';

  @override
  String get ma3SectionPresets => 'Predefinições';

  @override
  String get ma3FieldVisualStyle => 'Estilo visual';

  @override
  String get ma3FieldGroupNameNumber =>
      'O plugin pede o nome/número no lançamento';

  @override
  String get ma3NoHardcodedGenericName => 'Não – nome genérico codificado';

  @override
  String get ma3FieldSelectionCriteria => 'Critérios de seleção a propor';

  @override
  String get ma3CriteriaEvenOdd => 'Par/Ímpar';

  @override
  String get ma3CriteriaThirds => '1/3 — 2/3 — 3/3';

  @override
  String get ma3CriteriaPosition => 'Por posição (avançado/meio/atrás)';

  @override
  String get ma3CriteriaAll => 'Todos';

  @override
  String get ma3CriteriaFirstLast => 'Primeiro/Último';

  @override
  String get ma3OutputSelectionMacros => 'Macros de seleção';

  @override
  String get ma3OutputGroupButtonsLayout => 'Agrupar botões em um layout';

  @override
  String get ma3FieldMacroSteps => 'Descreva as etapas da macro';

  @override
  String get ma3MacroStepsHint =>
      'ex:\n1. Selecione um grupo (caixa de diálogo)\n2. Apagão\n3. Espere 1s\n4. Fade In 3s';

  @override
  String get ma3FieldTrigger => 'Acionar';

  @override
  String get ma3TriggerManual => 'Manual';

  @override
  String get ma3FieldTask => 'Tarefa a ser executada';

  @override
  String get ma3TaskNameFixtures => 'Nomeando os fixtures do patch';

  @override
  String get ma3TaskCreateGroups => 'Crie grupos automaticamente';

  @override
  String get ma3TaskStorePresets => 'Armazene todas as predefinições';

  @override
  String get ma3TaskCleanEmptyObjects => 'Limpe objetos vazios';

  @override
  String get ma3TaskCloneLayout => 'Clonar um layout';

  @override
  String get ma3TaskShowReport =>
      'Mostrar relatório (aparelhos, grupos, presets)';

  @override
  String get ma3FieldConfirmEachAction => 'Confirme antes de cada ação';

  @override
  String get ma3Yes => 'Sim';

  @override
  String get ma3No => 'Não';

  @override
  String get ma3FieldCustomDescription =>
      'Descreva o que o plugin deve fazer no MA3';

  @override
  String get ma3ColorRed => 'Vermelho';

  @override
  String get ma3ColorGreen => 'Verde';

  @override
  String get ma3ColorBlue => 'Azul';

  @override
  String get ma3ColorYellow => 'AMARELO';

  @override
  String get ma3ColorOrange => 'Laranja';

  @override
  String get ma3ColorPink => 'Rosa';

  @override
  String get ma3ColorColdWhite => 'Branco fresco';

  @override
  String get ma3ColorWarmWhite => 'Branco quente';

  @override
  String get ma3EffectStrobe => 'Estroboscópio';

  @override
  String get ma3EffectPulse => 'Pulso';

  @override
  String get ma3EffectChase => 'Perseguir';

  @override
  String get ma3EffectTwinkle => 'Cintilação';

  @override
  String get ma3EffectFire => 'Fogo';

  @override
  String get ma3EffectSawtooth => 'Dente de serra';

  @override
  String get ma3EffectRandom => 'Aleatório';

  @override
  String get ma3Blackout => 'Apagão';

  @override
  String get ma3Full => 'Completo';

  @override
  String get ma3Bump => 'Ressalto';

  @override
  String get ma3FadeIn => 'Desaparecer';

  @override
  String get ma3FadeOut => 'Desaparecer';

  @override
  String get ma3DimmerChase => 'Perseguição Dimmer';

  @override
  String get ma3Compact => 'Compactar';

  @override
  String get ma3Large => 'Largo';

  @override
  String get ma3Tablet => 'Comprimido';

  @override
  String get ma3Wing => 'asa';

  @override
  String get ma3Random => 'Aleatório';

  @override
  String get ma3FirstLast => 'Primeiro/Último';

  @override
  String ma3Error(Object error) {
    return 'Erro: $error';
  }

  @override
  String get ma3Text_RGB => 'RGB';

  @override
  String get ma3Text_CMY => 'CMY';

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
  String get ma3Text_Gel_Color => 'Cor Gel';

  @override
  String get ma3Text_Cyan => 'Ciano';

  @override
  String get ma3Text_Magenta => 'Magenta';

  @override
  String get ma3Text_Lime => 'Lima';

  @override
  String get ma3Text_UV => 'ultravioleta';

  @override
  String get ma3Text_OFF => 'DESLIGADO';

  @override
  String get ma3Text_50 => '50%';

  @override
  String get ma3Text_25 => '25%';

  @override
  String get ma3Text_GO_button => 'Botão IR';

  @override
  String get ma3Text_Timecode => 'Código de tempo';

  @override
  String get ma3Text_OSC => 'OSC';

  @override
  String get ma3Text_MIDI => 'MEIO-DIA';

  @override
  String get gdtfShareAsZip => 'Compartilhar em .zip';

  @override
  String get gdtfZipShareHelp =>
      '💡 Útil se o Gmail ou seu e-mail estiver bloqueando .gdtf — renomeie o arquivo para .gdtf após recebê-lo.';

  @override
  String get rfAntennaTitle => 'Calculadora de antena';

  @override
  String get rfSplitterTitle => 'Perda de Divisor / Combinador';

  @override
  String get rfCableAntennaTitle => 'Cabo RF e Antenas';

  @override
  String get rfCableLossSectionTitle => 'Perda no cabo coaxial';

  @override
  String get rfCableLossCableTypeLabel => 'Tipo de cabo';

  @override
  String get rfCableAntennaFrequencyLabel => 'Frequência';

  @override
  String get rfCableLossLengthLabel => 'Comprimento do cabo';

  @override
  String get rfCableAntennaEmptyState =>
      'Insira os valores para ver o resultado.';

  @override
  String get rfCableLossResultLabel => 'Perda total';

  @override
  String get rfCableLossFormulaNote =>
      'Atenuação ≈ k1·√f + k2·f (dB/100 m) — modelo empírico por tipo de cabo, tipicamente ±5% entre 100 MHz e 2,5 GHz. Valores indicativos: consulte a folha de dados do cabo para um orçamento de enlace crítico.';

  @override
  String get rfDiversitySectionTitle =>
      'Espaçamento de antenas diversity (λ/4)';

  @override
  String get rfDiversityResultLabel => 'Espaçamento recomendado';

  @override
  String get rfDiversityFormulaNote =>
      'λ/4 = 75 / f(MHz) metros — espaçamento mínimo recomendado entre duas antenas diversity para limitar o desvanecimento por multipercurso.';

  @override
  String get rfPlannerTitle => 'Planeador de Frequências HF';

  @override
  String get rfPlannerBandLabel => 'Banda de frequências';

  @override
  String get rfPlannerCustomBand => 'Personalizada';

  @override
  String get rfPlannerMinFreqLabel => 'Frequência mín.';

  @override
  String get rfPlannerMaxFreqLabel => 'Frequência máx.';

  @override
  String get rfPlannerChannelCountLabel => 'Número de canais desejado';

  @override
  String get rfPlannerMinSpacingLabel => 'Espaçamento mínimo entre canais';

  @override
  String get rfPlannerResultTitle => 'Frequências sugeridas';

  @override
  String get rfPlannerFoundLabel => 'Canais encontrados';

  @override
  String get rfPlannerNotEnoughWarning =>
      'Não foi possível encontrar todos os canais solicitados nesta banda com este espaçamento — tente uma banda mais larga ou reduza o número de canais/o espaçamento mínimo.';

  @override
  String get rfPlannerFormulaNote =>
      'Evita produtos de intermodulação de 3ª ordem (2fA−fB, fA+fB−fC) entre todos os canais, tolerância ±200 kHz — não é uma garantia absoluta, verifique no local com uma varredura de RF.';

  @override
  String get rfSplitterWaysLabel => 'Número de vias';

  @override
  String get rfSplitterExcessLossLabel => 'Perda excedente do divisor';

  @override
  String get rfSplitterAdditionalLossLabel => 'Perdas de cabos e conectores';

  @override
  String get rfSplitterTotalTitle => 'Perda total de inserção';

  @override
  String get rfSplitterTheoreticalLabel => 'Perda teórica (10·log₁₀N)';

  @override
  String get rfSplitterReferenceTitle => 'Referência por número de vias';

  @override
  String get rfSplitterFormulaNote =>
      'Perda total ≈ perda teórica + perda excedente + perdas de cabos/conectores';

  @override
  String get rfFrequency => 'Freqüência';

  @override
  String get rfVelocityFactorTitle => 'Fator de velocidade (Vf)';

  @override
  String get rfAntennaLengths => 'Comprimentos de antena';

  @override
  String get rfEnterFrequencyToCalculate =>
      'Insira uma frequência para calcular';

  @override
  String get rfFullWave => 'Onda completa (λ)';

  @override
  String get rfHalfWave => 'Meia onda (λ/2)';

  @override
  String get rfStandardDipole => 'Dipolo padrão';

  @override
  String get rfQuarterWave => 'Quarto de onda (λ/4)';

  @override
  String get rfWhipAntenna => 'Antena chicote – mais comum';

  @override
  String get rfFiveEighthWave => 'Onda 5/8 (5λ/8)';

  @override
  String get rfFiveEighthWaveDescription => 'Ganho +3 dB vs λ/4';

  @override
  String get rfReferenceFrequencies => 'Frequências de referência';

  @override
  String get rfFmRadio => 'Rádio FM (88 MHz)';

  @override
  String get rfVhfLow => 'VHF baixo (174 MHz)';

  @override
  String get rfUhf470 => 'UHF 470 MHz';

  @override
  String get rfUhf600 => 'UHF 600 MHz';

  @override
  String get rfUhf694 => 'UHF 694 MHz (limite FR)';

  @override
  String get rfIsm863 => 'ISM 863 MHz';

  @override
  String get rfWifi24 => 'Wi-Fi de 2,4 GHz';

  @override
  String get rfWifi5 => 'WiFi de 5 GHz (centro)';

  @override
  String get rfFormulaExplanation =>
      'λ = c/f × Vf |    c = 299,792 m/µs\nVf = fator de velocidade do cabo (1,00 para ar livre)';

  @override
  String get rfPresetFreeSpace => 'Ar livre';

  @override
  String get rfCoexTitle => 'Coexistência de 2,4 GHz';

  @override
  String get rfCoexBandOccupancyTitle => 'Quem ocupa a banda de 2,4 GHz?';

  @override
  String get rfCoexAvProtocolsTitle => '⚡ Protocolos AV em 2,4 GHz';

  @override
  String get rfCoexAllProtocolsTitle => 'Todos os protocolos';

  @override
  String get rfCoexFrequentConflictsTitle => 'Conflitos frequentes em eventos';

  @override
  String get rfCoexFieldRecommendationsTitle => 'Recomendações de campo';

  @override
  String get rfCoexProtocolWifi24Name => 'Wi-Fi de 2,4 GHz';

  @override
  String get rfCoexProtocolWifi24Note =>
      'Canais fixos, banda larga. Alta potência de transmissão.';

  @override
  String get rfCoexProtocolBluetoothClassicName => 'Bluetooth Clássico';

  @override
  String get rfCoexProtocolBluetoothClassicNote =>
      'Salta entre 1600 frequências/s. Coexistência com WiFi via AFH.';

  @override
  String get rfCoexProtocolBluetoothLeName => 'Bluetooth LE';

  @override
  String get rfCoexProtocolBluetoothLeNote =>
      'Canais 37, 38, 39 = publicidade (fixo). Risco com WiFi capítulo 1.';

  @override
  String get rfCoexProtocolZigbeeName => 'Zigbee (IEEE 802.15.4)';

  @override
  String get rfCoexProtocolZigbeeNote =>
      'Canais 11–26, cada um com 2 MHz de largura. Compatível com WiFi ch1/6/11.';

  @override
  String get rfCoexProtocolDigitalMics24Name => 'Microfones digitais 2,4 GHz';

  @override
  String get rfCoexProtocolDigitalMics24Note =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D 2,4 GHz. Muito suscetível a interferências WiFi.';

  @override
  String get rfCoexProtocolWirelessDmxName => 'DMX / RDM sem fio';

  @override
  String get rfCoexProtocolWirelessDmxNote =>
      'Lumen Rádio CRMX, W-DMX, City Theatrical. FHSS = robusto, mas com compartilhamento de banda.';

  @override
  String get rfCoexProtocolWirelessVideoName => 'Vídeo sem fio';

  @override
  String get rfCoexProtocolWirelessVideoNote =>
      'Hollyland Mars, DJI O3, Teradek Bolt 4K. Largura de banda muito ampla, possíveis conflitos importantes.';

  @override
  String get rfCoexTypeDsssOfdm => 'DSSS/OFDM';

  @override
  String get rfCoexTypeFhss79 => 'FHSS de 79 canais';

  @override
  String get rfCoexTypeFhss40 => 'FHSS de 40 canais';

  @override
  String get rfCoexTypeDsss16 => 'DSSS de 16 canais';

  @override
  String get rfCoexTypeFhssDsss => 'FHSS/DSSS';

  @override
  String get rfCoexTypeFhss => 'FHSS';

  @override
  String get rfCoexTypeOfdm => 'OFDM';

  @override
  String get rfCoexConflictWifiCh6 => 'Wi-Fi Capítulo 6';

  @override
  String get rfCoexConflictMic24 => 'Microfone 2,4 GHz';

  @override
  String get rfCoexConflictBleAdvertising => 'Publicidade BLE';

  @override
  String get rfCoexConflictWifiCh1 => 'Wi-Fi canal 1';

  @override
  String get rfCoexConflictWirelessVideo => 'Vídeo sem fio';

  @override
  String get rfCoexConflictEverythingElse => 'Todo o resto';

  @override
  String get rfCoexConflictZigbeeCh11 => 'Zigbee capítulo 11';

  @override
  String get rfCoexRiskHigh => 'ALUNO';

  @override
  String get rfCoexRiskMedium => 'MÉDIA';

  @override
  String get rfCoexConflictWifiCh6Mic24Desc =>
      'O WiFi ch6 se sobrepõe diretamente às frequências preferidas dos microfones digitais.';

  @override
  String get rfCoexConflictBleWifiCh1Desc =>
      'Os canais BLE 37/38/39 estão em 2.402, 2.426 e 2.480 MHz.';

  @override
  String get rfCoexConflictVideoEverythingDesc =>
      'Os links de vídeo sem fio utilizam ampla largura de banda e saturam facilmente a banda.';

  @override
  String get rfCoexConflictZigbeeWifiCh1Desc =>
      'O canal Zigbee 11 (2.405 MHz) está diretamente na banda do canal 1 do WiFi.';

  @override
  String get rfCoexTipWifiChannels =>
      'Reserve WiFi para os canais 1 e/ou 11. Evite o canal 6 se você tiver microfones de 2,4 GHz.';

  @override
  String get rfCoexTipUhfMics =>
      'Para microfones HF em áreas densas, prefira sistemas UHF (470–694 MHz) a sistemas de 2,4 GHz.';

  @override
  String get rfCoexTipWirelessVideo5Ghz =>
      'Links de vídeo sem fio: use absolutamente a banda de 5 GHz quando possível.';

  @override
  String get rfCoexTipWirelessDmxFhss =>
      'O DMX FHSS sem fio é o mais robusto – ele pula automaticamente as frequências ocupadas.';

  @override
  String get rfCoexTipSpectrumScan =>
      'Faça uma varredura de espectro antes do evento com um aplicativo de RF (WiFi Analyzer, Chanalyzer, etc.).';

  @override
  String get rfPageTitle => 'RF e sem fio';

  @override
  String get rfSectionMicrosHf => 'Microfones e antenas HF';

  @override
  String get rfSectionCalcHf => 'Cálculos de alta frequência';

  @override
  String get rfSectionWifi => 'Wi-fi';

  @override
  String get rfSectionCoexistence => 'Coexistência';

  @override
  String get rfSectionScanTerrain => 'Digitalização e campo';

  @override
  String get rfFreeLabel => 'LIVRE';

  @override
  String get rfToolUhfBandsTitle => 'Bandas UHF/VHF';

  @override
  String get rfToolUhfBandsSubtitle =>
      'Bandas legais França (ANFR), UHF 470–694 MHz, dividendo digital, DECT, ISM 863 MHz.';

  @override
  String get rfToolAntennaTitle => 'Calculadora de Antena';

  @override
  String get rfToolAntennaSubtitle =>
      'Frequência → λ/4, λ/2, 5λ/8. Fator de velocidade para cabos coaxiais. Referências UHF/WiFi.';

  @override
  String get rfToolIm3Title => 'Intermodulação IM3';

  @override
  String get rfToolIm3Subtitle =>
      'Calcula 2Fi − Fj para 2 a 16 frequências. Detecta produtos que caem em seus canais.';

  @override
  String get rfToolWifi24Title => 'Canais Wi-Fi de 2,4 GHz';

  @override
  String get rfToolWifi24Subtitle =>
      '13 canais, sobreposições visuais, simulador de conflitos. Canais não conflitantes 1, 6, 11.';

  @override
  String get rfToolWifi5Title => 'Canais Wi-Fi de 5 GHz';

  @override
  String get rfToolWifi5Subtitle =>
      'Bandas UNII-1/2A/2C, DFS, canais disponíveis em França. Não sobreposto em 80 MHz.';

  @override
  String get rfToolCoexTitle => 'Coexistência de 2,4 GHz';

  @override
  String get rfToolCoexSubtitle =>
      'Quem compartilha a banda: WiFi, Bluetooth, Zigbee, microfones digitais, wireless DMX, vídeo. Conflitos típicos.';

  @override
  String get rfToolScanWifiTitle => 'Verificação de WiFi';

  @override
  String get rfToolScanWifiSubtitle =>
      'Analisa redes WiFi circundantes: canais, RSSI, bandas de 2,4/5 GHz. Visualização da ocupação do espectro.';

  @override
  String get rfToolScanLogTitle => 'Registro de varredura de RF';

  @override
  String get rfToolScanLogSubtitle =>
      'Leitura manual de frequência: nível de sinal, status (livre/limítrofe/ocupado), notas de campo.';

  @override
  String get rfIm3PageTitle => 'Intermodulação IM3';

  @override
  String get rfIm3WhatIs => 'O que é IM3?';

  @override
  String get rfIm3WhatIsBody =>
      'Quando dois transmissores F1 e F2 entram em um amplificador ou receptor, eles geram frequências espúrias em 2F1-F2 e 2F2-F1. Estes produtos de intermodulação de 3ª ordem ficam próximos das frequências originais e podem bloquear um canal HF vizinho.';

  @override
  String get rfIm3QuickMode => 'Modo rápido – 2 frequências';

  @override
  String get rfIm3AdvancedMode => 'Modo avançado – até 16 frequências';

  @override
  String rfIm3FrequencyN(int index) {
    return 'Frequência $index';
  }

  @override
  String get rfIm3AddFrequency => 'Adicione uma frequência';

  @override
  String get rfIm3Tips => 'Aconselhamento de campo';

  @override
  String get rfIm3Tip1 =>
      'Espace suas frequências irregularmente. Lacunas regulares geram IM3s que caem direto nos seus canais.';

  @override
  String get rfIm3Tip2 =>
      'Tolerância de detecção: ±200 kHz. Adapte-se de acordo com a largura de banda dos seus sistemas (normalmente 200–400 kHz).';

  @override
  String get rfIm3Tip3 =>
      'As ferramentas Shure Wireless Workbench, Sennheiser WSM e Audio-Technica Frequency Manager incluem cálculo IM3 para seus intervalos – use-os para implantação final.';

  @override
  String get rfIm3OutOfBand => 'Fora de banda (<0 MHz)';

  @override
  String get rfIm3ConflictOnFreq => '⚠ Cai em uma frequência usada (±200 kHz)';

  @override
  String get rfIm3TableFormula => 'Fórmula';

  @override
  String get rfIm3TableFreqIm3 => 'Frequência IM3';

  @override
  String get rfIm3TableStatus => 'Status';

  @override
  String get rfIm3Footnote =>
      'IM3 = 2×Fi − Fj |    Tolerância a conflitos: ±200 kHz\nProdutos negativos (fora do espectro) são exibidos, mas não conflitantes.';

  @override
  String rfIm3Conflicts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return '$count conflito$_temp0';
  }

  @override
  String get rfScanLogTitle => 'Registro de varredura de RF';

  @override
  String get rfScanLogClearAll => 'Limpar tudo';

  @override
  String get rfScanLogAdd => 'Adicionar';

  @override
  String get rfScanLogClearConfirmTitle => 'Limpar registro?';

  @override
  String get rfScanLogClearConfirmContent =>
      'Todas as entradas serão excluídas.';

  @override
  String get rfScanLogCancel => 'Cancelar';

  @override
  String get rfScanLogDelete => 'Para apagar';

  @override
  String get rfScanLogNewEntry => 'Nova entrada';

  @override
  String get rfScanLogFrequency => 'Freqüência';

  @override
  String get rfScanLogOptionalLevel => 'Nível medido (opcional)';

  @override
  String get rfScanLogNote => 'Observação';

  @override
  String get rfScanLogNoteHint =>
      'ex: canal 36, sala B, interferência de TV...';

  @override
  String get rfScanLogStatusLabel => 'Status :';

  @override
  String get rfScanLogSave => 'Salvar';

  @override
  String get rfScanLogEmptyTitle => 'Diário vazio';

  @override
  String get rfScanLogEmptyBody =>
      'Anote aqui suas medições de campo: frequência, nível medido no analisador, status e comentário.';

  @override
  String get rfScanLogFirstEntry => 'Primeira entrada';

  @override
  String get rfScanLogStatusFree => 'Livre';

  @override
  String get rfScanLogStatusOccupied => 'Ocupado';

  @override
  String get rfScanLogStatusBorderline => 'Limite';

  @override
  String get rfScanLogInstant => 'Agora mesmo';

  @override
  String rfScanLogMinutesAgo(int n) {
    return '$n minutos atrás';
  }

  @override
  String rfScanLogHoursAgo(int n) {
    return '$n horas atrás';
  }

  @override
  String get rfScanLogFreePlural => 'Livre';

  @override
  String get rfScanLogOccupiedPlural => 'Ocupado';

  @override
  String get rfScanLogBorderlinePlural => 'Fronteira.';

  @override
  String get rfScanLogTotal => 'Total';

  @override
  String get rfUhfBandsTitle => 'Bandas UHF/VHF';

  @override
  String get rfUhfBandsOverview => 'Visão geral - França';

  @override
  String get rfUhfBandsTips => 'Dicas para seleção de banda';

  @override
  String get rfUhfBandsSource =>
      'Fonte: ANFR/ARCEP — regulamentação francesa.\nAs regras podem variar de acordo com o país.\nVerifique sempre a conformidade do seu equipamento.';

  @override
  String get rfUhfBand1Name => 'VHF Baixo';

  @override
  String get rfUhfBand1Status => 'Limitado';

  @override
  String get rfUhfBand1Desc =>
      'Antiga banda de TV analógica. Alguns sistemas HF usam esta faixa. Menos comum em eventos ao vivo.';

  @override
  String get rfUhfBand1Examples => 'Alguns sistemas antigos Sennheiser, Shure';

  @override
  String get rfUhfBand2Name => 'UHF — Bloco TV';

  @override
  String get rfUhfBand2Status => 'Pro (autorização)';

  @override
  String get rfUhfBand2Desc =>
      'Principal banda para microfones HF profissionais na França. Partilhada com a TDT. Requer autorização ANFR para uso comercial. Uso livre para produção audiovisual sob condições.';

  @override
  String get rfUhfBand2Examples =>
      'Shure Axient, Sennheiser 2000, Sony DWX, Audio-Technica 3000';

  @override
  String get rfUhfBand3Name => 'Dividendo digital';

  @override
  String get rfUhfBand3Status => 'PROIBIDO';

  @override
  String get rfUhfBand3Desc =>
      'Banda alocada às redes móveis 4G/5G na França desde 2017. Qualquer equipamento de áudio sem fio nesta banda é ilegal desde essa data.';

  @override
  String get rfUhfBand4Name => 'ISM / SRD 863 MHz';

  @override
  String get rfUhfBand4Status => 'Livre (10 mW)';

  @override
  String get rfUhfBand4Desc =>
      'Banda livre na Europa (SRD — Short Range Device). Não requer autorização. Limite de potência: 10 mW ERP, 25 kHz de largura de banda.';

  @override
  String get rfUhfBand4Examples =>
      'Alguns sistemas de entrada, controles remotos';

  @override
  String get rfUhfBand5Name => 'DECT';

  @override
  String get rfUhfBand5Status => 'Livre (250 mW)';

  @override
  String get rfUhfBand5Desc =>
      'Padrão dedicado à voz sem fio. Sem interferências com WiFi/Bluetooth. Usado para sistemas de conferência, intercomunicadores e alguns microfones sem fio.';

  @override
  String get rfUhfBand5Examples =>
      'Bosch CCS-800 Ultro, Sennheiser SpeechLine, Beyerdynamic Quinta';

  @override
  String get rfUhfBand6Name => 'Microfone digital 2.4 GHz';

  @override
  String get rfUhfBand6Status => 'Livre (100 mW)';

  @override
  String get rfUhfBand6Desc =>
      'Banda ISM, livre sem autorização. Sujeita a interferências de WiFi e Bluetooth. Adequada para produções pequenas, evitar salas grandes com WiFi denso.';

  @override
  String get rfUhfBand6Examples =>
      'Shure GLX-D, Line6 XD-V, Sennheiser EW-D (variante 2.4G)';

  @override
  String get rfUhfBand7Name => 'Sem fio 5.8 GHz';

  @override
  String get rfUhfBand7Status => 'Limitado (FR)';

  @override
  String get rfUhfBand7Desc =>
      'Não disponível para WiFi na França, mas alguns sistemas proprietários usam esta faixa. Verificar a conformidade ARCEP de cada equipamento.';

  @override
  String get rfUhfBand7Examples => 'Alguns sistemas IEM de ponta';

  @override
  String get rfUhfOverviewSublabel1 => 'VHF / transitório';

  @override
  String get rfUhfOverviewSublabel2 => 'UHF pro (autorização)';

  @override
  String get rfUhfOverviewSublabel3 => '4G/5G — PROIBIDO';

  @override
  String get rfUhfOverviewSublabel4 => 'ISM livre';

  @override
  String get rfUhfOverviewSublabel5 => 'DECT livre';

  @override
  String get rfUhfOverviewSublabel6 => 'ISM (WiFi + microfones digitais)';

  @override
  String get rfUhfTip1 =>
      '470–694 MHz: ideal para produções profissionais. Ampla escolha de frequências, bom comportamento de RF. Declarar a utilização à ANFR para eventos profissionais.';

  @override
  String get rfUhfTip2 =>
      'Certifique-se de verificar se o seu equipamento está fora da banda de 694–790 MHz. Sistemas antigos e não vendidos pós-2017 são ilegais no palco.';

  @override
  String get rfUhfTip3 =>
      'DECT (1880–1900 MHz) é ideal para sistemas de conferência: banda dedicada, sem interferência WiFi/BT.';

  @override
  String get rfUhfTip4 =>
      'Os sistemas de 2,4 GHz são convenientes, mas sensíveis a ambientes WiFi densos. Evite em grandes salas de conferência.';

  @override
  String get rfLegendPro => 'Pró (autorização)';

  @override
  String get rfLegendFree => 'Livre';

  @override
  String get rfLegendForbidden => 'Proibido';

  @override
  String get rfWifi24PageTitle => 'Wi-Fi de 2,4 GHz';

  @override
  String get rfWifi24SpectrumTitle => 'Espectro de 2,4 GHz – sobreposições';

  @override
  String get rfWifi24SimulateTitle => 'Simular coexistência';

  @override
  String get rfWifi24SelectChannels =>
      'Selecione os canais usados ​​em seu ambiente:';

  @override
  String get rfWifi24ConflictWarning =>
      '⚠️ Sobreposição de canais selecionados — risco de interferência mútua.';

  @override
  String get rfWifi24ChannelTableTitle => 'Tabela de canais';

  @override
  String get rfWifi24BestPractices => 'Melhores práticas';

  @override
  String get rfWifi24LegendNonOverlap => 'Canal não sobreposto';

  @override
  String get rfWifi24LegendOk => 'Selecionado OK';

  @override
  String get rfWifi24LegendConflict => 'Conflito';

  @override
  String get rfWifi24HdrChannel => 'Canal';

  @override
  String get rfWifi24HdrCenter => 'Centro';

  @override
  String get rfWifi24HdrStart => 'Começo';

  @override
  String get rfWifi24HdrEnd => 'FIM';

  @override
  String get rfWifi24Tip1 =>
      'Sempre use os canais 1, 6 e 11 para 3 redes WiFi não sobrepostas.';

  @override
  String get rfWifi24Tip2 =>
      'Com canais de 20 MHz, os canais 1, 5, 9 e 13 também não se sobrepõem.';

  @override
  String get rfWifi24Tip3 =>
      'O WiFi de 2,4 GHz compartilha a banda com microfones digitais Bluetooth, Zigbee e 2,4 GHz.';

  @override
  String get rfWifi24Tip4 =>
      'Em áreas densas, prefira 5 GHz (menos congestionadas) para equipamentos sensíveis.';

  @override
  String get rfWifi5PageTitle => 'Wi-Fi de 5 GHz';

  @override
  String get rfWifi5RegulationTitle => 'Regulamentos franceses (ARCEP)';

  @override
  String get rfWifi5BandsAvailable => 'Bandas disponíveis';

  @override
  String get rfWifi5Unii3Forbidden => 'UNII-3 (5725–5850)';

  @override
  String get rfWifi5ForbiddenLabel => 'Proibido';

  @override
  String get rfWifi5DfsNote =>
      '⚠️ DFS (Seleção Dinâmica de Frequência): Os canais UNII-2A e 2C requerem detecção de radar. O equipamento pode mudar automaticamente de canal caso um radar seja detectado.';

  @override
  String get rfWifi5ChannelWidthsTitle => 'Larguras de canal';

  @override
  String get rfWifi5Bw20 => 'Compatibilidade máxima, fluxo limitado';

  @override
  String get rfWifi5Bw40 => '2 canais vinculados — 802.11n';

  @override
  String get rfWifi5Bw80 => '4 canais vinculados — 802.11ac/ax';

  @override
  String get rfWifi5Bw160 => '8 canais vinculados — somente 802.11ax';

  @override
  String get rfWifi5NonOverlapTitle =>
      'Canais não sobrepostos em 80 MHz (França)';

  @override
  String get rfWifi5NonOverlapFor3 =>
      'Para 3 redes não sobrepostas de 80 MHz (França):';

  @override
  String get rfWifi5MaxNetworks =>
      '→ Até 6 redes de 80 MHz disponíveis somente no UNII-2C.';

  @override
  String get rfWifi5ChannelsMhz => 'Canais (20 MHz)';

  @override
  String get rfWifi5ForbiddenFR => 'Proibido FR';

  @override
  String get rfWifi5Indoor => 'Interior';

  @override
  String get rfWifiScanTitle => 'Verificação de WiFi';

  @override
  String get rfWifiScanPlatformInfo =>
      'Verificação ativa no Android (é necessária permissão de localização). No iOS, apenas a rede conectada fica visível.';

  @override
  String get rfWifiScanStart => 'Inicie a verificação';

  @override
  String get rfWifiScanInProgress => 'Verificação em andamento…';

  @override
  String get rfWifiScanGroupedTooltip => 'Visualização de lista';

  @override
  String get rfWifiScanFlatTooltip => 'Visualização de grupo';

  @override
  String get rfWifiScanNoResults =>
      'Inicie a varredura para ver as redes vizinhas.';

  @override
  String get rfWifiScanOccupation => 'Ocupação do canal de 2,4 GHz';

  @override
  String get rfWifiScanNonOverlapNote =>
      'Canais em negrito (1, 6, 11) = não sobrepostos';

  @override
  String get rfWifiScanHidden => '(rede oculta)';

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
  String get rfWifiScanSub5 => '5 GHz';

  @override
  String get rfWifiScanSubTotal => 'redes';

  @override
  String get rfWifiRssiExcellent => 'Excelente';

  @override
  String get rfWifiRssiBon => 'Bom';

  @override
  String get rfWifiRssiMoyen => 'MÉDIA';

  @override
  String get rfWifiRssiFaible => 'Fraco';

  @override
  String get audioLevelInputDbu => 'Valor em dBu';

  @override
  String get audioLevelInputDbv => 'Valor em dBV';

  @override
  String get audioLevelInputVrms => 'Tensão eficaz';

  @override
  String get audioLevelDbfsNote =>
      '* dBFS relativo a +24 dBu = 0 dBFS (valor típico — varia de acordo com o sistema)';

  @override
  String get audioGainStagingTip1 =>
      'Procure +4 dBu nominal em cada estágio. Mantenha ~18 dB de headroom antes do clipe.';

  @override
  String get audioGainStagingTip2 =>
      'A diferença consumidor/profissional (+4 dBu vs -10 dBV) é de aproximadamente 11,8 dB — compensa o ganho em cada interface.';

  @override
  String get audioGainStagingTip3 =>
      'Linha balanceada (XLR): +4 dBu. Linha não balanceada (tomada TS): −10 dBV. Caixa DI para adaptação de impedância e nível.';

  @override
  String get audioGainStagingTip4 =>
      'dBu = dB referente a 0,775 V (600 Ω). dBV = dB relativo a 1 V. dBV = dBu − 2,218.';

  @override
  String get audioDiffTipEqual =>
      'Fontes quase iguais: ganho de ~+3 dB no mais forte.';

  @override
  String audioDiffTipSmall(String diff) {
    return 'Diferença em $diff dB: o menor contribui pouco.';
  }

  @override
  String audioDiffTipMedium(String diff, String gain) {
    return 'Diferença de $diff dB: ganho limitado a ~$gain dB na fonte dominante.';
  }

  @override
  String get audioDiffTipLarge =>
      'Diferença > 10 dB: a fonte fraca é insignificante. Ganho ≈ +0 dB.';

  @override
  String get audioIncoherentShortLabel => 'Incoh. :';

  @override
  String get audioCoherentShortLabel => 'Coer. :';

  @override
  String audioAtDistance(String dist) {
    return 'Às ${dist}m';
  }

  @override
  String get rfWifiScanErrLocationRequired =>
      'Permissão de localização necessária para verificação de WiFi.';

  @override
  String get rfWifiScanErrLocationDenied =>
      'Permissão de localização negada. Ative-o nas configurações.';

  @override
  String get rfWifiScanErrLocationDisabled =>
      'Serviço de localização desativado. Habilite-o no dispositivo.';

  @override
  String get rfWifiScanErrNotSupported =>
      'WiFi Scan não é compatível com este dispositivo ou versão do sistema operacional.';

  @override
  String get rfWifiScanErrFailed => 'Não foi possível iniciar a digitalização.';

  @override
  String get rfWifiScanErrDefault =>
      'Não é possível digitalizar neste dispositivo.';

  @override
  String get rfWifiScanErrReadResults =>
      'Não é possível ler os resultados da verificação.';

  @override
  String rfWifiScanErrGeneric(String error) {
    return 'Erro durante a verificação: $error';
  }

  @override
  String get homeNetworkTitle => 'Rede';

  @override
  String get homeNetworkSubtitle =>
      'Verificação de rede local, Art-Net, sACN / E1.31.';

  @override
  String get networkPageTitle => 'Rede';

  @override
  String get networkScanCardTitle => 'Verificação de rede';

  @override
  String get networkScanCardSubtitle =>
      'Detecte dispositivos ativos na rede local.';

  @override
  String get networkArtNetCardTitle => 'Visualizador Art-Net';

  @override
  String get networkArtNetAddressingTitle => 'Endereçamento Art-Net';

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
      'Insira valores válidos para ver o resultado.';

  @override
  String get networkArtNetFormulaNote =>
      'Port-Address (15 bits) = (Net << 8) | (Sub-Net << 4) | Universe — Net 0-127, Sub-Net 0-15, Universe 0-15, Port-Address 0-32767 (especificação Art-Net 4).';

  @override
  String get networkArtNetCardSubtitle =>
      'Ouvindo e analisando pacotes ArtDMX em tempo real.';

  @override
  String get networkSacnCardTitle => 'Visualizador sACN / E1.31';

  @override
  String get networkSacnCardSubtitle =>
      'Ouvir e analisar pacotes sACN / E1.31 em tempo real.';

  @override
  String get networkComingSoon => 'Futuro';

  @override
  String get networkFutureLuminex => 'Monitoramento Luminex';

  @override
  String get networkFutureMaNet => 'Detecção de MA-Net';

  @override
  String get networkFutureAlarms => 'Alarmes de rede';

  @override
  String get networkFutureSnapshots => 'Instantâneos de rede';

  @override
  String get networkFutureExport => 'Exportar PDF/CSV';

  @override
  String get networkScanTitle => 'Verificação de rede';

  @override
  String get networkPoeTitle => 'Calculadora PoE';

  @override
  String get networkFiberTitle => 'Orçamento de Enlace de Fibra';

  @override
  String get networkSubnetTitle => 'Calculadora de Sub-rede';

  @override
  String get networkSubnetIpLabel => 'Endereço IP';

  @override
  String get networkSubnetPrefixLabel => 'Prefixo (CIDR)';

  @override
  String get networkSubnetNetworkLabel => 'Endereço de rede';

  @override
  String get networkSubnetBroadcastLabel => 'Endereço de broadcast';

  @override
  String get networkSubnetNetmaskLabel => 'Máscara de sub-rede';

  @override
  String get networkSubnetWildcardLabel => 'Máscara curinga (wildcard)';

  @override
  String get networkSubnetFirstHostLabel => 'Primeiro IP utilizável';

  @override
  String get networkSubnetLastHostLabel => 'Último IP utilizável';

  @override
  String get networkSubnetHostCountLabel => 'Hosts utilizáveis';

  @override
  String get networkSubnetInvalidIp =>
      'Endereço IP inválido (formato esperado: 192.168.1.0)';

  @override
  String get networkSubnetDivideTitle => 'Dividir em sub-redes iguais';

  @override
  String get networkSubnetDivideNote =>
      'Escolha em quantas sub-redes dividir esta rede.';

  @override
  String get networkFiberTypeLabel => 'Tipo de fibra';

  @override
  String get networkFiberDistanceLabel => 'Distância';

  @override
  String get networkFiberAttenuationLabel => 'Atenuação (por km)';

  @override
  String get networkFiberAdditionalLossLabel =>
      'Perdas de conectores e emendas';

  @override
  String get networkFiberBudgetLabel => 'Orçamento do transceptor (opcional)';

  @override
  String get networkFiberTotalTitle => 'Perda total do enlace';

  @override
  String get networkFiberMarginLabel => 'Margem restante';

  @override
  String get networkFiberWarningOver =>
      'Margem excedida: o enlace pode não funcionar corretamente nessa distância.';

  @override
  String get networkFiberFormulaNote =>
      'Perda total = atenuação × distância + perdas de conectores/emendas';

  @override
  String get networkPoeBudgetLabel => 'Orçamento do injetor / switch';

  @override
  String get networkPoeDeviceLabel => 'Dispositivo';

  @override
  String get networkPoeClassLabel => 'Classe PoE';

  @override
  String get networkPoeClassManual => 'Manual (valor livre)';

  @override
  String get networkPoeClassWord => 'Classe';

  @override
  String get networkPoeDevicePowerLabel => 'Potência';

  @override
  String get networkPoeAddDevice => 'Adicionar um dispositivo';

  @override
  String get networkPoeTotalTitle => 'Consumo total';

  @override
  String get networkPoeRemainingLabel => 'Orçamento restante';

  @override
  String get networkPoeEmptyState =>
      'Adicione pelo menos um dispositivo para calcular.';

  @override
  String get networkPoeWarningOver =>
      'Orçamento excedido: remova dispositivos ou use um switch/injetor mais potente.';

  @override
  String get networkPoeFormulaNote =>
      'Consumo total = soma dos dispositivos. Mantenha uma margem de cerca de 10-20% abaixo do orçamento total.';

  @override
  String get networkScanStartButton => 'Inicie a verificação';

  @override
  String get networkScanStopButton => 'Pare de digitalizar';

  @override
  String get networkScanScanning => 'Verificação em andamento…';

  @override
  String networkScanProgress(int done, int total) {
    return '$done / $total IPs verificados';
  }

  @override
  String networkScanDevicesFound(int count) {
    return '$count dispositivos encontrados';
  }

  @override
  String get networkScanNoDevicesFound =>
      'Nenhum dispositivo encontrado nesta rede.';

  @override
  String get networkScanNoNetwork =>
      'Nenhuma rede local (Wi-Fi) detectada. Conecte-se a uma rede.';

  @override
  String get networkScanIosLimitation =>
      'No iOS, os endereços MAC e o fabricante não são acessíveis por aplicativos (restrição da Apple).';

  @override
  String get networkScanLocalIp => 'IP local';

  @override
  String get networkScanSubnet => 'Máscara';

  @override
  String get networkScanStatusOnline => 'On-line';

  @override
  String networkScanResponseMs(int ms) {
    return '$ms ms';
  }

  @override
  String get networkScanPermissionDenied =>
      'Permissão de rede negada. Verifique as permissões.';

  @override
  String get networkScanErrorGeneric => 'Erro de rede. Verifique sua conexão.';

  @override
  String get networkScanHint =>
      'Toque em “Iniciar verificação” para detectar dispositivos.';

  @override
  String get artnetTitle => 'Visualizador Art-Net';

  @override
  String get artnetStartButton => 'Comece a ouvir';

  @override
  String get artnetStopButton => 'Parar';

  @override
  String get artnetListening => 'Ouvindo – Porta 6454';

  @override
  String get artnetNotListening => 'Inativo';

  @override
  String get artnetNoPackets => 'Aguardando pacotes Art-Net…';

  @override
  String get artnetUniversesTitle => 'Universo recebido';

  @override
  String artnetUniverseTitle(int universe) {
    return 'Universo $universe';
  }

  @override
  String artnetSourceIp(Object ip) {
    return 'Fonte: $ip';
  }

  @override
  String artnetPackets(int count) {
    return '$count pacotes';
  }

  @override
  String artnetFps(Object fps) {
    return '${fps}fps';
  }

  @override
  String get artnetShowActiveOnly => 'Somente canais ativos';

  @override
  String artnetActiveCount(int count) {
    return '$count canais ativos';
  }

  @override
  String get artnetPlatformInfo =>
      'Art-Net — Porta UDP 6454. Deve estar na mesma rede que a origem.';

  @override
  String get artnetErrorBind =>
      'Não foi possível abrir o soquete UDP. Verifique as permissões de rede.';

  @override
  String get sacnTitle => 'Visualizador sACN';

  @override
  String get sacnStartButton => 'Comece a ouvir';

  @override
  String get sacnStopButton => 'Parar';

  @override
  String get sacnListening => 'Ouvindo – Porta 5568';

  @override
  String get sacnNotListening => 'Inativo';

  @override
  String get sacnNoPackets => 'Esperando por pacotes sACN…';

  @override
  String get sacnUniversesTitle => 'Universo recebido';

  @override
  String sacnUniverseTitle(int universe) {
    return 'Universo $universe';
  }

  @override
  String sacnSource(Object name) {
    return 'Fonte: $name';
  }

  @override
  String sacnPriority(int value) {
    return 'Prioridade: $value';
  }

  @override
  String sacnCid(Object cid) {
    return 'CID: $cid';
  }

  @override
  String sacnPackets(int count) {
    return '$count pacotes';
  }

  @override
  String sacnFps(Object fps) {
    return '${fps}fps';
  }

  @override
  String get sacnShowActiveOnly => 'Somente canais ativos';

  @override
  String sacnActiveCount(int count) {
    return '$count canais ativos';
  }

  @override
  String get sacnPlatformInfo =>
      'sACN / E1.31 — Porta UDP 5568. Multicast 239.255.x.x e unicast suportado.';

  @override
  String get sacnErrorBind =>
      'Não foi possível abrir o soquete UDP. Verifique as permissões de rede.';

  @override
  String get sacnIosMulticastNote =>
      'No iOS 14+, o multicast sACN pode exigir permissão de acesso à rede local.';

  @override
  String get diagCardTitle => 'Diagnóstico de rede';

  @override
  String get diagCardSubtitle => 'Análise automática de rede, Art-Net e sACN.';

  @override
  String get diagPageTitle => 'Diagnóstico de rede';

  @override
  String get diagPlatformInfo =>
      'Execute uma verificação de rede + ouça Art-Net/sACN por alguns segundos e, em seguida, verifique possíveis problemas.';

  @override
  String get diagAnalyseButton => 'Analisar';

  @override
  String get diagCancelButton => 'Cancelar';

  @override
  String get diagClearButton => 'Para apagar';

  @override
  String get diagSnapshotButton => 'Instantâneo';

  @override
  String get diagScoreLabel => 'Pontuação de integridade da rede';

  @override
  String get diagStatusOk => 'Rede OK';

  @override
  String get diagStatusWarning => 'Atenção';

  @override
  String get diagStatusCritical => 'Crítico';

  @override
  String diagAnalysisDate(Object date) {
    return 'Analisado em $date';
  }

  @override
  String get diagSeverityInfo => 'Informação';

  @override
  String get diagSeverityWarning => 'Aviso';

  @override
  String get diagSeverityCritical => 'Crítico';

  @override
  String get diagScanningNetwork => 'Verificação de rede em andamento...';

  @override
  String get diagCollectingFlux => 'Coleção de fluxos Art-Net / sACN…';

  @override
  String get diagAnalyzing => 'Análise em andamento…';

  @override
  String diagScanProgress(int done, int total) {
    return '$done / $total IPs verificados';
  }

  @override
  String get diagNoResultYet =>
      'Pressione “Scan” para iniciar o diagnóstico da rede.';

  @override
  String get diagAlertsTitle => 'Alertas';

  @override
  String get diagNoAlerts => 'Nenhum alerta detectado – rede íntegra.';

  @override
  String get diagSnapshotSaved => 'Instantâneo salvo.';

  @override
  String get diagNoLocalIp =>
      'Nenhum endereço IP local detectado ou endereço inválido.';

  @override
  String get diagNoDevices => 'Nenhum dispositivo detectado na rede.';

  @override
  String get diagNoArtNet => 'Nenhuma transmissão de Art-Net foi recebida.';

  @override
  String get diagNoSacn => 'Nenhum fluxo sACN/E1.31 recebido.';

  @override
  String diagDuplicateIp(Object ip) {
    return 'Endereço IP duplicado detectado: $ip.';
  }

  @override
  String diagArtNetLowFps(int universe, Object fps) {
    return 'Art-Net Universo $universe: FPS baixo ($fps fps).';
  }

  @override
  String diagSacnLowFps(int universe, Object fps) {
    return 'sACN Universo $universe: FPS baixo ($fps fps).';
  }

  @override
  String diagZeroDmxChannels(Object protocol, int universe) {
    return '$protocol Universo $universe: fluxo ativo mas todos os canais DMX estão em zero.';
  }

  @override
  String diagManyUnknownDevices(int count) {
    return '$count dispositivos sem nome detectados na rede.';
  }

  @override
  String get ndiCardTitle => 'Descoberta NDI';

  @override
  String get ndiCardSubtitle => 'Fontes NDI / NewTek na rede via mDNS.';

  @override
  String get ndiPageTitle => 'Descoberta NDI';

  @override
  String get ndiStartButton => 'Para começar';

  @override
  String get ndiStopButton => 'Parar';

  @override
  String get ndiDiscovering => 'Pesquisa em andamento…';

  @override
  String get ndiHint => 'Pressione “Iniciar” para procurar fontes NDI na rede.';

  @override
  String get ndiNoSources => 'Nenhuma fonte NDI detectada nesta rede.';

  @override
  String get ndiIosNote =>
      'No iOS, a descoberta de mDNS pode ser limitada dependendo da configuração da rede.';

  @override
  String ndiSourcesFound(int count) {
    return '$count fonte(s) NDI encontrada(s)';
  }

  @override
  String get ndiLabelName => 'Fonte';

  @override
  String get ndiLabelHost => 'Máquina';

  @override
  String get ndiLabelIp => 'PI';

  @override
  String get ndiLabelPort => 'Porta';

  @override
  String get ndiLabelService => 'Serviço';

  @override
  String get snapshotCardTitle => 'Instantâneos de rede';

  @override
  String get snapshotCardSubtitle =>
      'Registre e compare o status da rede em momentos diferentes.';

  @override
  String get snapshotPageTitle => 'Instantâneos de rede';

  @override
  String get snapshotEmpty => 'Nenhum instantâneo salvo.';

  @override
  String get snapshotDeleteConfirm => 'Excluir este instantâneo?';

  @override
  String get snapshotDeleteButton => 'EXCLUIR';

  @override
  String get snapshotCompareButton => 'Comparar';

  @override
  String get snapshotComparisonTitle => 'Comparação';

  @override
  String get snapshotComparisonSelectTwo =>
      'Selecione dois instantâneos para comparar.';

  @override
  String get snapshotSnapshotA => 'Instantâneo A';

  @override
  String get snapshotSnapshotB => 'Instantâneo B';

  @override
  String get snapshotDevices => 'Dispositivos';

  @override
  String get snapshotArtnetUniverses => 'Universo Art-Net';

  @override
  String get snapshotSacnUniverses => 'Universo sACN';

  @override
  String get snapshotNdiSources => 'Fontes NDI';

  @override
  String get snapshotAlerts => 'Alertas';

  @override
  String get snapshotAdded => 'Apareceu';

  @override
  String get snapshotRemoved => 'Desaparecido';

  @override
  String get snapshotNoChanges =>
      'Nenhuma diferença entre os dois instantâneos.';

  @override
  String get snapshotNoScore => 'Pontuação não disponível';

  @override
  String get subscriptionCategoryNetworkTitle => 'Rede Pró';

  @override
  String get subscriptionCategoryNetworkDescription =>
      'Ferramentas de rede avançadas: Art-Net, sACN, NDI, diagnósticos e instantâneos.';

  @override
  String get subscriptionHeadlineNetworkSubtitle =>
      'Desbloqueia visualizador Art-Net, visualizador sACN, NDI, diagnósticos de rede e instantâneos.';

  @override
  String get networkPremiumLabel => 'PREMIUM';

  @override
  String get networkPremiumUnlockButton => 'Desbloquear';

  @override
  String get networkPremiumBannerText =>
      'Art-Net, sACN, NDI, diagnósticos e instantâneos exigem uma assinatura Pro Network.';

  @override
  String get subscriptionCategoryNetworkShort => 'REDE';

  @override
  String get dashboardPageTitle => 'Painel de rede';

  @override
  String get dashboardCardTitle => 'Painel de rede';

  @override
  String get dashboardCardSubtitle => 'Visualização da rede em tempo real';

  @override
  String get dashboardStatusIdle => 'Em espera';

  @override
  String get dashboardStatusScanning => 'Verificação em andamento…';

  @override
  String get dashboardStatusCompleted => 'Verificação concluída';

  @override
  String get dashboardStatusError => 'Erro de rede';

  @override
  String get dashboardStatusListening => 'Escuta ativa';

  @override
  String get dashboardKpiDevices => 'Dispositivos';

  @override
  String get dashboardKpiArtnet => '__TECNOLOGIA_1__';

  @override
  String get dashboardKpiSacn => '__TECNOLOGIA_2__';

  @override
  String get dashboardKpiNdi => '__TECNOLOGIA_9__';

  @override
  String get dashboardKpiScore => 'Pontuação';

  @override
  String get dashboardNoScore => '–';

  @override
  String get dashboardSectionAlerts => 'Alertas ativos';

  @override
  String get dashboardNoAlerts => 'Nenhum alerta ativo';

  @override
  String get dashboardSectionSnapshot => 'Último instantâneo';

  @override
  String get dashboardNoSnapshot => 'Nenhum instantâneo salvo';

  @override
  String get dashboardSectionQuickAccess => 'Acesso rápido';

  @override
  String get dashboardRescanButton => 'Digitalizar novamente';

  @override
  String get dashboardNdiRefreshButton => 'Atualizar NDI';

  @override
  String get dashboardArtnetActive => 'Art-Net ativo';

  @override
  String get dashboardSacnActive => 'sACN ativo';

  @override
  String get dashboardNdiScanning => 'Descoberta NDI…';

  @override
  String dashboardAlertNewDevice(Object ip) {
    return 'Novo dispositivo: $ip';
  }

  @override
  String dashboardAlertLostDevice(Object ip) {
    return 'Dispositivo ausente: $ip';
  }

  @override
  String dashboardAlertNewArtnetUniverse(int universe) {
    return 'Novo universo Art-Net: $universe';
  }

  @override
  String dashboardAlertLostArtnetUniverse(int universe) {
    return 'Universo Art-Net desapareceu: $universe';
  }

  @override
  String dashboardAlertNewSacnUniverse(int universe) {
    return 'Novo universo sACN: $universe';
  }

  @override
  String dashboardAlertLostSacnUniverse(int universe) {
    return 'Universo sACN desapareceu: $universe';
  }

  @override
  String dashboardAlertNewNdiSource(Object name) {
    return 'Nova fonte NDI: $name';
  }

  @override
  String dashboardAlertLostNdiSource(Object name) {
    return 'Fonte NDI desapareceu: $name';
  }

  @override
  String dashboardAlertArtnetLowFps(int universe, Object fps) {
    return 'Art-Net U$universe: FPS baixo ($fps)';
  }

  @override
  String dashboardAlertSacnLowFps(int universe, Object fps) {
    return 'sACN U$universe: FPS baixo ($fps)';
  }

  @override
  String dashboardAlertSacnDuplicate(int universe, int count) {
    return 'sACN U$universe: $count fontes ativas';
  }

  @override
  String dashboardAlertSacnPriority(int universe) {
    return 'sACN U$universe: conflito de prioridade';
  }

  @override
  String dashboardScanProgress(int progress) {
    return 'Verificação de rede: $progress%';
  }

  @override
  String get luminexPageTitle => 'Luminex Monitor';

  @override
  String get luminexMonitorCardTitle => 'Luminex Monitor';

  @override
  String get luminexMonitorCardSubtitle => 'Chaves de monitoramento GigaCore';

  @override
  String get luminexAddDevice => 'Adicionar equipamento';

  @override
  String get luminexAddDeviceTitle => 'Endereço IP do switch';

  @override
  String get luminexAddDeviceHint => '192.168.x.x';

  @override
  String get luminexAddDeviceConfirm => 'Adicionar';

  @override
  String get luminexAddDeviceCancel => 'Cancelar';

  @override
  String get luminexNoDevices => 'Sem interruptor Luminex';

  @override
  String get luminexNoDevicesHint =>
      'Adicione um IP manualmente ou execute uma verificação de rede.';

  @override
  String get luminexRefreshAll => 'Atualizar tudo';

  @override
  String get luminexRemoveDevice => 'Retirar';

  @override
  String get luminexScanForDevices => 'Pesquise na rede';

  @override
  String get luminexReachable => 'Acessível';

  @override
  String get luminexUnreachable => 'Inacessível';

  @override
  String get luminexPolling => 'Pergunta…';

  @override
  String get luminexNoAlarms => 'Sem alarme';

  @override
  String get luminexSectionSystem => 'Informações do sistema';

  @override
  String get luminexSectionPorts => 'Portas';

  @override
  String get luminexSectionAlarms => 'Alarmes ativos';

  @override
  String get luminexLabelName => 'Nome';

  @override
  String get luminexLabelModel => 'Modelo';

  @override
  String get luminexLabelFirmware => 'Firmware';

  @override
  String get luminexLabelUptime => 'Tempo de atividade';

  @override
  String get luminexLabelTemperature => 'Temperatura';

  @override
  String get luminexLabelPsu => 'Comida';

  @override
  String get luminexPsuOk => 'OK';

  @override
  String get luminexPsuAbsent => 'Ausente';

  @override
  String get luminexLabelApi => 'API';

  @override
  String get luminexGen1 => 'Geração 1 (texto)';

  @override
  String get luminexGen2 => 'Geração 2 (JSON)';

  @override
  String get luminexGenUnknown => 'Desconhecido';

  @override
  String get luminexPortUp => 'Ativo';

  @override
  String get luminexPortDown => 'Inativo';

  @override
  String get luminexPortUnknown => 'Desconhecido';

  @override
  String get luminexPortPoeActive => 'PoE ativo';

  @override
  String get luminexPortPoeFault => 'PoE padrão';

  @override
  String get luminexPortPoeOff => 'PoE inativo';

  @override
  String get luminexPortNoPoe => 'Sem PoE';

  @override
  String get luminexDetectedScan => 'Verificação de rede';

  @override
  String get luminexDetectedManual => 'Adição manual';

  @override
  String get luminexNotAvailable => 'N / D';

  @override
  String get luminexAlarmInaccessible => 'Interruptor inacessível';

  @override
  String get luminexAlarmPsuAbsent => 'Sem fonte de alimentação';

  @override
  String luminexAlarmCount(int count) {
    return '$count alarme(s) ativo(s)';
  }

  @override
  String luminexPortSpeed(int speed) {
    return '${speed}Mbps';
  }

  @override
  String luminexPortRxErrors(int count) {
    return 'RX: $count errado.';
  }

  @override
  String luminexPortTxErrors(int count) {
    return 'TX: $count errado.';
  }

  @override
  String luminexAlarmPortDown(int port) {
    return 'Porta $port off-line';
  }

  @override
  String luminexAlarmSpeedDegraded(int port, int speed) {
    return 'Porta $port: velocidade degradada ($speed Mb/s)';
  }

  @override
  String luminexAlarmHighRxErrors(int port, int count) {
    return 'Porta $port: Erros altos de RX ($count)';
  }

  @override
  String luminexAlarmHighTxErrors(int port, int count) {
    return 'Porta $port: erros de TX altos ($count)';
  }

  @override
  String luminexAlarmPoeFault(int port) {
    return 'Porta $port: padrão PoE';
  }

  @override
  String luminexAlarmHighTemp(Object temp) {
    return 'Alta temperatura: $temp°C';
  }

  @override
  String get manetPageTitle => 'MA-Net Monitorar';

  @override
  String get manetMonitorCardTitle => 'MA-Net Monitorar';

  @override
  String get manetMonitorCardSubtitle => 'Detecção de nó grandMA2/3';

  @override
  String get manetNoNodes => 'Nenhum nó MA-Net detectado';

  @override
  String get manetListening => 'Escuta em andamento...';

  @override
  String get manetNodeType => 'Tipo';

  @override
  String get manetFirmware => 'Firmware';

  @override
  String get manetMac => 'Endereço MAC';

  @override
  String get manetLastSeen => 'Visto que há';

  @override
  String get manetProtocol => '__TECNOLOGIA_3__';

  @override
  String get manetProtocolMaNet2 => 'MA-Net2';

  @override
  String get manetProtocolMaNet3 => '__TECNOLOGIA_3__3';

  @override
  String get manetEmptyHint =>
      'Certifique-se de estar na mesma rede que o equipamento MA Lighting';

  @override
  String manetNodeCount(int count) {
    return '$count nó(s) on-line';
  }

  @override
  String manetPortListening(int port) {
    return 'UDP:$port';
  }

  @override
  String get helpPageTitle => 'Guia de ferramentas de rede';

  @override
  String get helpIntro =>
      'Todas as ferramentas funcionam somente leitura em sua rede local. Toque em uma ferramenta para visualizar os detalhes.';

  @override
  String get helpSectionDoes => 'O que isso faz';

  @override
  String get helpSectionDelay => 'Limite de tempo';

  @override
  String get helpSectionLimits => 'O que isso não faz';

  @override
  String get helpSectionTip => 'Conselho';

  @override
  String get helpGeneralTitle => 'Conselhos gerais';

  @override
  String get helpGeneralSubnet =>
      'Todas as ferramentas operam na sub-rede local /24. Equipamentos em uma VLAN diferente ou atrás de um roteador não serão detectados.';

  @override
  String get helpGeneralFirewall =>
      'Firewalls de software podem bloquear algumas investigações. Em caso de falta de equipamentos, verifique as regras de filtragem.';

  @override
  String get helpGeneralWifi =>
      'Redes WiFi com isolamento de cliente bloqueiam a descoberta. Prefira uma conexão com fio ou WiFi em modo bridge.';

  @override
  String get helpToolScanDoes =>
      'Verifica a sub-rede /24 em paralelo e identifica dispositivos ativos. Mostra IP atual, nome de host, fabricante (via OUI MAC) e portas abertas.';

  @override
  String get helpToolScanDelay =>
      '15 a 30 segundos dependendo do tamanho da rede. 50 sondas simultâneas.';

  @override
  String get helpToolScanLimits =>
      'Não atravessa VLANs ou roteadores. Não executa varredura completa de portas ou varredura WAN.';

  @override
  String get helpToolScanTip =>
      'Se os dispositivos não aparecerem, verifique se o seu firewall não está bloqueando as sondagens TCP/ICMP de entrada.';

  @override
  String get helpToolDashboardDoes =>
      'Exibe o status dos equipamentos detectados em tempo real: disponibilidade, latência, alertas de rede ativa.';

  @override
  String get helpToolDashboardDelay =>
      'Atualizado a cada 30 segundos. Primeiro carregamento imediato após a digitalização.';

  @override
  String get helpToolDashboardLimits =>
      'Não retém histórico entre sessões. Requer uma varredura prévia para preencher a lista de equipamentos.';

  @override
  String get helpToolDashboardTip =>
      'Execute uma verificação de rede antes de abrir o painel para ver todos os equipamentos disponíveis.';

  @override
  String get helpToolArtNetDoes =>
      'Escuta passivamente pacotes Art-Net (UDP 6454) e exibe universos DMX ativos com seus valores em tempo real.';

  @override
  String get helpToolArtNetDelay =>
      'Tempo real — os dados aparecem em menos de um segundo após o recebimento do pacote.';

  @override
  String get helpToolArtNetLimits =>
      'Nenhuma saída DMX. Não configura nós Art-Net e não gerencia o protocolo RDM.';

  @override
  String get helpToolArtNetTip =>
      'Art-Net não atravessa roteadores. Todos os equipamentos devem estar na mesma rede L2 (mesmo switch ou mesmo segmento).';

  @override
  String get helpToolSacnDoes =>
      'Escuta fluxos multicast sACN/E1.31 (UDP 5568) e exibe universos ativos, prioridades de origem e valores DMX.';

  @override
  String get helpToolSacnDelay =>
      'Tempo real — latência inferior a um segundo.';

  @override
  String get helpToolSacnLimits =>
      'Nenhuma saída DMX. Não modifica as prioridades ou configuração das fontes sACN.';

  @override
  String get helpToolSacnTip =>
      'O multicast sACN requer um switch gerenciado com espionagem IGMP habilitada para evitar tempestades de transmissão na rede.';

  @override
  String get helpToolNdiDoes =>
      'Descobre fontes de vídeo NDI na LAN por meio do protocolo de descoberta NDI. Mostra o nome, endereço IP e tipo de cada fonte.';

  @override
  String get helpToolNdiDelay =>
      'As fontes aparecem entre 5 e 15 segundos após a conexão à rede.';

  @override
  String get helpToolNdiLimits =>
      'Sem reprodução de vídeo ou roteamento NDI. Não detecta fontes NDI|HX sem descoberta de mDNS ativa.';

  @override
  String get helpToolNdiTip =>
      'NDI requer no mínimo 100 Mb/s por stream. Evite WiFi para produção – prefira uma conexão Gigabit com fio.';

  @override
  String get helpToolDiagDoes =>
      'Executa uma série de testes de integridade da rede: conectividade, resolução de DNS, latência, perda de pacotes e disponibilidade de serviço.';

  @override
  String get helpToolDiagDelay => 'Diagnóstico completo em 20 a 30 segundos.';

  @override
  String get helpToolDiagLimits =>
      'Apenas diagnóstico – sem reparos automáticos, sem alterações de configuração.';

  @override
  String get helpToolDiagTip =>
      'Execute um diagnóstico antes e depois de uma intervenção na rede para comparar o status e isolar rapidamente as regressões.';

  @override
  String get helpToolSnapshotDoes =>
      'Captura o estado da rede em um determinado momento (equipamentos, serviços) e permite comparar dois instantâneos para identificar alterações.';

  @override
  String get helpToolSnapshotDelay =>
      'Capture em 30 a 45 segundos dependendo do tamanho da rede.';

  @override
  String get helpToolSnapshotLimits =>
      'Sem monitoramento contínuo ou alertas automáticos. O histórico é mantido apenas neste dispositivo.';

  @override
  String get helpToolSnapshotTip =>
      'Ideal para documentar o estado antes/depois de uma alteração na infraestrutura ou para isolar uma regressão durante a solução de problemas.';

  @override
  String get helpToolLuminexDoes =>
      'Consultas GigaCore Luminex alternam por meio de sua API HTTP. Exibe o status da porta (link, velocidade, PoE, erros), temperatura, fontes de alimentação e aciona alarmes.';

  @override
  String get helpToolLuminexDelay =>
      'Enquete a cada 30 segundos. Descoberta automática na sub-rede: 15 a 30 segundos.';

  @override
  String get helpToolLuminexLimits =>
      'Somente leitura. Nenhuma alteração na configuração de VLAN, grupo ou porta. Não suporta vídeo MA-Net ou NDI.';

  @override
  String get helpToolLuminexTip =>
      'Autenticação padrão: admin/senha vazia. Gen2s expõem /api/v1/, Gen1s respondem em /stat/ports em texto simples.';

  @override
  String get helpToolManetDoes =>
      'Escuta passivamente a porta UDP 6549 e detecta grandMA2/3 consoles e nós se anunciando na rede. Exibe nome, tipo de dispositivo, versão de firmware e endereço MAC.';

  @override
  String get helpToolManetDelay =>
      'Os dispositivos aparecem assim que sua próxima transmissão na rede, geralmente em menos de 10 segundos.';

  @override
  String get helpToolManetLimits =>
      'Somente leitura. Sem dados de exibição, sem valor DMX, sem configuração. Não cruza VLANs.';

  @override
  String get helpToolManetTip =>
      'Se nenhum dispositivo aparecer: verifique se o transmissor grandMA está na LAN e se a porta UDP 6549 não está bloqueada por um firewall.';

  @override
  String get bwCardTitle => 'Largura de banda';

  @override
  String get bwCardSubtitle => 'Broadcast + switch SNMP';

  @override
  String get bwHubTitle => 'Largura de banda';

  @override
  String get bwHubSubtitle =>
      'Opção 1 — apenas tráfego broadcast (sem equipamento). Opção 2 — largura de banda real por porta via SNMP (switch gerenciado necessário).';

  @override
  String get bwHubTagFree => 'GRÁTIS';

  @override
  String get bwHubCardBroadcastTitle => 'Broadcast de rede';

  @override
  String get bwHubCardBroadcastSubtitle => 'Art-Net · sACN · MA-Net';

  @override
  String get bwHubCardBroadcastLimit =>
      'Tráfego unicast não visível (NDI, Dante…)';

  @override
  String get bwHubCardSnmpTitle => 'Portas do switch';

  @override
  String get bwHubCardSnmpSubtitle => 'Vista por porta, todo o tráfego';

  @override
  String get bwHubCardSnmpRequires => 'Switch gerenciado SNMP necessário';

  @override
  String get bwBroadcastPageTitle => 'Broadcast de rede';

  @override
  String get bwBroadcastWarning =>
      'Somente broadcast e multicast. O tráfego unicast (NDI, Dante…) não é visível neste dispositivo.';

  @override
  String get bwBroadcastListening => 'Ouvindo';

  @override
  String get bwBroadcastTotal => 'Total';

  @override
  String get bwSnmpPageTitle => 'Portas do switch';

  @override
  String get bwSnmpConfigTitle => 'Conexão SNMP';

  @override
  String get bwSnmpHost => 'IP do switch';

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
  String get bwSnmpError => 'Erro SNMP';

  @override
  String get bwSnmpReqTitle => 'Requisitos';

  @override
  String get bwSnmpReq1 => 'Switch gerenciado com SNMP v2c habilitado';

  @override
  String get bwSnmpReq2 =>
      'String community (padrão: \"public\" no Luminex GigaCore)';

  @override
  String get bwSnmpReq3 => 'IP do switch acessível neste dispositivo';

  @override
  String get bwSnmpPortUp => 'Ativo';

  @override
  String get bwSnmpPortDown => 'Inativo';

  @override
  String get bwSnmpNoData => 'Aguardando dados…';

  @override
  String bwSnmpPortCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 's',
      one: '',
    );
    return '$count porta$_temp0';
  }

  @override
  String get bwUnitKbps => 'kbps';

  @override
  String get bwUnitMbps => 'Mbps';

  @override
  String get bwUnitPkts => 'pac./s';

  @override
  String get bwLabelIn => '↓ Entrada';

  @override
  String get bwLabelOut => '↑ Saída';

  @override
  String get conversionsVolumesTitle => 'Volumes';

  @override
  String get volumeCalcCardTitle => 'Volume — cubo, cilindro, esfera…';

  @override
  String get volumeCalcUnitLabel => 'Unidade das dimensões';

  @override
  String get volumeCalcPlaceholder =>
      'Preenche as dimensões para ver o volume ✨';

  @override
  String get volumeShapeCube => 'Cubo';

  @override
  String get volumeShapeBox => 'Paralelepípedo';

  @override
  String get volumeShapeCylinder => 'Cilindro';

  @override
  String get volumeShapeSphere => 'Esfera';

  @override
  String get volumeShapeCone => 'Cone';

  @override
  String get volumeShapeSquarePyramid => 'Pirâmide (base quadrada)';

  @override
  String get volumeFieldSide => 'Lado';

  @override
  String get volumeFieldLength => 'Comprimento';

  @override
  String get volumeFieldWidth => 'Largura';

  @override
  String get volumeFieldHeight => 'Altura';

  @override
  String get volumeFieldRadius => 'Raio';

  @override
  String get volumeFieldRadiusBase => 'Raio (base)';

  @override
  String get volumeFieldSideBase => 'Lado (base)';

  @override
  String get aboutVesaTitle => 'Suportes VESA e tamanhos de ecrã';

  @override
  String get aboutVesaSubtitle =>
      'Normas VESA, localizador de padrão e cálculo de diagonal';

  @override
  String get vesaIntroTitle => 'VESA e ecrãs, num relance';

  @override
  String get vesaIntroBody =>
      'A VESA (Video Electronics Standards Association) uniformiza o espaçamento dos furos de fixação na parte traseira de ecrãs, televisores e monitores. Quanto maior e mais pesado o ecrã, maior o espaçamento entre furos. Verifica sempre o peso e o padrão VESA indicados pelo fabricante antes de escolheres um suporte — esta página fornece ordens de grandeza, não valores garantidos.';

  @override
  String get vesaTableTitle => 'Padrões VESA comuns';

  @override
  String get vesaColEntraxe => 'Espaçamento';

  @override
  String get vesaColScreenSize => 'Tamanho do ecrã';

  @override
  String get vesaColMaxWeight => 'Peso máx.';

  @override
  String get vesaTableFooterNote =>
      'Intervalos indicativos: um fabricante pode perfeitamente oferecer um VESA mais largo do que a média para um determinado ecrã, especialmente em ecrãs profissionais e paredes de LED. Verifica sempre a ficha técnica.';

  @override
  String get vesaLargeFormat => 'Grandes formatos / paredes de LED';

  @override
  String get vesaFinderTitle => 'Que padrão VESA medi?';

  @override
  String get vesaFinderHint =>
      'Mede o espaçamento entre dois furos (horizontal e vertical) na parte traseira do ecrã, em milímetros.';

  @override
  String get vesaFieldHorizontal => 'Espaçamento horizontal (mm)';

  @override
  String get vesaFieldVertical => 'Espaçamento vertical (mm)';

  @override
  String get vesaFinderPlaceholder =>
      'Indica os dois espaçamentos para identificar o padrão.';

  @override
  String vesaFinderExactMatch(Object pattern) {
    return 'Padrão VESA $pattern 🎯';
  }

  @override
  String vesaFinderNearestMatch(Object pattern, Object delta) {
    return 'Sem correspondência exata — o mais próximo é $pattern (diferença combinada de $delta mm). Verifica a tua medição.';
  }

  @override
  String get vesaScreenCalcTitle => 'Dimensões de um ecrã a partir da diagonal';

  @override
  String get vesaFieldDiagonal => 'Diagonal (polegadas)';

  @override
  String get vesaScreenCalcPlaceholder => 'Indica uma diagonal em polegadas.';

  @override
  String get vesaResultDiagonal => 'Diagonal';

  @override
  String get vesaResultWidth => 'Largura';

  @override
  String get vesaResultHeight => 'Altura';

  @override
  String get vesaResultArea => 'Área';

  @override
  String get vesaTipsTitle => 'Conselhos de fixação';

  @override
  String get vesaTip1 =>
      'Usa sempre os 4 (ou mais) parafusos fornecidos — nunca 2 na diagonal.';

  @override
  String get vesaTip2 =>
      'Respeita o binário de aperto indicado: apertar demasiado pode rachar o chassis.';

  @override
  String get vesaTip3 =>
      'Para uma montagem em altura ou numa treliça, prevê uma lingada ou uma segurança secundária independente do suporte VESA.';

  @override
  String get vesaTip4 =>
      'Em carga dinâmica (movimento, vibrações, transporte), reduz a carga admissível em relação à carga estática do fabricante.';

  @override
  String get vesaTip5 =>
      'Verifica o comprimento dos parafusos: se forem demasiado compridos, podem danificar a eletrónica interna do ecrã.';

  @override
  String get vesaTip6 =>
      'Um adaptador VESA (75→100, 100→200…) deve ser anotado na ficha de carga — acrescenta peso e um braço de alavanca.';

  @override
  String get cctFilterTitle => 'Filtro ↔ Temperatura de cor (K)';

  @override
  String get cctFilterTileDescription =>
      'Que CTO/CTB escolher entre duas temperaturas, em qualquer sentido';

  @override
  String get cctFilterIntro =>
      'Encontra num instante o filtro CTO/CTB que precisas, ou verifica o resultado de um filtro que já tens — em qualquer sentido ✨';

  @override
  String get cctModeFindFilter => 'Que filtro?';

  @override
  String get cctModeSourcePlusFilter => 'K + filtro → K?';

  @override
  String get cctModeTargetPlusFilter => 'K alvo + filtro → K de partida?';

  @override
  String get cctFieldSourceK => 'Temperatura de partida (K)';

  @override
  String get cctFieldTargetK => 'Temperatura desejada (K)';

  @override
  String get cctFieldTargetKFinal => 'Temperatura final desejada (K)';

  @override
  String get cctFieldFilter => 'Filtro';

  @override
  String get cctDescEighthCtb => 'Arrefece muito ligeiramente';

  @override
  String get cctDescQuarterCtb => 'Arrefece ligeiramente';

  @override
  String get cctDescHalfCtb => 'Arrefece moderadamente';

  @override
  String get cctDescThreeQuarterCtb => 'Arrefece fortemente';

  @override
  String get cctDescFullCtb => 'Tungsténio → luz do dia';

  @override
  String get cctDescEighthCto => 'Aquece muito ligeiramente';

  @override
  String get cctDescQuarterCto => 'Aquece ligeiramente';

  @override
  String get cctDescHalfCto => 'Aquece moderadamente';

  @override
  String get cctDescThreeQuarterCto => 'Aquece fortemente';

  @override
  String get cctDescFullCto => 'Luz do dia → tungsténio';

  @override
  String get cctFindFilterPlaceholder =>
      'Indica as duas temperaturas para encontrar o filtro adequado.';

  @override
  String get cctRequiredShiftLabel => 'Desvio necessário';

  @override
  String get cctMiredShiftLabel => 'Mired shift';

  @override
  String cctBestChoice(Object name, Object k) {
    return 'Melhor escolha: $name → ≈ $k K';
  }

  @override
  String cctApproxKelvin(Object k) {
    return '≈ $k K';
  }

  @override
  String get cctOtherFiltersNearby => 'Outros filtros próximos';

  @override
  String get cctDisclaimer =>
      'Valores de desvio mired padrão, aproximados — consulta a ficha técnica do fabricante para uso crítico.';

  @override
  String get cctSourcePlaceholder => 'Indica a temperatura de partida.';

  @override
  String get cctTargetPlaceholder => 'Indica a temperatura final desejada.';

  @override
  String get cctOutOfRange =>
      'Combinação fora do intervalo (resultado não físico) — tenta outra temperatura ou outro filtro.';

  @override
  String get cctResultObtainedTemp => 'Temperatura obtida';

  @override
  String get cctResultAppliedFilter => 'Filtro aplicado';

  @override
  String get cctResultRequiredSource => 'Fonte necessária';

  @override
  String get cctResultFilterToApply => 'Filtro a aplicar';

  @override
  String get cctBrandLabel => 'Marca de filtro';

  @override
  String get cctAllBrands => 'Todas as marcas';

  @override
  String get timecodeHubTitle => 'Timecode';

  @override
  String get timecodeToolConverterLabel => 'Conversor\nde framerate';

  @override
  String get timecodeToolMathLabel => 'Duração e\ndesvio';

  @override
  String get timecodeToolDelayLabel => 'Frame ↔ ms';

  @override
  String get timecodeToolCountdownLabel => 'Contagem\nregressiva';

  @override
  String get timecodeBadgeFree => 'GRÁTIS';

  @override
  String get timecodeBadgeNew => 'NOVO';

  @override
  String get timecodeConverterTitle => 'Conversor de framerate';

  @override
  String get timecodeConverterSourceCardTitle => 'Timecode de origem';

  @override
  String get timecodeConverterFieldLabel => 'HH:MM:SS:FF';

  @override
  String get timecodeConverterFieldHint => '01:00:00:00';

  @override
  String get timecodeConverterSourceRateLabel => 'Framerate de origem';

  @override
  String get timecodeConverterSwapTooltip => 'Trocar origem / destino';

  @override
  String get timecodeConverterTargetCardTitle => 'Framerate de destino';

  @override
  String get timecodeConverterTargetRateLabel => 'Framerate de destino';

  @override
  String get timecodeConverterButton => 'Converter';

  @override
  String timecodeConverterErrorInvalid(String rateLabel, int frameBase) {
    return '❌ Timecode inválido para $rateLabel (esperado: HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeConverterResult(String rateLabel, String tc, String seconds) {
    return 'TC em $rateLabel:\n$tc\n\n(≈ $seconds s decorridos desde 00:00:00:00)';
  }

  @override
  String get timecodeMathTitle => 'Duração e desvio';

  @override
  String get timecodeMathModeDuration => 'Duração entre 2 TC';

  @override
  String get timecodeMathModeOffset => 'Desviar um TC';

  @override
  String get timecodeMathRateCardTitle => 'Framerate';

  @override
  String get timecodeMathDurationCardTitle => 'Timecode In / Out';

  @override
  String get timecodeMathTcInLabel => 'TC In (HH:MM:SS:FF)';

  @override
  String get timecodeMathTcOutLabel => 'TC Out (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeDurationButton => 'Calcular duração';

  @override
  String timecodeMathErrorDuration(int frameBase) {
    return '❌ Verifica os dois timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathDurationResult(
      String duration, int frames, String rateLabel) {
    return 'Duração: $duration\n($frames frame(s) a $rateLabel)';
  }

  @override
  String get timecodeMathOffsetCardTitle => 'Timecode inicial + desvio';

  @override
  String get timecodeMathBaseTcLabel => 'TC inicial (HH:MM:SS:FF)';

  @override
  String get timecodeMathAddLabel => '+ Somar';

  @override
  String get timecodeMathSubtractLabel => '− Subtrair';

  @override
  String get timecodeMathOffsetLabel => 'Desvio — duração (HH:MM:SS:FF)';

  @override
  String get timecodeMathComputeOffsetButton => 'Calcular novo TC';

  @override
  String timecodeMathErrorOffset(int frameBase) {
    return '❌ Verifica o timecode inicial e o desvio (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String timecodeMathOffsetResult(String tc) {
    return 'Novo timecode:\n$tc';
  }

  @override
  String get timecodeDelayTitle => 'Frame ↔ ms';

  @override
  String get timecodeDelayCardTitle => 'Atraso de vídeo / áudio';

  @override
  String get timecodeDelayIntro =>
      'Útil para corrigir uma diferença de lip-sync ou um atraso de processador de vídeo/LED: introduz um valor, escolhe a unidade e obtém o equivalente.';

  @override
  String get timecodeDelayRateLabel => 'Framerate';

  @override
  String get timecodeDelayUnitFrames => 'Frames';

  @override
  String get timecodeDelayUnitMs => 'Milissegundos';

  @override
  String get timecodeDelayValueLabelFrames => 'Número de frames';

  @override
  String get timecodeDelayValueLabelMs => 'Milissegundos';

  @override
  String get timecodeDelayButton => 'Converter';

  @override
  String get timecodeDelayErrorInvalid => '❌ Valor inválido.';

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
  String get timecodeCountdownTitle => 'Contagem regressiva';

  @override
  String get timecodeCountdownSettingsCardTitle => 'Definições';

  @override
  String get timecodeCountdownRateLabel => 'Framerate';

  @override
  String get timecodeCountdownCurrentTcLabel => 'TC atual (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownFillNowTooltip =>
      'Preencher com a hora do telemóvel';

  @override
  String get timecodeCountdownTargetTcLabel => 'TC alvo (HH:MM:SS:FF)';

  @override
  String get timecodeCountdownStartButton => 'Iniciar';

  @override
  String get timecodeCountdownStopButton => 'Parar';

  @override
  String timecodeCountdownErrorInvalid(int frameBase) {
    return '❌ Verifica os dois timecodes (HH:MM:SS:FF, FF < $frameBase).';
  }

  @override
  String get timecodeCountdownLiveCardTitle => 'Em direto';

  @override
  String timecodeCountdownLiveText(String tc, String remaining) {
    return 'TC atual (estimado): $tc\nTempo restante: $remaining';
  }

  @override
  String timecodeCountdownOverdue(String duration) {
    return '−$duration (TC ultrapassado)';
  }

  @override
  String get homeTimecodeTitle => 'Timecode';

  @override
  String get homeTimecodeSubtitle => 'Framerate, duração, desvio, atraso';

  @override
  String get vconsoleTitle => 'Console Virtual';

  @override
  String get vconsoleTileDescription =>
      'Envia Art-Net/sACN via WiFi para testar os teus equipamentos';

  @override
  String get vconsoleSectionConnection => 'Ligação de rede';

  @override
  String get vconsoleUniverseLabel => 'Universo inicial';

  @override
  String get vconsoleUniverseCountLabel => 'Número de universos';

  @override
  String get rdmPageTitle => 'RDM';

  @override
  String get rdmScanButton => 'Procurar na rede';

  @override
  String get rdmScanningStatus => 'A procurar fixtures RDM…';

  @override
  String get rdmEmptyState =>
      'Nenhuma fixture RDM encontrada. Inicie uma procura.';

  @override
  String rdmDeviceCountLabel(Object count) {
    return '$count fixture(s) encontrada(s)';
  }

  @override
  String get rdmUidLabel => 'UID';

  @override
  String get rdmManufacturerLabel => 'Fabricante';

  @override
  String get rdmStartAddressLabel => 'Endereço DMX';

  @override
  String get rdmFootprintLabel => 'Ocupação (canais)';

  @override
  String get rdmPersonalityLabel => 'Personality (modo)';

  @override
  String get rdmSoftwareVersionLabel => 'Versão do software';

  @override
  String get rdmIdentifyButton => 'Identificar';

  @override
  String get rdmEditTitle => 'Editar fixture';

  @override
  String rdmConfirmSetStartAddress(Object uid, Object value) {
    return 'Alterar o endereço DMX de $uid para $value?';
  }

  @override
  String rdmConfirmSetPersonality(Object uid, Object value) {
    return 'Alterar o modo de $uid para $value?';
  }

  @override
  String rdmConfirmSetLabel(Object uid, Object value) {
    return 'Renomear $uid para \"$value\"?';
  }

  @override
  String get rdmConfirmButton => 'Confirmar';

  @override
  String get rdmCancelButton => 'Cancelar';

  @override
  String get rdmSetSuccess => 'Alterado com sucesso';

  @override
  String get rdmSetFailed => 'Falha ao alterar';

  @override
  String get rdmNoResponse => 'Sem resposta da fixture';

  @override
  String get rdmRefreshTooltip => 'Atualizar';

  @override
  String get rdmWriteWarning =>
      'Alterar uma fixture ao vivo pode perturbar um show em curso. Use com cuidado.';

  @override
  String get vconsoleTargetBroadcast => 'Broadcast (auto)';

  @override
  String get vconsoleTargetUnicast => 'IP específico';

  @override
  String get vconsoleManualIpLabel => 'IP do node (ex: 192.168.1.50)';

  @override
  String get vconsoleStop => 'Parar o envio';

  @override
  String get vconsoleStart => 'Iniciar o envio';

  @override
  String get vconsoleBlackout => 'Blackout';

  @override
  String vconsoleStatusLive(Object fps) {
    return 'Ao vivo • $fps fps';
  }

  @override
  String get vconsoleStatusStopped => 'Parado';

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
    return 'Erro: $message';
  }

  @override
  String vconsoleStartFailed(Object message) {
    return 'Não foi possível iniciar: $message';
  }

  @override
  String get vconsoleTabFaders => 'Faders simples';

  @override
  String get vconsoleTabGdtf => 'GDTF';

  @override
  String get vconsoleTabPatch => 'Meu Patch';

  @override
  String get vconsoleChannelCountLabel => 'Número de canais';

  @override
  String get vconsoleAllZero => 'Tudo a 0';

  @override
  String get vconsoleAllFull => 'Tudo a 255';

  @override
  String get vconsoleSearchTitle => 'Pesquisar no GDTF Share';

  @override
  String get vconsoleSearchHint => 'Ex: MAC Viper, Spiider...';

  @override
  String get vconsoleImportLocal => 'Importar um ficheiro .gdtf';

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
      'Nenhum modo DMX encontrado neste ficheiro .gdtf';

  @override
  String vconsolePickFailed(Object message) {
    return 'Não foi possível selecionar: $message';
  }

  @override
  String vconsoleDownloadFailed(Object code) {
    return 'Transferência falhou ($code)';
  }

  @override
  String vconsoleSearchResultSubtitle(Object count, Object size) {
    return '$count modo(s) • $size';
  }

  @override
  String get vconsoleChooseFixtureHint =>
      'Escolhe uma fixture para mostrar os seus faders.';

  @override
  String get vconsolePatchSectionTitle => 'Meu Patch (importação MVR)';

  @override
  String get vconsolePatchEmpty =>
      'Ainda não há fixtures patcheadas. Importa um ficheiro MVR na ferramenta Patch para as veres aqui.';

  @override
  String vconsolePatchEntrySubtitle(
      Object universe, Object start, Object end, Object count) {
    return 'Universo $universe • $start-$end • $count ch';
  }

  @override
  String get vconsoleChoosePatchedFixtureHint =>
      'Escolhe uma fixture patcheada para mostrar os seus faders.';

  @override
  String get vconsoleStartAddressLabel => 'Endereço inicial';

  @override
  String get vconsoleFixtureFallbackTitle => 'Fixture';

  @override
  String vconsoleUniverseArrow(Object universe) {
    return '→ universo $universe';
  }

  @override
  String vconsoleSearchError(Object code) {
    return 'Erro $code';
  }

  @override
  String vconsoleNetworkError(Object message) {
    return 'Erro de rede: $message';
  }

  @override
  String vconsoleChannelShortLabel(Object n) {
    return 'Ch $n';
  }

  @override
  String get vconsoleContinueToSource => 'Escolher a fonte';

  @override
  String get vconsoleContinueToSourceHint =>
      'Faders simples, fixture GDTF ou uma máquina já patcheada (MVR).';

  @override
  String get vconsoleControlGroupTooltip => 'Controlar todo o grupo';

  @override
  String vconsoleGroupInfo(Object count, Object universe) {
    return '$count máquina(s) • universo $universe';
  }

  @override
  String vconsoleGroupInfoWithExcluded(
      Object count, Object universe, Object excluded) {
    return '$count máquina(s) • universo $universe • $excluded fora do grupo (outro universo)';
  }

  @override
  String vconsoleGroupSubtitle(Object count, Object universes) {
    return '$count máquinas • universo $universes';
  }

  @override
  String get vconsoleOpenFaders => 'Abrir a consola';

  @override
  String vconsolePresetsTitleFor(Object channel) {
    return 'Presets — $channel';
  }

  @override
  String get vconsolePresetsTooltip => 'Presets';

  @override
  String get vconsoleSourceStepTitle => 'Escolher a fonte';

  @override
  String get vconsoleUnit8Bit => '8 bits';

  @override
  String get vconsoleUnitPercent => '%';

  @override
  String get vconsoleHomeTooltip =>
      'Posição Home (dimmer 100%, pan/tilt centrados, shutter aberto)';

  @override
  String get vconsoleHomeButton => 'Home';

  @override
  String get filterCorrespondenceTitle => 'Correspondência de filtros';

  @override
  String get filterCorrespondenceSearchHint => 'Pesquisar (número ou nome)…';

  @override
  String get filterCorrespondenceColLeeName => 'Lee / Nome';

  @override
  String get filterCorrespondenceEmpty => 'Sem correspondência';

  @override
  String filterCorrespondenceResultsCount(Object count) {
    return '$count correspondência(s)';
  }

  @override
  String filterCorrespondenceFilteredOf(Object total) {
    return ' (filtrado de $total)';
  }

  @override
  String get lbResetDialogTitle => 'Repor tudo?';

  @override
  String get lbResetDialogBody =>
      'A lista de fixtures será esvaziada. A configuração do quadro será mantida.';

  @override
  String get lbClearAction => 'Esvaziar';

  @override
  String get lbPageTitle => 'Distribuição de carga';

  @override
  String get lbResetTooltip => 'Repor';

  @override
  String get lbPanelConfigTitle => 'Configuração do quadro';

  @override
  String get lbVoltageTypeLabel => 'Tipo de rede';

  @override
  String get lbPanelSizeLabel => 'Tamanho do quadro';

  @override
  String get lbCosPhiLabel => 'Fator de potência (cos φ)';

  @override
  String get lbPhaseGaugesTitle => 'Amperagem por fase';

  @override
  String lbFixturesListTitle(Object count, Object totalW) {
    return 'Fixtures — $count linhas · $totalW W total';
  }

  @override
  String get lbEmptyTitle => 'Ainda não há fixtures';

  @override
  String get lbEmptyBody => 'Toca em + para adicionar\na partir do catálogo.';

  @override
  String get lbAddFixtureButton => 'Adicionar uma fixture';

  @override
  String get lbSheetTitleDefault => '⚡ Adicionar uma fixture';

  @override
  String get lbPickerSearchHint => 'Pesquisar fabricante ou fixture…';

  @override
  String get lbNoResults => 'Sem resultados 🤷';

  @override
  String lbProductsWithPowerCount(Object count) {
    return '$count fixture(s) com dados de consumo';
  }

  @override
  String get lbUnknownPower => 'consumo desconhecido';

  @override
  String get lbFixtureSectionLabel => 'Fixture';

  @override
  String get lbPowerLabel => 'Consumo (W)';

  @override
  String get lbQuantityLabel => 'Quantidade';

  @override
  String get lbPhaseLabel => 'Fase';

  @override
  String get lbPowerHint => 'ex: 350';

  @override
  String get lbAddToDistribution => 'Adicionar à distribuição';

  @override
  String get filterLedFiltreLabel => 'Filtro';

  @override
  String get filterLedTransmissionLabel => 'Transmissão';

  @override
  String get filterLedSaveProfileTooltip => 'Guardar o perfil';

  @override
  String get filterLedColorComparisonTitle => 'Comparação de cor';

  @override
  String get proHeaderBody =>
      'Desbloqueia todas as ferramentas avançadas para técnicos de iluminação, vídeo e laser.';

  @override
  String get proPerYear => '/ ano';

  @override
  String get proSubscribeButton => 'Subscrever';

  @override
  String get proRestorePurchases => 'Restaurar compras';

  @override
  String get proPrivacyPolicy => 'Política de privacidade';

  @override
  String get proTermsOfUse => 'Termos de utilização';

  @override
  String get rfIm3ConflictBadge => '⚠ CONFLITO';

  @override
  String get filterLedHideCalibration => 'Ocultar calibração';

  @override
  String get filterLedShowCalibration => 'Calibrar a minha fixture';

  @override
  String get aboutAudioTitle => 'Áudio — som e PA';

  @override
  String get aboutAudioSubtitle =>
      'Gain staging, SPL/distância, atrasos, subs cardioides, cablagem.';

  @override
  String get aboutAudioPageTitle => 'Áudio — referência de terreno';

  @override
  String get audioRefTocCopyText => 'Copiar sumário';

  @override
  String get audioRefSection1Title => 'Cadeia de sinal e gain staging';

  @override
  String get audioRefSection1FormulasTitle => 'Referências de nível';

  @override
  String get audioRefSection1Formula1 =>
      '0 dBu ≈ 0,775 V RMS — referência profissional analógica';

  @override
  String get audioRefSection1Formula2 =>
      '0 dBFS = nível digital máximo antes do clipping — mantém sempre margem (headroom)';

  @override
  String get audioRefSection1Formula3 =>
      'Gain staging: ajusta cada estágio (fonte → mesa → amplificador) para uma boa relação sinal/ruído, sem saturar';

  @override
  String get audioRefSection1FieldMarksTitle => 'Dicas de terreno';

  @override
  String get audioRefSection1FieldMark1 =>
      'Procura um nível de entrada que oscile no verde/amarelo, nunca no vermelho de forma contínua';

  @override
  String get audioRefSection1FieldMark2 =>
      'Um sistema mal ajustado soa ruidoso mesmo a volume baixo: o problema costuma vir de um estágio saturado antes';

  @override
  String get audioRefSection2Title => 'SPL e distância';

  @override
  String get audioRefSection2FormulaTitle => 'Lei do inverso do quadrado';

  @override
  String get audioRefSection2Formula1 =>
      'Cada vez que a distância duplica = -6 dB SPL em campo livre';

  @override
  String get audioRefSection2Formula2 =>
      'SPL(d2) = SPL(d1) - 20 × log10(d2 / d1)';

  @override
  String get audioRefSection2NoteTitle => 'Nuances no terreno';

  @override
  String get audioRefSection2Note1 =>
      'No interior, as reflexões (paredes, teto) reduzem a queda real em relação à teoria';

  @override
  String get audioRefSection2Note2 =>
      'Um line array bem concebido cai mais devagar do que uma fonte pontual ao longo do eixo de cobertura';

  @override
  String get audioRefSection3Title => 'Alinhamento de atraso (time alignment)';

  @override
  String get audioRefSection3Paragraph =>
      'Um sistema secundário (torre de atraso, reforço frontal) deve ser atrasado para que o seu som chegue ao mesmo tempo que o do sistema principal, percebido como uma única fonte.';

  @override
  String get audioRefSection3FormulaTitle => 'Fórmula básica';

  @override
  String get audioRefSection3Formula1 =>
      'Atraso (ms) = distância entre os sistemas (m) / 0,343 m/ms (velocidade do som ≈ 343 m/s)';

  @override
  String get audioRefSection3TipsTitle => 'Boas práticas';

  @override
  String get audioRefSection3Tip1 =>
      'Mede a distância real entre as duas fontes, não apenas a distância ao público';

  @override
  String get audioRefSection3Tip2 =>
      'Adiciona alguns ms de atraso extra (2-5 ms) para reforçar o efeito de precedência (efeito Haas) e manter o sistema principal como fonte percebida';

  @override
  String get audioRefSection3Tip3 =>
      'Verifica de ouvido e/ou com um analisador (ex: correlação de fase) depois de ajustar';

  @override
  String get audioRefSection4Title =>
      'Directividade de subs (cardioide / end-fire)';

  @override
  String get audioRefSection4Paragraph =>
      'Uma configuração cardioide ou end-fire reduz a energia grave enviada para o palco/FOH reforçando a que vai para o público, jogando com o atraso e a polaridade entre subs.';

  @override
  String get audioRefSection4TypesTitle => 'Configurações comuns';

  @override
  String get audioRefSection4Type1 =>
      'End-fire: subs alinhados em fila, o da frente avançado e atrasado eletronicamente';

  @override
  String get audioRefSection4Type2 =>
      'Cardioide de 2 subs: um sub à frente (normal), um sub atrás com polaridade invertida e atrasado';

  @override
  String get audioRefSection4Type3 =>
      'Cardioide de 3 subs: dois à frente em fase, um atrás invertido e atrasado — melhor equilíbrio entre nível e rejeição traseira';

  @override
  String get audioRefSection5Title => 'Cablagem e conectores';

  @override
  String get audioRefSection5XlrTitle => 'XLR simétrico';

  @override
  String get audioRefSection5XlrBullet1 =>
      'Prefere sempre uma ligação simétrica (XLR/TRS) em distâncias longas para rejeitar ruído';

  @override
  String get audioRefSection5XlrBullet2 =>
      'Além de ~50-100 m em analógico, considera uma ligação digital (AES/EBU, Dante, etc.)';

  @override
  String get audioRefSection5SpeakonTitle => 'Speakon (colunas)';

  @override
  String get audioRefSection5SpeakonBullet1 =>
      'Nunca uses XLR para colunas: a potência transportada pode danificar equipamento pensado para sinal de linha';

  @override
  String get audioRefSection5SpeakonBullet2 =>
      'Verifica se a secção do cabo é adequada à potência e distância (queda de tensão) antes de uma tiragem longa';

  @override
  String get audioRefSection5GroundTitle => 'Massa e zumbido';

  @override
  String get audioRefSection5GroundBullet1 =>
      'Uma malha de terra entre dois equipamentos ligados à rede por caminhos diferentes pode criar zumbido de 50/60 Hz';

  @override
  String get audioRefSection5GroundBullet2 =>
      'Um ground lift ou uma DI box com isolamento galvânico pode resolver isto sem cortar a terra de segurança';

  @override
  String get audioRefSection6Title => 'Segurança auditiva e boas práticas';

  @override
  String get audioRefSection6DontDoTitle => 'A evitar';

  @override
  String get audioRefSection6DontDoBullet1 =>
      'Expor o público ou a equipa a mais de 100 dB SPL de forma contínua sem limite de tempo';

  @override
  String get audioRefSection6DontDoBullet2 =>
      'Forçar um sistema além da sua potência nominal para compensar um mau posicionamento';

  @override
  String get audioRefSection6WarningTitle => 'Referências de exposição';

  @override
  String get audioRefSection6WarningBullet1 =>
      '85 dB SPL: limite recomendado para exposição prolongada (8h) sem proteção';

  @override
  String get audioRefSection6WarningBullet2 =>
      '100 dB SPL: apenas alguns minutos antes do risco — a maioria dos concertos ultrapassa este nível';

  @override
  String get audioRefSection6WarningBullet3 =>
      'Usa sempre um limitador de sistema na saída para proteger o equipamento e o público';

  @override
  String get audioRefSection7Title => 'Checklist rápida';

  @override
  String get audioRefSection7QuickTitle => 'Antes do show';

  @override
  String get audioRefSection7Bullet1 =>
      'Gain staging verificado da fonte ao amplificador, sem saturação';

  @override
  String get audioRefSection7Bullet2 =>
      'Atrasos dos sistemas secundários calculados e aplicados';

  @override
  String get audioRefSection7Bullet3 => 'Limitador de sistema ativo e ajustado';

  @override
  String get audioRefSection7Bullet4 =>
      'Polaridade verificada entre subs e tops (sem cancelamento)';

  @override
  String get audioRefSection7Bullet5 =>
      'Nível de SPL medido no FOH e ao fundo da sala';

  @override
  String get audioRefFooterNote =>
      'Estas são referências gerais — verifica sempre as indicações do fabricante e a regulamentação local sobre níveis sonoros.';

  @override
  String get aboutRfTitle => 'RF — sem fios e Wi-Fi';

  @override
  String get aboutRfSubtitle =>
      'Bandas UHF, Wi-Fi, coexistência IM3, antenas, scan RF.';

  @override
  String get aboutRfPageTitle => 'RF — referência de terreno';

  @override
  String get rfRefTocCopyText => 'Copiar sumário';

  @override
  String get rfRefSection1Title => 'Fundamentos do espetro RF';

  @override
  String get rfRefSection1FormulasTitle =>
      'Referências de frequência / comprimento de onda';

  @override
  String get rfRefSection1Formula1 =>
      'λ (m) = 300 / f (MHz) — comprimento de onda aproximado';

  @override
  String get rfRefSection1Formula2 =>
      'Quanto mais alta a frequência, mais curto o comprimento de onda e menor o alcance em espaço livre';

  @override
  String get rfRefSection1FieldMarksTitle => 'Dicas de terreno';

  @override
  String get rfRefSection1FieldMark1 =>
      'O corpo humano absorve e reflete ondas RF — a posição de um recetor sem fios no corpo influencia a receção';

  @override
  String get rfRefSection1FieldMark2 =>
      'Prioriza sempre uma linha de vista direta entre emissor e recetor';

  @override
  String get rfRefSection2Title => 'Bandas UHF para microfones sem fios';

  @override
  String get rfRefSection2Paragraph =>
      'Os microfones e in-ears sem fios usam principalmente a banda UHF (470-694 MHz na Europa, conforme o país), partilhada com a difusão de TV — a disponibilidade real depende da regulamentação local.';

  @override
  String get rfRefSection2NoteTitle => 'Verifica antes de cada data';

  @override
  String get rfRefSection2Note1 =>
      'As bandas disponíveis variam consoante o país — verifica a regulamentação local (ANFR em França, Ofcom no Reino Unido, etc.)';

  @override
  String get rfRefSection2Note2 =>
      'Uma banda livre num local pode estar ocupada por um emissor de TV ou outro prestador noutro lugar';

  @override
  String get rfRefSection3Title => 'Wi-Fi 2,4 GHz vs 5 GHz';

  @override
  String get rfRefSection3TableTitle => 'Diferenças-chave';

  @override
  String get rfRefSection3Bullet1 =>
      '2,4 GHz: 3 canais não sobrepostos (1, 6, 11), melhor alcance, mais congestionado (Bluetooth, microfones sem fios de banda alta, outras redes)';

  @override
  String get rfRefSection3Bullet2 =>
      '5 GHz: muito mais canais não sobrepostos, maior débito, alcance mais curto, geralmente menos interferências';

  @override
  String get rfRefSection3Bullet3 =>
      'Para regie/controlo (mesas, visualização), prioriza o 5 GHz quando possível';

  @override
  String get rfRefSection4Title => 'Coexistência e intermodulação (IM3)';

  @override
  String get rfRefSection4Paragraph =>
      'Quando vários emissores sem fios funcionam em conjunto, as suas frequências podem criar produtos de intermodulação (IM3) que caem noutras frequências utilizadas e provocam interferências.';

  @override
  String get rfRefSection4FormulaTitle => 'Fórmula IM3 (3ª ordem)';

  @override
  String get rfRefSection4Formula1 => 'IM3 = 2×f1 − f2 e 2×f2 − f1';

  @override
  String get rfRefSection4Tip1 =>
      'Quanto mais canais sem fios se adicionam, maior o risco de um produto IM3 cair numa frequência utilizada — daí o valor de um plano de frequências calculado com antecedência';

  @override
  String get rfRefSection5Title => 'Antenas e diversity';

  @override
  String get rfRefSection5Bullet1 =>
      'A receção diversity usa duas antenas ligeiramente desfasadas para evitar zonas de cancelamento (buracos RF)';

  @override
  String get rfRefSection5Bullet2 =>
      'Espaça as antenas pelo menos um quarto do comprimento de onda, sem as alinhar diretamente com o emissor';

  @override
  String get rfRefSection5Bullet3 =>
      'Evita colocar as antenas diretamente no chão ou encostadas a uma estrutura metálica, o que pode desafinar ou bloquear o sinal';

  @override
  String get rfRefSection6Title => 'Scan RF antes de um show';

  @override
  String get rfRefSection6Bullet1 =>
      'Faz sempre o scan da banda no local, à hora do show — o ambiente RF muda entre o dia e a noite (outros prestadores, público com hotspots, etc.)';

  @override
  String get rfRefSection6Bullet2 =>
      'Anota as frequências ocupadas e documenta-as para a próxima data no mesmo local, se possível';

  @override
  String get rfRefSection6Bullet3 =>
      'Reserva uma margem de frequências livres para uma troca de última hora (equipamento avariado, interferência imprevista)';

  @override
  String get rfRefSection7Title => 'Checklist rápida';

  @override
  String get rfRefSection7Bullet1 => 'Scan RF realizado à hora do show';

  @override
  String get rfRefSection7Bullet2 =>
      'Plano de frequências calculado (IM3 verificado)';

  @override
  String get rfRefSection7Bullet3 => 'Antenas em linha de vista, bem espaçadas';

  @override
  String get rfRefSection7Bullet4 =>
      'Bandas UHF utilizadas em conformidade com a regulamentação local';

  @override
  String get rfRefFooterNote =>
      'A regulamentação RF varia muito consoante o país — verifica sempre as frequências autorizadas localmente antes de um show.';

  @override
  String get aboutLaserTitle => 'Laser — física e segurança';

  @override
  String get aboutLaserSubtitle =>
      'Como funciona, scanners, classes, normas, NOHD/SZED/CZED.';

  @override
  String get aboutLaserPageTitle => 'Laser — referência de terreno';

  @override
  String get laserRefTocCopyText => 'Copiar sumário';

  @override
  String get laserRefSection1Title => 'O que é um laser?';

  @override
  String get laserRefSection1AcronymTitle => 'O acrónimo LASER';

  @override
  String get laserRefSection1AcronymBody =>
      'LASER significa «Light Amplification by Stimulated Emission of Radiation» (amplificação de luz por emissão estimulada de radiação).';

  @override
  String get laserRefSection1HowTitle => 'O princípio físico';

  @override
  String get laserRefSection1HowBody =>
      'Um meio ativo (díodo, cristal DPSS...) é «bombeado» eletricamente ou opticamente, provocando uma emissão estimulada de fotões. Uma cavidade ressonante (dois espelhos, um semirrefletor) amplifica essa luz, que sai coerente, monocromática e muito colimada — ao contrário de uma fonte de luz normal.';

  @override
  String get laserRefSection1TypesTitle => 'Tipos comuns em espetáculos';

  @override
  String get laserRefSection1Type1 =>
      'Díodo direto: compacto, muitas vezes usado em RGB para misturar cores';

  @override
  String get laserRefSection1Type2 =>
      'DPSS (Diode Pumped Solid State): um díodo bombeia um cristal, historicamente usado para o verde e outros comprimentos de onda específicos';

  @override
  String get laserRefSection2Title => 'Como se desenha: scanners e velocidade';

  @override
  String get laserRefSection2Paragraph =>
      'O feixe é direcionado por dois espelhos galvanométricos («galvos»), um para o eixo X e outro para o eixo Y, que giram extremamente depressa. Ao contrário do vídeo (varrimento linha a linha), um show laser desenha formas vetoriais, ponto a ponto, seguindo o contorno da imagem.';

  @override
  String get laserRefSection2SpeedTitle => 'Velocidade de scan';

  @override
  String get laserRefSection2Speed1 =>
      'A velocidade mede-se em pontos por segundo (pps) ou quilopontos por segundo (kpps)';

  @override
  String get laserRefSection2Speed2 =>
      'A ILDA (International Laser Display Association) estandardiza o conetor, o formato de ficheiro .ild e um padrão de teste usado para avaliar objetivamente um scanner';

  @override
  String get laserRefSection2FieldTitle => 'Notas de terreno';

  @override
  String get laserRefSection2Field1 =>
      'Quantos mais pontos uma imagem contiver, mais pps são necessários para evitar o cintilar (flicker) — um show fluido ronda normalmente os 20 a 30 kpps';

  @override
  String get laserRefSection2Field2 =>
      'O padrão de teste ILDA permite comparar dois scanners com critérios objetivos (velocidade, precisão, amortecimento)';

  @override
  String get laserRefSection3Title => 'Classes de laser e normas';

  @override
  String get laserRefSection3ClassesTitle => 'Classes IEC 60825-1';

  @override
  String get laserRefSection3Class1 =>
      'Classe 1: segura em uso normal, sem precauções especiais';

  @override
  String get laserRefSection3Class2 =>
      'Classe 1M / 2M: seguras a olho nu, mas perigosas com instrumentos óticos (binóculos, lupa)';

  @override
  String get laserRefSection3Class3 =>
      'Classe 2: visível, protegida pelo reflexo de piscar (< 1 mW)';

  @override
  String get laserRefSection3Class4 =>
      'Classe 3R: risco moderado, perigo direto limitado';

  @override
  String get laserRefSection3Class5 =>
      'Classe 3B: perigosa para o olho em visão direta — a maioria dos lasers de espetáculo está nesta classe ou na classe 4';

  @override
  String get laserRefSection3Class6 =>
      'Classe 4: perigosa para o olho e a pele, risco de incêndio — precauções máximas';

  @override
  String get laserRefSection3StandardsTitle => 'Normas de referência';

  @override
  String get laserRefSection3Standard1 =>
      'IEC 60825-1: segurança do produto e classificação de lasers';

  @override
  String get laserRefSection3Standard2 =>
      'IEC 60825-3: diretrizes específicas para displays e shows laser (conceito de MPE variável consoante a duração da exposição)';

  @override
  String get laserRefSection3Standard3 =>
      'Regulamentações locais: declaração/autorização consoante a potência e o país (ex.: FDA/CDRH 21 CFR 1040.10 nos EUA, com procedimento de variance para shows)';

  @override
  String get laserRefSection3FieldNote =>
      'Verifica sempre a regulamentação local antes de um show, especialmente para audience scanning e perto de um aeroporto.';

  @override
  String get laserRefSection4Title => 'Medidas de segurança';

  @override
  String get laserRefSection4Bullet1 =>
      'Um Laser Safety Officer (LSO) formado é designado e responsável pelo show';

  @override
  String get laserRefSection4Bullet2 =>
      'Interruptor de chave e paragem de emergência facilmente acessíveis';

  @override
  String get laserRefSection4Bullet3 =>
      'Um interlock corta a emissão se uma tampa ou caixa for aberta';

  @override
  String get laserRefSection4Bullet4 =>
      'Deteção de falha de scan (scan-fail) que corta o feixe se os galvos pararem — indispensável para o audience scanning';

  @override
  String get laserRefSection4Bullet5 =>
      'Nenhum feixe fixo apontado para o público — apenas audience scanning com as proteções e cálculos de exposição dedicados';

  @override
  String get laserRefSection4Bullet6 =>
      'Nunca apontar para o espaço aéreo, um avião, ou uma superfície refletora não controlada (vidro, espelho, ecrã)';

  @override
  String get laserRefSection5Title => 'NOHD, SZED, CZED explicados';

  @override
  String get laserRefSection5Paragraph =>
      'Estas distâncias de segurança são calculadas pela ferramenta «Zonas de segurança» da app a partir da potência, divergência e diâmetro de saída do feixe.';

  @override
  String get laserRefSection5NohdTitle =>
      'NOHD — Nominal Ocular Hazard Distance';

  @override
  String get laserRefSection5NohdBody =>
      'Distância ocular de perigo nominal: além desta distância, a irradiância direta do feixe desce abaixo do limite de exposição máxima permitida (MPE) para uma exposição acidental e breve. É a referência base definida pela IEC 60825-1.';

  @override
  String get laserRefSection5SzedTitle => 'SZED — Show Zone Exposure Distance';

  @override
  String get laserRefSection5SzedBody =>
      'Distância de exposição da zona de show: delimita a zona onde o público pode estar durante um show com varrimento (audience scanning), com um limiar MPE mais prudente do que o NOHD.';

  @override
  String get laserRefSection5CzedTitle =>
      'CZED — Controlled Zone Exposure Distance';

  @override
  String get laserRefSection5CzedBody =>
      'Distância de exposição da zona controlada: a mais prudente das três, reservada à zona onde só pode estar pessoal formado (operadores, técnicos), tendo em conta uma exposição potencialmente mais longa.';

  @override
  String get laserRefSection5FieldNote =>
      'Na app, quanto mais baixo o limiar MPE usado, maior a distância calculada — daí a ordem CZED > SZED > NOHD. Estas distâncias continuam indicativas: não substituem um estudo realizado por um Laser Safety Officer qualificado, nem a regulamentação local em vigor.';

  @override
  String get laserRefSection6Title => 'Checklist rápida';

  @override
  String get laserRefSection6Bullet1 =>
      'Classe do laser identificada, declarada se necessário';

  @override
  String get laserRefSection6Bullet2 =>
      'LSO designado e presente durante todo o show';

  @override
  String get laserRefSection6Bullet3 =>
      'Zonas NOHD/SZED/CZED calculadas e assinaladas';

  @override
  String get laserRefSection6Bullet4 =>
      'Deteção de falha de scan ativa se houver audience scanning';

  @override
  String get laserRefSection6Bullet5 =>
      'Paragem de emergência testada e acessível';

  @override
  String get laserRefSection6Bullet6 =>
      'Nenhuma orientação para o espaço aéreo ou uma superfície refletora não controlada';

  @override
  String get laserRefFooterNote =>
      'Esta informação é geral e educativa — não substitui uma formação de Laser Safety Officer nem a regulamentação local (IEC 60825, FDA/CDRH, autoridades de aviação...).';

  @override
  String get aboutRiggingTitle => 'Rigging';

  @override
  String get aboutRiggingSubtitle => 'Bases, brides e fator de ângulo';

  @override
  String get aboutRiggingPageTitle => 'Rigging — curso rápido';

  @override
  String get riggingRefTocCopyText => 'Copiar resumo';

  @override
  String get riggingRefSection1Title => 'Bases do rigging';

  @override
  String get riggingRefSection2Title => 'Cintagem a 2 pontos (bridle)';

  @override
  String get riggingRefSection3Title => 'Fator de ângulo';

  @override
  String get riggingRefSection4Title => 'Checklist';

  @override
  String get riggingRefSection1Bullet1 =>
      'WLL (Working Load Limit): carga máxima de utilização autorizada para um acessório, indicada pelo fabricante.';

  @override
  String get riggingRefSection1Bullet2 =>
      'Coeficiente de segurança: relação entre a carga de ruptura e a WLL, geralmente 5:1 ou 10:1 conforme o material e a regulamentação.';

  @override
  String get riggingRefSection1Bullet3 =>
      'Cadeia de carga: cada elo (ponto de fixação, cinta, manilha, estrutura) deve ser dimensionado para a carga total — o elo mais fraco define o limite do conjunto.';

  @override
  String get riggingRefSection2Bullet1 =>
      'Uma cintagem a 2 pontos distribui a carga entre duas cintas que formam um ângulo em relação à vertical.';

  @override
  String get riggingRefSection2Bullet2 =>
      'Quanto maior o ângulo em relação à vertical, maior a tensão em cada cinta.';

  @override
  String get riggingRefSection2Bullet3 =>
      'Recomendação comum: manter o ângulo incluído entre os dois ramais abaixo de 90° para limitar a tensão adicional.';

  @override
  String get riggingRefSection3FormulaTitle => 'Fórmula';

  @override
  String get riggingRefSection3Formula1 =>
      'Tensão por cinta = (Carga / número de cintas) × fator de ângulo, com fator de ângulo = 1 / cos(ângulo em relação à vertical).';

  @override
  String get riggingRefSection3Bullet1 =>
      'Exemplos: 0° → fator 1,0; 45° → fator aproximadamente 1,41; 60° → fator 2,0.';

  @override
  String get riggingRefSection3Bullet2 =>
      'Quanto maior o ângulo em relação à vertical, mais rapidamente o fator — e portanto a tensão — aumenta.';

  @override
  String get riggingRefSection4Bullet1 =>
      'Verificar a WLL de cada acessório (cinta, manilha, mosquetão, estrutura) antes da montagem.';

  @override
  String get riggingRefSection4Bullet2 =>
      'Calcular a tensão real por cinta considerando o fator de ângulo, não apenas a carga total dividida pelo número de ramais.';

  @override
  String get riggingRefSection4Bullet3 =>
      'Inspecionar visualmente os acessórios (deformação, corrosão, desgaste) antes de cada utilização.';

  @override
  String get riggingRefSection4Bullet4 =>
      'Solicitar a verificação do conjunto por uma pessoa competente ou rigger qualificado para cargas importantes ou configurações complexas.';

  @override
  String get riggingRefFooterNote =>
      'Este conteúdo é um lembrete pedagógico geral e não substitui as normas locais, a formação de rigger nem a verificação por uma pessoa competente.';

  @override
  String get aboutConsoleTitle => 'Consola e patch';

  @override
  String get aboutConsoleSubtitle => 'Consola virtual, GDTF e patch DMX';

  @override
  String get aboutConsolePageTitle => 'Consola — curso rápido';

  @override
  String get consoleRefTocCopyText => 'Copiar resumo';

  @override
  String get consoleRefSection1Title => 'Consola virtual e DMX sem fios';

  @override
  String get consoleRefSection2Title => 'GDTF e GDTF Share';

  @override
  String get consoleRefSection3Title => 'Patch e universos';

  @override
  String get consoleRefSection4Title => 'Checklist';

  @override
  String get consoleRefSection1Paragraph =>
      'Uma consola virtual permite controlar um espetáculo a partir de um tablet ou smartphone, enviando DMX pela rede (Art-Net ou sACN) em vez de um cabo DMX direto.';

  @override
  String get consoleRefSection1Bullet1 =>
      'O Wi-Fi introduz latência e risco de quebras: reservar para ajustes, não para momentos críticos ao vivo sem uma solução de reserva com fios.';

  @override
  String get consoleRefSection1Bullet2 =>
      'Verificar se o node/interface DMX-sobre-IP recebe efetivamente o universo Art-Net ou sACN configurado na consola virtual.';

  @override
  String get consoleRefSection1Bullet3 =>
      'Prever um acesso de reserva com fios (DMX direto ou Ethernet) para os momentos críticos do espetáculo.';

  @override
  String get consoleRefSection2GdtfTitle => 'GDTF (General Device Type Format)';

  @override
  String get consoleRefSection2GdtfBody =>
      'Formato de ficheiro padronizado que descreve as características de um projetor (modos DMX, rodas de cor, geometria 3D) para uma importação fiável em qualquer consola compatível.';

  @override
  String get consoleRefSection2ShareTitle => 'GDTF Share';

  @override
  String get consoleRefSection2ShareBody =>
      'Base de dados online oficial onde os fabricantes publicam os ficheiros GDTF dos seus equipamentos, descarregáveis gratuitamente para o patch.';

  @override
  String get consoleRefSection3Bullet1 =>
      'Um universo DMX contém 512 canais; cada equipamento ocupa um ou mais canais conforme o modo DMX escolhido.';

  @override
  String get consoleRefSection3Bullet2 =>
      'Verificar sempre o modo DMX efetivamente definido no equipamento físico — deve corresponder ao selecionado no patch da consola.';

  @override
  String get consoleRefSection3Bullet3 =>
      'Documentar o patch (endereços, universos, modos) facilita a resolução de problemas e a transição para outra pessoa.';

  @override
  String get consoleRefSection4Bullet1 =>
      'Verificar a ligação de rede (Wi-Fi ou com fios) entre a consola virtual e o node DMX antes do espetáculo.';

  @override
  String get consoleRefSection4Bullet2 =>
      'Confirmar que cada equipamento está patchado no universo e endereço de início corretos.';

  @override
  String get consoleRefSection4Bullet3 =>
      'Utilizar um ficheiro GDTF atualizado do GDTF Share em vez de um perfil genérico.';

  @override
  String get consoleRefSection4Bullet4 =>
      'Prever um plano de reserva em caso de quebra de rede ou Wi-Fi durante o espetáculo.';

  @override
  String get consoleRefFooterNote =>
      'Este conteúdo é um lembrete geral; consultar a documentação do fabricante para modos DMX e procedimentos específicos.';

  @override
  String get aboutCinemaTitle => 'Cinema';

  @override
  String get aboutCinemaSubtitle => 'Câmara, profundidade de campo e cadência';

  @override
  String get aboutCinemaPageTitle => 'Cinema — curso rápido';

  @override
  String get cinemaRefTocCopyText => 'Copiar resumo';

  @override
  String get cinemaRefSection1Title => 'Noções básicas de câmara';

  @override
  String get cinemaRefSection2Title => 'Profundidade de campo e foco';

  @override
  String get cinemaRefSection3Title => 'Cadência e obturador';

  @override
  String get cinemaRefSection4Title => 'Checklist';

  @override
  String get cinemaRefSection1Bullet1 =>
      'Sensor: superfície fotossensível que capta a imagem; o seu tamanho influencia o campo de visão e a profundidade de campo para uma dada distância focal.';

  @override
  String get cinemaRefSection1Bullet2 =>
      'Distância focal: distância (em mm) que determina o ângulo de campo — uma focal curta é grande angular, uma focal longa é teleobjetiva.';

  @override
  String get cinemaRefSection1Bullet3 =>
      'Abertura (f/): tamanho do diafragma, que controla tanto a quantidade de luz que entra como a profundidade de campo.';

  @override
  String get cinemaRefSection2Paragraph =>
      'A profundidade de campo é a zona de nitidez aceitável à frente e atrás do sujeito focado.';

  @override
  String get cinemaRefSection2Bullet1 =>
      'Uma abertura larga (f/1.4, f/2) dá uma profundidade de campo reduzida (fundo desfocado).';

  @override
  String get cinemaRefSection2Bullet2 =>
      'Uma abertura fechada (f/11, f/16) dá uma profundidade de campo ampla (tudo nítido).';

  @override
  String get cinemaRefSection3FormulaTitle => 'Fórmula do ângulo de obturação';

  @override
  String get cinemaRefSection3Formula1 =>
      'Velocidade de obturação = 1 / (2 × cadência em imagens/segundo) para um ângulo de obturação de 180°, a referência padrão no cinema.';

  @override
  String get cinemaRefSection3Bullet1 =>
      '24 imagens/segundo é a cadência clássica do cinema; 25 ou 30 fps são comuns em broadcast conforme a norma de vídeo (PAL/NTSC).';

  @override
  String get cinemaRefSection3Bullet2 =>
      'Um ângulo de obturação mais fechado (90°, 45°) dá um aspeto mais entrecortado, usado em cenas de ação estilizadas.';

  @override
  String get cinemaRefSection4Bullet1 =>
      'Verificar se a cadência da câmara corresponde à frequência das fontes de luz (evitar flicker).';

  @override
  String get cinemaRefSection4Bullet2 =>
      'Adaptar a abertura ao resultado de profundidade de campo pretendido, não apenas à exposição.';

  @override
  String get cinemaRefSection4Bullet3 =>
      'Manter um ângulo de obturação consistente durante toda a rodagem para uma textura de movimento uniforme.';

  @override
  String get cinemaRefSection4Bullet4 =>
      'Testar sempre em condições reais de plateau antes da rodagem definitiva.';

  @override
  String get cinemaRefFooterNote =>
      'Este conteúdo é um lembrete pedagógico geral; as definições finais dependem do equipamento e da intenção artística.';

  @override
  String get aboutTimecodeTitle => 'Timecode';

  @override
  String get aboutTimecodeSubtitle => 'SMPTE, drop-frame e cadências';

  @override
  String get aboutTimecodePageTitle => 'Timecode — curso rápido';

  @override
  String get timecodeRefTocCopyText => 'Copiar resumo';

  @override
  String get timecodeRefSection1Title => 'O que é o timecode SMPTE';

  @override
  String get timecodeRefSection2Title => 'Drop-frame vs non-drop-frame';

  @override
  String get timecodeRefSection3Title => 'Cadências comuns';

  @override
  String get timecodeRefSection4Title => 'Checklist';

  @override
  String get timecodeRefSection1FormatTitle => 'Formato';

  @override
  String get timecodeRefSection1FormatBody =>
      'HH:MM:SS:FF — horas, minutos, segundos e número de imagem (frame), reiniciado a cada cadência completa.';

  @override
  String get timecodeRefSection1Bullet1 =>
      'O timecode SMPTE sincroniza imagem, som e iluminação numa referência temporal comum.';

  @override
  String get timecodeRefSection1Bullet2 =>
      'Cada imagem tem um endereço único, o que permite uma referenciação precisa tanto em pós-produção como no controlo ao vivo.';

  @override
  String get timecodeRefSection2Paragraph =>
      'O drop-frame (DF) existe porque algumas cadências (29,97 fps) não correspondem a um número inteiro de imagens por segundo, o que desfasa o timecode em relação ao tempo real se não for corrigido.';

  @override
  String get timecodeRefSection2Bullet1 =>
      'Non-drop-frame (NDF): conta as imagens sem saltos; simples, mas desvia-se ligeiramente do tempo real a 29,97 fps.';

  @override
  String get timecodeRefSection2Bullet2 =>
      'Drop-frame (DF): salta periodicamente números de imagem (não imagens reais) para realinhar o timecode com o tempo real.';

  @override
  String get timecodeRefSection3Bullet1 =>
      '24 fps: cadência clássica do cinema.';

  @override
  String get timecodeRefSection3Bullet2 =>
      '25 fps: padrão PAL (Europa); 30 fps (ou 29,97 DF/NDF): padrão NTSC (América do Norte, Japão).';

  @override
  String get timecodeRefSection3Bullet3 =>
      '50 fps e 59,94/60 fps: cadências de alta frequência usadas em broadcast e para câmara lenta.';

  @override
  String get timecodeRefSection3Bullet4 =>
      'Verificar sempre que todas as fontes (câmara, som, iluminação, vídeo) usam a mesma cadência de referência.';

  @override
  String get timecodeRefSection4Bullet1 =>
      'Confirmar a cadência e o modo (DF/NDF) em todas as fontes antes do início do espetáculo ou da rodagem.';

  @override
  String get timecodeRefSection4Bullet2 =>
      'Verificar que a fonte mestre de timecode (master clock) está claramente identificada e distribuída a todos os equipamentos.';

  @override
  String get timecodeRefSection4Bullet3 =>
      'Em caso de suspeita de desvio, comparar o timecode apresentado com um relógio de referência durante um período suficiente.';

  @override
  String get timecodeRefFooterNote =>
      'Este conteúdo é um lembrete geral; consultar as especificações SMPTE e a documentação dos equipamentos utilizados.';

  @override
  String get aboutConversionsTitle => 'Conversões e BPM';

  @override
  String get aboutConversionsSubtitle => 'Unidades, BPM e DMX num relance';

  @override
  String get aboutConversionsPageTitle => 'Conversões e BPM — curso rápido';

  @override
  String get conversionsRefTocCopyText => 'Copiar resumo';

  @override
  String get conversionsRefSection1Title => 'Porquê converter';

  @override
  String get conversionsRefSection2Title => 'BPM ↔ milissegundos';

  @override
  String get conversionsRefSection3Title =>
      'DMX ↔ percentagem / 8-bit ↔ 16-bit';

  @override
  String get conversionsRefSection4Title => 'Checklist';

  @override
  String get conversionsRefSection1Paragraph =>
      'Na régie, as unidades misturam-se frequentemente (BPM musicais, milissegundos de delay, percentagens DMX, valores de 8/16-bit): converter rapidamente e sem erros evita desfasamentos entre efeitos de luz, som e vídeo.';

  @override
  String get conversionsRefSection2FormulaTitle => 'Fórmula';

  @override
  String get conversionsRefSection2Formula1 =>
      'Duração de uma batida (ms) = 60 000 / BPM.';

  @override
  String get conversionsRefSection2Bullet1 =>
      'Exemplo: a 120 BPM, uma batida dura 500 ms; uma semicolcheia (1/4 de batida) dura 125 ms.';

  @override
  String get conversionsRefSection2Bullet2 =>
      'Útil para sincronizar um efeito de luz, um delay de áudio ou um clip de vídeo com o tempo de uma faixa.';

  @override
  String get conversionsRefSection3Bullet1 =>
      'Um valor DMX de 8-bit vai de 0 a 255; em percentagem, 255 corresponde a 100%.';

  @override
  String get conversionsRefSection3Bullet2 =>
      'Em 16-bit, dois canais combinados (fino/grosso) dão uma resolução de 0 a 65 535 para um controlo mais fino (dimmer, pan/tilt).';

  @override
  String get conversionsRefSection3Bullet3 =>
      'Verificar o modo (8-bit ou 16-bit) efetivamente configurado no equipamento antes de fazer o patch, sob pena de desfasamento de valores.';

  @override
  String get conversionsRefSection4Bullet1 =>
      'Verificar sempre a unidade apresentada antes de introduzir um valor (ms, BPM, %, 8-bit, 16-bit).';

  @override
  String get conversionsRefSection4Bullet2 =>
      'Recalcular em vez de arredondar de memória para valores críticos (sincronização, segurança).';

  @override
  String get conversionsRefSection4Bullet3 =>
      'Documentar as conversões utilizadas na ficha técnica para facilitar a transição do espetáculo.';

  @override
  String get conversionsRefFooterNote =>
      'Este conteúdo é um lembrete geral; consultar a documentação do equipamento para os seus modos exatos de resolução.';

  @override
  String get aboutCategoryNetworkTitle => 'Rede e protocolos';

  @override
  String get aboutCategoryAudioRfTitle => 'Áudio e RF';

  @override
  String get aboutCategoryVideoCinemaTitle => 'Vídeo e cinema';

  @override
  String get aboutCategoryLightingTitle => 'Iluminação, laser e consola';

  @override
  String get aboutCategoryRiggingElecTitle => 'Rigging e eletricidade';

  @override
  String get aboutCategoryToolsTitle => 'Ferramentas práticas';

  @override
  String get pinnedItemsTitle => 'Meus fixados';

  @override
  String get homePinnedItemsSubtitle =>
      'Encontre rapidamente as suas ferramentas e referências fixadas.';

  @override
  String get pinnedItemsEmpty =>
      'Ainda não há ferramentas nem referências fixadas.';

  @override
  String get fixtureInfoSectionIdentification => 'Identificação';

  @override
  String get fixtureInfoLabelName => 'Nome';

  @override
  String get fixtureInfoLabelId => 'ID';

  @override
  String get fixtureInfoSectionDmx => 'DMX / Rede';

  @override
  String get fixtureInfoLabelUniverse => 'Universo';

  @override
  String get fixtureInfoLabelAddress => 'Endereço';

  @override
  String get fixtureInfoLabelMode => 'Modo';

  @override
  String get fixtureInfoLabelChannelCount => 'Canais';

  @override
  String get fixtureInfoLabelGdtfSpec => 'Ficheiro GDTF';

  @override
  String get fixtureInfoSectionPhysical => 'Física';

  @override
  String get fixtureInfoLabelWeight => 'Peso';

  @override
  String fixtureInfoValueKg(Object kg) {
    return '$kg kg';
  }

  @override
  String get fixtureInfoLabelDimensions => 'Dimensões';

  @override
  String fixtureInfoValueDimensionsCm(
      Object heightCm, Object lengthCm, Object widthCm) {
    return '$lengthCm × $widthCm × $heightCm cm';
  }

  @override
  String get fixtureInfoLabelLegHeight => 'Altura dos pés';

  @override
  String fixtureInfoValueCm(Object cm) {
    return '$cm cm';
  }

  @override
  String get fixtureInfoSectionElectrical => 'Elétrica';

  @override
  String get fixtureInfoLabelPower => 'Potência';

  @override
  String fixtureInfoValueWatts(Object watts) {
    return '$watts W';
  }

  @override
  String get fixtureInfoSectionEnvironment => 'Ambiente';

  @override
  String get fixtureInfoLabelOperatingTemp => 'Temperatura de funcionamento';

  @override
  String fixtureInfoValueTempRange(Object highC, Object lowC) {
    return '$lowC°C – $highC°C';
  }

  @override
  String get fixtureInfoNoGdtfData =>
      'Nenhuma informação física disponível (GDTF ausente ou incompleto).';

  @override
  String get patch3dTitle => 'Visualizador 3D';

  @override
  String get patch3dOpenButton => 'Ver em 3D';

  @override
  String get patch3dResetCameraTooltip => 'Recentrar câmara';

  @override
  String get patch3dFiltersTooltip => 'Filtros e cores';

  @override
  String get patch3dZoomToFitTooltip => 'Ajustar tudo';

  @override
  String get patch3dCameraViewsTooltip => 'Vistas de câmera';

  @override
  String get patch3dCameraViewFront => 'Frente';

  @override
  String get patch3dCameraViewTop => 'Topo';

  @override
  String get patch3dCameraViewSide => 'Lateral';

  @override
  String get patch3dCameraViewIso => 'Isométrica';

  @override
  String get patch3dBackgroundColorLabel => 'Cor de fundo';

  @override
  String patch3dEntriesWithoutPosition(Object count) {
    return '$count fixture(s) sem posição 3D (sem Matrix no MVR).';
  }

  @override
  String get patch3dNoPositionedFixtures =>
      'Nenhuma fixture posicionada para mostrar. Importa um MVR com posições 3D.';

  @override
  String get patch3dMissingModelTitle => 'Modelos 3D em falta';

  @override
  String patch3dMissingModelBody(Object count) {
    return '$count tipo(s) de aparelho não têm modelo 3D no seu GDTF. É usado um cubo genérico (30×30×30 cm) em vez disso:';
  }

  @override
  String get patch3dColorModeLabel => 'Coloração';

  @override
  String get patch3dColorModeByType => 'Por tipo';

  @override
  String get patch3dColorModeByUniverse => 'Por universo';

  @override
  String get patch3dFilterUniverseLabel => 'Universo';

  @override
  String get patch3dFilterTypeLabel => 'Tipo de aparelho';

  @override
  String get patch3dFilterShowAll => 'Mostrar tudo';

  @override
  String get gdtfWizardSuggestionOpen => 'Aberto';

  @override
  String get gdtfWizardSuggestionClosed => 'Fechado';

  @override
  String gdtfWizardSuggestionGoboSlot(int n) {
    return 'Gobo $n';
  }

  @override
  String gdtfWizardSuggestionColorSlot(int n) {
    return 'Cor $n';
  }

  @override
  String get gdtfWizardColorWhite => 'Branco';

  @override
  String get gdtfWizardColorRed => 'Vermelho';

  @override
  String get gdtfWizardColorGreen => 'Verde';

  @override
  String get gdtfWizardColorBlue => 'Azul';

  @override
  String get gdtfWizardColorYellow => 'Amarelo';

  @override
  String get gdtfWizardColorCyan => 'Ciano';

  @override
  String get gdtfWizardColorMagenta => 'Magenta';

  @override
  String get gdtfWizardColorRainbow => 'Arco-íris';

  @override
  String get gdtfWizardStrobeSlowToFast => 'Estroboscópio lento → rápido';

  @override
  String get gdtfWizardStrobeRandom => 'Estroboscópio aleatório';

  @override
  String get gdtfWizardAppBarTitle => 'Assistente manual GDTF';

  @override
  String get gdtfWizardStepTitleStyle => 'Estilo do projetor';

  @override
  String get gdtfWizardStepTitleFunction => 'Função';

  @override
  String get gdtfWizardStepTitleChannels => 'Canais';

  @override
  String get gdtfWizardStepTitlePixels => 'Pixels';

  @override
  String get gdtfWizardStepTitleStructure => 'Estrutura';

  @override
  String gdtfWizardStepHeader(int step, String title) {
    return 'Etapa $step/5 — $title';
  }

  @override
  String get gdtfWizardErrStyle =>
      'Escolhe um estilo de projetor para continuar.';

  @override
  String get gdtfWizardErrFunction =>
      'Seleciona pelo menos uma função (wash, spot ou beam).';

  @override
  String get gdtfWizardErrChannels =>
      'Marca pelo menos um canal — o projetor tem de controlar alguma coisa!';

  @override
  String get gdtfWizardErrPixelCount =>
      'São precisos pelo menos 2 pixels/instâncias para uma estrutura multipixel.';

  @override
  String get gdtfWizardErrRepeatCount =>
      'Seleciona pelo menos 2 canais repetíveis (ex.: Red + Green, ou Pan/Tilt) para que cada pixel seja bem reconhecido como uma instância distinta.';

  @override
  String get gdtfWizardErrRowsCols =>
      'Indica um número válido de linhas e colunas.';

  @override
  String get gdtfWizardErrModeName => 'Dá um nome a este modo DMX.';

  @override
  String get gdtfWizardStyleIntro => 'Que tipo de projetor estás a criar?';

  @override
  String get gdtfWizardStyleLyreTitle => 'Cabeça móvel (moving head)';

  @override
  String get gdtfWizardStyleLyreSubtitle =>
      'Cabeça motorizada com pan/tilt — spot, wash ou beam.';

  @override
  String get gdtfWizardStyleParTitle => 'PAR / Fixo';

  @override
  String get gdtfWizardStyleParSubtitle =>
      'Projetor estático, sem movimento (PAR LED, recorte fixo…).';

  @override
  String get gdtfWizardStyleBarreTitle => 'Barra';

  @override
  String get gdtfWizardStyleBarreSubtitle =>
      'Barra linear, muitas vezes por pixels (barra LED, X4 Bar…).';

  @override
  String get gdtfWizardPanTiltCheckTitle => 'Este projetor tem motor Pan/Tilt';

  @override
  String get gdtfWizardPanTiltCheckSubtitle =>
      'Adiciona os canais Pan/Tilt em 16 bits (norma GDTF).';

  @override
  String get gdtfWizardFunctionIntro =>
      'Que função(ões) tem este projetor? (seleção múltipla)';

  @override
  String get gdtfWizardFunctionWash => 'Wash';

  @override
  String get gdtfWizardFunctionSpot => 'Spot';

  @override
  String get gdtfWizardFunctionBeam => 'Beam';

  @override
  String get gdtfWizardFunctionHint =>
      'Isto serve só para pré-marcar canais úteis para o próximo passo (Wash → Frost/Zoom, Spot → Gobo/Focus/Prisma, Beam → feixe estreito). Podes ajustar tudo a seguir.';

  @override
  String get gdtfWizardChannelsIntro => 'Marca os canais DMX do projetor.';

  @override
  String get gdtfWizardSectionIntensity => 'INTENSIDADE';

  @override
  String get gdtfWizardChannelDimmer => 'Dimmer';

  @override
  String get gdtfWizardChannelStrobe => 'Obturador / Strobe';

  @override
  String get gdtfWizardSectionColor => 'COR';

  @override
  String get gdtfWizardChannelCto => 'Roda CTO (temperatura de cor)';

  @override
  String get gdtfWizardChannelColorMacro => 'Macro de cor (predefinições)';

  @override
  String get gdtfWizardSectionPosition => 'POSIÇÃO';

  @override
  String get gdtfWizardPanTiltNote =>
      'Pan/Tilt é adicionado automaticamente (16 bits). Para um projetor com várias cabeças móveis independentes, vais poder repartir isso por cabeça no passo Pixels.';

  @override
  String get gdtfWizardSectionBeamShaping => 'FEIXE';

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
  String get gdtfWizardChannelPrismRot => 'Rotação do prisma';

  @override
  String get gdtfWizardSectionGobos => 'GOBOS';

  @override
  String get gdtfWizardChannelGobo1 => 'Roda de gobos 1';

  @override
  String get gdtfWizardChannelGobo1Rot => 'Rotação do gobo 1';

  @override
  String get gdtfWizardChannelGobo2 => 'Roda de gobos 2';

  @override
  String get gdtfWizardChannelGobo2Rot => 'Rotação do gobo 2';

  @override
  String get gdtfWizardSectionEffectsControl => 'EFEITOS E CONTROLO';

  @override
  String get gdtfWizardChannelEffects => 'Efeitos / macros';

  @override
  String get gdtfWizardChannelReset => 'Reset';

  @override
  String get gdtfWizardSlotsHint =>
      'Slots (um por linha, opcional) — ex.: Aberto, Gobo 1…';

  @override
  String get gdtfWizardSlotsTooltip => 'Sugestão';

  @override
  String get gdtfWizardChannelPanTiltPerHead => 'Pan/Tilt (por cabeça)';

  @override
  String get gdtfWizardPixelsIntro =>
      'Este projetor tem vários pixels/células controláveis em separado (matriz LED, barra de pixels…)?';

  @override
  String get gdtfWizardMultiplePixelsTitle => 'Vários pixels / instâncias';

  @override
  String get gdtfWizardMultiplePixelsSubtitle =>
      'Caso contrário, todos os canais marcados no passo anterior ficam únicos (uma só saída).';

  @override
  String get gdtfWizardSectionPixelCount => 'NÚMERO DE PIXELS';

  @override
  String get gdtfWizardSectionPixelContent => 'CONTEÚDO DE UM PIXEL';

  @override
  String get gdtfWizardNoRepeatableChannels =>
      'Ainda não há nenhum canal repetível. Volta ao passo «Estilo» (Pan/Tilt) ou «Canais» (Dimmer, Obturador/Strobe, cor…) e marca pelo menos um atributo para repetir por cabeça/pixel.';

  @override
  String gdtfWizardRepeatPerPixelSubtitle(String label) {
    return 'Um canal por pixel (ex.: $label 1, $label 2…)';
  }

  @override
  String get gdtfWizardRepeatGlobalSubtitle =>
      'Continua a ser um único canal global para todo o projetor';

  @override
  String get gdtfWizardModeNameLabel => 'Nome do modo DMX';

  @override
  String get gdtfWizardModeNameHint => 'ex.: Standard, 16 bits, Pixel Mode…';

  @override
  String get gdtfWizardSingleOutputNote =>
      'Projetor de uma só saída (sem vários pixels): nada a configurar aqui, cada canal marcado continua único.';

  @override
  String get gdtfWizardSectionLayout => 'DISPOSIÇÃO';

  @override
  String get gdtfWizardArrangementLinearTitle => 'Barra linear';

  @override
  String gdtfWizardArrangementLinearSubtitle(int count) {
    return 'Pixels alinhados em linha (ex.: X4 Bar). Numerados de 1 a $count.';
  }

  @override
  String get gdtfWizardArrangementMatrixTitle => 'Matriz (grelha)';

  @override
  String get gdtfWizardArrangementMatrixSubtitle =>
      'Pixels organizados em linhas × colunas (ex.: parede de LED, JDC1 pixel curve).';

  @override
  String get gdtfWizardArrangementModulesTitle => 'Módulos independentes';

  @override
  String get gdtfWizardArrangementModulesSubtitle =>
      'Várias cabeças/módulos idênticos no mesmo chassi (ex.: JDC1).';

  @override
  String get gdtfWizardRowsLabel => 'Linhas';

  @override
  String get gdtfWizardColsLabel => 'Colunas';

  @override
  String gdtfWizardMatrixTotal(int count) {
    return 'Total: $count pixels (numerados linha a linha).';
  }

  @override
  String get gdtfWizardModulesNote =>
      'Cada módulo pode ter a sua própria cor/dimmer/strobe E o seu próprio zoom/focus/iris/frost/prisma/gobo — volta ao passo «Pixels» e marca, para cada canal de feixe em causa, que deve repetir-se por módulo em vez de ficar comum a todos.';

  @override
  String get gdtfWizardCancel => 'Cancelar';

  @override
  String get gdtfWizardBack => 'Voltar';

  @override
  String get gdtfWizardValidateAndEdit => 'Confirmar e editar';

  @override
  String get gdtfWizardNext => 'Seguinte';

  @override
  String get gdtfWizardDefaultModeName => 'Manual';

  @override
  String get gdtfWizardOrDivider => 'OU';

  @override
  String get gdtfWizardManualButtonLabel =>
      'Assistente manual (sem PDF) — estilo, canais, pixels…';

  @override
  String get gdtfWizardColorModeNone => 'Nenhuma';

  @override
  String get gdtfWizardColorModeRgb => 'RGB';

  @override
  String get gdtfWizardColorModeRgbw => 'RGB + Branco';

  @override
  String get gdtfWizardColorModeRgbwaUv => 'RGB + Branco + Âmbar + UV';

  @override
  String get gdtfWizardColorModeCmy => 'CMY (Ciano/Magenta/Amarelo)';

  @override
  String get gdtfWizardColorModeWheel => 'Roda de cor';

  @override
  String get gdtfWizardColorAmber => 'Âmbar';

  @override
  String get gdtfWizardColorUv => 'UV';

  @override
  String get gdtfWizardChannelCtoShort => 'CTO';

  @override
  String get gdtfManualTab => 'Assistente manual';

  @override
  String get gdtfWizardManualTabTitle => 'Criar um GDTF sem PDF';

  @override
  String get gdtfWizardManualTabIntro =>
      'Não tens um manual em PDF à mão, ou o aparelho é demasiado simples para isso? Descreve o teu equipamento em 5 passos (estilo, funções, canais, pixels, estrutura) e a app gera diretamente um GDTF conforme, sem IA nem upload.';

  @override
  String get gdtfWizardSlotsAddButton => 'Adicionar';

  @override
  String get gdtfWizardSlotsRowHint => 'Nome do slot';

  @override
  String get gdtfWizardSlotsRemoveTooltip => 'Remover';

  @override
  String get gdtfWizardSlotsEmptyHint =>
      'Ainda sem slots com nome — adiciona um ou usa uma sugestão.';

  @override
  String get ma3CalcTitle => 'Parâmetros MA3';

  @override
  String get ma3CalcTileDescription =>
      'Quantos parâmetros o teu show precisa, e quantas PU?';

  @override
  String get ma3CalcTabMvr => 'A partir de MVR';

  @override
  String get ma3CalcTabList => 'Lista de aparelhos';

  @override
  String get ma3CalcAddFixture => 'Adicionar aparelho';

  @override
  String get ma3CalcAddSheetTitle => 'Que aparelho?';

  @override
  String get ma3CalcAddSheetSubtitle =>
      'Procura no GDTF Share, importa um .gdtf ou escreve o valor tu mesmo.';

  @override
  String get ma3CalcSearchHint => 'ex. MAC Aura, Robe Spiider…';

  @override
  String get ma3CalcSearchFailed =>
      'Pesquisa indisponível de momento. Verifica a ligação.';

  @override
  String get ma3CalcNoResult =>
      'Sem resultados. Tenta outro nome ou a entrada manual.';

  @override
  String get ma3CalcImportGdtf => 'Ficheiro .gdtf';

  @override
  String get ma3CalcManualEntry => 'Entrada manual';

  @override
  String get ma3CalcManualName => 'Nome do aparelho';

  @override
  String get ma3CalcChooseMode => 'Que modo DMX?';

  @override
  String ma3CalcModeSummary(int params, int channels) {
    return '$params parâm. MA3 · $channels canais DMX';
  }

  @override
  String get ma3CalcModeUnknown => 'Modo sem canais legíveis';

  @override
  String get ma3CalcHowMany => 'Quantos aparelhos?';

  @override
  String get ma3CalcDownloadFailed => 'Não foi possível descarregar o GDTF.';

  @override
  String get ma3CalcGdtfUnreadable =>
      'Este GDTF está ilegível (ficheiro danificado?).';

  @override
  String get ma3CalcGdtfNoMode => 'Nenhum modo DMX neste GDTF.';

  @override
  String ma3CalcNotGdtf(String name) {
    return '«$name» não é um ficheiro .gdtf.';
  }

  @override
  String ma3CalcNotMvr(String name) {
    return '«$name» não é um ficheiro .mvr.';
  }

  @override
  String get ma3CalcPickFailed => 'Não foi possível abrir o ficheiro.';

  @override
  String get ma3CalcMvrUnreadable =>
      'Este MVR está ilegível (não é um arquivo válido).';

  @override
  String get ma3CalcMvrNoScene => 'Sem GeneralSceneDescription.xml neste MVR.';

  @override
  String get ma3CalcMvrNoFixtures => 'Nenhum aparelho neste MVR.';

  @override
  String get ma3CalcMvrEmptyTitle => 'Carrega o teu MVR 🎛️';

  @override
  String get ma3CalcMvrEmptyBody =>
      'Exportação do Vectorworks, Capture, grandMA3, Depence… Contamos os aparelhos, lemos os GDTF e dizemos-te quantos parâmetros (e PU) precisas.';

  @override
  String get ma3CalcPickMvr => 'Escolher um ficheiro .mvr';

  @override
  String get ma3CalcChangeFile => 'Mudar';

  @override
  String get ma3CalcListEmptyTitle => 'O teu rig, aparelho a aparelho';

  @override
  String get ma3CalcListEmptyBody =>
      'Tipo 6 × MAC Aura, 23 × Studio Color… Adiciona os aparelhos, escolhe o modo e o total aparece sozinho.';

  @override
  String get ma3CalcYourSystem => 'A tua consola';

  @override
  String get ma3CalcSafetyMargin => 'Margem de segurança';

  @override
  String get ma3CalcNoMargin => 'Nenhuma';

  @override
  String get ma3CalcTotalParams => 'Parâmetros MA3';

  @override
  String ma3CalcFixturesAndUniverses(int fixtures, int universes) {
    return '$fixtures aparelhos · ≈ $universes universos DMX';
  }

  @override
  String ma3CalcWithMargin(int percent, String value) {
    return 'Com $percent% de margem: $value';
  }

  @override
  String get ma3CalcCopySummary => 'Copiar resumo';

  @override
  String ma3CalcVerdictSessionMax(String max) {
    return 'Acima de $max parâmetros: é o máximo de uma sessão grandMA3.';
  }

  @override
  String ma3CalcVerdictOnPcTooSmall(String max) {
    return 'onPC fica limitado a $max parâmetros';
  }

  @override
  String get ma3CalcVerdictOnPcTooSmallSub =>
      'Precisas de uma consola grandMA3 (+ PU se necessário): escolhe-a acima para ver a configuração.';

  @override
  String get ma3CalcVerdictOnPcOk => 'onPC chega 👌';

  @override
  String ma3CalcVerdictOnPcOkSub(String max) {
    return 'Qualquer hardware onPC (command wing, fader wing, node 4k, rack-unit…) desbloqueia $max parâmetros.';
  }

  @override
  String ma3CalcVerdictBaseOk(String console) {
    return 'A tua $console chega, não precisas de PU 🎉';
  }

  @override
  String ma3CalcVerdictCapacity(String capacity) {
    return 'Capacidade total: $capacity parâmetros.';
  }

  @override
  String ma3CalcVerdictAddPu(String units) {
    return 'Adiciona $units';
  }

  @override
  String ma3CalcVerdictXlOnly(int count) {
    return 'Ou, mais simples: $count × PU XL.';
  }

  @override
  String ma3CalcUnknownNotCounted(int count) {
    return '$count aparelho(s) sem dados não são contados: corrige-os abaixo.';
  }

  @override
  String ma3CalcFixtureTypes(int count) {
    return 'Tipos de aparelhos ($count)';
  }

  @override
  String ma3CalcMvrCounts(int fixtures, int unpatched) {
    return '$fixtures aparelhos · $unpatched sem patch';
  }

  @override
  String ma3CalcMultipatchNote(int count) {
    return 'Dos quais $count multipatch, contados por segurança.';
  }

  @override
  String ma3CalcPerUnit(int params) {
    return '$params parâm. por aparelho';
  }

  @override
  String get ma3CalcUnknownParams => 'Parâmetros desconhecidos';

  @override
  String get ma3CalcTapToFix => 'Toca para escrever o valor tu mesmo →';

  @override
  String get ma3CalcSwipeHint =>
      'Desliza uma linha para a esquerda para a apagar · toca para corrigir os parâmetros.';

  @override
  String get ma3CalcClear => 'Limpar';

  @override
  String get ma3CalcClearListTitle => 'Limpar a lista?';

  @override
  String get ma3CalcClearListBody =>
      'Todos os aparelhos da lista serão removidos.';

  @override
  String get ma3CalcCancel => 'Cancelar';

  @override
  String get ma3CalcOk => 'OK';

  @override
  String get ma3CalcParamsPerUnitTitle => 'Parâmetros por aparelho';

  @override
  String get ma3CalcParamsUnit => 'parâm.';

  @override
  String ma3CalcGdtfValue(int value) {
    return 'Valor calculado a partir do GDTF: $value';
  }

  @override
  String get ma3CalcParamsHelp =>
      'Dica: 1 parâmetro = 1 canal DMX, os canais «fine» de 16 bits não contam.';

  @override
  String get ma3CalcBackToGdtf => 'Valor do GDTF';

  @override
  String get ma3CalcReliabilityOkTitle => 'Os GDTF parecem completos ✅';

  @override
  String get ma3CalcReliabilityOkBody =>
      'Todos os modos foram encontrados e são coerentes. O cálculo continua baseado nestes GDTF.';

  @override
  String ma3CalcReliabilityWarnTitle(int count) {
    return '$count tipo(s) de aparelho a verificar';
  }

  @override
  String get ma3CalcReliabilityWarnBody =>
      'Alguns GDTF parecem incompletos ou incoerentes: o total pode estar errado. Detalhes em cada aparelho.';

  @override
  String ma3CalcReliabilityBadTitle(int count) {
    return '$count tipo(s) de aparelho sem dados';
  }

  @override
  String get ma3CalcReliabilityBadBody =>
      'GDTF em falta ou modo não encontrado: estes aparelhos não são contados, por isso o total está baixo demais. Toca neles para escrever o valor.';

  @override
  String get ma3CalcDisclaimer =>
      'O cálculo baseia-se nos GDTF. Se um GDTF estiver incompleto ou errado, o resultado também estará. Confirma sempre na grandMA3 (janela System Information ou Patch › DMX Universes, coluna Coarse Params).';

  @override
  String get ma3CalcDisclaimerShort =>
      'Baseado nos GDTF: confirmar na grandMA3.';

  @override
  String get ma3CalcHowTitle => 'Como é calculado?';

  @override
  String get ma3CalcHowBody =>
      'Na grandMA3, 1 parâmetro = 1 atributo controlado = 1 canal DMX «coarse». Os canais fine (16/24 bits) são gratuitos e os canais virtuais (dimmer virtual…) não contam para a licença. Os aparelhos multi-instância (píxeis, células) são desdobrados instância a instância. A recomendação privilegia o menor número de unidades.';

  @override
  String get ma3CalcHowHardware => 'Parâmetros por equipamento (doc. MA, v2.3)';

  @override
  String ma3CalcHowSessionMax(String max) {
    return 'Máximo por sessão: $max';
  }

  @override
  String get ma3CalcIssueGdtfMissing =>
      'GDTF em falta no MVR: parâmetros desconhecidos.';

  @override
  String get ma3CalcIssueUnreadable => 'GDTF ilegível.';

  @override
  String ma3CalcIssueModeMissing(String modes) {
    return 'Nenhum modo indicado no MVR. Modos do GDTF: $modes';
  }

  @override
  String ma3CalcIssueModeNotFound(String mode, String modes) {
    return 'Modo «$mode» não encontrado no GDTF. Disponíveis: $modes';
  }

  @override
  String get ma3CalcIssueModeGuessed =>
      'Sem modo no MVR: foi usado o único modo do GDTF.';

  @override
  String ma3CalcIssueModePartial(String mode) {
    return 'Modo encontrado por nome parecido: «$mode».';
  }

  @override
  String get ma3CalcIssueNoChannels => 'Este modo não tem canais DMX.';

  @override
  String ma3CalcIssueNoFunction(int count) {
    return '$count canal(is) sem função nem atributo: GDTF provavelmente incompleto.';
  }

  @override
  String ma3CalcIssueOverlap(int count) {
    return '$count canal(is) num endereço DMX já ocupado: GDTF incoerente.';
  }

  @override
  String ma3CalcIssueGaps(int count) {
    return '$count endereço(s) DMX vazio(s) no modo: canais em falta?';
  }

  @override
  String ma3CalcIssueNameMismatch(int announced, int found) {
    return 'O nome do modo indica $announced canais, o GDTF descreve $found.';
  }

  @override
  String ma3CalcIssueUnknownGeometry(int count) {
    return '$count canal(is) ligados a uma geometria inexistente.';
  }

  @override
  String get ma3CalcIssueManual => 'Valor introduzido à mão.';

  @override
  String ma3CalcMarginChip(int percent) {
    return '+$percent%';
  }

  @override
  String ma3CalcHwLine(String name, String value) {
    return '$name: $value';
  }

  @override
  String ma3CalcHowOnPcMax(String max) {
    return 'onPC: máx. $max (com qualquer hardware onPC)';
  }

  @override
  String get accountSignInCta => 'Entrar';

  @override
  String get accountSignInCtaSubtitle =>
      'O teu Pro e plugins, em todos os teus dispositivos ✨';

  @override
  String get accountAuthTitle => 'A tua conta ShowTech';

  @override
  String get accountAuthSubtitle =>
      'Entra para recuperar a tua assinatura Pro\ne participar na comunidade.';

  @override
  String get accountSignedInSnack => 'Sessão iniciada! Bem-vindo a bordo 🎉';

  @override
  String get accountSignedOutSnack => 'Sessão terminada. Até breve 👋';

  @override
  String get accountSignOutConfirmTitle => 'Terminar sessão?';

  @override
  String get accountSignOutConfirmBody =>
      'A tua assinatura Pro continua ligada à tua conta Google: volta a entrar quando quiseres para a recuperar.';

  @override
  String get videoLmCalcDistTitle => 'Distância de projeção (Ratio × Ecrã)';

  @override
  String get videoLmSizeModeLabel => 'Tamanho de ecrã conhecido';

  @override
  String get videoLmModeWidth => 'Largura';

  @override
  String get videoLmModeHeight => 'Altura';

  @override
  String get videoLmModeDiagonal => 'Diagonal';

  @override
  String get videoLmImageHeightLabel => 'Altura da imagem (m)';

  @override
  String get videoLmImageHeightHint => 'ex: 3.375';

  @override
  String get videoLmDiagonalLabel => 'Diagonal (polegadas)';

  @override
  String get videoLmDiagonalHint => 'ex: 200';

  @override
  String get videoLmRatioMinLabel => 'Rácio de projeção (ou mín. se zoom)';

  @override
  String get videoLmRatioMaxLabel => 'Rácio máx. (opcional, zoom)';

  @override
  String get videoLmRatioMaxHint => 'ex: 2.10';

  @override
  String get videoLmErrMissingSizeRatio =>
      '❌ Dados em falta: Tamanho do ecrã + Rácio.';

  @override
  String get videoLmErrSizeGt0 => '❌ O tamanho do ecrã deve ser > 0.';

  @override
  String videoLmResultImage(Object width, Object height, Object format) {
    return '📐 Imagem: $width × $height m ($format)';
  }

  @override
  String videoLmResultDistance(Object distance) {
    return '✅ Distância = $distance m';
  }

  @override
  String videoLmResultDistanceRange(Object min, Object max) {
    return '✅ Distância: de $min m a $max m';
  }

  @override
  String get videoLmDistanceNote =>
      'ℹ️ Distância medida a partir da objetiva: verifica a referência do fabricante (frente da objetiva ou chassis).';

  @override
  String get menuViewModeList => 'Vista em lista';

  @override
  String get menuViewModeGrid => 'Vista em grelha';

  @override
  String get audioRt60Subtitle => 'Tempo de reverberação de uma sala';

  @override
  String get audioSplMeterSubtitle =>
      'Mede o nível sonoro com o micro do telemóvel';

  @override
  String get audioImpedanceSubtitle => 'Altifalantes em série ou em paralelo';

  @override
  String get audioCrossoverSubtitle => 'Frequências de corte e filtros';

  @override
  String get audioDelayTimeSubtitle => 'Tempos de delay ajustados ao tempo';

  @override
  String get audioNoiseDoseSubtitle => 'Exposição sonora e duração máxima';

  @override
  String get audioInputListSubtitle =>
      'Prepara e partilha a tua lista de entradas';

  @override
  String get networkPoeSubtitle => 'Orçamento de potência PoE de um switch';

  @override
  String get networkFiberSubtitle => 'Perdas e margem de uma ligação de fibra';

  @override
  String get networkSubnetSubtitle => 'Máscara, gama de endereços e broadcast';

  @override
  String get networkArtNetAddressingSubtitle =>
      'Universo DMX ↔ Net / Sub-Net / Universo';

  @override
  String get rdmPageSubtitle => 'Deteta e configura equipamentos RDM';

  @override
  String get rfSplitterSubtitle =>
      'Perdas de inserção de divisores e combinadores';

  @override
  String get rfCableAntennaSubtitle => 'Perdas de cabo e ganho de antena';

  @override
  String get rfPlannerSubtitle => 'Plano de frequências sem intermodulação';

  @override
  String get timecodeToolConverterSubtitle =>
      'Converter timecode entre cadências';

  @override
  String get timecodeToolMathSubtitle => 'Somar, subtrair e deslocar timecode';

  @override
  String get timecodeToolDelaySubtitle => 'Converter frames e milissegundos';

  @override
  String get timecodeToolCountdownSubtitle =>
      'Contagem decrescente até um timecode';

  @override
  String get filterCorrespondenceSubtitle =>
      'Equivalências entre gamas de filtros';

  @override
  String get ma3CalcEditSheetTitle => 'EDITAR ESTE APARELHO';

  @override
  String get ma3CalcActionChangeMode => 'Mudar de modo';

  @override
  String get ma3CalcActionChangeModeSub =>
      'Manter o aparelho, escolher outro modo DMX';

  @override
  String get ma3CalcActionChangeType => 'Mudar de aparelho (GDTF)';

  @override
  String get ma3CalcActionChangeTypeSub =>
      'Substituir ou adicionar o GDTF: GDTF Share ou ficheiro';

  @override
  String get ma3CalcActionManual => 'Introduzir os parâmetros manualmente';

  @override
  String get ma3CalcActionManualSub => 'Forçar um valor por aparelho';

  @override
  String get ma3CalcNeedGdtfFirst =>
      'Sem GDTF para este aparelho: escolhe-o primeiro.';

  @override
  String get ma3CalcReplaceSheetTitle => 'Escolher o aparelho';

  @override
  String ma3CalcLineUpdated(Object label) {
    return '✅ $label atualizado';
  }

  @override
  String get audioPickAmplifier => 'Escolher um amplificador';

  @override
  String get audioPickSpeaker => 'Escolher uma coluna';

  @override
  String get audioSearchBrandModel => 'Pesquisar marca ou modelo';

  @override
  String get audioCustomPreset => 'Personalizado';

  @override
  String get audioCustomPresetHint => 'Introduzir os seus próprios valores';

  @override
  String audioModelsCount(Object count) {
    return '$count modelos';
  }

  @override
  String get audioNoResults => 'Sem resultados';

  @override
  String audioChannelsCount(Object count) {
    return '$count canais';
  }

  @override
  String audioRecommendedAmp(Object range) {
    return 'Amplificador recomendado: $range';
  }

  @override
  String audioPowerHandling(Object watts) {
    return 'Potência admissível: $watts W';
  }

  @override
  String get audioNoPowerData =>
      'Potência admissível não publicada pelo fabricante: só a impedância é verificada. Use os presets / controladores do fabricante.';

  @override
  String get audioActiveSection =>
      'Coluna ativa: um canal de amplificador por secção.';

  @override
  String audioStatusZTooLow(Object diff) {
    return '✗  Z demasiado baixa (−$diff Ω)';
  }

  @override
  String audioStatusOkPct(Object pct) {
    return '✓  OK ($pct% RMS)';
  }

  @override
  String audioStatusUnderpowered(Object pct) {
    return '↓  Pouca potência ($pct% RMS)';
  }

  @override
  String audioStatusHeadroom(Object ratio) {
    return '✓  Margem ×$ratio';
  }

  @override
  String audioStatusOverpowered(Object ratio) {
    return '✗  Potência excessiva ×$ratio';
  }

  @override
  String get audioStatusInRange => '✓  Dentro da gama do fabricante';

  @override
  String get audioStatusBelowRange => '↓  Abaixo da gama recomendada';

  @override
  String get audioStatusAboveRange => '⚠  Acima da gama recomendada';

  @override
  String get audioStatusZOkNoData => '✓  Z OK — P não publicada';

  @override
  String audioStatusLimiterRequired(Object ratio) {
    return '⚠  ×$ratio — limitador obrigatório';
  }

  @override
  String get catalogSearchHint => 'Pesquisar marca, modelo, tipo…';

  @override
  String get catalogSearchNoResults => 'Sem resultados';

  @override
  String catalogSearchResultsCount(Object count) {
    return '$count resultados';
  }

  @override
  String get soundCatalogTitle => 'Catálogo de som';

  @override
  String get soundCatalogSubtitle =>
      'Amplificadores e colunas: especificações e manuais';

  @override
  String get laserCatalogTitle => 'Catálogo laser';

  @override
  String get laserCatalogSubtitle =>
      'Projetores laser: potência, feixe, divergência';

  @override
  String get catalogAmplifiers => 'Amplificadores';

  @override
  String get catalogSpeakers => 'Colunas';

  @override
  String get catalogUseValues => 'Usar';

  @override
  String get laserPickFromCatalog => 'Escolher no catálogo';

  @override
  String get laserCatalogDisclaimer =>
      'Valores declarados pelo fabricante, não medidos.';

  @override
  String get laserCatalogMissingValues =>
      'Diâmetro ou divergência não publicados para este laser: preencha manualmente.';

  @override
  String get catalogFieldChannels => 'Canais';

  @override
  String get catalogFieldPowerPerChannel => 'Potência por canal';

  @override
  String get catalogFieldType => 'Tipo';

  @override
  String get catalogFieldSection => 'Secção';

  @override
  String get catalogFieldPowerHandling => 'Potência admissível (RMS/AES)';

  @override
  String get catalogFieldRecommendedAmp => 'Amplificador recomendado';

  @override
  String get catalogFieldOpticalPower => 'Potência ótica';

  @override
  String get catalogFieldColors => 'Cores';

  @override
  String get catalogFieldScanner => 'Scanners';

  @override
  String get catalogFieldClass => 'Classe laser';

  @override
  String get catalogFieldConsumption => 'Consumo';

  @override
  String get homeSafetyTitle => 'Segurança';

  @override
  String get homeSafetySubtitle =>
      'Planos de segurança, certificado de montagem';

  @override
  String get subscriptionCategorySafetyTitle => 'Segurança';

  @override
  String get subscriptionCategorySafetyDescription =>
      'Planos de segurança, certificado de montagem com fotos, reservas e assinatura, exportação PDF.';

  @override
  String get subscriptionHeadlineSafetySubtitle =>
      'Elabore os seus planos de segurança e certificados de montagem no local, com exportação PDF assinada.';

  @override
  String get safetyPageTitle => 'Segurança';

  @override
  String get safetySectionDocuments => 'Documentos';

  @override
  String get safetyPpspsTitle => 'Planos de segurança';

  @override
  String get safetyPpspsSubtitle =>
      'PPSPS (França), plano de segurança (Bélgica)';

  @override
  String get safetyAttestationTitle => 'Montagem conforme';

  @override
  String get safetyAttestationSubtitle => 'Controlos, reservas e assinatura';

  @override
  String get safetyComingSoon => 'Disponível numa próxima versão.';

  @override
  String get safetyLibraryTitle => 'Biblioteca';

  @override
  String safetyLibrarySummary(Object risks, Object measures, Object controls) {
    return '$risks riscos · $measures medidas · $controls pontos de controlo';
  }

  @override
  String safetyLibraryUpdated(Object date) {
    return 'Atualizado: $date';
  }

  @override
  String get safetyLibraryOffline => 'Cópia local, funciona offline';

  @override
  String get safetyDisclaimer =>
      'Ferramenta de apoio à redação. O conteúdo dos documentos continua a ser da responsabilidade da empresa signatária.';

  @override
  String get ppspsListTitle => 'Planos de segurança';

  @override
  String get ppspsNew => 'Novo plano';

  @override
  String get ppspsEmptyTitle => 'Ainda não há planos';

  @override
  String get ppspsEmptyBody =>
      'Crie o seu primeiro plano de segurança. Depois pode duplicá-lo para os próximos eventos.';

  @override
  String get ppspsChooseCountry => 'País da obra';

  @override
  String get ppspsStatusDraft => 'Rascunho';

  @override
  String get ppspsStatusFinal => 'Finalizado';

  @override
  String ppspsStepProgress(Object done, Object total) {
    return 'Passo $done/$total';
  }

  @override
  String get ppspsUntitled => 'Sem título';

  @override
  String get ppspsDuplicate => 'Duplicar';

  @override
  String get ppspsDelete => 'Eliminar';

  @override
  String get ppspsDeleteConfirm =>
      'Eliminar este plano? Esta ação é definitiva.';

  @override
  String get ppspsCancel => 'Cancelar';

  @override
  String get ppspsSave => 'Guardar';

  @override
  String get ppspsNext => 'Seguinte';

  @override
  String get ppspsPrevious => 'Anterior';

  @override
  String get ppspsStepProject => 'Projeto';

  @override
  String get ppspsStepWorkers => 'Intervenientes';

  @override
  String get ppspsStepRisks => 'Riscos';

  @override
  String get ppspsStepEmergency => 'Emergência';

  @override
  String get ppspsStepExport => 'Exportar';

  @override
  String get ppspsFieldEventName => 'Nome do evento';

  @override
  String get ppspsFieldVenue => 'Local';

  @override
  String get ppspsFieldAddress => 'Morada';

  @override
  String get ppspsFieldOrganizer => 'Organizador (dono da obra)';

  @override
  String get ppspsFieldCoordinator => 'Coordenador de segurança';

  @override
  String get ppspsSectionPhases => 'Fases e datas';

  @override
  String get ppspsPhaseMontage => 'Montagem';

  @override
  String get ppspsPhaseExploitation => 'Exploração';

  @override
  String get ppspsPhaseDemontage => 'Desmontagem';

  @override
  String get ppspsPhaseNotSet => 'Não previsto';

  @override
  String get ppspsPhaseFilterAll => 'Todas';

  @override
  String get ppspsSectionCompany => 'A sua empresa';

  @override
  String get ppspsFieldCompanyName => 'Denominação social';

  @override
  String get ppspsFieldCompanyActivity => 'Atividade na obra';

  @override
  String get ppspsFieldResponsible => 'Responsável no local';

  @override
  String get ppspsFieldPhone => 'Telefone';

  @override
  String get ppspsFieldCompany => 'Empresa';

  @override
  String get ppspsFieldTrade => 'Ofício';

  @override
  String get ppspsFieldContact => 'Contacto';

  @override
  String get ppspsFieldHeadcount => 'Número de pessoas';

  @override
  String get ppspsAddWorker => 'Adicionar um interveniente';

  @override
  String get ppspsWorkersEmpty =>
      'Adicione as empresas e equipas presentes na obra.';

  @override
  String ppspsWorkersTotal(Object count) {
    return 'Total: $count pessoas';
  }

  @override
  String get ppspsMeasuresTitle => 'Medidas de prevenção';

  @override
  String get ppspsMeasureCollective => 'Coletiva';

  @override
  String get ppspsMeasureIndividual => 'Individual';

  @override
  String get ppspsMeasureOrganisational => 'Organizacional';

  @override
  String ppspsMeasureCount(Object count) {
    return '$count medidas';
  }

  @override
  String get ppspsAddCustomMeasure => 'Adicionar uma medida';

  @override
  String get ppspsCustomMeasureHint => 'Outra medida própria desta obra';

  @override
  String ppspsRisksSummary(Object risks, Object measures) {
    return '$risks riscos · $measures medidas';
  }

  @override
  String get ppspsSectionNumbers => 'Números de emergência';

  @override
  String get ppspsSectionHospital => 'Hospital mais próximo';

  @override
  String get ppspsFieldHospitalName => 'Nome do hospital';

  @override
  String get ppspsSectionOnSite => 'No local';

  @override
  String get ppspsFieldFirstAiders => 'Socorristas presentes';

  @override
  String get ppspsFieldAssemblyPoint => 'Ponto de encontro';

  @override
  String get ppspsFieldEquipment =>
      'Material de emergência (extintores, desfibrilhador…)';

  @override
  String get ppspsCritical => 'altos';

  @override
  String get ppspsMedium => 'médios';

  @override
  String get ppspsLow => 'baixos';

  @override
  String get ppspsExportReady => 'Todos os passos estão concluídos.';

  @override
  String get ppspsExportMissing => 'Por completar';

  @override
  String get ppspsExportPdf => 'Exportar em PDF';

  @override
  String get ppspsMarkFinal => 'Marcar como finalizado';

  @override
  String get safetyCountryFR => 'França';

  @override
  String get safetyCountryBE => 'Bélgica';

  @override
  String get safetyCountryUK => 'Reino Unido';

  @override
  String get safetyCountryLU => 'Luxemburgo';

  @override
  String get safetyCountryDE => 'Alemanha';

  @override
  String get safetyCountryNL => 'Países Baixos';

  @override
  String get ppspsExportLanguages => 'Idiomas do documento';

  @override
  String get ppspsExportLanguagesHint =>
      'É criado um PDF para cada idioma selecionado.';

  @override
  String ppspsExportPdfMulti(Object count) {
    return 'Exportar $count PDF';
  }

  @override
  String get ppspsPhaseOrderError =>
      'As datas não estão pela ordem: a montagem deve preceder a exploração e depois a desmontagem.';

  @override
  String get ppspsFindHospital =>
      'Procurar o hospital mais próximo';

  @override
  String get ppspsFindHospitalSearching =>
      'A procurar…';

  @override
  String get ppspsFindHospitalNeedAddress =>
      'Indique primeiro o local ou a morada do evento (passo Projeto).';

  @override
  String get ppspsFindHospitalNoPlace =>
      'A morada do evento não foi encontrada. Verifique-a no passo Projeto ou introduza o hospital manualmente.';

  @override
  String get ppspsFindHospitalError =>
      'Pesquisa indisponível de momento (ligação?). Introduza o hospital manualmente.';

  @override
  String get ppspsFindHospitalNone =>
      'Nenhum hospital encontrado num raio de 30 km. Introduza-o manualmente.';

  @override
  String get ppspsFindHospitalTitle =>
      'Hospitais próximos';

  @override
  String get ppspsFindHospitalVerify =>
      'Verifique se o hospital escolhido tem urgências abertas durante o evento.';

  @override
  String ppspsDistanceKm(Object km) {
    return '$km km';
  }

  @override
  String get ppspsHospitalEmergency =>
      'Urgências';

  @override
  String get ppspsOsmAttribution =>
      'Dados © colaboradores do OpenStreetMap';

  @override
  String get ppspsSectionEquipment =>
      'Material de emergência';

  @override
  String get ppspsFieldEquipmentDetails =>
      'Detalhes (localização, quantidades, outro material)';

  @override
  String get ppspsSectionSignatures =>
      'Assinaturas';

  @override
  String get ppspsSignAuthor =>
      'Elaborado por';

  @override
  String get ppspsSignCoordinator =>
      'Visto do coordenador (opcional)';

  @override
  String get ppspsNotSigned =>
      'Ainda não assinado';

  @override
  String ppspsSignedOn(Object date) {
    return 'Assinado em $date';
  }

  @override
  String get ppspsSignButton =>
      'Assinar';

  @override
  String get ppspsSignAgain =>
      'Refazer';

  @override
  String get ppspsSignRemove =>
      'Remover a assinatura';

  @override
  String get ppspsSignName =>
      'Nome do signatário';

  @override
  String get ppspsSignHint =>
      'Assine com o dedo no quadro branco.';

  @override
  String get ppspsSignClear =>
      'Apagar';

  @override
  String get ppspsSignValidate =>
      'Confirmar a assinatura';
}
