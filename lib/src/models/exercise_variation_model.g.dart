// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_variation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseVariationModel _$ExerciseVariationModelFromJson(
  Map<String, dynamic> json,
) => ExerciseVariationModel(
  variationId: (json['variationId'] as num).toInt(),
  variationName: json['variationName'] as String,
  variationImageUrl: json['variationImageUrl'] as String,
);

Map<String, dynamic> _$ExerciseVariationModelToJson(
  ExerciseVariationModel instance,
) => <String, dynamic>{
  'variationId': instance.variationId,
  'variationName': instance.variationName,
  'variationImageUrl': instance.variationImageUrl,
};
