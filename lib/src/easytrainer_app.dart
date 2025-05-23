// lib/src/easytrainer_app.dart

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'providers/language_provider.dart';

import 'screens/private/analytics_page.dart';
import 'screens/private/language_selection_page.dart';
import 'screens/public/check_you_email.dart';
import 'screens/private/delete_account_page.dart';
import 'screens/private/edit_profile_page.dart';
import 'screens/public/forgot_password_page.dart';
import 'screens/private/home/home_page.dart';
import 'screens/public/initializing_screen.dart';
import 'screens/public/login_page.dart';
import 'screens/private/password_settings_page.dart';
import 'screens/private/profile_page.dart';
import 'screens/public/register_page.dart';
import 'screens/private/reset_password.dart';
import 'screens/private/settings_page.dart';
import 'screens/public/success_page.dart';
import 'screens/public/welcome_page.dart';
import 'widgets/authguard.dart';
import 'widgets/main_navigation.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class EasytrainerApp extends StatelessWidget {
  const EasytrainerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Easy Trainer',
      locale: languageProvider.locale,
      supportedLocales: const [Locale('en'), Locale('pt')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/initializing',
      routes: {
        '/initializing': (_) => const InitializingScreen(),
        '/main': (_) => const AuthGuard(child: MainNavigation()),
        '/welcome': (_) => const WelcomePage(),
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/forgot': (_) => const ForgotPasswordPage(),
        '/verify': (_) => const VerifyEmailPage(),
        '/reset': (_) => const ResetPasswordPage(),
        '/success': (_) => const SuccessPage(),
        '/profile': (_) => const AuthGuard(child: ProfileScreen()),
        '/edit-profile': (_) => const AuthGuard(child: EditProfilePage()),
        '/settings': (_) => const AuthGuard(child: SettingsPage()),
        '/password-settings':
            (_) => const AuthGuard(child: PasswordSettingsPage()),
        '/delete-account': (_) => const AuthGuard(child: DeleteAccountPage()),
        '/home': (_) => const AuthGuard(child: HomePage()),
        '/a': (_) => const AuthGuard(child: AnalyticsPage()),
        '/language': (_) => const AuthGuard(child: LanguageSelectionPage()),
      },
    );
  }
}
