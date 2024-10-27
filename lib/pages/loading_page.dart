import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingPage extends StatelessWidget {
  static String get routeName => 'loading';
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage(ImgPath.apply_back),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://i.seadn.io/gae/GXOvIugLDLAtqI2PmWu7ZHIJtOvgsjILU0V2TIQoDbhUD3_7rkRItfdHoW1MOl30UU2IxJIWgx9WQlLZiehrJ5SzTfsWUyj_YuEL1Q?auto=format&dpr=1&w=1000',
                ),
                Text(
                  '업데이트 중 입니다!',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Audiowide',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        TopBar(),
      ]),
    );
  }
}
