// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestTokenModelImpl _$$RequestTokenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestTokenModelImpl(
      issuer: json['issuer'] as String? ?? 'AIIA_AIR',
      permission: json['permission'] as String,
      payload: json['payload'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$RequestTokenModelImplToJson(
        _$RequestTokenModelImpl instance) =>
    <String, dynamic>{
      'issuer': instance.issuer,
      'permission': instance.permission,
      'payload': instance.payload,
    };
