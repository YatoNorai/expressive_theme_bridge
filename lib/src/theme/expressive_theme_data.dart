import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../models/expressive_theme_snapshot.dart';
import '../models/expressive_theme_tokens.dart';

@immutable
class ExpressiveComponentThemes extends ThemeExtension<ExpressiveComponentThemes> {
  const ExpressiveComponentThemes({
    required this.cardRadius,
    required this.cardElevation,
    required this.buttonRadius,
    required this.buttonElevation,
    required this.inputRadius,
    required this.appBarElevation,
    required this.navBarElevation,
    required this.dialogElevation,
    required this.snackBarElevation,
    required this.chipRadius,
    required this.dividerThickness,
    required this.listTileRadius,
    required this.fabElevation,
    required this.progressIndicatorHeight,
  });

  final double cardRadius;
  final double cardElevation;
  final double buttonRadius;
  final double buttonElevation;
  final double inputRadius;
  final double appBarElevation;
  final double navBarElevation;
  final double dialogElevation;
  final double snackBarElevation;
  final double chipRadius;
  final double dividerThickness;
  final double listTileRadius;
  final double fabElevation;
  final double progressIndicatorHeight;

  factory ExpressiveComponentThemes.fromMap(Map<String, Object?> map) {
    double resolveDouble(List<String> keys, double fallback) {
      for (final key in keys) {
        final value = map[key];
        if (value is num) return value.toDouble();
        if (value is String) {
          final parsed = double.tryParse(value);
          if (parsed != null) return parsed;
        }
      }
      return fallback;
    }

    return ExpressiveComponentThemes(
      cardRadius: resolveDouble(const ['cardRadius', 'card_radius'], 5),
      cardElevation: resolveDouble(const ['cardElevation', 'card_elevation'], 1),
      buttonRadius: resolveDouble(const ['buttonRadius', 'button_radius'], 20),
      buttonElevation: resolveDouble(const ['buttonElevation', 'button_elevation'], 1),
      inputRadius: resolveDouble(const ['inputRadius', 'input_radius'], 20),
      appBarElevation: resolveDouble(const ['appBarElevation', 'app_bar_elevation'], 0),
      navBarElevation: resolveDouble(const ['navBarElevation', 'nav_bar_elevation'], 2),
      dialogElevation: resolveDouble(const ['dialogElevation', 'dialog_elevation'], 3),
      snackBarElevation: resolveDouble(const ['snackBarElevation', 'snack_bar_elevation'], 3),
      chipRadius: resolveDouble(const ['chipRadius', 'chip_radius'], 999),
      dividerThickness: resolveDouble(const ['dividerThickness', 'divider_thickness'], 1),
      listTileRadius: resolveDouble(const ['listTileRadius', 'list_tile_radius'], 5),
      fabElevation: resolveDouble(const ['fabElevation', 'fab_elevation'], 3),
      progressIndicatorHeight: resolveDouble(const ['progressIndicatorHeight', 'progress_indicator_height'], 4),
    );
  }

  @override
  ExpressiveComponentThemes copyWith({
    double? cardRadius,
    double? cardElevation,
    double? buttonRadius,
    double? buttonElevation,
    double? inputRadius,
    double? appBarElevation,
    double? navBarElevation,
    double? dialogElevation,
    double? snackBarElevation,
    double? chipRadius,
    double? dividerThickness,
    double? listTileRadius,
    double? fabElevation,
    double? progressIndicatorHeight,
  }) {
    return ExpressiveComponentThemes(
      cardRadius: cardRadius ?? this.cardRadius,
      cardElevation: cardElevation ?? this.cardElevation,
      buttonRadius: buttonRadius ?? this.buttonRadius,
      buttonElevation: buttonElevation ?? this.buttonElevation,
      inputRadius: inputRadius ?? this.inputRadius,
      appBarElevation: appBarElevation ?? this.appBarElevation,
      navBarElevation: navBarElevation ?? this.navBarElevation,
      dialogElevation: dialogElevation ?? this.dialogElevation,
      snackBarElevation: snackBarElevation ?? this.snackBarElevation,
      chipRadius: chipRadius ?? this.chipRadius,
      dividerThickness: dividerThickness ?? this.dividerThickness,
      listTileRadius: listTileRadius ?? this.listTileRadius,
      fabElevation: fabElevation ?? this.fabElevation,
      progressIndicatorHeight: progressIndicatorHeight ?? this.progressIndicatorHeight,
    );
  }

