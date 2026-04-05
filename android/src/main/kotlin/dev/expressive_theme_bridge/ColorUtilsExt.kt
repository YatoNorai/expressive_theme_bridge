package dev.expressive_theme_bridge

object ColorUtilsExt {
  fun isDarkBackground(colorScheme: Map<String, Any?>): Boolean {
    val surface = colorScheme["surface"] as? Int ?: return false
    val luminance = androidx.core.graphics.ColorUtils.calculateLuminance(surface)
    return luminance < 0.5
  }
}
