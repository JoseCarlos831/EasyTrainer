import 'package:flutter/material.dart';
import 'package:personalapp/src/pages/edit_profile_page.dart';
import 'package:personalapp/src/pages/profile_page.dart';
import 'package:personalapp/src/pages/welcome_page.dart';
import 'package:personalapp/src/pages/login_page.dart';
import 'package:personalapp/src/pages/register_page.dart';
import 'package:personalapp/src/pages/forgot_password_page.dart';
import 'package:personalapp/src/pages/check_you_email.dart';
import 'package:personalapp/src/pages/reset_password.dart';
import 'package:personalapp/src/pages/success_page.dart';
import 'package:personalapp/src/pages/password_settings_page.dart';
import 'package:personalapp/src/pages/delete_account_page.dart';
import 'package:personalapp/src/pages/settings_page.dart';
import 'package:personalapp/src/widgets/main_navigation.dart';
import 'package:personalapp/src/pages/home/home_page.dart';
import 'package:personalapp/src/pages/analytics_page.dart';

class PersonaltrainerApp extends StatelessWidget {
  const PersonaltrainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Trainer',
      initialRoute: '/',
      routes: {
        '/': (_) => const WelcomePage(),
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/forgot': (_) => const ForgotPasswordPage(),
        '/verify':(_) => const VerifyEmailPage(),
        '/reset': (_) => const ResetPasswordPage(),
        '/success': (_) => const SuccessPage(),
        '/profile': (_) => const ProfileScreen(),
        '/edit-profile': (_) => const EditProfilePage(),
        '/settings':(_) => const SettingsPage(),
        '/password-settings': (_) => PasswordSettingsPage(),
        '/delete-account': (_) => const DeleteAccountPage(),
        '/home': (_) => const HomePage(),
        '/a': (_) => const AnalyticsPage(),
        '/main': (_) => const MainNavigation(),

      
      },
    );
  }
}