import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/repositories/fizzbuzz_repository.dart';

class GetFizzBuzzList {
  final FizzbuzzRepository fizzbuzzRepository;

  GetFizzBuzzList({required this.fizzbuzzRepository});

  Future<FizzbuzzRepositoryResult> execute(int limit) async {
    try {
      return await fizzbuzzRepository.getFizzBuzzList(limit);
    } catch (e) {
      rethrow;
    }
  }
}
