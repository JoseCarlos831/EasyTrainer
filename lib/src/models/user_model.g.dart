// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  mobileNumber: json['mobileNumber'] as String,
  birthday: DateTime.parse(json['birthday'] as String),
  age: (json['age'] as num).toInt(),
  weight: (json['weight'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  gender: json['gender'] as String,
  levelId: (json['levelId'] as num).toInt(),
  goalIds: (json['goalIds'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  instructorIds: (json['instructorIds'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'mobileNumber': instance.mobileNumber,
  'birthday': instance.birthday.toIso8601String(),
  'age': instance.age,
  'weight': instance.weight,
  'height': instance.height,
  'gender': instance.gender,
  'levelId': instance.levelId,
  'goalIds': instance.goalIds,
  'instructorIds': instance.instructorIds,
};
