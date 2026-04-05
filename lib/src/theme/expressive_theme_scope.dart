import 'package:flutter/material.dart';

import '../expressive_theme_controller.dart';

class ExpressiveThemeScope extends InheritedNotifier<ExpressiveThemeController> {
  const ExpressiveThemeScope({
    super.key,
    required ExpressiveThemeController controller,
    required super.child,
  }) : super(notifier: controller);

  static ExpressiveThemeController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ExpressiveThemeScope>();
    assert(scope != null, 'ExpressiveThemeScope not found in context.');
    return scope!.notifier!;
  }
}
