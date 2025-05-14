// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstructorModel _$InstructorModelFromJson(Map<String, dynamic> json) =>
    InstructorModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      mobileNumber: json['mobileNumber'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$InstructorModelToJson(InstructorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'birthday': instance.birthday.toIso8601String(),
      'age': instance.age,
      'gender': instance.gender,
    };
