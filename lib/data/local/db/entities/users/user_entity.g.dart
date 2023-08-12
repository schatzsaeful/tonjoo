// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 1;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      id: fields[0] as int?,
      createAt: fields[1] as String?,
      role: fields[2] as String?,
      emailAddress: fields[3] as String?,
      parentName: fields[4] as String?,
      studentName: fields[5] as String?,
      studentPlaceOfBirth: fields[6] as String?,
      studentDateOfBirth: fields[7] as String?,
      password: fields[8] as String?,
      learningProgram: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createAt)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.emailAddress)
      ..writeByte(4)
      ..write(obj.parentName)
      ..writeByte(5)
      ..write(obj.studentName)
      ..writeByte(6)
      ..write(obj.studentPlaceOfBirth)
      ..writeByte(7)
      ..write(obj.studentDateOfBirth)
      ..writeByte(8)
      ..write(obj.password)
      ..writeByte(9)
      ..write(obj.learningProgram);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
