import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:flutter/material.dart';

class NewsInfoBar extends StatelessWidget {
  final String writer;
  final String date;
  const NewsInfoBar({
    required this.writer,
    required this.date,
    super.key,
  });

  String changeDate(String date){
    DateTime parsedDate = DateTime.parse(date);

    String formattedDateTime = "${parsedDate.year}-${parsedDate.month.toString().padLeft(2, '0')}-${parsedDate.day.toString().padLeft(2, '0')} ${parsedDate.hour.toString().padLeft(2, '0')}:${parsedDate.minute.toString().padLeft(2, '0')}";
    print("Formatted DateTime: $formattedDateTime");
    return formattedDateTime;
    
  }

  double getFontSize(BuildContext context){
    return isMobile(context) ? 10 : 18;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: isMobile(context) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(
              '작성자',
              style: AirTextStyle.boardTitle.copyWith( fontSize: getFontSize(context)),
            ),
            SizedBox(
              width: ratio.width * 20,
            ),
            Text(
              writer,
              style: AirTextStyle.pageNum.copyWith(fontWeight: FontWeight.w400, fontSize: getFontSize(context)),
            ),],
            ),
          SizedBox(
            width: ratio.width * 50,
          ),
          Row(
            children: [
              Text(
                '작성일',
                style: AirTextStyle.boardTitle.copyWith(fontSize: getFontSize(context)),
              ),
              SizedBox(
                width: ratio.width * 20,
              ),
              //post.date
              Text(
                changeDate(date),
                style: AirTextStyle.pageNum.copyWith(fontWeight: FontWeight.w400,  fontSize: getFontSize(context)),
              ),
              SizedBox(
                width: ratio.width * 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
