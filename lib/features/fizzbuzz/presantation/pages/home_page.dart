import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fizzbuzz_app/config.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_floating_action_button_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_fzzbuzz_limit_display_text_widget.dart';
import 'package:fizzbuzz_app/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FizzbuzzBloc>()
        ..add(
          const FizzbuzzLoaded(defaultFizzBuzzRange),
        ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const HomePageFizzbuzzLimitDisplayTextWidget(),
        ),
        floatingActionButton: const HomePageFloatingActionButtonWidget(),
        body: const HomePageBodyWidget(),
      ),
    );
  }
}
