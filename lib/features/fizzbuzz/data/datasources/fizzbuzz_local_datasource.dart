import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';

abstract class FizzbuzzLocalDataSource {
  Future<FizzbuzzRepositoryResult> getFizzBuzzResult(int limit);
}
