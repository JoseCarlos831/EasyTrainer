// lib/models/hashtag_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'hashtag_model.g.dart';

@JsonSerializable()
class HashtagModel {
  final int id;
  final String name;

  HashtagModel({
    required this.id,
    required this.name,
  });

  factory HashtagModel.fromJson(Map<String, dynamic> json) =>
      _$HashtagModelFromJson(json);

  Map<String, dynamic> toJson() => _$HashtagModelToJson(this);
}
