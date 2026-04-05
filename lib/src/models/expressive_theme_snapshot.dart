import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../theme/expressive_theme_data.dart';
import 'expressive_theme_tokens.dart';

@immutable
class ExpressiveThemeSnapshot {
  const ExpressiveThemeSnapshot({
    required this.brightness,
    required this.isMaterialYouEnabled,
    required this.isDynamicColorSupported,
    required this.seedColor,
    required this.tokens,
    required this.light,
    required this.dark,
  });

  final Brightness brightness;
  final bool isMaterialYouEnabled;
  final bool isDynamicColorSupported;
  final Color seedColor;
  final ExpressiveThemeTokens tokens;
  final ExpressiveThemeVariant light;
  final ExpressiveThemeVariant dark;

  ThemeData get lightTheme => light.toThemeData(tokens: tokens);
  ThemeData get darkTheme => dark.toThemeData(tokens: tokens);

  ExpressiveComponentThemes get componentThemes {
    final merged = <String, Object?>{
      ...dark.componentThemes,
      ...light.componentThemes,
    };
    return ExpressiveComponentThemes.fromMap(merged);
  }

  ExpressiveThemeData toThemeData() {
    return ExpressiveThemeData(
      snapshot: this,
      lightTheme: light.toThemeData(tokens: tokens),
      darkTheme: dark.toThemeData(tokens: tokens),
      componentThemes: componentThemes,
    );
  }

  factory ExpressiveThemeSnapshot.fromMap(Map<String, Object?> map) {
    final brightness = (map['brightness'] as String? ?? 'light') == 'dark'
        ? Brightness.dark
        : Brightness.light;

    return ExpressiveThemeSnapshot(
      brightness: brightness,
      isMaterialYouEnabled: map['isMaterialYouEnabled'] as bool? ?? true,
      isDynamicColorSupported: map['isDynamicColorSupported'] as bool? ?? false,
      seedColor: Color((map['seedColor'] as num?)?.toInt() ?? 0xFF6750A4),
      tokens: ExpressiveThemeTokens.fromMap(
        Map<String, Object?>.from(map['tokens'] as Map? ?? const <String, Object?>{}),
      ),
      light: ExpressiveThemeVariant.fromMap(
        Map<String, Object?>.from(map['light'] as Map? ?? const <String, Object?>{}),
      ),
      dark: ExpressiveThemeVariant.fromMap(
        Map<String, Object?>.from(map['dark'] as Map? ?? const <String, Object?>{}),
      ),
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'brightness': brightness.name,
      'isMaterialYouEnabled': isMaterialYouEnabled,
      'isDynamicColorSupported': isDynamicColorSupported,
      'seedColor': seedColor.value,
      'tokens': tokens.toMap(),
      'light': light.toMap(),
      'dark': dark.toMap(),
    };
  }
}

@immutable
class ExpressiveThemeVariant {
  const ExpressiveThemeVariant({
    required this.colorScheme,
    required this.textTheme,
    required this.componentThemes,
  });

  final Map<String, Object?> colorScheme;
  final Map<String, Object?> textTheme;
  final Map<String, Object?> componentThemes;

  factory ExpressiveThemeVariant.fromMap(Map<String, Object?> map) {
    return ExpressiveThemeVariant(
      colorScheme: Map<String, Object?>.from(
        map['colorScheme'] as Map? ?? const <String, Object?>{},
      ),
      textTheme: Map<String, Object?>.from(
        map['textTheme'] as Map? ?? const <String, Object?>{},
      ),
      componentThemes: Map<String, Object?>.from(
        map['componentThemes'] as Map? ?? const <String, Object?>{},
      ),
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'colorScheme': colorScheme,
      'textTheme': textTheme,
      'componentThemes': componentThemes,
    };
  }
}