import 'dart:convert';
import 'dart:typed_data';

import 'package:air_front/dto/member/member_model.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/member/members.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

//Member페이지에 해당 Member를 클릭하면 나오는 카드 위젯
class Information extends StatelessWidget {
  //해당 멤버의 데이터를 받아야하기 때문에 Users 데이터를 변수로 받음
  final MemberModel user;
  const Information({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.6)),
              width: ratio.width * 1500,
              height: ratio.height * 1000,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            width: ratio.width * 1500,
            height: ratio.height * 1000,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoUnit(
                      img: user.img,
                      name: user.name,
                      dep: user.major,
                      position: user.level,
                      field: user.cell,
                      git: '- / -',
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AirColor.bubble,
                          borderRadius: BorderRadius.circular(8)),
                      width: ratio.width * 700,
                      height: ratio.height * 70,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 9, 0, 0),
                        child: Text('email', style: AirTextStyle.infoText),
                      ),
                    ),
                    SizedBox(height: ratio.height * 40),
                    Text(
                      '참여 프로젝트',
                      style: AirTextStyle.infoText.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: ratio.height * 10),
                    Container(
                      decoration: BoxDecoration(
                          color: AirColor.bubble,
                          borderRadius: BorderRadius.circular(8)),
                      width: ratio.width * 700,
                      height: ratio.height * 180,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('-', style: AirTextStyle.infoText),
                            SizedBox(height: ratio.height * 7),
                            Text('-', style: AirTextStyle.infoText),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ratio.height * 40),
                    Text(
                      '개인 프로젝트',
                      style: AirTextStyle.infoText.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: ratio.height * 10),
                    Container(
                      decoration: BoxDecoration(
                          color: AirColor.bubble,
                          borderRadius: BorderRadius.circular(8)),
                      width: ratio.width * 700,
                      height: ratio.height * 180,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('-', style: AirTextStyle.infoText),
                            SizedBox(height: ratio.height * 7),
                            Text('-', style: AirTextStyle.infoText),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//Member페이지에 한 줄에 있는 하나의 카드 위젯
class InfoUnit extends StatelessWidget {
  //필요한 데이터들을 변수로 받는다.
  final String name, dep, position, field, git;
  final String? img;
  const InfoUnit({
    required this.name,
    required this.dep,
    required this.position,
    required this.field,
    required this.git,
    this.img,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ratio.width * 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          img == null
              ? Image.asset(
                  ImgPath.noImage,
                  width: ratio.width * 250,
                  height: ratio.height * 250,
                )
              : Image.memory(
                  base64Decode(img!),
                  width: ratio.width * 250,
                  height: ratio.height * 250,
                  errorBuilder: (context, error, stackTrace) {
                    // 이미지 에러 발생시
                    return Image.asset(
                      ImgPath.noImage,
                      height: ratio.height * 300,
                      alignment: Alignment.topLeft,
                    );
                  },
                ),
          SizedBox(
            height: ratio.height * 18,
          ),
          Text(
            name,
            style: AirTextStyle.unitName,
          ),
          SizedBox(
            height: ratio.height * 19,
          ),
          Text(
            dep,
            style: AirTextStyle.infoText,
          ),
          SizedBox(
            height: ratio.height * 5,
          ),
          Text('$position / $field', style: AirTextStyle.infoText),
          SizedBox(
            height: ratio.height * 19,
          ),
          Text(git, style: AirTextStyle.git),
        ],
      ),
    );
  }
}
