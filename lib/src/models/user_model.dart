import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String email;
  final String mobileNumber;
  final DateTime birthday;
  final int age;
  final double weight;
  final double height;
  final String gender;
  final int levelId;
  final List<int> goalIds;
  final List<int> instructorIds;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.birthday,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
    required this.levelId,
    required this.goalIds,
    required this.instructorIds,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
