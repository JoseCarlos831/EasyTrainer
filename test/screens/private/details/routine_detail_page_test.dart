import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/screens/private/details/routine_detail_page.dart';
import 'package:personalapp/src/models/routine_model.dart';
import 'package:personalapp/src/models/exercise_model.dart';
import 'package:personalapp/src/providers/exercise_provider.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MockExerciseProvider extends ExerciseProvider {
  @override
  List<ExerciseModel> get allExercises => [
        ExerciseModel(
          id: 1,
          name: 'Flexão de Braço',
          description: 'Peitoral e tríceps.',
          videoUrl: '',
          imageUrl: '',
          instructorId: 1,
          levelId: 1,
          goalIds: [1],
          typeIds: [1],
          modalityIds: [1],
          variationIds: [1],
          hashtagIds: [1],
        )
      ];
}


void main() {
  testWidgets('RoutineDetailPage renderiza nome e exercício', (WidgetTester tester) async {
    final mockRoutine = RoutineModel(
  id: 1,
  name: 'Rotina A',
  description: 'Rotina de Exemplo',
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
      ChangeNotifierProvider<ExerciseProvider>(
        create: (_) => MockExerciseProvider(),
      ),
      ChangeNotifierProvider<UserProvider>(
        create: (_) => UserProvider(), // Esse estava faltando
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
      home: RoutineDetailPage(routine: mockRoutine),
    ),
  ),
);


    await tester.pumpAndSettle();

    expect(find.text('Rotina A'), findsOneWidget);
    expect(find.text('Flexão de Braço'), findsOneWidget);
  });
  
}

