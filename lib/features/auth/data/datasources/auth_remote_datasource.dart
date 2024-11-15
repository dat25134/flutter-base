import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';
import '../../../../core/constants/api_endpoints.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await client.post(
        Uri.parse(ApiEndpoints.login),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException();
      }
    } on SocketException {
      throw ConnectionException('Không thể kết nối đến server');
    } on TimeoutException {
      throw ConnectionException('Kết nối bị timeout');
    } catch (e) {
      throw ConnectionException('Lỗi kết nối: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.logout),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }
} 