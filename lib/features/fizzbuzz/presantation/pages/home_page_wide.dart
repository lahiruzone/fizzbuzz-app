import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_wide_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fizzbuzz_app/config.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:fizzbuzz_app/injection_container.dart';

class HomePageWide extends StatelessWidget {
  const HomePageWide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FizzbuzzBloc>()
        ..add(
          const FizzbuzzLoaded(defaultFizzBuzzRange),
        ),
      child: const Scaffold(
        body: HomePageWideBodyWidget(),
      ),
    );
  }
}
