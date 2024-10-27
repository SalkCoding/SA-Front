import 'package:air_front/config/variable.dart';
import 'package:flutter/cupertino.dart';

// 모바일 버전 확인
bool isMobile(BuildContext context) {
  if (MediaQuery.of(context).size.width < MediaQuery.of(context).size.height) {
    return true;
  } else {
    return false;
  }
}

// 이미지 캐싱
Future<void> preCacheImg(List<String> imgPath, BuildContext context) async {
  for (int i = 0; i < imgPath.length; i++) {
    await precacheImage(AssetImage(imgPath[i]), context);
  }
}

// BuildContext 생성 후 이미지 캐싱 시작
void startImgCache() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  binding.addPostFrameCallback(
    (timeStamp) async {
      BuildContext? context = binding.rootElement;
      if (context != null) {
        await preCacheImg(preCacheImages, context);
      }
    },
  );
}
