import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//로그인 textformfield 위젯
//textformfield 위젯이 많은데 사실 이것도 하나로 뭉쳐서 사용해야함
//하나만 확실하게 확인하고 사용법만 익혀두면 OK
class LoginTextField extends StatelessWidget {
  final String kind;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const LoginTextField(
      {Key? gkey,
      required this.kind,
      required this.hint,
      required this.controller,
      required this.validator,
      super.key});

  @override
  Widget build(BuildContext context) {
    bool obs = kind == '아이디' ? false : true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 28,
        ),
        TextFormField(
          style: AirTextStyle.signUpText,
          autofocus: true,
          obscureText: obs,
          controller: controller,
          validator: validator,
          onChanged: (val) => {},
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
              hintStyle: AirTextStyle.placeholderS,
              counterText: '',
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              errorMaxLines: 2),
        ),
      ],
    );
  }
}

class TextFormButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? callback;
  final Color backcolor;
  const TextFormButton(
      {Key? gkey,
      required this.buttonText,
      required this.callback,
      required this.backcolor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, ratio.height * 130),
          backgroundColor: backcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: callback,
      child: Center(
        child: Text(buttonText, style: AirTextStyle.button),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Color? backgroundColor;
  final String kind;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final Function(String?)? onChanged;
  final Widget? suffix;
  bool enabled;
  CustomTextField(
      {Key? gkey,
      this.enabled = true,
      this.backgroundColor = Colors.white,
      this.obscure = false,
      required this.kind,
      required this.hint,
      required this.controller,
      this.validator = null,
      this.onChanged = null,
      this.suffix = null,
      super.key});

  @override
  Widget build(BuildContext context) {
    int? maxLength = kind == '전화번호'
        ? 13
        : kind == '학번'
            ? 9
            : null;
    return TextFormField(
      inputFormatters: kind == '학번'
          ? [FilteringTextInputFormatter.digitsOnly]
          : kind == '전화번호'
              ? [FilteringTextInputFormatter.digitsOnly, NumberFormat()]
              : kind == '이름' || kind == '학과'
                  ? [
                      FilteringTextInputFormatter(
                        RegExp('[a-z A-Z ㄱ-ㅎ|가-힣|·|：]'),
                        allow: true,
                      )
                    ]
                  : null,
      enabled: enabled,
      onChanged: onChanged,
      maxLength: maxLength,
      style: AirTextStyle.signUpText,
      obscureText: obscure,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        suffix: suffix,
        border: kind == '대댓글' ? InputBorder.none : OutlineInputBorder(),
        hintText: hint,
        hintStyle: AirTextStyle.placeholderS,
        counterText: '',
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomTextFieldColumn extends StatelessWidget {
  final String kind;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Widget? suffix;
  bool enabled;
  CustomTextFieldColumn(
      {Key? gkey,
      this.enabled = true,
      required this.kind,
      required this.hint,
      this.suffix = null,
      required this.controller,
      this.validator = null,
      this.onChanged = null,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(kind, style: kind == '인증번호' ? AirTextStyle.signUpsub.copyWith(color: AirColor.button) : AirTextStyle.signUpsub),
        SizedBox(
          height: ratio.height * 11,
        ),
        CustomTextField(
          enabled: enabled,
          suffix: suffix,
            kind: kind,
            hint: hint,
            controller: controller,
            validator: validator,
            onChanged: onChanged,),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

String? CommentValidator(String? val) {
  if (val!.isEmpty) {
    return '댓글을 입력해주세요.';
  } else{
    return null;
  }
}

//회원가입 화면 유효성 검사
String? nameValidator(String? val) {
  if (val!.isEmpty) {
    return '필수 질문입니다.';
  } else {
    return null;
  }
}

String? depValidator(String? val) {
  if (val!.isEmpty) {
    return '필수 질문입니다.';
  } else {
    return null;
  }
}

String? stnumValidator(String? val) {
  if (val!.length != 9) {
    if (val.isEmpty) {
      return '필수 질문입니다.';
    }
    return '올바르지 않은 학번입니다.';
  } else {
    return null;
  }
}

String? phoneValidator(String? val) {
  if (val!.isEmpty) {
    return '전화번호를 입력해주세요.';
  } else if (!RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(val)) {
    return '올바른 전화번호 형식을 입력해주세요.';
  }
  return null;
}

String? emailValidator(String? val) {
  if (val!.isEmpty) {
    return '필수 질문입니다.';
  } else if (!RegExp(
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      .hasMatch(val)) {
    return '올바른 이메일 형식을 입력해주세요.';
  }
  return null;
}

String? idValidator(String? val) {
  if (val!.isEmpty) {
    return '아이디를 입력해주세요.';
  } else {
    return null;
  }
}

String? pwValidator(String? val) {
  if (val!.length > 16 || val.length < 8) {
    if (val.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    return '올바른 비밀번호를 입력해주세요';
  } else {
    return null;
  }
}
String? pw2Validator(String? val, String? pw2) {
  if (val == null || val.isEmpty) {
    return '비밀번호를 입력해주세요.';
  }
  if (val.length > 16 || val.length < 8) {
    return '올바른 비밀번호를 입력해주세요';
  }
  if (val != pw2) {
    return '재입력한 비밀번호를 확인해주세요.';
  }
  return null;
}

// String? pw2Validator(String? val, String pw2) {
//   if (val!.length > 16 || val.length < 8) {
//     if (val.isEmpty) {
//       return '필수 질문입니다.';
//     }
//     return '올바른 비밀번호를 입력해주세요';
//   } else if (val != pw2) {
//     return '비밀번호를 확인해주세요.';
//   } else {
//     return null;
//   }
// }

String? loginidValidator(String? val) {
  if (val!.length > 20 || val.length < 5) {
    if (val.isEmpty) {
      return '아이디를 입력해주세요.';
    }
    return '올바른 아이디를 입력해주세요.';
  } else {
    return null;
  }
}

String? loginpwValidator(String? val) {
  if (val!.length > 16 || val.length < 8) {
    if (val.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    return '비밀번호를 확인해주세요';
  } else {
    return null;
  }
}

String? authValidator(String? val) {
  if (val!.isEmpty) {
      return '인증번호를 입력해주세요.';
    } else {
    return null;
  }
}

class CheckIcon extends StatelessWidget {
  const CheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AirColor.button,
      ),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 12.0,
      ),
    );
  }
}

class NumberFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex <= 3) {
        if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      } else {
        if (nonZeroIndex % 7 == 0 &&
            nonZeroIndex != text.length &&
            nonZeroIndex > 4) {
          buffer.write('-');
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
