import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mon_app_tech/app/constants.dart';
import 'package:mon_app_tech/app/ui/widgets.dart' as ui;

class ElectricityNumField extends StatelessWidget {
  const ElectricityNumField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.suffix,
    this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final String suffix;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9\.,]')),
      ],
      onChanged: onChanged,
      style: const TextStyle(fontSize: 17),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixText: suffix.isEmpty ? null : suffix,
        filled: true,
        fillColor: const Color(0xFF1A1A26),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.35)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    this.accentColor = kSectionElectricity,
  });

  final String title;
  final IconData icon;
  final Widget child;
  final Color accentColor;

  // Délègue au design commun de l'app (pastille colorée, dégradé).
  @override
  Widget build(BuildContext context) => ui.SectionCard(
        title: title,
        icon: icon,
        accentColor: accentColor,
        child: child,
      );
}
