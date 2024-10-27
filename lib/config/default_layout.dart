import 'package:air_front/config/variable.dart';
import 'package:air_front/widget/common/footer.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:flutter/material.dart';

class DefaultLayoutScreen extends StatelessWidget {
  final Widget child;
  final AssetImage backgroundImg;
  
  const DefaultLayoutScreen({
    required this.child,
    this.backgroundImg = const AssetImage(ImgPath.apply_back),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: backgroundImg,
                  fit: BoxFit.cover,
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: child
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Footer(),
                  ),
                ],
              )),
          TopBar(),
        ],
      ),
    );
  }
}
