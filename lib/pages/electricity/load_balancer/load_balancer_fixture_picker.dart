// lib/pages/electricity/load_balancer/load_balancer_fixture_picker.dart
import 'package:flutter/material.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';
import '../../lumiere/fixtures/fixture_hybrid_repository.dart';
import '../../lumiere/fixtures/fixture_models.dart';
import 'load_balancer_models.dart';
import 'load_balancer_storage.dart';

/// Retourne un [LoadItem] si l'utilisateur sélectionne une fixture, null sinon.
Future<LoadItem?> showFixturePickerSheet(
  BuildContext context, {
  required PanelVoltageType voltageType,
}) {
  return showModalBottomSheet<LoadItem>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _FixturePickerSheet(voltageType: voltageType),
  );
}

class _FixturePickerSheet extends StatefulWidget {
  const _FixturePickerSheet({required this.voltageType});
  final PanelVoltageType voltageType;

  @override
  State<_FixturePickerSheet> createState() => _FixturePickerSheetState();
}

class _FixturePickerSheetState extends State<_FixturePickerSheet> {
  final _repo = FixtureHybridRepository();
  final _searchCtrl = TextEditingController();

  FixtureCatalog? _catalog;
  bool _loading = true;

  // Fixture sélectionnée
  Manufacturer? _selectedManufacturer;
  Product? _selectedProduct;

  // Config de l'item à créer
  int _quantity = 1;
  late PhaseAssignment _phase;
  int? _customPowerWatt;

  @override
  void initState() {
    super.initState();
    // Phase par défaut selon le type de montage
    _phase = widget.voltageType.isDelta
        ? PhaseAssignment.l1l2
        : PhaseAssignment.l1;
    _load();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      // Charge d'abord depuis le cache (rapide)
      final initial = await _repo.loadInitialFast();
      if (!mounted) return;
      setState(() {
        _catalog = initial;
        _loading = false;
      });

      // Puis rafraîchit depuis GitHub en arrière-plan
      final remote = await _repo.refreshRemote();
      if (!mounted) return;
      if (remote != null) {
        setState(() => _catalog = remote);
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _loading = false);
    }
  }

  List<Manufacturer> get _filteredManufacturers {
    if (_catalog == null) return [];
    final q = _searchCtrl.text.toLowerCase().trim();
    if (q.isEmpty) return _catalog!.manufacturers;
    return _catalog!.manufacturers.where((m) {
      final nameMatch = m.name.toLowerCase().contains(q);
      final productMatch =
          m.products.any((p) => p.name.toLowerCase().contains(q));
      return nameMatch || productMatch;
    }).toList();
  }

  List<PhaseAssignment> get _availablePhases => switch (widget.voltageType) {
        PanelVoltageType.mono110 => [PhaseAssignment.l1],
        PanelVoltageType.mono230 => [PhaseAssignment.l1],
        PanelVoltageType.tri220 => [
            PhaseAssignment.l1l2,
            PhaseAssignment.l2l3,
            PhaseAssignment.l3l1,
          ],
        PanelVoltageType.tri380 => [
            PhaseAssignment.l1,
            PhaseAssignment.l2,
            PhaseAssignment.l3,
          ],
      };

  void _selectManufacturer(Manufacturer m) {
    setState(() {
      _selectedManufacturer = m;
      _selectedProduct = null;
      _customPowerWatt = null;
    });
  }

  void _selectProduct(Product p) {
    setState(() {
      _selectedProduct = p;
      _customPowerWatt = p.powerWatt;
    });
  }

  void _confirm() {
    if (_selectedProduct == null || _selectedManufacturer == null) return;
    final power = _customPowerWatt ?? _selectedProduct!.powerWatt ?? 0;
    if (power <= 0) return;

    final item = LoadItem(
      id: LoadBalancerStorage.makeId(),
      manufacturer: _selectedManufacturer!.name,
      name: _selectedProduct!.name,
      powerWatt: power,
      quantity: _quantity,
      phase: _phase,
    );
    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final maxH = MediaQuery.of(context).size.height * 0.88;

    return Container(
      height: maxH,
      decoration: const BoxDecoration(
        color: Color(0xFF12121E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 6),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
            child: Row(
              children: [
                if (_selectedManufacturer != null)
                  GestureDetector(
                    onTap: () => setState(() {
                      _selectedManufacturer = null;
                      _selectedProduct = null;
                    }),
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white70, size: 20),
                  ),
                if (_selectedManufacturer != null) const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _selectedManufacturer == null
                        ? loc.lbSheetTitleDefault
                        : _selectedManufacturer!.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white54),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Corps
          Expanded(
            child: _loading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.amber))
                : _selectedManufacturer == null
                    ? _ManufacturerList(
                        manufacturers: _filteredManufacturers,
                        searchCtrl: _searchCtrl,
                        onSearch: () => setState(() {}),
                        onSelect: _selectManufacturer,
                      )
                    : _ProductConfig(
                        manufacturer: _selectedManufacturer!,
                        selectedProduct: _selectedProduct,
                        quantity: _quantity,
                        phase: _phase,
                        availablePhases: _availablePhases,
                        customPowerWatt: _customPowerWatt,
                        onSelectProduct: _selectProduct,
                        onQuantityChanged: (v) =>
                            setState(() => _quantity = v),
                        onPhaseChanged: (v) => setState(() => _phase = v),
                        onPowerChanged: (v) =>
                            setState(() => _customPowerWatt = v),
                        onConfirm: _selectedProduct != null &&
                                (_customPowerWatt ?? 0) > 0
                            ? _confirm
                            : null,
                      ),
          ),
        ],
      ),
    );
  }
}

