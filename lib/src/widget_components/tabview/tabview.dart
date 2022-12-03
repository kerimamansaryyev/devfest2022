import 'package:adaptix/adaptix.dart';
import 'package:devfest/src/utils/responsive_constraints/my_adaptive_constraint.dart';
import 'package:devfest/src/widget_components/tabview/form_factors/desktop.dart';
import 'package:devfest/src/widget_components/tabview/form_factors/phone.dart';
import 'package:devfest/src/widget_components/tabview/form_factors/tablet.dart';
import 'package:devfest/src/widget_components/tabview/tab.dart';
import 'package:flutter/cupertino.dart';

class AppTabView extends StatefulWidget {
  final List<AppTab> tabs;

  AppTabView({
    required this.tabs,
    super.key,
  }) : assert(tabs.isNotEmpty);

  @override
  State<AppTabView> createState() => _AppTabViewState();
}

class _AppTabViewState extends State<AppTabView> {
  final PageController _pageController = PageController();
  final GlobalKey _pageViewKey = GlobalKey();
  late final ValueNotifier<int> _selectedTabIndexNotifier = ValueNotifier(
    0,
  );

  @override
  Widget build(BuildContext context) {
    return context.responsiveSwitch<Widget>(
      MyResponsiveConstraint.createArguments(
        defaultValue: PhoneTabViewBuilder(
          tabs: widget.tabs,
          selectedTabIndexNotifier: _selectedTabIndexNotifier,
          pageView: _buildPageView(),
          selectTabIndexCallback: _selectTabIndex,
        ),
        rules: {
          MyResponsiveConstraint.tablet: TabletTabViewBuilder(
            tabs: widget.tabs,
            selectedTabIndexNotifier: _selectedTabIndexNotifier,
            pageView: _buildPageView(),
            selectTabIndexCallback: _selectTabIndex,
          ),
          MyResponsiveConstraint.desktop: DesktopTabBuilder(
            tabs: widget.tabs,
            selectedTabIndexNotifier: _selectedTabIndexNotifier,
            pageView: _buildPageView(),
            selectTabIndexCallback: _selectTabIndex,
          )
        },
      ),
    );
  }

  Widget _buildPageView() => PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        key: _pageViewKey,
        itemCount: widget.tabs.length,
        itemBuilder: (context, index) =>
            widget.tabs[index].contentBuilder(context),
      );

  void _onPageChanged(int index) {
    _selectedTabIndexNotifier.value = index;
  }

  void _selectTabIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }
}
