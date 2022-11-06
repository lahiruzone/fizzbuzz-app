import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fizzbuzz_app/core/entities/app_error.dart';
import 'package:fizzbuzz_app/core/util/input_converter.dart';

part 'user_input_state.dart';

class UserInputCubit extends Cubit<UserInputState> {
  final InputConverter inputConverter;
  UserInputCubit({required this.inputConverter}) : super(const UserInputState());

  void limitChanged(String value) {
    final result = inputConverter.stringtoUnsignedInteger(value);
    if (result.error != null) {
      emit(state.copyWith(applicationError: result.error, status: FormStatus.invalied));
    } else {
      emit(state.copyWith(applicationError: null, limit: result.value, status: FormStatus.valied));
    }
  }

  void onTap({required Function onTap}) {
    if (state.status == FormStatus.valied) {
      onTap();
    }
  }
}
