import 'package:flutter/material.dart';
import 'package:flutter_template/foundation/extension/dark_mode.dart';
import 'package:flutter_template/presentation/style/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeProvider = Provider.family<AppTheme, BuildContext>(
  (ref, context) {
    return AppTheme.fromThemeMode(context: context);
  },
);

class AppTheme {
  AppTheme({
    required this.themeMode,
    required this.theme,
    required this.darkTheme,
    required this.appColors,
  });

  factory AppTheme.fromThemeMode({
    required BuildContext context,
  }) {
    return AppTheme(
      themeMode: context.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      appColors: context.isDarkMode ? AppColors.dark() : AppColors.light(),
    );
  }

  final ThemeMode themeMode;
  final ThemeData theme;
  final ThemeData darkTheme;
  final AppColors appColors;
}
