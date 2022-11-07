import 'package:fizzbuzz_app/core/util/fizzbuzz_converter.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FizzbuzzConverter fizzbuzzConverter;

  setUp(() {
    fizzbuzzConverter = FizzbuzzConverter();
  });

  group('indexToFizzbuzz', () {
    test('should return a Fizzbuzz object for the index', () {
      //arrange
      const fizzbuzz = Fizzbuzz(index: 14, value: 15, text: 'FizzBuzz');
      //act
      final result = fizzbuzzConverter.indexToFizzbuzz(14);
      //assert
      expect(result, fizzbuzz);
    });
  });
}
