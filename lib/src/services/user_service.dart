// lib/src/services/user_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';
import '../config/env.dart';

class UserService {
  final String _baseUrl = Env.apiBaseUrl;

  Future<bool> updateUser(UserModel user, String token) async {
    try {
      final url = Uri.parse('$_baseUrl/user/${user.id}');
      final body = jsonEncode(user.toJson());

      print('[DEBUG] Fazendo PUT para: $url');
      print('[DEBUG] Body: $body');

      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body,
      );

      print('[DEBUG] Status: ${response.statusCode}');
      print('[DEBUG] Body: ${response.body}');

      return response.statusCode == 200;
    } catch (e) {
      print('[ERROR] Exceção em UserService.updateUser: $e');
      return false;
    }
  }

  Future<bool> changePassword({
    required int userId,
    required String currentPassword,
    required String newPassword,
    required String token,
  }) async {
    final url = Uri.parse('${Env.apiBaseUrl}/user/$userId/password');

    try {
      final response = await http.put(
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

      print('[DEBUG] changePassword status: ${response.statusCode}');
      print('[DEBUG] changePassword body: ${response.body}');

      return response.statusCode == 200;
    } catch (e) {
      print('[ERROR] Failed to change password: $e');
      return false;
    }
  }

  Future<bool> deleteAccount(int userId, String token) async {
    final url = Uri.parse('$_baseUrl/user/$userId');
    print('[UserService] DELETE $url');

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('[UserService] Status: ${response.statusCode}');
      print('[UserService] Body: ${response.body}');
      return response.statusCode == 200;
    } catch (e) {
      print('[UserService] Erro ao deletar conta: $e');
      return false;
    }
  }
}
