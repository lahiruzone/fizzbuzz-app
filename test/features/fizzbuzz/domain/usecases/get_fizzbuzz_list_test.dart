import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/repositories/fizzbuzz_repository.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/usecases/get_fizzbuzz_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFizzBuzzListRepository extends Mock implements FizzbuzzRepository {}

void main() {
  late GetFizzBuzzList usecase;
  late MockFizzBuzzListRepository mockFizzBuzzListRepository;

  setUp(() {
    mockFizzBuzzListRepository = MockFizzBuzzListRepository();
    usecase = GetFizzBuzzList(fizzbuzzRepository: mockFizzBuzzListRepository);
  });

  const tLimit = 6;
  List<Fizzbuzz> tFizzbuzzList = const [
    Fizzbuzz(index: 0, value: 1, text: '1'),
    Fizzbuzz(index: 1, value: 2, text: '2'),
    Fizzbuzz(index: 2, value: 3, text: 'Fizz'),
    Fizzbuzz(index: 3, value: 4, text: '4'),
    Fizzbuzz(index: 4, value: 5, text: 'Buzz'),
    Fizzbuzz(index: 5, value: 6, text: '7dd')
  ];
  final tFizzbuzzRepositoryResult = FizzbuzzRepositoryResult(
    fizzbuzzList: tFizzbuzzList,
  );

  test('should get fizzbuzz list for the limit from the repository', () async {
    //arrange
    when(
      () => mockFizzBuzzListRepository.getFizzBuzzList(tLimit),
    ).thenAnswer((realInvocation) async => tFizzbuzzRepositoryResult);
    //act
    final result = await usecase.execute(tLimit);
    //assert
    expect(result, tFizzbuzzRepositoryResult);
    verify(() => mockFizzBuzzListRepository.getFizzBuzzList(tLimit));
    verifyNoMoreInteractions(mockFizzBuzzListRepository);
  });
}
