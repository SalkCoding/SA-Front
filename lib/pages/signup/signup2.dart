// 회원가입 페이지 수정 후(OAuth 사용하여 만들 페이지)
import 'package:air_front/config/default_layout.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/users/users.dart';
import 'package:air_front/provider/user/user_provider.dart';
import 'package:air_front/widget/common/dialog.dart';
import 'package:air_front/widget/common/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

//TextFormField 클래스 사용 예시
class SignUp2 extends ConsumerStatefulWidget {
  static String get routeName => "signup2";
  const SignUp2({super.key});

  @override
  ConsumerState<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends ConsumerState<SignUp2> {
  final gkey = GlobalKey<FormState>();

  String? pw = '';
  String? pw2 = '';
  bool obscure = true;

  final TextEditingController pwController = TextEditingController();
  final TextEditingController pw2Controller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    print(user);

    // 회원가입 과정에서 정상적으로 회원 정보를 저장했을 경우
    if (user is Users) {
      setState(() {
        nameController.text = user.name;
        idController.text = user.studentNum;
      });

      return DefaultLayoutScreen(
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
                  height: ratio.height * 250,
                ),
                Text(
                  '회원가입',
                  style: AirTextStyle.signUp,
                ),
                const SizedBox(
                  height: 35,
                ),
                Form(
                  key: gkey,
                  child: Container(
                    width: 500,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFieldColumn(
                          enabled: false,
                          kind: '이름',
                          hint: '이름 입력',
                          controller: nameController,
                          validator: nameValidator,
                        ),
                        CustomTextFieldColumn(
                          enabled: false,
                          kind: '학번(ID)',
                          hint: '5~20자의 영문 소문자, 숫자와 특수기호 입력 가능',
                          controller: idController,
                          validator: idValidator,
                        ),
                        Text('비밀번호', style: AirTextStyle.signUpsub),
                        SizedBox(
                          height: ratio.height * 11,
                        ),
                        CustomTextField(
                          kind: '비밀번호',
                          hint: '8~16자의 영문 대/소문자, 숫자, 특수문자 입력 가능',
                          controller: pwController,
                          validator: pwValidator,
                          obscure: obscure,
                          suffix: obscure
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscure = false;
                                    });
                                  },
                                  child: Icon(Icons.visibility_off),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscure = true;
                                    });
                                  },
                                  child: Icon(Icons.visibility),
                                ),
                        ),
                        SizedBox(
                          height: ratio.height * 11,
                        ),
                        CustomTextField(
                          kind: '비밀번호',
                          hint: '비밀번호 재확인',
                          controller: pw2Controller,
                          validator: (val) {
                            return pw2Validator(val, pw2Controller.text);
                          },
                          obscure: true,
                        ),
                        SizedBox(
                          height: ratio.height * 50,
                        ),
                        TextFormButton(
                            backcolor: AirColor.button,
                            buttonText: '회원가입',
                            callback: () async {
                              if (gkey.currentState!.validate()) {
                                if (pwController.text == pw2Controller.text) {
                                  final userData = user.copywith(
                                      password: pwController.text);
                                  print(userData);
                                  final resp = await ref
                                      .read(userProvider.notifier)
                                      .signup(userData);
                                  if (resp) {
                                    context.goNamed('signupComplete');
                                  } else {
                                    CustomDialog(
                                        context: context,
                                        text: '오류가 발생하였습니다.\n다시 시도해주세요.');
                                  }
                                } else {
                                  CustomDialog(
                                      context: context, text: '비밀번호를 확인해주세요.');
                                }
                              } else {}
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // 1. 회원가입 과정에서 오류가 발생하여 회원 정보가 저장되지 않은 경우
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '회원가입 중 오류가 발생하였습니다.\n다시 시도해주세요.',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: AirColor.button,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                context.goNamed('home');
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AirColor.button,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "홈으로",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
