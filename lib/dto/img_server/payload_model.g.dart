// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayloadModelImpl _$$PayloadModelImplFromJson(Map<String, dynamic> json) =>
    _$PayloadModelImpl(
      userID: json['userID'] as int?,
      field: json['field'] as String?,
      fileName: json['fileName'] as String?,
    );

Map<String, dynamic> _$$PayloadModelImplToJson(_$PayloadModelImpl instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'field': instance.field,
      'fileName': instance.fileName,
    };
