part of 'users_list_cubit.dart';

abstract class UsersListState extends Equatable {
  const UsersListState();

  @override
  List<Object> get props => [];
}

class UsersListInitial extends UsersListState {}

class Loading extends UsersListState {}

class SuccessfullyLoaded extends UsersListState {
  final List<User> usersList;

  const SuccessfullyLoaded({required this.usersList});

  @override
  List<Object> get props => [usersList];
}

class FailedLoading extends UsersListState {
  final String errorMessage;

  const FailedLoading({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
