import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_wide_fizzbuzz_list_section_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_wide_settings_section_widget.dart';
import 'package:flutter/material.dart';

class HomePageWideBodyWidget extends StatelessWidget {
  const HomePageWideBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: const [
          HomePageWideSesstingsSectionWidget(),
          HomePageWideFizzbuzzListSectionWidget(),
        ],
      ),
    );
  }
}
