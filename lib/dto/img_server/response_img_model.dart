import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_img_model.freezed.dart';
part 'response_img_model.g.dart';

@freezed
class RespImageModel with _$RespImageModel {

  factory RespImageModel({
    required String message,
    required String fileName,
    required String date,
  }) = _RespImageModel;

  factory RespImageModel.fromJson(Map<String, dynamic> json) => _$RespImageModelFromJson(json);
}