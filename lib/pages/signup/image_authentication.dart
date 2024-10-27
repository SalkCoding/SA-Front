import 'dart:convert';
import 'dart:typed_data';
import 'package:air_front/config/default_layout.dart';
import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/users/users.dart';
import 'package:air_front/provider/user/user_provider.dart';
import 'package:air_front/widget/common/dialog.dart';
import 'package:air_front/widget/common/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker_web/image_picker_web.dart';

class ImageAuthentication extends ConsumerStatefulWidget {
  static String get routeName => 'ImageCertification';
  final String phoneNumber;
  const ImageAuthentication({
    required this.phoneNumber,
    super.key,
  });

  @override
  ConsumerState<ImageAuthentication> createState() => _ImageAuthenticationState();
}

class _ImageAuthenticationState extends ConsumerState<ImageAuthentication> {
  final gkey = GlobalKey<FormState>();
  Uint8List? pickedImage;
  String? fileName;
  String? base64Image;
  String buttonText = '이미지 업로드';
  String imgPath = ImgPath.imageAu2;

  Future<void> pickImage() async {
    final mediaInfo = await ImagePickerWeb .getImageInfo;

    if (mediaInfo != null) {
      setState(() {
        pickedImage = mediaInfo.data;
        fileName = mediaInfo.fileName;
        base64Image = base64Encode(mediaInfo.data!);
        imgPath = ImgPath.imageAu;
        buttonText = '이미지 수정';
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    UsersBase? state = ref.watch(userProvider);
    
    return DefaultLayoutScreen(
        child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImgPath.apply_back),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Form(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: 800,
            child: Column(
              children: [
                SizedBox(
                  height: ratio.height * 320,
                ),
                Text(
                  isMobile(context) ? '가천대학교\n재학생 인증' : '가천대학교 재학생 인증',
                  style: AirTextStyle.image_auth,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: ratio.height * 80,
                ),
                Text('AIIA-Air의 회원가입 및 AIIA 서비스 이용을 위해',
                    style: AirTextStyle.imageAU_sub),
                Text(
                  '가천대학교 재학생 인증을 부탁드립니다.',
                  style: AirTextStyle.imageAU_sub,
                ),
                SizedBox(
                  height: ratio.height * 100,
                ),
                Image.asset(imgPath),
                SizedBox(
                  height: ratio.height * 30,
                ),
                GestureDetector(
                  onTap: () async {
                    pickImage();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20,),
                    decoration: BoxDecoration(
                        color: AirColor.bubble,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload_outlined,
                          color: AirColor.button,
                        ),
                        SizedBox(
                          width: ratio.width * 15,
                        ),
                        Text(
                          buttonText,
                          style: AirTextStyle.imageUploadText,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ratio.height * 30,
                ),

                Text(
                  '[카카오워크 > 바로가기 > 모바일 신분증]으로 이동해서\n가천대학교 포탈에 접속하여 해당 화면 캡쳐 이미지를 첨부해주세요',
                  style: AirTextStyle.imageAU_sub,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: ratio.height * 100,
                ),
                TextFormButton(
                    backcolor: AirColor.button,
                    buttonText: '다음 단계',
                    callback: (pickedImage == null || state is UsersLoading) 
                        ? null
                        : () async {
                            final resp = await ref.read(userProvider.notifier).imgCertification(fileName: fileName!, base64Image: base64Image!, phoneNumber: widget.phoneNumber);
                            if(resp is Users && resp.phoneNumber != null){
                              context.goNamed('signup2');
                            }else if(resp is Users && resp.phoneNumber == null){
                              CustomDialog(context: context, text: "회원가입 과정 중 오류가 발생하였습니다.\n처음부터 다시 시도해주세요.", func: (){context.goNamed('signup1');});
                            }else{
                              CustomDialog(context: context, text: "오류가 발생하였습니다.\n다시 시도해주세요.");
                            }
                          }),
                const SizedBox(
                  height: 32,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       '아직 회원이 아니신가요?',
                //       style: AirTextStyle.placeholderS
                //           .copyWith(fontSize: 16, color: AirColor.dark_grey, fontWeight: FontWeight.w500),
                //     ),
                //     SizedBox(
                //       width: 15,
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: ratio.height * 30,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}