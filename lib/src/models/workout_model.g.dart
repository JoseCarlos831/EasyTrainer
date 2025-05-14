// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutModel _$WorkoutModelFromJson(Map<String, dynamic> json) => WorkoutModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  numberOfDays: (json['numberOfDays'] as num).toInt(),
  imageUrl: json['imageUrl'] as String?,
  duration: WorkoutModel._parseDurationNullable(json['duration'] as String?),
  indoor: json['indoor'] as bool,
  instructorId: (json['instructorId'] as num).toInt(),
  levelId: (json['levelId'] as num).toInt(),
  goalIds:
      (json['goalIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  typeIds:
      (json['typeIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  modalityIds:
      (json['modalityIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
  hashtagIds:
      (json['hashtagIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
);

Map<String, dynamic> _$WorkoutModelToJson(WorkoutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'numberOfDays': instance.numberOfDays,
      'imageUrl': instance.imageUrl,
      'duration': WorkoutModel._durationToStringNullable(instance.duration),
      'indoor': instance.indoor,
      'instructorId': instance.instructorId,
      'levelId': instance.levelId,
      'goalIds': instance.goalIds,
      'typeIds': instance.typeIds,
      'modalityIds': instance.modalityIds,
      'hashtagIds': instance.hashtagIds,
    };
