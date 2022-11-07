import 'package:equatable/equatable.dart';
import 'package:fizzbuzz_app/core/entities/app_error.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz.dart';

class FizzbuzzRepositoryResult extends Equatable {
  final List<Fizzbuzz>? fizzbuzzList;
  final ApplicationError? error;

  const FizzbuzzRepositoryResult({this.fizzbuzzList, this.error});

  @override
  List<Object?> get props => [fizzbuzzList, error];
}
