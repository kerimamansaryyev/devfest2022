import 'package:devfest/src/services/cities_generator.dart';
import 'package:devfest/src/services/mountains_generator.dart';
import 'package:devfest/src/utils/theme/theme.dart';
import 'package:devfest/src/widget_components/assets_list.dart';
import 'package:devfest/src/widget_components/tabview/tab.dart';
import 'package:devfest/src/widget_components/tabview/tabview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final citiesTab = AppTab(
      text: 'Cities',
      contentBuilder: _citiesContentBuilder,
      iconData: Icons.location_city,
    );

    final mountainsTab = AppTab(
      text: 'Mountains',
      contentBuilder: _mountainsTab,
      iconData: Icons.landscape,
    );

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              top: AppThemes.navbarHeight(context),
            ),
            child: AppTabView(
              tabs: [
                citiesTab,
                mountainsTab,
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _citiesContentBuilder(BuildContext _) => const AssetsListWidget(
        generator: CitiesGenerator(),
      );

  Widget _mountainsTab(BuildContext _) => const AssetsListWidget(
        generator: MountainsGenerator(),
      );
}
