import 'package:fizzbuzz_app/core/widgets/loading_indicator_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_failure_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_welcome_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fizzbuzz_app/config.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:fizzbuzz_app/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FizzBuzz'),
      ),
      body: BlocProvider(
        create: (context) => sl<FizzbuzzBloc>()
          ..add(
            const FizzbuzzLoaded(defaultFizzBuzzRange),
          ),
        child: Stack(
          children: [
            BlocBuilder<FizzbuzzBloc, FizzbuzzState>(
              buildWhen: (previous, current) => previous.status != current.status,
              builder: (_, state) {
                if (state.status == FizzbuzzStatus.loading) {
                  return const LoadingIndicatorWidget();
                } else if (state.status == FizzbuzzStatus.failure) {
                  return HomePageErrorWidget(message: state.fizzbuzzRepositoryResult!.error!.message);
                } else if (state.status == FizzbuzzStatus.success) {
                  return ListView.builder(
                      itemCount: state.fizzbuzzRepositoryResult!.fizzbuzzList!.length,
                      itemBuilder: ((context, index) => Card(
                            child: ListTile(
                              title: Text(state.fizzbuzzRepositoryResult!.fizzbuzzList![index].text),
                            ),
                          )));
                } else {
                  return const HomePageWelcomeWidget();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}