import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';

//지원서에 사용하는 Textfieldform 위젯을 따로 분리하여 사용
//textfieldform은 유용하고 자주 쓰이니 분리하였고 꼭 사용법 알아둘 것
class Input extends StatelessWidget {
  late String title, hint, returnMessage, inputType;
  // late String name, department, studentNumber, phoneNumber, email;

  Input({
    super.key,
    required this.title,
    required this.hint,
    required this.inputType,
  });
  Input.name({
    super.key,
    required this.title,
    required this.hint,
  })  : inputType = "name",
        returnMessage = "이름을 입력하세요";
  Input.department({
    super.key,
    required this.title,
    required this.hint,
  })  : inputType = "department",
        returnMessage = "학과를 입력하세요";
  Input.studentNumber({
    super.key,
    required this.title,
    required this.hint,
  })  : inputType = "studentNumber",
        returnMessage = "올바르지 않은 학번입니다.";
  Input.phoneNumber({
    super.key,
    required this.title,
    required this.hint,
  })  : inputType = "phoneNumber",
        returnMessage = "올바르지 않은 전화번호입니다.";
  Input.email({
    super.key,
    required this.title,
    required this.hint,
  })  : inputType = "email",
        returnMessage = "올바르지 않은 이메일입니다.";

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              title,
              style: AirTextStyle.signUpText,
            ),
          ),
          TextFormField(
            style: AirTextStyle.signUpText,
            autofocus: true,
            validator: (val) {
              if (val!.isEmpty) {
                return returnMessage;
              } else {
                return null;
              }
            },
            onSaved: (input) => inputType = input as String,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AirColor.button.withOpacity(0.8),
                ),
              ),
              hintText: hint,
              hintStyle: AirTextStyle.placeholderS,
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
