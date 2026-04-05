import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'expressive_theme_bridge_platform_interface.dart';
import 'expressive_theme_method_channel.dart';
import 'models/expressive_theme_snapshot.dart';

class ExpressiveThemeController extends ChangeNotifier {
  ExpressiveThemeController({ExpressiveThemeBridgePlatform? platform})
      : _platform = platform ?? createExpressiveThemeBridgePlatform() {
    _platform.addListener(_handleNativeUpdate);
  }

  final ExpressiveThemeBridgePlatform _platform;
  ExpressiveThemeSnapshot? _snapshot;
  bool _initialized = false;

  ExpressiveThemeSnapshot? get snapshot => _snapshot;
  bool get isMaterialYouEnabled => _platform.isMaterialYouEnabled;
  bool get isDynamicColorSupported => _platform.isDynamicColorSupported;
  bool get initialized => _initialized;

  Future<void> initialize() async {
    _snapshot = await _platform.getCurrentTheme();
    _initialized = true;
    notifyListeners();
  }

  Future<void> refreshTheme() async {
    _snapshot = await _platform.refreshTheme();
    _initialized = true;
    notifyListeners();
  }

  Future<void> enableMaterialYou() async {
    await _platform.enableMaterialYou();
    _snapshot = await _platform.refreshTheme();
    notifyListeners();
  }

  Future<void> disableMaterialYou() async {
    await _platform.disableMaterialYou();
    _snapshot = await _platform.refreshTheme();
    notifyListeners();
  }

  Future<void> toggleMaterialYou() async {
    await _platform.toggleMaterialYou();
    _snapshot = await _platform.refreshTheme();
    notifyListeners();
  }

  Future<void> setSeedColor(Color color) async {
    await _platform.setSeedColor(color.value);
    _snapshot = await _platform.refreshTheme();
    notifyListeners();
  }

  ExpressiveThemeSnapshot? getCurrentTheme() => _snapshot;

  void _handleNativeUpdate() {
    _snapshot = _platform.snapshot ?? _snapshot;
    _initialized = true;
    notifyListeners();
  }

  @override
  void dispose() {
    _platform.removeListener(_handleNativeUpdate);
    super.dispose();
  }
}
