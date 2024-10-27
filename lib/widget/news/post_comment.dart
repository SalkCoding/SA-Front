import 'package:air_front/dto/comments/comments.dart';
import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';

//Newsinfo에 쓰이는 댓글 Widget 분리
class PostComment extends StatelessWidget {
  //당연히 데이터 이용하기 위해서 객체 변수 댓글을 받아야함
  const PostComment({
    super.key,
    required this.comment,
  });

  final Comments comment;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.author,
                    style: AirTextStyle.signUpText,
                  ),
                  SizedBox(
                    height: ratio.height * 30,
                  ),
                  Text(comment.content, style: AirTextStyle.subtitle1),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

// 대댓글
// Container(
//         margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
//     height: ratio.height * 250,
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey, width: 1),
//         borderRadius: BorderRadius.circular(8)),
//     child: Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('임명우', style: AirTextStyle.signUpsub,),
//               TextField(
//                 decoration: InputDecoration(
//                     hintText: "댓글을 입력해주세요.",
//                     border: InputBorder.none),
//               )
//             ],
//           ),
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   "등록",
//                   style: TextStyle(
//                       fontSize: 18,
//                       color: AirColor.button),
//                 )),
//           ],
//         )
//       ],
//     ),
//                             )