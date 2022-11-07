import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: ThemeData.light()));

  void toggleTheme() {
    if (state.state == ThemeStatus.light) {
      emit(state.copyWith(state: ThemeStatus.dark, themeData: ThemeData.dark()));
    } else {
      emit(state.copyWith(state: ThemeStatus.light, themeData: ThemeData.light()));
    }
  }
}
