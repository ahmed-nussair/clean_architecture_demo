import 'package:clean_architecture_demo/core/utils/app_strings.dart';
import 'package:clean_architecture_demo/features/users/domain/use_cases/get_user_details.dart';
import 'package:clean_architecture_demo/features/users/domain/use_cases/get_users_list.dart';
import 'package:clean_architecture_demo/features/users/presentation/cubit/user_details_cubit/cubit/user_details_cubit.dart';
import 'package:clean_architecture_demo/features/users/presentation/screens/user_details_screen.dart';
import 'package:clean_architecture_demo/features/users/presentation/screens/users_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/users/presentation/cubit/users_list_cubit/users_list_cubit.dart';
import '../../injector.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: AppStrings.usersList,
    routes: _routes,
  );

  static final List<GoRoute> _routes = [
    GoRoute(
      path: AppStrings.usersList,
      routes: _userListRoutes,
      builder: (context, state) => BlocProvider(
        create: (_) =>
            UsersListCubit(getUsersList: sl<GetUsersList>())..loadUsersList(),
        child: const UsersListScreen(),
      ),
    ),
  ];

  static List<RouteBase> get _userListRoutes {
    return [
      GoRoute(
        name: userDetails,
        path: '${AppStrings.userDetails}/:${AppStrings.userId}',
        builder: (context, state) => BlocProvider(
          create: (_) => UserDetailsCubit(getUserDetails: sl<GetUserDetails>())
            ..loadUserDetails(int.parse(state.params[AppStrings.userId]!)),
          child: const UserDetailsScreen(),
        ),
      ),
    ];
  }

  static String usersList = UniqueKey().toString();
  static String userDetails = UniqueKey().toString();
}
