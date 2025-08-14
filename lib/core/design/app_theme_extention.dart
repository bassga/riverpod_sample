import 'package:flutter/material.dart';

class AppSpacingTheme extends ThemeExtension<AppSpacingTheme> {
  const AppSpacingTheme({
    required this.page,
    required this.section,
    required this.inside,
  });
  final double page;
  final double section;
  final double inside;

  @override
  AppSpacingTheme copyWith({double? page, double? section, double? inside}) {
    return AppSpacingTheme(
      page: page ?? this.page,
      section: section ?? this.section,
      inside: inside ?? this.inside,
    );
  }

  @override
  AppSpacingTheme lerp(ThemeExtension<AppSpacingTheme>? other, double t) =>
      this;
}

extension SpacingX on BuildContext {
  AppSpacingTheme get space => Theme.of(this).extension<AppSpacingTheme>()!;
}
