// lib/src/widgets/app_initializer_widget.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';
import '../easytrainer_app.dart';

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final auth = context.read<AuthProvider>();
      final userProvider = context.read<UserProvider>();

      try {
        await auth.tryAutoLogin(context);

        if (auth.token != null &&
            auth.userData != null &&
            userProvider.user == null) {
          final userModel = UserModel.fromJson(auth.userData!);
          userProvider.setUser(userModel, auth.token!);
          print('[AppInitializer] Usuário injetado com sucesso.');

          navigatorKey.currentState?.pushReplacementNamed('/main');
        } else {
          print('[AppInitializer] Token ausente ou userData inválido.');
          navigatorKey.currentState?.pushReplacementNamed('/welcome');
        }
      } catch (e) {
        print('[AppInitializer] Erro durante inicialização: $e');
        navigatorKey.currentState?.pushReplacementNamed('/welcome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0B0622),
      body: Center(child: CircularProgressIndicator(color: Colors.tealAccent)),
    );
  }
}
