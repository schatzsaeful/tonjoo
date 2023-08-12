import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? createAt;

  @HiveField(2)
  String? role;

  @HiveField(3)
  String? emailAddress;

  @HiveField(4)
  String? parentName;

  @HiveField(5)
  String? studentName;

  @HiveField(6)
  String? studentPlaceOfBirth;

  @HiveField(7)
  String? studentDateOfBirth;

  @HiveField(8)
  String? password;

  @HiveField(9)
  String? learningProgram;

  UserEntity({
    this.id,
    this.createAt,
    this.role,
    this.emailAddress,
    this.parentName,
    this.studentName,
    this.studentPlaceOfBirth,
    this.studentDateOfBirth,
    this.password,
    this.learningProgram,
  });
}
