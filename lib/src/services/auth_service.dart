import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/env.dart';

enum AccountType { user, instructor }

class AuthService {
  final String _baseUrl;
  final http.Client httpClient;

  AuthService({
    http.Client? httpClient,
    String? baseUrl,
  })  : httpClient = httpClient ?? http.Client(),
        _baseUrl = baseUrl ?? Env.apiBaseUrl;

  Future<Map<String, dynamic>?> login(
    String email,
    String password,
    String role,
  ) async {
    final url = Uri.parse('$_baseUrl/auth/login');
    try {
      final response = await httpClient.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password, 'role': role}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print('Erro durante login: $e');
    }
    return null;
  }

  Future<Map<String, dynamic>> signup(
    AccountType type,
    Map<String, dynamic> userData,
  ) async {
    final endpoint = type == AccountType.user
        ? '/auth/register/user/basic'
        : '/auth/register/instructor/basic';
    final url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await httpClient.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(response.body);
        return {
          'success': json['success'] == true,
          'message': json['message'] ?? 'Erro desconhecido',
        };
      }
    } catch (e) {
      print('Erro no signup: $e');
    }
    return {'success': false, 'message': 'Erro na requisição'};
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> saveUserData(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user));
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('user');
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('user');
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<bool> validateToken(String token) async {
    final url = Uri.parse('$_baseUrl/auth/validate');
    try {
      final response = await httpClient.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      print('Erro ao validar token: $e');
      return false;
    }
  }
}
