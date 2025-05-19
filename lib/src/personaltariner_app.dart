// lib/src/personaltariner_app.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';

import 'screens/private/analytics_page.dart';
import 'screens/public/check_you_email.dart';
import 'screens/private/delete_account_page.dart';
import 'screens/private/edit_profile_page.dart';
import 'screens/public/forgot_password_page.dart';
import 'screens/private/home/home_page.dart';
import 'screens/public/login_page.dart';
import 'screens/private/password_settings_page.dart';
import 'screens/private/profile_page.dart';
import 'screens/public/register_page.dart';
import 'screens/private/reset_password.dart';
import 'screens/private/settings_page.dart';
import 'screens/public/success_page.dart';
import 'screens/public/welcome_page.dart';
import 'widgets/app_initializer_widget.dart';
import 'widgets/authguard.dart';
import 'widgets/main_navigation.dart';

class PersonaltrainerApp extends StatelessWidget {
  const PersonaltrainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Trainer',
      builder: (context, child) {
        return AppInitializer(child: child!);
      },
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return authProvider.isAuthenticated
              ? const MainNavigation()
              : const WelcomePage();
        },
      ),
      routes: {
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/forgot': (_) => const ForgotPasswordPage(),
        '/verify': (_) => const VerifyEmailPage(),
        '/reset': (_) => const ResetPasswordPage(),
        '/success': (_) => const SuccessPage(),

        '/profile': (_) => const AuthGuard(child: ProfileScreen()),
        '/edit-profile': (_) => const AuthGuard(child: EditProfilePage()),
        '/settings': (_) => const AuthGuard(child: SettingsPage()),
        '/password-settings': (_) => const AuthGuard(child: PasswordSettingsPage()),
        '/delete-account': (_) => const AuthGuard(child: DeleteAccountPage()),
        '/home': (_) => const AuthGuard(child: HomePage()),
        '/a': (_) => const AuthGuard(child: AnalyticsPage()),
        '/main': (_) => const AuthGuard(child: MainNavigation()),
      },
    );
  }
}
