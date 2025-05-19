// lib/src/providers/user_provider.dart

import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  String? _token;

  UserModel? get user => _user;
  String? get token => _token;

  void setUser(UserModel user, String token) {
    _user = user;
    _token = token;
    notifyListeners();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }

  Future<bool> updateUser(UserModel updatedUser) async {
    try {
      print('[DEBUG] Entrando em UserProvider.updateUser');
      if (_token == null) {
        print('[ERROR] Token está nulo');
        return false;
      }

      print('[DEBUG] Chamando UserService.updateUser...');
      final success = await UserService().updateUser(updatedUser, _token!);
      print('[DEBUG] Retorno do UserService: $success');

      if (success) {
        _user = updatedUser;
        notifyListeners();
      }

      return success;
    } catch (e) {
      print('[ERROR] Exceção em updateUser: $e');
      return false;
    }
  }

  Future<bool> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    if (_user == null || _token == null) return false;

    return await UserService().changePassword(
      userId: _user!.id,
      currentPassword: currentPassword,
      newPassword: newPassword,
      token: _token!,
    );
  }

  Future<bool> deleteAccount() async {
    if (_user == null || _token == null) return false;

    final success = await UserService().deleteAccount(_user!.id, _token!);

    if (success) {
      clear(); // limpa usuário da memória
    }

    return success;
  }
}
