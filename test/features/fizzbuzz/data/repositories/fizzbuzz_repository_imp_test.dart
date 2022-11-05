import 'package:fizzbuzz_app/features/fizzbuzz/data/datasources/fizzbuzz_local_datasource.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/data/repositories/fizzbuzz_repository_imp.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFizzbuzzLocalDataSource extends Mock implements FizzbuzzLocalDataSource {}

void main() {
  late MockFizzbuzzLocalDataSource mockFizzbuzzLocalDataSource;
  late FizzbuzzRepositoryImp fizzbuzzRepository;

  const tLimit = 6;
  List<Fizzbuzz> tFizzbuzzList = const [
    Fizzbuzz(index: 0, value: 1, text: '1'),
    Fizzbuzz(index: 1, value: 2, text: '2'),
    Fizzbuzz(index: 2, value: 3, text: 'Fizz'),
    Fizzbuzz(index: 3, value: 4, text: '4'),
    Fizzbuzz(index: 4, value: 5, text: 'Buzz'),
    Fizzbuzz(index: 5, value: 6, text: '7')
  ];
  final tFizzbuzzRepositoryResult = FizzbuzzRepositoryResult(
    fizzbuzzList: tFizzbuzzList,
  );

  setUp(() {
    mockFizzbuzzLocalDataSource = MockFizzbuzzLocalDataSource();
    fizzbuzzRepository = FizzbuzzRepositoryImp(fizzbuzzLocalDataSource: mockFizzbuzzLocalDataSource);
  });

  group('fizzbuzz repository', () {
    test('should get fizzbuzz list for the limit from the local data source', () async {
      //arrange
      when(() => mockFizzbuzzLocalDataSource.getFizzBuzzResult(tLimit))
          .thenAnswer((invocation) async => tFizzbuzzRepositoryResult);
      //act
      final result = await fizzbuzzRepository.getFizzBuzzList(tLimit);
      //assert
      verify(() => mockFizzbuzzLocalDataSource.getFizzBuzzResult(tLimit));
      expect(result, tFizzbuzzRepositoryResult);
    });
  });
}
