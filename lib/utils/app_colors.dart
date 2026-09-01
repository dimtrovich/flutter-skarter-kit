import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color(0xFF2DD4BF); // Vert d'eau lumineux

  // ==========================================
  // PALETTE PRIMAIRE & DÉGRADÉS (MindSet Brand)
  // ==========================================
  static const Color primaryMint = Color(0xFF2DD4BF); // Vert d'eau lumineux
  static const Color primaryTeal = Color(0xFF0F766E); // Vert canard profond
  static const Color accentCyan = Color(0xFF22D3EE); // Cyan d'accentuation

  /// Dégradé linéaire pour les boutons d'action et éléments mis en avant
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryMint, primaryTeal],
  );

  /// Dégradé linéaire doux pour les cartes et conteneurs interactifs
  static const LinearGradient cardGradientDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x1F2DD4BF), // primaryMint avec 12% d'opacité
      Color(0x050F766E), // primaryTeal avec 2% d'opacité
    ],
  );

  // ==========================================
  // MODE SOMBRE (Thème Principal / Apaisant)
  // ==========================================
  static const Color darkBackgroundDeep = Color(
    0xFF0F172A,
  ); // Bleu nuit très sombre
  static const Color darkBackgroundSlate = Color(
    0xFF1E293B,
  ); // Anthracite ardoise
  static const Color darkSurfaceCard = Color(0xFF334155); // Surface des cartes

  // Textes en mode sombre
  static const Color darkTextPrimary = Color(
    0xFFF8FAFC,
  ); // Blanc cassé (haute lisibilité)
  static const Color darkTextSecondary = Color(
    0xFF94A3B8,
  ); // Gris bleu (secondaire)
  static const Color darkTextMuted = Color(
    0xFF64748B,
  ); // Gris discret (placeholders)

  /// Dégradé radial pour le fond d'écran principal en Mode Sombre
  static const RadialGradient darkBackgroundRadial = RadialGradient(
    center: Alignment(-0.6, -0.6), // Orienté vers le haut/gauche
    radius: 1.2,
    colors: [darkBackgroundSlate, darkBackgroundDeep],
    stops: [0.0, 0.8],
  );

  // ==========================================
  // MODE CLAIR (Thème Secondaire)
  // ==========================================
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);

  // Textes en mode clair
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF475569);

  // ==========================================
  // ÉTATS & NOTIFICATIONS (Gamification Douce)
  // ==========================================
  static const Color success = Color(0xFF10B981); // Vert coche / régularité
  static const Color warning = Color(0xFBF59E0B); // Orange doux
  static const Color error = Color(0xFFEF4444); // Rouge erreur
}
