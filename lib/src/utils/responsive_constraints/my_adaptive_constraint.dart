import 'package:adaptix/adaptix.dart';
import 'package:devfest/src/utils/responsive_constraints/device_template.dart';

enum MyResponsiveConstraint implements DeviceTemplate {
  phone(
    breakpoint: ResponsiveBreakpoint(
      templateDeviceWidth: 414,
      key: 'phone',
    ),
    pixelScale: 1,
  ),
  tablet(
    breakpoint: ResponsiveBreakpoint(
      templateDeviceWidth: 680,
      key: 'tablet',
    ),
    pixelScale: 1.1,
  ),
  desktop(
    breakpoint: ResponsiveBreakpoint(
      templateDeviceWidth: 1020,
      key: 'desktop',
    ),
    pixelScale: 1.15,
  ),
  ;

  @override
  final ResponsiveBreakpoint breakpoint;
  @override
  final double pixelScale;

  const MyResponsiveConstraint({
    required this.breakpoint,
    required this.pixelScale,
  });

  static List<ResponsiveBreakpoint> get breakpoints => values
      .map<ResponsiveBreakpoint>(
        (element) => element.breakpoint,
      )
      .toList();

  static GenericResponsiveSwitchArgs<T> createArguments<T>({
    required T defaultValue,
    Map<MyResponsiveConstraint, T> rules = const {},
  }) =>
      GenericResponsiveSwitchArgs(
        defaultValue: defaultValue,
        rules: {
          for (final constraint in rules.keys)
            constraint.breakpoint.key: rules[constraint] as T,
        },
      );

  static Map<String, double> get pixelScaleRules => {
        for (final value in values) value.breakpoint.key: value.pixelScale,
      };
}
