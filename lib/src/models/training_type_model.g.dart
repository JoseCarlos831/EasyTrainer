// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingTypeModel _$TrainingTypeModelFromJson(Map<String, dynamic> json) =>
    TrainingTypeModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TrainingTypeModelToJson(TrainingTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
