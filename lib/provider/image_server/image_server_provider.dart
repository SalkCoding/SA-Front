import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/img_server/response_img_model.dart';
import 'package:air_front/provider/secure_storage/secure_storage_provider.dart';
import 'package:air_front/repository/img_server/img_server_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final imageServerProvider = ChangeNotifierProvider((ref) {
  final repo = ref.watch(imgServerRepository);
  final storage = ref.watch(secureStorageProvider);

  return ImageServerNotifer(repo: repo, storage: storage);
});

class ImageServerNotifer extends ChangeNotifier {
  final ImgServerRepository repo;
  final FlutterSecureStorage storage;

  ImageServerNotifer({
    required this.repo,
    required this.storage,
  });

  // 업로드 토큰 받기
  Future<void> getToken() async {
    final resp = await repo.getToken(issue: 'upload');
    print("최종 데이터 : $resp");
    await storage.write(key: IMAGE_TOKEN, value: resp);
    print("secureStorage에 저장 완료");
  }

  // 이미지 업로드
  Future<RespImageModel?> uploadImage(FormData file) async {
    final token = await storage.read(key: IMAGE_TOKEN);
    print(token);
    if(token != null){
      final resp = await repo.uploadImage(token: token, file: file);
      print(resp);
    }else{
      print("토큰 없음");
      return null;
    }
  }
}
