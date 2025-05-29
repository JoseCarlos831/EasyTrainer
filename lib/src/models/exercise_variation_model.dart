class ExerciseVariationModel {
  
  final int id;
  final int exerciseId;
  final String name;
  final String description;
  final String videoUrl;
  final String imageUrl;

  ExerciseVariationModel({
    required this.id,
    required this.exerciseId,
    required this.name,
    required this.description,
    required this.videoUrl,
    required this.imageUrl,
  });

  factory ExerciseVariationModel.fromJson(Map<String, dynamic> json) {
    return ExerciseVariationModel(
      id: json['id'],
      exerciseId: json['exerciseId'],
      name: json['name'],
      description: json['description'],
      videoUrl: json['videoUrl'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exerciseId': exerciseId,
      'name': name,
      'description': description,
      'videoUrl': videoUrl,
      'imageUrl': imageUrl,
    };
  }
}
