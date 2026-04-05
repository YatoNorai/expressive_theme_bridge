package dev.expressive_theme_bridge

import android.content.Context
import android.os.Build

class ExpressiveThemeManager(private val context: Context) {
  private var materialYouEnabled: Boolean = true
  private var seedColor: Int = 0xFF6750A4.toInt()
  private var listener: ((ExpressiveThemeSnapshot) -> Unit)? = null

  fun setOnThemeChangedListener(listener: ((ExpressiveThemeSnapshot) -> Unit)?) {
    this.listener = listener
  }

  fun isMaterialYouEnabled(): Boolean = materialYouEnabled

  fun defaultSeedColor(): Int = seedColor

  fun setMaterialYouEnabled(enabled: Boolean) {
    materialYouEnabled = enabled
    notifyChanged()
  }

  fun setSeedColor(argb: Int) {
    seedColor = argb
    notifyChanged()
  }

  fun currentSnapshot(): ExpressiveThemeSnapshot {
    return ExpressiveThemeFactory.create(
      context = context,
      materialYouEnabled = materialYouEnabled,
      seedColor = seedColor,
    )
  }

  fun refresh(): ExpressiveThemeSnapshot {
    val snapshot = currentSnapshot()
    notifyChanged(snapshot)
    return snapshot
  }

  private fun notifyChanged(snapshot: ExpressiveThemeSnapshot = currentSnapshot()) {
    listener?.invoke(snapshot)
  }
}
