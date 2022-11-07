import 'package:fizzbuzz_app/core/widgets/loading_indicator_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_failure_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_loaded_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBodyWidget extends StatelessWidget {
  const HomePageBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FizzbuzzBloc, FizzbuzzState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == FizzbuzzStatus.loading) {
          return const LoadingIndicatorWidget();
        } else if (state.status == FizzbuzzStatus.failure) {
          return HomePageErrorWidget(message: state.fizzbuzzRepositoryResult!.error!.message);
        } else if (state.status == FizzbuzzStatus.success) {
          return HomePageLoadedWidget(
            fizzbuzzList: state.fizzbuzzRepositoryResult!.fizzbuzzList!,
          );
        } else {
          return const HomePageWelcomeWidget();
        }
      },
    );
  }
}
