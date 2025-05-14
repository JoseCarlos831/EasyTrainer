// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModalityModel _$ModalityModelFromJson(Map<String, dynamic> json) =>
    ModalityModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ModalityModelToJson(ModalityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
