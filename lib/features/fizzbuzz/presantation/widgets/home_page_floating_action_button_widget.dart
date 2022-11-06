import 'package:fizzbuzz_app/core/user_input/presantation/cubit/user_input_cubit.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:fizzbuzz_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageFloatingActionButtonWidget extends StatelessWidget {
  const HomePageFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FizzbuzzBloc, FizzbuzzState>(
      builder: (context, state) {
        return FloatingActionButton.extended(
          onPressed: () => _showButtomSheet(context),
          label: const Text('Limit'),
          icon: const Icon(Icons.edit),
        );
      },
    );
  }

  _showButtomSheet(BuildContext fizzbuzzContext) {
    showModalBottomSheet(
      context: fizzbuzzContext,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      builder: (_) {
        return Padding(
          padding: MediaQuery.of(fizzbuzzContext).viewInsets,
          child: BlocProvider(
            create: (context) => sl<UserInputCubit>(),
            child: BlocBuilder<UserInputCubit, UserInputState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        onChanged: (value) => context.read<UserInputCubit>().limitChanged(value),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'limit',
                          errorText: (state.status == FormStatus.invalied) ? state.applicationError!.message : null,
                        ),
                      ),
                      if (state.status == FormStatus.valied)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ElevatedButton(
                              onPressed: () => context.read<UserInputCubit>().onTap(onTap: () {
                                    Navigator.pop(context);
                                    fizzbuzzContext.read<FizzbuzzBloc>().add(FizzbuzzLimitChanged(state.limit!));
                                  }),
                              child: const Text('GENARATE')),
                        ),
                    ],
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
