import 'package:flutter/material.dart';

@immutable
class AppSpacing {
  const AppSpacing._();
  static const none = 0.0;
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
}

@immutable
class AppRadius {
  const AppRadius._();
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
}

@immutable
class AppInsets {
  const AppInsets._();
  static const page = EdgeInsets.symmetric(horizontal: AppSpacing.lg);
  static const section = EdgeInsets.all(AppSpacing.md);
}

/// 便利ショートカット
extension Gap on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}
