import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/common/textformfield.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:flutter/material.dart';

//본인 인증 페이지 - 실제로 사용할지 모름 확인만 할 것
class Authentication extends StatefulWidget {
  
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController phonController = TextEditingController();
  final TextEditingController authController = TextEditingController();

  String? authNum;
  bool authCheck = false;
  bool buttonClicked = false;

  final _authKey = GlobalKey<FormState>();

  void authNavi(BuildContext context, GlobalKey<FormState> gkey) {
    buttonClicked = true;

    if (gkey.currentState!.validate()) {
      
    } else {}

    setState(() {});
  }

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
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(80),
                    child: Text(
                      "본인인증",
                      style: AirTextStyle.signUp,
                    ),
                  ),
                  SizedBox(
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(
                          key: _authKey,
                          child: Column(
                            children: [
                              CustomTextFieldColumn(
                                kind: '전화번호',
                                hint: '전화번호 입력',
                                controller: phonController,
                                validator: phoneValidator,
                              ),
                              TextFormField(
                                style: AirTextStyle.signUpText,
                                autofocus: true,
                                obscureText: true,
                                controller: authController,
                                validator: (val) {
                                  if (val!.length != 6) {
                                    if (val.isEmpty) {
                                      authCheck = false;
                                      return '필수 질문입니다.';
                                    }
                                    authCheck = false;
                                    return '올바른 인증번호를 입력해주세요';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  suffixIcon: buttonClicked == true
                                      ? TextButton(
                                          onPressed: () {
                                            authNavi(context, _authKey);
                                          },
                                          child: const Text(
                                            "재발급",
                                            style: TextStyle(
                                              color: AirColor.button,
                                            ),
                                          ),
                                        )
                                      : const Text(""),
                                  border: const OutlineInputBorder(),
                                  hintText: '인증번호 입력',
                                  hintStyle: AirTextStyle.placeholderS,
                                  labelStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        TextFormButton(
                          backcolor: AirColor.button,
                          buttonText: '지원서 제출',
                          callback: () => authNavi(context, _authKey),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