// ─── Liste des fabricants ─────────────────────────────────────────────────────

class _ManufacturerList extends StatelessWidget {
  const _ManufacturerList({
    required this.manufacturers,
    required this.searchCtrl,
    required this.onSearch,
    required this.onSelect,
  });

  final List<Manufacturer> manufacturers;
  final TextEditingController searchCtrl;
  final VoidCallback onSearch;
  final ValueChanged<Manufacturer> onSelect;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: TextField(
            controller: searchCtrl,
            onChanged: (_) => onSearch(),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: loc.lbPickerSearchHint,
              hintStyle: const TextStyle(color: Colors.white38),
              prefixIcon:
                  const Icon(Icons.search, color: Colors.white38, size: 20),
              filled: true,
              fillColor: const Color(0xFF1A1A2E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            ),
          ),
        ),
        Expanded(
          child: manufacturers.isEmpty
              ? Center(
                  child: Text(loc.lbNoResults,
                      style: const TextStyle(color: Colors.white38)))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: manufacturers.length,
                  itemBuilder: (_, i) {
                    final m = manufacturers[i];
                    final withPower = m.products
                        .where((p) => p.powerWatt != null)
                        .length;
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      title: Text(m.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                      subtitle: Text(
                        loc.lbProductsWithPowerCount(withPower),
                        style: const TextStyle(
                            color: Colors.white38, fontSize: 12),
                      ),
                      trailing: const Icon(Icons.chevron_right,
                          color: Colors.white38),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onTap: () => onSelect(m),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// ─── Config produit ───────────────────────────────────────────────────────────

class _ProductConfig extends StatelessWidget {
  const _ProductConfig({
    required this.manufacturer,
    required this.selectedProduct,
    required this.quantity,
    required this.phase,
    required this.availablePhases,
    required this.customPowerWatt,
    required this.onSelectProduct,
    required this.onQuantityChanged,
    required this.onPhaseChanged,
    required this.onPowerChanged,
    required this.onConfirm,
  });

  final Manufacturer manufacturer;
  final Product? selectedProduct;
  final int quantity;
  final PhaseAssignment phase;
  final List<PhaseAssignment> availablePhases;
  final int? customPowerWatt;
  final ValueChanged<Product> onSelectProduct;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<PhaseAssignment> onPhaseChanged;
  final ValueChanged<int?> onPowerChanged;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      children: [
        // ── Sélection du produit ────────────────────────────────
        _SheetLabel(loc.lbFixtureSectionLabel),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: manufacturer.products
              .where((p) => p.powerWatt != null || true) // tous les produits
              .map((p) {
            final selected = selectedProduct?.name == p.name;
            final hasPower = p.powerWatt != null;
            return GestureDetector(
              onTap: () => onSelectProduct(p),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: selected
                      ? Colors.amber.withValues(alpha: 0.18)
                      : const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: selected ? Colors.amber : Colors.white12,
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p.name,
                        style: TextStyle(
                          color:
                              selected ? Colors.amber : Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        )),
                    const SizedBox(height: 2),
                    Text(
                      hasPower ? '${p.powerWatt} W' : loc.lbUnknownPower,
                      style: TextStyle(
                        color: hasPower
                            ? Colors.white54
                            : Colors.orange.withValues(alpha: 0.7),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),

        if (selectedProduct != null) ...[
          const SizedBox(height: 20),

          // ── Puissance (éditable) ────────────────────────────────
          _SheetLabel(loc.lbPowerLabel),
          const SizedBox(height: 6),
          _PowerField(
            initialValue: customPowerWatt,
            onChanged: onPowerChanged,
          ),

          const SizedBox(height: 20),

          // ── Quantité ────────────────────────────────────────────
          _SheetLabel(loc.lbQuantityLabel),
          const SizedBox(height: 6),
          _QuantityPicker(
            value: quantity,
            onChanged: onQuantityChanged,
          ),

          const SizedBox(height: 20),

          // ── Phase ───────────────────────────────────────────────
          _SheetLabel(loc.lbPhaseLabel),
          const SizedBox(height: 6),
          Row(
            children: availablePhases.map((p) {
              final selected = phase == p;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onPhaseChanged(p),
                  child: Container(
                    margin: EdgeInsets.only(
                        right: p != availablePhases.last ? 8 : 0),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected
                          ? _phaseColor(p).withValues(alpha: 0.18)
                          : const Color(0xFF1A1A2E),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            selected ? _phaseColor(p) : Colors.white12,
                        width: selected ? 1.5 : 1,
                      ),
                    ),
                    child: Text(
                      p.label,
                      style: TextStyle(
                        color: selected
                            ? _phaseColor(p)
                            : Colors.white54,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 28),

          // ── Résumé + bouton ────────────────────────────────────
          if (customPowerWatt != null && customPowerWatt! > 0)
            _SummaryRow(
              quantity: quantity,
              powerWatt: customPowerWatt!,
              phase: phase,
            ),

          const SizedBox(height: 12),

          FilledButton.icon(
            onPressed: onConfirm,
            icon: const Icon(Icons.add_circle_outline),
            label: Text(loc.lbAddToDistribution,
                style: const TextStyle(fontWeight: FontWeight.w800)),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ],
      ],
    );
  }
}

Color _phaseColor(PhaseAssignment p) => switch (p) {
      PhaseAssignment.l1 || PhaseAssignment.l1l2 => Colors.lightBlueAccent,
      PhaseAssignment.l2 || PhaseAssignment.l2l3 => Colors.greenAccent,
      PhaseAssignment.l3 || PhaseAssignment.l3l1 => Colors.orangeAccent,
    };

class _SheetLabel extends StatelessWidget {
  const _SheetLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      );
}

class _PowerField extends StatefulWidget {
  const _PowerField({required this.initialValue, required this.onChanged});
  final int? initialValue;
  final ValueChanged<int?> onChanged;

  @override
  State<_PowerField> createState() => _PowerFieldState();
}

class _PowerFieldState extends State<_PowerField> {
  late final TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(
        text: widget.initialValue != null
            ? widget.initialValue.toString()
            : '');
  }

  @override
  void didUpdateWidget(_PowerField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      final newText = widget.initialValue?.toString() ?? '';
      if (_ctrl.text != newText) {
        _ctrl.text = newText;
      }
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _ctrl,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      onChanged: (v) {
        final parsed = int.tryParse(v.trim());
        widget.onChanged(parsed);
      },
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context).lbPowerHint,
        hintStyle: const TextStyle(color: Colors.white24),
        suffixText: 'W',
        suffixStyle:
            const TextStyle(color: Colors.white54, fontSize: 15),
        filled: true,
        fillColor: const Color(0xFF1A1A2E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.amber, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      ),
    );
  }
}

class _QuantityPicker extends StatelessWidget {
  const _QuantityPicker(
      {required this.value, required this.onChanged});
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QBtn(
          icon: Icons.remove,
          onTap: value > 1 ? () => onChanged(value - 1) : null,
        ),
        const SizedBox(width: 16),
        Text(
          '$value',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900),
        ),
        const SizedBox(width: 16),
        _QBtn(
          icon: Icons.add,
          onTap: value < 99 ? () => onChanged(value + 1) : null,
        ),
      ],
    );
  }
}

class _QBtn extends StatelessWidget {
  const _QBtn({required this.icon, required this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: onTap != null
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: onTap != null ? Colors.white24 : Colors.white12,
          ),
        ),
        child: Icon(icon,
            color:
                onTap != null ? Colors.white70 : Colors.white24,
            size: 20),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.quantity,
    required this.powerWatt,
    required this.phase,
  });
  final int quantity;
  final int powerWatt;
  final PhaseAssignment phase;

  @override
  Widget build(BuildContext context) {
    final total = quantity * powerWatt;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          const Icon(Icons.bolt, color: Colors.amber, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$quantity × $powerWatt W = $total W sur ${phase.label}',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
