import 'package:adaptix/adaptix.dart';
import 'package:devfest/src/utils/theme/theme.dart';
import 'package:devfest/src/widget_components/tabview/tab.dart';
import 'package:flutter/cupertino.dart';

const Color _kDefaultNavBarBorderColor = Color(0x4D000000);

const Border _kDefaultNavBarBorder = Border(
  top: BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0,
  ),
);

class PhoneTabViewBuilder extends StatelessWidget {
  final ValueNotifier<int> selectedTabIndexNotifier;
  final SelectTabIndexCallback selectTabIndexCallback;
  final EdgeInsets bottomBarPadding;
  final Widget pageView;
  final List<AppTab> tabs;

  const PhoneTabViewBuilder({
    required this.tabs,
    required this.selectedTabIndexNotifier,
    required this.pageView,
    required this.selectTabIndexCallback,
    this.bottomBarPadding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomTaBarHeight = 60.adaptedPx(context);

    return Column(
      children: [
        Expanded(
          child: pageView,
        ),
        Container(
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).barBackgroundColor,
            border: _kDefaultNavBarBorder,
          ),
          height: bottomTaBarHeight + AppThemes.bottomInset(context),
          padding: bottomBarPadding.copyWith(
            bottom: AppThemes.bottomInset(context),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: bottomTaBarHeight * 0.2,
            ),
            child: ValueListenableBuilder<int>(
              valueListenable: selectedTabIndexNotifier,
              builder: (context, index, __) => Row(
                children: [
                  for (final tab in tabs)
                    Expanded(
                      child: CupertinoButton(
                        onPressed: () => _onTabTapped(tab),
                        padding: EdgeInsets.zero,
                        child: Icon(
                          tab.iconData,
                          size: bottomTaBarHeight * 0.5,
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
