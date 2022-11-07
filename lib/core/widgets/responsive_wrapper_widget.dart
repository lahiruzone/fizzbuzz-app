import 'package:fizzbuzz_app/config.dart';
import 'package:flutter/material.dart';

class ResponsiveWrapperWidget extends StatelessWidget {
  final Widget mobileLayout;
  final Widget wideLayout;
  const ResponsiveWrapperWidget({
    Key? key,
    required this.mobileLayout,
    required this.wideLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constrains) {
      if (constrains.maxWidth < responsiveMobileBreakPoint) {
        return mobileLayout;
      } else {
        return wideLayout;
      }
    }));
  }
}
