import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.error,
    required this.onError,
    required this.transparent,
  });

  factory AppColors.light() {
    return const AppColors(
      primary: _ReferenceColors.blue,
      onPrimary: _ReferenceColors.white,
      error: _ReferenceColors.red,
      onError: _ReferenceColors.white,
      transparent: _ReferenceColors.transparent,
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: _ReferenceColors.blue,
      onPrimary: _ReferenceColors.white,
      error: _ReferenceColors.red,
      onError: _ReferenceColors.white,
      transparent: _ReferenceColors.transparent,
    );
  }

  final Color primary;
  final Color onPrimary;
  final Color error;
  final Color onError;
  final Color transparent;
}

class _ReferenceColors {
  static const Color blue = Color(0xff658FDF);
  static const Color red = Color(0xffC85656);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);
}
