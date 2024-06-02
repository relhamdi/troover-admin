import 'package:flutter/material.dart';

class WidgetUtils {
  static Widget getColoredBackground(BuildContext context, Widget child) {
    var colorScheme = Theme.of(context).colorScheme;

    return ColoredBox(
      color: colorScheme.background,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: child,
      ),
    );
  }
}
