import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';

import 'package:personalapp/src/providers/auth_provider.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:personalapp/src/providers/workout_provider.dart';
import 'package:personalapp/src/models/user_model.dart';

Widget wrapWithProviders(Widget child) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => AuthProvider()..setToken('fake-token'),
      ),
      ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider()
          ..setUser(
            UserModel(
              id: 1,
              name: 'Teste',
              email: 'teste@email.com',
              birthday: DateTime(2000, 1, 1),
              weight: 70,
              height: 170,
              mobileNumber: '11999999999',
              levelId: 1,
              goalIds: [],
              age: 24,
              gender: 'male',
              instructorIds: [1],
            ),
            'fake-token',
          ),
      ),
      ChangeNotifierProvider<WorkoutProvider>(
        create: (_) => WorkoutProvider(),
      ),
    ],
    child: MaterialApp(
      locale: const Locale('pt'),
      supportedLocales: const [Locale('en'), Locale('pt')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: child,
    ),
  );
}
