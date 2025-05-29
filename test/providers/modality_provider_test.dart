import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/modality_model.dart';
import 'package:personalapp/src/providers/modality_provider.dart';
import 'package:personalapp/src/services/modality_service.dart';

// Serviço simulado
class FakeModalityService extends ModalityService {
  @override
  Future<List<ModalityModel>> fetchModalities(String token) async {
    return [
      ModalityModel(id: 1, name: 'Crossfit', description: 'Treino intenso'),
      ModalityModel(id: 2, name: 'Yoga', description: 'Equilíbrio corpo e mente'),
    ];
  }

  @override
  Future<ModalityModel?> fetchById(int id, String token) async {
    return ModalityModel(
      id: id,
      name: 'Fake $id',
      description: 'Descrição fake $id',
    );
  }
}

void main() {
  late ModalityProvider provider;

  setUp(() {
    provider = ModalityProvider(modalityService: FakeModalityService());
  });

  test('Deve iniciar com lista vazia e loading false', () {
    expect(provider.modalities, isEmpty);
    expect(provider.isLoading, false);
  });

  test('Deve buscar modalidades com sucesso', () async {
    await provider.fetchModalities('fake-token');

    expect(provider.modalities.length, 2);
    expect(provider.modalities.first.name, 'Crossfit');
    expect(provider.isLoading, false);
  });

  test('Deve buscar apenas modalidades ausentes por ID', () async {
    await provider.fetchModalities('fake-token');

    await provider.fetchMissingModalities([1, 2, 3], 'fake-token');

    final ids = provider.modalities.map((m) => m.id).toSet();
    expect(ids.containsAll([1, 2, 3]), true);
  });

  test('Deve limpar todas as modalidades', () {
    provider.clear();
    expect(provider.modalities, isEmpty);
    expect(provider.isLoading, false);
  });
}
