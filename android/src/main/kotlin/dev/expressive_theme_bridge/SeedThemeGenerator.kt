package dev.expressive_theme_bridge

import android.graphics.Color
import androidx.core.graphics.ColorUtils

class SeedThemeGenerator(private val seedColor: Int) {
  fun lightSchemeMap(): Map<String, Any?> = buildScheme(false)
  fun darkSchemeMap(): Map<String, Any?> = buildScheme(true)

  private fun buildScheme(dark: Boolean): Map<String, Any?> {
    val primary = seedColor
    val secondary = shiftHue(seedColor, 24f, 0.24f, if (dark) 0.88f else 0.78f)
    val tertiary = shiftHue(seedColor, 48f, 0.28f, if (dark) 0.90f else 0.82f)
    val neutral = neutralSurface(seedColor, dark)

    val onPrimary = bestOnColor(primary)
    val primaryContainer = tone(primary, if (dark) 0.28f else 0.88f, if (dark) 0.60f else 0.42f)
    val onPrimaryContainer = bestOnColor(primaryContainer)

    val secondaryContainer = tone(secondary, if (dark) 0.28f else 0.88f, if (dark) 0.55f else 0.42f)
    val tertiaryContainer = tone(tertiary, if (dark) 0.28f else 0.88f, if (dark) 0.55f else 0.42f)

    val surface = neutral
    val surfaceVariant = tone(neutral, if (dark) 0.20f else 0.94f, if (dark) 0.08f else 0.14f)
    val surfaceContainerLowest = tone(neutral, if (dark) 0.12f else 0.98f, 0.05f)
    val surfaceContainerLow = tone(neutral, if (dark) 0.16f else 0.96f, 0.07f)
    val surfaceContainer = tone(neutral, if (dark) 0.20f else 0.94f, 0.10f)
    val surfaceContainerHigh = tone(neutral, if (dark) 0.24f else 0.92f, 0.12f)
    val surfaceContainerHighest = tone(neutral, if (dark) 0.28f else 0.90f, 0.14f)
    val outline = tone(neutral, if (dark) 0.45f else 0.55f, 0.18f)

    val surfaceTint = primary
    val inverseSurface = if (dark) 0xFFF4EFF4.toInt() else 0xFF322F35.toInt()
    val onInverseSurface = if (dark) 0xFF322F35.toInt() else 0xFFF4EFF4.toInt()
    val inversePrimary = if (dark) tone(primary, 0.78f, 0.46f) else tone(primary, 0.38f, 0.42f)

    val error = 0xFFBA1A1A.toInt()
    val errorContainer = if (dark) 0xFF93000A.toInt() else 0xFFFFDAD6.toInt()

    return mapOf(
      "brightness" to if (dark) "dark" else "light",
      "primary" to primary,
      "onPrimary" to onPrimary,
      "primaryContainer" to primaryContainer,
      "onPrimaryContainer" to onPrimaryContainer,
      "primaryFixed" to tone(primary, 0.90f, 0.34f),
      "primaryFixedDim" to tone(primary, 0.80f, 0.40f),
      "onPrimaryFixed" to bestOnColor(tone(primary, 0.90f, 0.34f)),
      "onPrimaryFixedVariant" to tone(primary, 0.35f, 0.32f),
      "secondary" to secondary,
      "onSecondary" to bestOnColor(secondary),
      "secondaryContainer" to secondaryContainer,
      "onSecondaryContainer" to bestOnColor(secondaryContainer),
      "secondaryFixed" to tone(secondary, 0.90f, 0.32f),
      "secondaryFixedDim" to tone(secondary, 0.78f, 0.38f),
      "onSecondaryFixed" to bestOnColor(tone(secondary, 0.90f, 0.32f)),
      "onSecondaryFixedVariant" to tone(secondary, 0.34f, 0.30f),
      "tertiary" to tertiary,
      "onTertiary" to bestOnColor(tertiary),
      "tertiaryContainer" to tertiaryContainer,
      "onTertiaryContainer" to bestOnColor(tertiaryContainer),
      "tertiaryFixed" to tone(tertiary, 0.90f, 0.32f),
      "tertiaryFixedDim" to tone(tertiary, 0.78f, 0.38f),
      "onTertiaryFixed" to bestOnColor(tone(tertiary, 0.90f, 0.32f)),
      "onTertiaryFixedVariant" to tone(tertiary, 0.34f, 0.30f),
      "error" to error,
      "onError" to bestOnColor(error),
      "errorContainer" to errorContainer,
      "onErrorContainer" to bestOnColor(errorContainer),
      "background" to surface,
      "onBackground" to bestOnColor(surface),
      "surface" to surface,
      "onSurface" to bestOnColor(surface),
      "surfaceVariant" to surfaceVariant,
      "onSurfaceVariant" to bestOnColor(surfaceVariant),
      "surfaceTint" to surfaceTint,
      "inverseSurface" to inverseSurface,
      "onInverseSurface" to onInverseSurface,
      "inversePrimary" to inversePrimary,
      "shadow" to 0xFF000000.toInt(),
      "scrim" to 0xFF000000.toInt(),
      "outline" to outline,
      "outlineVariant" to tone(neutral, if (dark) 0.55f else 0.70f, 0.12f),
      "surfaceDim" to tone(neutral, if (dark) 0.14f else 0.94f, 0.06f),
      "surfaceBright" to tone(neutral, if (dark) 0.32f else 1.0f, 0.12f),
      "surfaceContainerLowest" to surfaceContainerLowest,
      "surfaceContainerLow" to surfaceContainerLow,
      "surfaceContainer" to surfaceContainer,
      "surfaceContainerHigh" to surfaceContainerHigh,
      "surfaceContainerHighest" to surfaceContainerHighest,
    )
  }

  private fun shiftHue(color: Int, degrees: Float, sat: Float, valFactor: Float): Int {
    val hsv = FloatArray(3)
    Color.colorToHSV(color, hsv)
    hsv[0] = (hsv[0] + degrees) % 360f
    hsv[1] = sat.coerceIn(0f, 1f)
    hsv[2] = valFactor.coerceIn(0f, 1f)
    return Color.HSVToColor(hsv)
  }

  private fun tone(color: Int, saturation: Float, value: Float): Int {
    val hsv = FloatArray(3)
    Color.colorToHSV(color, hsv)
    hsv[1] = saturation.coerceIn(0f, 1f)
    hsv[2] = value.coerceIn(0f, 1f)
    return Color.HSVToColor(hsv)
  }

  private fun neutralSurface(color: Int, dark: Boolean): Int {
    val hsv = FloatArray(3)
    Color.colorToHSV(color, hsv)
    hsv[1] = 0.10f
    hsv[2] = if (dark) 0.10f else 0.98f
    return Color.HSVToColor(hsv)
  }

  private fun bestOnColor(color: Int): Int {
    val luminance = ColorUtils.calculateLuminance(color)
    return if (luminance > 0.5) 0xFF1C1B1F.toInt() else 0xFFFFFFFF.toInt()
  }
}
