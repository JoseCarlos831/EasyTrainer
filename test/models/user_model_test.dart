import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/user_model.dart';

void main() {
  group('UserModel Test', () {
    final mockJson = {
      'id': 1,
      'name': 'Alice Silva',
      'email': 'alice@example.com',
      'mobileNumber': '+5511988887777',
      'birthday': '1995-05-20T00:00:00.000',
      'age': 29,
      'gender': 'female',
      'weight': 65.5,
      'height': 1.70,
      'levelId': 2,
      'goalIds': [3, 4],
      'instructorIds': [5, 6],
    };

    test('Deve criar uma instância de UserModel corretamente', () {
      final user = UserModel(
        id: 1,
        name: 'Alice Silva',
        email: 'alice@example.com',
        mobileNumber: '+5511988887777',
        birthday: DateTime(1995, 5, 20),
        age: 29,
        gender: 'female',
        weight: 65.5,
        height: 1.70,
        levelId: 2,
        goalIds: [3, 4],
        instructorIds: [5, 6],
      );

      expect(user, isA<UserModel>());
      expect(user.id, 1);
      expect(user.name, 'Alice Silva');
      expect(user.email, 'alice@example.com');
      expect(user.mobileNumber, '+5511988887777');
      expect(user.birthday, DateTime(1995, 5, 20));
      expect(user.age, 29);
      expect(user.gender, 'female');
      expect(user.weight, 65.5);
      expect(user.height, 1.70);
      expect(user.levelId, 2);
      expect(user.goalIds, containsAll([3, 4]));
      expect(user.instructorIds, containsAll([5, 6]));
    });

    test('Deve converter de JSON para UserModel corretamente', () {
      final user = UserModel.fromJson(mockJson);

      expect(user.id, 1);
      expect(user.name, 'Alice Silva');
      expect(user.email, 'alice@example.com');
      expect(user.mobileNumber, '+5511988887777');
      expect(user.birthday, DateTime(1995, 5, 20));
      expect(user.age, 29);
      expect(user.gender, 'female');
      expect(user.weight, 65.5);
      expect(user.height, 1.70);
      expect(user.levelId, 2);
      expect(user.goalIds, containsAll([3, 4]));
      expect(user.instructorIds, containsAll([5, 6]));
    });

    test('Deve converter UserModel para JSON corretamente', () {
      final user = UserModel.fromJson(mockJson);
      final json = user.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'Alice Silva');
      expect(json['email'], 'alice@example.com');
      expect(json['mobileNumber'], '+5511988887777');
      expect(json['birthday'], '1995-05-20T00:00:00.000');
      expect(json['age'], 29);
      expect(json['gender'], 'female');
      expect(json['weight'], 65.5);
      expect(json['height'], 1.70);
      expect(json['levelId'], 2);
      expect(json['goalIds'], containsAll([3, 4]));
      expect(json['instructorIds'], containsAll([5, 6]));
    });
  });
}
