// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentBrightnessHash() => r'740d7ae1ce7175b829a2125ef9cb8916c91be64d';

/// See also [currentBrightness].
@ProviderFor(currentBrightness)
final currentBrightnessProvider = AutoDisposeProvider<Brightness>.internal(
  currentBrightness,
  name: r'currentBrightnessProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentBrightnessHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentBrightnessRef = AutoDisposeProviderRef<Brightness>;
String _$themeSettingsHash() => r'0f732ff8ac507161e2c20d54fcd8f9543897e167';

/// See also [ThemeSettings].
@ProviderFor(ThemeSettings)
final themeSettingsProvider =
    AutoDisposeNotifierProvider<ThemeSettings, ThemeMode>.internal(
  ThemeSettings.new,
  name: r'themeSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeSettings = AutoDisposeNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
