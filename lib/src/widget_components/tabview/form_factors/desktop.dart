import 'package:adaptix/adaptix.dart';
import 'package:devfest/src/widget_components/tabview/tab.dart';
import 'package:flutter/cupertino.dart';

class DesktopTabBuilder extends StatelessWidget {
  final ValueNotifier<int> selectedTabIndexNotifier;
  final SelectTabIndexCallback selectTabIndexCallback;
  final EdgeInsets bottomBarPadding;
  final Widget pageView;
  final List<AppTab> tabs;

  const DesktopTabBuilder({
    required this.tabs,
    required this.selectedTabIndexNotifier,
    required this.pageView,
    required this.selectTabIndexCallback,
    this.bottomBarPadding = EdgeInsets.zero,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final leftInset = MediaQuery.of(context).padding.right;

    return Row(
      children: [
        SizedBox(
          width: leftInset,
        ),
        Container(
          width: 145.adaptedPx(context),
          color: CupertinoTheme.of(context).barBackgroundColor,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 10.adaptedPx(context),
              vertical: 12.adaptedPx(context),
            ),
            children: [
              for (final tab in tabs)
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10.adaptedPx(context),
                  ),
                  child: CupertinoButton(
                    onPressed: () => _onTabTapped(tab),
                    padding: EdgeInsets.zero,
                    child: ValueListenableBuilder<int>(
                      valueListenable: selectedTabIndexNotifier,
                      builder: (context, index, __) => Row(
                        children: [
                          Icon(
                            tab.iconData,
                            color: tab == tabs[index]
                                ? CupertinoColors.activeBlue
                                : CupertinoColors.inactiveGray,
                          ),
                          SizedBox(
                            width: 12.adaptedPx(context),
                          ),
                          Expanded(
                            child: Text(
                              tab.text,
                              style: TextStyle(
                                color: tab == tabs[index]
                                    ? CupertinoColors.activeBlue
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
          ),
        ),
        Expanded(
          child: pageView,
        ),
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
