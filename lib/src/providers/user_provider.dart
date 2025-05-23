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
    _token = null;
    notifyListeners();
  }

  Future<bool> updateUser(UserModel updatedUser) async {
    if (_token == null) return false;

    try {
      final success = await UserService().updateUser(updatedUser, _token!);
      if (success) {
        _user = updatedUser;
        notifyListeners();
      }
      return success;
    } catch (e) {
      print('[UserProvider] Erro ao atualizar usuário: $e');
      return false;
    }
  }

  Future<bool> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    if (_user == null || _token == null) return false;

    try {
      return await UserService().changePassword(
        userId: _user!.id,
        currentPassword: currentPassword,
        newPassword: newPassword,
        token: _token!,
      );
    } catch (e) {
      print('[UserProvider] Erro ao alterar senha: $e');
      return false;
    }
  }

  Future<bool> deleteAccount() async {
    if (_user == null || _token == null) return false;

    try {
      final success = await UserService().deleteAccount(_user!.id, _token!);
      if (success) clear();
      return success;
    } catch (e) {
      print('[UserProvider] Erro ao deletar conta: $e');
      return false;
    }
  }
}
