import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fizzbuzz_app/core/user_input/presantation/cubit/user_input_cubit.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_user_input_text_feild.dart';
import 'package:fizzbuzz_app/injection_container.dart';

class HomePageChangeLimitFloatingActionButtonWidget extends StatelessWidget {
  const HomePageChangeLimitFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FizzbuzzBloc, FizzbuzzState>(
      builder: (context, state) {
        return FloatingActionButton.extended(
          onPressed: () => _showButtomSheet(context),
          label: const Text('Change Limit'),
          icon: const Icon(Icons.edit),
        );
      },
    );
  }

  _showButtomSheet(BuildContext fizzbuzzContext) {
    showDialog(
      context: fizzbuzzContext,
      builder: (_) {
        return AlertDialog(
          title: const Text('Enter a limit'),
          content: BlocProvider(
            create: (context) => sl<UserInputCubit>(),
            child: BlocBuilder<UserInputCubit, UserInputState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HomePageUserInputTextFeild(
                          errorText: (state.status == FormStatus.invalied) ? state.applicationError!.message : null,
                        ),
                        Visibility(
                          visible: state.status == FormStatus.valied,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () => context.read<UserInputCubit>().onTap(onTap: () {
                                      Navigator.pop(context);
                                      fizzbuzzContext.read<FizzbuzzBloc>().add(FizzbuzzLimitChanged(state.limit!));
                                    }),
                                child: const Text('GENARATE')),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
