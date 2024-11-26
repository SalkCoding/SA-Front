import 'package:freezed_annotation/freezed_annotation.dart';

part 'block.freezed.dart';
part 'block.g.dart';

@freezed
class Block with _$Block {

  factory Block({required int order, required String type, required String content}) = _Block;

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}