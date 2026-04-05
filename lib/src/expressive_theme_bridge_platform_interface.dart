import 'package:flutter/foundation.dart';

import 'models/expressive_theme_snapshot.dart';

abstract class ExpressiveThemeBridgePlatform extends ChangeNotifier {
  static ExpressiveThemeBridgePlatform instance = _NoopExpressiveThemeBridgePlatform();

  Future<ExpressiveThemeSnapshot> getCurrentTheme();
  Future<ExpressiveThemeSnapshot> refreshTheme();
  Future<void> enableMaterialYou();
  Future<void> disableMaterialYou();
  Future<void> toggleMaterialYou();
  Future<void> setSeedColor(int argb);
  bool get isMaterialYouEnabled;
  bool get isDynamicColorSupported;
  ExpressiveThemeSnapshot? get snapshot;
}

class _NoopExpressiveThemeBridgePlatform extends ExpressiveThemeBridgePlatform {
  ExpressiveThemeSnapshot? _snapshot;

  @override
  ExpressiveThemeSnapshot? get snapshot => _snapshot;

  @override
  bool get isDynamicColorSupported => false;

  @override
  bool get isMaterialYouEnabled => false;

  @override
  Future<void> disableMaterialYou() async {}

  @override
  Future<void> enableMaterialYou() async {}

  @override
  Future<ExpressiveThemeSnapshot> getCurrentTheme() async {
    throw UnimplementedError('expressive_theme_bridge is not installed on this platform.');
  }

  @override
  Future<ExpressiveThemeSnapshot> refreshTheme() async {
    throw UnimplementedError('expressive_theme_bridge is not installed on this platform.');
  }

  @override
  Future<void> setSeedColor(int argb) async {}

  @override
  Future<void> toggleMaterialYou() async {}
}
