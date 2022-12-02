import 'package:devfest/src/utils/routes.dart';
import 'package:flutter/cupertino.dart';

class AppNavigationWrapper {
  const AppNavigationWrapper();

  void push(BuildContext context, AppNavigationRoute route) =>
      Navigator.of(context).push(route.resolvePageRoute());

  void pop(BuildContext context) => Navigator.of(context).pop();
}
