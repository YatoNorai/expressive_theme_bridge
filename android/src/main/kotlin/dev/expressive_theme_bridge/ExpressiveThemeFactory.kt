package dev.expressive_theme_bridge

import android.content.Context
import android.content.res.Configuration
import android.os.Build
import androidx.core.content.ContextCompat

object ExpressiveThemeFactory {
  fun create(
    context: Context,
    materialYouEnabled: Boolean,
    seedColor: Int,
  ): ExpressiveThemeSnapshot {
    val dynamicColorSupported = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
    val lightScheme = when {
      materialYouEnabled && dynamicColorSupported -> dynamicLightSchemeMap(context)
      else -> SeedThemeGenerator(seedColor).lightSchemeMap()
    }
    val darkScheme = when {
      materialYouEnabled && dynamicColorSupported -> dynamicDarkSchemeMap(context)
      else -> SeedThemeGenerator(seedColor).darkSchemeMap()
    }

    val tokens = ThemeTokenGenerator.createTokens()
    val lightTypography = ThemeTypographyGenerator.createTypographyMap(Brightness.Light)
    val darkTypography = ThemeTypographyGenerator.createTypographyMap(Brightness.Dark)

    return ExpressiveThemeSnapshot(
      brightness = if ((context.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES) "dark" else "light",
      isMaterialYouEnabled = materialYouEnabled,
      isDynamicColorSupported = dynamicColorSupported,
      seedColor = seedColor,
      tokens = tokens,
      light = mapOf(
        "colorScheme" to lightScheme,
        "textTheme" to lightTypography,
        "componentThemes" to ThemeComponentGenerator.createComponentThemes(lightScheme, tokens),
      ),
      dark = mapOf(
        "colorScheme" to darkScheme,
        "textTheme" to darkTypography,
        "componentThemes" to ThemeComponentGenerator.createComponentThemes(darkScheme, tokens),
      ),
    )
  }

  private fun dynamicLightSchemeMap(context: Context): Map<String, Any?> {
    return mapOf(
      "brightness" to "light",
      "primary" to c(context, android.R.color.system_primary_light),
      "onPrimary" to c(context, android.R.color.system_on_primary_light),
      "primaryContainer" to c(context, android.R.color.system_primary_container_light),
      "onPrimaryContainer" to c(context, android.R.color.system_on_primary_container_light),
      "primaryFixed" to c(context, android.R.color.system_primary_fixed),
      "primaryFixedDim" to c(context, android.R.color.system_primary_fixed_dim),
      "onPrimaryFixed" to c(context, android.R.color.system_on_primary_fixed),
      "onPrimaryFixedVariant" to c(context, android.R.color.system_on_primary_fixed_variant),
      "secondary" to c(context, android.R.color.system_secondary_light),
      "onSecondary" to c(context, android.R.color.system_on_secondary_light),
      "secondaryContainer" to c(context, android.R.color.system_secondary_container_light),
      "onSecondaryContainer" to c(context, android.R.color.system_on_secondary_container_light),
      "secondaryFixed" to c(context, android.R.color.system_secondary_fixed),
      "secondaryFixedDim" to c(context, android.R.color.system_secondary_fixed_dim),
      "onSecondaryFixed" to c(context, android.R.color.system_on_secondary_fixed),
      "onSecondaryFixedVariant" to c(context, android.R.color.system_on_secondary_fixed_variant),
      "tertiary" to c(context, android.R.color.system_tertiary_light),
      "onTertiary" to c(context, android.R.color.system_on_tertiary_light),
      "tertiaryContainer" to c(context, android.R.color.system_tertiary_container_light),
      "onTertiaryContainer" to c(context, android.R.color.system_on_tertiary_container_light),
      "tertiaryFixed" to c(context, android.R.color.system_tertiary_fixed),
      "tertiaryFixedDim" to c(context, android.R.color.system_tertiary_fixed_dim),
      "onTertiaryFixed" to c(context, android.R.color.system_on_tertiary_fixed),
      "onTertiaryFixedVariant" to c(context, android.R.color.system_on_tertiary_fixed_variant),
      "error" to c(context, android.R.color.system_error_light),
      "onError" to c(context, android.R.color.system_on_error_light),
      "errorContainer" to c(context, android.R.color.system_error_container_light),
      "onErrorContainer" to c(context, android.R.color.system_on_error_container_light),
      "background" to c(context, android.R.color.system_background_light),
      "onBackground" to c(context, android.R.color.system_on_background_light),
      "surface" to c(context, android.R.color.system_surface_light),
      "onSurface" to c(context, android.R.color.system_on_surface_light),
      "surfaceVariant" to c(context, android.R.color.system_surface_variant_light),
      "onSurfaceVariant" to c(context, android.R.color.system_on_surface_variant_light),
      "surfaceTint" to c(context, android.R.color.system_primary_light),
      "inverseSurface" to c(context, android.R.color.system_surface_dark),
      "onInverseSurface" to c(context, android.R.color.system_on_surface_dark),
      "inversePrimary" to c(context, android.R.color.system_primary_dark),
      "shadow" to 0xFF000000.toInt(),
      "scrim" to 0xFF000000.toInt(),
      "outline" to c(context, android.R.color.system_outline_light),
      "outlineVariant" to c(context, android.R.color.system_outline_variant_light),
      "surfaceDim" to c(context, android.R.color.system_surface_dim_light),
      "surfaceBright" to c(context, android.R.color.system_surface_bright_light),
      "surfaceContainerLowest" to c(context, android.R.color.system_surface_container_lowest_light),
      "surfaceContainerLow" to c(context, android.R.color.system_surface_container_low_light),
      "surfaceContainer" to c(context, android.R.color.system_surface_container_light),
      "surfaceContainerHigh" to c(context, android.R.color.system_surface_container_high_light),
      "surfaceContainerHighest" to c(context, android.R.color.system_surface_container_highest_light),
    )
  }

  private fun dynamicDarkSchemeMap(context: Context): Map<String, Any?> {
    return mapOf(
      "brightness" to "dark",
      "primary" to c(context, android.R.color.system_primary_dark),
      "onPrimary" to c(context, android.R.color.system_on_primary_dark),
      "primaryContainer" to c(context, android.R.color.system_primary_container_dark),
      "onPrimaryContainer" to c(context, android.R.color.system_on_primary_container_dark),
      "primaryFixed" to c(context, android.R.color.system_primary_fixed),
      "primaryFixedDim" to c(context, android.R.color.system_primary_fixed_dim),
      "onPrimaryFixed" to c(context, android.R.color.system_on_primary_fixed),
      "onPrimaryFixedVariant" to c(context, android.R.color.system_on_primary_fixed_variant),
      "secondary" to c(context, android.R.color.system_secondary_dark),
      "onSecondary" to c(context, android.R.color.system_on_secondary_dark),
      "secondaryContainer" to c(context, android.R.color.system_secondary_container_dark),
      "onSecondaryContainer" to c(context, android.R.color.system_on_secondary_container_dark),
      "secondaryFixed" to c(context, android.R.color.system_secondary_fixed),
      "secondaryFixedDim" to c(context, android.R.color.system_secondary_fixed_dim),
      "onSecondaryFixed" to c(context, android.R.color.system_on_secondary_fixed),
      "onSecondaryFixedVariant" to c(context, android.R.color.system_on_secondary_fixed_variant),
      "tertiary" to c(context, android.R.color.system_tertiary_dark),
      "onTertiary" to c(context, android.R.color.system_on_tertiary_dark),
      "tertiaryContainer" to c(context, android.R.color.system_tertiary_container_dark),
      "onTertiaryContainer" to c(context, android.R.color.system_on_tertiary_container_dark),
      "tertiaryFixed" to c(context, android.R.color.system_tertiary_fixed),
      "tertiaryFixedDim" to c(context, android.R.color.system_tertiary_fixed_dim),
      "onTertiaryFixed" to c(context, android.R.color.system_on_tertiary_fixed),
      "onTertiaryFixedVariant" to c(context, android.R.color.system_on_tertiary_fixed_variant),
      "error" to c(context, android.R.color.system_error_dark),
      "onError" to c(context, android.R.color.system_on_error_dark),
      "errorContainer" to c(context, android.R.color.system_error_container_dark),
      "onErrorContainer" to c(context, android.R.color.system_on_error_container_dark),
      "background" to c(context, android.R.color.system_background_dark),
      "onBackground" to c(context, android.R.color.system_on_background_dark),
      "surface" to c(context, android.R.color.system_surface_dark),
      "onSurface" to c(context, android.R.color.system_on_surface_dark),
      "surfaceVariant" to c(context, android.R.color.system_surface_variant_dark),
      "onSurfaceVariant" to c(context, android.R.color.system_on_surface_variant_dark),
      "surfaceTint" to c(context, android.R.color.system_primary_dark),
      "inverseSurface" to c(context, android.R.color.system_surface_light),
      "onInverseSurface" to c(context, android.R.color.system_on_surface_light),
      "inversePrimary" to c(context, android.R.color.system_primary_light),
      "shadow" to 0xFF000000.toInt(),
      "scrim" to 0xFF000000.toInt(),
      "outline" to c(context, android.R.color.system_outline_dark),
      "outlineVariant" to c(context, android.R.color.system_outline_variant_dark),
      "surfaceDim" to c(context, android.R.color.system_surface_dim_dark),
      "surfaceBright" to c(context, android.R.color.system_surface_bright_dark),
      "surfaceContainerLowest" to c(context, android.R.color.system_surface_container_lowest_dark),
      "surfaceContainerLow" to c(context, android.R.color.system_surface_container_low_dark),
      "surfaceContainer" to c(context, android.R.color.system_surface_container_dark),
      "surfaceContainerHigh" to c(context, android.R.color.system_surface_container_high_dark),
      "surfaceContainerHighest" to c(context, android.R.color.system_surface_container_highest_dark),
    )
  }

  private fun c(context: Context, resId: Int): Int = ContextCompat.getColor(context, resId)
}
