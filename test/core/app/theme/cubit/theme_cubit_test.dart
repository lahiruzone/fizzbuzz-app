import 'package:bloc_test/bloc_test.dart';
import 'package:fizzbuzz_app/core/app/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('themeCubit', () {
    late ThemeCubit themeCubit;

    setUp(() {
      themeCubit = ThemeCubit();
    });

    test('the initial value of themeCubit should be ThemeState(state: ThemeStatus.light, themeData: ThemeData.light())',
        () {
      expect(themeCubit.state, ThemeState(state: ThemeStatus.light, themeData: ThemeData.light()));
    });

    blocTest('should change the theme state',
        build: () {
          return themeCubit;
        },
        seed: () => ThemeState(state: ThemeStatus.light, themeData: ThemeData.light()),
        act: (cubit) => themeCubit.toggleTheme(),
        expect: () => [ThemeState(state: ThemeStatus.dark, themeData: ThemeData.dark())]);
  });
}
