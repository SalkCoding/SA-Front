import 'package:air_front/config/variable.dart';
import 'package:air_front/provider/secure_storage/secure_storage_provider.dart';
import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// CustomInterceptor 추가한 Dio Provider
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  var adapter = BrowserHttpClientAdapter();
  adapter.withCredentials = true;
  dio.httpClientAdapter = adapter;

  //final storage = ref.watch(secureStorageProvider);

  //dio.interceptors.add(CustomInterceptor(storage: storage, ref: ref));

  return dio;
});

// CustomInterceptor
// 로그인한 대상에 한해서
// 알아서 이미지 파일 서버 토큰을 받을 수 있도록 진행한다.
class CustomInterceptor extends Interceptor{
  final FlutterSecureStorage storage;
  final Ref ref;

  CustomInterceptor({
    required this.storage,
    required this.ref,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if(options.headers['imageToken'] == 'true'){
      final token = await storage.read(key: IMAGE_TOKEN);

      if (token != null) {
        options.queryParameters.addAll({'token': token});
      }
    }

    super.onRequest(options, handler);
  }

  // 반
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}