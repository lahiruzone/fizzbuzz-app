part of 'fizzbuzz_bloc.dart';

enum FizzbuzzStatus { initial, loading, success, failure }

class FizzbuzzState extends Equatable {
  final FizzbuzzStatus status;
  final int limit;
  final FizzbuzzRepositoryResult? fizzbuzzRepositoryResult;

  const FizzbuzzState({this.status = FizzbuzzStatus.initial, this.limit = 0, this.fizzbuzzRepositoryResult});
  @override
  List<Object?> get props => [status, limit, fizzbuzzRepositoryResult];

  FizzbuzzState copyWith({
    FizzbuzzStatus? status,
    int? limit,
    FizzbuzzRepositoryResult? fizzbuzzRepositoryResult,
  }) {
    return FizzbuzzState(
      status: status ?? this.status,
      limit: limit ?? this.limit,
      fizzbuzzRepositoryResult: fizzbuzzRepositoryResult ?? this.fizzbuzzRepositoryResult,
    );
  }
}
