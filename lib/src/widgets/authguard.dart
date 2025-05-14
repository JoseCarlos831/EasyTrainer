// lib/src/widgets/authguard.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../screens/public/login_page.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return auth.isAuthenticated ? child : const LoginPage();
  }
}
