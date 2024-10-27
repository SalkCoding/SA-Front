import 'package:air_front/config/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroRow extends StatelessWidget {
  final String text, image;
  final bool reverse;

  IntroRow({
    super.key,
    required this.text,
    required this.image,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    // 뒤집힌거
    if (reverse) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: ratio.width * 250),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: -ratio.width * 130,
                  top: ratio.width * 150,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(-1.0, 1.0),
                    child: Image.asset(
                      ImgPath.chat_tail,
                      width: ratio.width * 200,
                    ),
                  ),
                ),
                Container(
                  width: ratio.width * 1200,
                  height: ratio.width * 1200 / 7 * 2,
                  decoration: BoxDecoration(
                    color: AirColor.bubble,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      text,
                      style: AirTextStyle.basicText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: ratio.width * 150,
            ),
            Container(
              width: ratio.width * 250,
              decoration: const BoxDecoration(
                  // color: Colors.amber,
                  ),
              child: Image.asset(image),
            ),
          ],
        ),
      );

      // 안뒤집힌거
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: ratio.width * 150),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: ratio.width * 250,
              decoration: const BoxDecoration(
                  // color: Colors.amber,
                  ),
              child: Image.asset(image),
            ),
            SizedBox(
              width: ratio.width * 150,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: -ratio.width * 130,
                  top: ratio.width * 150,
                  child: Image.asset(
                    ImgPath.chat_tail,
                    width: ratio.width * 200,
                  ),
                ),
                Container(
                  width: ratio.width * 1200,
                  height: ratio.width * 1200 / 7 * 2,
                  decoration: BoxDecoration(
                    color: AirColor.bubble,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      text,
                      style: AirTextStyle.basicText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
