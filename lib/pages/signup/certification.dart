
import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/common/textformfield.dart';
import 'package:flutter/material.dart';

//재학생 인증 페이지 추후 OAuth와 연동하여 사용
class Certification extends StatelessWidget {
  static String get routeName => 'certification';
  const Certification({super.key});

  @override
  Widget build(BuildContext context) {
    final gkey = GlobalKey<FormState>();
    final TextEditingController idController = TextEditingController();
    final TextEditingController pwController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image.asset(ImgPath.gachon_logo),
              ),
              Text(
                '재학생 인증',
                style: AirTextStyle.login,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '가천대학교 계정으로 로그인 해주세요.',
                style: AirTextStyle.subtitle1,
              ),
              SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 25,
              ),
              Form(
                key: gkey,
                child: Container(
                  width: 460,
                  child: Column(
                    children: [
                      LoginTextField(
                          kind: '아이디',
                          hint: '아이디 입력',
                          controller: idController,
                          validator: loginidValidator),
                      LoginTextField(
                          kind: '패스워드',
                          hint: '패스워드 입력',
                          controller: pwController,
                          validator: loginpwValidator),
                      const SizedBox(
                        height: 55,
                      ),
                      TextFormButton(
                          backcolor: AirColor.gachon,
                          buttonText: '로그인',
                          callback: () async {
                            // if(name == "" || id == "" || pw == ""){
                            //   Get.toNamed('/signup');
                            // }
                            // if (gkey.currentState!.validate()) {
                            //   signUp(name, id, pw, idController.text,
                            //       pwController.text,);
                            // } else {}
                          })
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
