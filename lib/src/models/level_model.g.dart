// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelModel _$LevelModelFromJson(Map<String, dynamic> json) => LevelModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$LevelModelToJson(LevelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
