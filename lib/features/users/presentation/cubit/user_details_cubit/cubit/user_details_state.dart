part of 'user_details_cubit.dart';

abstract class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object> get props => [];
}

class UserDetailsInitial extends UserDetailsState {}

class LoadingUserDetails extends UserDetailsState {}

class SuccessfullyUserDetailsLoaded extends UserDetailsState {
  final User user;

  const SuccessfullyUserDetailsLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class FailedLoadingUserDetails extends UserDetailsState {
  final String errorMessage;

  const FailedLoadingUserDetails({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
