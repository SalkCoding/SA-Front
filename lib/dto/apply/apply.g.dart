// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplyImpl _$$ApplyImplFromJson(Map<String, dynamic> json) => _$ApplyImpl(
      name: json['name'] as String,
      stuNum: json['stuNum'] as int,
      department: json['department'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      team: json['team'] as String,
      motivation: json['motivation'] as String,
      portfolio: json['portfolio'] as String,
    );

Map<String, dynamic> _$$ApplyImplToJson(_$ApplyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stuNum': instance.stuNum,
      'department': instance.department,
      'phone': instance.phone,
      'email': instance.email,
      'team': instance.team,
      'motivation': instance.motivation,
      'portfolio': instance.portfolio,
    };
