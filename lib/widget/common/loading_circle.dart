import 'package:air_front/config/default_layout.dart';
import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayoutScreen(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              CircularProgressIndicator(
                color: AirColor.button,
              ),
            ],
          ),
        ),
      );
  }
}