  @override
  ExpressiveComponentThemes lerp(
    ThemeExtension<ExpressiveComponentThemes>? other,
    double t,
  ) {
    if (other is! ExpressiveComponentThemes) return this;

    return ExpressiveComponentThemes(
      cardRadius: lerpDouble(cardRadius, other.cardRadius, t) ?? cardRadius,
      cardElevation: lerpDouble(cardElevation, other.cardElevation, t) ?? cardElevation,
      buttonRadius: lerpDouble(buttonRadius, other.buttonRadius, t) ?? buttonRadius,
      buttonElevation: lerpDouble(buttonElevation, other.buttonElevation, t) ?? buttonElevation,
      inputRadius: lerpDouble(inputRadius, other.inputRadius, t) ?? inputRadius,
      appBarElevation: lerpDouble(appBarElevation, other.appBarElevation, t) ?? appBarElevation,
      navBarElevation: lerpDouble(navBarElevation, other.navBarElevation, t) ?? navBarElevation,
      dialogElevation: lerpDouble(dialogElevation, other.dialogElevation, t) ?? dialogElevation,
      snackBarElevation: lerpDouble(snackBarElevation, other.snackBarElevation, t) ?? snackBarElevation,
      chipRadius: lerpDouble(chipRadius, other.chipRadius, t) ?? chipRadius,
      dividerThickness: lerpDouble(dividerThickness, other.dividerThickness, t) ?? dividerThickness,
      listTileRadius: lerpDouble(listTileRadius, other.listTileRadius, t) ?? listTileRadius,
      fabElevation: lerpDouble(fabElevation, other.fabElevation, t) ?? fabElevation,
      progressIndicatorHeight:
          lerpDouble(progressIndicatorHeight, other.progressIndicatorHeight, t) ?? progressIndicatorHeight,
    );
  }
}

class ExpressiveThemeData {
  const ExpressiveThemeData({
    required this.snapshot,
    required this.lightTheme,
    required this.darkTheme,
    required this.componentThemes,
  });

  final ExpressiveThemeSnapshot snapshot;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ExpressiveComponentThemes componentThemes;
}

