// lib/models/workout_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'workout_model.g.dart';

@JsonSerializable()
class WorkoutModel {
  final int id;
  final String name;
  final String description;
  final int numberOfDays;
  final String? imageUrl;

  @JsonKey(fromJson: _parseDurationNullable, toJson: _durationToStringNullable)
  final Duration? duration;

  final bool indoor;
  final int instructorId;
  final int levelId;
  final List<int> goalIds;
  final List<int> typeIds;
  final List<int> modalityIds;
  final List<int> hashtagIds;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.description,
    required this.numberOfDays,
    required this.imageUrl,
    this.duration,
    required this.indoor,
    required this.instructorId,
    required this.levelId,
    required this.goalIds,
    required this.typeIds,
    required this.modalityIds,
    required this.hashtagIds,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutModelToJson(this);

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
