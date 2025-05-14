// lib/models/routine_model.dart

class RoutineModel {
  final int id;
  final String name;
  final String? description;
  final Duration? duration;
  final String? imageUrl;
  final int instructorId;
  final int levelId;
  final List<int> goalIds;
  final List<int> typeIds;
  final List<int> modalityIds;
  final List<int> hashtagIds;

  RoutineModel({
    required this.id,
    required this.name,
    this.description,
    this.duration,
    this.imageUrl,
    required this.instructorId,
    required this.levelId,
    required this.goalIds,
    required this.typeIds,
    required this.modalityIds,
    required this.hashtagIds,
  });

  factory RoutineModel.fromJson(Map<String, dynamic> json) {
    return RoutineModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'] != null
          ? Duration(seconds: _parseTimeSpanToSeconds(json['duration']))
          : null,
      imageUrl: json['imageUrl'],
      instructorId: json['instructorId'],
      levelId: json['levelId'],
      goalIds: List<int>.from(json['goalIds'] ?? []),
      typeIds: List<int>.from(json['typeIds'] ?? []),
      modalityIds: List<int>.from(json['modalityIds'] ?? []),
      hashtagIds: List<int>.from(json['hashtagIds'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'duration': duration != null ? _durationToTimeString(duration!) : null,
      'imageUrl': imageUrl,
      'instructorId': instructorId,
      'levelId': levelId,
      'goalIds': goalIds,
      'typeIds': typeIds,
      'modalityIds': modalityIds,
      'hashtagIds': hashtagIds,
    };
  }

  static int _parseTimeSpanToSeconds(String time) {
    final parts = time.split(':');
    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);
    final seconds = int.parse(parts[2].split('.')[0]);
    return Duration(hours: hours, minutes: minutes, seconds: seconds).inSeconds;
  }

  static String _durationToTimeString(Duration duration) {
    return duration.toString().split('.').first.padLeft(8, "0");
  }
}
