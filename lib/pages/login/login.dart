// 수정 후 로그인 화면 (OAuth 적용하여 학교와 연동돼서 사용할 로그인 페이지)
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/users/users.dart';
import 'package:air_front/provider/user/user_provider.dart';
import 'package:air_front/widget/common/dialog.dart';
import 'package:air_front/widget/common/footer.dart';
import 'package:air_front/widget/common/textformfield.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerWidget {
  static String get routeName => 'login';
  Login({super.key});

  final gkey = GlobalKey<FormState>();

  final TextEditingController idController = TextEditingController();

  final TextEditingController pwController = TextEditingController();

  //api get 호출로 반환될 예상 및 예시값
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userProvider);
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
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: ratio.height * 320,
                        ),
                        Text(
                          'LOGIN',
                          style: AirTextStyle.login,
                        ),
                        SizedBox(
                          height: ratio.height * 20,
                        ),
                        Text(
                          '가천대학교 AIIA 아이디로 로그인을 해주세요.',
                          style: AirTextStyle.loginsub,
                        ),
                        SizedBox(
                          height: ratio.height * 30,
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
                                    validator: (loginidValidator)),
                                LoginTextField(
                                    kind: '패스워드',
                                    hint: '패스워드 입력',
                                    controller: pwController,
                                    validator: loginpwValidator),
                                const SizedBox(
                                  height: 55,
                                ),
                                TextFormButton(
                                    backcolor: AirColor.button,
                                    buttonText: '로그인',
                                    callback: state is UsersLoading ? null : () async {
                                      if (gkey.currentState!.validate()) {
                                        final resp = await ref.read(userProvider.notifier).login(id: idController.text, pw: pwController.text);
                                        if(resp is Users){
                                          context.goNamed('home');
                                        }else{
                                          CustomDialog(context: context, text: "에러가 발생하였습니다.\n다시 시도해주세요.");
                                        }
                                      } else {}
                                    })
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '아직 회원이 아니신가요?',
                              style: AirTextStyle.placeholderS
                                  .copyWith(fontSize: 16, color: AirColor.dark_grey, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () => context.goNamed('signup1'),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: AirColor.signupBt)),
                                width: 90,
                                height: 30,
                                child: Center(
                                  child: Text(
                                    '회원가입',
                                    style: AirTextStyle.signupBt,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ratio.height * 30,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    child: Center(
                                  child: Text(
                                    '아이디 찾기',
                                    style: AirTextStyle.placeholderS.copyWith(color: AirColor.dark_grey, fontWeight: FontWeight.w500),
                                  ),
                                )),
                              ),
                              Text('   |   ', style: AirTextStyle.placeholderS),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    child: Center(
                                  child: Text('비밀번호 찾기',
                                      style: AirTextStyle.placeholderS.copyWith(color: AirColor.dark_grey, fontWeight: FontWeight.w500)),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
}
