import 'package:air_front/dto/block/block.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:air_front/dto/comments/comments.dart';

part 'post.g.dart';

abstract class PostBase{}

class PostLoading extends PostBase{}

class PostError extends PostBase{
  final String msg;

  PostError({
    required this.msg,
  });
}

@JsonSerializable()
class PostModel extends PostBase{
  final int? count;
  final List<PostDataModel> posts;

  PostModel({
    this.count,
    required this.posts,
  });

  PostModel copywith({
    int? count,
    List<PostDataModel>? posts,
  }) {
    return PostModel(
      count: count ?? this.count,
      posts: posts ?? this.posts,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
  
}

@JsonSerializable()
class PostDataModel extends PostBase{

  final String id;
  final String title;
  final List<Block>? blocks;
  final List<Comments>? comments;
  final String createdTime;
  final String updatedTime;
  final String authorName;

  PostDataModel({
    required this.id,
    required this.title,
    this.blocks,
    this.comments,
    required this.createdTime,
    required this.updatedTime,
    required this.authorName,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) => _$PostDataModelFromJson(json);
}
