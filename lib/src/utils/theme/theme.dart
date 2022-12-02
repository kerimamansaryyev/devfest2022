import 'package:adaptix/adaptix.dart';
import 'package:devfest/src/utils/theme/typography.dart';
import 'package:flutter/cupertino.dart';

typedef CupertinoThemeDataResolver = CupertinoThemeData Function(
  BuildContext,
);

enum AppThemes {
  light(_lightCupertinoThemeDataResolver);

  const AppThemes(
    this.resolver,
  );

  static const fallback = AppThemes.light;
  static const _defaultCupertinoTheme = CupertinoThemeData();

  @protected
  final CupertinoThemeDataResolver resolver;

  CupertinoThemeData resolve(BuildContext context) => resolver(context);

  static CupertinoThemeData _lightCupertinoThemeDataResolver(
    BuildContext context,
  ) =>
      _defaultCupertinoTheme.copyWith(
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(
          textStyle: _defaultCupertinoTheme.textTheme.textStyle.copyWith(
            fontSize: AppTypographies.b2.style(context).fontSize,
          ),
        ),
      );

  static double bodyHorizontalPadding(BuildContext context) =>
      10.adaptedPx(context);

  static double navbarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double bottomInset(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  static double bottomPadding(BuildContext context) =>
      bottomInset(context) + 10.adaptedPx(context);
}
