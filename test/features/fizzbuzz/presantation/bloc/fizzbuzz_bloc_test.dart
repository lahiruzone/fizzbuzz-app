import 'package:bloc_test/bloc_test.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/usecases/get_fizzbuzz_list.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetFizzBuzzList extends Mock implements GetFizzBuzzList {}

void main() {
  const tLimit = 6;
  List<Fizzbuzz> tFizzbuzzList = const [
    Fizzbuzz(index: 0, value: 1, text: '1'),
    Fizzbuzz(index: 1, value: 2, text: '2'),
    Fizzbuzz(index: 2, value: 3, text: 'Fizz'),
    Fizzbuzz(index: 3, value: 4, text: '4'),
    Fizzbuzz(index: 4, value: 5, text: 'Buzz'),
    Fizzbuzz(index: 5, value: 6, text: '7')
  ];
  final tFizzbuzzRepositoryResult = FizzbuzzRepositoryResult(fizzbuzzList: tFizzbuzzList);

  const tChangedLimit = 2;
  List<Fizzbuzz> tChangedFizzbuzzList = const [
    Fizzbuzz(index: 0, value: 1, text: '1'),
    Fizzbuzz(index: 1, value: 2, text: '2'),
  ];
  final tChangedFizzbuzzRepositoryResult = FizzbuzzRepositoryResult(fizzbuzzList: tChangedFizzbuzzList);

  group('fizzbuzzBloc', () {
    late MockGetFizzBuzzList mockGetFizzBuzzList;
    late FizzbuzzBloc fizzbuzzBloc;

    setUp(() {
      mockGetFizzBuzzList = MockGetFizzBuzzList();
      fizzbuzzBloc = FizzbuzzBloc(getFizzBuzzList: mockGetFizzBuzzList);
    });

    tearDown(() {
      fizzbuzzBloc.close();
    });

    test('the initial value of fizzbuzzbloc should be FizzbuzzState(status: FizzbuzzStatus.initial, limit: 0)', () {
      expect(fizzbuzzBloc.state, const FizzbuzzState(status: FizzbuzzStatus.initial, limit: 0));
    });
    blocTest('emits [loading, success] when scuccessful',
        build: () {
          when(() => mockGetFizzBuzzList.execute(tLimit)).thenAnswer((_) async => tFizzbuzzRepositoryResult);
          return fizzbuzzBloc;
        },
        act: (bloc) => bloc.add(const FizzbuzzLoaded(tLimit)),
        expect: () => [
              const FizzbuzzState(status: FizzbuzzStatus.loading, limit: tLimit),
              FizzbuzzState(
                status: FizzbuzzStatus.success,
                limit: tLimit,
                fizzbuzzRepositoryResult: tFizzbuzzRepositoryResult,
              )
            ]);

    blocTest('emits [loading, success] when fizzbuzz limit changed',
        build: () {
          when(() => mockGetFizzBuzzList.execute(tChangedLimit))
              .thenAnswer((_) async => tChangedFizzbuzzRepositoryResult);
          return fizzbuzzBloc;
        },
        seed: (() => FizzbuzzState(
            status: FizzbuzzStatus.success, limit: tLimit, fizzbuzzRepositoryResult: tFizzbuzzRepositoryResult)),
        act: (bloc) => bloc.add(const FizzbuzzLimitChanged(tChangedLimit)),
        expect: () => [
              FizzbuzzState(
                  status: FizzbuzzStatus.loading,
                  limit: tChangedLimit,
                  fizzbuzzRepositoryResult: tFizzbuzzRepositoryResult),
              FizzbuzzState(
                  status: FizzbuzzStatus.success,
                  limit: tChangedLimit,
                  fizzbuzzRepositoryResult: tChangedFizzbuzzRepositoryResult)
            ]);
  });
}
