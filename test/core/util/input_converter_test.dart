import 'package:fizzbuzz_app/core/entities/app_error.dart';
import 'package:fizzbuzz_app/core/util/input_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('InputConverter', () {
    test('should return an integer when the string represents unsigned integer', () {
      //arrange
      InputConverterResult fizzbuzz = const InputConverterResult(value: 123);
      //act
      final result = inputConverter.stringtoUnsignedInteger('123');
      //assert
      expect(result, fizzbuzz);
    });

    test('should return an error when the string is not a integer', () {
      //arrange
      InputConverterResult fizzbuzz = const InputConverterResult(error: ApplicationError(message: 'Invalied input'));
      //act
      final result = inputConverter.stringtoUnsignedInteger('ABC');
      //assert
      expect(result, fizzbuzz);
    });

    test('should return an error when the string is a negetive integer', () {
      //arrange
      InputConverterResult fizzbuzz = const InputConverterResult(error: ApplicationError(message: 'Invalied input'));
      //act
      final result = inputConverter.stringtoUnsignedInteger('-123');
      //assert
      expect(result, fizzbuzz);
    });
  });
}
