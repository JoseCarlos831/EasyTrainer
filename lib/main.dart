// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/personaltariner_app.dart';
import 'src/providers/auth_provider.dart';
import 'src/providers/exercise_provider.dart';
import 'src/providers/modality_provider.dart';
import 'src/providers/routine_provider.dart';
import 'src/providers/user_provider.dart';
import 'src/providers/workout_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
        ChangeNotifierProvider(create: (_) => ModalityProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseProvider()),
        ChangeNotifierProvider(create: (_) => RoutineProvider()),
      ],
      child: const PersonaltrainerApp(),
    ),
  );
}
