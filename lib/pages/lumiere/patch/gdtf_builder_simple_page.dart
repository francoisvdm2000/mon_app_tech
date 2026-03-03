import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:xml/xml.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../../app/ui/widgets.dart'; // SectionCard

enum GdtfRole {
  empty,
  dimmer,
  shutter,
  pan,
  tilt,
  red,
  green,
  blue,
  color,
  gobo,
  zoom,
  focus,
  prism,
  effect,
  control,
  custom,
}

enum GdtfResolution { bit8, bit16 }

enum GdtfPreset { fixtureSimple, barreLed }

String _roleLabel(AppLocalizations loc, GdtfRole r) {
  switch (r) {
    case GdtfRole.empty:
      return loc.gdtfRoleEmpty;
    case GdtfRole.dimmer:
      return loc.gdtfRoleDimmer;
    case GdtfRole.shutter:
      return loc.gdtfRoleShutter;
    case GdtfRole.pan:
      return loc.gdtfRolePan;
    case GdtfRole.tilt:
      return loc.gdtfRoleTilt;
    case GdtfRole.red:
      return loc.gdtfRoleRed;
    case GdtfRole.green:
      return loc.gdtfRoleGreen;
    case GdtfRole.blue:
      return loc.gdtfRoleBlue;
    case GdtfRole.color:
      return loc.gdtfRoleColor;
    case GdtfRole.gobo:
      return loc.gdtfRoleGobo;
    case GdtfRole.zoom:
      return loc.gdtfRoleZoom;
    case GdtfRole.focus:
      return loc.gdtfRoleFocus;
    case GdtfRole.prism:
      return loc.gdtfRolePrism;
    case GdtfRole.effect:
      return loc.gdtfRoleEffect;
    case GdtfRole.control:
      return loc.gdtfRoleControl;
    case GdtfRole.custom:
      return loc.gdtfRoleCustom;
  }
}

String _presetLabel(AppLocalizations loc, GdtfPreset p) {
  switch (p) {
    case GdtfPreset.fixtureSimple:
      return loc.gdtfPresetFixtureSimple;
    case GdtfPreset.barreLed:
      return loc.gdtfPresetBarreLed;
  }
}

class GdtfChannelDraft {
  final String id = UniqueKey().toString();

  GdtfRole role;
  String name;

  /// Adresse DMX du slot "coarse".
  /// Si 16-bit, ce canal consomme dmx et dmx+1.
  int dmx;

  GdtfResolution resolution;
  int defaultValue;

  GdtfChannelDraft({
    required this.role,
    required this.name,
    required this.dmx,
    this.resolution = GdtfResolution.bit8, // 8-bit par défaut
    this.defaultValue = 0,
  });

  int get slots => resolution == GdtfResolution.bit16 ? 2 : 1;
  int get maxDefault => resolution == GdtfResolution.bit16 ? 65535 : 255;

  void clampDefault() {
    if (defaultValue < 0) defaultValue = 0;
    if (defaultValue > maxDefault) defaultValue = maxDefault;
  }
}

class GdtfBuilderSimplePage extends StatefulWidget {
  const GdtfBuilderSimplePage({super.key});

  @override
  State<GdtfBuilderSimplePage> createState() => _GdtfBuilderSimplePageState();
}

class _GdtfBuilderSimplePageState extends State<GdtfBuilderSimplePage> {
  final _manufacturerCtrl = TextEditingController();
  final _modelCtrl = TextEditingController();
  final _modeCtrl = TextEditingController(text: 'Default');

  final List<GdtfChannelDraft> _channels = [];

  GdtfPreset _selectedPreset = GdtfPreset.fixtureSimple;

  // ✅ iOS share_plus: ancre popover (simulateur/iPad)
  final GlobalKey _exportBtnKey = GlobalKey();

  @override
  void dispose() {
    _manufacturerCtrl.dispose();
    _modelCtrl.dispose();
    _modeCtrl.dispose();
    super.dispose();
  }

  // ---------- UI helpers ----------
  InputDecoration _denseDeco(String label, {String? hint}) => InputDecoration(
        labelText: label,
        hintText: hint,
        isDense: true,
        // ✅ évite le rognage des textes
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      );

  // ---------- DMX / footprint ----------
  int _footprint() {
    // footprint = total de slots DMX consommés
    int fp = 0;
    for (final c in _channels) {
      fp += c.slots;
    }
    return fp;
  }

