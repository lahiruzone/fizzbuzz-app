import 'dart:async';

import 'package:fizzbuzz_app/features/fizzbuzz/data/datasources/fizzbuzz_local_datasource.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';
import 'package:flutter/foundation.dart';

class FizzbuzzLocalDataSourceImp extends FizzbuzzLocalDataSource {
  @override
  Future<FizzbuzzRepositoryResult> getFizzBuzzResult(int limit) async {
    try {
      // To avoid frame drop for larger Fizzbuzz limits
      final result = await compute(
        genatateFizzBuzz,
        limit,
      );
      return FizzbuzzRepositoryResult(fizzbuzzList: result);
    } catch (error) {
      throw Exception();
    }
  }
}

//Isolate to genatate Fizzbuzz List
FutureOr<List<Fizzbuzz>> genatateFizzBuzz(
  int range,
) {
  final result = List.generate(
      range, (index) => Fizzbuzz(index: index, value: index + 1, text: genarateFizzBuzzTextfromValue(index + 1)));
  return result;
}

String genarateFizzBuzzTextfromValue(int index) {
  String text = '';
  if (index % 3 == 0) {
    text = "${text}Fizz";
  }
  if (index % 5 == 0) {
    text = "${text}Buzz";
  }
  if (text.isEmpty) {
    text = (index).toString();
  }
  return text;
}
