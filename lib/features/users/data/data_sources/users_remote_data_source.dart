import 'dart:convert';

import 'package:clean_architecture_demo/core/errors/exceptions.dart';
import 'package:clean_architecture_demo/core/utils/app_strings.dart';
import 'package:clean_architecture_demo/features/users/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:http_status_code/http_status_code.dart';

import '../../../../core/api/base_url.dart';
import '../../../../core/api/end_points.dart';

import 'package:http/http.dart' as http;

abstract class UsersRemoteDataSource {
  Future<List<UserModel>> getUsersList();
  Future<UserModel> getUserDetails({required int userId});
}

class HttpUsersRemoteDataSource extends UsersRemoteDataSource {
  @override
  Future<List<UserModel>> getUsersList() async {
    final uri = Uri.parse('$baseUrl${EndPoints.users}');
    final response = await http.get(uri);
    if (response.statusCode == StatusCode.OK) {
      return List<UserModel>.from(
        json.decode(response.body).map(
              (e) => UserModel.fromJson(e),
            ),
      );
    }
    throw ServerException(message: AppStrings.defaultServerExceptionMessage);
  }

  @override
  Future<UserModel> getUserDetails({required int userId}) async {
    final uri = Uri.parse('$baseUrl${EndPoints.users}/$userId');
    final response = await http.get(uri);
    if (response.statusCode == StatusCode.OK) {
      return UserModel.fromJson(json.decode(response.body));
    }
    throw ServerException(message: AppStrings.defaultServerExceptionMessage);
  }
}

class DioUsersRemoteDataSource extends UsersRemoteDataSource {
  @override
  Future<List<UserModel>> getUsersList() async {
    try {
      var response =
          await Dio().get<List<UserModel>>('$baseUrl${EndPoints.users}');
      return response.data!;
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<UserModel> getUserDetails({required int userId}) {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }
}
