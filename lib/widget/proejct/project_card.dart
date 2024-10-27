import 'dart:ui';
import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/project/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Project 페이지에 이용되는 하나의 프로젝트를 나타내는 위젯
//즉, 이 프로젝트 카드라는 위젯이 3개가 이용되는 구조
class ProjectCard extends StatefulWidget {
  final String imgPath;
  final String description;
  final String name;

  ProjectCard({
    super.key,
    required this.imgPath,
    required this.description,
    required this.name,
  });

  factory ProjectCard.fromModel({
    required Project model,
  }) {
    return ProjectCard(
        imgPath: model.imgPath,
        name: model.name,
        description: model.description,
      );
  }

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

bool isHover = false;

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // 모바일 버전과 웹 버전 간격 차이
          isMobile(context) ?
          SizedBox(
            height: ratio.height * 250,
          )
          : SizedBox(
            height: 40,
          ),

          // 마우스 이벤트
          MouseRegion(
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
            child:  isHover
                ? 
                Stack(
                    children: [
                      Container(
                        height: ratio.width * 1000 / 3 * 2,
                        width: ratio.width * 1000,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                              sigmaX: 5, sigmaY: 5), // blur 효과 적용
                          child: Image.asset(
                            widget.imgPath,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: ratio.width * 1000 / 3 * 2,
                        width: ratio.width * 1000,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AirColor.hover.withOpacity(0.6),
                        ),
                        child: Center(
                            child: Text(
                          widget.description,
                          style: AirTextStyle.projectDescription,
                        )),
                      ),
                    ],
                  )
                : Image.asset(
                  height: ratio.width * 1000 / 3 * 2,
                        width: ratio.width * 1000,
                    widget.imgPath,
                    fit: BoxFit.fill,
                  ),
                
          ),
          SizedBox(
            height: ratio.height * 10,
          ),
          Text(
            // cardTitle,
            widget.name,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: isMobile(context) ? 20 : 32,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}


//  isHover[0]
//                 ? 
//                 Stack(
//                     children: [
//                       Container(
//                         height: ratio.width * 1000 / 3 * 2,
//                         width: ratio.width * 1000,
//                         child: ImageFiltered(
//                           imageFilter: ImageFilter.blur(
//                               sigmaX: 5, sigmaY: 5), // blur 효과 적용
//                           child: Image.asset(
//                             imgPath,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: ratio.width * 1000 / 3 * 2,
//                         width: ratio.width * 1000,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: AirColor.hover.withOpacity(0.6),
//                         ),
//                         child: Center(
//                             child: Text(
//                           description,
//                           style: AirTextStyle.projectDescription,
//                         )),
//                       ),
//                     ],
//                   )
//                 : Image.asset(
//                   height: ratio.width * 1000 / 3 * 2,
//                         width: ratio.width * 1000,
//                     imgPath,
//                     fit: BoxFit.fill,
//                   ),