import 'package:adaptix/adaptix.dart';
import 'package:devfest/src/models/asset.dart';
import 'package:devfest/src/services/asset_generator.dart';
import 'package:devfest/src/utils/responsive_constraints/my_adaptive_constraint.dart';
import 'package:devfest/src/widget_components/asset_builder.dart';
import 'package:flutter/cupertino.dart';

class AssetsListWidget extends StatefulWidget {
  final AssetsGenerator generator;

  const AssetsListWidget({
    required this.generator,
    super.key,
  });

  @override
  State<AssetsListWidget> createState() => _AssetsListWidgetState();
}

class _AssetsListWidgetState extends State<AssetsListWidget> {
  late List<AppAssetDTO> _assets = _getListItems();

  @override
  void didUpdateWidget(covariant AssetsListWidget oldWidget) {
    if (oldWidget.generator != widget.generator) {
      setState(() {
        _assets = _getListItems();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final spacing = 10.adaptedPx(context);
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: spacing,
            vertical: spacing,
          ),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => AssetBuilder(
                appAssetDTO: _assets[index],
              ),
              childCount: _assets.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: context.responsiveSwitch(
                MyResponsiveConstraint.createArguments(
                  defaultValue: 2,
                  rules: {
                    MyResponsiveConstraint.tablet: 3,
                    MyResponsiveConstraint.desktop: 5,
                  },
                ),
              ),
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
            ),
          ),
        )
      ],
    );
  }

  List<AppAssetDTO> _getListItems() {
    return [
      ...widget.generator.getAssetItems(),
    ];
  }
}
