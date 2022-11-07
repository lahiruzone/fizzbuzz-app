import 'package:fizzbuzz_app/core/app/theme/prasantation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageThemeToggleButtonWidget extends StatelessWidget {
  const HomePageThemeToggleButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Switch(value: state.darkMode, onChanged: (val) => context.read<ThemeCubit>().toggleTheme()),
            Icon(state.darkMode ? Icons.nightlight_round : Icons.sunny),
          ],
        );
      },
    );
  }
}
