import 'dart:async';

import 'package:fizzbuzz_app/core/util/fizzbuzz_converter.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';

//Isolate to genatate Fizzbuzz List
FutureOr<List<Fizzbuzz>> genatateFizzBuzz(
  int range,
) {
  FizzbuzzConverter fizzbuzzConverter = FizzbuzzConverter();
  final result = List.generate(range, (index) => fizzbuzzConverter.indexToFizzbuzz(index));
  return result;
}
