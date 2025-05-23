// lib/src/providers/auth_provider.dart

import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../easytrainer_app.dart';

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
  }) async {
    _isLoading = true;
    notifyListeners();

    bool success = false;

    try {
      final responseJson = await _authService.login(email, password, role);

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
        }
      }
    } catch (e) {
      print('[ERROR] Erro durante login: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }

    return success;
  }

  Future<Map<String, dynamic>> signup(
    AccountType type,
    Map<String, dynamic> userData,
  ) async {
    _isLoading = true;
    notifyListeners();

    late final Map<String, dynamic> result;

    try {
      result = await _authService.signup(type, userData);

      if (result['success'] == true) {
        // Após cadastro com sucesso, navega para login
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          '/login',
          (route) => false,
        );
      }
    } catch (e) {
      print('[ERROR] Erro durante signup: $e');
      result = {'success': false, 'message': 'Erro durante cadastro'};
    } finally {
      _isLoading = false;
      notifyListeners();
    }

    return result;
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      print('[ERROR] Erro ao fazer logout: $e');
    } finally {
      _token = null;
      _userData = null;
      Future.microtask(() => notifyListeners());

      // Redireciona para a tela de inicialização (limpa a árvore)
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        '/initializing',
        (r) => false,
      );
    }
  }

  Future<void> tryAutoLogin(BuildContext context) async {
    _isLoading = true;
    Future.microtask(() => notifyListeners());

    try {
      final token = await _authService.getToken();

      if (token != null && token.isNotEmpty) {
        final isValid = await _authService.validateToken(token);
        if (isValid) {
          _token = token;
          _userData = await _authService.getUserData();
        } else {
          await _authService.logout();
          _token = null;
          _userData = null;
        }
      } else {
        _token = null;
        _userData = null;
      }
    } catch (e) {
      print('[ERROR] Erro durante auto login: $e');
      _token = null;
      _userData = null;
    } finally {
      _isLoading = false;
      Future.microtask(() => notifyListeners());
    }
  }

  void updateUserDataLocally(Map<String, dynamic> updatedData) {
    _userData = updatedData;
    Future.microtask(() => notifyListeners());
  }
}
