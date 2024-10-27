import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImgPath.aiia_logo_blue, width: MediaQuery.of(context).size.width / 5 * 2,),
            //Icon(Icons.close),
            Text("현재 AIIA AIR 홈페이지는\n모바일 버전이 지원되지 않습니다.\nPC 버전으로 이용해주세요!", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,),)
          ],
        ),
      ),
    );
  }
}