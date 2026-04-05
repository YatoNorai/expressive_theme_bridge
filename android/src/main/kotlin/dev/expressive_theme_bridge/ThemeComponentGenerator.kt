package dev.expressive_theme_bridge

object ThemeComponentGenerator {
  fun createComponentThemes(
    colorScheme: Map<String, Any?>,
    tokens: Map<String, Any?>,
  ): Map<String, Any?> {
    val radiusLarge = (tokens["radiusLarge"] as Number).toDouble()
    val radiusExtraLarge = (tokens["radiusExtraLarge"] as Number).toDouble()
    val elevation2 = (tokens["elevation2"] as Number).toDouble()
    val elevation3 = (tokens["elevation3"] as Number).toDouble()
    return mapOf(
      "card" to mapOf(
        "surfaceColor" to colorScheme["surfaceContainerLow"],
        "shapeRadius" to radiusLarge,
        "elevation" to elevation2,
      ),
      "buttons" to mapOf(
        "shapeRadius" to radiusLarge,
        "elevation" to elevation2,
      ),
      "inputs" to mapOf(
        "shapeRadius" to radiusLarge,
      ),
      "appBar" to mapOf(
        "shapeRadius" to radiusLarge,
        "elevation" to elevation2,
      ),
      "navigationBar" to mapOf(
        "shapeRadius" to radiusExtraLarge,
        "elevation" to elevation3,
      ),
      "dialog" to mapOf(
        "shapeRadius" to radiusExtraLarge,
        "elevation" to elevation3,
      ),
      "snackbar" to mapOf(
        "shapeRadius" to radiusLarge,
        "elevation" to elevation3,
      ),
      "switch" to mapOf(
        "trackHeight" to 32,
      ),
      "chips" to mapOf(
        "shapeRadius" to radiusExtraLarge,
      ),
      "lists" to mapOf(
        "shapeRadius" to radiusLarge,
      ),
      "progress" to mapOf(
        "thickness" to 4,
      ),
      "bottomSheet" to mapOf(
        "shapeRadius" to radiusExtraLarge,
        "elevation" to elevation3,
      ),
    )
  }
}
