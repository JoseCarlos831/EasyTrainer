import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';
import '../config/env.dart';

class UserService {
  final String _baseUrl;
  final http.Client httpClient;

  UserService({
    http.Client? httpClient,
    String? baseUrl,
  })  : httpClient = httpClient ?? http.Client(),
        _baseUrl = baseUrl ?? Env.apiBaseUrl;

  Future<bool> updateUser(UserModel user, String token) async {
    try {
      final url = Uri.parse('$_baseUrl/user/${user.id}');
      final body = jsonEncode(user.toJson());

      final response = await httpClient.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body,
      );

      return response.statusCode == 200;
    } catch (e) {
      print('[ERROR] updateUser: $e');
      return false;
    }
  }

  Future<bool> changePassword({
    required int userId,
    required String currentPassword,
    required String newPassword,
    required String token,
  }) async {
    final url = Uri.parse('$_baseUrl/user/$userId/password');

    try {
      final response = await httpClient.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('[ERROR] changePassword: $e');
      return false;
    }
  }

  Future<bool> deleteAccount(int userId, String token) async {
    final url = Uri.parse('$_baseUrl/user/$userId');

    try {
      final response = await httpClient.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      print('[ERROR] deleteAccount: $e');
      return false;
    }
  }
}
