import 'package:freezed_annotation/freezed_annotation.dart';

part 'comments.freezed.dart';
part 'comments.g.dart';

@freezed
class Comments with _$Comments {

  factory Comments({required int id, required String author, required String content}) = _Comments;

  factory Comments.fromJson(Map<String, dynamic> json) => _$CommentsFromJson(json);
}