import 'package:air_front/config/default_layout.dart';
import 'package:air_front/config/function.dart';
import 'package:air_front/widget/mainpage/intro_aiia.dart';
import 'package:air_front/widget/mainpage/intro_introduce.dart';
import 'package:air_front/widget/mainpage/intro_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:air_front/config/variable.dart';
import 'package:flutter/widgets.dart';

// 처음 들어가면 볼 수 있는 메인 페이지
class MainPage extends StatelessWidget {
  static String get routeName => 'home';
  MainPage({super.key});

  var widgetList = [const IntroTitle(), const IntroIntroduce()];

  @override
  Widget build(BuildContext context) {
    // 처음 배경 로딩으로 인한 시간으로 FutureBuilder를 이용한 로딩창 구현
    return DefaultLayoutScreen(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImgPath.background_image),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ratio.width * 300,
                    ),
                    IntroTitle(),
                    IntroAIIA(),
                  ],
                ),
              ),
              IntroIntroduce(),
            ],
          ),
        ),
      ),
    );
  }
}
