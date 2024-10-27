// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberList _$MemberListFromJson(Map<String, dynamic> json) => MemberList(
      data: (json['data'] as List<dynamic>)
          .map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MemberListToJson(MemberList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel(
      userId: json['userId'] as int,
      name: json['name'] as String,
      major: json['major'] as String,
      level: json['level'] as String,
      cell: json['cell'] as String,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'major': instance.major,
      'level': instance.level,
      'cell': instance.cell,
      'img': instance.img,
    };
