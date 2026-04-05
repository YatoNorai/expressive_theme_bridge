package dev.expressive_theme_bridge

object ThemeTokenGenerator {
  fun createTokens(): Map<String, Any?> = mapOf(
    "radiusSmall" to 8.0,
    "radiusMedium" to 12.0,
    "radiusLarge" to 20.0,
    "radiusExtraLarge" to 28.0,
    "elevation0" to 0.0,
    "elevation1" to 1.0,
    "elevation2" to 3.0,
    "elevation3" to 6.0,
    "elevation4" to 8.0,
    "elevation5" to 12.0,
    "spacing4" to 4.0,
    "spacing8" to 8.0,
    "spacing12" to 12.0,
    "spacing16" to 16.0,
    "spacing24" to 24.0,
    "spacing32" to 32.0,
    "pressedOpacity" to 0.12,
    "hoveredOpacity" to 0.08,
    "focusedOpacity" to 0.10,
    "selectedOpacity" to 0.14,
    "disabledOpacity" to 0.38,
  )
}
