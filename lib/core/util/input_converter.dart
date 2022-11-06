import 'package:equatable/equatable.dart';
import 'package:fizzbuzz_app/config.dart';
import 'package:fizzbuzz_app/core/entities/app_error.dart';

class InputConverter {
  InputConverterResult stringtoUnsignedInteger(String value) {
    try {
      final integer = int.parse(value);
      if (integer < 0) throw const FormatException();
      return InputConverterResult(value: integer);
    } on FormatException {
      return const InputConverterResult(error: ApplicationError(message: invaliedInputMessage));
    }
  }
}

class InputConverterResult extends Equatable {
  final int? value;
  final ApplicationError? error;

  const InputConverterResult({this.value, this.error});

  @override
  List<Object?> get props => [value, error];
}
