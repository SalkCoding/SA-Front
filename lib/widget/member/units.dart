import 'package:air_front/config/variable.dart';
import 'package:air_front/provider/member/unit_provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:air_front/widget/common/boxchat.dart';

class Units extends ConsumerWidget {
  final String imgpath;
  final String unitName;
  final String content;
  final Color color;
  final bool boxChat;
  bool animation;

  Units({required this.animation, required this.imgpath, required this.unitName, required this.content, required this.color, this.boxChat = false, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // boxChat ? BoxChat(title: 'Unit', img: ImgPath.unitIcon,) : SizedBox(height: 60,),
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        boxChat ? Positioned(top: - ratio.height * 70,  child: BoxChat(title: 'Unit', img: ImgPath.unitIcon,)) : SizedBox(),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 이미지 애니메이션
              animation ? Image.asset(imgpath,width: ratio.width * 600,)
              : Image.asset(imgpath, width: ratio.width*600,).animate().untint(duration: 1000.ms).fade(duration: 1000.ms),
          
          
              SizedBox(width: ratio.width * 50,),
          
              // 글자 애니메이션
              animation ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(unitName, style: AirTextStyle.position.copyWith(color: color, fontSize: ratio.width * 60),),
                  SizedBox(height: ratio.height * 35,),
                  Text(content, style: AirTextStyle.signUpsub.copyWith(color: color, fontSize: ratio.width * 40), ),
                ]
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(unitName, style: AirTextStyle.position.copyWith(color: color, fontSize: ratio.width * 60),).animate().untint(duration: 2000.ms).fade(duration: 2000.ms),
                  SizedBox(height: ratio.height * 35,),
                  Text(content, style: AirTextStyle.signUpsub.copyWith(color: color, fontSize: ratio.width * 40),).animate(delay: 1500.ms, onComplete: (controller) {
                if(controller.status == AnimationStatus.completed){
                  ref.read(unitAnimationProvider).animationchange(unitName);
                }
              }).untint(duration: 1500.ms).fade(duration: 1500.ms),
                ]
              )
            ],
          ),
        ),
      ],
    );
  }
}