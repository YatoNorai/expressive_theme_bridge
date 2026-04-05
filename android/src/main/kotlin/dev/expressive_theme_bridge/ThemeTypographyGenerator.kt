package dev.expressive_theme_bridge

object ThemeTypographyGenerator {
  fun createTypographyMap(brightness: Brightness): Map<String, Any?> {
    val color = if (brightness == Brightness.Dark) 0xFFFFFFFF.toInt() else 0xFF1C1B1F.toInt()
    return mapOf(
      "displayLarge" to text(57, 0.0, -0.25, "w400", color),
      "displayMedium" to text(45, 0.0, 0.0, "w400", color),
      "displaySmall" to text(36, 0.0, 0.0, "w400", color),
      "headlineLarge" to text(32, 0.0, 0.0, "w600", color),
      "headlineMedium" to text(28, 0.0, 0.0, "w600", color),
      "headlineSmall" to text(24, 0.0, 0.0, "w600", color),
      "titleLarge" to text(22, 0.0, 0.0, "w700", color),
      "titleMedium" to text(16, 0.1, 0.15, "w700", color),
      "titleSmall" to text(14, 0.1, 0.1, "w700", color),
      "bodyLarge" to text(16, 0.5, 0.5, "w400", color),
      "bodyMedium" to text(14, 0.25, 0.25, "w400", color),
      "bodySmall" to text(12, 0.4, 0.4, "w400", color),
      "labelLarge" to text(14, 0.1, 0.1, "w700", color),
      "labelMedium" to text(12, 0.5, 0.5, "w700", color),
      "labelSmall" to text(11, 0.5, 0.5, "w700", color),
    )
  }

  private fun text(
    fontSize: Int,
    height: Double,
    letterSpacing: Double,
    fontWeight: String,
    color: Int,
  ): Map<String, Any?> = mapOf(
    "fontSize" to fontSize,
    "height" to height,
    "letterSpacing" to letterSpacing,
    "fontWeight" to fontWeight,
    "color" to color,
  )
}
