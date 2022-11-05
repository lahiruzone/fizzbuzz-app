import 'dart:async';

import 'package:fizzbuzz_app/features/fizzbuzz/data/datasources/fizzbuzz_local_datasource.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/data/datasources/genarate_fizzbuzz_list_isolate.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';
import 'package:flutter/foundation.dart';

class FizzbuzzLocalDataSourceImp extends FizzbuzzLocalDataSource {
  @override
  Future<FizzbuzzRepositoryResult> getFizzBuzzResult(int limit) async {
    try {
      // Isolate to genatate Fizzbuzz List
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
