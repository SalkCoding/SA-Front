import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/users/users.dart';
import 'package:air_front/pages/loading_page.dart';
import 'package:air_front/pages/mainpage/main_page.dart';
import 'package:air_front/pages/member/member.dart';
import 'package:air_front/pages/news/news.dart';
import 'package:air_front/pages/project/projects.dart';
import 'package:air_front/provider/user/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';

//거의 모든 페이지에 들어가는 상단바 위젯
//모든 상단바는 Stack을 이용하여 맨 위로 배치해 둔 것
//그 결과로 스크롤을 내리면 투명도를 조정해서 흐릿하게 아래에 깔려있는 페이지를 확인할 수 있다.
List<String> drowDownList = ["Unit", "Member"];

class TopBar extends ConsumerStatefulWidget {
  const TopBar({super.key});

  @override
  ConsumerState<TopBar> createState() => _TopBarState();
}

bool isHover = false;

class _TopBarState extends ConsumerState<TopBar> {
  String dropDownValue = "Member";

  @override
  Widget build(BuildContext context) {
    UsersBase? state = ref.watch(userProvider);
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFFF3FBFF).withOpacity(1),
          Colors.white.withOpacity(0.7),
          Colors.white.withOpacity(0)
        ],
        stops: const [0.0, 0.7, 1.0],
      )),
      height: isMobile(context) ? ratio.width * 350 : ratio.width * 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: ratio.width * 45,
              ),
              GestureDetector(
                onTap: () {
                  context.goNamed(MainPage.routeName);
                },
                child: Image.asset(
                  ImgPath.aiia_logo_blue,
                  width: ratio.width * 200,
                  height: ratio.height * 200,
                ),
              ),
              SizedBox(
                width: ratio.width * 40,
              ),
              topBarClickWidget(ishover: isHover),
              SizedBox(
                width: ratio.width * 40,
              ),
              InkWell(
                onTap: () {
                  context.goNamed(Projects.routeName);
                },
                child: Text('Project',
                    style: topbarTextStyle(isMobile: isMobile(context))),
              ),
              SizedBox(
                width: ratio.width * 40,
              ),
              InkWell(
                onTap: () async {
                  context.goNamed(News.routeName);
                },
                child: Text('News',
                    style: topbarTextStyle(isMobile: isMobile(context))),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '입부지원',
                  style: topbarTextStyle(isMobile: isMobile(context))
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  width: ratio.width * 40,
                ),
                (state is Users && state.id != null)
                    ? Text(
                        state.name + " 님",
                        style: topbarTextStyle(isMobile: isMobile(context))
                      )
                    : InkWell(
                        onTap: () {
                          context.goNamed('login');
                        },
                        child: Text('로그인',
                            style:
                                topbarTextStyle(isMobile: isMobile(context))),
                      ),
                SizedBox(
                  width: ratio.width * 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topBarClickWidget({
    required bool ishover,
  }) {
    // 모바일 버전일 경우에는 드롭다운
    if (isMobile(context))
      return DropdownButton(
        borderRadius: BorderRadius.circular(12),
        dropdownColor: AirColor.bubble,
        underline: SizedBox(),
        value: dropDownValue,
        icon: null,
        items: drowDownList.map(
          (e) {
            return DropdownMenuItem(
              child: GestureDetector(
                onTap: () {
                  context.goNamed('$e');
                  // if (e == "Member") {
                  //   context.goNamed(LoadingPage.routeName);
                  // } else {
                  //   context.goNamed('$e');
                  // }
                },
                child: Text(
                  '$e',
                  style: topbarTextStyle(isMobile: isMobile(context)),
                  textAlign: TextAlign.center,
                ),
              ),
              value: e,
            );
          },
        ).toList(),
        onChanged: (String? val) {
          setState(
            () {
              dropDownValue = val!;
            },
          );
        },
      );
    // PC 버전일 경우 마우스 이벤트 감지 Hover 사용,
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (e) {
        setState(() {
          isHover = false;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  context.goNamed(Member.routeName);
                },
                child: Text(
                  'People',
                  style: topbarTextStyle(isMobile: isMobile(context)),
                ),
              )
            ],
          ),
          ishover
              ? Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: InkWell(
                    onTap: () {
                      context.goNamed('Unit');
                    },
                    child: Text(
                      'Unit',
                      style: topbarTextStyle(isMobile: isMobile(context)),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }

  TextStyle topbarTextStyle({required bool isMobile}) {
    if (isMobile) {
      return AirTextStyle.mTopBar;
    } else {
      return AirTextStyle.topBar;
    }
  }
}
