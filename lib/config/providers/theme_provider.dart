import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/storage/local_storage.dart';

part 'theme_provider.g.dart';

// Remove the custom ThemeMode enum and use Flutter's built-in one
// enum ThemeMode {
//   light,
//   dark,
//   system,
// }

@riverpod
class ThemeSettings extends _$ThemeSettings {
  static const _themeKey = 'THEME_MODE';

  @override
  ThemeMode build() {
    _loadTheme();
    return ThemeMode.system;
  }

  Future<void> _loadTheme() async {
    final localStorage = ref.read(localStorageProvider);
    final themeString = localStorage.getString(_themeKey);
    
    if (themeString != null) {
      state = ThemeMode.values.firstWhere(
        (e) => e.toString() == themeString,
        orElse: () => ThemeMode.system,
      );
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final localStorage = ref.read(localStorageProvider);
    await localStorage.saveString(_themeKey, mode.toString());
    state = mode;
  }
}

@riverpod
Brightness currentBrightness(CurrentBrightnessRef ref) {
  final themeMode = ref.watch(themeSettingsProvider);
  final platformBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  
  switch (themeMode) {
    case ThemeMode.light:
      return Brightness.light;
    case ThemeMode.dark:
      return Brightness.dark;
    case ThemeMode.system:
    default:
      return platformBrightness;
  }
}