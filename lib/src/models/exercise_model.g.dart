// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseModel _$ExerciseModelFromJson(
  Map<String, dynamic> json,
) => ExerciseModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  equipment: json['equipment'] as String?,
  duration: ExerciseModel._parseDurationNullable(json['duration'] as String?),
  repetition: (json['repetition'] as num?)?.toInt(),
  sets: (json['sets'] as num?)?.toInt(),
  restTime: ExerciseModel._parseDurationNullable(json['restTime'] as String?),
  bodyPart: json['bodyPart'] as String?,
  videoUrl: json['videoUrl'] as String?,
  imageUrl: json['imageUrl'] as String?,
  steps: json['steps'] as String?,
  contraindications: json['contraindications'] as String?,
  safetyTips: json['safetyTips'] as String?,
  commonMistakes: json['commonMistakes'] as String?,
  indicatedFor: json['indicatedFor'] as String?,
  caloriesBurnedEstimate: (json['caloriesBurnedEstimate'] as num?)?.toDouble(),
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
  variationIds:
      (json['variationIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
);

Map<String, dynamic> _$ExerciseModelToJson(ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'equipment': instance.equipment,
      'duration': ExerciseModel._durationToStringNullable(instance.duration),
      'repetition': instance.repetition,
      'sets': instance.sets,
      'restTime': ExerciseModel._durationToStringNullable(instance.restTime),
      'bodyPart': instance.bodyPart,
      'videoUrl': instance.videoUrl,
      'imageUrl': instance.imageUrl,
      'steps': instance.steps,
      'contraindications': instance.contraindications,
      'safetyTips': instance.safetyTips,
      'commonMistakes': instance.commonMistakes,
      'indicatedFor': instance.indicatedFor,
      'caloriesBurnedEstimate': instance.caloriesBurnedEstimate,
      'instructorId': instance.instructorId,
      'levelId': instance.levelId,
      'goalIds': instance.goalIds,
      'typeIds': instance.typeIds,
      'modalityIds': instance.modalityIds,
      'hashtagIds': instance.hashtagIds,
      'variationIds': instance.variationIds,
    };
