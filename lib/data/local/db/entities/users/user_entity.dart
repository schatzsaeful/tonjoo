import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? username;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  String? email;

  @HiveField(4)
  String? gender;

  @HiveField(5)
  String? avatar;

  UserEntity({
    this.id,
    this.username,
    this.lastName,
    this.email,
    this.gender,
    this.avatar,
  });
}
