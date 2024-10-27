import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/provider/member/unit_provider.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:air_front/widget/member/units.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

//Topbar에 Member와 같이 있는 Unit을 누르면 볼 수 있는 페이지
//Swiper / 흐릿하게 만들기(ShaderMask) / animation (전부 로컬 데이터)
class Unit extends StatelessWidget { 
  static String get routeName => 'Unit'; 
  const Unit({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Stack(
      children: [
        Unit1(),
        const TopBar()
      ],
    ));
  }
}

class Unit1 extends ConsumerWidget {
  const Unit1({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {    

  List<Widget> Cards = [
    Units(animation: ref.watch(unitAnimationProvider).frontAnimation, imgpath: ImgPath.flutter_unit, unitName: "Flutter UNIT", content: "구글의 차세대 프레임워크 Flutter를 활용하여 사용자와 상호작용할 수\n있는 사용자 인터페이스를 개발하는 프론트엔드 담당 UNIT입니다.", color: AirColor.flutter_unit, boxChat: true,),
    Units(animation: ref.watch(unitAnimationProvider).backAnimation, imgpath: ImgPath.spring_unit, unitName: "Spring UNIT", content: "JVM 기반의 프레임워크인 Spring을 활용하여 사용자가 필요로 하는\n정보를 저장, 관리, 전달하기 위한 서버, 데이터베이스, API 등을 총괄하는\n백엔드 담당 UNIT입니다.", color: AirColor.spring_unit,),
    Units(animation: ref.watch(unitAnimationProvider).aiAnimation, imgpath: ImgPath.ai_unit, unitName: "AI R&D UNIT", content: "PyTorch를 활용하여 플랫폼에 적용 가능한 머신 러닝, 딥러닝 모델을\n개발 및 연구하고, 도출되는 사용자 데이터를 분석하여 새로운 가치를\n창출하는 인공지능 담당 UNIT입니다.", color: AirColor.ai_unit,),
    Units(animation: ref.watch(unitAnimationProvider).designAnimation, imgpath: ImgPath.design_unit, unitName: "Design UNIT", content: "동아리 “AIIA”를 하나의 브랜드로 인식하여 적합한 홍보 콘텐츠를\n디자인하고, 동아리 자체 제작 플랫폼의 로고 및 브랜딩, UX/UI 구성 등을\n담당하는 UNIT입니다.", color: AirColor.design_unit,),
  ];
  
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
            image: AssetImage(ImgPath.background_image),
            fit: BoxFit.fitWidth,
            opacity: 0.3),
      ),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.1),
              Colors.white.withOpacity(1),
            ],
            stops: const [0.0, 0.2],
          ).createShader(bounds);
        },
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(1),
              ],
              stops: const [0.0, 0.3],
            ).createShader(bounds);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Swiper(
                loop: false,
                duration: 1,
                viewportFraction: isMobile(context) ? 0.3 : 0.5,
                scrollDirection: Axis.vertical,
                pagination: SwiperPagination(
                  margin: EdgeInsets.only(left: ratio.width * 50),
                  alignment: Alignment.centerLeft,
                  builder: DotSwiperPaginationBuilder(
                      activeColor: AirColor.button,
                      color: AirColor.notSeleted,
                      size: 12,
                      activeSize: 16,
                      space: ratio.width * 40,),
                ),
                itemCount: Cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return Cards[index];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


