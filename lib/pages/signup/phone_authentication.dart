import 'package:air_front/config/variable.dart';
import 'package:air_front/provider/user/user_provider.dart';
import 'package:air_front/widget/common/dialog.dart';
import 'package:air_front/widget/common/footer.dart';
import 'package:air_front/widget/common/textformfield.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PhoneAuthentication extends ConsumerStatefulWidget {
  static String get routeName => 'phoneCertification';
  const PhoneAuthentication({super.key});

  @override
  ConsumerState<PhoneAuthentication> createState() => _PhoneAuthenticationState();
}


class _PhoneAuthenticationState extends ConsumerState<PhoneAuthentication> {
  
  
  bool isPhoneNum = false;
  bool isNum = false;
  String phoneNum = '';
  final gkey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController numController = TextEditingController();


  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImgPath.apply_back),
                  fit: BoxFit.fill,
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Center(
                      child: Form(
                        key: gkey,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: 700,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: ratio.height * 300,
                              ),
                              Text(
                                '본인인증',
                                style: AirTextStyle.login,
                              ),
                              SizedBox(
                                height: ratio.height * 100,
                              ),

                              // 전화번호 입력 텍스트 필드
                              CustomTextFieldColumn(
                                  enabled: !isNum,
                                  onChanged: (val) {
                                    // 전화번호가 현재 입력되어있는 것에 따라서 버튼 활성화/비활성화
                                    if (val!.length == 13) {
                                      setState(() {
                                        isPhoneNum = true;
                                      });
                                    }else{
                                      setState(() {
                                        isPhoneNum = false;
                                      });
                                    }
                                  },
                                  kind: '전화번호',
                                  hint: '전화번호 입력',
                                  controller: phoneController,
                                  validator: phoneValidator,
                                  ),
                              SizedBox(
                                height: ratio.height * 30,
                              ),

                              // 인증번호 입력 텍스트 필드
                              CustomTextFieldColumn(
                                suffix: isNum
                                    ? TextButton(
                                        // 인증번호 재요청
                                        // 에러 발생시 Dialog
                                        onPressed: () async {
                                          if(await ref.read(userProvider.notifier).requestNum(formatText(phoneNum))){
                                            setState(() {
                                              isNum = true;
                                              phoneNum = phoneController.text;
                                            });
                                          }else{
                                            CustomDialog(context: context, text: "에러가 발생하였습니다.\n다시시도해주세요.");
                                          }
                                        },
                                        child: Text(
                                          '재전송',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: AirColor.button,
                                              decoration:
                                                  TextDecoration.underline,),
                                        ),)
                                    : null,
                                onChanged: (val) {},
                                kind: '인증번호',
                                hint: '인증번호 6자리 입력',
                                controller: numController,
                              ),
                              SizedBox(
                                height: ratio.height * 100,
                              ),

                              // 커스텀 버튼
                              TextFormButton(
                                backcolor: AirColor.button,
                                buttonText: isNum ? '다음 단계' : '인증번호 전송',
                                callback: isPhoneNum
                                    ? () async {
                                        // 인증번호 요청 및 번호 저장
                                        // 에러 발생시 Dialog
                                        if (!isNum) {
                                          if(await ref.read(userProvider.notifier).requestNum(formatText(phoneController.text))){
                                            setState(() {
                                              isNum = true;
                                              phoneNum = phoneController.text;
                                            });
                                          }else{
                                            CustomDialog(context: context, text: "에러가 발생하였습니다.\n다시시도해주세요.");
                                          }
                                        }
                                        // 인증번호 확인
                                        else if (isNum) {
                                          if(await ref.read(userProvider.notifier).responseNum(phoneNum: formatText(phoneNum), authNum: numController.text)){
                                            context.pushReplacement('/image_certification?phoneNumber=${formatText(phoneNum)}');
                                          }else{
                                            CustomDialog(context: context, text: "다시 시도해주세요.");
                                          }
                                        }
                                      }
                                    : null,
                              ),
                              SizedBox(
                                height: ratio.height * 32,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Footer
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Footer(),
                  ),
                ],
              )),
          TopBar(),
        ],
      ),
    );
  }

  // 전화번호 포맷 함수
  // ex) 010-1111-1111 -> 01011111111
  String formatText(String phoneNum) {
    final phoneNumberList = phoneNum.split('-');
    String phoneNumber = phoneNumberList.join('');
    return phoneNumber;
  }
}
