// lib/models/training_type_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'training_type_model.g.dart';

@JsonSerializable()
class TrainingTypeModel {
  final int id;
  final String name;
  final String description;

  TrainingTypeModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory TrainingTypeModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingTypeModelToJson(this);
}
