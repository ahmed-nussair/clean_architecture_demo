import 'package:clean_architecture_demo/config/routes/app_routes.dart';
import 'package:clean_architecture_demo/features/users/presentation/widgets/users_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_strings.dart';
import '../cubit/users_list_cubit/users_list_cubit.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<UsersListCubit, UsersListState>(
            builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SuccessfullyLoaded) {
            return ListView.separated(
              itemBuilder: (context, index) => UsersListItemWidget(
                userId: state.usersList[index].id!,
                username: state.usersList[index].username!,
                name: state.usersList[index].name!,
                onTapped: (userId) => context.pushNamed(
                  AppRoutes.userDetails,
                  params: {AppStrings.userId: '$userId'},
                ),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.usersList.length,
            );
          }
          if (state is FailedLoading) {
            return Center(
              child: Text(
                state.errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
