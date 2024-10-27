import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';

//News 페이지에 검색결과 없을 때 뜨는 팝업창인데 아직 재대로 사용 못함(Search 기능이 완전화 되지 않아서)
void searchDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            width: ratio.width * 600,
            height: ratio.height * 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '검색 결과에 해당하는 정보가 없습니다.',
                  style: AirTextStyle.loginText,
                ),
                SizedBox(
                  height: ratio.height * 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AirColor.button),
                    onPressed: () {
                      
                    },
                    child: Text(
                      '확인',
                      style:
                          AirTextStyle.signUpText.copyWith(color: Colors.white),
                    ))
              ],
            ),
          ),
        );
      });
}

//회원가입 전에 이용약관에 동의하지 않고 페이지를 넘어가려고 할 때 뜨는 팝업창 함수
void CustomDialog({
  required BuildContext context,
  required String text,
  VoidCallback? func,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          width: ratio.width * 300,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AirTextStyle.loginText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: AirColor.button),
                onPressed: func ?? () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  '확인',
                  style: AirTextStyle.signUpText.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
