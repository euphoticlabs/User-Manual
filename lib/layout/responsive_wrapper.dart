import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveBreakPointWrapper extends StatelessWidget {
  final Widget child;
  const ResponsiveBreakPointWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: ResponsiveViewWrapper(child: child),
      breakpoints: [
        const Breakpoint(start: 0, end: 600, name: MOBILE),
        const Breakpoint(start: 601, end: 1024, name: TABLET),
        const Breakpoint(start: 1025, end: 1440, name: DESKTOP),
        const Breakpoint(start: 1441, end: double.infinity, name: '4K'),
      ],
    );
  }
}

class ResponsiveViewWrapper extends StatelessWidget {
  final Widget child;
  const ResponsiveViewWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaxWidthBox(
      maxWidth: 3840,
      child: ResponsiveScaledBox(
        width: ResponsiveValue<double>(context, conditionalValues: [
          Condition.equals(name: MOBILE, value: 600),
          Condition.equals(name: TABLET, value: 960),
          Condition.equals(name: DESKTOP, value: 1200),
          Condition.equals(name: '4K', value: 1440),
        ], defaultValue: 600).value,
        child: BouncingScrollWrapper.builder(
          context,
          child,
          dragWithMouse: true,
        ),
      ),
    );
  }
}