extension ExpressiveThemeVariantX on ExpressiveThemeVariant {
  ThemeData toThemeData({required ExpressiveThemeTokens tokens}) {
    final scheme = ColorScheme(
      brightness: _brightnessFromMap(colorScheme),
      primary: _color(colorScheme, 'primary'),
      onPrimary: _color(colorScheme, 'onPrimary'),
      primaryContainer: _color(colorScheme, 'primaryContainer'),
      onPrimaryContainer: _color(colorScheme, 'onPrimaryContainer'),
      primaryFixed: _color(colorScheme, 'primaryFixed'),
      primaryFixedDim: _color(colorScheme, 'primaryFixedDim'),
      onPrimaryFixed: _color(colorScheme, 'onPrimaryFixed'),
      onPrimaryFixedVariant: _color(colorScheme, 'onPrimaryFixedVariant'),
      secondary: _color(colorScheme, 'secondary'),
      onSecondary: _color(colorScheme, 'onSecondary'),
      secondaryContainer: _color(colorScheme, 'secondaryContainer'),
      onSecondaryContainer: _color(colorScheme, 'onSecondaryContainer'),
      secondaryFixed: _color(colorScheme, 'secondaryFixed'),
      secondaryFixedDim: _color(colorScheme, 'secondaryFixedDim'),
      onSecondaryFixed: _color(colorScheme, 'onSecondaryFixed'),
      onSecondaryFixedVariant: _color(colorScheme, 'onSecondaryFixedVariant'),
      tertiary: _color(colorScheme, 'tertiary'),
      onTertiary: _color(colorScheme, 'onTertiary'),
      tertiaryContainer: _color(colorScheme, 'tertiaryContainer'),
      onTertiaryContainer: _color(colorScheme, 'onTertiaryContainer'),
      tertiaryFixed: _color(colorScheme, 'tertiaryFixed'),
      tertiaryFixedDim: _color(colorScheme, 'tertiaryFixedDim'),
      onTertiaryFixed: _color(colorScheme, 'onTertiaryFixed'),
      onTertiaryFixedVariant: _color(colorScheme, 'onTertiaryFixedVariant'),
      error: _color(colorScheme, 'error'),
      onError: _color(colorScheme, 'onError'),
      errorContainer: _color(colorScheme, 'errorContainer'),
      onErrorContainer: _color(colorScheme, 'onErrorContainer'),
      background: _color(colorScheme, 'background'),
      onBackground: _color(colorScheme, 'onBackground'),
      surface: _color(colorScheme, 'surface'),
      onSurface: _color(colorScheme, 'onSurface'),
      surfaceVariant: _color(colorScheme, 'surfaceVariant'),
      onSurfaceVariant: _color(colorScheme, 'onSurfaceVariant'),
      surfaceTint: _color(colorScheme, 'surfaceTint'),
      inverseSurface: _color(colorScheme, 'inverseSurface'),
      onInverseSurface: _color(colorScheme, 'onInverseSurface'),
      inversePrimary: _color(colorScheme, 'inversePrimary'),
      shadow: _color(colorScheme, 'shadow'),
      scrim: _color(colorScheme, 'scrim'),
      outline: _color(colorScheme, 'outline'),
      outlineVariant: _color(colorScheme, 'outlineVariant'),
      surfaceDim: _color(colorScheme, 'surfaceDim'),
      surfaceBright: _color(colorScheme, 'surfaceBright'),
      surfaceContainerLowest: _color(colorScheme, 'surfaceContainerLowest'),
      surfaceContainerLow: _color(colorScheme, 'surfaceContainerLow'),
      surfaceContainer: _color(colorScheme, 'surfaceContainer'),
      surfaceContainerHigh: _color(colorScheme, 'surfaceContainerHigh'),
      surfaceContainerHighest: _color(colorScheme, 'surfaceContainerHighest'),
    );

    final text = _buildTextTheme(textTheme, scheme);
    final components = ExpressiveComponentThemes.fromMap(Map<String, Object?>.from(componentThemes));

    final cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(components.cardRadius),
    );
    final roundedMedium = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(components.buttonRadius),
    );
    final roundedLarge = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(components.inputRadius),
    );
    final roundedXL = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(components.dialogElevation * 8),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      textTheme: text,
      primaryTextTheme: text.apply(
        bodyColor: scheme.onPrimary,
        displayColor: scheme.onPrimary,
      ),
      iconTheme: IconThemeData(color: scheme.onSurfaceVariant, size: 24),
      scaffoldBackgroundColor: scheme.surfaceContainer,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surfaceContainer/*  scheme.surface */,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: scheme.surfaceTint,
        elevation: components.appBarElevation,
        centerTitle: false,
        scrolledUnderElevation: components.appBarElevation + 1,
        titleTextStyle: text.titleLarge?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        toolbarTextStyle: text.bodyMedium?.copyWith(color: scheme.onSurface),
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerHigh,
        shadowColor: Colors.transparent /* scheme.shadow */,
        surfaceTintColor: scheme.surfaceTint,
        elevation: 10/* components.cardElevation */,
        
        shape: cardShape,
        margin: EdgeInsets.all(tokens.spacing8),
        clipBehavior: Clip.antiAlias,
      ),
      buttonTheme: ButtonThemeData(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        shape: roundedMedium,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          disabledBackgroundColor: scheme.onSurface.withOpacity(tokens.disabledOpacity),
          disabledForegroundColor: scheme.onSurface.withOpacity(tokens.disabledOpacity),
          elevation: components.buttonElevation,
          shape: roundedMedium,
          padding: EdgeInsets.symmetric(
            horizontal: tokens.spacing24,
            vertical: tokens.spacing16,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primaryContainer,
          foregroundColor: scheme.onPrimaryContainer,
          elevation: components.buttonElevation,
          shape: roundedMedium,
          padding: EdgeInsets.symmetric(
            horizontal: tokens.spacing24,
            vertical: tokens.spacing16,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.outlineVariant),
          shape: roundedMedium,
          padding: EdgeInsets.symmetric(
            horizontal: tokens.spacing24,
            vertical: tokens.spacing16,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          shape: roundedMedium,
          padding: EdgeInsets.symmetric(
            horizontal: tokens.spacing16,
            vertical: tokens.spacing12,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primaryContainer,
        foregroundColor: scheme.onPrimaryContainer,
        elevation: components.fabElevation,
        shape: const StadiumBorder(),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return scheme.onSurface.withOpacity(tokens.disabledOpacity);
          }
          return states.contains(MaterialState.selected) ? scheme.primary : scheme.surfaceVariant;
        }),
        checkColor: MaterialStatePropertyAll(scheme.onPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(tokens.radiusSmall),
        ),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return scheme.onSurface.withOpacity(tokens.disabledOpacity);
          }
          return scheme.primary;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return scheme.onSurface.withOpacity(tokens.disabledOpacity);
          }
          return states.contains(MaterialState.selected) ? scheme.primary : scheme.outline;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return scheme.surfaceVariant.withOpacity(0.4);
          }
          return states.contains(MaterialState.selected) ? scheme.primaryContainer : scheme.surfaceVariant;
        }),
        trackOutlineColor: MaterialStatePropertyAll(scheme.outlineVariant),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        labelStyle: text.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
        hintStyle: text.bodyMedium?.copyWith(color: scheme.onSurfaceVariant.withOpacity(0.7)),
        helperStyle: text.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
        errorStyle: text.bodySmall?.copyWith(color: scheme.error),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(components.inputRadius),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(components.inputRadius),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(components.inputRadius),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(components.inputRadius),
          borderSide: BorderSide(color: scheme.outlineVariant.withOpacity(0.5)),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: tokens.spacing16,
          vertical: tokens.spacing16,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surfaceContainer,
        indicatorColor: scheme.primaryContainer,
        elevation: components.navBarElevation,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: MaterialStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(MaterialState.selected)
                ? scheme.onPrimaryContainer
                : scheme.onSurfaceVariant,
          );
        }),
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          return text.labelMedium?.copyWith(
            color: states.contains(MaterialState.selected)
                ? scheme.onPrimaryContainer
                : scheme.onSurfaceVariant,
            fontWeight: states.contains(MaterialState.selected) ? FontWeight.w700 : FontWeight.w500,
          );
        }),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        surfaceTintColor: scheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(components.dialogElevation * 8),
        ),
        elevation: components.dialogElevation,
        titleTextStyle: text.titleLarge?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        contentTextStyle: text.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: text.bodyMedium?.copyWith(color: scheme.onInverseSurface),
        actionTextColor: scheme.inversePrimary,
        disabledActionTextColor: scheme.onInverseSurface.withOpacity(tokens.disabledOpacity),
        shape: roundedMedium,
        elevation: components.snackBarElevation,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        disabledColor: scheme.onSurface.withOpacity(tokens.disabledOpacity),
        selectedColor: scheme.primaryContainer,
        secondarySelectedColor: scheme.secondaryContainer,
        labelStyle: text.labelLarge?.copyWith(color: scheme.onSurface),
        secondaryLabelStyle: text.labelLarge?.copyWith(color: scheme.onSecondaryContainer),
        padding: EdgeInsets.symmetric(
          horizontal: tokens.spacing12,
          vertical: tokens.spacing8,
        ),
        shape: StadiumBorder(
          side: BorderSide(color: scheme.outlineVariant),
        ),
        side: BorderSide(color: scheme.outlineVariant),
        brightness: scheme.brightness,
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: components.dividerThickness,
        space: tokens.spacing16,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: scheme.onSurfaceVariant,
        textColor: scheme.onSurface,
        tileColor: Colors.transparent /* scheme.surfaceContainerHigh */,
        
        enableFeedback: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(components.listTileRadius),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: tokens.spacing16,
          vertical: tokens.spacing4,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: scheme.primary,
        linearTrackColor: scheme.surfaceVariant,
        refreshBackgroundColor: scheme.surfaceContainer,
        circularTrackColor: scheme.surfaceVariant,
      ),
      tooltipTheme: TooltipThemeData(
        padding: EdgeInsets.symmetric(
          horizontal: tokens.spacing12,
          vertical: tokens.spacing8,
        ),
        textStyle: text.labelMedium?.copyWith(color: scheme.onInverseSurface),
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: BorderRadius.circular(tokens.radiusSmall),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        surfaceTintColor: scheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(tokens.radiusExtraLarge),
          ),
        ),
        elevation: components.dialogElevation,
        showDragHandle: true,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: scheme.primary,
        unselectedLabelColor: scheme.onSurfaceVariant,
        indicatorColor: scheme.primary,
        dividerColor: scheme.outlineVariant,
        labelStyle: text.labelLarge?.copyWith(fontWeight: FontWeight.w700),
        unselectedLabelStyle: text.labelLarge?.copyWith(fontWeight: FontWeight.w500),
      ),
      extensions: <ThemeExtension<dynamic>>[
        tokens,
        components,
      ],
      splashFactory: InkSparkle.splashFactory,
    );
  }

  Brightness _brightnessFromMap(Map<String, Object?> map) {
    return (map['brightness'] as String? ?? 'light') == 'dark'
        ? Brightness.dark
        : Brightness.light;
  }

  Color _color(Map<String, Object?> map, String key) {
    final value = map[key];
    if (value is Color) return value;
    if (value is int) return Color(value);
    if (value is num) return Color(value.toInt());
    if (value is String) {
      final parsed = _parseHexColor(value);
      if (parsed != null) return parsed;
    }
    return const Color(0xFF000000);
  }

  Color? _parseHexColor(String value) {
    final cleaned = value.replaceAll('#', '').replaceAll('0x', '').trim();
    if (cleaned.isEmpty) return null;

    final normalized = cleaned.length == 6 ? 'FF$cleaned' : cleaned;
    final parsed = int.tryParse(normalized, radix: 16);
    if (parsed == null) return null;
    return Color(parsed);
  }

  TextTheme _buildTextTheme(Map<String, Object?> map, ColorScheme scheme) {
    TextStyle style(String name, {required Color fallbackColor}) {
      final item = Map<String, Object?>.from(map[name] as Map? ?? const <String, Object?>{});
      final explicitColor = item['color'];
      final parsedColor = explicitColor is int
          ? Color(explicitColor)
          : explicitColor is num
              ? Color(explicitColor.toInt())
              : explicitColor is String
                  ? _parseHexColor(explicitColor)
                  : null;

      return TextStyle(
        color: parsedColor ?? fallbackColor,
        fontSize: (item['fontSize'] as num?)?.toDouble(),
        fontWeight: _fontWeight(item['fontWeight'] as String?),
        height: (item['height'] as num?)?.toDouble(),
        letterSpacing: (item['letterSpacing'] as num?)?.toDouble(),
      );
    }

    return TextTheme(
      displayLarge: style('displayLarge', fallbackColor: scheme.onSurface),
      displayMedium: style('displayMedium', fallbackColor: scheme.onSurface),
      displaySmall: style('displaySmall', fallbackColor: scheme.onSurface),
      headlineLarge: style('headlineLarge', fallbackColor: scheme.onSurface),
      headlineMedium: style('headlineMedium', fallbackColor: scheme.onSurface),
      headlineSmall: style('headlineSmall', fallbackColor: scheme.onSurface),
      titleLarge: style('titleLarge', fallbackColor: scheme.onSurface),
      titleMedium: style('titleMedium', fallbackColor: scheme.onSurface),
      titleSmall: style('titleSmall', fallbackColor: scheme.onSurface),
      bodyLarge: style('bodyLarge', fallbackColor: scheme.onSurface),
      bodyMedium: style('bodyMedium', fallbackColor: scheme.onSurface),
      bodySmall: style('bodySmall', fallbackColor: scheme.onSurfaceVariant),
      labelLarge: style('labelLarge', fallbackColor: scheme.onSurfaceVariant),
      labelMedium: style('labelMedium', fallbackColor: scheme.onSurfaceVariant),
      labelSmall: style('labelSmall', fallbackColor: scheme.onSurfaceVariant),
    );
  }

  FontWeight? _fontWeight(String? value) {
    switch (value) {
      case 'w100':
        return FontWeight.w100;
      case 'w200':
        return FontWeight.w200;
      case 'w300':
        return FontWeight.w300;
      case 'w400':
        return FontWeight.w400;
      case 'w500':
        return FontWeight.w500;
      case 'w600':
        return FontWeight.w600;
      case 'w700':
        return FontWeight.w700;
      case 'w800':
        return FontWeight.w800;
      case 'w900':
        return FontWeight.w900;
      default:
        return null;
    }
  }
}