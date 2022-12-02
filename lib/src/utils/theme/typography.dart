import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:adaptix/adaptix.dart';

@immutable
class AppTypography {
  final double baseSize;
  final FontWeight? fontWeight;

  const AppTypography({
    required this.baseSize,
    required this.fontWeight,
  });

  TextStyle style(BuildContext context) => TextStyle(
        fontSize: baseSize.adaptedPx(context),
        fontWeight: fontWeight,
        height: 1.3,
      );

  AppTypography copyWith({
    double? baseSize,
    FontWeight? fontWeight,
  }) {
    return AppTypography(
      baseSize: baseSize ?? this.baseSize,
      fontWeight: fontWeight ?? this.fontWeight,
    );
  }

  static AppTypography? lerp(AppTypography? a, AppTypography? b, double t) {
    if (a is! AppTypography || b is! AppTypography) {
      return null;
    }

    return AppTypography(
      baseSize: lerpDouble(a.baseSize, b.baseSize, t) ?? a.baseSize,
      fontWeight:
          FontWeight.lerp(a.fontWeight, b.fontWeight, t) ?? a.fontWeight,
    );
  }
}

enum AppTypographies implements AppTypography {
  b2(
    typography: AppTypography(
      baseSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),

  actionButton(
    typography: AppTypography(
      baseSize: 13.8,
      fontWeight: FontWeight.w500,
    ),
  ),
  actionButtonBig(
    typography: AppTypography(
      baseSize: 14.8,
      fontWeight: FontWeight.w500,
    ),
  );

  @protected
  final AppTypography typography;

  const AppTypographies({required this.typography});

  @override
  TextStyle style(BuildContext context) => typography.style(context);

  @override
  double get baseSize => typography.baseSize;

  @override
  FontWeight? get fontWeight => typography.fontWeight;

  @override
  AppTypography copyWith({
    double? baseSize,
    FontWeight? fontWeight,
    String? font,
  }) =>
      typography.copyWith(
        baseSize: baseSize,
        fontWeight: fontWeight,
      );
}
