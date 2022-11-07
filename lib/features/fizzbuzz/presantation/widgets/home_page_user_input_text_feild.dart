import 'package:fizzbuzz_app/core/user_input/presantation/cubit/user_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageUserInputTextFeild extends StatelessWidget {
  final String? errorText;
  const HomePageUserInputTextFeild({
    Key? key,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => context.read<UserInputCubit>().limitChanged(value),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'limit',
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
    );
  }
}
