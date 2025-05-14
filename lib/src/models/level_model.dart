// lib/models/level_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'level_model.g.dart';

@JsonSerializable()
class LevelModel {
  final int id;
  final String name;
  final String description;

  LevelModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) =>
      _$LevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelModelToJson(this);
}
