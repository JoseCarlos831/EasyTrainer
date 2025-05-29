import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/hashtag_model.dart';

void main() {
  group('HashtagModel Test', () {
    // Dados simulados (mock) para o teste
    final mockJson = {
      'id': 1,
      'name': 'Fitness',
    };

    test('Deve criar uma instância de HashtagModel corretamente', () {
      final hashtag = HashtagModel(
        id: 1,
        name: 'Fitness',
      );

      expect(hashtag, isA<HashtagModel>());
      expect(hashtag.id, 1);
      expect(hashtag.name, 'Fitness');
    });

    test('Deve converter de JSON para HashtagModel corretamente', () {
      final hashtag = HashtagModel.fromJson(mockJson);

      expect(hashtag.id, 1);
      expect(hashtag.name, 'Fitness');
    });

    test('Deve converter HashtagModel para JSON corretamente', () {
      final hashtag = HashtagModel.fromJson(mockJson);
      final json = hashtag.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Fitness');
    });
  });
}
