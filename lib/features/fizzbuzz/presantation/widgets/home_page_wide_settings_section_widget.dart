import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_fzzbuzz_limit_display_text_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_wide_settings_section_user_input_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_theme_toggle_button_widget.dart';
import 'package:flutter/material.dart';

class HomePageWideSesstingsSectionWidget extends StatelessWidget {
  const HomePageWideSesstingsSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: ListView(
        children: const [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: HomePageFizzbuzzLimitDisplayTextWidget(),
            ),
          ),
          Divider(),
          HomePageThemeToggleButtonWidget(),
          Divider(),
          HomePageWideSettingsSectionUserInputWidget(),
        ],
      ),
    );
  }
}
