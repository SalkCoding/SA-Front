import 'package:air_front/dto/img_server/payload_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_token_model.freezed.dart';
part 'request_token_model.g.dart';

@freezed
class RequestTokenModel with _$RequestTokenModel {

  factory RequestTokenModel({
    @Default('AIIA_AIR') String issuer,
    required String permission,
    required Map<String, dynamic> payload,
  }) = _RequestTokenModel;

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) => _$RequestTokenModelFromJson(json);
}