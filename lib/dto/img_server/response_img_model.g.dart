// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_img_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RespImageModelImpl _$$RespImageModelImplFromJson(Map<String, dynamic> json) =>
    _$RespImageModelImpl(
      message: json['message'] as String,
      fileName: json['fileName'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$RespImageModelImplToJson(
        _$RespImageModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'fileName': instance.fileName,
      'date': instance.date,
    };
