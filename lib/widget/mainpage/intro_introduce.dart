import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/mainpage/intro_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroIntroduce extends StatelessWidget {
  const IntroIntroduce({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IntroRow(
            text: Intro.intro1,
            image: ImgPath.main_dolphin,
          ),
          IntroRow(
            text: Intro.intro2,
            image: ImgPath.main_google,
            reverse: true,
          ),
          IntroRow(
            text: Intro.intro3,
            image: ImgPath.main_user,
          ),
          IntroRow(
            text: Intro.intro4,
            image: ImgPath.main_layer,
            reverse: true,
          ),
        ],
      ),
    );
  }
}
