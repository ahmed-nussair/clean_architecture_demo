import 'package:clean_architecture_demo/core/use_cases/user_use_case.dart';
import 'package:clean_architecture_demo/features/users/domain/use_cases/get_user_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/user.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final GetUserDetails getUserDetails;
  UserDetailsCubit({required this.getUserDetails})
      : super(UserDetailsInitial());

  Future<void> loadUserDetails(int userId) async {
    emit(LoadingUserDetails());
    final usersDetails = await getUserDetails(UserParams(userId: userId));

    usersDetails.fold(
      (l) => emit(FailedLoadingUserDetails(errorMessage: l.failureMessage)),
      (r) => emit(
        SuccessfullyUserDetailsLoaded(r),
      ),
    );
  }
}
