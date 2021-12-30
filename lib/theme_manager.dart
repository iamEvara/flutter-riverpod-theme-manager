// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  late ThemeMode _themeMode;
  ThemeMode getTheme() => _themeMode;
  void saveMode(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> readMode(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? obj = prefs.getString(key);
    return obj ?? '';
  }

  Future<ThemeMode> getMode() async {
    final theme = await readMode('appTheme');
    if (theme == '') {
      return ThemeMode.system;
    } else if (theme == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
