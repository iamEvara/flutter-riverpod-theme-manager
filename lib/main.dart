// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thememanager/theme_state.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: watch(themeProvider),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final themeMode = watch(themeProvider);
    final themeModeNotifier = watch(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: DropdownButton<ThemeMode>(
        value: themeMode,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: [ThemeMode.dark, ThemeMode.light, ThemeMode.system]
            .map((ThemeMode items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items.toString().split(".")[1]),
          );
        }).toList(),
        onChanged: (ThemeMode? newValue) {
          if (newValue == ThemeMode.light) {
            themeModeNotifier.setLightMode();
          } else if (newValue == ThemeMode.dark) {
            themeModeNotifier.setDarkMode();
          } else if (newValue == ThemeMode.system) {
            themeModeNotifier.setSystemMode();
          }
        },
      ),
    );
  }
}
