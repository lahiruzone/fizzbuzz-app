import 'package:bloc_test/bloc_test.dart';
import 'package:fizzbuzz_app/config.dart';
import 'package:fizzbuzz_app/core/entities/app_error.dart';
import 'package:fizzbuzz_app/core/user_input/presantation/cubit/user_input_cubit.dart';
import 'package:fizzbuzz_app/core/util/input_converter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  late MockInputConverter mockInputConverter;
  late UserInputCubit userInputCubit;

  setUp(() {
    mockInputConverter = MockInputConverter();
    userInputCubit = UserInputCubit(inputConverter: mockInputConverter);
  });

  group('userInputCubit', () {
    test('the initial value of userInputCubit should be UserInputState(status: FormStatus.pure)', () {
      expect(userInputCubit.state, const UserInputState(status: FormStatus.pure));
    });

    blocTest('emits [valied] for valied input',
        build: () {
          when(() => mockInputConverter.stringtoUnsignedInteger('123'))
              .thenAnswer((invocation) => const InputConverterResult(value: 123));
          return userInputCubit;
        },
        act: (cubit) => cubit.limitChanged('123'),
        expect: () => [const UserInputState(status: FormStatus.valied, limit: 123)]);

    blocTest('emits [invalied] for invalied input',
        build: () {
          when(() => mockInputConverter.stringtoUnsignedInteger('ABC')).thenAnswer(
              (invocation) => const InputConverterResult(error: ApplicationError(message: invaliedInpuMessage)));
          return userInputCubit;
        },
        act: (cubit) => cubit.limitChanged('ABC'),
        expect: () => [
              const UserInputState(
                  status: FormStatus.invalied, applicationError: ApplicationError(message: invaliedInpuMessage))
            ]);
  });
}
