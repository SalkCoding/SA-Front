import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/common/textformfield.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:air_front/widget/common/footer.dart';

//지원서 작성하는 페이지
//Textfieldform, Dropdown, 파일 올리기 중요
class Apply extends StatefulWidget {
  static String get routeName => 'apply';
  const Apply({super.key});

  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController depController = TextEditingController();
  final TextEditingController stnumController = TextEditingController();
  final TextEditingController phonController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _applyKey = GlobalKey<FormState>();

  late String name, department, studentNumber, phoneNumber, email;
  final _teams = [
    'Flutter',
    'Spring',
    'AI R&D',
    'UI/UX Design',
    'Brand Design',
  ];
  String? _selectedTeam;
  String _uploadFileText = "파일 업로드";
  IconData _uploadFileIcon = Icons.file_upload_outlined;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedTeam = null;
    });
  }

  Widget _buildWidgetBasedOnSelection() {
    switch (_selectedTeam) {
      case 'Flutter':
        return const Text("프론트엔드 질문입니다");
      case 'Spring':
        return const Text("백엔드 질문입니다");
      case 'AI R&D':
        return const Text("알엔디 질문입니다");
      case 'UI/UX Design':
        return const Text("디자인 질문입니다");
      case 'Brand Design':
        return const Text("브랜드 질문입니다");
      default:
        return const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 10),
          child: Text(
            '필수 질문입니다.',
            style: TextStyle(
                color: Color(0xffA6372B),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        );
    }
  }

  void applyNavi(BuildContext context, GlobalKey<FormState> gkey) {
    if (gkey.currentState!.validate()) {
      // print(nameController.text);
      // print(depController.text);
      // print(stnumController.text);
      // print(phonController.text);
      // print(emailController.text);
      // print(emailController.text);
      // print(idController.text);
      // print(pwController.text);
      
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImgPath.apply_back,
              ),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 150, horizontal: 80),
                  child: Text(
                    "입부 지원서",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  width: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _applyKey,
                        child: Column(
                          children: [
                            CustomTextFieldColumn(
                                kind: '이름',
                                hint: '이름 입력',
                                controller: nameController,
                                validator: nameValidator),
                            CustomTextFieldColumn(
                                kind: '학과',
                                hint: '학과 입력',
                                controller: depController,
                                validator: depValidator),
                            CustomTextFieldColumn(
                                kind: '학번',
                                hint: '학번 입력',
                                controller: stnumController,
                                validator: stnumValidator),
                            CustomTextFieldColumn(
                                kind: '전화번호',
                                hint: '전화번호 입력',
                                controller: phonController,
                                validator: phoneValidator),
                            CustomTextFieldColumn(
                                kind: '이메일',
                                hint: '이메일 입력',
                                controller: emailController,
                                validator: emailValidator),
                          ],
                        ),
                      ),
                      const Text(
                        "지원 분야",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(),
                        ),
                        padding: const EdgeInsets.only(right: 10),
                        width: 500,
                        child: DropdownButton(
                          alignment: Alignment.centerRight,
                          style: const TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                          value: _selectedTeam,
                          underline: const SizedBox.shrink(),
                          focusColor: Colors.transparent,
                          items: _teams
                              .map((e) => DropdownMenuItem(
                                    value: e, // 선택 시 onChanged 를 통해 반환할 value
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedTeam = value!;
                            });
                          },
                        ),
                      ),
                      _buildWidgetBasedOnSelection(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "포트폴리오",
                          style: TextStyle(
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.transparent,
                            ),
                          ),
                          onPressed: () async {
                            try {
                              var file =
                                  await FilePickerWeb.platform.pickFiles();
                              String fileType =
                                  file!.files.first.extension.toString();
          
                              setState(() {
                                _uploadFileText =
                                    file.files.first.name.toString();
          
                                if (fileType == 'pdf') {
                                  _uploadFileIcon = Icons.picture_as_pdf;
                                }
                              });
                            } catch (e) {
                              debugPrint(e.toString());
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                _uploadFileIcon,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _uploadFileText,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 500,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AirColor.button,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormButton(
                          backcolor: AirColor.button,
                          buttonText: '지원서 제출',
                          callback: () => applyNavi(context, _applyKey),
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
                Footer()
                
              ],
            ),
          ),
        ),
        TopBar()
      ],
    ));
  }
}
