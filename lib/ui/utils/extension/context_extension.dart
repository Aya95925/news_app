import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Color get secondaryTheme => Theme.of(this).colorScheme.secondary;
  Color get primaryTheme => Theme.of(this).primaryColor;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
