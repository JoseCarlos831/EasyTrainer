import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/screens/private/home/workout_section.dart';
import 'package:personalapp/src/providers/workout_provider.dart';
import 'package:personalapp/src/models/workout_model.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MockWorkoutProvider extends WorkoutProvider{
  @override
  List<WorkoutModel> get allWorkouts => [
        WorkoutModel(
  id: 1,
  name: 'Treino A',
  description: 'Treino de membros superiores',
  numberOfDays: 5,
  imageUrl: 'https://example.com/workout.png',
  indoor: true,
  instructorId: 2,
  levelId: 1,
  goalIds: [1],
  typeIds: [1],
  modalityIds: [1],
  hashtagIds: [1],
),
];

@override
  List<WorkoutModel> get userWorkouts => [];

  @override
  bool get isLoading => false;

  @override
  void clear() {}

}

void main() {
  testWidgets('WorkoutSection renderiza com treino mockado', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<WorkoutProvider>(
  create: (_) => MockWorkoutProvider(),
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
          home: const Scaffold(
            body: WorkoutSection(searchQuery: ''),
          ),
        ),
      ),
    );
// inicial
    await tester.pumpAndSettle(const Duration(milliseconds: 100)); // renderização completa

    expect(find.byType(WorkoutSection), findsOneWidget);
    expect(find.text('Treino A'), findsOneWidget); // nome mockado
  });
}