  void _reindexDmxSequentialFrom1() {
    int addr = 1;
    for (final ch in _channels) {
      ch.dmx = addr;
      addr += ch.slots;
      if (addr > 512) break;
    }
  }

  // ---------- presets / add ----------
  void _applyPreset(GdtfPreset preset) {
    final loc = AppLocalizations.of(context);

    setState(() {
      _channels.clear();

      final spec = <Map<String, dynamic>>[];

      if (preset == GdtfPreset.fixtureSimple) {
        spec.addAll([
          {'role': GdtfRole.dimmer, 'name': loc.gdtfPresetDimmer},
          {'role': GdtfRole.shutter, 'name': loc.gdtfPresetShutter},
          {'role': GdtfRole.pan, 'name': loc.gdtfPresetPan},
          {'role': GdtfRole.tilt, 'name': loc.gdtfPresetTilt},
          {'role': GdtfRole.red, 'name': loc.gdtfPresetRed},
          {'role': GdtfRole.green, 'name': loc.gdtfPresetGreen},
          {'role': GdtfRole.blue, 'name': loc.gdtfPresetBlue},
          {'role': GdtfRole.color, 'name': loc.gdtfPresetColor1},
          {'role': GdtfRole.gobo, 'name': loc.gdtfPresetGobo1},
          {'role': GdtfRole.zoom, 'name': loc.gdtfPresetZoom},
          {'role': GdtfRole.focus, 'name': loc.gdtfPresetFocus},
          {'role': GdtfRole.prism, 'name': loc.gdtfPresetPrism},
          {'role': GdtfRole.effect, 'name': loc.gdtfPresetEffect},
          {'role': GdtfRole.control, 'name': loc.gdtfPresetControl},
        ]);
      } else {
        spec.addAll([
          {'role': GdtfRole.dimmer, 'name': loc.gdtfPresetDimmer},
          {'role': GdtfRole.shutter, 'name': loc.gdtfPresetShutter},
          {'role': GdtfRole.red, 'name': loc.gdtfPresetRed},
          {'role': GdtfRole.green, 'name': loc.gdtfPresetGreen},
          {'role': GdtfRole.blue, 'name': loc.gdtfPresetBlue},
        ]);
      }

      for (final it in spec) {
        _channels.add(
          GdtfChannelDraft(
            role: it['role'] as GdtfRole,
            name: it['name'] as String,
            dmx: 1, // recalculé
            resolution: GdtfResolution.bit8, // défaut
            defaultValue: 0,
          ),
        );
      }

      _reindexDmxSequentialFrom1();
    });
  }

  void _addChannel() {
    final loc = AppLocalizations.of(context);
    setState(() {
      _channels.add(
        GdtfChannelDraft(
          role: GdtfRole.empty,
          name: loc.gdtfChannelDefaultName,
          dmx: 1, // recalculé
          resolution: GdtfResolution.bit8,
          defaultValue: 0,
        ),
      );
      _reindexDmxSequentialFrom1();
    });
  }

  void _deleteChannel(int index) {
    setState(() {
      _channels.removeAt(index);
      _reindexDmxSequentialFrom1();
    });
  }

