// lib/src/providers/auth_provider.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import 'user_provider.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  String? _token;
  Map<String, dynamic>? _userData;
  bool _isLoading = false;

  String? get token => _token;
  Map<String, dynamic>? get userData => _userData;
  bool get isAuthenticated => _token != null;
  bool get isLoading => _isLoading;

  Future<bool> login(
    String email,
    String password, {
    String role = 'user',
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    final responseJson = await _authService.login(email, password, role);

    bool success = false;

    if (responseJson != null && responseJson['success'] == true) {
      final data = responseJson['data'];
      final token = data?['token'];
      final user = data?['user'];

      if (token != null && user != null) {
        _token = token;
        _userData = user;

        await _authService.saveToken(token);
        await _authService.saveUserData(user);

        success = true;

        if (context != null) {
          try {
            final userProvider = Provider.of<UserProvider>(
              context,
              listen: false,
            );
            final userModel = UserModel.fromJson(user);
            userProvider.setUser(userModel, token);
            print('[DEBUG] UserModel injetado no UserProvider com sucesso.');
          } catch (e) {
            print('[ERROR] Falha ao injetar UserModel no UserProvider: $e');
          }
        }
      }
    }

    _isLoading = false;
    notifyListeners();

    return success;
  }

  Future<void> loadUserData() async {
    _userData = await _authService.getUserData();
    notifyListeners();
  }

  Future<Map<String, dynamic>> signup(
    AccountType type,
    Map<String, dynamic> userData,
  ) async {
    _isLoading = true;
    notifyListeners();

    final result = await _authService.signup(type, userData);

    _isLoading = false;
    notifyListeners();

    return result;
  }

  Future<void> logout() async {
    await _authService.logout();
    _token = null;
    _userData = null;
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    _isLoading = true;
    notifyListeners();

    try {
      final token = await _authService.getToken();
      if (token == null || token.isEmpty) {
        _token = null;
      } else {
        final isValid = await _authService.validateToken(token);
        if (isValid) {
          _token = token;
          _userData = await _authService.getUserData();
        } else {
          await _authService.logout();
          _token = null;
          _userData = null;
        }
      }
    } catch (e) {
      print('Erro durante auto login: $e');
      _token = null;
      _userData = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateUserDataLocally(Map<String, dynamic> updatedData) {
    _userData = updatedData;
    notifyListeners();
  }
}
