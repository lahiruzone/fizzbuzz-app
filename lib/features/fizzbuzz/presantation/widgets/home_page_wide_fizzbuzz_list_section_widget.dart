import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_body_widget.dart';
import 'package:flutter/material.dart';

class HomePageWideFizzbuzzListSectionWidget extends StatelessWidget {
  const HomePageWideFizzbuzzListSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      flex: 2,
      fit: FlexFit.loose,
      child: HomePageBodyWidget(),
    );
  }
}
