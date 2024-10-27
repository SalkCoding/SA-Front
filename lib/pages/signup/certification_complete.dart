import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:flutter/material.dart';

//AIIA 회원가입 완료 시 나오는 페이지
class CertificationComplete extends StatelessWidget {
  static String get routeName => 'signupComplete';
  const CertificationComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 300,
                ),
                Icon(
                  Icons.check_circle,
                  color: AirColor.button,
                  size: 80,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "회원가입이 완료되었습니다.",
                  style: TextStyle(
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                SizedBox(height: 40,),
                Text(
                  "AIIA는 당신을 환영합니다!",
                  style: AirTextStyle.git
                ),
              ],
            ),
          ),
          TopBar()
        ],
      ),
    );
  }
}
