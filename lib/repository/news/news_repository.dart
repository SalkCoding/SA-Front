
import 'package:air_front/config/dio.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/post/post.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newsRepositoryProvider = Provider((ref){
  final dio = ref.watch(dioProvider);
  final String baseUrl = BASE_URL + 'post';
  return NewsRepository(dio, baseUrl: baseUrl);
});

class NewsRepository{
  final Dio dio;
  final String baseUrl;

  NewsRepository(this.dio,{
    required this.baseUrl
  });

  Future<PostBase> getPost(int index) async {
    try{
      final resp = await dio.get(baseUrl + '/list/${index}');
      if(resp.statusCode == 200){
        PostModel posts = PostModel.fromJson(resp.data);
        return posts;
      }else{
        return PostError(msg: "에러가 발생하였습니다.");
      }
    }catch(e){
      print(e);
      return PostError(msg: "에러가 발생하였습니다.");
    }
  }

  Future<PostBase> getPostInfo(String id) async {
    try{
      final resp = await dio.get(baseUrl + '/$id');
      print("요청 성공");
      return PostDataModel.fromJson(resp.data);
    }catch(e){
      print(e);
      return PostError(msg: "에러가 발생하였습니다.");
    }
  } 
}