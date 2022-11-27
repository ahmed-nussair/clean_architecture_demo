import 'package:clean_architecture_demo/core/errors/exceptions.dart';
import 'package:clean_architecture_demo/core/network/network_info.dart';
import 'package:clean_architecture_demo/core/utils/app_strings.dart';
import 'package:clean_architecture_demo/features/users/data/data_sources/users_local_data_source.dart';
import 'package:clean_architecture_demo/features/users/data/data_sources/users_remote_data_source.dart';
import 'package:clean_architecture_demo/features/users/domain/entities/user.dart';
import 'package:clean_architecture_demo/core/errors/failures.dart';
import 'package:clean_architecture_demo/features/users/domain/repositories/users_repository.dart';
import 'package:dartz/dartz.dart';

class UsersRepositoryImpl extends UsersRepository {
  final NetworkInfo networkInfo;
  final UsersRemoteDataSource usersRemoteDataSource;
  final UsersLocalDataSource usersLocalDataSource;

  UsersRepositoryImpl({
    required this.networkInfo,
    required this.usersRemoteDataSource,
    required this.usersLocalDataSource,
  });

  @override
  Future<Either<Failure, User>> getUserDetails({required int userId}) async {
    if (await networkInfo.isConnected) {
      try {
        final userDetails =
            await usersRemoteDataSource.getUserDetails(userId: userId);
        usersLocalDataSource.cacheUserDetails(userDetails);
        // usersRemoteDataSource.getUserDetails(userId: userId)
        return Right(userDetails);
      } on ServerException {
        return const Left(
          ServerFailure(
            failureMessage: AppStrings.defaultServerFailureMessage,
          ),
        );
      }
    }
    try {
      final userDetails =
          await usersLocalDataSource.getCachedUserDetails(userId: userId);
      return Right(userDetails);
    } on CacheException {
      return const Left(
        CacheFailure(
            failureMessage: AppStrings.defaultLocalStorageFailureMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsersList() async {
    if (await networkInfo.isConnected) {
      try {
        final usersList = await usersRemoteDataSource.getUsersList();
        usersLocalDataSource.cacheUsersList(usersList);
        return Right(usersList);
      } on ServerException {
        return const Left(
          ServerFailure(
            failureMessage: AppStrings.defaultServerFailureMessage,
          ),
        );
      }
    }
    try {
      final usersList = await usersLocalDataSource.getCachedUsersList();
      return Right(usersList);
    } on CacheException {
      return const Left(
        CacheFailure(
          failureMessage: AppStrings.defaultLocalStorageFailureMessage,
        ),
      );
    }
  }
}
