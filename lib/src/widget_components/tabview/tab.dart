import 'package:flutter/cupertino.dart';

typedef SelectTabIndexCallback = void Function(int index);

@immutable
class AppTab {
  final String text;
  final IconData iconData;
  final WidgetBuilder contentBuilder;

  const AppTab({
    required this.text,
    required this.contentBuilder,
    required this.iconData,
  });
}
