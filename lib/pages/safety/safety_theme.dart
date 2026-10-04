// lib/pages/safety/safety_theme.dart
//
// Couleurs partagées par les écrans du module Sécurité.

import 'package:flutter/material.dart';

const Color kSafetyAccent = Color(0xFFF5A524);
const Color kSafetyOnAccent = Color(0xFF1A1300);
const Color kSafetyBg = Color(0xFF0D0D14);
const Color kSafetySheetBg = Color(0xFF16161F);

const Color kSafetyCritHigh = Color(0xFFFF6B6B);
const Color kSafetyCritMid = Color(0xFFF7B955);
const Color kSafetyCritLow = Color(0xFF5BC48A);

/// Couleur d'une criticité (gravité × probabilité, de 1 à 16).
Color safetyCriticalityColor(int criticality) {
  if (criticality >= 12) return kSafetyCritHigh;
  if (criticality >= 6) return kSafetyCritMid;
  return kSafetyCritLow;
}
