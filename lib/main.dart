import 'package:fizzbuzz_app/core/app/app.dart';
import 'package:fizzbuzz_app/core/app/theme/prasantation/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fizzbuzz_app/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const MyApp(),
  ));
}
