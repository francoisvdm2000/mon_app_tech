// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../../app/ui/widgets.dart';

const String _kWorkerUrl =
    'https://showtech-gdtf.francois-vandermeeren.workers.dev';

// ─────────────────────────────────────────────────────────────────────────────
// MODELS
// ─────────────────────────────────────────────────────────────────────────────

class GdtfFixture {
  const GdtfFixture({
    required this.rid,
    required this.fixture,
    required this.manufacturer,
    required this.revision,
    required this.rating,
    required this.uploader,
    required this.version,
    required this.filesize,
    required this.modes,
    required this.lastModified,
  });
  final int rid;
  final String fixture, manufacturer, revision, uploader, version, lastModified;
  final double rating;
  final int filesize;
  final List<GdtfMode> modes;

  factory GdtfFixture.fromJson(Map<String, dynamic> json) => GdtfFixture(
        rid: (json['rid'] as num?)?.toInt() ?? 0,
        fixture: (json['fixture'] ?? '').toString(),
        manufacturer: (json['manufacturer'] ?? '').toString(),
        revision: (json['revision'] ?? '').toString(),
        rating: (json['rating'] as num?)?.toDouble() ?? 0,
        uploader: (json['uploader'] ?? '').toString(),
        version: (json['version'] ?? '').toString(),
        filesize: (json['filesize'] as num?)?.toInt() ?? 0,
        lastModified: (json['lastModified'] ?? '').toString(),
        modes: ((json['modes'] as List<dynamic>?) ?? [])
            .map((m) => GdtfMode.fromJson(m as Map<String, dynamic>))
            .toList(),
      );

  String get filesizeLabel {
    if (filesize < 1024) {
      return '$filesize B';
    }
    if (filesize < 1024 * 1024) {
      return '${(filesize / 1024).toStringAsFixed(0)} KB';
    }
    return '${(filesize / 1024 / 1024).toStringAsFixed(1)} MB';
  }
}

class GdtfMode {
  const GdtfMode({required this.name, required this.dmxFootprint});
  final String name;
  final int dmxFootprint;
  factory GdtfMode.fromJson(Map<String, dynamic> json) => GdtfMode(
        name: json['name'] as String? ?? '',
        dmxFootprint: (json['dmxfootprint'] as num?)?.toInt() ?? 0,
      );
}

class DmxChannel {
  DmxChannel({
    required this.number,
    required this.name,
    required this.function,
    this.resolution = '8bit',
    this.isExpanded = false,
    this.defaultValue = 0,
  });
  int number;
  String name;
  String function;
  String resolution;
  bool isExpanded;
  int defaultValue;
}

class DmxMode {
  DmxMode({required this.name, required this.channels});
  String name;
  List<DmxChannel> channels;
}

// ─────────────────────────────────────────────────────────────────────────────
// PAGE
// ─────────────────────────────────────────────────────────────────────────────

class GdtfBuilderSimplePage extends StatefulWidget {
  const GdtfBuilderSimplePage({super.key});
  @override
  State<GdtfBuilderSimplePage> createState() => _GdtfBuilderSimplePageState();
}

