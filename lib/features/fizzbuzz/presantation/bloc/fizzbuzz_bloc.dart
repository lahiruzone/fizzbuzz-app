import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/entities/fizzbuzz_repository_result.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/usecases/get_fizzbuzz_list.dart';
import 'package:meta/meta.dart';

part 'fizzbuzz_event.dart';
part 'fizzbuzz_state.dart';

class FizzbuzzBloc extends Bloc<FizzbuzzEvent, FizzbuzzState> {
  final GetFizzBuzzList getFizzBuzzList;

  FizzbuzzBloc({
    required this.getFizzBuzzList,
  }) : super(const FizzbuzzState()) {
    on<FizzbuzzLoaded>(_mapFizzbuzzLoadedToState);
    on<FizzbuzzLimitChanged>(_mapFizzbuzzLimitChangedToState);
  }

  void _mapFizzbuzzLoadedToState(FizzbuzzLoaded event, Emitter<FizzbuzzState> emit) async {
    emit(state.copyWith(
      limit: event.limit,
      status: FizzbuzzStatus.loading,
    ));
    final result = await getFizzBuzzList.execute(state.limit);
    if (result.error != null) {
      emit(state.copyWith(status: FizzbuzzStatus.failure, fizzbuzzRepositoryResult: result));
    } else {
      emit(state.copyWith(status: FizzbuzzStatus.success, fizzbuzzRepositoryResult: result));
    }
  }

  void _mapFizzbuzzLimitChangedToState(FizzbuzzLimitChanged event, Emitter<FizzbuzzState> emit) async {
    emit(state.copyWith(
      limit: event.limit,
      status: FizzbuzzStatus.loading,
    ));
    final result = await getFizzBuzzList.execute(event.limit);
    if (result.error != null) {
      emit(state.copyWith(status: FizzbuzzStatus.failure, fizzbuzzRepositoryResult: result));
    } else {
      emit(state.copyWith(status: FizzbuzzStatus.success, fizzbuzzRepositoryResult: result));
    }
  }
}
