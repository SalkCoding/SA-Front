import "package:air_front/dto/post/post.dart";
import "package:air_front/repository/news/news_repository.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:collection/collection.dart';

// News 상세 데이터 Provider
final newsDetailProvider = Provider.family<PostDataModel?, String>((ref, id) {
  final state = ref.watch(newsProvider);

  if (state is! PostModel) {
    return null;
  }

  return state.posts.firstWhereOrNull((element) => element.id == id);
});



// News 전체 데이터 provider
final newsProvider = StateNotifierProvider<NewsNotifier, PostBase>((ref) {
  final repo = ref.watch(newsRepositoryProvider);

  return NewsNotifier(repo: repo);
});

class NewsNotifier extends StateNotifier<PostBase> {
  final NewsRepository repo;
  Set<int> loadedPages = {}; // 이미 로드된 페이지를 저장할 Set

  NewsNotifier({
    required this.repo,
  }) : super(PostLoading()) {
    getPost(0);
  }

  Future<void> getPost(int index) async {
    if (loadedPages.contains(index)) {
      print("이미 로드된 페이지입니다: $index");
      return;
    }
    
    print(index);
    try {
      PostModel? tmp;

      if (state is PostModel) {
        tmp = state as PostModel;
      }
      state = PostLoading();
      final resp = await repo.getPost(index);
      if (resp is PostModel) {
        final newData = resp as PostModel;

        // 페이지를 로드된 페이지 Set에 추가
        if (index == 0 && !(state is PostModel)) {
          state = resp;
          loadedPages.add(index);
          return;
        }

        // index가 현재 리스트의 길이보다 크거나 같다면, 끝에 추가
        if (index >= tmp!.posts.length / 10) {
          print("끝에 추가할거야");
          state = tmp.copywith(posts: [...tmp.posts, ...newData.posts]);
        } else {
          // 해당 index 위치에 데이터 삽입
          print("해당 인덱스에 데이터 추가");
          List<PostDataModel> newState = [...tmp.posts];
          newState.insertAll(index * 10, newData.posts); // index를 기준으로 위치 계산
          state = tmp.copywith(posts: newState);
        }
        loadedPages.add(index); // 페이지를 로드된 페이지 Set에 추가
      }
    } catch (e) {
      print(e);
      state = PostError(msg: "에러가 발생하였습니다.\n다시 시도해주세요.");
    }
  }

  Future<PostBase> getPostInfo(String id) async {
    final resp = await repo.getPostInfo(id);
    print(resp);
    return resp;
  }
}
