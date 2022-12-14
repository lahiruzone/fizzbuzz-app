import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_body_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_theme_toggle_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fizzbuzz_app/config.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_change_limit_floating_action_button_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_fzzbuzz_limit_display_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const HomePageFizzbuzzLimitDisplayTextWidget(),
        actions: const [HomePageThemeToggleButtonWidget()],
      ),
      floatingActionButton: const HomePageChangeLimitFloatingActionButtonWidget(),
      body: const HomePageBodyWidget(),
    );
  }
}
