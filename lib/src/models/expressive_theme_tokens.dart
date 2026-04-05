import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class ExpressiveThemeTokens extends ThemeExtension<ExpressiveThemeTokens> {
  const ExpressiveThemeTokens({
    required this.radiusSmall,
    required this.radiusMedium,
    required this.radiusLarge,
    required this.radiusExtraLarge,
    required this.elevation0,
    required this.elevation1,
    required this.elevation2,
    required this.elevation3,
    required this.elevation4,
    required this.elevation5,
    required this.spacing1,
    required this.spacing4,
    required this.spacing8,
    required this.spacing12,
    required this.spacing16,
    required this.spacing24,
    required this.spacing32,
    required this.pressedOpacity,
    required this.hoveredOpacity,
    required this.focusedOpacity,
    required this.selectedOpacity,
    required this.disabledOpacity,
  });

  final double radiusSmall;
  final double radiusMedium;
  final double radiusLarge;
  final double radiusExtraLarge;

  final double elevation0;
  final double elevation1;
  final double elevation2;
  final double elevation3;
  final double elevation4;
  final double elevation5;

  final double spacing1;
  final double spacing4;
  final double spacing8;
  final double spacing12;
  final double spacing16;
  final double spacing24;
  final double spacing32;

  final double pressedOpacity;
  final double hoveredOpacity;
  final double focusedOpacity;
  final double selectedOpacity;
  final double disabledOpacity;

  factory ExpressiveThemeTokens.defaults() {
    return const ExpressiveThemeTokens(
      radiusSmall: 8,
      radiusMedium: 12,
      radiusLarge: 20,
      radiusExtraLarge: 28,
      elevation0: 0,
      elevation1: 1,
      elevation2: 3,
      elevation3: 6,
      elevation4: 8,
      elevation5: 12,
      spacing1: 1,
      spacing4: 4,
      spacing8: 8,
      spacing12: 12,
      spacing16: 16,
      spacing24: 24,
      spacing32: 32,
      pressedOpacity: 0.12,
      hoveredOpacity: 0.08,
      focusedOpacity: 0.10,
      selectedOpacity: 0.14,
      disabledOpacity: 0.38,
    );
  }

  factory ExpressiveThemeTokens.fromMap(Map<String, Object?> map) {
    double d(String key, double fallback) => (map[key] as num?)?.toDouble() ?? fallback;
    return ExpressiveThemeTokens(
      radiusSmall: d('radiusSmall', 8),
      radiusMedium: d('radiusMedium', 12),
      radiusLarge: d('radiusLarge', 20),
      radiusExtraLarge: d('radiusExtraLarge', 28),
      elevation0: d('elevation0', 0),
      elevation1: d('elevation1', 1),
      elevation2: d('elevation2', 3),
      elevation3: d('elevation3', 6),
      elevation4: d('elevation4', 8),
      elevation5: d('elevation5', 12),
      spacing1: d('spacing1', 1),
      spacing4: d('spacing4', 4),
      spacing8: d('spacing8', 8),
      spacing12: d('spacing12', 12),
      spacing16: d('spacing16', 16),
      spacing24: d('spacing24', 24),
      spacing32: d('spacing32', 32),
      pressedOpacity: d('pressedOpacity', 0.12),
      hoveredOpacity: d('hoveredOpacity', 0.08),
      focusedOpacity: d('focusedOpacity', 0.10),
      selectedOpacity: d('selectedOpacity', 0.14),
      disabledOpacity: d('disabledOpacity', 0.38),
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'radiusSmall': radiusSmall,
      'radiusMedium': radiusMedium,
      'radiusLarge': radiusLarge,
      'radiusExtraLarge': radiusExtraLarge,
      'elevation0': elevation0,
      'elevation1': elevation1,
      'elevation2': elevation2,
      'elevation3': elevation3,
      'elevation4': elevation4,
      'elevation5': elevation5,
      'spacing1': spacing1,
      'spacing4': spacing4,
      'spacing8': spacing8,
      'spacing12': spacing12,
      'spacing16': spacing16,
      'spacing24': spacing24,
      'spacing32': spacing32,
      'pressedOpacity': pressedOpacity,
      'hoveredOpacity': hoveredOpacity,
      'focusedOpacity': focusedOpacity,
      'selectedOpacity': selectedOpacity,
      'disabledOpacity': disabledOpacity,
    };
  }

  @override
  ExpressiveThemeTokens copyWith({
    double? radiusSmall,
    double? radiusMedium,
    double? radiusLarge,
    double? radiusExtraLarge,
    double? elevation0,
    double? elevation1,
    double? elevation2,
    double? elevation3,
    double? elevation4,
    double? elevation5,
    double? spacing1,
    double? spacing4,
    double? spacing8,
    double? spacing12,
    double? spacing16,
    double? spacing24,
    double? spacing32,
    double? pressedOpacity,
    double? hoveredOpacity,
    double? focusedOpacity,
    double? selectedOpacity,
    double? disabledOpacity,
  }) {
    return ExpressiveThemeTokens(
      radiusSmall: radiusSmall ?? this.radiusSmall,
      radiusMedium: radiusMedium ?? this.radiusMedium,
      radiusLarge: radiusLarge ?? this.radiusLarge,
      radiusExtraLarge: radiusExtraLarge ?? this.radiusExtraLarge,
      elevation0: elevation0 ?? this.elevation0,
      elevation1: elevation1 ?? this.elevation1,
      elevation2: elevation2 ?? this.elevation2,
      elevation3: elevation3 ?? this.elevation3,
      elevation4: elevation4 ?? this.elevation4,
      elevation5: elevation5 ?? this.elevation5,
      spacing4: spacing4 ?? this.spacing4,
      spacing1: spacing1 ?? this.spacing1,
      spacing8: spacing8 ?? this.spacing8,
      spacing12: spacing12 ?? this.spacing12,
      spacing16: spacing16 ?? this.spacing16,
      spacing24: spacing24 ?? this.spacing24,
      spacing32: spacing32 ?? this.spacing32,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      hoveredOpacity: hoveredOpacity ?? this.hoveredOpacity,
      focusedOpacity: focusedOpacity ?? this.focusedOpacity,
      selectedOpacity: selectedOpacity ?? this.selectedOpacity,
      disabledOpacity: disabledOpacity ?? this.disabledOpacity,
    );
  }

  @override
  ExpressiveThemeTokens lerp(ThemeExtension<ExpressiveThemeTokens>? other, double t) {
    if (other is! ExpressiveThemeTokens) return this;
    return ExpressiveThemeTokens(
      radiusSmall: lerpDouble(radiusSmall, other.radiusSmall, t) ?? radiusSmall,
      radiusMedium: lerpDouble(radiusMedium, other.radiusMedium, t) ?? radiusMedium,
      radiusLarge: lerpDouble(radiusLarge, other.radiusLarge, t) ?? radiusLarge,
      radiusExtraLarge: lerpDouble(radiusExtraLarge, other.radiusExtraLarge, t) ?? radiusExtraLarge,
      elevation0: lerpDouble(elevation0, other.elevation0, t) ?? elevation0,
      elevation1: lerpDouble(elevation1, other.elevation1, t) ?? elevation1,
      elevation2: lerpDouble(elevation2, other.elevation2, t) ?? elevation2,
      elevation3: lerpDouble(elevation3, other.elevation3, t) ?? elevation3,
      elevation4: lerpDouble(elevation4, other.elevation4, t) ?? elevation4,
      elevation5: lerpDouble(elevation5, other.elevation5, t) ?? elevation5,
      spacing1: lerpDouble(spacing1, other.spacing1, t) ?? spacing1,
      spacing4: lerpDouble(spacing4, other.spacing4, t) ?? spacing4,
      spacing8: lerpDouble(spacing8, other.spacing8, t) ?? spacing8,
      spacing12: lerpDouble(spacing12, other.spacing12, t) ?? spacing12,
      spacing16: lerpDouble(spacing16, other.spacing16, t) ?? spacing16,
      spacing24: lerpDouble(spacing24, other.spacing24, t) ?? spacing24,
      spacing32: lerpDouble(spacing32, other.spacing32, t) ?? spacing32,
      pressedOpacity: lerpDouble(pressedOpacity, other.pressedOpacity, t) ?? pressedOpacity,
      hoveredOpacity: lerpDouble(hoveredOpacity, other.hoveredOpacity, t) ?? hoveredOpacity,
      focusedOpacity: lerpDouble(focusedOpacity, other.focusedOpacity, t) ?? focusedOpacity,
      selectedOpacity: lerpDouble(selectedOpacity, other.selectedOpacity, t) ?? selectedOpacity,
      disabledOpacity: lerpDouble(disabledOpacity, other.disabledOpacity, t) ?? disabledOpacity,
    );
  }
}
