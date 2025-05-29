import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/screens/private/home/exercise_section.dart';
import 'package:personalapp/src/providers/exercise_provider.dart';
import 'package:personalapp/src/models/modality_model.dart';
import 'package:personalapp/src/models/exercise_model.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class MockExerciseProvider extends ExerciseProvider {
  @override
  List<ExerciseModel> get allExercises => [
        ExerciseModel(
  id: 2,
  name: 'Push Up',
  description: 'Chest exercise',
  videoUrl: '',
  imageUrl: '',
  instructorId: 1,
  levelId: 1,
  goalIds: [1],
  typeIds: [1],
  modalityIds: [1],
  hashtagIds: [1],
  variationIds:[1]
),
      ];
}

class MockModalityProvider extends ChangeNotifier {
  @override
  List<ModalityModel> get modalities => []; // Corrigido com o tipo certo
}

void main() {
  testWidgets('ExerciseSection renderiza com lista de exercícios', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<ExerciseProvider>(create: (_) => MockExerciseProvider()),
          ChangeNotifierProvider<MockModalityProvider>(create: (_) => MockModalityProvider()),
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
            body: ExerciseSection(searchQuery: ''),
          ),
        ),
      ),
    );

    expect(find.byType(ExerciseSection), findsOneWidget);
    expect(find.text('Push Up'), findsOneWidget); // Nome mockado
  });
}
