// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thememanager/theme_manager.dart';

final ThemePreferences _themePreference = ThemePreferences();

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);

  void setDarkMode() async {
    _themePreference.saveMode('appTheme', 'dark');
    state = ThemeMode.dark;
  }

  void setLightMode() async {
    _themePreference.saveMode('appTheme', 'light');
    state = ThemeMode.light;
  }

  void setSystemMode() async {
    _themePreference.saveMode('appTheme', '');
    state = ThemeMode.system;
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});
