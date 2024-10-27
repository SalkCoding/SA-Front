import 'dart:convert';
import 'package:air_front/config/dio.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/users/users.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final userRepository = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return UserRepository(dio, baseUrl: AUTH_URL);
});

class UserRepository {
  final String baseUrl;
  final Dio dio;

  UserRepository(this.dio,{
    required this.baseUrl,
  });

  // 로그인
  Future<UsersBase> login({
    required String id,
    required String pw,
  }) async {
    try{
      final url = '${BASE_URL}user/login';
      final data = {'studentNum' : id, 'password':pw};
      final resp = await dio.post(url, data: data);
      print(data);
      if(resp.statusCode == 200){
        print('성공');
        print(resp.data);
        return Users.fromJson(resp.data);
      }else{
        print('실패');
        return UsersError(msg: '에러가 발생하였습니다.');
      }
      } catch (e){
        print(e);
        return UsersError(msg: '에러가 발생하였습니다.');
      }
  }

  // 회원가입
  Future<bool> signup({
    required Users user,
  }) async {
    final url = '${BASE_URL}user';
    print(user.toJson());
    final resp = await dio.post(url, data: user.toJson());
    if(resp.statusCode == 200){
      print('성공');
      return true;
    }else{
      print('실패');
      return false;
    }
  }

  // 이미지 OCR 확인 및 유저 정보 반환
  Future<UsersBase> imageUpload(
      {required String fileName, required String base64Image}) async {
    final imageFormat = fileName.split('.')[1];
    final data = {'imageFormat': imageFormat, 'encodedImage': base64Image};
    var url = '${baseUrl}user/ocr';

    final resp = await dio.post(url, data: jsonEncode(data));

    if (resp.statusCode == 200) {
      print('성공');
      print(resp.data);
      return Users.fromJson(resp.data);
    } else {
      print('실패');
      print(resp.statusCode);
      print(resp.statusMessage);
      print(resp.data);
      return UsersError(msg: '에러가 발생하였습니다.');
    }
  }

  // 휴대폰 인증번호 받기
  Future<void> requestNum({
    required String phoneNum,
  }) async {
    var url = '${baseUrl}user/phone';
    final data = {'phoneNumber': phoneNum};

    print(data);
    print(url);
    final resp = await dio.post(url, data: jsonEncode(data));
    if (resp.statusCode == 200) {
      print(resp.data);
      print('성공');
      
    } else {
      print(resp.statusCode);
      print(resp.statusMessage);
      
    }
  }

  // 휴대폰 인증번호 인증
  Future<bool> responseNum({
    required String phoneNum,
    required String authNum,
  }) async {
    var url = '${baseUrl}user/phone/check';
    final data = {'phoneNumber': phoneNum, 'certificationNumber': authNum};
    try {
      final resp = await dio.post(url, data: jsonEncode(data));
      if (resp.statusCode == 200) {
        print(resp.data);
        return true;
      } else {
        print(resp.statusCode);
        print(resp.statusMessage);
        print('성공');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
