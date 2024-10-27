import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';

//News페이지에 사용되는 Newsbar 즉, 상단에 NO, 작성자, 작성일, 제목을 그리는 UI 위젯 분리
class newsbar extends StatelessWidget {
  const newsbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AirColor.button, width: 1))),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: ratio.height * 80,
              child: Center(
                  child: Text(
                'NO',
                style: newsTS(context)
              )),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              height: ratio.height * 80,
              child: Center(
                  child: Text(
                '제목',
                style: newsTS(context)
              )),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: ratio.height * 80,
              child: Center(
                  child: Text(
                '작성자',
                style: newsTS(context)
              )),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: ratio.height * 80,
              child: Center(
                  child: Text(
                '작성일',
                style: newsTS(context),
              )),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle newsTS(BuildContext context){
    return AirTextStyle.boardTitle.copyWith(fontSize: isMobile(context) ? 10 : 21);
  }
}

