import 'package:clean_architecture_demo/core/errors/failures.dart';
import 'package:clean_architecture_demo/core/use_cases/user_use_case.dart';
import 'package:clean_architecture_demo/features/users/domain/repositories/users_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';

class GetUsersList implements UserUseCase<List<User>, NoParams> {
  final UsersRepository usersRepository;

  GetUsersList({required this.usersRepository});

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) =>
      usersRepository.getUsersList();
}
