import 'dart:convert';
import 'dart:typed_data';
import 'package:air_front/config/function.dart';
import 'package:air_front/dto/member/member_model.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/common/boxchat.dart';
import 'package:air_front/widget/member/info.dart';
import 'package:flutter/material.dart';

//Members 페이지에 InfoUnit을 4개씩 두기위한 하나의 Container임
//Swiper를 이용할 때 리스트를 기준으로 반환시키기 때문에 Members가 여러개 들어가는 List가 필요해서
class Members extends StatelessWidget {
  final String teamName;
  final List<MemberModel> aiiaMember;
  final bool boxChat;
  const Members({
    required this.teamName,
    required this.aiiaMember,
    this.boxChat = false,
    super.key,
  });

  // 위젯 변경
  Members copyWith({
    String? teamName,
    List<MemberModel>? aiiaMember,
    bool? boxChat,
  }){
    return Members(teamName: teamName ?? this.teamName, aiiaMember: aiiaMember ?? this.aiiaMember, boxChat: boxChat ?? this.boxChat,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  teamName,
                  style: AirTextStyle.position
                      .copyWith(fontWeight: FontWeight.w900,),
                ),
              ),
              
              Container(
                height: 320,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: aiiaMember.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AIIAUnit(member: aiiaMember[index],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

String temporaryImg = 'assets/images/tem.png';

class AIIAUnit extends StatefulWidget {
  final MemberModel member;

  const AIIAUnit({
    required this.member,
    super.key,
  });

  @override
  State<AIIAUnit> createState() => _AIIAUnitState();
}

class _AIIAUnitState extends State<AIIAUnit> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onHover: (val) {
          setState(() {
            isHovered = val;
          });
        },
        onTap: isMobile(context) ? null : () => showInfo(context, widget.member),
        highlightColor: AirColor.button,
        child: Container(
          width: 240,
          height: 555,
          decoration: BoxDecoration(
            border: isHovered
                ? Border.all(color: AirColor.cardHover.withOpacity(0.6))
                : null,
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 3,
                spreadRadius: 1,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              widget.member.img == null ? 
              Image.asset(
                    ImgPath.noImage,
                    width: 200,
                    height: 140,
                  ) :
              Image.memory(
                base64Decode(widget.member.img!),
                width: 200,
                height: 140,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.member.name,
                style: AirTextStyle.unitName.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                widget.member.major,
                style: AirTextStyle.subtitle1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                '${widget.member.level} / ${widget.member.cell}',
                style: AirTextStyle.subtitle1.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text('-', style: AirTextStyle.git),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showInfo(BuildContext context, MemberModel user) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
          backgroundColor: Colors.transparent, child: Information(user: user));
    },
  );
}
