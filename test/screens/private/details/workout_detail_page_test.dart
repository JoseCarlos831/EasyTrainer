import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/screens/private/details/workout_detail_page.dart';
import 'package:personalapp/src/models/workout_model.dart';
import 'package:personalapp/src/models/exercise_model.dart';
import 'package:personalapp/src/models/routine_model.dart';
import 'package:personalapp/src/providers/exercise_provider.dart';
import 'package:personalapp/src/providers/routine_provider.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MockExerciseProvider extends ExerciseProvider {
  @override
  Future<void> fetchExercisesByWorkoutId(int workoutId, int instructorId, String token) async {
    // não faz nada, apenas evita a trava
  }

  @override
  Future<void> fetchExercisesByRoutineId(int routineId, int instructorId, String token) async {}

  @override
  List<ExerciseModel> getExercisesForWorkout(int workoutId) => [/* dados mockados */];

  @override
  List<ExerciseModel> getExercisesForRoutine(int routineId) => [/* dados mockados */];

  // outros métodos e getters...

 @override
  List<ExerciseModel> get allExercises => [
        ExerciseModel(
          id: 1,
          name: 'Flexão',
          description: 'Peitoral e tríceps.',
          videoUrl: '',
          imageUrl: '',
          instructorId: 1,
          levelId: 1,
          goalIds: [1],
          typeIds: [1],
          modalityIds: [1],
          variationIds: [],
          hashtagIds: [1],
        )
      ];
}

class MockRoutineProvider extends RoutineProvider {
   @override
  Future<void> fetchRoutinesByWorkoutId(int workoutId, int instructorId, String token) async {}
  @override
  List<RoutineModel> getRoutinesForWorkout(int workoutId) => [];

  @override
  List<RoutineModel> get allRoutines => [
        RoutineModel(
  id: 1,
  name: 'Rotina x',
  description: 'Rotina Intensa',
  instructorId: 1,
  levelId: 1,
  goalIds: [1],
  typeIds: [1],
  modalityIds: [1],
  hashtagIds: [1],
),
];
}

void main() {
  testWidgets('WorkoutDetailPage exibe informações principais e listas mockadas', (WidgetTester tester) async {
    final mockWorkout = WorkoutModel(
      id: 1,
      name: 'Treino Especial',
      description: 'Treino completo para corpo todo.',
      numberOfDays: 5,
      imageUrl: '',
      indoor: true,
      instructorId: 1,
      levelId: 1,
      goalIds: [1],
      typeIds: [1],
      modalityIds: [1],
      hashtagIds: [1],
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ExerciseProvider>(create: (_) => MockExerciseProvider()),
          ChangeNotifierProvider<RoutineProvider>(create: (_) => MockRoutineProvider()),
          ChangeNotifierProvider<UserProvider>(
  create: (_) {
    final userProvider = UserProvider();
    userProvider.setToken('fake-token'); // ← importante!
    return userProvider;
  },
),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('pt')],
          home: WorkoutDetailPage(workout: mockWorkout),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500)); 

    expect(find.text('Treino Especial'), findsOneWidget);
    expect(find.text('Flexão'), findsOneWidget);
    expect(find.text('Rotina X'), findsOneWidget);
  });
}
