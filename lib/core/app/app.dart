import 'package:fizzbuzz_app/core/app/theme/prasantation/cubit/theme_cubit.dart';
import 'package:fizzbuzz_app/core/widgets/responsive_wrapper_widget.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/pages/home_page.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/pages/home_page_wide.dart';
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
          home: const ResponsiveWrapperWidget(mobileLayout: HomePage(), wideLayout: HomePageWide()),
          // home: const HomePageWideLayout(),
        );
      },
    );
  }
}
