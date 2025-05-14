// lib/models/modality_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'modality_model.g.dart';

@JsonSerializable()
class ModalityModel {
  final int id;
  final String name;
  final String description;

  ModalityModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory ModalityModel.fromJson(Map<String, dynamic> json) =>
      _$ModalityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModalityModelToJson(this);
}
