import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/screens/private/details/exercise_detail_page.dart';
import 'package:personalapp/src/models/exercise_model.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('ExerciseDetailPage exibe nome e descrição do exercício', (WidgetTester tester) async {
    final mockExercise = ExerciseModel(
      id: 1,
      name: 'Agachamento',
      description: 'Exercício para membros inferiores.',
      videoUrl: '',
      imageUrl: '',
      instructorId: 1,
      levelId: 1,
      goalIds: [1],
      typeIds: [1],
      modalityIds: [1],
      variationIds:[1],
      hashtagIds: [1],
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('pt')],
        home: ExerciseDetailPage(exercise: mockExercise),
      ),
    );

    expect(find.text('Agachamento'), findsOneWidget);
    expect(find.text('Exercício para membros inferiores.'), findsOneWidget);
  });
}
