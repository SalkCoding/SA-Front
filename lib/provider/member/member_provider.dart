import 'package:air_front/dto/member/member_model.dart';
import 'package:air_front/repository/member/member_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memberProvider = StateNotifierProvider<MemberNotifier, MemberBase>((ref) {
  final repo = ref.watch(memberResitory);

  return MemberNotifier(repo: repo);
});

class MemberNotifier extends StateNotifier<MemberBase>{
  final MemberRepository repo;

  MemberNotifier({
    required this.repo,
  }):super(MemberLoading()){
    getMembers();
  }

  void getMembers() async {
    final resp = await repo.getMembers();
    print(resp);
    state = resp;
  }

  TeamData getCellMembers(String cell){
    final pState = state as MemberList;
    final list = pState.data.where((e) => e.cell == cell).toList();
    final data = TeamData(totalCount: list.length, teamName: cell, list: list);
    return data;
  }
}