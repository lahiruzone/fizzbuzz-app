import 'package:fizzbuzz_app/core/entities/app_error.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/data/datasources/fizzbuzz_local_datasource.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/repositories/fizzbuzz_repository.dart';

class FizzbuzzRepositoryImp extends FizzbuzzRepository {
  final FizzbuzzLocalDataSource fizzbuzzLocalDataSource;

  FizzbuzzRepositoryImp({required this.fizzbuzzLocalDataSource});

  @override
  Future<FizzbuzzRepositoryResult> getFizzBuzzList(int limit) async {
    try {
      final result = await fizzbuzzLocalDataSource.getFizzBuzzResult(limit);
      return result;
    } catch (e) {
      return FizzbuzzRepositoryResult(
          error: const ApplicationError(code: '500', message: 'Something wen\'t wrong. Please try again'));
    }
  }
}
