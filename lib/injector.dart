import 'package:clean_architecture_demo/core/network/network_info.dart';
import 'package:clean_architecture_demo/features/users/data/data_sources/users_local_data_source.dart';
import 'package:clean_architecture_demo/features/users/data/data_sources/users_remote_data_source.dart';
import 'package:clean_architecture_demo/features/users/data/repositories/users_repository_impl.dart';
import 'package:clean_architecture_demo/features/users/domain/repositories/users_repository.dart';
import 'package:clean_architecture_demo/features/users/domain/use_cases/get_user_details.dart';
import 'package:clean_architecture_demo/features/users/domain/use_cases/get_users_list.dart';
import 'package:clean_architecture_demo/features/users/presentation/cubit/user_details_cubit/cubit/user_details_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/users/presentation/cubit/users_list_cubit/users_list_cubit.dart';

final sl = GetIt.I;

Future<void> initInjection() async {
  sl.registerLazySingleton(() => UsersListCubit(getUsersList: sl()));
  sl.registerLazySingleton(() => UserDetailsCubit(getUserDetails: sl()));
  sl.registerLazySingleton(() => GetUsersList(usersRepository: sl()));
  sl.registerLazySingleton(() => GetUserDetails(usersRepository: sl()));
  sl.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(
      networkInfo: sl(),
      usersRemoteDataSource: sl(),
      usersLocalDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<UsersRemoteDataSource>(
      () => HttpUsersRemoteDataSource());
  sl.registerLazySingleton<UsersLocalDataSource>(
    () => SPUsersLocalDataSource(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectionChecker: sl(),
    ),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
