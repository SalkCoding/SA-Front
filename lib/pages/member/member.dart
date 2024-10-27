import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/member/member_model.dart';
import 'package:air_front/provider/member/member_provider.dart';
import 'package:air_front/widget/common/error.dart';
import 'package:air_front/widget/common/loading_circle.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:air_front/widget/member/members.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

//Topbar 상단에 있는 Member 페이지
//Swiper / 흐릿하게 만들기(ShaderMask) 이용
//데이터는 서버에서 받아올 예정(데이터가 다 안들어가져있음)
class Member extends ConsumerStatefulWidget {
  static String get routeName => 'Member';
  const Member({super.key});

  @override
  ConsumerState<Member> createState() => _MemberState();
}

class _MemberState extends ConsumerState<Member> {
  int swipeIndex = 0;
  List<bool> isPlusList = [true, true, true, true];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(memberProvider);

    // 로딩 화면
    if (data is MemberLoading) {
      return LoadingCircle();
    }

    // 에러가 발생했을 때
    if (data is MemberError) {
      return ServerError();
    }

    // 카드 데이터
    final Cards = [
      ...countingMembers(
          ref.read(memberProvider.notifier).getCellMembers("FLUTTER")),
      ...countingMembers(
          ref.read(memberProvider.notifier).getCellMembers("SPRING")),
      ...countingMembers(
          ref.read(memberProvider.notifier).getCellMembers("AI_RESEARCH")),
      ...countingMembers(
          ref.read(memberProvider.notifier).getCellMembers("DESIGN")),
    ];

    // 언제 CustomSwiper를 변경할지를 담은 index List
    List<SwiperIndexModel> swipeChangeIndex = [
      SwiperIndexModel(index: countingMembers(ref.read(memberProvider.notifier).getCellMembers("FLUTTER")).length, isPlus: isPlusList[0]),
      SwiperIndexModel(index: countingMembers(ref.read(memberProvider.notifier).getCellMembers("SPRING")).length + countingMembers(ref.read(memberProvider.notifier).getCellMembers("FLUTTER")).length, isPlus: isPlusList[1]),
      SwiperIndexModel(index: countingMembers(ref.read(memberProvider.notifier).getCellMembers("AI_RESEARCH")).length + countingMembers(ref.read(memberProvider.notifier).getCellMembers("SPRING")).length + countingMembers(ref.read(memberProvider.notifier).getCellMembers("FLUTTER")).length, isPlus: isPlusList[2]),
      SwiperIndexModel(index: countingMembers(ref.read(memberProvider.notifier).getCellMembers("DESIGN")).length + countingMembers(ref.read(memberProvider.notifier).getCellMembers("AI_RESEARCH")).length + countingMembers(ref.read(memberProvider.notifier).getCellMembers("SPRING")).length + countingMembers(ref.read(memberProvider.notifier).getCellMembers("FLUTTER")).length, isPlus: isPlusList[3]),
    ];

    // 인덱스 변경 함수
    int isChange(int index){
      for(int i = 0; i<4; i++){
        if(swipeChangeIndex[i].index == index && swipeChangeIndex[i].isPlus){
          isPlusList[i] = false;
          return 1;
        }
        if(swipeChangeIndex[i].index == index + 1 && !swipeChangeIndex[i].isPlus){
          isPlusList[i] = true;
          return -1;
        }
      }
      return 0;
    }

    return Scaffold(
      body: Stack(
        children: [
          // Swiper 및 TopBar, CustomPagination
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(ImgPath.background_image),
                fit: BoxFit.fitWidth,
                opacity: 0.3,
              ),
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
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(1),
                    ],
                    stops: const [0.0, 0.3],
                  ).createShader(bounds);
                },
                child: Center(
                  child: Container(
                    width: 1200,
                    height: 950,
                    child: Swiper(
                      onIndexChanged: (val){
                        setState(() {
                          swipeIndex += isChange(val);
                        });
                      },
                      duration: 1,
                      loop: false,
                      viewportFraction: getViewportFraction(),
                      scrollDirection: Axis.vertical,
                      itemCount: Cards.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Cards[index];
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Custom Swiper Pagination
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  // Unit 종류의 개수
                  // Flutter, Spring, Design, AI
                  4,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: swipeIndex == index ? AirColor.button : Colors.grey,
                    ),
                    width: 14,
                    height: 14,
                  ),
                ),
              ],
            ),
          ),
          const TopBar(),
        ],
      ),
    );
  }

  double getViewportFraction(){
    final height = MediaQuery.of(context).size.height;
    print("Media Height : $height");
    if(height >= 900){
      print("return value : 0.5");
      return 0.5;
    }
    if(height >= 700){
      print("return value : 0.6");
      return 0.6;
    }
    if(height >= 550){
      print("return value : 0.7");
      return 0.8;
    }
    if(height >= 500){
      print("return value : 0.7");
      return 0.85;
    }
    print("return value : 0.9");
    return 1;
  }

  List<Members> countingMembers(TeamData data) {
    List<Members> list = [];
    int chunkSize = 4;

    for (int i = 0; i < data.list.length; i += chunkSize) {
      late Members tmp;

      if (i == 0) {
        tmp = Members(teamName: data.teamName, aiiaMember: []);
      } else {
        tmp = Members(teamName: '', aiiaMember: []);
      }
      int end =
          (i + chunkSize < data.list.length) ? i + chunkSize : data.list.length;
      final lastData = tmp.copyWith(aiiaMember: data.list.sublist(i, end));
      list.add(lastData);
    }

    return list;
  }
}


// Custom Swiper에 필요한 모델
class SwiperIndexModel{
  final int index;
  final bool isPlus;

  SwiperIndexModel({
    required this.index,
    required this.isPlus,
  });

  SwiperIndexModel copyWith({
    int? index,
    bool? isPlus
  }){
    return SwiperIndexModel(index: index ?? this.index, isPlus: isPlus ?? this.isPlus);
  }
}