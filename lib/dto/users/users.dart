import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.g.dart';

abstract class UsersBase{}

class UsersLoading extends UsersBase{}

class UsersError extends UsersBase{
  final String msg;

  UsersError({
    required this.msg
  });
}

@JsonSerializable()
class Users extends UsersBase{
  final int? id;
  final String name;
  final String studentNum;
  final String? college;
  final String? major;
  final String? password;
  final String? phoneNumber;
  final int? grade;
  final String? birth;
  // final String? m_TEL;
  // final String? email;
  final String? level;
  final String? cell;
  

  Users({
    this.id,
    required this.name,
    required this.studentNum,
    this.college,
    this.major,
    this.password,
    this.phoneNumber,
    this.grade,
    this.birth,
    // this.m_TEL,
    // this.email,
    this.level,
    this.cell,
  });

  Users copywith({
    String? name,
    String? studentNum,
    String? college,
    String? major,
    String? password,
    String? phoneNumber,
  }) {
    return Users(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      studentNum: studentNum ?? this.studentNum,
      college: college ?? this.college,
      major: major ?? this.major,
      password: password ?? this.password,
    );
  }

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
