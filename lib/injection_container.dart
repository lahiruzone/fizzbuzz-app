import 'package:fizzbuzz_app/core/user_input/presantation/cubit/user_input_cubit.dart';
import 'package:fizzbuzz_app/core/util/input_converter.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/data/datasources/fizzbuzz_local_datasource.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/data/repositories/fizzbuzz_repository_imp.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/domain/usecases/get_fizzbuzz_list.dart';
import 'package:fizzbuzz_app/features/fizzbuzz/presantation/bloc/fizzbuzz_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/fizzbuzz/data/datasources/fizzbuzz_local_datasource_imp.dart';
import 'features/fizzbuzz/domain/repositories/fizzbuzz_repository.dart';

final sl = GetIt.instance;

void init() {
  //Bloc
  sl.registerFactory(() => FizzbuzzBloc(getFizzBuzzList: sl.call()));

  //Cubits
  sl.registerFactory(() => UserInputCubit(inputConverter: sl.call()));

  //Repositories
  sl.registerLazySingleton<FizzbuzzRepository>(() => FizzbuzzRepositoryImp(fizzbuzzLocalDataSource: sl.call()));

  //Usecases
  sl.registerLazySingleton(() => GetFizzBuzzList(fizzbuzzRepository: sl.call()));

  // Datasources
  sl.registerLazySingleton<FizzbuzzLocalDataSource>(() => FizzbuzzLocalDataSourceImp());

  //Helpers
  sl.registerLazySingleton(() => InputConverter());
}
