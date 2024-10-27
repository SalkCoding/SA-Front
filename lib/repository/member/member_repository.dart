
import 'package:air_front/config/dio.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/member/member_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memberResitory = Provider((ref) {
  final dio = ref.watch(dioProvider);
  final baseUrl = BASE_URL;

  return MemberRepository(dio: dio, baseUrl: baseUrl);
});

class MemberRepository{
  final Dio dio;
  final String baseUrl;

  MemberRepository({
    required this.dio,
    required this.baseUrl,
  });

  Future<MemberBase> getMembers() async {
    try{
      final resp = await dio.get(baseUrl + 'people');
      final data = {"data" : resp.data};
      return MemberList.fromJson(data);
    }catch(e){
      return MemberError(msg: "에러가 발생하였습니다.\n다시 시도해주세요.");
    }
  }
}