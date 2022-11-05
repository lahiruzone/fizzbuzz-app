import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';

abstract class FizzbuzzRepository {
  Future<FizzbuzzRepositoryResult> getFizzBuzzList(int limit);
}
