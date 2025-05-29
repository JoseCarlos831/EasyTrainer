import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/l10n/app_localizations.dart';
import 'package:personalapp/src/models/user_model.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:personalapp/src/screens/private/delete_account_page.dart';
import 'package:provider/provider.dart';

void main() {
  group('DeleteAccountPage', () {
    late UserProvider userProvider;

    setUp(() {
      userProvider = UserProvider();
      userProvider.setUser(
        UserModel(
          id: 1,
          name: 'José da Silva',
          email: 'jose@example.com',
          birthday: DateTime(1990, 1, 1),
          weight: 70.0,
          height: 175.0,
          mobileNumber: '11999999999',
          levelId: 1,
          goalIds: [],
          age: 18,
          gender: 'female',
          instructorIds: [1],
        ),
        'fake-token',
      );
    });

    Widget createWidgetUnderTest() {
      return MaterialApp(
        locale: const Locale('pt'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [Locale('pt')],
        home: ChangeNotifierProvider<UserProvider>.value(
          value: userProvider,
          child: const DeleteAccountPage(),
        ),
      );
    }

    testWidgets('Renderiza os elementos principais da tela', (WidgetTester tester) async {
      final local = await AppLocalizations.delegate.load(const Locale('pt'));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.text('José da Silva'), findsOneWidget);
      expect(find.text(local.deleteAccountPage_deleteMyAccountButton), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('Abre o modal ao clicar em "Excluir minha conta"', (WidgetTester tester) async {
      final local = await AppLocalizations.delegate.load(const Locale('pt'));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final deleteButton = find.text(local.deleteAccountPage_deleteMyAccountButton);
      expect(deleteButton, findsOneWidget);
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();

      expect(find.text(local.deleteAccountPage_modalTitle), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('Botão de deletar só habilita com nome correto', (WidgetTester tester) async {
      final local = await AppLocalizations.delegate.load(const Locale('pt'));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      final deleteButton = find.text(local.deleteAccountPage_deleteMyAccountButton);
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();

      final textField = find.byType(TextField);
      final confirmButton = find.text(local.deleteAccountPage_modalDeleteButton);

      expect(confirmButton, findsOneWidget);
      final ElevatedButton buttonWidget = tester.widget<ElevatedButton>(find.widgetWithText(ElevatedButton, local.deleteAccountPage_modalDeleteButton));
      expect(buttonWidget.onPressed, isNull); // deve estar desabilitado

      await tester.enterText(textField, 'José da Silva');
      await tester.pumpAndSettle();

      final ElevatedButton enabledButtonWidget = tester.widget<ElevatedButton>(find.widgetWithText(ElevatedButton, local.deleteAccountPage_modalDeleteButton));
      expect(enabledButtonWidget.onPressed, isNotNull); // agora habilitado
    });
  });
}
