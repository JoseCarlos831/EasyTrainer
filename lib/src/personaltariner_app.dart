import 'package:flutter/material.dart';
import 'package:personalapp/src/pages/welcome_page.dart';
import 'package:personalapp/src/pages/login_page.dart';
import 'package:personalapp/src/pages/register_page.dart';
import 'package:personalapp/src/pages/forgot_password_page.dart';
import 'package:personalapp/src/pages/check_you_email.dart';
import 'package:personalapp/src/pages/reset_password.dart';
import 'package:personalapp/src/pages/success_page.dart';

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
      },
    );
  }
}