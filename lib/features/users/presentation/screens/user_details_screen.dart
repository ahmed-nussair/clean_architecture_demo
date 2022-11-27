import 'package:clean_architecture_demo/features/users/presentation/cubit/user_details_cubit/cubit/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              BlocBuilder<UserDetailsCubit, UserDetailsState>(
                builder: (context, state) {
                  if (state is LoadingUserDetails) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SuccessfullyUserDetailsLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.user.username!,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          state.user.name!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          state.user.email!,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          state.user.phone!,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          state.user.website!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    );
                  }
                  if (state is FailedLoadingUserDetails) {
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
                },
              ),
              Positioned(
                top: 10,
                left: 10,
                child: InkWell(
                  onTap: () => context.pop(),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
