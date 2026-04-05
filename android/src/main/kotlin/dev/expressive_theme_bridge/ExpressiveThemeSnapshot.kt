package dev.expressive_theme_bridge

data class ExpressiveThemeSnapshot(
  val brightness: String,
  val isMaterialYouEnabled: Boolean,
  val isDynamicColorSupported: Boolean,
  val seedColor: Int,
  val tokens: Map<String, Any?>,
  val light: Map<String, Any?>,
  val dark: Map<String, Any?>,
) {
  fun toMap(): Map<String, Any?> = mapOf(
    "brightness" to brightness,
    "isMaterialYouEnabled" to isMaterialYouEnabled,
    "isDynamicColorSupported" to isDynamicColorSupported,
    "seedColor" to seedColor,
    "tokens" to tokens,
    "light" to light,
    "dark" to dark,
  )
}
