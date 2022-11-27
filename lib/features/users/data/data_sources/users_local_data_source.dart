import 'dart:convert';

import 'package:clean_architecture_demo/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_strings.dart';
import '../models/user_model.dart';

abstract class UsersLocalDataSource {
  Future<List<UserModel>> getCachedUsersList();
  Future<UserModel> getCachedUserDetails({required int userId});

  Future<void> cacheUsersList(List<UserModel> usersList);
  Future<void> cacheUserDetails(UserModel user);
}

class SPUsersLocalDataSource extends UsersLocalDataSource {
  final SharedPreferences sharedPreferences;

  SPUsersLocalDataSource({required this.sharedPreferences});
  @override
  Future<void> cacheUserDetails(UserModel user) async {
    await sharedPreferences.setString(
      '${AppStrings.cachedUserDetails}#${user.id}',
      json.encode(
        user.toJson(),
      ),
    );
  }

  @override
  Future<void> cacheUsersList(List<UserModel> usersList) async {
    await sharedPreferences.setString(AppStrings.cachedUsersList,
        json.encode(usersList.map((e) => e.toJson()).toList()));
  }

  @override
  Future<UserModel> getCachedUserDetails({required int userId}) async {
    final cachedUserDetails =
        sharedPreferences.getString('${AppStrings.cachedUserDetails}#$userId');
    if (cachedUserDetails != null) {
      return Future.value(UserModel.fromJson(json.decode(cachedUserDetails)));
    }
    throw CacheException(
        message: AppStrings.defaultLocalStorageExceptionMessage);
  }

  @override
  Future<List<UserModel>> getCachedUsersList() async {
    final cachedUsersList =
        sharedPreferences.getString(AppStrings.cachedUsersList);
    if (cachedUsersList != null) {
      return Future.value(
        List<UserModel>.from(
          json.decode(cachedUsersList).map((e) => UserModel.fromJson(e)),
        ),
      );
    }
    throw CacheException(
        message: AppStrings.defaultLocalStorageExceptionMessage);
  }
}
