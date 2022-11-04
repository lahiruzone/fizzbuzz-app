import 'package:fizzbuzz_app/core/entities/app_error.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';

class FizzbuzzRepositoryResult {
  final List<Fizzbuzz>? fizzbuzzList;
  final ApplicationError? error;

  FizzbuzzRepositoryResult({this.fizzbuzzList, this.error});
}
