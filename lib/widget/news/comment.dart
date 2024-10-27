import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/comments/comments.dart';
import 'package:air_front/widget/common/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Comment extends StatefulWidget {
  final Comments comments;

  const Comment({
    required this.comments,
    super.key,
  });

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final TextEditingController controller = TextEditingController();

  bool comment = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AirColor.notSeleted, width: 1,),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.comments.author,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.comments.content,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                '2004.02.04 11:23',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    comment = !comment;
                  });
                },
                child: Text(
                  '답글 쓰기',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          comment ? Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AirColor.notSeleted, width: 1),
                      left: BorderSide(color: AirColor.notSeleted, width: 1),
                    )
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(child: WriteComment(controller: controller,)),
              ],
            ),
          ) : SizedBox()
        ],
      ),
    );
  }
}

class WriteComment extends StatelessWidget {
  final TextEditingController controller;
  const WriteComment({
    required this.controller,
    super.key,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 22, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AirColor.notSeleted, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '사용자',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          CustomTextField(kind: '대댓글', hint: '댓글을 입력하세요.', controller: controller, validator: CommentValidator),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(onPressed: (){}, child: Text('등록', style: AirTextStyle.CommentButton,),),
          )
        ],
      ),
    );
  }
}

class TagComment extends StatelessWidget {
  const TagComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                child: Text(
                  '사용자',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              alignment: Alignment(0.9, 1.3),
              child: Text(
                '등록',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
