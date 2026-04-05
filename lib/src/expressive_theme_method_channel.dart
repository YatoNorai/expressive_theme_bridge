import 'dart:async';


import 'package:flutter/services.dart';

import 'expressive_theme_bridge_platform_interface.dart';
import 'models/expressive_theme_snapshot.dart';

class MethodChannelExpressiveThemeBridge extends ExpressiveThemeBridgePlatform {
  MethodChannelExpressiveThemeBridge({MethodChannel? methodChannel, EventChannel? eventChannel})
      : _methodChannel = methodChannel ?? const MethodChannel(_methodChannelName),
        _eventChannel = eventChannel ?? const EventChannel(_eventChannelName) {
    _eventsSubscription = _eventChannel.receiveBroadcastStream().listen((dynamic event) {
      if (event is Map) {
        final snapshot = ExpressiveThemeSnapshot.fromMap(Map<String, Object?>.from(event));
        _snapshot = snapshot;
        _isMaterialYouEnabled = snapshot.isMaterialYouEnabled;
        notifyListeners();
      }
    }, onError: (_) {});
  }

  static const String _methodChannelName = 'expressive_theme_bridge/methods';
  static const String _eventChannelName = 'expressive_theme_bridge/events';

  final MethodChannel _methodChannel;
  final EventChannel _eventChannel;
  StreamSubscription<dynamic>? _eventsSubscription;

  ExpressiveThemeSnapshot? _snapshot;
  bool _isMaterialYouEnabled = false;
  bool _isDynamicColorSupported = false;

  @override
  ExpressiveThemeSnapshot? get snapshot => _snapshot;

  @override
  bool get isMaterialYouEnabled => _isMaterialYouEnabled;

  @override
  bool get isDynamicColorSupported => _isDynamicColorSupported;

  Future<void> initialize() async {
    final snapshot = await getCurrentTheme();
    _snapshot = snapshot;
    _isMaterialYouEnabled = snapshot.isMaterialYouEnabled;
    _isDynamicColorSupported = snapshot.isDynamicColorSupported;
    notifyListeners();
  }

  @override
  Future<ExpressiveThemeSnapshot> getCurrentTheme() async {
    final result = await _methodChannel.invokeMapMethod<String, Object?>('getCurrentTheme');
    if (result == null) {
      throw StateError('Native theme snapshot returned null.');
    }
    return ExpressiveThemeSnapshot.fromMap(result);
  }

  @override
  Future<ExpressiveThemeSnapshot> refreshTheme() async {
    final result = await _methodChannel.invokeMapMethod<String, Object?>('refreshTheme');
    if (result == null) {
      throw StateError('Native theme snapshot returned null.');
    }
    final snapshot = ExpressiveThemeSnapshot.fromMap(result);
    _snapshot = snapshot;
    _isMaterialYouEnabled = snapshot.isMaterialYouEnabled;
    _isDynamicColorSupported = snapshot.isDynamicColorSupported;
    notifyListeners();
    return snapshot;
  }

  @override
  Future<void> enableMaterialYou() async {
    await _methodChannel.invokeMethod<void>('enableMaterialYou');
    await refreshTheme();
  }

  @override
  Future<void> disableMaterialYou() async {
    await _methodChannel.invokeMethod<void>('disableMaterialYou');
    await refreshTheme();
  }

  @override
  Future<void> toggleMaterialYou() async {
    await _methodChannel.invokeMethod<void>('toggleMaterialYou');
    await refreshTheme();
  }

  @override
  Future<void> setSeedColor(int argb) async {
    await _methodChannel.invokeMethod<void>('setSeedColor', <String, Object?>{'argb': argb});
    await refreshTheme();
  }

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    super.dispose();
  }
}

ExpressiveThemeBridgePlatform createExpressiveThemeBridgePlatform() {
  return MethodChannelExpressiveThemeBridge();
}
