// lib/pages/safety/safety_theme.dart
//
// Couleurs partagées par les écrans du module Sécurité.

import 'package:flutter/material.dart';

import '../../l10n_gen/app_localizations.dart';
import 'safety_library.dart' show SafetyRiskLevel;

const Color kSafetyAccent = Color(0xFFF5A524);
const Color kSafetyOnAccent = Color(0xFF1A1300);
const Color kSafetyBg = Color(0xFF0D0D14);
const Color kSafetySheetBg = Color(0xFF16161F);

const Color kSafetyCritHigh = Color(0xFFFF6B6B);
const Color kSafetyCritMid = Color(0xFFF7B955);
const Color kSafetyCritLow = Color(0xFF5BC48A);

/// Couleur d'un niveau de risque (voir safetyRiskLevel).
Color safetyRiskLevelColor(SafetyRiskLevel level) {
  switch (level) {
    case SafetyRiskLevel.high:
      return kSafetyCritHigh;
    case SafetyRiskLevel.medium:
      return kSafetyCritMid;
    case SafetyRiskLevel.low:
      return kSafetyCritLow;
  }
}

/// Nom du pays dans la langue de l'app (le Sheet ne le donne qu'en français).
String safetyCountryName(AppLocalizations loc, String code, {String? fallback}) {
  switch (code) {
    case 'FR':
      return loc.safetyCountryFR;
    case 'BE':
      return loc.safetyCountryBE;
    case 'UK':
      return loc.safetyCountryUK;
    case 'LU':
      return loc.safetyCountryLU;
    case 'DE':
      return loc.safetyCountryDE;
    case 'NL':
      return loc.safetyCountryNL;
  }
  return fallback ?? code;
}
