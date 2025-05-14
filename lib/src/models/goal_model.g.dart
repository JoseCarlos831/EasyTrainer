// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalModel _$GoalModelFromJson(Map<String, dynamic> json) => GoalModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$GoalModelToJson(GoalModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
};
