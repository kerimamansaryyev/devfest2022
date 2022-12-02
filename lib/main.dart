import 'package:adaptix/adaptix.dart';
import 'package:devfest/src/utils/routes.dart';
import 'package:devfest/src/utils/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const DevfestApp());
}

class DevfestApp extends StatefulWidget {
  const DevfestApp({Key? key}) : super(key: key);

  @override
  State<DevfestApp> createState() => _StockTestState();
}

class _StockTestState extends State<DevfestApp> {
  @override
  Widget build(BuildContext context) {
    return AdaptixInitializer(
      configs: const AdaptixConfigs.canonical(),
      builder: (context) => CupertinoApp(
        theme: AppThemes.light.resolve(context),
        locale: const Locale('en'),
        supportedLocales: const [
          Locale('en'),
        ],
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: AppNavigationRoutes.entryWidget,
      ),
    );
  }
}
