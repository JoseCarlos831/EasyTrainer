import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // Necessário para SharedPreferences

  group('LanguageProvider Test', () {
    late LanguageProvider languageProvider;

    setUp(() async {
      SharedPreferences.setMockInitialValues({}); // Limpa prefs simuladas
      languageProvider = LanguageProvider();
    });

    test('Deve iniciar com idioma padrão inglês (en)', () {
      expect(languageProvider.locale.languageCode, 'en');
    });

    test('Deve mudar idioma para português (pt) e persistir', () async {
      await languageProvider.setLocale(const Locale('pt'));

      expect(languageProvider.locale.languageCode, 'pt');

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('language_code'), 'pt');
    });

    test('Deve carregar idioma salvo ao iniciar', () async {
      SharedPreferences.setMockInitialValues({'language_code': 'es'});

      final provider = LanguageProvider();
      await provider.loadLocale();

      expect(provider.locale.languageCode, 'es');
    });
  });
}
