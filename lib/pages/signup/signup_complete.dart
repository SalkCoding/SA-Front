import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/common/footer.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:flutter/material.dart';

//회원가입 완료시 나오는 페이지
class SignupComplete extends StatelessWidget {
  //static String get routeName => 'signupComplete';
  const SignupComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImgPath.apply_back),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300,
                        ),
                        Image.asset(ImgPath.rocket),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "회원가입이 거의 다 되었어요!",
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '재학생이라면 재학생 인증, 신입생 및 외부인은 인증되지 않은 회원으로 넘어가주세요.',
                          style: AirTextStyle.loginsub,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        InkWell(
                            onTap: (){},
                            child: Container(
                              width: 520,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: AirColor.bubble,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AirColor.button)),
                              child: Center(
                                  child: Text(
                                '재학생 인증',
                                style: AirTextStyle.info,
                              )),
                            )),
                        SizedBox(
                          height: 25,
                        ),
                        InkWell(
                            onTap: () {
                              
                            },
                            child: Container(
                              width: 520,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: AirColor.bubble,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AirColor.button)),
                              child: Center(
                                  child: Text(
                                '인증되지 않은 회원입니다',
                                style: AirTextStyle.info,
                              )),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Footer(),
              )
            ],
          ),
          TopBar()
        ],
      ),
    );
  }
}
