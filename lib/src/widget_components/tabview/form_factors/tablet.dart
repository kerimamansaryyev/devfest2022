import 'package:adaptix/adaptix.dart';
import 'package:devfest/src/widget_components/tabview/tab.dart';
import 'package:flutter/cupertino.dart';

const Color _kDefaultNavBarBorderColor = Color(0x4D000000);

const Border _kDefaultNavBarBorder = Border(
  left: BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0,
  ),
);

class TabletTabViewBuilder extends StatelessWidget {
  final ValueNotifier<int> selectedTabIndexNotifier;
  final SelectTabIndexCallback selectTabIndexCallback;
  final EdgeInsets bottomBarPadding;
  final Widget pageView;
  final List<AppTab> tabs;

  const TabletTabViewBuilder({
    required this.tabs,
    required this.selectedTabIndexNotifier,
    required this.pageView,
    required this.selectTabIndexCallback,
    this.bottomBarPadding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tabBarWidth = 60.adaptedPx(context);
    final rightInset = MediaQuery.of(context).padding.right;

    return Row(
      children: [
        Expanded(
          child: pageView,
        ),
        Container(
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).barBackgroundColor,
            border: _kDefaultNavBarBorder,
          ),
          width: tabBarWidth + rightInset,
          padding: bottomBarPadding.copyWith(
            right: rightInset,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: tabBarWidth * 0.2,
            ),
            child: ValueListenableBuilder<int>(
              valueListenable: selectedTabIndexNotifier,
              builder: (context, index, __) => Column(
                children: [
                  for (final tab in tabs)
                    Expanded(
                      child: CupertinoButton(
                        onPressed: () => _onTabTapped(tab),
                        padding: EdgeInsets.zero,
                        child: Icon(
                          tab.iconData,
                          size: tabBarWidth * 0.5,
                          color: tab == tabs[index]
                              ? CupertinoColors.systemBlue
                              : CupertinoColors.inactiveGray,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onTabTapped(AppTab newSelectedTab) {
    final newIndex = tabs.indexOf(newSelectedTab);
    if (newIndex != -1) {
      selectTabIndexCallback(
        newIndex,
      );
    }
  }
}
