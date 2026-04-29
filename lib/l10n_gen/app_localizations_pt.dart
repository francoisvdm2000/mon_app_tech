// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get aboutArtNetSubtitle =>
      'Universo DMX em Ethernet/UDP, nós, broadcast vs. unicast.\nLimites reais, estabilidade da rede, RDM em função do hardware.';

  @override
  String get aboutArtNetTitle =>
      'Art-Net - DMX sobre IP (nós, unicast/broadcast)';

  @override
  String get aboutCablingFiberSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distâncias típicas, espetáculo de boas práticas.';

  @override
  String get aboutCablingFiberTitle =>
      'Rede - RJ45 / Fibra / velocidades e comprimentos';

  @override
  String get aboutComputingSubtitle =>
      'Velocidades úteis, versões, limites reais, armadilhas de marketing.';

  @override
  String get aboutComputingTitle => 'IT - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutDmxSubtitle =>
      'Universo, endereços, quadros, cablagem RS-485, terminação, erros de campo.\nInclui diagramas e lista de controlo.';

  @override
  String get aboutDmxTitle => 'DMX';

  @override
  String get aboutElectricitySubtitle =>
      'Conectores, mono/tri, painéis de kW rápidos (16A→400A), armadilhas de campo.';

  @override
  String get aboutElectricityTitle => 'Elétrico - Schuko / P17 / potências';

  @override
  String get aboutIpBasicsSubtitle =>
      'Compreender o IP, máscara, gateway, DHCP vs estático.\nExemplos concretos (2.x, 10.x, 192.168.x) + lista de controlo.';

  @override
  String get aboutIpBasicsTitle => 'Bases IP';

  @override
  String get aboutLightNetworkSubtitle =>
      'Arquitetura simples e robusta para Art-Net/sACN.\nVLAN, IGMP snooping/query, Wi-Fi (jitter), comutadores, diagramas + lista de controlo.';

  @override
  String get aboutLightNetworkTitle =>
      'Rede leve - VLAN, IGMP, Wi-Fi vs. com fios';

  @override
  String get aboutSacnSubtitle =>
      'Norma DMX sobre IP orientada para a rede profissional.\nMulticast/unicast, IGMP snooping/query, prioridades multi-fonte.';

  @override
  String get aboutSacnTitle => 'sACN';

  @override
  String get aboutVideoSubtitle =>
      'Escolha de acordo com a latência, fiabilidade, cablagem, LAN vs WAN.\nTabelas + diagrama.';

  @override
  String get aboutVideoTitle => 'Vídeo';

  @override
  String get appTitle => 'A minha aplicação tecnológica';

  @override
  String catalogDmxModeItem(Object channels, Object name) {
    return '$name - $channels canais';
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
  String get catalogInfoPower => 'Potência';

  @override
  String get catalogInfoWeight => 'Peso';

  @override
  String catalogLastUpdate(Object date) {
    return 'Última atualização: $date';
  }

  @override
  String catalogManufacturerTitle(Object count) {
    return 'Construtor ($count)';
  }

  @override
  String catalogModelTitle(Object count) {
    return 'Modelo ($count)';
  }

  @override
  String get catalogNotProvided => 'Nenhuma informação';

  @override
  String get catalogOpenDmxChart => 'Abrir a tabela DMX';

  @override
  String get catalogOpenManual => 'Abrir o manual';

  @override
  String get catalogResetTooltip => 'Reiniciar';

  @override
  String catalogSyncError(Object message) {
    return 'Erro: $message';
  }

  @override
  String catalogSyncFailed(Object reason) {
    return 'Falha de sincronização: $reason';
  }

  @override
  String get catalogSyncFailedUnknown =>
      'Falha de sincronização (motivo desconhecido).';

  @override
  String catalogTypeTitle(Object count) {
    return 'Tipo ($count)';
  }

  @override
  String get catalogUpdateTooltip => 'Atualização';

  @override
  String get catalogUpdated => 'Catálogo atualizado.';

  @override
  String get commonCalculate => 'Calcular';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonCopyResultTooltip => 'Copiar o resultado';

  @override
  String get commonDash => '-';

  @override
  String get commonNone => 'Sem registo';

  @override
  String get commonOk => 'OK';

  @override
  String get commonOkWithCheck => 'OK ✅';

  @override
  String get commonRename => 'Mudar o nome';

  @override
  String get commonReset => 'Reiniciar';

  @override
  String get commonSave => 'Registo';

  @override
  String get commonSearch => 'Pesquisar';

  @override
  String get commonTooLowWithCross => 'Demasiado baixo ❌';

  @override
  String get commonUnitMeter => 'm';

  @override
  String get consentsReset => 'Consentimentos reiniciados.';

  @override
  String get dipSwitchAddressHint => 'Ex: 1 a 512';

  @override
  String get dipSwitchAddressLabel => 'Endereço DMX';

  @override
  String get dipSwitchChannelUnit => 'canal';

  @override
  String get dipSwitchEndOfUniverseWarning =>
      'Aviso: chegámos ao fim do universo DMX.';

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
  String get dipSwitchNextAddressButton => 'Endereço';

  @override
  String get dipSwitchOffLabel => 'DESLIGADO';

  @override
  String get dipSwitchOnLabel => 'ON';

  @override
  String get dipSwitchResetTooltip => 'Reiniciar';

  @override
  String dipSwitchResultAddressLine(Object address) {
    return 'Endereço : $address';
  }

  @override
  String get dipSwitchResultAddressNotProvided => 'Endereço não indicado';

  @override
  String dipSwitchResultBinaryValueLine(Object binary) {
    return 'Binário: $binary';
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
      'Desloque-se para baixo para ver todos os interruptores.';

  @override
  String get dipSwitchSectionTitle => 'Interruptores';

  @override
  String get dipSwitchSummaryTitle => 'Resumo';

  @override
  String dipSwitchSwitchLabel(Object index) {
    return 'Comutador $index';
  }

  @override
  String get dipSwitchUseAddressMinusOneLabel =>
      'Utilizar o modo de endereço - 1';

  @override
  String get disclaimerAccept => 'Aceito';

  @override
  String get disclaimerCertify => 'Certifico que li e aceitei estas condições.';

  @override
  String get disclaimerText =>
      'APENAS PARA FINS INFORMATIVOS\n\nOs cálculos fornecidos por esta aplicação (vídeo, luz, laser) têm um carácter meramente informativo.\nNão substituem, em caso algum, os cálculos :\n- cálculos certificados,\n- estudos técnicos\n- normas oficiais em vigor,\n- ou a validação por um profissional qualificado.\n\nRESPONSABILIDADE\nO editor desta aplicação não pode ser responsabilizado por erros de cálculo, omissões, danos materiais, ferimentos pessoais ou qualquer incidente que ocorra durante a instalação, o funcionamento ou a utilização desta aplicação,\ndanos pessoais ou qualquer incidente resultante da instalação, do funcionamento ou da utilização do equipamento.\n\nVÍDEO E PROJECÇÃO\nOs resultados (tamanhos, rácios, brilho, sobreposições, etc.) baseiam-se em modelos teóricos e podem variar consoante :\nótica, zoom, uniformidade, ambiente de iluminação, suporte, definições, etc.\nVerificar sempre a documentação oficial do fabricante.\n\nLUZ\nOs cálculos são indicativos e não têm em conta todas as condições reais (tolerâncias, perdas ópticas,\ndegradação das fontes, normas locais, condições ambientais, etc.).\n\nLASER - SEGURANÇA\nOs cálculos do NOHD, do SZED e do CZED baseiam-se em pressupostos normalizados e em limiares teóricos.\nEm particular, não têm em conta\n- os instrumentos ópticos (binóculos, câmaras, telescópios, etc.)\n- as condições atmosféricas (nevoeiro, chuva, poeira, etc.)\n- reflexos imprevistos, utilização incorrecta, configurações específicas.\nA utilização de um sistema laser implica a responsabilidade direta do operador e uma análise de risco adequada.\n\nACEITAÇÃO DOS RISCOS\nAo utilizar esta aplicação, o utilizador reconhece :\n- que tem conhecimento das regras de segurança aplicáveis\n- que é o único responsável pelas suas instalações\n- assume toda a responsabilidade pelos riscos associados à utilização do equipamento (vídeo, luz, laser),\n- verificar sistematicamente os dados com os manuais oficiais dos fabricantes.';

  @override
  String get disclaimerTitle =>
      '⚠️ AVISO LEGAL E DECLARAÇÃO DE EXONERAÇÃO DE RESPONSABILIDADE';

  @override
  String get homeLaserSubtitle =>
      'Cálculos e segurança dos lasers (consentimento necessário para cada entrada).';

  @override
  String get homeLaserTitle => 'Laser';

  @override
  String get homeLightSubtitle =>
      'Tamanho da projeção, dip-switch DMX, fotometria, catálogo, patch DMX.';

  @override
  String get homeLightTitle => 'Luz';

  @override
  String get homeReferencesSubtitle =>
      'DMX / rede / vídeo: folhas de dados e referências.';

  @override
  String get homeReferencesTitle => 'Referências';

  @override
  String get homeTitle => 'Início';

  @override
  String get homeVideoSubtitle =>
      'Objetiva e medição, luminosidade, multiprojector, LED e padrões de teste.';

  @override
  String get homeVideoTitle => 'Vídeo';

  @override
  String get language => 'Língua';

  @override
  String get languageSystem => 'Sistema (automático)';

  @override
  String get languageSystemCurrent => 'Idioma do telefone';

  @override
  String get laserAdviceFullPower => 'Potência total autorizada (100%)';

  @override
  String laserAdviceMaxRecommended(Object percent) {
    return 'Potência máxima recomendada: $percent';
  }

  @override
  String get laserConsentCheckboxLabel => 'Aceito e compreendo os riscos.';

  @override
  String get laserConsentContinue => 'Continuar';

  @override
  String get laserConsentText =>
      'ACESSO À SECÇÃO DE LASER\n\nA parte LASER desta aplicação diz respeito aos cálculos de segurança (por exemplo, NOHD, SZED, CZED).\nEstes cálculos são indicativos e não substituem :\n- uma análise de risco,\n- as normas em vigor\n- os procedimentos operacionais\n- ou a validação por uma pessoa qualificada.\n\nIMPORTANTE\n- Risco de lesões oculares/pele em caso de utilização incorrecta.\n- O cálculo pode ser incorreto se os parâmetros introduzidos estiverem incompletos ou incorrectos, ou se o contexto real for diferente (ótica, condições atmosféricas, reflexos, alinhamento, etc.),\n  condições atmosféricas, reflexos, alinhamento, etc.).\n- A instalação, o funcionamento e a conformidade são da exclusiva responsabilidade do operador.\n\nAo validar, o utilizador confirma que :\n- compreende os riscos,\n- respeita as regras de segurança aplicáveis\n- assume toda a responsabilidade em caso de negligência ou de utilização incorrecta.';

  @override
  String get laserConsentTitle => '🔴 CONSENTIMENTO DO LASER (OBRIGATÓRIO)';

  @override
  String get laserDiameterHint => 'ex: 3.0';

  @override
  String get laserDiameterLabel => 'Diâmetro de saída (mm)';

  @override
  String get laserDisclaimerShort =>
      'Cálculo indicativo. Não substitui uma análise de segurança do laser.';

  @override
  String get laserDivergenceHint => 'ex: 1.2';

  @override
  String get laserDivergenceLabel => 'Divergência (mrad)';

  @override
  String get laserInputsTitle => 'Entradas';

  @override
  String get laserInvalidInputs =>
      'Introduza uma potência, divergência e diâmetro válidos.';

  @override
  String get laserNameUpdated => 'Nome atualizado.';

  @override
  String get laserNormativeParamsBody =>
      'MEP para a distância nominal de perigo para os olhos (NOHD): 25,4 W/m².\n(Norma IEC 60825-1, edição 3.0)\n\nMEP para a distância de exposição da zona sensível (SZED): 1 W/m².\n(Norma ANSI Z136.6)\n\nMPE para a distância de exposição da zona crítica (CZED): 0,05 W/m² (norma ANSI Z136.6)\n(Norma ANSI Z136.6)';

  @override
  String get laserNormativeParamsTitle => 'Parâmetros de segurança';

  @override
  String get laserPowerHint => 'por exemplo: 5000';

  @override
  String get laserPowerLabel => 'Potência (mW)';

  @override
  String get laserPresetAdded => 'Registo adicionado.';

  @override
  String get laserPresetDeleted => 'Registo eliminado.';

  @override
  String laserPresetSubtitle(Object diam, Object div, Object p) {
    return 'P: $p mW - Div: $div mrad - Ø: $diam mm';
  }

  @override
  String get laserProjectorNameLabel => 'Nome do projetor';

  @override
  String get laserRenameProjectorTitle => 'Mudar o nome do projetor';

  @override
  String get laserSafetyResultsTitle => 'Resultados de segurança';

  @override
  String get laserSaveCurrentProjector => 'Registar este projetor';

  @override
  String get laserSaveProjectorTitle => 'Registar um projetor';

  @override
  String get laserSavedProjectorsTitle => 'Projectores registados';

  @override
  String get laserSearchHint => 'Por exemplo, \"RGB 5W';

  @override
  String get laserTargetDistanceHint => 'ex: 10';

  @override
  String get laserTargetDistanceLabel => 'Distância do alvo (m)';

  @override
  String get laserZoneCzedDesc => 'Zona crítica';

  @override
  String get laserZoneNohdDesc => 'Perigo para os olhos';

  @override
  String get laserZoneSzedDesc => 'Zona sensível';

  @override
  String get legalNotices => 'Informação jurídica';

  @override
  String get lightCatalogDescription =>
      'Seleção por fabricante, tipo e produto, com informações e manual.';

  @override
  String get lightCatalogTitle => 'Catálogo';

  @override
  String get lightDisclaimerShort =>
      'Ferramentas indicativas. Verificar sempre a documentação do fabricante.';

  @override
  String get lightDmxSwitchDescription =>
      'Conversão indicativa entre o endereço DMX e os interruptores, com navegação por intervalos.';

  @override
  String get lightDmxSwitchTitle => 'Interruptor dip DMX';

  @override
  String get lightPatchDescription => 'Importar e visualizar um ficheiro MVR.';

  @override
  String get lightPatchTitle => 'Patch DMX';

  @override
  String get lightPhotometryDescription =>
      'Conversões indicativas entre lux, candela e lúmen, com distância e ângulo.';

  @override
  String get lightPhotometryTitle => 'Fotometria';

  @override
  String get lightProjectionDescription =>
      'Cálculo indicativo do tamanho do ponto com base no ângulo, distância e diâmetro.';

  @override
  String get lightProjectionTitle => 'Tamanho da projeção';

  @override
  String get menuTitle => 'Menu';

  @override
  String get mireBlendLabel => 'MISTURAR';

  @override
  String get mireDash => '-';

  @override
  String get mireErrInvalidOverlap => 'Sobreposição inválida (0 a 99,9).';

  @override
  String get mireErrInvalidProjectors =>
      'Número inválido de projectores (N > 0).';

  @override
  String get mireErrInvalidWHpx => 'Largura/altura inválida (px).';

  @override
  String get mireExportPng => 'Exportar PNG';

  @override
  String get mireHeightPxHint => 'Por exemplo, 1080';

  @override
  String get mireHeightPxHintMapping => 'ex: 2160';

  @override
  String get mireHeightPxLabel => 'Altura (px)';

  @override
  String get mireLedErrTileCm => 'Introduzir o azulejo cm (largura/altura >0).';

  @override
  String get mireLedErrTilePx =>
      'Introduzir o px do mosaico (largura/altura >0).';

  @override
  String get mireLedErrTilesXY => 'Introduzir os mosaicos X/Y (>0).';

  @override
  String get mireLedParamsTitle => 'Definições de parede LED';

  @override
  String mireLedPitchComputed(Object pitch) {
    return 'Passo calculado: $pitch';
  }

  @override
  String get mireLedSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedSubtitleGridLabels => 'Grelha + marcadores + círculos';

  @override
  String get mireLedSubtitlePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedSubtitleUniformity => 'Uniformidade + círculos';

  @override
  String get mireLedTileHcmLabel => 'Altura do ladrilho (cm)';

  @override
  String get mireLedTileHpxLabel => 'Altura do mosaico (px)';

  @override
  String get mireLedTileWcmLabel => 'Largura do ladrilho (cm)';

  @override
  String get mireLedTileWpxLabel => 'Largura do mosaico (px)';

  @override
  String get mireLedTilesIdTitle => 'LED / ID TILES';

  @override
  String get mireLedTilesXLabel => 'Ladrilhos horizontais (X)';

  @override
  String get mireLedTilesYLabel => 'Ladrilhos verticais (Y)';

  @override
  String get mireLedTitle => 'LED / MIRE';

  @override
  String get mireLedTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireLedTypeGridLabels => 'Grelha + marcadores + círculos';

  @override
  String get mireLedTypePixelPerfect => 'Pixel perfect + círculos';

  @override
  String get mireLedTypeTilesId => 'ID dos azulejos (número + cores)';

  @override
  String get mireLedTypeUniformity => 'Uniformidade + círculos';

  @override
  String mireLedWallResolution(Object h, Object w) {
    return 'Resolução da parede: $w × $h px';
  }

  @override
  String get mireLedWarnPitchOutOfRange =>
      '⚠️ Passo calculado fora do intervalo (0,5-20 mm). Verificar Tile cm / px.';

  @override
  String get mireLedWarnPitchXNotY =>
      '⚠️ Passo X ≠ Passo Y (mosaico não homogéneo). Verificar as dimensões cm e px.';

  @override
  String get mireMappingSectionTitle =>
      'Padrão de teste de mapeamento de multiprojectores';

  @override
  String mireMappingSubtitlePattern(Object n, Object orient, Object percent) {
    return 'N=$n - Sobreposição $percent% - $orient';
  }

  @override
  String get mireMappingTypeBlendRamps => 'Misturar rampas';

  @override
  String get mireMappingTypeCombo => 'Combo (zonas + sobreposição + mistura)';

  @override
  String get mireMappingTypeLabel => 'Mapeamento de tipos';

  @override
  String get mireMappingTypeZonesOverlap => 'Zonas + sobreposição';

  @override
  String get mireOrientationHorizontal => 'Horizontal';

  @override
  String get mireOrientationLabel => 'Orientação';

  @override
  String get mireOrientationVertical => 'Vertical';

  @override
  String get mireOverlapHint => 'ex: 10.0';

  @override
  String get mireOverlapLabel => 'Sobreposição (%)';

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
  String get mireProjectorsNHint => 'ex: 2';

  @override
  String get mireProjectorsNLabel => 'Número de projectores (N)';

  @override
  String get mireSimpleSectionTitle => 'Padrão de teste de ecrã único';

  @override
  String get mireSimpleSubtitleCheckerboard => 'Tabuleiro de xadrez + círculos';

  @override
  String get mireSimpleSubtitleColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleSubtitleComboAll =>
      'Grelha + cofre + 2 barras centradas + círculos';

  @override
  String get mireSimpleSubtitleGridSafe => 'Grelha + cofre + círculos';

  @override
  String get mireSimpleSubtitleUniformity => 'Uniformidade + círculos';

  @override
  String get mireSimpleTypeCheckerboard => 'Tabuleiro de xadrez + círculos';

  @override
  String get mireSimpleTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireSimpleTypeComboAll =>
      'Combo (grelha + círculos + 2 barras centradas)';

  @override
  String get mireSimpleTypeGridSafe => 'Grelha + cofre + círculos';

  @override
  String get mireSimpleTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireTileMissingPx => 'Introduzir Tile (px) para a numeração.';

  @override
  String mireTilesSubtitleBase(Object nx, Object ny, Object th, Object tw) {
    return 'Azulejo ${tw}x$th px - Grelha $nx x $ny';
  }

  @override
  String mireTilesSubtitlePitchEq(Object pitch) {
    return 'Passo ~ $pitch mm';
  }

  @override
  String mireTilesSubtitlePitchXY(Object px, Object py) {
    return 'Passo X $px - Y $py mm';
  }

  @override
  String mireTilesSubtitleTilePhys(Object hcm, Object wcm) {
    return 'Azulejo $wcm×$hcm cm';
  }

  @override
  String mireTilesSubtitleWallPhys(Object hm, Object wm) {
    return 'Parede ~ $wm×$hm m';
  }

  @override
  String get mireTypeLabel => 'Tipo de visão';

  @override
  String get mireVideoComboTitle => 'VÍDEO / VISÃO COMBINADA';

  @override
  String get mireVideoMappingSectionTitle =>
      'Padrão de teste de mapeamento de multiprojectores';

  @override
  String get mireVideoMappingTitle => 'MAPEAMENTO DE PADRÕES DE VÍDEO / TESTE';

  @override
  String get mireVideoSimpleSectionTitle => 'Padrão de teste de ecrã único';

  @override
  String get mireVideoSimpleTitle => 'VÍDEO / PADRÃO DE TESTE ÚNICO';

  @override
  String get mireVideoTypeCheckerboard => 'Tabuleiro de xadrez + círculos';

  @override
  String get mireVideoTypeColorBars => 'Barras + rampas + círculos';

  @override
  String get mireVideoTypeCombo =>
      'Combo (grelha + círculos + 2 barras centradas)';

  @override
  String get mireVideoTypeGridSafe => 'Grelha + cofre + círculos';

  @override
  String get mireVideoTypeUniformity => 'Uniformidade + círculos';

  @override
  String get mireWallNotMultipleOfTiles => 'PAREDE DE AZULEJOS NÃO MÚLTIPLA';

  @override
  String get mireWidthPxHint => 'por exemplo: 1920';

  @override
  String get mireWidthPxHintMapping => 'ex: 3840';

  @override
  String get mireWidthPxLabel => 'Largura (px)';

  @override
  String patchAddressLabel(Object address) {
    return 'Endereço : $address';
  }

  @override
  String patchChannelsUsed(Object count) {
    return 'Canais utilizados: $count / 512';
  }

  @override
  String get patchConflictError => 'Endereços em conflito (sobrepostos).';

  @override
  String get patchConflictShort => 'Conflito';

  @override
  String patchConflicts(Object count) {
    return 'Conflitos : $count';
  }

  @override
  String get patchEditChannelsLabel => 'Canais';

  @override
  String get patchEditHint => 'Verifica o modo e o número de canais.';

  @override
  String get patchEditModeLabel => 'Modo';

  @override
  String get patchEditTitle => 'Edição';

  @override
  String get patchEmptyUniverse => 'Não há máquinas neste universo.';

  @override
  String patchFixturesCount(Object count) {
    return 'Máquinas : $count';
  }

  @override
  String get patchHomeDisclaimer =>
      'Os resultados são indicativos. Verificar sempre com a consola.';

  @override
  String get patchHomeImportMvrDescription =>
      'Analisar um ficheiro MVR e carregar o patch como referência.';

  @override
  String get patchHomeImportMvrTitle => 'Importar um MVR';

  @override
  String get patchHomeTitle => 'Patch DMX';

  @override
  String get patchHomeViewPatchDescription => 'Lista e conflitos por universo.';

  @override
  String get patchHomeViewPatchTitle => 'Ver a correção';

  @override
  String get patchHubOpenGridButton => 'Grelha aberta';

  @override
  String get patchHubOpenMvrButton => 'Abrir MVR';

  @override
  String get patchHubStateEmpty => 'Não há referências carregadas.';

  @override
  String patchHubStateLoaded(Object count) {
    return 'Carregado: $count universe';
  }

  @override
  String get patchHubStateTitle => 'Estado';

  @override
  String get patchHubTitle => 'Patch de hub';

  @override
  String get patchHubWorksiteBody =>
      'Importar um MVR ou consultar a grelha de ocupação.';

  @override
  String get patchHubWorksiteTitle => 'Sítio';

  @override
  String get patchInvalidChannelCount => 'Número inválido de canais.';

  @override
  String get patchIssueInvalidChannelCount =>
      'O número de canais deve ser maior ou igual a 1.';

  @override
  String get patchIssueInvalidStartAddress =>
      'O endereço DMX deve estar compreendido entre 1 e 512.';

  @override
  String get patchIssueInvalidUniverse =>
      'O universo deve ser maior ou igual a 1.';

  @override
  String get patchIssueRangeExceedsUniverse =>
      'A gama de canais ultrapassa os 512 neste universo.';

  @override
  String get patchIssueUnknown => 'Erro desconhecido.';

  @override
  String get patchListTitle => 'Lista';

  @override
  String get patchManualDisabledBody =>
      'O patch é só de leitura quando é carregada uma referência MVR.';

  @override
  String get patchManualDisabledTitle => 'Desligado';

  @override
  String get patchManualTitle => 'Remendo manual';

  @override
  String patchModeLabel(Object mode) {
    return 'Modo : $mode';
  }

  @override
  String get patchMvrButtonAnalyzing => 'Análise...';

  @override
  String get patchMvrButtonLoadAsReference => 'Carregar como referência';

  @override
  String get patchMvrButtonPickFile => 'Escolher um ficheiro';

  @override
  String get patchMvrClearTooltip => 'Eliminar';

  @override
  String get patchMvrColAddress => 'Endereço';

  @override
  String get patchMvrColChannels => 'Canais';

  @override
  String get patchMvrColId => 'ID';

  @override
  String get patchMvrColName => 'Nome';

  @override
  String get patchMvrColUniverse => 'Universo';

  @override
  String get patchMvrColumnsHint =>
      'Colunas: ID, Nome, Universo, Endereço, Canais';

  @override
  String get patchMvrFileCardHelp =>
      'Seleciona um ficheiro .mvr (ZIP) para analisar o patch.';

  @override
  String get patchMvrFileCardTitle => 'Ficheiro';

  @override
  String get patchMvrFilterAllUniverses => 'Todos os universos';

  @override
  String get patchMvrFilterUniverseLabel => 'Filtrar por universo';

  @override
  String get patchMvrModeNotProvided => 'Modo não especificado';

  @override
  String get patchMvrOrderAsc => 'Crescente';

  @override
  String get patchMvrOrderDesc => 'Descendente';

  @override
  String get patchMvrOrderLabel => 'Encomendar';

  @override
  String get patchMvrSortAddress => 'Endereço';

  @override
  String get patchMvrSortByLabel => 'Ordenar por';

  @override
  String get patchMvrSortChannels => 'Canais';

  @override
  String get patchMvrSortId => 'ID';

  @override
  String get patchMvrSortName => 'Nome';

  @override
  String get patchMvrSortUniverse => 'Universo';

  @override
  String get patchMvrSortUniverseThenAddress => 'O universo dirige-se então a';

  @override
  String get patchMvrStatusCleared => 'Referência suprimida.';

  @override
  String get patchMvrStatusEmptyBytes => 'Ficheiro vazio.';

  @override
  String get patchMvrStatusExtractingZip => 'Extrair o ZIP...';

  @override
  String patchMvrStatusFilePickFailed(Object reason) {
    return 'Não foi possível selecionar o ficheiro: $reason';
  }

  @override
  String patchMvrStatusFixturesFound(int count, int resolved) {
    return 'Máquinas encontradas: $count (multi-canal: $resolved).';
  }

  @override
  String get patchMvrStatusLoadingGdtf => 'Carregando GDTFs...';

  @override
  String get patchMvrStatusNoContentToLoad => 'Não há conteúdo para carregar.';

  @override
  String get patchMvrStatusNoFileSelected => 'Não há ficheiros selecionados.';

  @override
  String get patchMvrStatusNoUsableFixtures =>
      'Não foram encontradas máquinas utilizáveis.';

  @override
  String patchMvrStatusParseError(Object message) {
    return 'Erro de análise: $message';
  }

  @override
  String get patchMvrStatusParsingContent => 'Análise de conteúdo...';

  @override
  String patchMvrStatusReferenceLoaded(int count, int skipped, int footprints) {
    return 'Referência carregada: $count máquina(s) (ignorada: $skipped, pegadas GDTF: $footprints).';
  }

  @override
  String patchMvrStatusRestored(Object count) {
    return 'Catering : $count de máquinas';
  }

  @override
  String get patchMvrStatusSceneXmlNotFound =>
      'scene.xml não encontrado no MVR.';

  @override
  String get patchMvrStatusSelectingFile => 'Seleção de ficheiros...';

  @override
  String patchMvrStatusUnsupportedFile(Object ext) {
    return 'Ficheiro não suportado: $ext';
  }

  @override
  String get patchMvrSummaryTitle => 'Resumo';

  @override
  String get patchMvrTitle => 'Importação MVR';

  @override
  String patchMvrUniverseItem(Object universe) {
    return 'Universo $universe';
  }

  @override
  String get patchPageTitle => 'Remendo';

  @override
  String get patchSummaryTitle => 'Resumo';

  @override
  String get patchUniverseAppBarTitle => 'Remendo';

  @override
  String patchUniverseConflictCount(Object count) {
    return 'Conflitos : $count canal(is)';
  }

  @override
  String get patchUniverseGridLimitedByWidth =>
      'Limitado pela largura do ecrã.';

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
  String get patchUniverseLegendFree => 'Grátis';

  @override
  String get patchUniverseLegendOccupied => 'Ocupado';

  @override
  String patchUniverseOccupantLine(
      Object channels, Object end, Object fixture, Object mode, Object start) {
    return '- $fixture\n  $mode - $channels channel(aux)\n  $start → $end';
  }

  @override
  String patchUniverseOccupiedCount(Object count) {
    return 'Ocupado : $count / 512';
  }

  @override
  String patchUniversePopupHeader(
      Object address, Object state, Object universe) {
    return 'Universo $universe - Endereço $address\nEstado : $state';
  }

  @override
  String get patchUniversePopupManyOccupants =>
      'Várias máquinas ocupam este canal.';

  @override
  String patchUniversePopupMore(Object count) {
    return '... e $count outro(s).';
  }

  @override
  String get patchUniversePopupTitleConflict => 'Conflito';

  @override
  String get patchUniversePopupTitleFree => 'Canal gratuito';

  @override
  String get patchUniversePopupTitleOccupied => 'Canal ocupado';

  @override
  String get patchUniverseReferenceNone => 'Nenhuma referência carregada';

  @override
  String get patchUniverseReferenceReadOnly => 'Só de leitura (do MVR)';

  @override
  String get patchUniverseReferenceTitle => 'Referência';

  @override
  String get patchUniverseResetConfirm => 'Reiniciar';

  @override
  String get patchUniverseResetContent =>
      'Isto elimina o patch carregado do MVR para a aplicação.\nNenhum dado no ficheiro é modificado.';

  @override
  String get patchUniverseResetTitle => 'Repor a referência?';

  @override
  String get patchUniverseResetTooltip => 'Repor a referência';

  @override
  String get patchUniverseSelected => 'Universo selecionado';

  @override
  String get patchUniverseStateConflict => 'Conflito';

  @override
  String get patchUniverseStateFree => 'Grátis';

  @override
  String get patchUniverseStateOccupied => 'Ocupado';

  @override
  String get patchUniverseTapHint =>
      'Toque numa caixa para visualizar os detalhes.';

  @override
  String get patchUniverseUniverseDropdownLabel => 'Universo DMX';

  @override
  String patchUniverseUniverseItem(Object universe) {
    return 'Universo $universe';
  }

  @override
  String get patchUniverseUniverseTitle => 'Universo';

  @override
  String get patchUniverseZoomIn => 'Aumentar';

  @override
  String get patchUniverseZoomOut => 'Reduzir';

  @override
  String get patchUniverseZoomTitle => 'Zoom';

  @override
  String get photometryBeamAngleHint2 => 'Em graus';

  @override
  String get photometryBeamAngleHint3 => 'Em graus';

  @override
  String get photometryBeamAngleLabel => 'Ângulo do feixe';

  @override
  String get photometryCandelaHint1 => 'Introduzir um valor em cd';

  @override
  String get photometryCandelaHint2 => 'Introduzir um valor em cd';

  @override
  String get photometryCandelaLabel => 'Candela';

  @override
  String get photometryDisclaimerShort =>
      'Apenas uma indicação. Verificar com a documentação do fabricante.';

  @override
  String get photometryDistanceHint1 => 'Em metros';

  @override
  String get photometryDistanceHint3 => 'Em metros';

  @override
  String get photometryDistanceLabel => 'Distância';

  @override
  String get photometryLumensHint2 => 'Introduzir um valor em lm';

  @override
  String get photometryLumensHint3 => 'Introduzir um valor em lm';

  @override
  String get photometryLumensLabel => 'Lúmens';

  @override
  String get photometryLuxHint => 'Introduzir um valor em lux';

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
    return 'A $distance m, $candela cd ≈ $lux lux.';
  }

  @override
  String photometrySummary2(Object distance, Object lumens, Object lux) {
    return 'A $distance m, $lumens lm ≈ $lux lux (aprox.).';
  }

  @override
  String photometrySummary3(
      String lumens, String distance, String angle, String lux) {
    return 'Lumens: $lumens lm - Distância: $distance m - Ângulo: $angle° - Lux: $lux lx.';
  }

  @override
  String get projectionAngleHint => 'Em graus';

  @override
  String get projectionAngleLabel => 'Ângulo';

  @override
  String get projectionAutoHelp => 'Auto: calcula o valor em falta.';

  @override
  String projectionConeAngle(Object angle) {
    return 'Ângulo : $angle°';
  }

  @override
  String projectionConeDiameter(Object diameter) {
    return 'Diâmetro : $diameter m';
  }

  @override
  String projectionConeDistance(Object distance) {
    return 'Distância : $distance m';
  }

  @override
  String projectionDetailAngle(Object angle) {
    return 'Ângulo : $angle°';
  }

  @override
  String projectionDetailDiameter(Object diameter) {
    return 'Diâmetro : $diameter m';
  }

  @override
  String projectionDetailDistance(Object distance) {
    return 'Distância : $distance m';
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
  String get projectionHeaderAutoActive => 'Auto ativo';

  @override
  String get projectionHeaderNeedTwoValues =>
      'Introduzir pelo menos dois valores.';

  @override
  String get projectionInputsTitle => 'Entradas';

  @override
  String get projectionResultsTitle => 'Resultados';

  @override
  String get resetConsents => 'Redefinir consentimentos';

  @override
  String get settings => 'Parâmetros';

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
    return 'Formato: $format\nÁrea de superfície: $area m²\nLux (lm/m²): $lux\nLux eq (ganho): $luxEq\nLuminância: $nits nits | $fl ft-L\nLimiar mínimo ($presetLabel): $minFl ft-L → $status\nNota: estimativa indicativa (Lambert).';
  }

  @override
  String get videoBrightnessSectionTitle => 'Lux / nits / ft-L + limiar';

  @override
  String get videoBrightnessSubtitle => 'Lux / nits / ft-L + limiar';

  @override
  String get videoBrightnessTitle => 'Brilho';

  @override
  String get videoCalc1ErrMissing => 'Dados em falta: Distância + Largura.';

  @override
  String videoCalc1Ok(Object ratio) {
    return 'Rácio de projeção = $ratio';
  }

  @override
  String get videoCalc1Title => 'Rácio (Distância / Largura)';

  @override
  String get videoCalc2ErrMissing => 'Dados em falta: Distância + Rácio.';

  @override
  String videoCalc2Ok(Object width) {
    return '✅ Largura da imagem = $width m';
  }

  @override
  String get videoCalc2Title => 'Largura (Distância / Rácio)';

  @override
  String get videoCalc3ErrMissingWidth => 'Dados em falta: Largura.';

  @override
  String videoCalc3Ok(Object format, Object height) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String get videoCalc3Title => 'Altura (Largura + Formato)';

  @override
  String get videoCalc4ErrGt0 => 'Lumens/Ganho/Largura deve ser > 0.';

  @override
  String get videoCalc4ErrMissing =>
      'Dados em falta: Lumens + Ganho + Largura.';

  @override
  String get videoCalc4ErrMissingSimple =>
      'Dados em falta: Largura + Lumens + Ganho.';

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
    return 'Área de superfície: $area m² (formato $format)\nLux (lm/m²): $lux\nLux eq (ganho): $luxEq\nLuminância: $nits nits | $fl ft-L\nLimiar mínimo ($presetLabel): $minFl ft-L → $status\nNota: conversão nits/ft-L com base num pressuposto Lambertiano (aprox.).';
  }

  @override
  String get videoCalc4Title => 'Brilho (lux / nits / ft-L + limiar)';

  @override
  String get videoCalc5ErrMissing =>
      'Dados em falta: Largura total + Sobreposição% + Número de projectores.';

  @override
  String get videoCalc5ErrNMin2 => 'O número de projectores deve ser ≥ 2.';

  @override
  String get videoCalc5NHint => 'ex: 2';

  @override
  String get videoCalc5NLabel => 'Número de projectores (N)';

  @override
  String videoCalc5Result(Object format, Object hTot, Object n, Object overlapM,
      Object overlapPct, Object wPer, Object wTot) {
    return 'Largura total: $wTot m\nN: $n | Sobreposição: $overlapPct% (na largura do projeto)\n\n- Largura por projetor: $wPer m\n- Sobreposição entre 2 projectores: $overlapM m\n- Altura total (formato $format): $hTot m';
  }

  @override
  String get videoCalc5Title => 'Sobreposição (Largura total + N)';

  @override
  String get videoCalc6ErrMissingBasics =>
      'Dados em falta: Largura total + Distância + Sobreposição%.';

  @override
  String get videoCalc6ErrMissingRatio =>
      'Dados em falta: Rácio mínimo e/ou rácio máximo.';

  @override
  String get videoCalc6GainHint => 'ex: 1.0';

  @override
  String get videoCalc6GainLabel => 'Ganho (calc 6)';

  @override
  String get videoCalc6LumensPerProjectorHint => 'Por exemplo, 20 000';

  @override
  String get videoCalc6LumensPerProjectorLabel => 'Lúmens por projetor';

  @override
  String get videoCalc6LumiErrGt0 =>
      'Brilho: ❌ Lumens/projo e o ganho deve ser > 0.';

  @override
  String videoCalc6LumiForN(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosidade estimada (N=$n)\nÁrea de superfície: $area m²\nLux eq: $lux (lm/m²)\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoCalc6LumiOptional =>
      'Brilho (opcional): introduz Lumens/projo + Ganho para estimativa.';

  @override
  String get videoCalc6NoteIndicative =>
      'Nota: estimativa indicativa (a mistura/sobreposição efectiva pode diminuir ligeiramente).';

  @override
  String get videoCalc6RatioMaxHint => 'ex: 1,80';

  @override
  String get videoCalc6RatioMaxLabel => 'Rácio máximo';

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
    return 'Total width=$wTot m | Distância=$distance m | Sobreposição=$overlapPct%\nFormato $format → Altura total=$hTot m | Área=$area m²\nRácio min/max: $ratioMin → $ratioMax\n\nRácio de casos mais abertos (min) = $nMin projectos | cobertura ≈ $covMin m\n$lumiMin\n\nRácio de caso mais fechado (máx) = $nMax projecções | cobertura ≈ $covMax m\n$lumiMax\n\n$note';
  }

  @override
  String get videoCalc6Title => 'N.º de projectores automáticos + luminosidade';

  @override
  String videoCalcLabel(Object n) {
    return 'Cálculo $n';
  }

  @override
  String get videoCalculateAll => 'Calcular todos os';

  @override
  String get videoCalculationsTitle => 'Cálculos de vídeo';

  @override
  String get videoCommonParamsTitle => 'Parâmetros comuns';

  @override
  String videoCommonPillArea(Object value) {
    return 'Superfície: $value';
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
      'Cálculos indicativos. Verificar sempre a documentação do fabricante.';

  @override
  String get videoDistanceHint => 'ex: 12.0';

  @override
  String get videoDistanceLabel => 'Distância de projeção (m)';

  @override
  String get videoErrImpossibleDenom => 'Parâmetros impossíveis (denom ≤ 0).';

  @override
  String get videoErrOverlapRange =>
      'A percentagem de sobreposição deve estar compreendida entre 0 e 99,9.';

  @override
  String get videoErrRatioGt0 => 'O rácio deve ser > 0.';

  @override
  String get videoErrTotalWidthAndDistanceGt0 =>
      'A largura e a distância totais devem ser > 0.';

  @override
  String get videoErrTotalWidthGt0 => 'A largura total deve ser > 0.';

  @override
  String get videoErrWidthGt0 => 'A largura deve ser > 0.';

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
  String get videoLedCalcTitle => 'Cálculo - Pixéis / mosaicos';

  @override
  String get videoLedErrAllGt0 => 'Todos os valores têm de ser > 0.';

  @override
  String get videoLedErrMissingInputs =>
      'Dados em falta: Ladrilhos X/Y + Ladrilho px + Ladrilho cm.';

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
    return 'Resolução da parede: $wallWpx × $wallHpx px\nDimensão da parede: $wallWm × $wallHm m\nLadrilho: $tileWpx×$tileHpx px - $tileWcm×$tileHcm cm\nPasso calculado: $pitch';
  }

  @override
  String get videoLedSubtitle =>
      'Pixéis de parede LED de acordo com o tamanho, o passo, as dimensões do azulejo.';

  @override
  String get videoLedTileHcmHint => 'ex: 33.28';

  @override
  String get videoLedTileHcmLabel => 'Altura do ladrilho (cm)';

  @override
  String get videoLedTileHpxHint => 'ex: 128';

  @override
  String get videoLedTileHpxLabel => 'Altura do mosaico (px)';

  @override
  String get videoLedTileWcmHint => 'ex: 33.28';

  @override
  String get videoLedTileWcmLabel => 'Largura do ladrilho (cm)';

  @override
  String get videoLedTileWpxHint => 'ex: 128';

  @override
  String get videoLedTileWpxLabel => 'Largura do mosaico (px)';

  @override
  String get videoLedTilesXHint => 'ex: 15';

  @override
  String get videoLedTilesXLabel => 'Ladrilhos horizontais (X)';

  @override
  String get videoLedTilesYHint => 'ex: 8';

  @override
  String get videoLedTilesYLabel => 'Ladrilhos verticais (Y)';

  @override
  String get videoLedTitle => 'LED';

  @override
  String get videoLensMeasureSubtitle =>
      'Rácio / largura / altura (cálculos 1 a 3).';

  @override
  String get videoLensMeasureTitle => 'Lente e medição';

  @override
  String get videoLmCalc1Title => 'Rácio (Distância / Largura)';

  @override
  String get videoLmCalc2Title => 'Largura (Distância / Rácio)';

  @override
  String get videoLmCalc3Title => 'Altura (Largura + Formato)';

  @override
  String get videoLmDistanceHint => 'ex: 12.0';

  @override
  String get videoLmDistanceLabel => 'Distância de projeção (m)';

  @override
  String get videoLmErrMissingDistanceRatio =>
      'Dados em falta: Distância + Rácio.';

  @override
  String get videoLmErrMissingDistanceWidth =>
      'Dados em falta: Distância + Largura.';

  @override
  String get videoLmErrMissingWidthOnly => 'Dados em falta: Largura.';

  @override
  String get videoLmErrRatioGt0 => 'O rácio deve ser > 0.';

  @override
  String get videoLmErrWidthGt0 => 'A largura deve ser > 0.';

  @override
  String get videoLmFormatLabel => 'Formato (rácio)';

  @override
  String get videoLmImageWidthHint => 'ex: 6.0';

  @override
  String get videoLmImageWidthLabel => 'Largura da imagem (m)';

  @override
  String videoLmResultHeight(Object format, Object height) {
    return '✅ Altura = $height m (formato $format)';
  }

  @override
  String videoLmResultRatio(Object ratio) {
    return 'Rácio de projeção = $ratio';
  }

  @override
  String videoLmResultWidth(Object width) {
    return '✅ Largura da imagem = $width m';
  }

  @override
  String get videoLmThrowRatioHint => 'ex: 1,60';

  @override
  String get videoLmThrowRatioLabel => 'Rácio de projeção';

  @override
  String get videoLumensHint => 'Por exemplo, 20 000';

  @override
  String get videoLumensLabel => 'Lumens (ANSI)';

  @override
  String get videoMireHeaderSubtitle =>
      'Padrões de teste indicativos (calibração, focagem, geometria, mistura, pixel perfect).';

  @override
  String get videoMireHeaderTitle => 'Gerador de padrões';

  @override
  String get videoMireScreenLedSubtitle =>
      'Padrão de teste de acordo com WxH px (pixel perfeito, uniformidade, grelha).';

  @override
  String get videoMireScreenLedTitle => 'Visão do ecrã LED';

  @override
  String get videoMireScreenVideoSubtitle =>
      'Simples (LxA px) + Mapeamento multi-projeto (N + sobreposição).';

  @override
  String get videoMireScreenVideoTitle => 'Padrão de teste do ecrã de vídeo';

  @override
  String get videoMireTitle => 'Visão';

  @override
  String get videoMpCalc5Title => 'Largura por projetor';

  @override
  String get videoMpCalc6Title => 'Número de projectores (rácio mínimo/máximo)';

  @override
  String videoMpCaseOpenMin(Object coverage, Object n) {
    return 'Rácio de casos mais abertos (min) = $n projectos | cobertura ≈ $coverage m';
  }

  @override
  String videoMpCaseTightMax(Object coverage, Object n) {
    return 'Caso de rácio mais apertado (max) = $n projectos | cobertura ≈ $coverage m';
  }

  @override
  String get videoMpDistanceHint => 'ex: 12.0';

  @override
  String get videoMpDistanceLabel => 'Distância de projeção (m)';

  @override
  String get videoMpErrImpossibleDenom => 'Parâmetros impossíveis (denom ≤ 0).';

  @override
  String get videoMpErrInvalidRatio => 'Rácio inválido (tem de ser > 0).';

  @override
  String get videoMpErrMissing5 =>
      'Dados em falta: Largura total + Sobreposição% + N.';

  @override
  String get videoMpErrMissing6Main =>
      'Dados em falta: Largura total + Distância + Sobreposição%.';

  @override
  String get videoMpErrMissingRatios =>
      'Dados em falta: Rácio min e/ou Rácio max.';

  @override
  String get videoMpErrNGte2 => '❌ N deve ser ≥ 2.';

  @override
  String get videoMpErrOverlapRange =>
      'A percentagem de sobreposição deve estar compreendida entre 0 e 99,9.';

  @override
  String get videoMpErrWidthDistanceGt0 =>
      'A largura e a distância totais devem ser > 0.';

  @override
  String get videoMpErrWidthGt0 => 'A largura total deve ser > 0.';

  @override
  String get videoMpFormatLabel => 'Formato (rácio)';

  @override
  String get videoMpGainHint => 'ex: 1.0';

  @override
  String get videoMpGainLabel => 'Ganho';

  @override
  String get videoMpLumensPerProjectorHint => 'Por exemplo, 20 000';

  @override
  String get videoMpLumensPerProjectorLabel => 'Lúmens por projetor';

  @override
  String get videoMpLumiErrLumensGainGt0 =>
      'Luminosidade: ❌ Lumens/projo e o ganho deve ser > 0.';

  @override
  String videoMpLumiEstimated(
      Object area, Object fl, Object lux, Object n, Object nits) {
    return 'Luminosidade estimada (N=$n)\nÁrea de superfície: $area m²\nLux eq: $lux\nNits: $nits | ft-L: $fl';
  }

  @override
  String get videoMpLumiOptionalHint =>
      'Brilho (opcional): Introduzir Lumens/projo + Ganho para estimar.';

  @override
  String get videoMpNoteIndicative => 'Nota: estimativa indicativa.';

  @override
  String get videoMpOptionalLuminanceTitle => 'Opcional: luminosidade';

  @override
  String get videoMpOverlapHint => 'ex: 10';

  @override
  String get videoMpOverlapLabel => 'Sobreposição (%)';

  @override
  String get videoMpProjectorCountHint => 'ex: 2';

  @override
  String get videoMpProjectorCountLabel => 'Número de projectores (N)';

  @override
  String get videoMpRatioMaxHint => 'ex: 1,80';

  @override
  String get videoMpRatioMaxLabel => 'Rácio máximo';

  @override
  String get videoMpRatioMinHint => 'ex: 1.20';

  @override
  String get videoMpRatioMinLabel => 'Rácio min';

  @override
  String get videoMpTotalWidthHint => 'ex: 18.0';

  @override
  String get videoMpTotalWidthLabel => 'Largura total da projeção (m)';

  @override
  String get videoMultiprojectorSubtitle =>
      'Sobreposição + largura/projo + número de projectos (cálculos 5 e 6).';

  @override
  String get videoMultiprojectorTitle => 'Multiprojector';

  @override
  String get videoOptionalBrightnessTitle => 'Opcional: luminosidade';

  @override
  String get videoOverlapHint => 'ex: 10';

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
  String get videoPdfCalc6RatioMax => 'Rácio máximo (calc6)';

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
  String get videoPdfOverlap => 'Sobreposição (%)';

  @override
  String get videoPdfParams => 'Parâmetros';

  @override
  String get videoPdfRatio => 'Rácio';

  @override
  String get videoPdfResults => 'Resultados';

  @override
  String get videoPdfScreenPreset => 'Predefinição do ecrã';

  @override
  String get videoPdfTitle => 'My Technical App - Exportação de vídeo';

  @override
  String get videoPdfTotalWidth => 'Largura total (m)';

  @override
  String get videoPresetFrontGrey => 'Frente - ecrã cinzento (ganho 0,8)';

  @override
  String get videoPresetFrontGreyShort => 'Frente - ecrã cinzento';

  @override
  String get videoPresetFrontHighGain =>
      'Frente - ecrã de alto ganho (ganho 1,3)';

  @override
  String get videoPresetFrontHighGainShort => 'Frente - ecrã de alto ganho';

  @override
  String get videoPresetFrontWhite => 'Frente - ecrã branco mate (ganho 1.0)';

  @override
  String get videoPresetFrontWhiteShort => 'Frente - ecrã branco mate';

  @override
  String get videoPresetMappingDarkStone =>
      'Mapeamento - pedra escura (ganho de 0,35)';

  @override
  String get videoPresetMappingDarkStoneShort => 'Mapeamento - pedra escura';

  @override
  String get videoPresetMappingGlass => 'Mapeamento - vidro (ganho 0,15)';

  @override
  String get videoPresetMappingGlassShort => 'Mapeamento - vidro';

  @override
  String get videoPresetMappingLightStone =>
      'Mapeamento - pedra clara (ganho de 0,6)';

  @override
  String get videoPresetMappingLightStoneShort => 'Mapeamento - pedra clara';

  @override
  String get videoPresetMappingMatte =>
      'Mapeamento - tinta mate (ganho de 0,75)';

  @override
  String get videoPresetMappingMatteShort => 'Mapeamento - pintura mate';

  @override
  String get videoPresetMappingSatin =>
      'Mapeamento - tinta acetinada (ganho de 0,9)';

  @override
  String get videoPresetMappingSatinShort => 'Mapeamento - pintura acetinada';

  @override
  String get videoPresetRearClear => 'Retro - tela clara (ganho de 0,9)';

  @override
  String get videoPresetRearClearShort => 'Retro - tela de cor clara';

  @override
  String get videoPresetRearDiffusion => 'Retro - tela de difusão (ganho 0,7)';

  @override
  String get videoPresetRearDiffusionShort => 'Retro - tela de difusão';

  @override
  String get videoScreenPresetLabel => 'Ecrã / Suporte (predefinido)';

  @override
  String get videoSummaryPillsTitle => 'Resumo (comprimidos)';

  @override
  String get videoTestPatternSubtitle =>
      'Criação de padrões de teste de vídeo para ecrãs e paredes LED (a realizar posteriormente).';

  @override
  String get videoTestPatternTitle => 'Visão';

  @override
  String get videoThrowRatioHint => 'ex: 1,60';

  @override
  String get videoThrowRatioLabel => 'Rácio de projeção';

  @override
  String get videoTitle => 'Vídeo';

  @override
  String get videoToolsTitle => 'Ferramentas de vídeo';

  @override
  String get videoTotalWidthHint => 'ex: 18.0';

  @override
  String get videoTotalWidthLabel => 'Largura total da projeção (m)';

  @override
  String get aboutArtnetTitle => 'Art-Net';

  @override
  String get aboutArtnetToc01 => '1) Art-Net - o que é e porquê';

  @override
  String get aboutArtnetToc02 =>
      '2) Endereçamento e universo - mapeamento próprio';

  @override
  String get aboutArtnetToc03 =>
      '3) Limites e desempenho - o que quebra primeiro';

  @override
  String get aboutArtnetToc04 => '4) Nós, repartidores e RDM';

  @override
  String get aboutArtnetToc05 =>
      '5) Resolução de problemas - sintomas → causas';

  @override
  String get aboutArtnetToc06 => '6) Diagramas (rede / unicast vs broadcast)';

  @override
  String get aboutArtnetToc07 => '6bis) Imagens (activos) - RJ45/switch/cabos';

  @override
  String get aboutArtnetToc08 => '7) Lista de controlo rápida';

  @override
  String get aboutDmxToc01 => '1) DMX, universos, endereços - o básico';

  @override
  String get aboutDmxToc02 => '2) Quadro DMX - pausa, código de início, canais';

  @override
  String get aboutDmxToc03 => '3) Cablagem RS-485 - topologia e cabo';

  @override
  String get aboutDmxToc04 => '4) Terminação e divisores - evitar reflexões';

  @override
  String get aboutDmxToc05 => '4bis) RDM - limites e compatibilidades';

  @override
  String get aboutDmxToc06 =>
      '5) Resolução de problemas no terreno - sintomas → causas';

  @override
  String get aboutDmxToc07 => '6) Art-Net - pontos de referência';

  @override
  String get aboutDmxToc08 => '7) sACN / E1.31 - multicast, IGMP, prioridades';

  @override
  String get aboutDmxToc09 => '8) DMX vs Art-Net vs sACN - escolha';

  @override
  String get aboutDmxToc10 => '10) Lista de controlo rápida';

  @override
  String get aboutDmxToc11 => '10) Lista de controlo rápida';

  @override
  String get aboutElectriciteTitle => 'Eletricidade';

  @override
  String get aboutElectriciteToc01 => '1) Bases (W, A, V, kW)';

  @override
  String get aboutElectriciteToc02 => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get aboutElectriciteToc03 => '3) Mono / Tri (qual é a diferença)';

  @override
  String get aboutElectriciteToc04 => '4) Mesa rápida (16A → 400A)';

  @override
  String get aboutElectriciteToc05 => '5) Segurança e armadilhas';

  @override
  String get aboutElectriciteToc06 => '6) Lista de controlo';

  @override
  String get aboutInformatiqueTitle => 'TI';

  @override
  String get aboutInformatiqueToc01 => '1) USB / USB-C / Thunderbolt';

  @override
  String get aboutInformatiqueToc02 => '2) Armazenamento (SATA / NVMe / SSD)';

  @override
  String get aboutInformatiqueToc03 => '3) Ligações de vídeo (DP / HDMI)';

  @override
  String get aboutInformatiqueToc04 => '4) PCIe / GPU (benchmarks)';

  @override
  String get aboutInformatiqueToc05 => '5) Lista de controlo (tabuleiro)';

  @override
  String get aboutIpBasicsToc01 => '1) O que é um IP e para que é utilizado?';

  @override
  String get aboutIpBasicsToc02 =>
      '2) Porquê 192.x / 10.x / 172.x? (endereços privados)';

  @override
  String get aboutIpBasicsToc03 =>
      '3) Máscara e sub-redes: compreender de facto';

  @override
  String get aboutIpBasicsToc04 => '4) DHCP, gateway, DNS: quem faz o quê?';

  @override
  String get aboutIpBasicsToc05 =>
      '5) Como dois dispositivos se comunicam entre si (LAN vs. não-LAN)';

  @override
  String get aboutIpBasicsToc06 =>
      '6) Planos simples de \"show\" de IP (exemplos prontos a copiar)';

  @override
  String get aboutIpBasicsToc07 =>
      '7) Resolução de problemas: sintomas → causas (método de campo)';

  @override
  String get aboutIpBasicsToc08 =>
      '8) Mini-exercícios (verificar rapidamente uma máscara / uma rede)';

  @override
  String get aboutIpBasicsToc09 => '9) Lista de controlo rápida';

  @override
  String get aboutNetworkTitle => 'Rede (EN)';

  @override
  String get aboutNetworkToc01 => '1) Objetivo: rede estável';

  @override
  String get aboutNetworkToc02 => '2) Plano IP (simples)';

  @override
  String get aboutNetworkToc03 => '3) VLAN (separação)';

  @override
  String get aboutNetworkToc04 => '4) IGMP (multicast sACN)';

  @override
  String get aboutNetworkToc05 => '5) Wi-Fi vs. com fios';

  @override
  String get aboutNetworkToc06 => '6) Switch: o que é necessário';

  @override
  String get aboutNetworkToc07 => '7) Diagramas';

  @override
  String get aboutNetworkToc08 => '7bis) Imagens (activos)';

  @override
  String get aboutNetworkToc09 => '8) Lista de controlo';

  @override
  String get aboutReseauTitle => 'Rede';

  @override
  String get aboutReseauToc01 =>
      '1) Noções básicas de rede (LAN / IP / débito)';

  @override
  String get aboutReseauToc02 => '2) RJ45 e categorias (Cat5e/6/6A/...)';

  @override
  String get aboutReseauToc03 => '3) PoE (fonte de alimentação de rede)';

  @override
  String get aboutReseauToc04 => '4) Fibra (SM/MM) + conectores (LC/SC)';

  @override
  String get aboutReseauToc05 => '5) SFP / SFP+ / QSFP (módulos)';

  @override
  String get aboutReseauToc06 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc07 => '7) Art-Net / sACN em rede (aconselhamento)';

  @override
  String get aboutReseauToc08 => '8) Lista de controlo';

  @override
  String get aboutSacnToc01 => '1) Para que é utilizado o sACN?';

  @override
  String get aboutSacnToc02 => '2) Universo (numeração)';

  @override
  String get aboutSacnToc03 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc04 => '4) Prioridades (fontes múltiplas)';

  @override
  String get aboutSacnToc05 => '5) Limites / desempenho';

  @override
  String get aboutSacnToc06 =>
      '6) RDM & sACN (proxy / dependendo do equipamento)';

  @override
  String get aboutSacnToc07 => '7) Diagramas';

  @override
  String get aboutSacnToc08 => '7bis) Imagens (activos)';

  @override
  String get aboutSacnToc09 => '8) Lista de controlo';

  @override
  String get aboutVideoToc01 => '1) Noções básicas de vídeo (palavras-chave)';

  @override
  String get aboutVideoToc02 => '2) Resolução e FPS';

  @override
  String get aboutVideoToc03 => '3) Cor (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc04 => '4) Sincronização (Genlock / Timecode)';

  @override
  String get aboutVideoToc05 => '5) Cabos e distâncias';

  @override
  String get aboutVideoToc06 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc07 => '7) HDMI - campo';

  @override
  String get aboutVideoToc08 => '8) NDI - quando / porquê / limites';

  @override
  String get aboutVideoToc09 => '9) Mapeamento / LED / multi-projo';

  @override
  String get aboutVideoToc10 => '10) Lista de controlo no terreno';

  @override
  String get aboutTileDmxTitle => 'DMX - funcionamento (simples e completo)';

  @override
  String get aboutTileArtnetTitle =>
      'Art-Net - DMX sobre IP (nós, unicast/broadcast)';

  @override
  String get aboutTileSacnTitle =>
      'sACN / E1.31 - multicast, IGMP, prioridades';

  @override
  String get aboutTileIpBasicsTitle =>
      'Rede - bases IP / máscara / DHCP (essencial)';

  @override
  String get aboutTileReseauTitle =>
      'Rede - RJ45 / Fibra / velocidades e comprimentos';

  @override
  String get aboutTileNetworkTitle =>
      'Rede leve - VLAN, IGMP, Wi-Fi vs. com fios';

  @override
  String get aboutTileVideoTitle => 'Vídeo - SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutTileElectriciteTitle => 'Elétrico - Schuko / P17 / potências';

  @override
  String get aboutTileElectriciteSubtitle =>
      'Conectores, mono/tri, painéis rápidos de kW (16A→400A), armadilhas de campo.';

  @override
  String get aboutTileInformatiqueTitle =>
      'IT - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutTileInformatiqueSubtitle =>
      'Velocidades úteis, versões, limites reais, armadilhas de marketing.';

  @override
  String get aboutTitle => 'Sobre nós';

  @override
  String get homeRiggingTitle => 'Rigging';

  @override
  String get homeRiggingSubtitle =>
      'Cabeçadas: ângulos e comprimentos das fundas.';

  @override
  String get riggingTitle => 'Rigging';

  @override
  String get riggingAngleLengthTitle => 'Ângulo e comprimento da funda';

  @override
  String get riggingSymmetryNote =>
      'Hipótese: freio simétrico (2 fios idênticos). Sem cálculo de carga.';

  @override
  String get riggingInputsTitle => 'Entradas';

  @override
  String get riggingSpanLabel => 'Distância central (distância entre pontos)';

  @override
  String get riggingSpanHint => 'Ex: 2.40';

  @override
  String get riggingDropLabel => 'Seta (queda vertical)';

  @override
  String get riggingDropHint => 'Ex: 0,60';

  @override
  String get riggingUnitMeters => 'm';

  @override
  String get riggingResultsTitle => 'Resultados';

  @override
  String get riggingNeedPositiveValues => 'Introduzir valores > 0.';

  @override
  String get riggingLegLengthLabel => 'Comprimento de um fio';

  @override
  String get riggingAngleToHorizontalLabel => 'Ângulo em relação à horizontal';

  @override
  String get riggingAngleToVerticalLabel => 'Ângulo em relação à vertical';

  @override
  String get riggingDisclaimerShort =>
      'Resultados indicativos. A validar de acordo com o seu contexto e práticas de manipulação.';

  @override
  String get riggingCalcLegDropTitle => 'Comprimento + deformação → vão';

  @override
  String get riggingCalcLegDropHelp =>
      'Linga simétrica (2 fios): calcula o vão a partir do comprimento da linga e da deflexão.';

  @override
  String get riggingLegLengthInputLabel => 'Comprimento de um fio';

  @override
  String get riggingLegLengthInputHint => 'Ex: 2,50';

  @override
  String get riggingInvalidTriangle =>
      'Impossível: o comprimento deve ser maior do que a seta.';

  @override
  String get riggingCalcLegAngleTitle =>
      'Comprimento + ângulo → vão + deformação';

  @override
  String get riggingCalcLegAngleHelp =>
      'Funda simétrica (2 fios): calcula o alcance e a deflexão a partir do comprimento e do ângulo em relação à horizontal.';

  @override
  String get riggingAngleHorizontalInputLabel =>
      'Ângulo em relação à horizontal';

  @override
  String get riggingAngleHorizontalInputHint => 'Ex: 30';

  @override
  String get riggingInvalidAngle =>
      'Ângulo inválido: entre 0° e 90° (excluído).';

  @override
  String get riggingUnitDegrees => '°';

  @override
  String get riggingCalc1Title =>
      'Distância centro a centro + deformação → comprimento e ângulos';

  @override
  String get riggingCalc1Subtitle =>
      'Freio simétrico (2 fios idênticos). Peso indicado (informação). Sem cálculo de carga.';

  @override
  String get riggingCalc2Title =>
      'Distância central + ângulo (H) → deflexão e comprimento';

  @override
  String get riggingCalc2Subtitle =>
      'Ângulo em relação à horizontal. Ponte simétrica. Sem cálculo de carga.';

  @override
  String get riggingCalc3Title =>
      'Distância centro a centro + comprimento → deflexão e ângulos';

  @override
  String get riggingCalc3Subtitle =>
      'Comprimento de um fio conhecido. Ponte simétrica. Sem cálculo de carga.';

  @override
  String get riggingLegLengthHint => 'Ex: 4,70';

  @override
  String get riggingAngleHint => 'Ex : 45';

  @override
  String get riggingInvalidGeometry =>
      'Geometria impossível (comprimento demasiado curto para a distância entre centros).';

  @override
  String get riggingSchemaTitle => 'Diagrama';

  @override
  String get riggingSchemaCaption1 =>
      'Entradas: vão + deflexão. Saídas: comprimento da funda + ângulos.';

  @override
  String get riggingSchemaCaption2 =>
      'Entradas: vão + comprimento da funda. Saídas: deflexão + ângulos.';

  @override
  String get riggingSchemaCaption3 =>
      'Entradas: span + ângulo (horizontal). Saídas: seta + comprimento.';

  @override
  String get riggingAngleHInputLabel => 'Ângulo (em relação à horizontal)';

  @override
  String get riggingAngleHInputHint => 'Ex: 45';

  @override
  String get riggingDropResultLabel => 'Seta (queda)';

  @override
  String get riggingSchemaLabelSpan => 'Centro a centro';

  @override
  String get riggingSchemaLabelDrop => 'Seta';

  @override
  String get riggingSchemaLabelLeg => 'Brin';

  @override
  String get riggingWeightLabel => 'Peso (info)';

  @override
  String get riggingUnitKg => 'kg';

  @override
  String get riggingImpossibleGeometry =>
      'Geometria impossível: o comprimento de um fio deve ser > (distância centro a centro / 2).';

  @override
  String get riggingDisclaimerNoLoad =>
      'Peso indicado apenas a título indicativo. Sem cálculo de carga / tensão. Válido no seu contexto de montagem.';

  @override
  String get riggingCalcCommonSubtitle =>
      'Freio de 2 fios. Peso indicado (informação). Sem cálculo de carga.';

  @override
  String get riggingOffCenterToggle => 'Carga descentrada';

  @override
  String get riggingOffsetLabel => 'Desvio A → carga';

  @override
  String get riggingInvalidOffset =>
      'Desvio inválido: deve ser > 0 e < distância ao centro.';

  @override
  String get riggingLegLeftLabel => 'Comprimento do fio esquerdo';

  @override
  String get riggingLegRightLabel => 'Comprimento do fio reto';

  @override
  String get riggingAngleHLeftLabel => 'Ângulo H (esquerda)';

  @override
  String get riggingAngleHRightLabel => 'Ângulo H (reto)';

  @override
  String get riggingAngleVLeftLabel => 'Ângulo V (esquerda)';

  @override
  String get riggingAngleVRightLabel => 'Ângulo V (reto)';

  @override
  String get riggingIncludedAngleLabel => 'Ângulo entre fios';

  @override
  String get riggingAngleHLeftInputLabel => 'Ângulo H (fio esquerdo)';

  @override
  String get riggingLegLeftInputLabel => 'Comprimento (fio esquerdo)';

  @override
  String get riggingNeedValidValues => 'Introduzir valores positivos válidos.';

  @override
  String get photometrySection4Title => 'Lux → Lúmen';

  @override
  String get photometryAreaLabel => 'Área de superfície (m²)';

  @override
  String get photometryAreaHint4 => 'Ex: 12,5';

  @override
  String photometrySummary4(Object lumens, Object lux, Object area) {
    return 'E = $lux lx - S = $area m² → Φ = $lumens lm';
  }

  @override
  String get aboutArtnetTocConversionTitle => 'Conversões';

  @override
  String get aboutArtnetConversionIntro =>
      'Ferramentas de conversão úteis para DMX, Art-Net e valores hexadecimais.';

  @override
  String get aboutUniverseToArtnetTitle => 'Universo → Art-Net';

  @override
  String get aboutUniverseToArtnetSubtitle =>
      'Localizar Subnet + Universo (Net/Port-Address) de um universo DMX.';

  @override
  String get aboutUniverseToHexTitle => 'Universo → Hexágono';

  @override
  String get aboutUniverseToHexSubtitle =>
      'Converte um universo (1...N) num índice e num valor hexadecimal.';

  @override
  String get aboutArtnetConversionNote =>
      'Nota: As convenções da Art-Net podem variar de consola para consola (endereçamento, base 0/1). Consulte sempre a documentação do seu sistema.';

  @override
  String get elecTocCopyText => 'Copiar o índice';

  @override
  String get elecToc1 => '1) Bases (W, A, V, kW)';

  @override
  String get elecToc2 => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get elecToc3 => '3) Mono / Tri (qual é a diferença)';

  @override
  String get elecToc4 => '4) Mesa rápida (16A → 400A)';

  @override
  String get elecToc5 => 'Conversão kVA → kW / A';

  @override
  String get elecToc6 => '6) Segurança e armadilhas';

  @override
  String get elecToc7 => '6) Lista de controlo';

  @override
  String get elecKvaTitle => 'Tabela kVA → kW (de acordo com cos φ)';

  @override
  String get elecKvaFormula => 'Fórmula: kW = kVA × cos φ';

  @override
  String get elecKvaIntro =>
      'Este quadro dá uma estimativa rápida da potência ativa (kW) a partir da potência aparente (kVA).';

  @override
  String get elecKvaNote =>
      'Valores indicativos. Utilizar os valores reais de cos φ quando os conhecer.';

  @override
  String get elecKvaColKva => 'kVA';

  @override
  String get elecKvaColPf08 => 'kW (cos φ = 0,8)';

  @override
  String get elecKvaColPf10 => 'kW (cos φ = 1,0)';

  @override
  String get commonTocTitle => 'Conteúdo';

  @override
  String get commonCopySummaryTooltip => 'Copiar o índice';

  @override
  String get aboutLightReferenceTitle => 'Referências de iluminação';

  @override
  String get refCriTitle => 'IRC / CRI';

  @override
  String get refKelvinTitle => 'Temperatura de cor (K)';

  @override
  String get refBeamFieldTitle => 'Feixe / Campo';

  @override
  String get refLuxTitle => 'Níveis de iluminação (lux)';

  @override
  String get refCriContent =>
      'O CRI mede a fidelidade da cor. Quanto mais elevado for, mais naturais são as cores.';

  @override
  String get refKelvinContent =>
      'A temperatura da cor descreve a tonalidade do branco (quente a frio).';

  @override
  String get refBeamFieldContent =>
      'O feixe é o ângulo do feixe principal; o campo é o ângulo em que a intensidade se torna fraca (borda).';

  @override
  String get refBeamLegendBeam => 'Feixe';

  @override
  String get refBeamLegendField => 'Campo';

  @override
  String get refLuxIntro =>
      'Referências indicativas de iluminância consoante a utilização.';

  @override
  String get refLuxColUse => 'Utilização';

  @override
  String get refLuxColLux => 'Lux';

  @override
  String get refLuxUseCorridor => 'Corredor / circulação';

  @override
  String get refLuxUseBackstage => 'Bastidores / técnica';

  @override
  String get refLuxUseMeeting => 'Sala de reuniões';

  @override
  String get refLuxUseExpo => 'Exposição / showroom';

  @override
  String get refLuxUseStageGeneral => 'Palco - geral';

  @override
  String get refLuxUseStageTv => 'Palco - TV / gravação';

  @override
  String get refLuxNote =>
      'Estes valores variam em função das normas e dos condicionalismos (câmara, contraste, ambiente).';

  @override
  String get refLightDisclaimerShort =>
      'Referências indicativas - não uma norma.';

  @override
  String get refCri90 => 'Excelente (≥ 90)';

  @override
  String get refCri80 => 'Bom (≈ 80)';

  @override
  String get refCriLow => 'Baixo (< 80)';

  @override
  String get aboutUniverseToArtnetImportantTitle => 'Importante';

  @override
  String get aboutUniverseToArtnetImportantBody =>
      'Algumas consolas utilizam uma base 0 (Universo 0...15) e outras uma base 1 (Universo 1...16).';

  @override
  String get aboutUniverseToArtnetTableTitle => 'Tabela Universo → Art-Net';

  @override
  String get aboutUniverseToArtnetTableIntro =>
      'Correspondência típica entre o universo DMX e o endereçamento Art-Net.';

  @override
  String get aboutUniverseTablesDisclaimer =>
      'Verifique sempre a convenção da sua consola/nó.';

  @override
  String get aboutUniverseToArtnetColDmx => 'Universo DMX';

  @override
  String get aboutUniverseToArtnetColUniHex => 'Uni (hex)';

  @override
  String aboutUniverseToArtnetSubnetTitle(
      Object p0, Object p1, Object p2, Object p3) {
    return 'Sub-rede $p0 $p1 $p2 $p3';
  }

  @override
  String get aboutUniverseToHexPrincipleTitle => 'Princípio';

  @override
  String get aboutUniverseToHexPrincipleBody =>
      'Um universo (1...N) pode ser convertido num índice (base 0) e depois em hexadecimal.';

  @override
  String get aboutUniverseToHexTableTitle => 'Tabela Univers → Hex';

  @override
  String get aboutUniverseToHexTableIntro =>
      'Tabela de conversão do universo DMX → índice / hexadecimal.';

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
      'Art-Net - DMX sobre IP (simples e completo)';

  @override
  String get aboutArtnetTocTitle => 'Conteúdo';

  @override
  String get aboutArtnetTocCopyTooltip => 'Marcadores de cópia';

  @override
  String get aboutArtnetCopyLine1 => 'Art-Net = DMX sobre Ethernet via UDP.';

  @override
  String get aboutArtnetCopyLine2 =>
      'Escala: muitos universos através de nós distribuídos (DMX-out).';

  @override
  String get aboutArtnetCopyLine3 =>
      'Distribuição: broadcast (simples, mas inundada) ou unicast (mais limpa).';

  @override
  String get aboutArtnetCopyLine4 =>
      'Limites reais: Wi-Fi, interrutor básico, nós de firmware, definições de universo/mapeamento.';

  @override
  String get aboutArtnetCopyLine5 =>
      'RDM: possível através de proxy RDM consoante os nós (suporte variável).';

  @override
  String get aboutArtnetSection1Title => '1) Art-Net - o que é e porquê';

  @override
  String get aboutArtnetSection2Title =>
      '2) Endereçamento e universo - cartografia própria';

  @override
  String get aboutArtnetSection3Title =>
      '3) Limites e desempenho - o que quebra primeiro';

  @override
  String get aboutArtnetSection4Title => '4) Nós, repartidores e RDM';

  @override
  String get aboutArtnetSection5Title =>
      '5) Resolução de problemas - sintomas → causas';

  @override
  String get aboutArtnetSection6Title =>
      '6) Diagramas (rede / unicast vs broadcast)';

  @override
  String get aboutArtnetSection6bTitle =>
      '6bis) Imagens (activos) - RJ45/switch/cabos';

  @override
  String get aboutArtnetSection7Title => '7) Lista de controlo rápida';

  @override
  String get aboutArtnetConversionTablesTitle =>
      '8) Conversão / tabelas (Universo 1...256)';

  @override
  String get aboutArtnetPillUdp => 'UDP';

  @override
  String get aboutArtnetPillUniversIp => 'Universo DMX sobre IP';

  @override
  String get aboutArtnetPillNodesDmxOut => 'Nós de saída DMX';

  @override
  String get aboutArtnetSection1Paragraph =>
      'A Art-Net transporta universos DMX através de uma rede Ethernet (IP). Em vez de desenhar uma linha DMX por universo, envia \"pacotes\" através da rede, e um nó converte-os em DMX perto das máquinas.';

  @override
  String get aboutArtnetSection1CalloutTitle => 'Porque é que é útil';

  @override
  String get aboutArtnetSection1Bullet1 =>
      'Escalável: muitos universos num único cabo de rede.';

  @override
  String get aboutArtnetSection1Bullet2 =>
      'Distribuição: nós próximos dos projectores/dimmers → menos linhas DMX longas.';

  @override
  String get aboutArtnetSection1Bullet3 =>
      'Patch flexível: alterar um universo ou deslocar um nó rapidamente.';

  @override
  String get aboutArtnetSection1Subtitle => 'Duas palavras para recordar';

  @override
  String get aboutArtnetSection1SubBullet1 =>
      'A Art-Net não substitui o DMX: transporta-o através de IP.';

  @override
  String get aboutArtnetSection1SubBullet2 =>
      'A estabilidade depende muitas vezes mais da rede (switch, Wi-Fi, difusão) do que do protocolo.';

  @override
  String get aboutArtnetSection2PillUniverse => 'Universo';

  @override
  String get aboutArtnetSection2PillNodePort => 'Nó / Porto';

  @override
  String get aboutArtnetSection2PillMapping => 'Cartografia';

  @override
  String get aboutDmxPageTitle => 'DMX - funcionamento (simples e completo)';

  @override
  String get aboutDmxSummaryLine1 =>
      'DMX = RS-485, 512 canais (slots) por universo, valores 0-255 (8 bits).';

  @override
  String get aboutDmxSummaryLine2 =>
      'Temporização: 250 kbaud, universo completo ≈ ~44 Hz (ordem de grandeza).';

  @override
  String get aboutDmxSummaryLine3 =>
      'Topologia: cadeia em margarida (sem Y passivo). Terminação de 120Ω no último.';

  @override
  String get aboutDmxSummaryLine4 =>
      'RDM = DMX bidirecional (configuração/monitorização) → compatibilidade do divisor/nó a verificar.';

  @override
  String get aboutDmxSummaryLine5 =>
      'Art-Net / sACN = universos DMX transportados em Ethernet/IP através de nós.';

  @override
  String get aboutDmxSummaryLine6 =>
      'sACN = multicast + prioridades (recomenda-se IGMP snooping).';

  @override
  String get aboutDmxToc1 => '1) DMX, universos, endereços - o básico';

  @override
  String get aboutDmxToc2 => '2) Quadro DMX - pausa, código de início, canais';

  @override
  String get aboutDmxToc3 => '3) Cablagem RS-485 - topologia e cabo';

  @override
  String get aboutDmxToc4 => '4) Terminação e divisores - evitar reflexões';

  @override
  String get aboutDmxToc4bis => '4bis) RDM - limites e compatibilidades';

  @override
  String get aboutDmxToc5 =>
      '5) Resolução de problemas no terreno - sintomas → causas';

  @override
  String get aboutDmxToc6 => '6) Art-Net - pontos de referência';

  @override
  String get aboutDmxToc7 => '7) sACN / E1.31 - multicast, IGMP, prioridades';

  @override
  String get aboutDmxToc8 => '8) DMX vs Art-Net vs sACN - escolha';

  @override
  String get aboutDmxToc9 => '9) Diagramas de campo (DMX / IP / pinagem)';

  @override
  String get aboutDmxChecklistCopyTitle => 'DMX - Lista de controlo de campo';

  @override
  String get aboutDmxChecklistCopyTitle2 =>
      'Art-Net / sACN - Lista de controlo no terreno';

  @override
  String get aboutDmxChecklistCopyB1 =>
      'Modo de dispositivo correto (número de canais)';

  @override
  String get aboutDmxChecklistCopyB2 =>
      'Endereço DMX correto (sem sobreposição)';

  @override
  String get aboutDmxChecklistCopyB3 => 'Ligação em cadeia (sem Y passivo)';

  @override
  String get aboutDmxChecklistCopyB4 =>
      'Terminação de 120Ω no último dispositivo';

  @override
  String get aboutDmxChecklistCopyB5 =>
      'Cabo DMX/RS-485 (par entrançado de 120Ω), se possível';

  @override
  String get aboutDmxChecklistCopyB6 => 'Separador opto se vários ramos';

  @override
  String get aboutDmxChecklistCopyB7 =>
      'Mantenha o DMX afastado de fontes de interferência (fontes de alimentação, reguladores de intensidade), se possível';

  @override
  String get aboutDmxChecklistCopyB8 =>
      'Se RDM: verificar a compatibilidade do repartidor/nó + cablagem impecável';

  @override
  String get aboutDmxChecklistCopyB9 => 'Rede dedicada, se possível (ou VLAN)';

  @override
  String get aboutDmxChecklistCopyB10 =>
      'Switch correto; IGMP snooping recomendado (sACN multicast)';

  @override
  String get aboutDmxChecklistCopyB11 =>
      'Unicast (frequentemente) ou multicast controlado (evitar inundações)';

  @override
  String get aboutDmxChecklistCopyB12 =>
      'Mapeamento universo ↔ portos/nó verificado';

  @override
  String get aboutDmxChecklistCopyB13 =>
      'Plano de IP claro (endereços, máscara, DHCP vs. estático)';

  @override
  String get aboutDmxS1Title => '1) DMX, universos, endereços - o básico';

  @override
  String get aboutDmxS1Pill1 => '1 universo = 512 ranhuras';

  @override
  String get aboutDmxS1Pill2 => '0-255 (8 bits)';

  @override
  String get aboutDmxS1Pill3 => '16 bits = 2 canais';

  @override
  String get aboutDmxS1Intro =>
      'O DMX512 é um protocolo de controlo amplamente utilizado no entretenimento (iluminação, efeitos, reguladores de intensidade). É um fluxo de série (RS-485) que envia um \"quadro\" em loop contendo até 512 valores. Cada valor = um canal (0→255).';

  @override
  String get aboutDmxS1RememberTitle => 'Para recordar';

  @override
  String get aboutDmxS1RememberB1 =>
      '1 universo DMX = 512 canais (slots) numerados de 1→512.';

  @override
  String get aboutDmxS1RememberB2 =>
      'Um dispositivo escuta um endereço de início (por exemplo, 101) e consome N canais (consoante o seu modo).';

  @override
  String get aboutDmxS1RememberB3 =>
      'O controlador envia tudo continuamente: se parar de transmitir, os dispositivos \"congelam\" (ou entram em fallback).';

  @override
  String get aboutDmxS4bisTitle => '4bis) RDM - limites e compatibilidades';

  @override
  String get aboutDmxS4bisPlaceholder => '... (manter o conteúdo existente)';

  @override
  String get aboutDmxS9Title => '9) Diagramas de campo (DMX / IP / pinagem)';

  @override
  String get aboutDmxS9Diagram1 => 'Temporização DMX (break / MAB / slots)';

  @override
  String get aboutDmxS9Diagram2 => 'Topologia DMX: cadeia em margarida';

  @override
  String get aboutDmxS9Diagram3 => 'Terminação de 120Ω';

  @override
  String get aboutDmxS9Diagram4 => 'multicast sACN: lembrete IGMP (rede)';

  @override
  String get aboutDmxS9Diagram5 => 'IP → nós → DMX (Art-Net / sACN)';

  @override
  String get aboutDmxS9Diagram6 => 'Pinagem XLR5 (DMX)';

  @override
  String get aboutDmxS10Title => '10) Lista de controlo rápida';

  @override
  String get aboutDmxS10CopyTooltip => 'Copiar a lista de controlo';

  @override
  String get aboutDmxS10CalloutTitle => 'Antes de entrar em pânico';

  @override
  String get aboutDmxS10B1 =>
      'Modo do dispositivo + endereço DMX (verificar sempre).';

  @override
  String get aboutDmxS10B2 =>
      'Corrente curta com um cabo \"reconhecidamente OK\" para isolamento.';

  @override
  String get aboutDmxS10B3 => 'Cadeia em cadeia (sem Y passivo).';

  @override
  String get aboutDmxS10B4 =>
      'Terminação de 120Ω apenas no último dispositivo.';

  @override
  String get aboutDmxS10B5 => 'Divisor opto se vários ramos.';

  @override
  String get aboutDmxS10B6 =>
      'Se RDM: repartidor/nó compatível + cablagem impecável.';

  @override
  String get aboutDmxS10B7 =>
      'Em IP (Art-Net/sACN): interrutor correto, IGMP para sACN multicast, unicast em caso de dúvida.';

  @override
  String get aboutDmxFooterNote =>
      'Informação indicativa (campo). O comportamento exato pode variar consoante as consolas, os nós, os comutadores e o firmware.\nO objetivo aqui é compreender e resolver rapidamente os problemas, utilizando um método fiável.';

  @override
  String get aboutDmxPainterBreak => 'BREAK';

  @override
  String get aboutDmxPainterMab => 'MAB';

  @override
  String get aboutDmxPainterStartCode => 'Iniciar\ncódigo';

  @override
  String get aboutDmxPainterSlots => 'Ranhuras 1...N\n(até 512)';

  @override
  String get aboutDmxPainterRefresh =>
      'Loop (atualização) - universo completo ≈ ~44 Hz (ordem de grandeza)';

  @override
  String get aboutDmxPainterSourceA => 'FONTE A\n(prio 100)';

  @override
  String get aboutDmxPainterSourceB => 'FONTE B\n(prio 90)';

  @override
  String get aboutDmxPainterSwitchIgmp => 'COMUTADOR\nIGMP snooping';

  @override
  String get aboutDmxPainterMulticastUniverse => 'MULTICAST\nUniverso U';

  @override
  String get aboutDmxPainterRx => 'RX';

  @override
  String get aboutDmxPainterIgmpNote =>
      'Sem IGMP: inundação\nCom IGMP: apenas portas subscritas';

  @override
  String get aboutDmxPainterConsole => 'CONSOLA';

  @override
  String get aboutDmxPainterFix1 => 'CORRIGIR 1';

  @override
  String get aboutDmxPainterFix2 => 'CORRIGIR 2';

  @override
  String get aboutDmxPainterFix3 => 'CORRIGIR 3';

  @override
  String get aboutElectricitePageTitle => 'Referências eléctricas - no terreno';

  @override
  String get elecSection1Title => '1) Bases (W, A, V, kW)';

  @override
  String get elecSection1FormulasTitle => '3 fórmulas úteis';

  @override
  String get elecSection1Formula1 => 'P (W) = U (V) × I (A)';

  @override
  String get elecSection1Formula2 => 'I (A) = P (W) / U (V)';

  @override
  String get elecSection1Formula3 => 'P (kW) = P (W) / 1000';

  @override
  String get elecSection1FieldMarksTitle => 'Pontos de referência';

  @override
  String get elecSection1FieldMark1 =>
      'Mono 230V: 16A ≈ 3,7 kW | 32A ≈ 7,4 kW | 63A ≈ 14,5 kW';

  @override
  String get elecSection1FieldMark2 =>
      'Três 400V: 16A ≈ 11 kW | 32A ≈ 22 kW | 63A ≈ 44 kW';

  @override
  String get elecSection2Title => '2) Conectores (Schuko / P17 / PowerCON)';

  @override
  String get elecSection2SchukoTitle => 'Schuko (tomadas domésticas)';

  @override
  String get elecSection2SchukoBullet1 =>
      'Tipicamente 16A max (≈ 3,7 kW a 230V).';

  @override
  String get elecSection2SchukoBullet2 =>
      'Tenha cuidado com as tomadas eléctricas e as extensões: podem aquecer.';

  @override
  String get elecSection2P17Title => 'P17 / CEE (azul/vermelho)';

  @override
  String get elecSection2P17Bullet1 =>
      'Azul: 230V mono (campismo, pequena distro).';

  @override
  String get elecSection2P17Bullet2 =>
      'Vermelho: 400V trifásico (distro, alta potência).';

  @override
  String get elecSection2PowerconTitle => 'PowerCON (áudio/iluminação)';

  @override
  String get elecSection2PowerconBullet1 =>
      'PowerCON TRUE1 = mais \"campo\" (bloqueio, IP).';

  @override
  String get elecSection2PowerconBullet2 =>
      'Verificar a secção transversal e a proteção do cabo.';

  @override
  String get elecSection3Title => '3) Mono / Tri (qual é a diferença)';

  @override
  String get elecSection3Paragraph =>
      'Mono = uma fase + neutro (230V). Tri = 3 fases (400V entre fases).';

  @override
  String get elecSection3PitfallsTitle => 'Armadilhas frequentes';

  @override
  String get elecSection3Pitfall1 =>
      'Desequilíbrio de fases (uma fase sobrecarregada).';

  @override
  String get elecSection3Pitfall2 =>
      'O neutro aquece se os harmónicos forem elevados (LEDs, reguladores de intensidade).';

  @override
  String get elecSection3Pitfall3 => 'Solo ausente/duvidoso em alguns sítios.';

  @override
  String get elecSection3MethodTitle => 'Método simples';

  @override
  String get elecSection3MethodBullet1 =>
      'Distribuir as cargas pesadas por L1/L2/L3.';

  @override
  String get elecSection3MethodBullet2 =>
      'Monitorizar o neutro se houver muitos LEDs.';

  @override
  String get elecSection3MethodBullet3 =>
      'Se possível, efetuar a medição com pinças.';

  @override
  String get elecSection4Title => '4) Mesa rápida (16A → 400A)';

  @override
  String get elecSection4MonoTitle => 'Mono 230V (≈ U×I)';

  @override
  String get elecSection4MonoCode =>
      '16A ≈ 3,7 kW\n32A ≈ 7,4 kW\n63A ≈ 14,5 kW\n125A ≈ 28,8 kW\n200A ≈ 46 kW\n';

  @override
  String get elecSection4TriTitle => 'Três 400V (≈ √3×U×I)';

  @override
  String get elecSection4TriCode =>
      '16A ≈ 11 kW\n32A ≈ 22 kW\n63A ≈ 44 kW\n125A ≈ 86 kW\n200A ≈ 138 kW\n400A ≈ 277 kW\n';

  @override
  String get elecSection4ImportantTitle => 'Importante';

  @override
  String get elecSection4ImportantBullet1 =>
      'Trata-se de ordens de grandeza (cosφ, harmónicos, perdas).';

  @override
  String get elecSection4ImportantBullet2 =>
      'Validar sempre as protecções + secções + temperatura.';

  @override
  String get elecSection5Title => '6) Segurança e armadilhas';

  @override
  String get elecSection5DontDoTitle => 'O que não fazer';

  @override
  String get elecSection5DontDoBullet1 =>
      'Encadear tiras de alimentação/extensões a granel.';

  @override
  String get elecSection5DontDoBullet2 => 'Misturar fases sem saber.';

  @override
  String get elecSection5DontDoBullet3 => '\"Bridger\" uma terra duvidosa.';

  @override
  String get elecSection5WarningTitle => 'Sinais de aviso';

  @override
  String get elecSection5WarningBullet1 =>
      'Cheiro quente, pegas quentes, gatilhos repetidos.';

  @override
  String get elecSection5WarningBullet2 =>
      'Queda da tensão arterial (brown-out).';

  @override
  String get elecSection5WarningBullet3 => 'Cansado\" ou disjuntor inadequado.';

  @override
  String get elecSection6Title => '6) Lista de controlo';

  @override
  String get elecSection6QuickTitle => 'Rápido';

  @override
  String get elecSection6Bullet1 =>
      'Tipo de fonte de alimentação disponível (mono/tri) + classificação (A).';

  @override
  String get elecSection6Bullet2 =>
      'Distribuição de fases (cargas principais).';

  @override
  String get elecSection6Bullet3 =>
      'Protecções (diff/disj) e estado do quadro de distribuição.';

  @override
  String get elecSection6Bullet4 =>
      'Cabos: secção transversal / comprimento / aumento de temperatura.';

  @override
  String get elecSection6Bullet5 => 'Terra: OK? (testador, se possível).';

  @override
  String get elecFooterNote =>
      'Nota: este conteúdo é uma lista de controlo no terreno. Num local real, cumpra sempre as normas, os regulamentos locais e as medidas de proteção em vigor.';

  @override
  String get infoPageTitle => 'TI - referências no terreno';

  @override
  String get infoUsbTitle => '1) USB / USB-C / Thunderbolt';

  @override
  String get infoStorageTitle => '2) Armazenamento (SATA / NVMe / SSD)';

  @override
  String get infoVideoLinksTitle => '3) Ligações de vídeo (DP / HDMI)';

  @override
  String get infoPcieGpuTitle => '4) PCIe / GPU (benchmarks)';

  @override
  String get infoChecklistTitle => '5) Lista de controlo (tabuleiro)';

  @override
  String get infoSummaryCopy =>
      'INFO - referências no terreno\n- USB-C = forma, não velocidade: verifique a norma.\n- NVMe (M.2) muito mais rápido do que SATA.\n- DisplayPort/HDMI = normas, mas cuidado com as versões/cabos.\n- Nos servidores de vídeo: armazenamento + GPU + taxa de transferência são a base.';

  @override
  String get infoChecklistCopy =>
      'INFO - Lista de controlo\nCabos USB-C certificados (dados/vídeo, se necessário)\nArmazenamento adequado (NVMe se forem grandes fluxos)\nControladores de GPU estáveis (versão conhecida)\nTeste de resolução/FPS real\nEvitar adaptadores baratos';

  @override
  String get infoUsbCriticalTitle => 'Ponto crítico';

  @override
  String get infoUsbCriticalBullet1 =>
      'USB-C = conetor (forma). Não diz a que velocidade.';

  @override
  String get infoUsbCriticalBullet2 =>
      'Um cabo USB-C pode ser \"apenas de carga\" e não transmitir dados/vídeo.';

  @override
  String get infoUsbSpeedTitle =>
      'Referências de velocidade (ordem de grandeza)';

  @override
  String get infoUsbSpeedBullet1 =>
      'USB 2.0: lento (teclados, dongles, pequenos periféricos).';

  @override
  String get infoUsbSpeedBullet2 =>
      'USB 3.x: muito mais rápido (discos, interfaces).';

  @override
  String get infoUsbSpeedBullet3 =>
      'USB4 / Thunderbolt: velocidade muito elevada (base de ligação, eGPU, vídeo, dependendo do hardware).';

  @override
  String get infoUsbParagraph =>
      'No espetáculo: se um dispositivo \"se desligar\", suspeite do cabo (qualidade/norma) antes do dispositivo.';

  @override
  String get infoStorageSataNvmeTitle => 'SATA vs NVMe';

  @override
  String get infoStorageSataNvmeBullet1 =>
      'SSD SATA: bom e estável, mas limitado (interface antiga).';

  @override
  String get infoStorageSataNvmeBullet2 =>
      'SSD NVMe (M.2): muito mais rápido (ideal para servidores multimédia, ficheiros grandes).';

  @override
  String get infoStorageFieldTitle => 'Vídeo do terreno';

  @override
  String get infoStorageFieldBullet1 =>
      'Reprodução de grandes ficheiros 4K/ProRes → NVMe recomendado.';

  @override
  String get infoStorageFieldBullet2 =>
      'Cuidado com a temperatura: um NVMe pode ficar mais lento se ficar demasiado quente.';

  @override
  String get infoStorageFieldBullet3 =>
      'Testar sempre em condições reais antes do espetáculo.';

  @override
  String get infoVideoLinksImportantTitle => 'Um marco importante';

  @override
  String get infoVideoLinksImportantBullet1 =>
      'As versões que contam: cabo + porta + dispositivo devem ser compatíveis.';

  @override
  String get infoVideoLinksImportantBullet2 =>
      'Longa distância = são frequentemente necessários conversores activos/fibra.';

  @override
  String get infoVideoLinksCompareTitle => 'DP vs HDMI (muito simplificado)';

  @override
  String get infoVideoLinksCompareBullet1 =>
      'HDMI: omnipresente (TV, processadores), mas o EDID/HDCP pode ser um problema.';

  @override
  String get infoVideoLinksCompareBullet2 =>
      'DisplayPort: muito comum nos PCs, frequentemente muito \"capaz\" em termos de débito de dados.';

  @override
  String get infoPcieGpuParagraph =>
      'Para servidores de vídeo/mapeamento: GPU + bus + controladores = estabilidade. Problemas típicos: controladores, cabos, conversão e limitações de saída.';

  @override
  String get infoPcieGpuFieldTitle => 'Terreno';

  @override
  String get infoPcieGpuFieldBullet1 =>
      'Bloquear uma versão estável do controlador antes de um grande espetáculo.';

  @override
  String get infoPcieGpuFieldBullet2 => 'Evite adaptadores baratos.';

  @override
  String get infoPcieGpuFieldBullet3 =>
      'Teste com a resolução/FPS real do espetáculo.';

  @override
  String get infoChecklistQuickTitle => 'Rápido';

  @override
  String get infoChecklistBullet1 => 'Cabo/norma correta.';

  @override
  String get infoChecklistBullet2 => 'Armazenamento adaptado ao fluxo.';

  @override
  String get infoChecklistBullet3 => 'Condutores estáveis.';

  @override
  String get infoChecklistBullet4 => 'Um verdadeiro teste antes do espetáculo.';

  @override
  String get infoChecklistBullet5 => 'Evite adaptadores baratos.';

  @override
  String get infoFooterNote =>
      'Informação indicativa (terreno). As capacidades exactas variam consoante o equipamento/versões.\nObjetivo: pontos de referência simples + método fiável.';

  @override
  String get ipBasicsPageTitle =>
      'Rede - bases IP / máscara / DHCP (essencial)';

  @override
  String get ipBasicsCopyMemoTooltip => 'Copiar nota';

  @override
  String get ipBasicsCopyChecklistTooltip => 'Copiar a lista de controlo';

  @override
  String get ipBasicsMemo1 =>
      'IP = endereço lógico para ligar um dispositivo a uma rede.';

  @override
  String get ipBasicsMemo2 =>
      'Privado (LAN): 10.x.x.x, 172.16-31.x.x, 192.168.x.x (não encaminhado para a Internet).';

  @override
  String get ipBasicsMemo3 =>
      'Máscara / sub-rede = indica que parte é \"rede\" ou \"máquina\".';

  @override
  String get ipBasicsMemo4 =>
      'Mesma sub-rede = comunicação direta. Caso contrário → gateway (router).';

  @override
  String get ipBasicsMemo5 =>
      'DHCP atribui IP automaticamente; estático = útil para nós/consola.';

  @override
  String get ipBasicsToc1 => '1) O que é um IP e para que é utilizado?';

  @override
  String get ipBasicsToc2 =>
      '2) Porquê 192.x / 10.x / 172.x? (endereços privados)';

  @override
  String get ipBasicsToc3 => '3) Máscara e sub-redes: compreender de facto';

  @override
  String get ipBasicsToc4 => '4) DHCP, gateway, DNS: quem faz o quê?';

  @override
  String get ipBasicsToc5 =>
      '5) Como dois dispositivos se comunicam entre si (LAN vs. não-LAN)';

  @override
  String get ipBasicsToc6 =>
      '6) Planos simples de \"show\" de IP (exemplos prontos a copiar)';

  @override
  String get ipBasicsToc7 =>
      '7) Resolução de problemas: sintomas → causas (método de campo)';

  @override
  String get ipBasicsToc8 =>
      '8) Mini-exercícios (verificar rapidamente uma máscara / uma rede)';

  @override
  String get ipBasicsToc9 => '9) Lista de controlo rápida';

  @override
  String get ipBasicsSection1Paragraph =>
      'Um endereço IP (IPv4) é um identificador lógico numa rede. É utilizado para dizer \"envie este pacote para este dispositivo\".\n\nQuando se liga uma consola, um nó Art-Net/sACN, um PC, um comutador gerido, etc., tudo o que fala na rede tem de ter um IP consistente para que os dispositivos se possam encontrar uns aos outros.';

  @override
  String get ipBasicsSection1CalloutTitle => 'Imagem mental';

  @override
  String get ipBasicsSection1Bullet1 =>
      'MAC = identificador de hardware (placa de rede).';

  @override
  String get ipBasicsSection1Bullet2 =>
      'IP = endereço \"postal\" numa rede (mutável).';

  @override
  String get ipBasicsSection1Bullet3 =>
      'Máscara = \"distrito / código postal\" (define a sub-rede).';

  @override
  String get ipBasicsSection1Bullet4 =>
      'Gateway = \"saída da vizinhança\" (router).';

  @override
  String get ipBasicsSection1Subtitle => 'IPv4 em 10 segundos';

  @override
  String get ipBasicsSection1SubBullet1 =>
      'Formato: A.B.C.D (4 números de 0 a 255).';

  @override
  String get ipBasicsSection1SubBullet2 => 'Ex: 192.168.0.50';

  @override
  String get ipBasicsSection1SubBullet3 =>
      'Não é mágica: são 32 bits (4 bytes).';

  @override
  String get ipBasicsSection1SubBullet4 =>
      'O que conta para si: IP + máscara devem ser consistentes entre dispositivos.';

  @override
  String get ipBasicsSection2Paragraph =>
      'Alguns intervalos de endereços IPv4 estão reservados para redes privadas (LANs). Não são encaminhadas na Internet. É por isso que são utilizados em espectáculos: pode configurar a sua própria rede local sem \"consumir\" IPs públicos.';

  @override
  String get ipBasicsSection2CalloutTitle =>
      'As 3 grandes praias privadas (LAN)';

  @override
  String get ipBasicsSection2Bullet1 =>
      '10.0.0.0 → 10.255.255.255 (frequentemente escrito \"10.x.x.x\")';

  @override
  String get ipBasicsSection2Bullet2 =>
      '172.16.0.0 → 172.31.255.255 (frequentemente \"172.16-31.x.x\")';

  @override
  String get ipBasicsSection2Bullet3 =>
      '192.168.0.0 → 192.168.255.255 (frequentemente \"192.168.x.x\")';

  @override
  String get ipBasicsSection2Subtitle1 =>
      'Porque é que vemos frequentemente 192.168.x.x?';

  @override
  String get ipBasicsSection2SubBullet1 =>
      'As caixas/routers de consumo utilizam frequentemente 192.168.0.x ou 192.168.1.x.';

  @override
  String get ipBasicsSection2SubBullet2 =>
      'Isto tornou-se uma norma de facto em pequenas LANs.';

  @override
  String get ipBasicsSection2SubBullet3 =>
      'Mas no modo show, 10.x.x.x é prático se quiser muitos endereços ou várias VLANs.';

  @override
  String get ipBasicsSection2Subtitle2 => 'E o famoso 2.x.x.x.x (Art-Net)?';

  @override
  String get ipBasicsSection2SubBullet4 =>
      'Muitos equipamentos Art-Net saem da fábrica com um IP de 2.x.x.x (rede fechada).';

  @override
  String get ipBasicsSection2SubBullet5 =>
      'É \"prático\" em plug&play (sem DHCP), mas surpreendente se o seu PC estiver em 192.168.x.x.';

  @override
  String get ipBasicsSection2SubBullet6 =>
      'Importante: não há nada de mágico em \"2.x\" para transmissão/unicast.';

  @override
  String get ipBasicsSection2SubBullet7 =>
      'O que altera o âmbito do broadcast é a máscara (frequentemente /8 = 255.0.0.0 no legado).';

  @override
  String get ipBasicsSection2SubBullet8 =>
      'Exemplo: rede 2.0.0.0/8 → broadcast = 2.255.255.255 (muito grande).';

  @override
  String get ipBasicsSection2SubBullet9 =>
      'Solução simples: colocar PC/consola na mesma gama + mesma máscara, ou reconfigurar o nó num plano 192/10.';

  @override
  String get ipBasicsSection3Paragraph =>
      'A máscara de sub-rede diz-lhe quais os endereços que estão \"na mesma rede\". Sem uma máscara, um IP não tem grande significado.\n\nRegra básica: se dois dispositivos estiverem na mesma sub-rede, falam diretamente um com o outro. Caso contrário, precisam de um gateway (router).';

  @override
  String get ipBasicsSection3Callout1Title => 'As máscaras mais comuns';

  @override
  String get ipBasicsSection3Bullet1 =>
      '255.0.0.0 ( /8 ) → 10.x.x.x.x rede \"grande\" típica';

  @override
  String get ipBasicsSection3Bullet2 =>
      '255.255.0.0 ( /16 ) → 10.10.x.x ou 192.168.x.x rede \"grande\"';

  @override
  String get ipBasicsSection3Bullet3 =>
      '255.255.255.0 ( /24 ) → rede \"clássica\" 192.168.0.x (254 dispositivos)';

  @override
  String get ipBasicsSection3Callout2Title =>
      'Máscara → endereço de difusão (muito útil para compreender)';

  @override
  String get ipBasicsSection3Bullet4 =>
      'A difusão depende da sub-rede, ou seja, da máscara (não \"2 vs 192\").';

  @override
  String get ipBasicsSection3Bullet5 =>
      '192.168.10.0/24 → broadcast = 192.168.10.255 (rede pequena).';

  @override
  String get ipBasicsSection3Bullet6 =>
      '2.0.0.0/8 (255.0.0.0) → broadcast = 2.255.255.255 (rede enorme).';

  @override
  String get ipBasicsSection3Bullet7 =>
      'Quanto \"maior\" for a rede, mais ruído pode fazer uma emissão (se a utilizar frequentemente).';

  @override
  String get ipBasicsSection3Subtitle1 => 'Exemplo concreto (o mais útil): /24';

  @override
  String get ipBasicsSection3SubBullet1 => 'IP: 192.168.0.50';

  @override
  String get ipBasicsSection3SubBullet2 => 'Máscara : 255.255.255.0 ( /24 )';

  @override
  String get ipBasicsSection3SubBullet3 => 'Rede: 192.168.0.0';

  @override
  String get ipBasicsSection3SubBullet4 =>
      'Dispositivos \"na mesma rede\": 192.168.0.1 → 192.168.0.254';

  @override
  String get ipBasicsSection3SubBullet5 =>
      'Se mudar para 192.168.1.50 → NÃO é a mesma rede.';

  @override
  String get ipBasicsSection3Subtitle2 => 'Porquê criar sub-redes?';

  @override
  String get ipBasicsSection3SubBullet6 =>
      'Organização: separar \"luzes\", \"vídeo\", \"intercomunicador\", \"Internet\", etc.';

  @override
  String get ipBasicsSection3SubBullet7 =>
      'Desempenho: limitar o ruído (difusão/multicast) a um grupo.';

  @override
  String get ipBasicsSection3SubBullet8 =>
      'Segurança: impedir que um PC \"convidado\" veja/perturbe a rede do espetáculo.';

  @override
  String get ipBasicsSection3SubBullet9 =>
      'Diagnóstico: é mais fácil saber \"onde\" está um dispositivo.';

  @override
  String get ipBasicsSection3Callout3Title => 'Armadilha clássica';

  @override
  String get ipBasicsSection3Bullet8 =>
      'O mesmo IP \"início\" ≠ mesma rede se a máscara não for idêntica.';

  @override
  String get ipBasicsSection3Bullet9 =>
      'Ex: 10.0.0.5/8 e 10.0.0.200/24 → não são o mesmo perímetro lógico.';

  @override
  String get ipBasicsSection4Subtitle1 => 'DHCP (atribuição automática)';

  @override
  String get ipBasicsSection4SubBullet1 =>
      'Um servidor DHCP \"dá\": IP + máscara + gateway + DNS.';

  @override
  String get ipBasicsSection4SubBullet2 =>
      'Prático: liga-se à corrente e funciona.';

  @override
  String get ipBasicsSection4SubBullet3 =>
      'Risco: se o DHCP cair/alterar/conflitar → sintomas estranhos.';

  @override
  String get ipBasicsSection4Subtitle2 => 'Estático (IP fixo)';

  @override
  String get ipBasicsSection4SubBullet4 =>
      'Define IP + máscara (e possivelmente gateway/DNS).';

  @override
  String get ipBasicsSection4SubBullet5 =>
      'Muito útil para: consola, nós, comutador gerido, apresentação de AP Wi-Fi.';

  @override
  String get ipBasicsSection4SubBullet6 =>
      'Risco: duplicação de PI se o plano não for claro (conflito).';

  @override
  String get ipBasicsSection4Callout1Title => 'Porta de entrada';

  @override
  String get ipBasicsSection4Bullet1 =>
      'Este é o endereço do router: é utilizado para ir \"para fora da rede local\".';

  @override
  String get ipBasicsSection4Bullet2 =>
      'Se se criar uma rede de espectáculos isolada (sem Internet) → gateway muitas vezes inútil.';

  @override
  String get ipBasicsSection4Bullet3 =>
      'Mas se quiser sair para outra VLAN / Internet → essencial.';

  @override
  String get ipBasicsSection4Callout2Title => 'DNS';

  @override
  String get ipBasicsSection4Bullet4 =>
      'DNS = \"diretório\": transforma um nome (por exemplo, exemplo.com) num IP.';

  @override
  String get ipBasicsSection4Bullet5 =>
      'No programa (Art-Net/sACN), muitas vezes inútil: trabalha-se em IP direto.';

  @override
  String get ipBasicsSection4Bullet6 =>
      'Se utilizar serviços (actualizações, licenças, servidor de tempo, streaming) → o DNS volta a ser útil.';

  @override
  String get ipBasicsSection4Subtitle3 => 'Regra simples (para principiantes)';

  @override
  String get ipBasicsSection4SubBullet7 =>
      'Pequeno programa fechado: estático em todo o lado, sem gateway, sem DNS.';

  @override
  String get ipBasicsSection4SubBullet8 =>
      'Mostrar com Internet / várias redes: DHCP controlado + reservas DHCP, ou plano estático + router.';

  @override
  String get ipBasicsSection5Paragraph =>
      'Quando A quer falar com B, olha para a máscara :\n- Se B estiver na mesma sub-rede → A envia diretamente para a rede local.\n- Se B estiver fora da sub-rede → A envia para o gateway (router), que trata do resto.';

  @override
  String get ipBasicsSection5Callout1Title => 'Exemplo (fácil)';

  @override
  String get ipBasicsSection5Bullet1 => 'A = 192.168.0.10 /24';

  @override
  String get ipBasicsSection5Bullet2 =>
      'B = 192.168.0.50 /24 → mesma rede → OK direto.';

  @override
  String get ipBasicsSection5Bullet3 =>
      'B = 192.168.1.50 /24 → rede diferente → é necessário um router/gateway.';

  @override
  String get ipBasicsSection5Subtitle => 'Porque é que não faz ping?';

  @override
  String get ipBasicsSection5SubBullet1 =>
      'Máscara diferente → A pensa que B está \"noutro lugar\" (ou vice-versa).';

  @override
  String get ipBasicsSection5SubBullet2 =>
      'Sem gateway → impossível sair da sub-rede.';

  @override
  String get ipBasicsSection5SubBullet3 =>
      'Firewall do PC → ping bloqueado (Windows muito comum).';

  @override
  String get ipBasicsSection5SubBullet4 =>
      'Cabo / switch / VLAN: fisicamente não estão no mesmo segmento.';

  @override
  String get ipBasicsSection5Callout2Title =>
      'Broadcast vs unicast (bónus útil)';

  @override
  String get ipBasicsSection5Bullet4 =>
      'Unicast: para um IP específico (limpo).';

  @override
  String get ipBasicsSection5Bullet5 =>
      'Broadcast: \"para toda a gente\" na sub-rede (ruidoso).';

  @override
  String get ipBasicsSection5Bullet6 =>
      'Em resumo: a difusão pode funcionar em redes pequenas, mas rapidamente se torna uma fonte de ruído em redes grandes.';

  @override
  String get ipBasicsSection6Subtitle1 =>
      'Plano A - ultra simples (uma rede /24)';

  @override
  String get ipBasicsSection6Code1 =>
      'Rede: 192.168.10.0/24 (máscara 255.255.255.0)\n\nConsola: 192.168.10.10\nPC (controlo): 192.168.10.20\nNó 1: 192.168.10.101\nNó 2: 192.168.10.102\nSwitch gerenciado: 192.168.10.2\nGateway: (vazio) ou 192.168.10.1 se houver um router';

  @override
  String get ipBasicsSection6Callout1Title => 'Porque é que funciona';

  @override
  String get ipBasicsSection6Bullet1 =>
      'Todos na mesma sub-rede → sem surpresas.';

  @override
  String get ipBasicsSection6Bullet2 =>
      'Fácil de explicar, fácil de resolver problemas.';

  @override
  String get ipBasicsSection6Bullet3 =>
      'Ideal para principiantes / espectáculos de pequena e média dimensão.';

  @override
  String get ipBasicsSection6Subtitle2 =>
      'Plano B - \"10.x\" quando se quer crescer';

  @override
  String get ipBasicsSection6Code2 =>
      'Rede: 10.10.0.0/16 (máscara 255.255.0.0)\n\nConsola: 10.10.0.10\nPC: 10.10.0.20\nNós: 10.10.1.10 → 10.10.1.200\nComutador: 10.10.0.2';

  @override
  String get ipBasicsSection6Callout2Title => 'Quando o utilizar';

  @override
  String get ipBasicsSection6Bullet4 =>
      'Quando se tem muitos equipamentos (ou várias zonas).';

  @override
  String get ipBasicsSection6Bullet5 =>
      'Quando planear a VLAN mais tarde (luz/vídeo/TI).';

  @override
  String get ipBasicsSection6Subtitle3 =>
      'Plano C - compat Art-Net \"2.x.x.x\" (legado)';

  @override
  String get ipBasicsSection6Code3 =>
      'Rede: 2.0.0.0/8 (máscara 255.0.0.0)\n\nPC/consola: 2.0.0.10\nNó 1: 2.0.0.100\nNó 2: 2.0.0.101\n\n⚠️ Rede isolada, sem Internet, sem encaminhamento.';

  @override
  String get ipBasicsSection6Callout3Title => 'Atenção';

  @override
  String get ipBasicsSection6Bullet6 =>
      'Este plano é prático para os equipamentos mais antigos / de série.';

  @override
  String get ipBasicsSection6Bullet7 =>
      'Mas evite misturá-la com uma LAN \"normal\" (192.168.x.x) sem um router.';

  @override
  String get ipBasicsSection7Callout1Title => 'Sintomas → causas prováveis';

  @override
  String get ipBasicsSection7Bullet1 =>
      '\"Consigo ver o nó, mas ele não está a responder\" → máscara / VLAN / firewall diferentes.';

  @override
  String get ipBasicsSection7Bullet2 =>
      '\"Um dispositivo funciona e depois desaparece\" → DHCP instável / conflito de IP.';

  @override
  String get ipBasicsSection7Bullet3 =>
      '\"Nada funciona exceto no comutador\" → IP não está na mesma rede / cabo errado / porta VLAN.';

  @override
  String get ipBasicsSection7Bullet4 =>
      '\"Tudo se arrasta / perdas\" → difusão/multicast demasiado grande / comutador de baixa qualidade / loop de rede.';

  @override
  String get ipBasicsSection7Bullet5 =>
      '\"Funciona com fios mas não com Wi-Fi\" → jitter / roaming / saturação de banda / poupança de energia.';

  @override
  String get ipBasicsSection7Subtitle => 'Método profissional em 5 minutos';

  @override
  String get ipBasicsSection7SubBullet1 =>
      '1) Verificar o IP + máscara da consola/PC e do nó.';

  @override
  String get ipBasicsSection7SubBullet2 =>
      '2) Verificar: mesma sub-rede (por exemplo, 192.168.10.x /24)';

  @override
  String get ipBasicsSection7SubBullet3 =>
      '3) Ping (se possível) + teste de acesso à interface Web do nó.';

  @override
  String get ipBasicsSection7SubBullet4 =>
      '4) Se for DHCP: listar quem tem que IP (tabela DHCP) e verificar se há duplicados.';

  @override
  String get ipBasicsSection7SubBullet5 =>
      '5) Se sACN multicast: verificar IGMP snooping/querier (caso contrário, flood).';

  @override
  String get ipBasicsSection7Callout2Title => 'Armadilha muito comum';

  @override
  String get ipBasicsSection7Bullet6 =>
      'Máscara \"herdada\" num PC (255.255.0.0 em vez de 255.255.255.0).';

  @override
  String get ipBasicsSection7Bullet7 =>
      'Resultado: pensa que está \"na mesma rede\", mas não como o outro dispositivo.';

  @override
  String get ipBasicsSection8Subtitle1 =>
      'Exercício 1: a mesma rede ou não (/24)';

  @override
  String get ipBasicsSection8SubBullet1 => 'A = 192.168.10.50 /24';

  @override
  String get ipBasicsSection8SubBullet2 =>
      'B = 192.168.10.200 /24 → ✅ mesma rede';

  @override
  String get ipBasicsSection8SubBullet3 =>
      'B = 192.168.11.200 /24 → ❌ não é a mesma rede';

  @override
  String get ipBasicsSection8Subtitle2 => 'Exercício 2: /16 (255.255.0.0)';

  @override
  String get ipBasicsSection8SubBullet4 => 'A = 10.10.5.10 /16';

  @override
  String get ipBasicsSection8SubBullet5 =>
      'B = 10.10.200.20 /16 → ✅ mesma rede (10.10.x.x)';

  @override
  String get ipBasicsSection8SubBullet6 =>
      'B = 10.11.200.20 /16 → ❌ não é a mesma rede';

  @override
  String get ipBasicsSection8CalloutTitle => 'Sugestão visual';

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
  String get ipBasicsSection8Subtitle3 => 'Exercício 3: evitar IPs \"estranhos';

  @override
  String get ipBasicsSection8SubBullet7 =>
      '0.x.x.x: reservado (não é um IP de anfitrião normal).';

  @override
  String get ipBasicsSection8SubBullet8 =>
      '127.x.x.x.x: loopback (o próprio PC).';

  @override
  String get ipBasicsSection8SubBullet9 =>
      '169.254.x.x: auto-IP quando o DHCP está ausente (APIPA) → sinal de problema no DHCP.';

  @override
  String get ipBasicsSection9CalloutTitle =>
      'Antes de procurar o almoço às 14 horas';

  @override
  String get ipBasicsSection9Bullet1 =>
      'Mesma sub-rede = IP + máscara consistentes.';

  @override
  String get ipBasicsSection9Bullet2 => 'Não há IPs duplicados (conflito).';

  @override
  String get ipBasicsSection9Bullet3 =>
      'DHCP: OK se dominado; caso contrário, limpar plano estático.';

  @override
  String get ipBasicsSection9Bullet4 =>
      'Firewall do PC: pode bloquear o ping/descoberta.';

  @override
  String get ipBasicsSection9Bullet5 =>
      'Switch/VLAN: porta correta, VLAN correta, sem loops.';

  @override
  String get ipBasicsSection9Bullet6 =>
      'multicast sACN: recomenda-se a deteção/consulta de IGMP.';

  @override
  String get ipBasicsChecklistCopy =>
      'Rede - Lista de verificação rápida (IP)\nTodos os dispositivos estão na mesma sub-rede (IP + máscara consistentes)\nNão há IPs duplicados (conflito)\nDHCP: ou todos em DHCP, ou plano estático claro (evitar mistura difusa)\nPara Art-Net/sACN: rede dedicada ou VLAN, se possível.\nComutador gerido se for multicast/IGMP (sACN)\nWi-Fi: evitar para a apresentação de dados críticos (jitter), preferir com fios\nTeste simples: ping + verificação de máscara/gateway';

  @override
  String get ipBasicsFooterNote =>
      'Objetivo: compreender o suficiente para ligar/configurar/resolver problemas rapidamente num espetáculo.\nOs pormenores da rede podem ser mais profundos, mas estas noções básicas cobrem 90% das falhas no terreno.';

  @override
  String get aboutDmxPainterTerm120 => 'TERMO\n120Ω';

  @override
  String get aboutDmxPainterDaisyChainNote =>
      'Cadeia de margaridas\nNão passivo Y';

  @override
  String get aboutDmxPainterXlr5Title => 'XLR5 (DMX) - marcador rápido';

  @override
  String get aboutDmxPainterPin1 => 'Pino 1: Proteção / terra';

  @override
  String get aboutDmxPainterPin2 => 'Pino 2: Dados-';

  @override
  String get aboutDmxPainterPin3 => 'Pino 3 : Dados+';

  @override
  String get aboutDmxPainterPin45 => 'Pino 4/5: \"dados 2\" (raro / opcional)';

  @override
  String get aboutDmxPainterXlr3Practice =>
      'Na prática: XLR3 frequentemente utilizado (1/2/3)';

  @override
  String get aboutDmxPainterLastFixture => 'ÚLTIMAS\nAPARELHOS';

  @override
  String get aboutDmxPainterTerminationLine =>
      'Terminação = 120Ω no fim da linha';

  @override
  String get aboutDmxPainter120Between => '120Ω\nentre\nDados- e Dados+';

  @override
  String get aboutDmxPainterOneTermination =>
      'Um único final\nNão no meio\nNão em cada ramo';

  @override
  String get aboutDmxPainterConsoleIp => 'CONSOLE\nArt-Net / sACN';

  @override
  String get aboutDmxPainterSwitchSacn => 'SWITCH\n(IGMP para sACN)';

  @override
  String get aboutDmxPainterNode1 => 'NÓDULO 1\nDMX OUT';

  @override
  String get aboutDmxPainterNode2 => 'NÓDULO 2\nDMX OUT';

  @override
  String get aboutDmxPainterFix => 'CORRIGIR';

  @override
  String get aboutDmxPainterManyUniverses =>
      'Muitos universos\nNós próximos de máquinas';

  @override
  String get aboutArtnetSection2Paragraph =>
      'O seu objetivo: que cada universo emitido pela fonte chegue ao nó certo (e à porta DMX) sem ambiguidade. A maioria das falhas da Art-Net = universo errado, sub-rede/rede errada ou saturação de difusão.';

  @override
  String get aboutArtnetSection2CalloutTitle =>
      'Método simples (evita 80% dos erros)';

  @override
  String get aboutArtnetSection2Bullet1 =>
      '1) Escrever no papel: \"Universo 1 → Nó A porta 1\", \"Universo 2 → Nó A porta 2\", etc.';

  @override
  String get aboutArtnetSection2Bullet2 =>
      '2) Definir IPs estáveis (DHCP reservado ou estático).';

  @override
  String get aboutArtnetSection2Bullet3 =>
      '3) Utilize unicast se tiver mais do que um nó ou uma rede partilhada.';

  @override
  String get aboutArtnetSection2Subtitle1 => 'Broadcast vs Unicast';

  @override
  String get aboutArtnetSection2SubBullet1 =>
      'Broadcast: envia-se para toda a gente → fácil, mas pode \"inundar\" um comutador.';

  @override
  String get aboutArtnetSection2SubBullet2 =>
      'Unicast: envia-se para o IP do nó → mais limpo e previsível.';

  @override
  String get aboutArtnetSection2SubBullet3 =>
      'En show: em caso de dúvida → unicast.';

  @override
  String get aboutArtnetSection2Subtitle2 => 'Universo: experiência prática';

  @override
  String get aboutArtnetSection2SubBullet4 =>
      'Manter a numeração simples (por exemplo, 1...N).';

  @override
  String get aboutArtnetSection2SubBullet5 =>
      'Evite \"um universo em todo o lado\": documente os seus mapeamentos.';

  @override
  String get aboutArtnetSection2SubBullet6 =>
      'Em algumas configurações, existe a \"Rede/Sub-rede/Universo\": pense em \"mapeamento\", não em \"magia\".';

  @override
  String get aboutArtnetSection3CalloutTitle =>
      'Os limites \"reais\" (por ordem)';

  @override
  String get aboutArtnetSection3Bullet1 =>
      'Wi-Fi: latência variável + perdas → cintilação ou falhas.';

  @override
  String get aboutArtnetSection3Bullet2 =>
      'Difusão: sobrecarrega uma LAN (toda a gente recebe tudo).';

  @override
  String get aboutArtnetSection3Bullet3 =>
      'Switch \"low-end\": buffers limitados, gestão medíocre de multicast/broadcast.';

  @override
  String get aboutArtnetSection3Bullet4 =>
      'Nós: limite de firmware/CPU (número de universos, frequência, opções).';

  @override
  String get aboutArtnetSection3Bullet5 =>
      'PC/fonte: controlador, carga da CPU, antivírus, placa de rede, etc.';

  @override
  String get aboutArtnetSection3Subtitle1 => 'Velocidade de atualização';

  @override
  String get aboutArtnetSection3SubBullet1 =>
      'O DMX \"clássico\" é frequentemente de ~20-44 fps, dependendo do quadro.';

  @override
  String get aboutArtnetSection3SubBullet2 =>
      'No IP, pode enviar mais, mas os nós nem sempre o seguem (e nem sempre é útil).';

  @override
  String get aboutArtnetSection3SubBullet3 =>
      'Estabilidade > frequência: estável a 30-40 fps é melhor do que \"rápido\" mas instável.';

  @override
  String get aboutArtnetSection3Subtitle2 => 'Regras simples';

  @override
  String get aboutArtnetSection3SubBullet4 => 'Rede dedicada (ou VLAN).';

  @override
  String get aboutArtnetSection3SubBullet5 => 'Unicast se houver vários nós.';

  @override
  String get aboutArtnetSection3SubBullet6 =>
      'Preparado para espectáculos críticos.';

  @override
  String get aboutArtnetSection4Paragraph =>
      'Um nó = IP → DMX. Pode ter 1, 2, 4 ou 8 portas DMX. A estabilidade depende do nó E da cablagem DMX no lado da saída (terminação, topologia, divisores).';

  @override
  String get aboutArtnetSection4Subtitle1 => 'Nós vs Divisores';

  @override
  String get aboutArtnetSection4SubBullet1 =>
      'Nó: converte IP→DMX (e por vezes DMX→IP).';

  @override
  String get aboutArtnetSection4SubBullet2 =>
      'Divisor DMX: divide uma linha DMX em ramificações (opto recomendado).';

  @override
  String get aboutArtnetSection4SubBullet3 =>
      'Boa conceção: IP até ao mais ínfimo pormenor, depois DMX curto e limpo.';

  @override
  String get aboutArtnetSection4CalloutTitle =>
      'RDM na Art-Net (suporte variável)';

  @override
  String get aboutArtnetSection4Bullet1 =>
      'Alguns nós suportam um proxy RDM: a consola vê/configura os dispositivos RDM através de IP.';

  @override
  String get aboutArtnetSection4Bullet2 =>
      'Outros não suportam RDM de todo, ou apenas parcialmente.';

  @override
  String get aboutArtnetSection4Bullet3 =>
      'Um repartidor opto \"clássico\" pode bloquear o retorno RDM (dependendo do modelo).';

  @override
  String get aboutArtnetSection4Bullet4 =>
      'Sugestão: se pretender RDM, escolha explicitamente o hardware marcado como compatível com RDM.';

  @override
  String get aboutArtnetSection4Subtitle2 => 'Bons reflexos no terreno';

  @override
  String get aboutArtnetSection4SubBullet4 =>
      'Se o DMX for instável: ajustar primeiro o DMX (terminação, cabo, Y passivo) e só depois o IP.';

  @override
  String get aboutArtnetSection4SubBullet5 =>
      'Se o RDM for instável: desactiva o RDM para verificar se o DMX puro é estável.';

  @override
  String get aboutArtnetSection5CalloutTitle => 'Sintomas → causas prováveis';

  @override
  String get aboutArtnetSection5Bullet1 =>
      'Cintilação em todo o conjunto → Wi-Fi, inundação de transmissões, interrutor saturado.';

  @override
  String get aboutArtnetSection5Bullet2 =>
      'Um nó OK, o outro não → universo/mapeamento, IP, unicast mal configurado.';

  @override
  String get aboutArtnetSection5Bullet3 =>
      'Quedas aleatórias → cabo RJ45 defeituoso, comutador instável, PC que deixa cair os pacotes.';

  @override
  String get aboutArtnetSection5Bullet4 =>
      'Uma única porta DMX num nó KO → cabo DMX, terminação, aparelho que interrompe a linha.';

  @override
  String get aboutArtnetSection5Bullet5 =>
      'Descoberta de RDM impossível → nó/splitter não compatível com RDM, cablagem DMX limítrofe.';

  @override
  String get aboutArtnetSection5Subtitle => 'Método rápido';

  @override
  String get aboutArtnetSection5SubBullet1 =>
      '1) Unicast para um único nó (teste simples).';

  @override
  String get aboutArtnetSection5SubBullet2 =>
      '2) Verificar o universo/mapeamento (papel + configuração dos nós).';

  @override
  String get aboutArtnetSection5SubBullet3 =>
      '3) Teste direto com fios (PC → interrutor → nó) com cabo conhecido OK.';

  @override
  String get aboutArtnetSection5SubBullet4 =>
      '4) Isolar o DMX: nó → 1 dispositivo + terminação.';

  @override
  String get aboutArtnetSection6Subtitle1 =>
      'Arquitetura própria (IP → nós → DMX curto)';

  @override
  String get aboutArtnetSection6Subtitle2 => 'Broadcast vs Unicast (ideia)';

  @override
  String get aboutArtnetAssetsCopyTitle => 'Activos recomendados (opcional)';

  @override
  String get aboutArtnetExampleLabel => 'exemplo';

  @override
  String get aboutArtnetAssetsCopyTooltip => 'Copiar lista de activos';

  @override
  String get aboutArtnetAssetsParagraph =>
      'Secção utilizada para ilustrar a rede (RJ45, switch, cabos). Se os activos não existirem, a aplicação apresenta um fallback limpo.';

  @override
  String get aboutArtnetAssetsExamplesTitle => 'Exemplos';

  @override
  String get aboutArtnetAssetsRj45Label => 'RJ45';

  @override
  String get aboutArtnetAssetsRj45Hint => 'Conector Ethernet';

  @override
  String get aboutArtnetAssetsSwitchLabel => 'Interruptor';

  @override
  String get aboutArtnetAssetsSwitchHint =>
      'Switch (idealmente gerido se IGMP/VLAN)';

  @override
  String get aboutArtnetAssetsCableLabel => 'Cabo Ethernet';

  @override
  String get aboutArtnetAssetsCableHint => 'Cat5e/Cat6 = base fiável';

  @override
  String get aboutArtnetChecklistCopyTitle =>
      'Art-Net - Lista de controlo no terreno';

  @override
  String get aboutArtnetChecklistCopyTooltip => 'Copiar a lista de controlo';

  @override
  String get aboutArtnetChecklistTitle => 'Antes de entrar em pânico';

  @override
  String get aboutArtnetChecklistBullet1 => 'Unicast se houver vários nós.';

  @override
  String get aboutArtnetChecklistBullet2 =>
      'Rede dedicada (ou VLAN), se possível.';

  @override
  String get aboutArtnetChecklistBullet3 =>
      'Com fio para o espetáculo crítico.';

  @override
  String get aboutArtnetChecklistBullet4 => 'Universo/mapeamento documentado.';

  @override
  String get aboutArtnetChecklistBullet5 =>
      'Teste IP simples → 1 nó → 1 dispositivo + terminação.';

  @override
  String get aboutArtnetChecklistBullet6 =>
      'Se RDM: nó \"RDM proxy\" confirmado + cablagem DMX estável';

  @override
  String get aboutArtnetFooterNote =>
      'Informação indicativa (campo). O comportamento pode variar consoante os nós/switch/firmware.\nO objetivo aqui é compreender e diagnosticar rapidamente.';

  @override
  String get aboutArtnetDiagramSourceLabel => 'FONTE\n(PC/consola)';

  @override
  String get aboutArtnetDiagramSwitchLabel => 'COMUTADOR';

  @override
  String get aboutArtnetDiagramNode1Label => 'NÓDULO 1\nDMX OUT';

  @override
  String get aboutArtnetDiagramNode2Label => 'NÓDULO 2\nDMX OUT';

  @override
  String get aboutArtnetDiagramFixLabel => 'CORRIGIR';

  @override
  String get aboutArtnetDiagramInfoLabel => 'IP longo / DMX curto';

  @override
  String get aboutArtnetDiagramSourceShortLabel => 'FONTE';

  @override
  String get aboutArtnetDiagramNodeALabel => 'NÓDULO A';

  @override
  String get aboutArtnetDiagramNodeBLabel => 'NÓDULO B';

  @override
  String get aboutArtnetDiagramNodeCLabel => 'NÓDULO C';

  @override
  String get aboutArtnetDiagramUnicastLabel => 'Unicast: pacotes para um nó';

  @override
  String get aboutArtnetDiagramBroadcastLabel => 'Difusão: todos recebem';

  @override
  String get aboutArtnetMissingAssetLabel => 'Ativo em falta';

  @override
  String get aboutRegistryDmxTitle =>
      'DMX - funcionamento (simples e completo)';

  @override
  String get aboutRegistryDmxSubtitle =>
      'Universo, endereços, quadros, cablagem RS-485, terminação, erros de campo.\nInclui diagramas e lista de controlo.';

  @override
  String get aboutRegistryArtnetTitle =>
      'Art-Net - DMX sobre IP (nós, unicast/broadcast)';

  @override
  String get aboutRegistryArtnetSubtitle =>
      'Universo DMX em Ethernet/UDP, nós, broadcast vs unicast.\nLimites reais, estabilidade da rede, RDM em função do equipamento, esquemas + lista de controlo.';

  @override
  String get aboutRegistrySacnTitle =>
      'sACN / E1.31 - multicast, IGMP, prioridades';

  @override
  String get aboutRegistrySacnSubtitle =>
      'Norma DMX sobre IP para redes profissionais.\nMulticast/unicast, IGMP snooping/query, prioridades multi-fonte, esquemas + lista de controlo.';

  @override
  String get aboutRegistryIpBasicsTitle =>
      'Rede - bases IP / máscara / DHCP (essencial)';

  @override
  String get aboutRegistryIpBasicsSubtitle =>
      'Compreender o IP, máscara, gateway, DHCP vs estático.\nExemplos concretos (2.x.x.x, 10.x, 192.168.x), testes rápidos, mostrar armadilhas.';

  @override
  String get aboutRegistryReseauTitle =>
      'Rede - RJ45 / Fibra / taxas de bits e comprimentos';

  @override
  String get aboutRegistryReseauSubtitle =>
      'Cat5e→Cat8, fibra OM3/OM4/OS2, LC/SC/MPO, distâncias típicas, espetáculo de boas práticas.';

  @override
  String get aboutRegistryNetworkTitle =>
      'Rede leve - VLAN, IGMP, Wi-Fi vs. com fios';

  @override
  String get aboutRegistryNetworkSubtitle =>
      'Arquitetura simples e robusta para Art-Net/sACN.\nVLAN, IGMP snooping/query, Wi-Fi (jitter), comutadores, diagramas + lista de controlo.';

  @override
  String get aboutRegistryVideoTitle => 'Vídeo - SDI / NDI / IP (SRT/RTMP)';

  @override
  String get aboutRegistryVideoSubtitle =>
      'Escolha de acordo com a latência, fiabilidade, cablagem, LAN vs WAN.\nTabelas + diagrama.';

  @override
  String get aboutRegistryElectriciteTitle =>
      'Elétrico - Schuko / P17 / potências';

  @override
  String get aboutRegistryElectriciteSubtitle =>
      'Conectores, mono/tri, painéis rápidos de kW (16A→400A), armadilhas de campo.';

  @override
  String get aboutRegistryInformatiqueTitle =>
      'IT - USB / HDMI / DP / SATA / NVMe...';

  @override
  String get aboutRegistryInformatiqueSubtitle =>
      'Velocidades úteis, versões, limites reais, armadilhas de marketing.';

  @override
  String get aboutUniverseToHexColHex => 'Hexadecimal';

  @override
  String get aboutUniverseToHexNote => 'Índice = Universo - 1 (base 0).';

  @override
  String get aboutNetworkPageTitle => 'Rede ligeira - VLAN, IGMP, Wi-Fi';

  @override
  String get aboutNetworkCopyTooltip => 'Marcadores de cópia';

  @override
  String get aboutNetworkChecklistCopyTooltip => 'Cópia';

  @override
  String get aboutNetworkChecklistTitle => 'Antes de abrir o Wireshark 😄';

  @override
  String get aboutNetworkFooterNote =>
      'Informação indicativa (campo). Dependendo do hardware da rede, o IGMP/VLAN pode ser essencial.\nObjetivo: manter a simplicidade e a robustez.';

  @override
  String get aboutNetworkCopy1 =>
      'Rede de luz: objetivo simples, dedicado e estável.';

  @override
  String get aboutNetworkCopy2 => 'VLAN = tráfego separado (luz vs. resto).';

  @override
  String get aboutNetworkCopy3 =>
      'IGMP = essencial se sACN multicast em grande escala.';

  @override
  String get aboutNetworkCopy4 =>
      'Wi-Fi = OK para resolução de problemas, raramente OK para produção crítica.';

  @override
  String get aboutNetworkChecklistCopy =>
      'Rede de iluminação - Lista de controlo\nRede dedicada ou VLAN de iluminação\nPlano IP claro (DHCP ou estático) + máscara ok\nSwitch correto; loops evitados\nMulticast sACN: snooping IGMP ativado\nIGMP querier presente na VLAN (se a infraestrutura o exigir)\nUnicast para resolução de problemas (especialmente Art-Net)\nWi-Fi: evitar produtos críticos (jitter/perdas)\nTestes: ping estável + carga progressiva (universo)';

  @override
  String get aboutNetworkToc1 => '1) Objetivo: rede estável';

  @override
  String get aboutNetworkToc2 => '2) Plano IP (simples)';

  @override
  String get aboutNetworkToc3 => '3) VLAN (separação)';

  @override
  String get aboutNetworkToc4 => '4) IGMP (multicast sACN)';

  @override
  String get aboutNetworkToc5 => '5) Wi-Fi vs. com fios';

  @override
  String get aboutNetworkToc6 => '6) Switch: o que é necessário';

  @override
  String get aboutNetworkToc7 => '7) Diagramas';

  @override
  String get aboutNetworkToc8 => '8) Lista de controlo';

  @override
  String get aboutNetworkBasicsPill1 => 'Dedicado/VLAN';

  @override
  String get aboutNetworkBasicsPill2 => 'Com fio';

  @override
  String get aboutNetworkBasicsPill3 => 'IGMP se multicast';

  @override
  String get aboutNetworkBasicsParagraph =>
      'Uma rede leve deve ser previsível: baixa perda, baixo jitter, arquitetura simples. Quando as coisas correm mal, raramente é \"o protocolo\" e muitas vezes é a infraestrutura (switch, Wi-Fi, loops, flood).';

  @override
  String get aboutNetworkBasicsCalloutTitle => 'Regra de base';

  @override
  String get aboutNetworkBasicsBullet1 =>
      'Se possível: com fios + switch correto + rede dedicada (ou VLAN).';

  @override
  String get aboutNetworkBasicsBullet2 =>
      'Se tiver de partilhar: VLAN + regras claras.';

  @override
  String get aboutNetworkBasicsBullet3 =>
      'sACN multicast: o IGMP torna-se rapidamente obrigatório.';

  @override
  String get aboutNetworkPlanIpParagraph =>
      'Escolha uma estratégia simples e consistente. Duas abordagens: DHCP (simples) ou estática (previsível). Na pior das hipóteses: uma mistura não documentada.';

  @override
  String get aboutNetworkPlanIpCalloutTitle => 'Exemplo de um plano (simples)';

  @override
  String get aboutNetworkPlanIpBullet1 => 'VLAN leve: 10.10.0.0/24';

  @override
  String get aboutNetworkPlanIpBullet2 => 'Consola/PC: 10.10.0.10';

  @override
  String get aboutNetworkPlanIpBullet3 => 'Nós: 10.10.0.100-150';

  @override
  String get aboutNetworkPlanIpBullet4 => 'Gestão de comutadores: 10.10.0.2';

  @override
  String get aboutNetworkPlanIpSubtitle => 'Erros clássicos';

  @override
  String get aboutNetworkPlanIpSubBullet1 =>
      'Máscara diferente (por exemplo, /24 vs /16) → máquinas invisíveis.';

  @override
  String get aboutNetworkPlanIpSubBullet2 =>
      'Dois dispositivos com o mesmo IP → comportamento aleatório.';

  @override
  String get aboutNetworkPlanIpSubBullet3 =>
      'DHCP + estático na mesma gama sem controlo → conflitos.';

  @override
  String get aboutNetworkVlanParagraph =>
      'Uma VLAN permite-lhe isolar a luz do resto (Internet, produção de vídeo, convidados...). Isto evita o ruído da rede e reduz o risco de outro serviço interromper o seu espetáculo.';

  @override
  String get aboutNetworkVlanCalloutTitle => 'O que ganha';

  @override
  String get aboutNetworkVlanBullet1 => 'Menos tráfego parasita.';

  @override
  String get aboutNetworkVlanBullet2 =>
      'Menos riscos (DHCP externo, difusão não desejada).';

  @override
  String get aboutNetworkVlanBullet3 =>
      'Depuração mais fácil (tudo na VLAN = luz).';

  @override
  String get aboutNetworkVlanSubtitle => 'Atenção';

  @override
  String get aboutNetworkVlanSubBullet1 =>
      'Uma VLAN = todas as portas devem estar corretamente configuradas (acesso/tronco).';

  @override
  String get aboutNetworkVlanSubBullet2 =>
      'Se não souber como: uma rede \"física\" dedicada é muitas vezes mais simples.';

  @override
  String get aboutNetworkIgmpPill1 => 'IGMP snooping';

  @override
  String get aboutNetworkIgmpPill2 => 'Consulta IGMP';

  @override
  String get aboutNetworkIgmpPill3 => 'Multicast flood';

  @override
  String get aboutNetworkIgmpParagraph =>
      'O IGMP snooping permite que o switch saiba quais portas querem qual multicast. Sem isso, o multicast pode ser inundado em todas as portas → saturação.';

  @override
  String get aboutNetworkIgmpCalloutTitle => 'IGMP querier (ideia simples)';

  @override
  String get aboutNetworkIgmpBullet1 =>
      'Em algumas redes/VLANs, é necessário um consultador para manter as subscrições IGMP.';

  @override
  String get aboutNetworkIgmpBullet2 =>
      'Não há problema: dependendo do interrutor, as subscrições expiram e há \"falhas\".';

  @override
  String get aboutNetworkIgmpBullet3 =>
      'Se tiver uma pequena rede dedicada: por vezes tudo funciona, mas com uma grande rede: é crítico.';

  @override
  String get aboutNetworkIgmpSubtitle => 'Diagrama : IGMP (ideia)';

  @override
  String get aboutNetworkWifiSubtitle1 => 'Com fio';

  @override
  String get aboutNetworkWifiSubtitle2 => 'Wi-Fi';

  @override
  String get aboutNetworkWifiSubBullet1 =>
      'Latência estável, baixas perdas (se a infraestrutura for limpa).';

  @override
  String get aboutNetworkWifiSubBullet2 => 'Recomendado para prod.';

  @override
  String get aboutNetworkWifiSubBullet3 =>
      'Prático (configuração rápida, tablet).';

  @override
  String get aboutNetworkWifiSubBullet4 =>
      'Latência variável (jitter), perdas, interferências.';

  @override
  String get aboutNetworkWifiSubBullet5 =>
      'Por vezes, o multicast é mal gerido de acordo com o PA/configuração.';

  @override
  String get aboutNetworkWifiSubBullet6 =>
      'OK para resolução de problemas/configurações pequenas e não críticas, raramente OK quando o programa é carregado.';

  @override
  String get aboutNetworkWifiCalloutTitle => 'Regra simples';

  @override
  String get aboutNetworkWifiBullet1 => 'Espetáculo crítico = com fio.';

  @override
  String get aboutNetworkWifiBullet2 =>
      'Wi-Fi = conforto do operador (UI), não o principal transporte DMX/IP se o volume for grande.';

  @override
  String get aboutNetworkSwitchCalloutTitle => 'Mínimo recomendado';

  @override
  String get aboutNetworkSwitchBullet1 =>
      'Interruptor Ethernet correto (não hub).';

  @override
  String get aboutNetworkSwitchBullet2 => 'Cabos OK (RJ45, conectores).';

  @override
  String get aboutNetworkSwitchBullet3 => 'Evitar loops (ou STP controlado).';

  @override
  String get aboutNetworkSwitchBullet4 => 'Se sACN multicast: IGMP snooping.';

  @override
  String get aboutNetworkSwitchSubtitle => 'Gerido vs não gerido';

  @override
  String get aboutNetworkSwitchSubBullet1 =>
      'Não gerido: ok pequena rede dedicada (simples).';

  @override
  String get aboutNetworkSwitchSubBullet2 =>
      'Gerido: útil para VLAN/IGMP/diagnóstico (grandes redes).';

  @override
  String get aboutNetworkDiagramsSubtitle1 => 'VLAN: separar luz / repouso';

  @override
  String get aboutNetworkDiagramsSubtitle2 => 'Wi-Fi vs. com fios (ideia)';

  @override
  String get aboutNetworkChecklistBullet1 =>
      'Plano de IP claro, máscara coerente.';

  @override
  String get aboutNetworkChecklistBullet2 => 'Rede dedicada / VLAN ligeira.';

  @override
  String get aboutNetworkChecklistBullet3 => 'Interruptor OK, sem loops.';

  @override
  String get aboutNetworkChecklistBullet4 => 'IGMP para sACN multicast.';

  @override
  String get aboutNetworkChecklistBullet5 =>
      'Evitar o acesso à Internet sem fios em locais críticos.';

  @override
  String get videoCameraExposureTitle => 'Exposição da câmara';

  @override
  String get videoCameraExposureSubtitle =>
      'Lux → EV, ISO, velocidade e abertura.';

  @override
  String get videoCamPageTitle => 'Exposição da câmara';

  @override
  String get videoCamInfoTitle => 'Informações';

  @override
  String get videoCamIntro =>
      'Cálculos indicativos para associar lux, ISO, velocidade e abertura.';

  @override
  String get videoCamInputsTitle => 'Entradas';

  @override
  String get videoCamLuxLabel => 'Lux';

  @override
  String get videoCamLuxHint => 'Ex: 500';

  @override
  String get videoCamIsoLabel => 'ISO';

  @override
  String get videoCamIsoHint => 'Ex: 800';

  @override
  String get videoCamShutterLabel => 'Velocidade (s)';

  @override
  String get videoCamShutterHint => 'Ex: 1/50';

  @override
  String get videoCamApertureLabel => 'Abertura (f/)';

  @override
  String get videoCamApertureHint => 'Ex: 2.8';

  @override
  String get videoCamEvEmpty => '-';

  @override
  String get videoCamNote =>
      'Valores indicativos: a calibração depende do sensor, do cenário e das normas.';

  @override
  String videoCamEvValue(Object ev) {
    return 'EV $ev';
  }

  @override
  String videoCamApertureResult(Object aperture) {
    return 'Abertura: f/$aperture';
  }

  @override
  String videoCamShutterResult(Object shutter) {
    return 'Velocidade: $shutter s';
  }

  @override
  String get aboutDmxS2Title =>
      '2) Quadro DMX - pausa, código de início, canais';

  @override
  String get aboutDmxS2PillBreak => 'Intervalo';

  @override
  String get aboutDmxS2PillStartCode => 'Código de início';

  @override
  String get aboutDmxS2PillSlots512 => '512 ranhuras';

  @override
  String get aboutDmxS2PillRefresh => 'Atualizar';

  @override
  String get aboutDmxS2Intro =>
      'Um quadro DMX é enviado num loop. Começa com uma \"pausa\" (silêncio), depois um código de início e, em seguida, até 512 valores (0-255). Cada aparelho lê apenas os canais que lhe dizem respeito (consoante o seu endereço e modo).';

  @override
  String get aboutDmxS2HowToReadTitle => 'Ler um quadro (muito simplesmente)';

  @override
  String get aboutDmxS2HowToReadB1 =>
      'Pausa + MAB: marca o início do fotograma (ressincronização).';

  @override
  String get aboutDmxS2HowToReadB2 =>
      'Código de início: normalmente 0x00 (dados de iluminação).';

  @override
  String get aboutDmxS2HowToReadB3 =>
      'Ranhuras 1→512: cada ranhura = 1 canal (0-255).';

  @override
  String get aboutDmxS2HowToReadB4 =>
      'O fotograma recomeça continuamente: é normal \"sobrescrever\" o valor antigo.';

  @override
  String get aboutDmxS2PracticalTitle => 'Na prática';

  @override
  String get aboutDmxS2PracticalB1 =>
      'Um modo de 16 bits utiliza 2 canais para a mesma função (por exemplo, Pan coarse + Pan fine).';

  @override
  String get aboutDmxS2PracticalB2 =>
      'Quanto mais universos enviar, maior será a carga global (consolas/nós/rede).';

  @override
  String get aboutDmxS2PracticalB3 =>
      'Se tiver cintilação, pense primeiro no cabo/terminação/ligações antes de suspeitar da consola.';

  @override
  String get aboutDmxS3Title => '3) Cablagem DMX - RS-485, topologia, pinagem';

  @override
  String get aboutDmxS3PillRs485 => 'RS-485';

  @override
  String get aboutDmxS3PillDaisyChain => 'Corrente de margaridas';

  @override
  String get aboutDmxS3PillNoY => 'Não Y';

  @override
  String get aboutDmxS3Pill120ohm => '120 Ω';

  @override
  String get aboutDmxS3Intro =>
      'O DMX512 é baseado no RS-485: um bus diferencial que gosta de linhas limpas. A regra de ouro: uma cadeia daisy-chain da fonte para os aparelhos, depois uma terminação no final.';

  @override
  String get aboutDmxS3TopologyTitle => 'Topologia recomendada';

  @override
  String get aboutDmxS3TopologyB1 =>
      'Fonte → Dispositivo 1 → Dispositivo 2 → ... → último dispositivo.';

  @override
  String get aboutDmxS3TopologyB2 =>
      'Evitar os ramos em Y: criam reflexos (instabilidade).';

  @override
  String get aboutDmxS3TopologyB3 =>
      'Se precisar de fazer ramificações: utilize um repartidor DMX opto-isolado.';

  @override
  String get aboutDmxS3PinoutTitle => 'Conectores (lembrete)';

  @override
  String get aboutDmxS3CablesTitle => 'Cabos: o que realmente funciona';

  @override
  String get aboutDmxS3CablesB1 =>
      'Utilize um cabo DMX (impedância ~120 Ω), e não um microfone aleatório (exceto para uma breve resolução de problemas).';

  @override
  String get aboutDmxS3CablesB2 =>
      'Mantenha os comprimentos razoáveis e evite enrolamentos apertados perto de fontes de alimentação/dimmers.';

  @override
  String get aboutDmxS3CablesB3 =>
      'Um mau cabo por vezes \"funciona\"... até deixar de funcionar (humidade, comprimento, carga).';

  @override
  String get aboutDmxS4Title =>
      '4) Terminação e divisores - estabilidade do barramento';

  @override
  String get aboutDmxS4Intro =>
      'Num bus RS-485, a terminação evita reflexões no final da linha. Os divisores opto-isolados são utilizados para criar ramos limpos e proteger a fonte.';

  @override
  String get aboutDmxS4TerminatorTitle => 'Terminação (120 Ω): quando e como';

  @override
  String get aboutDmxS4TerminatorB1 =>
      'Coloque uma terminação no último dispositivo (ou uma ficha XLR).';

  @override
  String get aboutDmxS4TerminatorB2 =>
      'Apenas uma terminação por linha (não em todo o lado).';

  @override
  String get aboutDmxS4TerminatorB3 =>
      'Indispensável em linhas longas, cargas pesadas e ambientes ruidosos.';

  @override
  String get aboutDmxS4SplittersTitle => 'Separadores / opto-isolamento';

  @override
  String get aboutDmxS4SplittersB1 =>
      'Permite-lhe fazer 2, 4 ou 8 ramos sem \"Y\".';

  @override
  String get aboutDmxS4SplittersB2 =>
      'Isolamento elétrico: limita os circuitos de terra e protege a consola/nó.';

  @override
  String get aboutDmxS4SplittersB3 =>
      'Útil para reencaminhar um sinal em longas distâncias.';

  @override
  String get aboutDmxS5Title =>
      '5) Resolução de problemas - método simples (rápido e fiável)';

  @override
  String get aboutDmxS5Intro =>
      'Quando um aparelho não responde, a chave é isolá-lo: é o endereço, o modo, a linha DMX ou o aparelho? Siga uma pequena lista de verificação antes de reconfigurar tudo.';

  @override
  String get aboutDmxS5QuickChecksTitle => 'Lista de controlo rápida';

  @override
  String get aboutDmxS5QuickB1 =>
      'Endereço DMX correto (e não 001 vs 000 de acordo com o ecrã).';

  @override
  String get aboutDmxS5QuickB2 => 'Modo DMX correto (número de canais)?';

  @override
  String get aboutDmxS5QuickB3 => 'Bom universo / saída (consola, nó, porta)?';

  @override
  String get aboutDmxS5QuickB4 =>
      'Testar com um cabo reconhecidamente OK e, em seguida, substituir um a um.';

  @override
  String get aboutDmxS5QuickB5 =>
      'Adiciona/elimina uma terminação no final da linha para ver o efeito.';

  @override
  String get aboutDmxS5IfFlickerTitle => 'Se piscar / pegar';

  @override
  String get aboutDmxS5IfFlickerB1 =>
      'Procure um \"Y\" oculto, um divisor inadequado ou um mau adaptador XLR.';

  @override
  String get aboutDmxS5IfFlickerB2 =>
      'Afasta o DMX das fontes de alimentação/dimmers, evita grandes voltas de cabos.';

  @override
  String get aboutDmxS5IfFlickerB3 =>
      'Reduzir a complexidade: 1 universo, 1 linha, 1 dispositivo, depois reconstruir.';

  @override
  String get aboutDmxS5GoldenRuleTitle => 'Regra de ouro';

  @override
  String get aboutDmxS5GoldenRuleBody =>
      'É necessário poder operar um único dispositivo numa única linha. Se este teste básico falhar, o problema não é \"o patch completo\": é o endereçamento, a cablagem ou o hardware.';

  @override
  String get aboutDmxS6Title =>
      '6) Art-Net - DMX sobre IP (vocabulário e armadilhas)';

  @override
  String get aboutDmxS6PillUdp => 'UDP';

  @override
  String get aboutDmxS6PillNodes => 'Nós';

  @override
  String get aboutDmxS6PillBroadcast => 'Difusão';

  @override
  String get aboutDmxS6PillUnicast => 'Unicast';

  @override
  String get aboutDmxS6Intro =>
      'A Art-Net transporta universos DMX através de Ethernet (UDP). Uma consola/software envia universos através da rede e um nó converte-os em saídas DMX físicas.';

  @override
  String get aboutDmxS6BasicsTitle => 'Para recordar';

  @override
  String get aboutDmxS6BasicsB1 => 'Um nó = rede ↔ DMX (várias portas).';

  @override
  String get aboutDmxS6BasicsB2 =>
      'A difusão envia para toda a gente (simples, mas pode saturar).';

  @override
  String get aboutDmxS6BasicsB3 =>
      'O unicast envia apenas para o nó de destino (frequentemente mais estável em plataformas grandes).';

  @override
  String get aboutDmxS6BasicsB4 =>
      'Tenha cuidado ao contar os universos: a Art-Net começa frequentemente em 0 (Universo 1 DMX = 0 Art-Net).';

  @override
  String get aboutDmxS6WhenTitle => 'Quando é que deve escolher a Art-Net?';

  @override
  String get aboutDmxS6WhenB1 =>
      'Equipamentos pequenos/médios, configurações rápidas, muito hardware compatível.';

  @override
  String get aboutDmxS6WhenB2 =>
      'OK se a rede estiver limpa (interrutor correto, cabos, sem Wi-Fi).';

  @override
  String get aboutDmxS6WhenB3 =>
      'Se saturar: mude para unicast e segmente a rede (VLAN / rede dedicada).';

  @override
  String get aboutDmxS7Title =>
      '7) sACN (E1.31) - multicast, prioridades, rede própria';

  @override
  String get aboutDmxS7PillE131 => 'E1.31';

  @override
  String get aboutDmxS7PillMulticast => 'Multicast';

  @override
  String get aboutDmxS7PillPriority => 'Prioridade';

  @override
  String get aboutDmxS7PillIgmp => 'IGMP';

  @override
  String get aboutDmxS7Intro =>
      'O sACN (ANSI E1.31) é uma norma moderna para o transporte de universos DMX sobre IP. É amplamente utilizado em grandes sistemas porque gere bem o multicast e as prioridades.';

  @override
  String get aboutDmxS7KeyIdeasTitle => 'Ideias-chave';

  @override
  String get aboutDmxS7KeyIdeasB1 =>
      'Multicast: um universo é um \"grupo\" de rede (os nós subscrevem-se uns aos outros).';

  @override
  String get aboutDmxS7KeyIdeasB2 =>
      'IGMP snooping nos comutadores = essencial em grande escala (caso contrário, inunda).';

  @override
  String get aboutDmxS7KeyIdeasB3 =>
      'Prioridade: várias fontes possíveis, a que tiver a prioridade mais elevada ganha.';

  @override
  String get aboutDmxS7KeyIdeasB4 =>
      'Como a Art-Net: rede limpa + cabos/switches de qualidade = estabilidade.';

  @override
  String get aboutDmxS8Title =>
      '8) DMX vs Art-Net vs sACN - resumo (o que escolher?)';

  @override
  String get aboutDmxS8Intro =>
      'Todos os três fazem a mesma coisa: controlar canais. A diferença reside na distribuição (cabo DMX vs. rede), escala e robustez.';

  @override
  String get aboutDmxS8QuickTableTitle => 'Resumo em 4 linhas';

  @override
  String get aboutDmxS8QuickB1 =>
      'DMX: simples, robusto, 1 cabo = 1 linha (512 canais).';

  @override
  String get aboutDmxS8QuickB2 =>
      'Art-Net: muito comum, fácil de implementar, mas cuidado com a difusão.';

  @override
  String get aboutDmxS8QuickB3 =>
      'sACN: mais \"pro grandes sistemas\", multicast + prioridades, requer uma rede bem configurada.';

  @override
  String get aboutDmxS8QuickB4 =>
      'Em todos os casos: documentação + testes progressivos = enormes poupanças de tempo.';

  @override
  String get aboutDmxS8ChooseTitle => 'Seleção rápida';

  @override
  String get aboutDmxS8ChooseB1 =>
      'Pequena configuração: DMX direto ou Art-Net (simples).';

  @override
  String get aboutDmxS8ChooseB2 =>
      'Muitos universos: rede dedicada + nós; Art-Net em unicast ou sACN.';

  @override
  String get aboutDmxS8ChooseB3 =>
      'Plataformas / infra-estruturas muito grandes: sACN + comutadores/IGMP bem geridos.';

  @override
  String get aboutSunTimesTitle => 'Nascer/pôr do sol';

  @override
  String get aboutSunTimesSubtitle =>
      'Escolha da cidade e da data, hora do nascer e do pôr do sol + limiares (lux).';

  @override
  String get homeBpmTitle => 'BPM';

  @override
  String get aboutReseauPageTitle => 'Rede - pontos de referência';

  @override
  String get aboutReseauSummaryCopy =>
      'REDE - marcadores de campo\n- RJ45: Cat5e/6/6A → 1G/10G consoante a distância.\n- Fibra: longa distância + imunidade EMI.\n- Switch: IGMP importante para sACN multicast.\n- VLAN: luz/vídeo/TI separados = estabilidade.';

  @override
  String get aboutReseauChecklistCopy =>
      'REDE - Lista de controlo\nLimpar o plano IP (gama / máscaras)\nSwitch correto (IGMP se sACN multicast)\nVLAN se houver vários \"mundos\" (luz/vídeo/TI)\nCabos testados e etiquetados\nFibra: módulos compatíveis + conectores próprios\nEvitar loops (STP) + evitar Wi-Fi público na LAN do espetáculo';

  @override
  String get aboutReseauChecklistCopyTooltip => 'Cópia';

  @override
  String get aboutReseauFooterNote =>
      'Informação indicativa (campo). As capacidades exactas variam em função dos equipamentos / cabos / módulos.\nObjetivo: pontos de referência simples + método fiável.';

  @override
  String get aboutReseauToc1 => '1) Noções básicas de rede (LAN / IP / débito)';

  @override
  String get aboutReseauToc2 => '2) RJ45 e categorias (Cat5e/6/6A/...)';

  @override
  String get aboutReseauToc3 => '3) PoE (fonte de alimentação de rede)';

  @override
  String get aboutReseauToc4 => '4) Fibra (SM/MM) + conectores (LC/SC)';

  @override
  String get aboutReseauToc5 => '5) SFP / SFP+ / QSFP (módulos)';

  @override
  String get aboutReseauToc6 => '6) Switches (VLAN / IGMP / QoS)';

  @override
  String get aboutReseauToc7 => '7) Art-Net / sACN em rede (aconselhamento)';

  @override
  String get aboutReseauToc8 => '8) Lista de controlo';

  @override
  String get aboutReseauSection1Title => '3 ideias simples';

  @override
  String get aboutReseauSection1Bullet1 =>
      'IP = endereço (por exemplo, 10.0.0.50).';

  @override
  String get aboutReseauSection1Bullet2 =>
      'LAN = rede local através de um comutador (não \"Internet\").';

  @override
  String get aboutReseauSection1Bullet3 =>
      'Débito = capacidade (1G, 10G...), mas a estabilidade também depende do comutador.';

  @override
  String get aboutReseauSection1Title2 => 'Apresentação da topologia (limpa)';

  @override
  String get aboutReseauSection1Bullet4 =>
      'Consola/PC → comutador central → nós/servidores.';

  @override
  String get aboutReseauSection1Bullet5 => 'Evitar redes aleatórias em cadeia.';

  @override
  String get aboutReseauSection1Bullet6 =>
      'Se possível: uma rede dedicada ao espetáculo (não Wi-Fi pública).';

  @override
  String get aboutReseauSection2Title => 'Pontos de referência rápida';

  @override
  String get aboutReseauSection2Bullet1 =>
      'Cat5e: 1 Gbit/s \"clássico\" (até 100m).';

  @override
  String get aboutReseauSection2Bullet2 =>
      'Cat6: 1G/10G (10G para distâncias mais curtas).';

  @override
  String get aboutReseauSection2Bullet3 =>
      'Cat6A: 10G até 100m (referência prática).';

  @override
  String get aboutReseauSection2Bullet4 =>
      'Para além disso: existem Cat7/8, mas Cat6A é frequentemente o ponto ideal no terreno.';

  @override
  String get aboutReseauSection2Title2 => 'Terreno';

  @override
  String get aboutReseauSection2Bullet5 =>
      'Testar/etiquetar sempre os cabos (especialmente em caso de aluguer).';

  @override
  String get aboutReseauSection2Bullet6 =>
      'Evitar os conectores danificados: um RJ45 \"cansado\" = falhas fantasma.';

  @override
  String get aboutReseauSection2Bullet7 =>
      'Planeie 10G se estiver a fazer vídeo IP pesado.';

  @override
  String get aboutReseauSection3Paragraph =>
      'A PoE pode ser utilizada para alimentar equipamentos através de RJ45 (câmaras IP, APs Wi-Fi, pequenos nós, etc.). O ponto crítico: o orçamento total de PoE do comutador.';

  @override
  String get aboutReseauSection3Title => 'Pontos de referência';

  @override
  String get aboutReseauSection3Bullet1 =>
      'PoE (802.3af) ≈ 15W, PoE+ (802.3at) ≈ 30W, PoE++/bt superior.';

  @override
  String get aboutReseauSection3Bullet2 =>
      'O interrutor tem um \"orçamento\" total (por exemplo, 120W).';

  @override
  String get aboutReseauSection3Bullet3 =>
      'Se ultrapassar o orçamento: algumas portas deixam de se iluminar / reiniciar.';

  @override
  String get aboutReseauSection4Title => 'Porquê a fibra no espetáculo';

  @override
  String get aboutReseauSection4Bullet1 => 'Distâncias muito longas.';

  @override
  String get aboutReseauSection4Bullet2 =>
      'Imunidade às interferências (EMI), óptima em ambientes movimentados.';

  @override
  String get aboutReseauSection4Bullet3 =>
      'Prático para ligar FOH ↔ set ↔ sala de controlo.';

  @override
  String get aboutReseauSection4Title2 =>
      'Multimodo vs. modo único (marcador único)';

  @override
  String get aboutReseauSection4Bullet4 =>
      'Multimodo (MM): distâncias \"médias\" (frequentemente edifícios/plataformas).';

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
      'SC: maior, comum nas infra-estruturas.';

  @override
  String get aboutReseauSection4Bullet9 =>
      'Proteger/limpar sempre (pó = perdas).';

  @override
  String get aboutReseauSection5Title => 'Pontos de referência';

  @override
  String get aboutReseauSection5Bullet1 => 'SFP: frequentemente 1G.';

  @override
  String get aboutReseauSection5Bullet2 => 'SFP+: frequentemente 10G.';

  @override
  String get aboutReseauSection5Bullet3 =>
      'QSFP/QSFP+: 40G (dependendo da utilização).';

  @override
  String get aboutReseauSection5Bullet4 =>
      'Um módulo = velocidade + tipo de fibra + comprimento (tudo deve ser coerente).';

  @override
  String get aboutReseauSection5Paragraph =>
      'Na prática: utilizar módulos compatíveis com o comutador (e, idealmente, do mesmo fornecedor/modelo) para evitar surpresas.';

  @override
  String get aboutReseauSection6Title => 'Funções úteis do programa';

  @override
  String get aboutReseauSection6Bullet1 =>
      'VLAN: iluminação / vídeo / TI separados.';

  @override
  String get aboutReseauSection6Bullet2 =>
      'IGMP snooping: essencial se utilizar multicast sACN em grande escala.';

  @override
  String get aboutReseauSection6Bullet3 =>
      'QoS: útil se misturar muitos fluxos (dependendo do contexto).';

  @override
  String get aboutReseauSection6Title2 => 'Erros comuns';

  @override
  String get aboutReseauSection6Bullet4 =>
      'Comutador barato que inunda multicast → colapsos de rede.';

  @override
  String get aboutReseauSection6Bullet5 =>
      'Loop de rede sem STP → tempestade de difusão.';

  @override
  String get aboutReseauSection6Bullet6 =>
      'Wi-Fi público na mesma rede local do espetáculo → instabilidade.';

  @override
  String get aboutReseauSection7Title => 'Art-Net (terreno)';

  @override
  String get aboutReseauSection7Bullet1 =>
      'Muitas vezes simples de configurar.';

  @override
  String get aboutReseauSection7Bullet2 =>
      'O Broadcast é possível numa pequena LAN dedicada, mas o unicast é mais limpo.';

  @override
  String get aboutReseauSection7Bullet3 =>
      'Mapeamento de universos/portas = ponto número 1 a verificar.';

  @override
  String get aboutReseauSection7Title2 => 'sACN (terra)';

  @override
  String get aboutReseauSection7Bullet4 =>
      'Multicast: eficaz, mas requer um comutador adequado (IGMP).';

  @override
  String get aboutReseauSection7Bullet5 =>
      'Prioridades: útil se houver várias fontes.';

  @override
  String get aboutReseauSection7Bullet6 =>
      'Em grandes espectáculos: sACN + IGMP é frequentemente a escolha \"limpa\".';

  @override
  String get aboutReseauChecklistTitle => 'Rápido';

  @override
  String get aboutReseauChecklistBullet1 =>
      'Interruptor correto + cabos limpos.';

  @override
  String get aboutReseauChecklistBullet2 => 'IGMP se sACN multicast.';

  @override
  String get aboutReseauChecklistBullet3 => 'Utilizações separadas (VLAN).';

  @override
  String get aboutSacnPageTitle => 'sACN / E1.31 - multicast e prioridades';

  @override
  String get aboutSacnCopyTooltip => 'Marcadores de cópia';

  @override
  String get aboutSacnChecklistCopyTooltip => 'Cópia';

  @override
  String get aboutSacnFooterNote =>
      'Informação indicativa (campo). O comportamento depende dos comutadores (IGMP), dos nós e do firmware.\nObjetivo: compreender e estabilizar uma rede sACN.';

  @override
  String get aboutSacnCopy1 =>
      'sACN (E1.31) = DMX sobre IP (UDP), mostrar padrão.';

  @override
  String get aboutSacnCopy2 => 'Universo sACN = 1..63999 (intervalo padrão).';

  @override
  String get aboutSacnCopy3 =>
      'Multicast: recomenda-se a utilização de IGMP snooping, caso contrário, flood.';

  @override
  String get aboutSacnCopy4 =>
      'Prioridade: útil com várias fontes (consola + cópia de segurança).';

  @override
  String get aboutSacnChecklistCopy =>
      'sACN (E1.31) - Lista de controlo no terreno\nSwitch correto (idealmente gerível)\nIGMP snooping ativado se for multicast\n(Se possível) IGMP querier presente na VLAN (caso contrário, é possível um comportamento estranho)\nUnicast se a rede não estiver sob controlo / resolução de problemas\nPrioridades: verificar várias fontes (consola/backup)\nMapeamento do universo ↔ nó de portas verificado\nWi-Fi evitado na produção';

  @override
  String get aboutSacnToc1 => '1) Para que é utilizado o sACN?';

  @override
  String get aboutSacnToc2 => '2) Universo (numeração)';

  @override
  String get aboutSacnToc3 => '3) Multicast / Unicast + IGMP';

  @override
  String get aboutSacnToc4 => '4) Prioridades (fontes múltiplas)';

  @override
  String get aboutSacnToc5 => '5) Limites / desempenho';

  @override
  String get aboutSacnToc6 =>
      '6) RDM & sACN (proxy / dependendo do equipamento)';

  @override
  String get aboutSacnToc7 => '7) Diagramas';

  @override
  String get aboutSacnToc8 => '8) Lista de controlo';

  @override
  String get aboutSacnSection1Pill1 => 'UDP';

  @override
  String get aboutSacnSection1Pill2 => 'Multicast';

  @override
  String get aboutSacnSection1Pill3 => 'Prioridade';

  @override
  String get aboutSacnSection1Paragraph =>
      'O sACN (E1.31) é uma norma amplamente utilizada para o transporte de universos DMX sobre IP. É frequentemente preferida quando se pretende uma arquitetura de rede limpa: multicast bem gerido, prioridades normalizadas e um comportamento mais \"pro network\".';

  @override
  String get aboutSacnSection1Title => 'Quando está no topo';

  @override
  String get aboutSacnSection1Bullet1 =>
      'Muitos universos numa rede bem gerida.';

  @override
  String get aboutSacnSection1Bullet2 =>
      'Instalações / grandes redes com várias fontes (prioridades).';

  @override
  String get aboutSacnSection1Bullet3 =>
      'Quando se pretende evitar a \"difusão em todo o lado\".';

  @override
  String get aboutSacnSection2Pill1 => 'Universo 1..63999';

  @override
  String get aboutSacnSection2Pill2 => '512 ranhuras/universo';

  @override
  String get aboutSacnSection2Paragraph =>
      'Um universo sACN corresponde a um universo DMX: até 512 ranhuras. A numeração padrão do sACN é 1..63999. Na prática, o que é importante é o mapeamento da consola ↔ nó ↔ porta DMX.';

  @override
  String get aboutSacnSection2Title => 'Erro clássico';

  @override
  String get aboutSacnSection2Bullet1 =>
      'O número do universo é alterado no lado da consola, mas não no lado do nó (ou vice-versa).';

  @override
  String get aboutSacnSection2Bullet2 =>
      'Pendura-se \"Universo 0\" quando o hardware espera uma base 1.';

  @override
  String get aboutSacnSection2Bullet3 =>
      'Está a confundir as convenções de numeração entre ferramentas.';

  @override
  String get aboutSacnSection3Paragraph =>
      'O sACN utiliza frequentemente o multicast: cada universo \"vive\" num grupo multicast e os nós subscrevem os universos de que necessitam.';

  @override
  String get aboutSacnSection3Title => 'IGMP snooping (porque é importante)';

  @override
  String get aboutSacnSection3Bullet1 =>
      'Sem IGMP: o comutador \"inunda\" multicast por todo o lado → possível sobrecarga.';

  @override
  String get aboutSacnSection3Bullet2 =>
      'Com IGMP: o comutador envia apenas para as portas subscritas → rede estável.';

  @override
  String get aboutSacnSection3Bullet3 =>
      'Para grandes volumes: o IGMP é frequentemente A diferença entre \"funciona\" e \"é um inferno\".';

  @override
  String get aboutSacnSection3Subtitle => 'Diagrama: multicast e IGMP';

  @override
  String get aboutSacnSection3Subtitle2 => 'Unicast (opção)';

  @override
  String get aboutSacnSection3SubBullet1 =>
      'Possível, dependendo das consolas/nós.';

  @override
  String get aboutSacnSection3SubBullet2 =>
      'Útil para a resolução de problemas ou se a rede multicast estiver fora de controlo.';

  @override
  String get aboutSacnSection3SubBullet3 =>
      'Menos elegante, mas por vezes mais simples.';

  @override
  String get aboutSacnSection4Pill1 => 'Fonte A prio 100';

  @override
  String get aboutSacnSection4Pill2 => 'Fonte B prio 90';

  @override
  String get aboutSacnSection4Paragraph =>
      'O sACN gere uma noção de prioridade: se várias fontes enviarem o mesmo universo, o recetor mantém a fonte com a prioridade mais elevada. Muito útil com uma consola principal + uma consola de reserva + um servidor multimédia.';

  @override
  String get aboutSacnSection4Title => 'Armadilhas';

  @override
  String get aboutSacnSection4Bullet1 =>
      'Duas fontes indesejadas no mesmo universo → \"luta\".';

  @override
  String get aboutSacnSection4Bullet2 =>
      'Prioridade incorretamente definida → a cópia de segurança está a assumir o controlo.';

  @override
  String get aboutSacnSection4Bullet3 =>
      'Depurar: cortar uma fonte e verificar quem ganha.';

  @override
  String get aboutSacnSection5Pill1 => 'IGMP';

  @override
  String get aboutSacnSection5Pill2 => 'Interruptor';

  @override
  String get aboutSacnSection5Pill3 => 'Wi-Fi não';

  @override
  String get aboutSacnSection5Pill4 => 'Nó da CPU';

  @override
  String get aboutSacnSection5Title => 'O que quebra primeiro';

  @override
  String get aboutSacnSection5Bullet1 => 'Multicast sem IGMP → flood.';

  @override
  String get aboutSacnSection5Bullet2 =>
      'Interruptor não adaptado (buffers/CPU) → perdas.';

  @override
  String get aboutSacnSection5Bullet3 => 'Wi-Fi → jitter/perdas.';

  @override
  String get aboutSacnSection5Bullet4 => 'Nós limitados (portas, firmware).';

  @override
  String get aboutSacnSection5Subtitle => 'Regras simples';

  @override
  String get aboutSacnSection5SubBullet1 =>
      'Comutador gerido + IGMP snooping se houver muitos universos.';

  @override
  String get aboutSacnSection5SubBullet2 =>
      'VLAN de luz dedicada, se possível.';

  @override
  String get aboutSacnSection5SubBullet3 =>
      'Unicast para a resolução de problemas.';

  @override
  String get aboutSacnSection6Paragraph =>
      'Tal como na Art-Net, a RDM \"sobre IP\" depende frequentemente de um mecanismo de proxy nos nós. A norma sACN não implica automaticamente que o seu nó esteja a fazer RDM corretamente.';

  @override
  String get aboutSacnSection6Title => 'Verificar a documentação do nó';

  @override
  String get aboutSacnSection6Bullet1 => 'Suporte de proxy RDM / RDM sobre IP.';

  @override
  String get aboutSacnSection6Bullet2 =>
      'Limitações (apenas descoberta, comandos parciais).';

  @override
  String get aboutSacnSection6Bullet3 =>
      'Compatível com splitters/opto no lado DMX.';

  @override
  String get aboutSacnSection6Subtitle => 'Método de campo';

  @override
  String get aboutSacnSection6SubBullet1 => 'Estabilizar DMX sem RDM.';

  @override
  String get aboutSacnSection6SubBullet2 =>
      'Testar o RDM numa linha simples e limpa.';

  @override
  String get aboutSacnSection6SubBullet3 =>
      'Se surgirem problemas: desativar o RDM e, em seguida, isolar o nó/splitter.';

  @override
  String get aboutSacnSection7Subtitle1 => 'Multicast + IGMP (ideia)';

  @override
  String get aboutSacnSection7Subtitle2 => 'Prioridades (2 fontes)';

  @override
  String get aboutSacnChecklistTitle => 'Antes de culpar o \"protocolo';

  @override
  String get aboutSacnChecklistBullet1 =>
      'IGMP snooping ativado se for multicast.';

  @override
  String get aboutSacnChecklistBullet2 => 'VLAN dedicada, se possível.';

  @override
  String get aboutSacnChecklistBullet3 =>
      'Unicast para a resolução de problemas.';

  @override
  String get aboutSacnChecklistBullet4 =>
      'Prioridades coerentes em caso de fontes múltiplas.';

  @override
  String get aboutSacnChecklistBullet5 => 'Wi-Fi evitado em prod.';

  @override
  String get sunTimesTitle => 'Nascer / pôr do sol';

  @override
  String get sunTimesSectionSettings => 'Parâmetros';

  @override
  String get sunTimesSectionResults => 'Resultados';

  @override
  String get sunTimesSectionTimeline => 'Cronograma (etapas de 30 minutos)';

  @override
  String get sunTimesSectionTwilight => 'O que é o crepúsculo?';

  @override
  String get sunTimesSectionLux => 'Limiares de luminosidade (marcadores)';

  @override
  String get sunTimesIntro =>
      'Escolha uma cidade e uma data. As horas são indicativas (arredondadas).';

  @override
  String get sunTimesLabelCity => 'Cidade';

  @override
  String get sunTimesLabelDate => 'Data';

  @override
  String get sunTimesNoteApprox =>
      'Os tempos são aproximados - podem variar de acordo com a altitude, a refração e o tempo.';

  @override
  String get sunTimesNoData => '-';

  @override
  String get sunTimesResultSunrise => 'Nascer do sol';

  @override
  String get sunTimesResultSunset => 'Pôr do sol';

  @override
  String get sunTimesResultCivilDawn => 'Alvorada civil';

  @override
  String get sunTimesResultCivilDusk => 'Crepúsculo civil';

  @override
  String get sunTimesResultNauticalDawn => 'Amanhecer náutico';

  @override
  String get sunTimesResultNauticalDusk => 'Crepúsculo náutico';

  @override
  String get sunTimesResultAstronomicalDawn => 'Aurora astronómica';

  @override
  String get sunTimesResultAstronomicalDusk => 'Crepúsculo astronómico';

  @override
  String get sunTimesTimelineStep30 => 'Passo: 30 min';

  @override
  String get sunTimesTimelineDay => 'Dia';

  @override
  String get sunTimesTimelineCivil => 'Civil';

  @override
  String get sunTimesTimelineNautical => 'Náutico';

  @override
  String get sunTimesTimelineAstronomical => 'Astronómico';

  @override
  String get sunTimesTimelineNight => 'Noite';

  @override
  String get sunTimesTwilightIntro =>
      'O crepúsculo é definido pela altura do Sol abaixo do horizonte. Estas definições são normalizadas.';

  @override
  String get sunTimesTwilightCivilTitle => 'Civil (≈ 0° a -6°)';

  @override
  String get sunTimesTwilightCivilBody =>
      'Fim/início do dia. A paisagem ainda é bem visível.';

  @override
  String get sunTimesTwilightNauticalTitle => 'Náutico (≈ -6° a -12°)';

  @override
  String get sunTimesTwilightNauticalBody =>
      'O horizonte torna-se difícil de distinguir. O céu é muito mais escuro.';

  @override
  String get sunTimesTwilightAstronomicalTitle => 'Astronómico (≈ -12° a -18°)';

  @override
  String get sunTimesTwilightAstronomicalBody =>
      'O céu está quase na escuridão total (pouca luz residual).';

  @override
  String get sunTimesLuxNight => 'Noite negra';

  @override
  String get sunTimesLuxAstro => 'Astro crepúsculo';

  @override
  String get sunTimesLuxNautical => 'Nasce o Crepúsculo.';

  @override
  String get sunTimesLuxCivil => 'Crepúsculo civil';

  @override
  String get sunTimesLuxVeryLow => 'Muito baixo';

  @override
  String get sunTimesLuxLow => 'Baixa';

  @override
  String get sunTimesLuxDay => 'Dia';

  @override
  String get sunTimesLuxFullDay => 'Luz do dia';

  @override
  String get sunTimesLuxNote =>
      'Estes valores são valores de referência típicos (clima, estação do ano, ambiente → variações).';

  @override
  String get aboutVideoPageTitle => 'Vídeo - pontos de referência';

  @override
  String get aboutVideoSummaryCopy =>
      'VÍDEO - pontos de referência\n- Resolução = tamanho (px). FPS = fluidez / latência.\n- 4:2:2 / 4:4:4 + 10-bit = qualidade de cor.\n- SDI = robusto + longa distância.\n- HDMI = frágil + curta.\n- NDI = IP (rede), depende da LAN.\n- Genlock / Timecode = sincronização.';

  @override
  String get aboutVideoChecklistCopy =>
      'VÍDEO - Lista de controlo\nMesma resolução e FPS em todo o lado\nHDMI: EDID / HDCP dominado\nSDI: cabo de 75Ω + bom padrão\nNDI/IP: LAN limpa (switch, velocidade)\nGenlock / Timecode se for necessária sincronização\nFonte de teste → ecrã direto';

  @override
  String get aboutVideoChecklistCopyTooltip => 'Cópia';

  @override
  String get aboutVideoFooterNote =>
      'Informações indicativas (campo). O comportamento varia consoante o equipamento.\nObjetivo: compreender rapidamente e resolver os problemas de forma limpa.';

  @override
  String get aboutVideoToc1 => '1) Noções básicas de vídeo (palavras-chave)';

  @override
  String get aboutVideoToc2 => '2) Resolução e FPS';

  @override
  String get aboutVideoToc3 => '3) Cor (4:4:4 / 4:2:2 / 10-bit)';

  @override
  String get aboutVideoToc4 => '4) Sincronização (Genlock / Timecode)';

  @override
  String get aboutVideoToc5 => '5) Cabos e distâncias';

  @override
  String get aboutVideoToc6 => '6) SDI (3G / 6G / 12G)';

  @override
  String get aboutVideoToc7 => '7) HDMI - campo';

  @override
  String get aboutVideoToc8 => '8) NDI - quando / porquê / limites';

  @override
  String get aboutVideoToc9 => '9) Mapeamento / LED / multi-projo';

  @override
  String get aboutVideoSection1Paragraph =>
      'O vídeo é uma imagem (pixéis) enviada a um ritmo (FPS), com uma estrutura de cores (amostragem/profundidade de bits), transportada por uma ligação (SDI/HDMI/IP) e, por vezes, sincronizada.';

  @override
  String get aboutVideoSection1Title => 'Vocabulário útil';

  @override
  String get aboutVideoSection1Bullet1 => 'Resolução: largura×altura (px).';

  @override
  String get aboutVideoSection1Bullet2 => 'FPS: fluidez/latência.';

  @override
  String get aboutVideoSection1Bullet3 => 'Progressivo (p) vs entrelaçado (i).';

  @override
  String get aboutVideoSection1Bullet4 =>
      'Codec: compressão (H.264, H.265...).';

  @override
  String get aboutVideoSection1Bullet5 => 'Latency: crítica ao vivo.';

  @override
  String get aboutVideoSection2Title => 'Resolução';

  @override
  String get aboutVideoSection2Bullet1 => '1080p = 1920×1080.';

  @override
  String get aboutVideoSection2Bullet2 => '4K UHD = 3840×2160.';

  @override
  String get aboutVideoSection2Bullet3 => 'DCI 4K = 4096×2160 (cinema).';

  @override
  String get aboutVideoSection2Bullet4 => 'Mais píxeis = mais rendimento.';

  @override
  String get aboutVideoSection2Title2 => 'FPS';

  @override
  String get aboutVideoSection2Bullet5 => '25/50: Norma europeia.';

  @override
  String get aboutVideoSection2Bullet6 =>
      '30/60: norma americana / dispositivos.';

  @override
  String get aboutVideoSection2Bullet7 =>
      'Evitar misturar 50 e 60 sem conversão.';

  @override
  String get aboutVideoSection3Title => 'Amostragem';

  @override
  String get aboutVideoSection3Bullet1 => '4:4:4: gráficos / codificação.';

  @override
  String get aboutVideoSection3Bullet2 => '4:2:2: pro courant.';

  @override
  String get aboutVideoSection3Bullet3 => '4:2:0: ficheiros / fluxos.';

  @override
  String get aboutVideoSection3Title2 => 'Profundidade de bits';

  @override
  String get aboutVideoSection3Bullet4 => '8-bit: standard.';

  @override
  String get aboutVideoSection3Bullet5 =>
      '10 bits: melhor gradação (HDR / LED).';

  @override
  String get aboutVideoSection4Title => 'Genlock';

  @override
  String get aboutVideoSection4Bullet1 => 'Sincroniza a atualização da imagem.';

  @override
  String get aboutVideoSection4Bullet2 =>
      'Útil para multi-câmara / LED / transmissão.';

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
  String get aboutVideoSection5Bullet3 => 'Fibra: muito longa + sem EMI.';

  @override
  String get aboutVideoSection6Title => 'Pontos de referência';

  @override
  String get aboutVideoSection6Bullet1 => '3G: 1080p60';

  @override
  String get aboutVideoSection6Bullet2 => '6G: 2160p30';

  @override
  String get aboutVideoSection6Bullet3 => '12G: 2160p60';

  @override
  String get aboutVideoSection7Title => 'O que deve ser observado';

  @override
  String get aboutVideoSection7Bullet1 => 'EDID';

  @override
  String get aboutVideoSection7Bullet2 => 'HDCP';

  @override
  String get aboutVideoSection7Bullet3 => 'Comprimentos';

  @override
  String get aboutVideoSection8Title => 'Vídeo IP';

  @override
  String get aboutVideoSection8Bullet1 => 'Flexível.';

  @override
  String get aboutVideoSection8Bullet2 => 'Carga da rede.';

  @override
  String get aboutVideoSection8Bullet3 => 'É necessária uma LAN limpa.';

  @override
  String get aboutVideoSection9Title => 'Terreno';

  @override
  String get aboutVideoSection9Bullet1 => 'Mesma resolução / FPS.';

  @override
  String get aboutVideoSection9Bullet2 => 'Mapeamento correto.';

  @override
  String get aboutVideoSection9Bullet3 => 'Teste com padrões de teste.';

  @override
  String get aboutVideoChecklistTitle => 'Antes de entrar em pânico';

  @override
  String get aboutVideoChecklistBullet1 => 'Verificar a resolução / FPS.';

  @override
  String get aboutVideoChecklistBullet2 => 'Fonte de teste → ecrã.';

  @override
  String get aboutVideoChecklistBullet3 => 'Simplificar a cadeia.';

  @override
  String get homeBpmSubtitle =>
      'Tempo de toque, conversão de BPM ↔ ms, Hz, compasso.';

  @override
  String get bpmTitle => 'BPM';

  @override
  String get bpmTapTitle => 'Tempo de toque';

  @override
  String get bpmTapButton => 'Tipo';

  @override
  String get bpmResetTap => 'Repor as torneiras';

  @override
  String get bpmDetectedLabel => 'BPM detectado';

  @override
  String get bpmTapHint =>
      'Dar várias pancadas (idealmente 4 a 8 pancadas) para obter uma média estável.';

  @override
  String get bpmManualTitle => 'BPM manual';

  @override
  String get bpmManualLabel => 'BPM';

  @override
  String get bpmManualHint => 'Ex. 128';

  @override
  String get commonAdd => 'Adicionar';

  @override
  String get commonEdit => 'Modificar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonCopied => 'Copiado para a área de transferência.';

  @override
  String get patchCreateGdtfTitle => 'Criar um GDTF (simples)';

  @override
  String get patchCreateGdtfSubtitle =>
      'Criação manual de um dispositivo em forma de tabela.';

  @override
  String get gdtfSimpleTitle => 'Criador do GDTF (simples)';

  @override
  String get gdtfDeviceSectionTitle => 'Dispositivo';

  @override
  String get gdtfChannelsSectionTitle => 'Canais';

  @override
  String get gdtfImportJsonTitle => 'Importar JSON';

  @override
  String get gdtfExportJsonTitle => 'Exportar JSON';

  @override
  String get gdtfImportJsonHint => 'Colar o JSON aqui';

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
  String get gdtfColDmx => 'DMX';

  @override
  String get gdtfColType => 'Tipo';

  @override
  String get gdtfColRes => '8/16';

  @override
  String get gdtfColDefault => 'Falha';

  @override
  String get gdtfColActions => 'Acções';

  @override
  String get gdtfMoveUp => 'Subir';

  @override
  String get gdtfMoveDown => 'Descer';

  @override
  String get gdtfChannelAddTitle => 'Adicionar um canal';

  @override
  String get gdtfChannelEditTitle => 'Modificar o canal';

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
  String get gdtfFieldDefault8 => 'Valor por defeito (0-255)';

  @override
  String get gdtfFieldDefault16 => 'Valor por defeito (0-65535)';

  @override
  String get gdtfDefaultChannelName => 'Canal';

  @override
  String get gdtfMvpHint =>
      'MVP: Exportação JSON (área de transferência). A exportação real do GDTF (XML+ZIP) será efectuada em seguida.';

  @override
  String get gdtfTypeDimmer => 'Regulador de fluxo luminoso';

  @override
  String get gdtfTypePan => 'Panela';

  @override
  String get gdtfTypeTilt => 'Inclinação';

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
  String get gdtfEasyTitle => 'Criar um GDTF (simples)';

  @override
  String get gdtfTemplatesTitle => 'Pré-selecções';

  @override
  String get gdtfCreateDefaultPreset => 'Criar a predefinição predefinida';

  @override
  String get gdtfTemplatesHint =>
      'Cria uma base rápida (dimmer, obturador, pan, tilt, RGB, etc.) e depois preenche os endereços DMX e as falhas.';

  @override
  String get gdtfExportButton => 'Exportar GDTF';

  @override
  String get gdtfExportHint =>
      'Exportação mínima de .gdtf (description.xml) e depois partilha (Mail, WhatsApp, AirDrop, Drive...).';

  @override
  String get gdtfExportNeedDmx =>
      'Adiciona pelo menos um endereço DMX para exportação.';

  @override
  String get gdtfExportDone => 'GDTF exportado.';

  @override
  String get gdtfExportError => 'Não é possível exportar o GDTF.';

  @override
  String get gdtfShareSubject => 'Ficheiro GDTF';

  @override
  String get gdtfShareText => 'Aqui está o ficheiro GDTF exportado.';

  @override
  String get gdtfFieldRole => 'Parâmetro';

  @override
  String get gdtfDmxHint => 'Vazio ou 1-512';

  @override
  String get gdtfFieldDefault => 'Falha';

  @override
  String get gdtfDefaultHint8 => '0-255';

  @override
  String get gdtfDefaultHint16 => '0-65535';

  @override
  String get gdtfChannelDefaultName => 'Canal';

  @override
  String get gdtfRoleEmpty => 'Vazio / Desconhecido';

  @override
  String get gdtfRoleDimmer => 'Regulador de fluxo luminoso';

  @override
  String get gdtfRoleShutter => 'Obturador';

  @override
  String get gdtfRolePan => 'Panela';

  @override
  String get gdtfRoleTilt => 'Inclinação';

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
  String get gdtfRoleControl => 'Controlo';

  @override
  String get gdtfRoleCustom => 'Personalizado';

  @override
  String get gdtfResUnknown => 'Vácuo';

  @override
  String get gdtfPresetDimmer => 'Regulador de fluxo luminoso';

  @override
  String get gdtfPresetShutter => 'Obturador';

  @override
  String get gdtfPresetPan => 'Panela';

  @override
  String get gdtfPresetTilt => 'Inclinação';

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
  String get gdtfPresetControl => 'Controlo';

  @override
  String get commonApply => 'Aplicar';

  @override
  String get gdtfPresetLabel => 'Escolha';

  @override
  String get gdtfPresetFixtureSimple => 'Luminária única';

  @override
  String get gdtfPresetBarreLed => 'Barra de LED';

  @override
  String get gdtfTemplatesHintShort =>
      'Escolha uma predefinição e aplique-a. Pode então ajustar o DMX, as predefinições e reordenar utilizando a função arrastar e largar.';

  @override
  String get gdtfExportNeedChannels =>
      'Adiciona pelo menos um canal para exportação.';

  @override
  String get homeDrawerContact => 'Contactar o programador';

  @override
  String get homeDrawerSuggestItem => 'Enviar um artigo para o catálogo';

  @override
  String get homeErrorOpenEmail =>
      'Não é possível abrir a aplicação de correio eletrónico.';

  @override
  String get homeErrorOpenForm => 'Não é possível abrir o formulário.';

  @override
  String get homeContactEmailSubject => 'Pergunta sobre o My App Tech';

  @override
  String get bpmManualHelp =>
      'Se for introduzida uma BPM manual, esta tem precedência sobre o tempo de toque.';

  @override
  String get bpmConversionsTitle => 'Conversões';

  @override
  String get bpmActiveLabel => 'BPM ativo';

  @override
  String get bpmMsPerBeat => 'Duração de um batimento';

  @override
  String get bpmHz => 'Frequência';

  @override
  String get bpmSecPerBar44 => 'Duração de um compasso (4/4)';

  @override
  String get bpmDisclaimer =>
      'Indicação aproximada. Verificar com o metrónomo se é crítico.';

  @override
  String get laserToolsTitle => 'Ferramentas';

  @override
  String get laserBeamSizeTitle => 'Tamanho do feixe';

  @override
  String get laserBeamSizeSubtitle =>
      'Diâmetro, raio e área da superfície do ponto a uma determinada distância.';

  @override
  String get laserBeamInputsTitle => 'Parâmetros';

  @override
  String get laserBeamDistanceLabel => 'Distância';

  @override
  String get laserBeamDistanceHint => 'm (ex. 12)';

  @override
  String get laserBeamFormulaHint =>
      'Cálculo: D(z) = D0 + θ - z (θ em rad, ângulo total).';

  @override
  String get laserBeamResultsTitle => 'Resultados';

  @override
  String get laserBeamDiameterAtDistance => 'Diâmetro à distância';

  @override
  String get laserBeamRadiusAtDistance => 'Raio à distância';

  @override
  String get laserBeamAreaAtDistance => 'Superfície do ponto';

  @override
  String get sunTimesPageTitle => 'Nascer / pôr do sol';

  @override
  String get sunTimesSelectionTitle => 'Parâmetros';

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
      'Valores indicativos (modelo astronómico). Verificar com uma fonte oficial, se necessário (evento, segurança, filmagem).';

  @override
  String get sunTimesThresholdTitle => 'Limiares de luminosidade (marcadores)';

  @override
  String get sunTimesThresholdIntro =>
      'Ordens de grandeza úteis para antecipar a luz ambiente (muito variável em função do clima, latitude, estação do ano, obstáculos, poluição luminosa).';

  @override
  String get sunTimesLuxDaylight => 'Luz do dia (excluindo luz solar direta)';

  @override
  String get sunTimesLuxOvercast => 'Nublado (típico)';

  @override
  String get sunTimesLuxSunrise => 'Rise/set (claro)';

  @override
  String get sunTimesLuxCivilTwilight => 'Limite do crepúsculo civil (claro)';

  @override
  String get sunTimesLuxFullMoon => 'Lua cheia (clara)';

  @override
  String get sunTimesThresholdNote =>
      'Sugestão: para a observação \"utilizável sem iluminação\", o nosso objetivo é frequentemente > 100-300 lx. Para trabalhos finos, o objetivo é 500 lx ou mais.';

  @override
  String get sunTimesParamsTitle => 'Parâmetros';

  @override
  String get sunTimesPickDate => 'Escolher uma data';

  @override
  String get sunTimesSunrise => 'Aumentar';

  @override
  String get sunTimesSunset => 'Hora de dormir';

  @override
  String get sunTimesDayLength => 'Duração do dia';

  @override
  String get sunTimesPolarNote =>
      'Nota: nas zonas próximas dos pólos, o nascer e o pôr do sol podem estar ausentes consoante a estação do ano.';

  @override
  String get sunTimesLuxThresholdTitle =>
      'Limiares de luminosidade (marcadores)';

  @override
  String get sunTimesLuxBulletNightDark => 'Noite escura: < 1 lux';

  @override
  String get sunTimesLuxBulletNightMoon => 'Noite (lua): ~ 0,1-1 lux';

  @override
  String get sunTimesLuxBulletFullMoon => 'Lua cheia: ~ 0,1-0,3 lux';

  @override
  String get sunTimesLuxBulletCivilTwilight => 'Crepúsculo civil: Sol a -6°.';

  @override
  String get sunTimesLuxBulletUrbanLow => 'Iluminação urbana fraca: ~ 5-20 lux';

  @override
  String get sunTimesLuxBulletOfficeLow => 'Escritório fraco: ~ 100-300 lux';

  @override
  String get sunTimesLuxBulletOfficeStd => 'Escritório normal: ~ 300-500 lux';

  @override
  String get sunTimesLuxBulletOutdoorDay =>
      'Exterior durante o dia: ~ 10.000-25.000 lux';

  @override
  String get sunTimesLuxBulletDirectSun => 'Luz solar direta: ~ 100.000 lux';

  @override
  String get sunTimesLuxDisclaimer =>
      'Pontos de referência: o tempo/nuvens, o ambiente, a estação do ano e o terreno podem variar consideravelmente.';

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
      'Astronómico (-18°): o céu é considerado \"negro\" (excluindo a poluição luminosa).';

  @override
  String get sunTimesTwilightAnglesNote =>
      'Ângulos expressos em graus abaixo do horizonte (sol negativo).';

  @override
  String get sunTimesLuxBulletAstronomicalTwilight =>
      'Crepúsculo astronómico: Sol a -18°.';

  @override
  String get sunTimesTimelineTitleStep30 => 'Cronograma (não 30 min)';

  @override
  String get sunTimesTimelineColTime => 'Tempo';

  @override
  String get sunTimesTimelineColElevation => 'Elevação';

  @override
  String get sunTimesTimelineColMarker => 'Referência';

  @override
  String get sunTimesTimelineColLux => 'Lux (encomenda)';

  @override
  String get sunTimesTimelineFootnote =>
      'Referências indicativas (tempo/nuvens, ambiente, estação do ano) - úteis para preparar um espetáculo.';

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
  String get videoLedResultPitch => 'Pitch';

  @override
  String get lightFilterLedTabConvert => 'Conversão';

  @override
  String get lightFilterLedTabProfiles => 'Os meus acessórios';

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
  String get lightFilterLedEngineRgbrcl => 'RGBRCL (vermelho, ciano, lima)';

  @override
  String get lightFilterLedEngineCmy => 'CMY';

  @override
  String get lightFilterLedSaveProfileTitle => 'Guardar o perfil de fixação';

  @override
  String get lightFilterLedProfileNameLabel => 'Nome do aparelho';

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
  String get lightFilterLedNoProfiles => 'Nenhum perfil de fixação guardado';

  @override
  String get lightFilterLedNoProfilesHint =>
      'Calibrar os canais no separador Conversão,\ne, em seguida, guarde utilizando o ícone 💾.';

  @override
  String get lightFilterLedTitle => 'Filtros LED correspondentes';

  @override
  String get lightFilterLedDescription =>
      'Conversão de filtros LEE, Rosco... para motores LED (RGB, RGBA, RGBW, etc.).';

  @override
  String get lightFilterLedBrandLabel => 'Marca';

  @override
  String get lightFilterLedSearchLabel => 'Pesquisar';

  @override
  String get lightFilterLedSearchHint => 'Código ou nome do filtro';

  @override
  String get lightFilterLedFilterLabel => 'Filtro';

  @override
  String get lightFilterLedEngineLabel => 'Motor LED';

  @override
  String get lightFilterLedShowPercentLabel => 'Indicação em percentagem';

  @override
  String get lightFilterLedShowPercentHint =>
      'Caso contrário, os valores são apresentados em DMX 0-255.';

  @override
  String get lightFilterLedHexLabel => 'Cor de referência';

  @override
  String get lightFilterLedChromaticityLabel => 'Cromaticidade';

  @override
  String get lightFilterLedTransmissionLabel => 'Transmissão';

  @override
  String get lightFilterLedResultTitle => 'Resultados';

  @override
  String get lightFilterLedOriginalPreviewLabel => 'Visão geral do filtro';

  @override
  String get lightFilterLedApproximatePreviewLabel =>
      'Visão geral aproximada do LED';

  @override
  String get lightFilterLedDisclaimer =>
      'Resultado meramente indicativo. A reprodução real depende do projetor, do seu espetro, calibração, modo de cor e contexto de utilização.';

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
  String get aboutSearchHint => 'Pesquisar nas referências';

  @override
  String get aboutSearchNoResults => 'Não foram encontrados resultados.';

  @override
  String get homePinnedTitle => 'Alfinetes';

  @override
  String get homePinnedSubtitle =>
      'Encontre rapidamente as suas referências fixadas.';

  @override
  String get pinnedReferencesTitle => 'Referências fixadas';

  @override
  String get pinnedReferencesEmpty => 'Ainda não há referências fixadas.';

  @override
  String get aboutPinAddTooltip => 'Fixar esta referência';

  @override
  String get aboutPinRemoveTooltip => 'Retirar este pino';

  @override
  String get aboutPinAddedMessage => 'Referência fixada.';

  @override
  String get aboutPinRemovedMessage => 'Pino removido.';

  @override
  String get homeDrawerSubscriptions => 'Assinaturas';

  @override
  String get subscriptionPageTitle => 'Assinaturas';

  @override
  String get subscriptionHeadlineAllTitle => 'Escolha o seu plano';

  @override
  String get subscriptionHeadlineAllSubtitle =>
      'Veja aqui as suas compras atuais e as assinaturas ainda disponíveis.';

  @override
  String subscriptionHeadlineUnlock(Object module) {
    return 'Desbloquear $module';
  }

  @override
  String get subscriptionHeadlineVideoSubtitle =>
      'Pode comprar apenas Vídeo ou escolher Pro para desbloquear tudo.';

  @override
  String get subscriptionHeadlineLightSubtitle =>
      'Pode comprar apenas Iluminação ou escolher Pro para desbloquear tudo.';

  @override
  String get subscriptionHeadlineLaserSubtitle =>
      'Pode comprar apenas Laser ou escolher Pro para desbloquear tudo.';

  @override
  String get subscriptionHeadlineConsoleSubtitle =>
      'Pode comprar apenas Consola ou escolher Pro para desbloquear tudo.';

  @override
  String get subscriptionHeadlineProSubtitle =>
      'Acesso completo a todas as secções avançadas.';

  @override
  String get subscriptionStoreUnavailable => 'Loja indisponível de momento.';

  @override
  String get subscriptionLoadError =>
      'Não foi possível carregar as assinaturas.';

  @override
  String get subscriptionRestorePurchases => 'Restaurar as minhas compras';

  @override
  String get subscriptionPrivacy => 'Privacidade';

  @override
  String get subscriptionTerms => 'Termos';

  @override
  String get subscriptionBestValue => 'MELHOR OFERTA';

  @override
  String get subscriptionOwned => 'Comprado';

  @override
  String get subscriptionIncludedInPro => 'Incluído no Pro';

  @override
  String get subscriptionProductUnavailable => 'Produto indisponível.';

  @override
  String get subscriptionSubscribeAll => 'Subscrever — Desbloquear tudo';

  @override
  String subscriptionSubscribeModule(Object module) {
    return 'Subscrever — $module';
  }

  @override
  String get subscriptionCategoryVideoTitle => 'Vídeo';

  @override
  String get subscriptionCategoryLightTitle => 'Iluminação';

  @override
  String get subscriptionCategoryLaserTitle => 'Laser';

  @override
  String get subscriptionCategoryConsoleTitle => 'Consola';

  @override
  String get subscriptionCategoryProTitle => 'ShowTech Tools Pro';

  @override
  String get subscriptionCategoryVideoDescription => 'Acesso à secção Vídeo.';

  @override
  String get subscriptionCategoryLightDescription =>
      'Acesso à secção Iluminação.';

  @override
  String get subscriptionCategoryLaserDescription => 'Acesso à secção Laser.';

  @override
  String get subscriptionCategoryConsoleDescription =>
      'Acesso à secção Consola.';

  @override
  String get subscriptionCategoryProDescription =>
      'Acesso completo a todas as secções.';

  @override
  String get electricityFreeSection => 'Gratuito';

  @override
  String get electricityProSection => 'Subscrição Eletricidade';

  @override
  String get riggingFreeSection => 'Gratuito';

  @override
  String get riggingProSection => 'Subscrição Rigging';

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
  String get subscriptionCategoryRiggingTitle => '__TECNOLOGIA_8__';

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
}
