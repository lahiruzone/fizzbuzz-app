import 'package:fizzbuzz_app/core/user_input/presantation/cubit/user_input_cubit.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_genarate_button_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/widgets/home_page_user_input_text_feild.dart';
import 'package:fizzbuzz_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWideSettingsSectionUserInputWidget extends StatelessWidget {
  const HomePageWideSettingsSectionUserInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserInputCubit>(),
      child: BlocBuilder<UserInputCubit, UserInputState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HomePageUserInputTextFeild(
                  errorText: (state.status == FormStatus.invalied) ? state.applicationError!.message : null,
                ),
                HomePageGenarateButton(
                  visibility: state.status == FormStatus.valied,
                  onPressed: () => context
                      .read<UserInputCubit>()
                      .onTap(onTap: () => context.read<FizzbuzzBloc>().add(FizzbuzzLimitChanged(state.limit!))),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
