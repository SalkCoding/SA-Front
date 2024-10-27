// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      count: json['count'] as int?,
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'count': instance.count,
      'posts': instance.posts,
    };

PostDataModel _$PostDataModelFromJson(Map<String, dynamic> json) =>
    PostDataModel(
      id: json['id'] as String,
      title: json['title'] as String,
      blocks: (json['blocks'] as List<dynamic>?)
          ?.map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comments.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdTime: json['createdTime'] as String,
      updatedTime: json['updatedTime'] as String,
      authorName: json['authorName'] as String,
    );

Map<String, dynamic> _$PostDataModelToJson(PostDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'blocks': instance.blocks,
      'comments': instance.comments,
      'createdTime': instance.createdTime,
      'updatedTime': instance.updatedTime,
      'authorName': instance.authorName,
    };
