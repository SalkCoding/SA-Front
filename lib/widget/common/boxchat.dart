import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';

class BoxChat extends StatelessWidget {
  final String title;
  final String img;
  final bool center;
  const BoxChat({
    required this.title,
    required this.img,
    this.center = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          img,
          width: ratio.height * 100,
        ),
        SizedBox(
          width: 20,
        ),
        Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: - ratio.height * 40,
                  child: Image.asset(
                    ImgPath.chat_tail,
                    width: ratio.height * 100,
                  ),
                ),
                Container(
                  width: ratio.height * 250,
                  height: ratio.height * 250 / 7 * 2,
                  decoration: BoxDecoration(
                    color: AirColor.bubble,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: AirTextStyle.boxChat.copyWith(fontSize: isMobile(context) ? 16 : 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
        // Stack(
        //   children: [
        //     Image.asset(ImgPath.bubble_chat,),
        //     Positioned(
        //       top: 12,
        //       left: 23,
        //       child: Container(
        //         width: 155,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Text(
        //               title,
        //               style: AirTextStyle.boxChat,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
