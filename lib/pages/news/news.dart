import 'package:air_front/config/default_layout.dart';
import 'package:air_front/config/function.dart';
import 'package:air_front/dto/post/post.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/pages/news/newsinfo.dart';
import 'package:air_front/provider/news/news_provider.dart';
import 'package:air_front/widget/common/boxchat.dart';
import 'package:air_front/widget/common/error.dart';
import 'package:air_front/widget/common/footer.dart';
import 'package:air_front/widget/common/loading_circle.dart';
import 'package:air_front/widget/common/topbar.dart';
import 'package:air_front/widget/news/newsbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

//Topbar 상단 News페이지
//Paging 기능은 post_provider.dart와 연동하여 사용함
//데이터는 서버에서 받아옴
class News extends ConsumerStatefulWidget {
  static String get routeName => 'news';
  const News({super.key});

  @override
  ConsumerState<News> createState() => _NewsState();
}

int currentpage = 1;

class _NewsState extends ConsumerState<News> {

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(newsProvider);
    if (posts is PostModel) {
      final data = posts as PostModel;
      int totalpages = (data.count! / 10).ceil();
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImgPath.apply_back),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  // 맨위 상단 검색바와 Divider
                  NewsTopBar(),

                  // 뉴스 리스트
                  NewsList(data.count!, posts: data.posts),

                  // 하단 Pagination을 위한 아이콘
                  bottomPagination(totalpages: totalpages, ref: ref),

                  // 하단 Footer
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Spacer(),
                        Footer(),
                      ],
                    ),
                  ),
                ],
              ),
              TopBar()
            ],
          ),
        ),
      );

    // 데이터 로딩중일 때
    } else if (posts is PostLoading) {
      print("로딩중");
      return LoadingCircle();
    // 그 외 에러상황들
    // 뉴스 데이터를 처음부터 불러오고,
    // 그래도 오류이면 오류 화면 출력
    } else {
      ref.read(newsProvider.notifier).getPost(0);
      return ServerError();
    }
  }

  // 상단 검색바 및 Divier Row
  SliverPadding NewsTopBar() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: ratio.width * 250),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            SizedBox(
              height: ratio.height * 300,
            ),
            Column(
              children: [
                //맨위 상단바 모바일과 PC 버전 구분
                !isMobile(context) ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoxChat(title: 'News', img: ImgPath.newsIcon),
                    SizedBox(
                      width: ratio.width * 40,
                    ),
                    SizedBox(),
                    NewsSearchBar()
                  ],
                ) :
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoxChat(title: 'News', img: ImgPath.newsIcon),
                    SizedBox(height: 10,),
                    NewsSearchBar()
                  ],
                ),
                SizedBox(
                  height: ratio.height * 30,
                ),
                Divider(
                  color: AirColor.button,
                  thickness: 4,
                ),
                newsbar(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //News 검색바
  Container NewsSearchBar() {
    return Container(
      height: 40,
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AirColor.blue1,
            ),
          ),
          hintStyle: AirTextStyle.searchPh,
          hintText: '검색어를 입력해주세요.',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AirColor.blue1,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AirColor.blue1,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  // 뉴스 RowBar 리스트
  SliverPadding NewsList(int totalCount, {required List<PostDataModel> posts}) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: ratio.width * 250),
      sliver: SliverList.builder(
        // 마지막이면 10으로 나눈값의 나머지만큼 출력
        itemCount: totalCount < currentpage * 10 ? totalCount % 10 : 10,
        itemBuilder: (BuildContext context, int index) {
          // pagination에 따른 인덱스 값 조정
          final nowIndex = (((posts.length / 10) - 1) * 10 + index).toInt();
          print("nowIndex : ${(((posts.length / 10) - 1) * 10 + index).toInt()}");
          return NewsRow(
            totalCount: totalCount,
            post: posts[nowIndex],
            context: context,
            index: index,
          );
        },
      ),
    );
  }

  //뉴스 RowBar
  InkWell NewsRow({
    required PostDataModel post,
    required int index,
    required BuildContext context,
    required int totalCount,
  }) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          NewsInfo.routeName,
          pathParameters: {'nid': post.id},
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: Center(
                    child: Text(
                  "${totalCount - index - (currentpage - 1) * 10}",
                  style: newsTextStyle(),
                )),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: ratio.width * 150),
                child: Center(
                    child: Text(
                  post.title,
                  overflow: TextOverflow.ellipsis,
                  style: AirTextStyle.pageNum.copyWith(fontSize: isMobile(context) ? 5 : 18,),
                )),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                child: Center(
                  child: Text(
                    "관리자",
                    style: newsTextStyle(),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                child: Center(
                    child: Text(
                  //posts[index + 10 * indexvar].date
                  '2024-02-22',
                  style: newsTextStyle(),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding bottomPagination({
    required int totalpages,
    required WidgetRef ref,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_double_arrow_left),
              iconSize: 30,
              color: Colors.grey,
            ),
            SizedBox(
              width: ratio.width * 10,
            ),
            IconButton(
              onPressed: () {
                if (currentpage == 1) {
                  null;
                } else {}
              },
              icon: Icon(Icons.keyboard_arrow_left),
              iconSize: 30,
              color: Colors.grey,
            ),
            SizedBox(
              width: ratio.width * 90,
            ),
            ...List.generate(
              totalpages,
              (index) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: index + 1 == currentpage ? AirColor.button : null,),
                width: 40,
                child: ListTile(
                  onTap: index + 1 == currentpage ? null : () async {
                    ref.read(newsProvider.notifier).getPost(index);
                    setState(() {
                      currentpage = index + 1;
                    });
                  },
                  title: Center(
                    child: Text(
                      '${index + 1}',
                      style: index + 1 == currentpage
                          ? AirTextStyle.pageNum.copyWith(color: Colors.white)
                          : AirTextStyle.pageNum,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: ratio.width * 90,
            ),
            IconButton(
              onPressed: () {
                if (currentpage == totalpages) {
                  null;
                } else {}
              },
              icon: Icon(Icons.keyboard_arrow_right),
              iconSize: 30,
              color: Colors.grey,
            ),
            SizedBox(
              width: ratio.width * 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_double_arrow_right),
              iconSize: 30,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle newsTextStyle(){
    return AirTextStyle.pageNum.copyWith(fontWeight: FontWeight.w300, fontSize: isMobile(context) ? 9 : 18,);
  }
}
