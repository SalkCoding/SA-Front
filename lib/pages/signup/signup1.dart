import 'package:air_front/config/variable.dart';
import 'package:air_front/pages/signup/phone_authentication.dart';
import 'package:air_front/widget/common/footer.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//처음 최원가입 누르면 체크 박스가 있는 페이지
//체크박스도 provider 이용해서 변수 받아와서 사용함
class SignUp1 extends StatefulWidget {
  static String get routeName => 'signup1';
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp1State();
}

bool check1 = false;
bool check2 = false;
bool check3 = false;

class _SignUp1State extends State<SignUp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      ImgPath.apply_back,
                    ),
                    fit: BoxFit.fill,
                  )),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      width: 850,
                      child: Column(
                        children: [
                          SizedBox(height: ratio.height * 240),
                          Text(
                            '회원가입',
                            style: AirTextStyle.signUp,
                          ),
                          SizedBox(
                            height: ratio.height * 80,
                          ),
                          Container(
                              child: Row(
                            children: [
                              Text(
                                '이용약관',
                                style: AirTextStyle.signUpsub,
                              ),
                              customCheckBox(
                                value: check1,
                                onChanged: (val) {
                                  setState(() {
                                    check1 = val!;
                                  });
                                },
                              ),
                            ],
                          )),
                          SizedBox(
                            height: ratio.height * 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:Border.all(color: Colors.grey, width: 1)),
                            width: double.infinity,
                            height: ratio.height * 210,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(31, 23, 31, 23),
                                child: Text(Contract.according_contract1,
                                    style: AirTextStyle.agree),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ratio.height * 70,
                          ),
                          Container(
                              child: Row(
                            children: [
                              const Text(
                                '개인정보 수집 및 이용',
                                style: AirTextStyle.signUpsub,
                              ),
                              customCheckBox(
                                value: check2,
                                onChanged: (val) {
                                  setState(() {
                                    check2 = val!;
                                  });
                                },
                              ),
                            ],
                          )),
                          SizedBox(
                            height: ratio.height * 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: ratio.height * 210,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(31, 23, 31, 23),
                              child: Text(Contract.according_contract2,
                                  style: AirTextStyle.agree),
                            ),
                          ),
                          SizedBox(
                            height: ratio.height * 60,
                          ),
                          Container(
                              child: Row(
                            children: [
                              const Text('전체 동의하기',
                                  style: AirTextStyle.signUpsub),
                              customCheckBox(
                                value: check3,
                                onChanged: (val) {
                                  setState(() {
                                    check1 = true;
                                    check2 = true;
                                    check3 = val!;
                                  });
                                },
                              ),
                            ],
                          )),
                          SizedBox(
                            height: ratio.height * 50,
                          ),
                          ElevatedButton(
                            onPressed: check1 == false || check2 == false
                                ? null
                                : () {
                                    context.goNamed('phoneCertification');
                                  },
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(double.infinity, ratio.height * 135),
                              backgroundColor: AirColor.button,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              '다음',
                              style: AirTextStyle.button,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TopBar()
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Footer(),
          )
        ],
      ),
    );
  }

  //이용약관 동의에 쓰이는 체크 박스 위젯
  Checkbox customCheckBox({
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Checkbox(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (!states.contains(MaterialState.selected)) {
          return null;
        }
        return AirColor.button;
      }),
      value: value,
      onChanged: onChanged,
    );
  }
}
