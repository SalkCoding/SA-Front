import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/project/project.dart';
import 'package:air_front/widget/common/footer.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:air_front/widget/proejct/project_card.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:air_front/widget/common/boxchat.dart';

//Topbar에 있는 Project 누르면 나오는 페이지
//Swiper이용, 이미지는 로컬데이터이고 추후에 클릭 시 나오는 텍스트 데이터는 서버에서 받아올 예정
//애니메이터 사용 및 Swiper 봐두기

class Projects extends StatefulWidget {
  static String get routeName => 'project';
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

List<Project> Cards = [
  Project(
    id: 1,
    name: 'Meta Gachon',
    description: 'AI공학관 내 시설 통합 예약 플랫폼',
    imgPath: ImgPath.metagc_project,
  ),
  Project(
    id: 2,
    name: 'AIIA AIR',
    description: 'Finally, we are. AIIA 공식 홈페이지',
    imgPath: ImgPath.air_project,
  ),
  Project(
    id: 3,
    name: "Gachon IT's",
    description: 'IT 관련 전공생만을 위한 정보 커뮤니티',
    imgPath: ImgPath.its_project,
  ),
];

int idx = 0;

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    // List<Widget> Cards = context.watch<ProjectProvider>().getCard();
    // // List<Widget> Cards = [];
    // int idx = context.watch<ProjectProvider>().index;

    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(1),
                ],
                stops: const [0.0, 0.2],
              ).createShader(bounds);
            },
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(1),
                  ],
                  stops: const [0.0, 0.2],
                ).createShader(bounds);
              },
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImgPath.apply_back),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ratio.height * 250,
                    ),
                    BoxChat(
                      title: 'Project',
                      img: ImgPath.box,
                    ),
                    Expanded(
                      child: Swiper(
                        itemBuilder: (context, index) {
                          return IgnorePointer(
                            ignoring: idx == index ? false : true,
                            child: AnimatedOpacity(
                                opacity: idx == index ? 1 : 0.5,
                                duration: const Duration(microseconds: 500),
                                child: ProjectCard.fromModel(model: Cards[index],),),
                          );
                        },
                        index: idx,
                        onIndexChanged: (val) {
                          setState(() {
                            idx = val;
                          });
                        },
                        itemCount: Cards.length,
                        // itemHeight: ratio.height * 500,
                        // itemWidth: ratio.width * 400,
                        viewportFraction: 0.5,
                        scale: 0.5,
                        physics: const ScrollPhysics(),
                        control: const SwiperControl(
                          disableColor: Colors.black,
                          size: 50.0,
                        ),
                        pagination: const SwiperPagination(
                          // margin: EdgeInsetsDirectional.only(bottom: 70),
                          builder: DotSwiperPaginationBuilder(
                            activeColor: AirColor.button,
                            color: AirColor.notSeleted,
                            size: 12,
                            activeSize: 16,
                            space: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ratio.height * 70,
                    ),
                    Footer(),
                  ],
                ),
              ),
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }
}
