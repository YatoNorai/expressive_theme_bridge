package dev.expressive_theme_bridge

import android.content.Context
import androidx.annotation.MainThread
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ExpressiveThemeBridgePlugin : FlutterPlugin, MethodChannel.MethodCallHandler, EventChannel.StreamHandler {
  private lateinit var applicationContext: Context
  private lateinit var methodChannel: MethodChannel
  private lateinit var eventChannel: EventChannel
  private var events: EventChannel.EventSink? = null

  private val manager by lazy { ExpressiveThemeManager(applicationContext) }

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    applicationContext = binding.applicationContext
    methodChannel = MethodChannel(binding.binaryMessenger, METHOD_CHANNEL)
    eventChannel = EventChannel(binding.binaryMessenger, EVENT_CHANNEL)
    methodChannel.setMethodCallHandler(this)
    eventChannel.setStreamHandler(this)
    manager.setOnThemeChangedListener { snapshot ->
      emit(snapshot.toMap())
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel.setMethodCallHandler(null)
    eventChannel.setStreamHandler(null)
    events = null
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    when (call.method) {
      "getCurrentTheme" -> result.success(manager.currentSnapshot().toMap())
      "refreshTheme" -> result.success(manager.refresh().toMap())
      "enableMaterialYou" -> {
        manager.setMaterialYouEnabled(true)
        result.success(null)
      }
      "disableMaterialYou" -> {
        manager.setMaterialYouEnabled(false)
        result.success(null)
      }
      "toggleMaterialYou" -> {
        manager.setMaterialYouEnabled(!manager.isMaterialYouEnabled())
        result.success(null)
      }
      "setSeedColor" -> {
        val argb = (call.argument<Number>("argb")?.toInt() ?: manager.defaultSeedColor())
        manager.setSeedColor(argb)
        result.success(null)
      }
      else -> result.notImplemented()
    }
  }

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    this.events = events
    emit(manager.currentSnapshot().toMap())
  }

  override fun onCancel(arguments: Any?) {
    events = null
  }

  @MainThread
  private fun emit(map: Map<String, Any?>) {
    events?.success(map)
  }

  companion object {
    private const val METHOD_CHANNEL = "expressive_theme_bridge/methods"
    private const val EVENT_CHANNEL = "expressive_theme_bridge/events"
  }
}
