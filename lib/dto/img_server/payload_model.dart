import 'package:freezed_annotation/freezed_annotation.dart';

part 'payload_model.freezed.dart';
part 'payload_model.g.dart';

@freezed
class PayloadModel with _$PayloadModel {

  factory PayloadModel({
    int? userID,
    String? field,
    String? fileName,
  }) = _PayloadModel;

  factory PayloadModel.fromJson(Map<String, dynamic> json) => _$PayloadModelFromJson(json);
}