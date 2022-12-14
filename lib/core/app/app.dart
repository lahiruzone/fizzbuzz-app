import 'package:fizzbuzz_app/config.dart';
import 'package:fizzbuzz_app/core/app/theme/prasantation/cubit/theme_cubit.dart';
import 'package:fizzbuzz_app/core/widgets/responsive_wrapper_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/pages/home_page.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/pages/home_page_wide.dart';
import 'package:fizzbuzz_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'FizzBuzz App',
          theme: state.themeData,
          home: BlocProvider(
            create: (context) => sl<FizzbuzzBloc>()
              ..add(
                const FizzbuzzLoaded(defaultFizzBuzzRange),
              ),
            child: const ResponsiveWrapperWidget(mobileLayout: HomePage(), wideLayout: HomePageWide()),
          ),
          // home: const HomePageWideLayout(),
        );
      },
    );
  }
}
