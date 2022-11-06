import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageFizzbuzzLimitDisplayTextWidget extends StatelessWidget {
  const HomePageFizzbuzzLimitDisplayTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FizzbuzzBloc, FizzbuzzState>(
      builder: (context, state) {
        return Text('FizzBuzz (Limit: ${state.limit})');
      },
    );
  }
}