class _GdtfBuilderSimplePageState extends State<GdtfBuilderSimplePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final _searchCtrl = TextEditingController();
  bool _isSearching = false;
  String _searchError = '';
  List<GdtfFixture> _results = [];
  bool _hasSearched = false;

  final _fixtureNameCtrl = TextEditingController();
  final _manufacturerCtrl = TextEditingController();
  PlatformFile? _selectedPdf;
  bool _isAnalyzing = false;
  String _analyzeError = '';

  List<DmxMode> _dmxModes = [];
  bool _isGenerating = false;
  String _generateError = '';
  String _generateSuccess = '';
  String _generateFilePath = '';
  int _generateStep = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchCtrl.dispose();
    _fixtureNameCtrl.dispose();
    _manufacturerCtrl.dispose();
    super.dispose();
  }

  Rect _sharePositionOrigin() {
    final renderObject = context.findRenderObject();
    if (renderObject is RenderBox && renderObject.hasSize) {
      final topLeft = renderObject.localToGlobal(Offset.zero);
      final size = renderObject.size;
      if (size.width > 0 && size.height > 0) {
        return topLeft & size;
      }
    }
    return const Rect.fromLTWH(0, 0, 1, 1);
  }

  Future<void> _shareGdtfFile({
    required String filePath,
    required String subject,
  }) async {
    await Share.shareXFiles(
      [XFile(filePath, mimeType: 'application/zip')],
      subject: subject,
      sharePositionOrigin: _sharePositionOrigin(),
    );
  }

  // ─── Search ──────────────────────────────────────────────────────────────

  Future<void> _search() async {
    final q = _searchCtrl.text.trim();
    if (q.isEmpty) return;
    setState(() {
      _isSearching = true;
      _searchError = '';
      _results = [];
      _hasSearched = false;
    });
    try {
      final response = await http
          .get(Uri.parse(
              'https://showtech-gdtf-production.up.railway.app/search.php?q=${Uri.encodeComponent(q)}'))
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          _results = ((data['results'] as List<dynamic>?) ?? [])
              .map((e) => GdtfFixture.fromJson(e as Map<String, dynamic>))
              .toList();
          _hasSearched = true;
        });
      } else {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() => _searchError =
            data['error'] as String? ?? 'Erreur ${response.statusCode}');
      }
    } catch (e) {
      setState(() => _searchError = 'Erreur réseau : $e');
    } finally {
      setState(() => _isSearching = false);
    }
  }

  Future<void> _downloadFixture(GdtfFixture fixture) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      messenger.showSnackBar(SnackBar(
          content: Text('Téléchargement de ${fixture.fixture}…'),
          duration: const Duration(seconds: 10)));
      final response = await http
          .get(Uri.parse(
              'https://showtech-gdtf-production.up.railway.app/download.php?rid=${fixture.rid}'))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode != 200) {
        messenger.clearSnackBars();
        messenger.showSnackBar(SnackBar(
            content: Text('Erreur (${response.statusCode})'),
            backgroundColor: Colors.red.shade800));
        return;
      }
      final dir = await getTemporaryDirectory();
      final filePath =
          '${dir.path}/${fixture.fixture.replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_')}.gdtf';
      await File(filePath).writeAsBytes(response.bodyBytes);
      messenger.clearSnackBars();
      await _shareGdtfFile(
        filePath: filePath,
        subject: '${fixture.manufacturer} ${fixture.fixture}.gdtf',
      );
    } catch (e) {
      messenger.clearSnackBars();
      messenger.showSnackBar(SnackBar(
          content: Text('Erreur : $e'), backgroundColor: Colors.red.shade800));
    }
  }

  // ─── Generate ────────────────────────────────────────────────────────────

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf'], withData: true);
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedPdf = result.files.first;
        _analyzeError = '';
      });
    }
  }

  // Extrait la section DMX Protocol du PDF
  String _extractDmxSections(String fullText) {
    final lower = fullText.toLowerCase();
    final docLen = fullText.length;

    // Cas spécial : document qui EST un chart DMX (ex: Robe SPIIDER)
    // "dmx protocol" dans le 1er 1% = pas de table des matières, c'est du contenu direct
    final firstDmx = lower.indexOf('dmx protocol');
    if (firstDmx >= 0 && firstDmx < docLen * 0.01) {
      // Envoie tout le document (jusqu'à 35000 chars) pour couvrir tous les modes
      final end = 35000.clamp(0, docLen);
      return fullText.substring(0, end);
    }

    // Pour les autres PDFs : cherche le MINIMUM des lastIndexOf après le seuil 35%
    // (pour éviter table des matières et sections d'installation)
    final threshold = (docLen * 0.35).toInt();
    final keywords = [
      'dmx protocol',
      'dmx-configuration',
      'dmx configuration:',
      '14ch channel mode',
      '27ch channel mode',
      '7. dmx',
      '8. dmx',
      '9. dmx',
      '10. dmx',
      '11. dmx',
    ];

    int startIndex = -1;
    for (final kw in keywords) {
      final idx = lower.lastIndexOf(kw);
      if (idx > threshold) {
        if (startIndex == -1 || idx < startIndex) {
          startIndex = idx;
        }
      }
    }

    if (startIndex == -1) {
      // Fallback : deuxième moitié du document
      startIndex = docLen ~/ 2;
    }

    startIndex = (startIndex - 50).clamp(0, docLen);
    final end = (startIndex + 25000).clamp(0, docLen);
    return fullText.substring(startIndex, end);
  }

  Future<void> _analyzePdf() async {
    final fixtureName = _fixtureNameCtrl.text.trim();
    final manufacturer = _manufacturerCtrl.text.trim();
    if (fixtureName.isEmpty || manufacturer.isEmpty) {
      setState(() => _analyzeError = 'Remplis le fabricant et le modèle.');
      return;
    }
    if (_selectedPdf == null) {
      setState(() => _analyzeError = 'Sélectionne un fichier PDF.');
      return;
    }
    setState(() {
      _isAnalyzing = true;
      _analyzeError = '';
    });
    try {
      final pdfBytes =
          _selectedPdf!.bytes ?? await File(_selectedPdf!.path!).readAsBytes();
      final pdfDoc = PdfDocument(inputBytes: pdfBytes);
      final fullText = PdfTextExtractor(pdfDoc).extractText();
      pdfDoc.dispose();

      if (fullText.trim().isEmpty) {
        setState(() =>
            _analyzeError = 'Impossible d\'extraire le texte (PDF scanné ?)');
        return;
      }

      // Extrait uniquement la section DMX Protocol
      final pdfText = _extractDmxSections(fullText);

      final response = await http
          .post(
            Uri.parse(_kWorkerUrl),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'fixture_name': fixtureName,
              'manufacturer': manufacturer,
              'pdf_text': pdfText
            }),
          )
          .timeout(const Duration(seconds: 180)); // 3 minutes

      if (response.statusCode != 200) {
        String error = 'Erreur ${response.statusCode}';
        try {
          error =
              (jsonDecode(response.body) as Map)['error'] as String? ?? error;
        } catch (_) {}
        setState(() => _analyzeError = error);
        return;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['success'] != true) {
        setState(() =>
            _analyzeError = data['error'] as String? ?? 'Erreur inconnue');
        return;
      }

      final xmlContent = data['xml'] as String;
      _dmxModes = _parseXmlToModes(xmlContent);
      setState(() => _generateStep = 1);
    } catch (e) {
      setState(() => _analyzeError = 'Erreur : $e');
    } finally {
      setState(() => _isAnalyzing = false);
    }
  }

  List<DmxMode> _parseXmlToModes(String xml) {
    final modes = <DmxMode>[];
    try {
      final modeRegex = RegExp(r'<Mode>(.*?)</Mode>', dotAll: true);
      final modeNameRegex = RegExp(r'<ModeName>(.*?)</ModeName>');
      final chRegex = RegExp(r'<Ch>(.*?)</Ch>', dotAll: true);
      final numRegex = RegExp(r'<Num>(.*?)</Num>');
      final chanNameRegex = RegExp(r'<ChanName>(.*?)</ChanName>');
      final resRegex = RegExp(r'<Res>(.*?)</Res>');
      final funcRegex = RegExp(r'<Func>(.*?)</Func>');

      for (final modeMatch in modeRegex.allMatches(xml)) {
        final modeContent = modeMatch.group(1) ?? '';
        final modeName =
            modeNameRegex.firstMatch(modeContent)?.group(1)?.trim() ?? 'Mode';
        final channels = <DmxChannel>[];

        for (final chMatch in chRegex.allMatches(modeContent)) {
          final ch = chMatch.group(1) ?? '';
          final number =
              int.tryParse(numRegex.firstMatch(ch)?.group(1)?.trim() ?? '') ??
                  (channels.length + 1);
          final name = chanNameRegex.firstMatch(ch)?.group(1)?.trim() ??
              'Ch${channels.length + 1}';
          final resolution =
              resRegex.firstMatch(ch)?.group(1)?.trim() ?? '8bit';
          final function = funcRegex.firstMatch(ch)?.group(1)?.trim() ?? '';
          final def = _defaultForName(name);
          channels.add(DmxChannel(
              number: number,
              name: name,
              function: function,
              resolution: resolution,
              defaultValue: def));
        }

        if (channels.isNotEmpty) {
          modes.add(DmxMode(name: modeName, channels: channels));
        }
      }
    } catch (e) {
      debugPrint('Parse XML error: $e');
    }

    if (modes.isEmpty) {
      modes.add(DmxMode(name: 'Mode 1', channels: [
        DmxChannel(number: 1, name: 'Dimmer', function: 'Intensity 0-255'),
      ]));
    }
    return modes;
  }

  Future<void> _generateGdtf() async {
    setState(() {
      _isGenerating = true;
      _generateError = '';
    });
    try {
      final fixtureName = _fixtureNameCtrl.text.trim();
      final manufacturer = _manufacturerCtrl.text.trim();
      final xml = _buildXmlFromModes(manufacturer, fixtureName, _dmxModes);
      final archive = Archive();
      final xmlBytes = utf8.encode(xml);
      archive
          .addFile(ArchiveFile('description.xml', xmlBytes.length, xmlBytes));
      final gdtfBytes = ZipEncoder().encode(archive)!;
      final dir = await getTemporaryDirectory();
      final safeName = '${manufacturer}_$fixtureName'
          .replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_');
      final filePath = '${dir.path}/$safeName.gdtf';
      await File(filePath).writeAsBytes(gdtfBytes);
      setState(() {
        _generateSuccess = '$safeName.gdtf';
        _generateFilePath = filePath;
        _generateStep = 2;
      });
      await _shareGdtfFile(
        filePath: filePath,
        subject: '$manufacturer $fixtureName.gdtf',
      );
    } catch (e) {
      setState(() => _generateError = 'Erreur : $e');
    } finally {
      setState(() => _isGenerating = false);
    }
  }

  String _buildXmlFromModes(
      String manufacturer, String fixtureName, List<DmxMode> modes) {
    final uuid = _generateUuid();
    final buf = StringBuffer();
    buf.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buf.writeln('<GDTF DataVersion="1.2">');
    buf.writeln(
        '  <FixtureType Name="$fixtureName" ShortName="" Manufacturer="$manufacturer" Description="" Type="MovingHead" FixtureTypeID="$uuid" Thumbnail="" RefFT="">');
    buf.writeln(
        '    <AttributeDefinitions><ActivationGroups/><Features><Feature Name="Control"/><Feature Name="Beam"/><Feature Name="Color"/><Feature Name="Position"/></Features><Attributes/></AttributeDefinitions>');
    buf.writeln('    <Wheels/><PhysicalDescriptions/><Models/>');
    buf.writeln('    <Geometries>');
    buf.writeln(
        '      <Geometry Name="Body" Model="" Position="{1,0,0,0}{0,1,0,0}{0,0,1,0}{0,0,0,1}">');
    buf.writeln(
        '        <Geometry Name="Yoke" Model="" Position="{1,0,0,0}{0,1,0,0}{0,0,1,0}{0,0,0,1}">');
    buf.writeln(
        '          <Geometry Name="Head" Model="" Position="{1,0,0,0}{0,1,0,0}{0,0,1,0}{0,0,0,1}"/>');
    buf.writeln('        </Geometry>');
    buf.writeln('      </Geometry>');
    buf.writeln('    </Geometries>');
    buf.writeln('    <DMXModes>');
    for (final mode in modes) {
      buf.writeln('      <DMXMode Name="${mode.name}" Geometry="Body">');
      buf.writeln('        <DMXChannels>');
      for (final ch in mode.channels) {
        final chUuid = _generateUuid();
        final offset = ch.resolution == '16bit-fine'
            ? '${ch.number},${ch.number - 1}'
            : ch.number.toString();
        buf.writeln(
            '          <DMXChannel DMXBreak="1" Default="${ch.defaultValue}" Geometry="Head" Highlight="255" InitialFunction="${ch.name}.${ch.name}.${ch.name}" Offset="$offset" UID="$chUuid">');
        buf.writeln(
            '            <LogicalChannel Attribute="${ch.name}" Master="None" MibFade="0" DMXChangeTimeLimit="0" Snap="No">');
        buf.writeln(
            '              <ChannelFunction Attribute="${ch.name}" CustomName="${ch.function}" DMXFrom="0/1" Default="${ch.defaultValue}" Max="255/1" Min="0/1" Name="${ch.name}" OriginalAttribute="" PhysicalFrom="0" PhysicalTo="1" RealFade="0" RealAcceleration="0" Wheel="" Emitter="" Filter="" ModeMaster="" ModeFrom="0/1" ModeTo="0/1" UID="$chUuid"/>');
        buf.writeln('            </LogicalChannel>');
        buf.writeln('          </DMXChannel>');
      }
      buf.writeln('        </DMXChannels><Relations/>');
      buf.writeln('      </DMXMode>');
    }
    buf.writeln('    </DMXModes>');
    buf.writeln('    <Revisions/><FTPresets/><Protocols/>');
    buf.writeln('  </FixtureType>');
    buf.writeln('</GDTF>');
    return buf.toString();
  }

  int _defaultForName(String name) {
    final n = name.toLowerCase();
    if (n.contains('pan') || n.contains('tilt')) return 128;
    return 0;
  }

  String _generateUuid() {
    final r = DateTime.now().microsecondsSinceEpoch;
    final s = r.toRadixString(16).padLeft(12, '0');
    return '${s.substring(0, 8)}-${s.substring(0, 4)}-4${s.substring(1, 4)}-8${s.substring(0, 3)}-${s.padLeft(12, '0').substring(0, 12)}';
  }

  // ─── UI ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GDTF'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.search), text: 'Recherche'),
            Tab(icon: Icon(Icons.auto_fix_high), text: 'Générer depuis PDF'),
          ],
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [_buildSearchTab(), _buildGenerateTab()]),
    );
  }

  Widget _buildSearchTab() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(children: [
          Expanded(
            child: TextField(
              controller: _searchCtrl,
              decoration: const InputDecoration(
                  hintText: 'ex: Martin MAC Aura, Chauvet Rogue…',
                  labelText: 'Nom de la fixture',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()),
              onSubmitted: (_) => _search(),
              textInputAction: TextInputAction.search,
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _isSearching ? null : _search,
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18)),
            child: _isSearching
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.search),
          ),
        ]),
      ),
      if (!_hasSearched && !_isSearching)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.withValues(alpha: 0.3))),
            child: const Row(children: [
              Icon(Icons.info_outline, color: Colors.blue, size: 18),
              SizedBox(width: 8),
              Expanded(
                  child: Text(
                      'Recherche dans la base GDTF Share (6000+ fixtures).\nSi introuvable, utilise l\'onglet "Générer depuis PDF".',
                      style: TextStyle(color: Colors.white70, fontSize: 12))),
            ]),
          ),
        ),
      if (_searchError.isNotEmpty)
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(_searchError,
                style: const TextStyle(color: Colors.redAccent))),
      Expanded(
        child: _isSearching
            ? const Center(child: CircularProgressIndicator())
            : _results.isEmpty && _hasSearched
                ? _buildNoResults()
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                    itemCount: _results.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, i) => _FixtureCard(
                        fixture: _results[i],
                        onDownload: () => _downloadFixture(_results[i])),
                  ),
      ),
    ]);
  }

  Widget _buildNoResults() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.search_off, size: 64, color: Colors.white24),
        const SizedBox(height: 16),
        const Text('Aucune fixture trouvée',
            style: TextStyle(color: Colors.white54, fontSize: 16)),
        const SizedBox(height: 8),
        const Text('Tu peux générer un GDTF depuis le PDF du manuel.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white38, fontSize: 13)),
        const SizedBox(height: 16),
        ElevatedButton.icon(
            icon: const Icon(Icons.auto_fix_high),
            label: const Text('Générer depuis PDF'),
            onPressed: () => _tabController.animateTo(1)),
      ]),
    ));
  }

  Widget _buildGenerateTab() {
    switch (_generateStep) {
      case 1:
        return _buildStepVerification();
      case 2:
        return _buildStepSuccess();
      default:
        return _buildStepForm();
    }
  }

  Widget _buildStepForm() {
    return ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        children: [
          SectionCard(
            title: 'Générer un GDTF depuis un PDF',
            icon: Icons.auto_fix_high,
            child: const Text(
                'Upload le manuel technique de ta fixture. L\'IA extrait les modes DMX — tu vérifies et corriges avant de générer le fichier.',
                style: TextStyle(color: Colors.white70)),
          ),
          const SizedBox(height: 16),
          TextField(
              controller: _manufacturerCtrl,
              decoration: const InputDecoration(
                  labelText: 'Fabricant',
                  hintText: 'ex: Martin, Chauvet, Robe…',
                  prefixIcon: Icon(Icons.business_outlined),
                  border: OutlineInputBorder())),
          const SizedBox(height: 12),
          TextField(
              controller: _fixtureNameCtrl,
              decoration: const InputDecoration(
                  labelText: 'Modèle',
                  hintText: 'ex: MAC Aura XIP, Rogue R2X…',
                  prefixIcon: Icon(Icons.lightbulb_outline),
                  border: OutlineInputBorder())),
          const SizedBox(height: 16),
          InkWell(
            onTap: _pickPdf,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: _selectedPdf != null
                        ? Colors.green.withValues(alpha: 0.6)
                        : Colors.white24,
                    width: 1.5),
              ),
              child: Row(children: [
                Icon(
                    _selectedPdf != null
                        ? Icons.picture_as_pdf
                        : Icons.upload_file,
                    color: _selectedPdf != null ? Colors.green : Colors.white54,
                    size: 32),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                          _selectedPdf != null
                              ? _selectedPdf!.name
                              : 'Sélectionner le PDF du manuel',
                          style: TextStyle(
                              color: _selectedPdf != null
                                  ? Colors.white
                                  : Colors.white54,
                              fontWeight: _selectedPdf != null
                                  ? FontWeight.w600
                                  : FontWeight.normal)),
                      if (_selectedPdf != null)
                        Text(
                            '${(_selectedPdf!.size / 1024).toStringAsFixed(0)} KB',
                            style: const TextStyle(
                                color: Colors.white38, fontSize: 12)),
                    ])),
                const Icon(Icons.chevron_right, color: Colors.white38),
              ]),
            ),
          ),
          const SizedBox(height: 16),
          if (_analyzeError.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.red.withValues(alpha: 0.4))),
                child: Row(children: [
                  const Icon(Icons.error_outline,
                      color: Colors.redAccent, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Text(_analyzeError,
                          style: const TextStyle(color: Colors.redAccent))),
                ]),
              ),
            ),
          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: _isAnalyzing ? null : _analyzePdf,
              icon: _isAnalyzing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.auto_fix_high),
              label: Text(_isAnalyzing
                  ? 'Analyse en cours… (1-2 min)'
                  : 'Analyser le PDF'),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
              'L\'IA analyse le manuel et te propose les canaux DMX à vérifier avant de générer le fichier.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white38, fontSize: 12)),
        ]);
  }

  Widget _buildStepVerification() {
    return Stack(children: [
      Column(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Row(children: [
            IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => setState(() => _generateStep = 0)),
            const SizedBox(width: 8),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('${_fixtureNameCtrl.text} — ${_manufacturerCtrl.text}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15)),
                  Text('${_dmxModes.length} mode(s) détecté(s)',
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 12)),
                ])),
          ]),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
            itemCount: _dmxModes.length,
            itemBuilder: (context, modeIndex) => _buildModeCard(modeIndex),
          ),
        ),
      ]),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
          ),
          child: Column(children: [
            if (_generateError.isNotEmpty)
              Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(_generateError,
                      style: const TextStyle(
                          color: Colors.redAccent, fontSize: 12))),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isGenerating ? null : _generateGdtf,
                icon: _isGenerating
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.download),
                label: Text(
                    _isGenerating ? 'Génération…' : 'Générer le fichier .gdtf'),
              ),
            ),
          ]),
        ),
      ),
    ]);
  }

  Color _resolutionColor(String res) {
    if (res == '16bit-coarse') return Colors.orange;
    if (res == '16bit-fine') return Colors.orange.withValues(alpha: 0.5);
    return Colors.white24;
  }

  String _resolutionLabel(String res) {
    if (res == '16bit-coarse') return '16C';
    if (res == '16bit-fine') return '16F';
    return '8b';
  }

  Widget _buildModeCard(int modeIndex) {
    final mode = _dmxModes[modeIndex];
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.layers_outlined, color: Colors.white54, size: 18),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: mode.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Nom du mode'),
                onChanged: (v) => mode.name = v,
              ),
            ),
            Text('${mode.channels.length} canaux',
                style: const TextStyle(color: Colors.white38, fontSize: 11)),
            IconButton(
                icon: const Icon(Icons.delete_outline,
                    color: Colors.redAccent, size: 18),
                onPressed: () => setState(() => _dmxModes.removeAt(modeIndex))),
          ]),
          const Divider(color: Colors.white12),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(children: [
              SizedBox(
                  width: 32,
                  child: Text('Ch',
                      style: TextStyle(color: Colors.white38, fontSize: 10))),
              SizedBox(width: 4),
              SizedBox(
                  width: 32,
                  child: Text('Bits',
                      style: TextStyle(color: Colors.white38, fontSize: 10))),
              SizedBox(width: 4),
              Expanded(
                  flex: 2,
                  child: Text('Nom',
                      style: TextStyle(color: Colors.white38, fontSize: 10))),
              SizedBox(width: 4),
              SizedBox(width: 28),
              SizedBox(width: 28),
            ]),
          ),
          ...mode.channels.asMap().entries.map((entry) {
            final i = entry.key;
            final ch = entry.value;
            return Column(children: [
              Row(children: [
                SizedBox(
                  width: 32,
                  child: TextFormField(
                    initialValue: ch.number.toString(),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 12, color: Colors.white54),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onChanged: (v) => ch.number = int.tryParse(v) ?? ch.number,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      final list = ['8bit', '16bit-coarse', '16bit-fine'];
                      ch.resolution =
                          list[(list.indexOf(ch.resolution) + 1) % list.length];
                    });
                  },
                  child: Container(
                    width: 32,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: _resolutionColor(ch.resolution)
                          .withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(4),
                      border:
                          Border.all(color: _resolutionColor(ch.resolution)),
                    ),
                    child: Text(_resolutionLabel(ch.resolution),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 9,
                            color: _resolutionColor(ch.resolution),
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    initialValue: ch.name,
                    style: const TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onChanged: (v) => ch.name = v,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => setState(() => ch.isExpanded = !ch.isExpanded),
                  child: Container(
                    width: 28,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: ch.isExpanded
                          ? Colors.blue.withValues(alpha: 0.2)
                          : Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: ch.isExpanded
                              ? Colors.blue.withValues(alpha: 0.6)
                              : Colors.white24),
                    ),
                    child: Icon(
                        ch.isExpanded ? Icons.expand_less : Icons.expand_more,
                        size: 14,
                        color: ch.isExpanded ? Colors.blue : Colors.white54),
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => setState(() => mode.channels.removeAt(i)),
                  child: const SizedBox(
                      width: 28,
                      child: Icon(Icons.remove_circle_outline,
                          color: Colors.redAccent, size: 16)),
                ),
              ]),
              if (ch.isExpanded)
                Container(
                  margin: const EdgeInsets.only(left: 72, top: 6, bottom: 6),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.blue.withValues(alpha: 0.3)),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Valeur par défaut
                        Row(children: [
                          const Expanded(
                              child: Text('Valeur par défaut (0-255) :',
                                  style: TextStyle(
                                      color: Colors.white38,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600))),
                          SizedBox(
                            width: 56,
                            child: TextFormField(
                              initialValue: ch.defaultValue.toString(),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              onChanged: (v) => ch.defaultValue =
                                  int.tryParse(v)?.clamp(0, 255) ??
                                      ch.defaultValue,
                            ),
                          ),
                        ]),
                        const SizedBox(height: 8),
                        const Text('Plages de valeurs / Sous-fonctions :',
                            style: TextStyle(
                                color: Colors.white38,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        TextFormField(
                          initialValue: ch.function,
                          maxLines: null,
                          style: const TextStyle(
                              fontSize: 11, color: Colors.white70, height: 1.5),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6)),
                            hintText:
                                'ex: 0-9=fermé, 10-100=strobe lent, 255=ouvert',
                            hintStyle: const TextStyle(
                                fontSize: 10, color: Colors.white24),
                          ),
                          onChanged: (v) => ch.function = v,
                        ),
                      ]),
                ),
              if (i < mode.channels.length - 1)
                const Divider(color: Colors.white12, height: 8),
            ]);
          }),
          const SizedBox(height: 4),
          TextButton.icon(
            icon: const Icon(Icons.add, size: 14),
            label:
                const Text('Ajouter un canal', style: TextStyle(fontSize: 11)),
            onPressed: () => setState(() => mode.channels.add(DmxChannel(
                number: mode.channels.length + 1,
                name: 'Ch${mode.channels.length + 1}',
                function: ''))),
          ),
        ]),
      ),
    );
  }

  Widget _buildStepSuccess() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.check_circle_outline,
            size: 72, color: Colors.greenAccent),
        const SizedBox(height: 16),
        const Text('Fichier généré !',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text(_generateSuccess,
            style: const TextStyle(color: Colors.white54, fontSize: 13)),
        const SizedBox(height: 32),
        ElevatedButton.icon(
          icon: const Icon(Icons.share),
          label: const Text('Partager le fichier .gdtf'),
          onPressed: () => _shareGdtfFile(
            filePath: _generateFilePath,
            subject: _generateSuccess,
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Générer un autre fichier'),
          onPressed: () => setState(() {
            _generateStep = 0;
            _selectedPdf = null;
            _dmxModes = [];
            _generateSuccess = '';
            _generateFilePath = '';
            _generateError = '';
            _fixtureNameCtrl.clear();
            _manufacturerCtrl.clear();
          }),
        ),
      ]),
    ));
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// FIXTURE CARD
// ─────────────────────────────────────────────────────────────────────────────

