import 'package:air_front/config/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroAIIA extends StatelessWidget {
  const IntroAIIA({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.circle,
          color: const Color(0xffE4F5FF),
          size: ratio.width * 350,
        ),
        Container(
          child: Text(
            "개발자들의 공간 'Weaver'",
            style: TextStyle(
              fontSize: ratio.width * 70,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w800,
              color: AirColor.subTitle1,
            ),
          ),
        ),
      ],
    );
  }
}
