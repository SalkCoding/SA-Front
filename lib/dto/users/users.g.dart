// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as int?,
      name: json['name'] as String,
      studentNum: json['studentNum'] as String,
      college: json['college'] as String?,
      major: json['major'] as String?,
      password: json['password'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      grade: json['grade'] as int?,
      birth: json['birth'] as String?,
      level: json['level'] as String?,
      cell: json['cell'] as String?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'studentNum': instance.studentNum,
      'college': instance.college,
      'major': instance.major,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'grade': instance.grade,
      'birth': instance.birth,
      'level': instance.level,
      'cell': instance.cell,
    };
