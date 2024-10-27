import 'package:air_front/dto/users/users.dart';
import 'package:air_front/provider/image_server/image_server_provider.dart';
import 'package:air_front/repository/user/user_repository.dart';
import 'package:dio/browser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserProvider, UsersBase?>((ref) {
  final repo = ref.watch(userRepository);
  final imgProvider = ref.watch(imageServerProvider);
  final provider = UserProvider(repo: repo, imgProvider : imgProvider);
  return provider;
});

class UserProvider extends StateNotifier<UsersBase?>{

  final UserRepository repo;
  final ImageServerNotifer imgProvider;

  UserProvider({
    required this.repo,
    required this.imgProvider,
  }):super(null);

  // 로그인
  Future<UsersBase> login({
    required String id,
    required String pw,
  }) async {
    state = UsersLoading();
    final resp = await repo.login(id: id, pw: pw);
    state = resp;
    if(state is Users){
      await imgProvider.getToken();
    }
    return resp;
  }

  // 회원가입
  Future<bool> signup(Users user) async {
    final resp = await repo.signup(user: user);
    return resp;
  }

  // 이미지 OCR
  Future<UsersBase> imgCertification({
    required String fileName,
    required String base64Image,
    required String phoneNumber,
  }) async {
    state = UsersLoading();
    final resp = await repo.imageUpload(fileName: fileName, base64Image: base64Image);
    if(resp is Users){
      state = resp.copywith(phoneNumber: phoneNumber);
    }
    print('현재 상태 : $state');
    return state!;
  }

  // 인증번호 요청
  Future<bool> requestNum(String phoneNum) async {
    try{
      repo.requestNum(phoneNum: phoneNum);
      return true;
    }catch(e){
      return false;
    }
  }

  // 인증번호 확인
  Future<bool> responseNum({
    required String phoneNum,
    required String authNum,
  }) async {
    bool returnVal = await repo.responseNum(phoneNum: phoneNum, authNum: authNum);
    return returnVal;
  }
}