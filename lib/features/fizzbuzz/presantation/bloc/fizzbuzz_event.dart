part of 'fizzbuzz_bloc.dart';

@immutable
abstract class FizzbuzzEvent extends Equatable {
  const FizzbuzzEvent();
}

class FizzbuzzLoaded extends FizzbuzzEvent {
  final int limit;
  const FizzbuzzLoaded(this.limit);

  @override
  List<Object> get props => [limit];
}

class FizzbuzzLimitChanged extends FizzbuzzEvent {
  final int limit;
  const FizzbuzzLimitChanged(this.limit);

  @override
  List<Object> get props => [limit];
}
