import 'package:flutter/material.dart';

class AppColors {
  // Couleurs principales
  static const Color primary = Color(0xFF0B1526); // Bleu nuit profond
  static const Color primaryDark = Color(0xFF070E18);
  static const Color primaryLight = Color(0xFF1A2A44);

  static const Color secondary = Color(0xFFE65100); // Orange ambré commercial
  static const Color secondaryLight = Color(0xFFFF6D00);

  static const Color sellerAccent = Color(0xFF10B981); // Vert émeraude (Mode Vendeur)
  static const Color buyerAccent = Color(0xFFE65100); // Orange (Mode Acheteur)
  static const Color accent = Color(0xFFE65100);

  // Palette Light
  static const Color backgroundLight = Color(0xFFF7F7F8);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color textPrimaryLight = Color(0xFF0B1526);
  static const Color textSecondaryLight = Color(0xFF6B7280);
  static const Color borderLight = Color(0xFFE6E6E8);
  static const Color inputFillLight = Color(0xFFF2F3F5);

  // Palette Dark (Obligatoire §8 & §14.5)
  static const Color backgroundDark = Color(0xFF070E18);
  static const Color surfaceDark = Color(0xFF111C2D);
  static const Color textPrimaryDark = Color(0xFFF7F7F8);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);
  static const Color borderDark = Color(0xFF1F2F46);
  static const Color inputFillDark = Color(0xFF162338);

  // Sémantique
  static const Color success = Color(0xFF2E7D4F);
  static const Color warning = Color(0xFFD9A441);
  static const Color error = Color(0xFFC62828);
  static const Color info = Color(0xFF3B82F6);
}
