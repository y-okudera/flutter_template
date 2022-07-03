import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.error,
    required this.onError,
    required this.unselected,
    required this.transparent,
  });

  factory AppColors.light() {
    return const AppColors(
      primary: _ReferenceColors.blueShade700,
      onPrimary: _ReferenceColors.black,
      error: _ReferenceColors.redAccentShade400,
      onError: _ReferenceColors.white,
      unselected: _ReferenceColors.black26,
      transparent: _ReferenceColors.transparent,
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: _ReferenceColors.blueShade700,
      onPrimary: _ReferenceColors.black,
      error: _ReferenceColors.redAccentShade400,
      onError: _ReferenceColors.white,
      unselected: _ReferenceColors.black26,
      transparent: _ReferenceColors.transparent,
    );
  }

  final Color primary;
  final Color onPrimary;
  final Color error;
  final Color onError;
  final Color unselected;
  final Color transparent;
}

class _ReferenceColors {
  static const Color blueShade700 = Color(0xFF1976D2);
  static const Color redAccentShade400 = Color(0xFFFF1744);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black26 = Color(0x42000000);
  static const Color transparent = Color(0x00000000);
}
