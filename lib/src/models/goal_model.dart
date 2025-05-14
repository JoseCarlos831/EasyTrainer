// lib/models/goal_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'goal_model.g.dart';

@JsonSerializable()
class GoalModel {
  final int id;
  final String name;
  final String description;

  GoalModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoalModelToJson(this);
}
