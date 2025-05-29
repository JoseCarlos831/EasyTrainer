import 'package:flutter_test/flutter_test.dart';
import 'package:personalapp/src/models/instructor_model.dart';

void main() {
  group('InstructorModel Test', () {
    // Dados simulados (mock) para o teste
    final mockJson = {
      'id': 1,
      'name': 'John Doe',
      'email': 'john@example.com',
      'mobileNumber': '+5511999999999',
      'birthday': "2025-02-29",
      'age': '19',
      'gender': 'female'
    };

    test('Deve criar uma instância de InstructorModel corretamente', () {
      final instructor = InstructorModel(
        id: 1,
        name: 'John Doe',
        email: 'john@example.com',
        mobileNumber: '+5511999999999',
       birthday: DateTime(2025, 02, 29),
        age: 19, 
        gender: 'female',
      );

      expect(instructor, isA<InstructorModel>());
      expect(instructor.id, 1);
      expect(instructor.name, 'John Doe');
      expect(instructor.email, 'john@example.com');
      expect(instructor.mobileNumber, '+5511999999999');
      expect(instructor.birthday, "2025-02-29"
);
      expect(instructor.age, '16');
      expect(instructor.gender, 'female');
      
    });

    test('Deve converter de JSON para InstructorModel corretamente', () {
      final instructor = InstructorModel.fromJson(mockJson);

      expect(instructor.id, 1);
      expect(instructor.name, 'John Doe');
      expect(instructor.email, 'john@example.com');
      expect(instructor.mobileNumber, '+5511999999999');
      expect(instructor.birthday, "2025-02-29");
      expect(instructor.age, '16');
      expect(instructor.gender, 'female');
    });

    test('Deve converter InstructorModel para JSON corretamente', () {
      final instructor = InstructorModel.fromJson(mockJson);
      final json = instructor.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'John Doe');
      expect(json['email'], 'john@example.com');
      expect(json['mobileNumber'], '+5511999999999');
      expect(json['birthday'], '2025, 02, 29');
      expect(json['age'], '16');
      expect(json['gender'], 'female');
    });
  });
}
