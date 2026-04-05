import 'package:flutter/material.dart';

import 'expressive_theme_controller.dart';
import 'models/expressive_theme_snapshot.dart';

class ExpressiveThemeBuilder extends StatelessWidget {
  const ExpressiveThemeBuilder({
    super.key,
    required this.controller,
    required this.builder,
    this.loadingBuilder,
  });

  final ExpressiveThemeController controller;
  final Widget Function(BuildContext context, ExpressiveThemeSnapshot snapshot) builder;
  final WidgetBuilder? loadingBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final snapshot = controller.snapshot;
        if (snapshot == null) {
          return loadingBuilder?.call(context) ??
              const Material(
                child: Center(child: CircularProgressIndicator()),
              );
        }
        return builder(context, snapshot);
      },
    );
  }
}
