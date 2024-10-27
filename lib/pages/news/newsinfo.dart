import 'dart:convert';
import 'dart:typed_data';

import 'package:air_front/config/default_layout.dart';
import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/dto/post/post.dart';
import 'package:air_front/provider/news/news_provider.dart';
import 'package:air_front/widget/common/boxchat.dart';
import 'package:air_front/widget/common/error.dart';
import 'package:air_front/widget/common/loading_circle.dart';
import 'package:air_front/widget/news/comment.dart';
import 'package:air_front/widget/news/news_info_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

//News페이지에서 해당 게시글로 이동하는 페이지
//페이지 이동할 때 해당 게시글 객체의 데이터를 넘겨서 사용함(아직 댓글은 제대로 구현 못함)
class NewsInfo extends ConsumerStatefulWidget {
  static String get routeName => 'newsInfo';
  final String nid;
  const NewsInfo({
    required this.nid,
    super.key,
  });

  @override
  ConsumerState<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends ConsumerState<NewsInfo> {
  PostBase data = PostLoading();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 데이터 할당
    initialize();
  }

  Future<void> initialize() async {
    final resp = await ref.read(newsProvider.notifier).getPostInfo(widget.nid);
    setState(() {
      data = resp;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data is PostLoading) {
      return LoadingCircle();
    }
    else if(data is PostDataModel){
      final postBase = data as PostDataModel;
      return DefaultLayoutScreen(
      child: Column(
        children: [
          SizedBox(
            height: ratio.height * 350,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ratio.width * 150,
            ),
            child: Column(
              children: [
                // 뉴스 제목바
                NewsInfoTopBar(post: postBase),
                SizedBox(
                  height: ratio.height * 30,
                ),
                Divider(
                  color: AirColor.button,
                  thickness: 4,
                ),
                // 뉴스 인포바
                NewsInfoBar(writer: postBase.authorName, date: postBase.createdTime,),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),

                // 본문 내용
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: postBase.blocks == null
                                ? 0
                                : postBase.blocks!.length,
                            itemBuilder: (context, index) {
                              // 텍스트
                              if (postBase.blocks![index].type == 'Text')
                                return Text(
                                  postBase.blocks![index].content,
                                  style: AirTextStyle.signUpText,
                                );
                              // 이미지
                              else {
                                Uint8List imageBytes = base64Decode(postBase.blocks![index].content);
                                return Image.memory(
                                  alignment: Alignment.topLeft,
                                  imageBytes,
                                  height: ratio.height * 200,
                                  errorBuilder: (context, error, stackTrace) {
                                    // 이미지 에러 발생시
                                    return Image.asset(
                                      ImgPath.noImage,
                                      height: ratio.height * 300,
                                      alignment: Alignment.topLeft,
                                    );
                                  },
                                );
                              }
                            })
                      ]),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AirColor.fileback,
                    border:
                        Border(top: BorderSide(color: Colors.grey, width: 1)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '첨부파일',
                          style: AirTextStyle.pageNum,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ratio.height * 20,
                ),
                Divider(
                  color: AirColor.button,
                  thickness: 1,
                ),
                SizedBox(
                  height: ratio.height * 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(ImgPath.chat),
                    Text(
                      " 댓글 ${postBase.comments == null ? "0" : postBase.comments!.length}",
                      style: TextStyle(fontSize: 18, color: AirColor.button),
                    )
                  ],
                ),
                SizedBox(
                  height: ratio.height * 40,
                ),
                WriteComment(
                  controller: controller,
                ),
                SizedBox(
                  height: ratio.height * 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Row(
                          children: [
                            Text(
                              '목록으로 돌아가기',
                              style:
                                  AirTextStyle.signupBt.copyWith(fontSize: 18),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: AirColor.button,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    }else{
      return ServerError();
    }
    
  }

  Widget NewsInfoTopBar({
    required PostDataModel post,
  }) {
    return !isMobile(context) ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BoxChat(title: 'News', img: ImgPath.newsIcon),
        SizedBox(),
        Text(
          post.title,
          style: AirTextStyle.position.copyWith(color: Colors.black),
        ),
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ],
    ) : Column(
      children: [
        BoxChat(title: 'News', img: ImgPath.newsIcon),
        Text(
          post.title,
          style: AirTextStyle.position.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
