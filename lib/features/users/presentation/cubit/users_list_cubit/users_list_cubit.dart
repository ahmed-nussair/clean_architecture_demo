import 'package:clean_architecture_demo/core/use_cases/user_use_case.dart';
import 'package:clean_architecture_demo/features/users/domain/use_cases/get_users_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user.dart';

part 'users_list_state.dart';

class UsersListCubit extends Cubit<UsersListState> {
  final GetUsersList getUsersList;
  UsersListCubit({required this.getUsersList}) : super(UsersListInitial());

  Future<void> loadUsersList() async {
    emit(Loading());
    final usersList = await getUsersList(NoParams());
    usersList.fold(
      (l) => emit(FailedLoading(errorMessage: l.failureMessage)),
      (r) => emit(
        SuccessfullyLoaded(usersList: r),
      ),
    );
  }
}
