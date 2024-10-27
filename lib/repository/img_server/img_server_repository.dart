import 'package:air_front/config/dio.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/img_server/token_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart' hide Headers;

final imgServerRepository = Provider<ImgServerRepository>((ref) {
  final dio = ref.watch(dioProvider);
  String baseUrl = BASE_URL + 'file/';
  return ImgServerRepository(dio, baseUrl: baseUrl);
});

class ImgServerRepository {
  final String baseUrl;
  final Dio dio;

  ImgServerRepository(this.dio, {required this.baseUrl});

  // issue 토큰 생성
  Future<String> getToken({
    required String issue,
  }) async {
    try{
      print(baseUrl + 'token/$issue');
      final resp = await dio.get(baseUrl + 'token/$issue');
      print("첫 출력 $resp");
      print("데이터 타입 : ${resp.data.runtimeType}");
      return resp.data[0];
    }on DioException catch (e) {
      print(e);
      print(e.response!.data);
      return "오류";
    }
  }

  // 이미지 업로드
  Future<TokenModel> uploadImage({
    required FormData file,
    required String token,
  }) async {
    print(file);
    final resp = await dio.post(baseUrl + '/image', data: file, queryParameters: {IMAGE_TOKEN : token});
    return TokenModel.fromJson(resp.data);
  }
}


