import 'package:json_annotation/json_annotation.dart';

part 'routine_has_exercise_model.g.dart';

@JsonSerializable()
class RoutineHasExerciseModel {
  final int routineId;
  final int exerciseId;
  final int order;
  final int sets;
  final int reps;

  @JsonKey(fromJson: _parseDuration, toJson: _durationToString)
  final Duration restTime;

  final String note;
  final int day;
  final int week;
  final bool isOptional;

  RoutineHasExerciseModel({
    required this.routineId,
    required this.exerciseId,
    required this.order,
    required this.sets,
    required this.reps,
    required this.restTime,
    required this.note,
    required this.day,
    required this.week,
    required this.isOptional,
  });

  factory RoutineHasExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$RoutineHasExerciseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutineHasExerciseModelToJson(this);

  static Duration _parseDuration(String time) {
    final parts = time.split(':');
    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);
    final seconds = int.parse(parts[2].split('.').first);
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  static String _durationToString(Duration duration) {
    return duration.toString().split('.').first.padLeft(8, '0');
  }
}