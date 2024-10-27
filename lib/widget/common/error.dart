import 'package:air_front/config/default_layout.dart';
import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';

class ServerError extends StatelessWidget {
  const ServerError({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayoutScreen(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Text(
                "에러가 발생하였습니다.\n다시 시도해주세요.",
                style: TextStyle(
                  fontSize: 20,
                  color: AirColor.button,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
  }
}