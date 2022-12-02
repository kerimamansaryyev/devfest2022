import 'package:devfest/src/screens/home/home.dart';
import 'package:flutter/cupertino.dart';

typedef PageRouteResolver = PageRoute Function();

abstract class AppNavigationRoute {
  PageRoute resolvePageRoute();
}

abstract class _RouteBuilders {
  static CupertinoPageRoute _homeRouteBuilder() => CupertinoPageRoute(
        builder: (context) => const HomeScreen(),
      );
}

enum AppNavigationRoutes implements AppNavigationRoute {
  home(
    pageRouteResolver: _RouteBuilders._homeRouteBuilder,
  );

  static const entryWidget = HomeScreen();

  @protected
  final PageRouteResolver pageRouteResolver;

  const AppNavigationRoutes({
    required this.pageRouteResolver,
  });

  @override
  PageRoute resolvePageRoute() => pageRouteResolver();
}