  void _reorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = _channels.removeAt(oldIndex);
      _channels.insert(newIndex, item);
      _reindexDmxSequentialFrom1();
    });
  }

  // ---------- GDTF export ----------
  String _safeFilePart(String s) {
    final cleaned = s.trim().replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
    return cleaned.isEmpty ? 'Unknown' : cleaned;
  }

  String _buildDescriptionXml() {
    final manufacturer = _manufacturerCtrl.text.trim();
    final model = _modelCtrl.text.trim();
    final modeName =
        _modeCtrl.text.trim().isEmpty ? 'Default' : _modeCtrl.text.trim();

    XmlElement el(String name, {Map<String, String>? a, List<XmlNode>? c}) {
      return XmlElement(
        XmlName(name),
        [
          if (a != null)
            ...a.entries.map((e) => XmlAttribute(XmlName(e.key), e.value)),
        ],
        c ?? const [],
      );
    }

    final dmxChannels = _channels.map((ch) {
      final res = ch.resolution == GdtfResolution.bit16 ? '16' : '8';
      return el('DMXChannel', a: {
        'Name': ch.name,
        'DMX': ch.dmx.toString(),
        'Role': ch.role.name,
        'Resolution': res,
        'Default': ch.defaultValue.toString(),
      });
    }).toList();

    final shortNameBase = (model.isEmpty ? 'Unknown' : model);
    final shortName =
        shortNameBase.substring(0, shortNameBase.length.clamp(0, 16));

    final doc = XmlDocument([
      XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
      el('GDTF', a: {
        'DataVersion': '1.2'
      }, c: [
        el('FixtureType', a: {
          'Manufacturer': manufacturer.isEmpty ? 'Unknown' : manufacturer,
          'Name': model.isEmpty ? 'Unknown' : model,
          'ShortName': shortName,
        }, c: [
          el('DMXModes', c: [
            el('DMXMode', a: {
              'Name': modeName,
              'Footprint': _footprint().toString(),
            }, c: [
              el('DMXChannels', c: dmxChannels),
            ]),
          ]),
        ]),
      ]),
    ]);

    return doc.toXmlString(pretty: true, indent: '  ');
  }

  Future<void> _exportGdtf() async {
    final loc = AppLocalizations.of(context);

    if (_channels.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.gdtfExportNeedChannels)),
      );
      return;
    }

    try {
      final xml = _buildDescriptionXml();

      // ✅ iOS: taille en BYTES UTF8 (pas xml.length)
      final xmlBytes = utf8.encode(xml);

      final archive = Archive();
      archive
          .addFile(ArchiveFile('description.xml', xmlBytes.length, xmlBytes));

      final zipBytes = ZipEncoder().encode(archive);
      if (zipBytes == null) {
        throw Exception('ZipEncoder returned null');
      }

      final dir = await getTemporaryDirectory();
      final filename =
          '${_safeFilePart(_manufacturerCtrl.text)}-${_safeFilePart(_modelCtrl.text)}-${_safeFilePart(_modeCtrl.text.isEmpty ? 'Default' : _modeCtrl.text)}.gdtf';

      final outFile = File('${dir.path}/$filename');
      await outFile.writeAsBytes(zipBytes, flush: true);

      // ✅ iOS share_plus: ancre popover (simulateur/iPad)
      final box =
          _exportBtnKey.currentContext?.findRenderObject() as RenderBox?;
      final origin = box != null
          ? (box.localToGlobal(Offset.zero) & box.size)
          : const Rect.fromLTWH(1, 1, 1, 1); // non nul + dans la vue

      await Share.shareXFiles(
        [XFile(outFile.path)],
        text: loc.gdtfShareText,
        subject: loc.gdtfShareSubject,
        sharePositionOrigin: origin,
      );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.gdtfExportDone)),
      );
    } catch (e, st) {
      debugPrint('GDTF export failed: $e');
      debugPrint('$st');

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${loc.gdtfExportError} ($e)')),
      );
    }
  }

  // ---------- UI ----------
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.gdtfEasyTitle),
        actions: [
          IconButton(
            tooltip: loc.gdtfExportButton,
            onPressed: _exportGdtf,
            icon: const Icon(Icons.ios_share),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        children: [
          // Appareil
          SectionCard(
            title: loc.gdtfDeviceSectionTitle,
            icon: Icons.lightbulb_outline,
            child: Column(
              children: [
                TextField(
                  controller: _manufacturerCtrl,
                  decoration: InputDecoration(
                    labelText: loc.gdtfManufacturerLabel,
                    prefixIcon: const Icon(Icons.business),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _modelCtrl,
                  decoration: InputDecoration(
                    labelText: loc.gdtfModelLabel,
                    prefixIcon: const Icon(Icons.badge_outlined),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _modeCtrl,
                  decoration: InputDecoration(
                    labelText: loc.gdtfModeNameLabel,
                    prefixIcon: const Icon(Icons.tune),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _InfoPill(
                        label: loc.gdtfChannelsCountLabel,
                        value: _channels.length.toString(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _InfoPill(
                        label: loc.gdtfFootprintLabel,
                        value: _footprint().toString(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Présélections (2 lignes)
          SectionCard(
            title: loc.gdtfTemplatesTitle,
            icon: Icons.auto_fix_high,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<GdtfPreset>(
                        initialValue: _selectedPreset,
                        decoration: _denseDeco(loc.gdtfPresetLabel),
                        items: GdtfPreset.values
                            .map((p) => DropdownMenuItem(
                                  value: p,
                                  child: Text(_presetLabel(loc, p)),
                                ))
                            .toList(),
                        onChanged: (v) {
                          if (v == null) return;
                          setState(() => _selectedPreset = v);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    FilledButton(
                      onPressed: () => _applyPreset(_selectedPreset),
                      child: Text(loc.commonApply),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _addChannel,
                    icon: const Icon(Icons.add),
                    label: Text(loc.commonAdd),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  loc.gdtfTemplatesHintShort,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.65),
                      height: 1.25),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Canaux (reorder + scroll horizontal)
          SectionCard(
            title: loc.gdtfChannelsSectionTitle,
            icon: Icons.view_agenda_outlined,
            child: Column(
              children: [
                ReorderableListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  onReorder: _reorder,
                  itemCount: _channels.length,
                  itemBuilder: (context, index) {
                    final ch = _channels[index];

                    return Container(
                      key: ValueKey(ch.id),
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B0B0B),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.10)),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                              minWidth: 980, minHeight: 72),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ReorderableDragStartListener(
                                index: index,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.drag_handle,
                                    color: Colors.white.withValues(alpha: 0.70),
                                  ),
                                ),
                              ),

                              // DMX réel
                              Text(
                                '${ch.dmx}',
                                style: const TextStyle(
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Nom
                              SizedBox(
                                width: 160,
                                child: TextFormField(
                                  initialValue: ch.name,
                                  decoration: _denseDeco(loc.gdtfFieldName),
                                  onChanged: (v) => ch.name = v.trim(),
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Paramètre
                              SizedBox(
                                width: 180,
                                child: DropdownButtonFormField<GdtfRole>(
                                  initialValue: ch.role,
                                  decoration: _denseDeco(loc.gdtfFieldRole),
                                  items: GdtfRole.values
                                      .map((r) => DropdownMenuItem(
                                            value: r,
                                            child: Text(
                                              _roleLabel(loc, r),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (v) {
                                    if (v == null) return;
                                    setState(() {
                                      ch.role = v;
                                      if (ch.name.trim().isEmpty ||
                                          ch.name ==
                                              loc.gdtfChannelDefaultName) {
                                        ch.name = _roleLabel(loc, v);
                                      }
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Résolution
                              SizedBox(
                                width: 120,
                                child: DropdownButtonFormField<GdtfResolution>(
                                  initialValue: ch.resolution,
                                  decoration:
                                      _denseDeco(loc.gdtfFieldResolution),
                                  items: [
                                    DropdownMenuItem(
                                      value: GdtfResolution.bit8,
                                      child: Text(loc.gdtfRes8),
                                    ),
                                    DropdownMenuItem(
                                      value: GdtfResolution.bit16,
                                      child: Text(loc.gdtfRes16),
                                    ),
                                  ],
                                  onChanged: (v) {
                                    if (v == null) return;
                                    setState(() {
                                      ch.resolution = v;
                                      ch.clampDefault();
                                      // recalcul DMX (16-bit saute)
                                      _reindexDmxSequentialFrom1();
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),

                              // Défaut
                              SizedBox(
                                width: 110,
                                child: TextFormField(
                                  initialValue: ch.defaultValue.toString(),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: _denseDeco(loc.gdtfFieldDefault),
                                  onChanged: (v) {
                                    setState(() {
                                      ch.defaultValue =
                                          int.tryParse(v.trim()) ?? 0;
                                      ch.clampDefault();
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),

                              IconButton(
                                tooltip: loc.commonDelete,
                                onPressed: () => _deleteChannel(index),
                                icon: const Icon(Icons.delete_outline),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 8),

                // Ajouter canal (aussi ici)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style:
                        OutlinedButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: _addChannel,
                    icon: const Icon(Icons.add),
                    label: Text(loc.commonAdd),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Export (bouton avec key pour iOS popover)
          FilledButton.icon(
            key: _exportBtnKey,
            onPressed: _exportGdtf,
            icon: const Icon(Icons.ios_share),
            label: Text(loc.gdtfExportButton),
          ),
          const SizedBox(height: 10),
          Text(
            loc.gdtfExportHint,
            style: TextStyle(
                color: Colors.white.withValues(alpha: 0.45), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final String label;
  final String value;

  const _InfoPill({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.65),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
