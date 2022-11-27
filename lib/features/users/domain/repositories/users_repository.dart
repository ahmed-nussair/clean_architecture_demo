import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<User>>> getUsersList();
  Future<Either<Failure, User>> getUserDetails({required int userId});
}