class _FixtureCard extends StatelessWidget {
  const _FixtureCard({required this.fixture, required this.onDownload});
  final GdtfFixture fixture;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.dataset_outlined, color: Colors.white54, size: 20),
            const SizedBox(width: 8),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(fixture.fixture,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w700)),
                  Text(fixture.manufacturer,
                      style:
                          const TextStyle(color: Colors.white54, fontSize: 12)),
                ])),
            if (fixture.rating > 0)
              Row(children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                const SizedBox(width: 2),
                Text(fixture.rating.toStringAsFixed(1),
                    style: const TextStyle(color: Colors.amber, fontSize: 12)),
              ]),
          ]),
          const SizedBox(height: 8),
          if (fixture.modes.isNotEmpty)
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: fixture.modes
                  .take(6)
                  .map((m) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.07),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.white12)),
                        child: Text('${m.name} (${m.dmxFootprint}ch)',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 11)),
                      ))
                  .toList(),
            ),
          const SizedBox(height: 10),
          Row(children: [
            Text(fixture.filesizeLabel,
                style: const TextStyle(color: Colors.white38, fontSize: 11)),
            const SizedBox(width: 8),
            Text('v${fixture.version}',
                style: const TextStyle(color: Colors.white38, fontSize: 11)),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: onDownload,
              icon: const Icon(Icons.download, size: 16),
              label: const Text('Télécharger'),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  textStyle: const TextStyle(fontSize: 12)),
            ),
          ]),
        ]),
      ),
    );
  }
}
