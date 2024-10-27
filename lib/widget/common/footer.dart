import 'package:air_front/config/variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final double height;
  const Footer({
    this.height = 80,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white.withOpacity(0.1), Colors.white.withOpacity(0.4), Color(0xFF2FAFF), Color(0xFFEAF7FF), AirColor.bubble,],
          ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '2024 © AIIA. All Rights Reserved.',
            style: AirTextStyle.footer,
          ),
        ],
      ),
    );
  }
}
