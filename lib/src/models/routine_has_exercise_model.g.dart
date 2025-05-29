// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_has_exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutineHasExerciseModel _$RoutineHasExerciseModelFromJson(
  Map<String, dynamic> json,
) => RoutineHasExerciseModel(
  routineId: (json['routineId'] as num).toInt(),
  exerciseId: (json['exerciseId'] as num).toInt(),
  order: (json['order'] as num).toInt(),
  sets: (json['sets'] as num).toInt(),
  reps: (json['reps'] as num).toInt(),
  restTime: RoutineHasExerciseModel._parseDuration(json['restTime'] as String),
  note: json['note'] as String,
  day: (json['day'] as num).toInt(),
  week: (json['week'] as num).toInt(),
  isOptional: json['isOptional'] as bool,
);

Map<String, dynamic> _$RoutineHasExerciseModelToJson(
  RoutineHasExerciseModel instance,
) => <String, dynamic>{
  'routineId': instance.routineId,
  'exerciseId': instance.exerciseId,
  'order': instance.order,
  'sets': instance.sets,
  'reps': instance.reps,
  'restTime': RoutineHasExerciseModel._durationToString(instance.restTime),
  'note': instance.note,
  'day': instance.day,
  'week': instance.week,
  'isOptional': instance.isOptional,
};
