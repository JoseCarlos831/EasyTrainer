import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/user_model.dart';
import 'package:personalapp/src/providers/user_provider.dart';
import 'package:personalapp/src/services/user_service.dart';

// Serviço simulado
class FakeUserService extends UserService {
  @override
  Future<bool> updateUser(UserModel user, String token) async {
    return true;
  }

  @override
  Future<bool> changePassword({
    required int userId,
    required String currentPassword,
    required String newPassword,
    required String token,
  }) async {
    return currentPassword == '123456';
  }

  @override
  Future<bool> deleteAccount(int userId, String token) async {
    return true;
  }
}

void main() {
  late UserProvider provider;
  final user = UserModel(
    id: 1,
    name: 'Alice',
    email: 'alice@example.com',
    mobileNumber: '+5511988888888',
    birthday: DateTime(1995, 5, 20),
    age: 28,
    gender: 'female',
    weight: 65.0,
    height: 1.70,
    levelId: 1,
    goalIds: [1],
    instructorIds: [1],
  );

  setUp(() {
    provider = UserProvider(userService: FakeUserService());
  });

  test('Deve definir o usuário corretamente', () {
    provider.setUser(user, 'token123');
    expect(provider.user, isNotNull);
    expect(provider.user!.name, 'Alice');
    expect(provider.token, 'token123');
  });

  test('Deve limpar usuário e token', () {
    provider.setUser(user, 'token123');
    provider.clear();
    expect(provider.user, isNull);
    expect(provider.token, isNull);
  });

  test('Deve atualizar usuário com sucesso', () async {
    provider.setUser(user, 'token123');
    final result = await provider.updateUser(user);
    expect(result, true);
    expect(provider.user!.name, 'Alice');
  });

  test('Deve trocar senha com sucesso', () async {
    provider.setUser(user, 'token123');
    final result = await provider.changePassword('123456', 'novaSenha');
    expect(result, true);
  });

  test('Deve falhar ao trocar senha com senha atual incorreta', () async {
    provider.setUser(user, 'token123');
    final result = await provider.changePassword('errada', 'novaSenha');
    expect(result, false);
  });

  test('Deve deletar conta e limpar usuário', () async {
    provider.setUser(user, 'token123');
    final result = await provider.deleteAccount();
    expect(result, true);
    expect(provider.user, isNull);
    expect(provider.token, isNull);
  });
}
