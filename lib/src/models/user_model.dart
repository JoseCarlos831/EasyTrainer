// lib/src/models/user_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String email;
  final String mobileNumber;
  final DateTime birthday;
  final int age;
  final double weight;
  final double height;
  final String gender;
  final int levelId;
  final List<int> goalIds;
  final List<int> instructorIds;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.birthday,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
    required this.levelId,
    required this.goalIds,
    required this.instructorIds,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? mobileNumber,
    DateTime? birthday,
    double? weight,
    double? height,
    String? gender,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      birthday: birthday ?? this.birthday,
      age: age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      gender: gender ?? this.gender,
      levelId: levelId,
      goalIds: goalIds,
      instructorIds: instructorIds,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
