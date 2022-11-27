import 'package:clean_architecture_demo/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UserUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserParams extends Equatable {
  final int userId;

  const UserParams({required this.userId});
  @override
  List<Object?> get props => [userId];
}
