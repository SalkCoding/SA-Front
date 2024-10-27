import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:flutter/material.dart';

//지원 완료시 추후에 나오는 회면 페이지
class ApplyComplete extends StatelessWidget {
  static String get routeName => 'applyComplete';
  const ApplyComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: TopBar(),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const Icon(
                Icons.check_circle,
                color: AirColor.button,
                size: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "지원이 완료되었습니다!",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "합격 여부는 이메일로 알려드립니다.\n지원해주셔서 감사합니다.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AirColor.button,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AirColor.button,
                  ),
                  child: const Text(
                    "메인 페이지",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
