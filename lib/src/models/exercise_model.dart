// lib/models/exercise_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'exercise_model.g.dart';

@JsonSerializable()
class ExerciseModel {
  final int id;
  final String name;
  final String? description;
  final String? equipment;

  @JsonKey(fromJson: _parseDurationNullable, toJson: _durationToStringNullable)
  final Duration? duration;

  final int? repetition;
  final int? sets;

  @JsonKey(name: 'restTime', fromJson: _parseDurationNullable, toJson: _durationToStringNullable)
  final Duration? restTime;

  final String? bodyPart;
  final String? videoUrl;
  final String? imageUrl;
  final String? steps;
  final String? contraindications;
  final String? safetyTips;
  final String? commonMistakes;
  final String? indicatedFor;
  final double? caloriesBurnedEstimate;

  final int instructorId;
  final int levelId;

  final List<int> goalIds;
  final List<int> typeIds;
  final List<int> modalityIds;
  final List<int> hashtagIds;
  final List<int> variationIds;

  ExerciseModel({
    required this.id,
    required this.name,
    this.description,
    this.equipment,
    this.duration,
    this.repetition,
    this.sets,
    this.restTime,
    this.bodyPart,
    this.videoUrl,
    this.imageUrl,
    this.steps,
    this.contraindications,
    this.safetyTips,
    this.commonMistakes,
    this.indicatedFor,
    this.caloriesBurnedEstimate,
    required this.instructorId,
    required this.levelId,
    required this.goalIds,
    required this.typeIds,
    required this.modalityIds,
    required this.hashtagIds,
    required this.variationIds,
  });

 factory ExerciseModel.fromJson(Map<String, dynamic> json) {
  return ExerciseModel(
    id: json['id'] ?? 0,
    name: json['name']?.toString() ?? '',
    description: json['description']?.toString(),
    duration: json['duration'] != null ? Duration(seconds: json['duration']) : null,
    instructorId: json['instructorId'] ?? 0,
    levelId: json['levelId'] ?? 0,
    goalIds: List<int>.from(json['goalIds'] ?? []),
    typeIds: List<int>.from(json['typeIds'] ?? []),
    modalityIds: List<int>.from(json['modalityIds'] ?? []),
    hashtagIds: List<int>.from(json['hashtagIds'] ?? []),
    variationIds: List<int>.from(json['variationIds'] ?? []),
  );
}


  Map<String, dynamic> toJson() => _$ExerciseModelToJson(this);

  static Duration? _parseDurationNullable(String? time) {
    if (time == null) return null;
    final parts = time.split(':');
    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);
    final seconds = int.parse(parts[2].split('.').first);
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  static String? _durationToStringNullable(Duration? duration) {
    if (duration == null) return null;
    return duration.toString().split('.').first.padLeft(8, '0');
  }
}
