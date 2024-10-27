
import 'package:json_annotation/json_annotation.dart';

part 'member_model.g.dart';

class MemberBase{}

class MemberLoading extends MemberBase {}

class MemberError extends MemberBase {
  final String msg;

  MemberError({
    required this.msg,
  });
}

@JsonSerializable()
class MemberList extends MemberBase {
  final List<MemberModel> data;

  MemberList({
    required this.data,
  });

  factory MemberList.fromJson(Map<String, dynamic> json) => _$MemberListFromJson(json);
}

@JsonSerializable()
class MemberModel{
  final int userId;
  final String name;
  final String major;
  final String level;
  final String cell;
  final String? img;

  MemberModel({
    required this.userId,
    required this.name,
    required this.major,
    required this.level,
    required this.cell,
    this.img,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) => _$MemberModelFromJson(json);
}

class TeamData{
  final int totalCount;
  final String teamName;
  final List<MemberModel> list;

  TeamData({
    required this.totalCount,
    required this.teamName,
    required this.list,
  });
}