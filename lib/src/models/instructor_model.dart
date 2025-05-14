// lib/models/instructor_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'instructor_model.g.dart';

@JsonSerializable()
class InstructorModel {
  final int id;
  final String name;
  final String email;
  final String mobileNumber;
  final DateTime birthday;
  final int age;
  final String gender;

  InstructorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.birthday,
    required this.age,
    required this.gender,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) =>
      _$InstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$InstructorModelToJson(this);
}
