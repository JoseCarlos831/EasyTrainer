// lib/models/exercise_variation_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'exercise_variation_model.g.dart';

@JsonSerializable()
class ExerciseVariationModel {
  final int variationId;
  final String variationName;
  final String variationImageUrl;

  ExerciseVariationModel({
    required this.variationId,
    required this.variationName,
    required this.variationImageUrl,
  });

  factory ExerciseVariationModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseVariationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseVariationModelToJson(this);
}
