import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class IntroTitle extends StatelessWidget {
  const IntroTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return // title
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Weaver",
                style: TextStyle(
                  color: AirColor.navy,
                  fontSize: ratio.width * 370,
                  fontFamily: 'Audiowide',
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: 40,),
              GradientText(
                "Make\nDeveloper\nOne",
                colors: [
                  Colors.blueGrey,
                  Colors.blueAccent.withOpacity(0.8),
                ],
                style: TextStyle(
                  fontSize: ratio.width * 100,
                  fontFamily: 'BrunoAce',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ).animate().untint(duration: 700.ms).fade(duration: 700.ms).moveY(duration: 700.ms, begin: -100),
        );
  }
}
