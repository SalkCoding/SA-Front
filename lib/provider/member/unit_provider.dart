import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final unitAnimationProvider = ChangeNotifierProvider<UnitAnimationNotifier>((ref){
  return UnitAnimationNotifier();
});

//Unit 페이지 애니메이션 및 Hover 기능(마우스 이벤트에 따라서 Member와 Unit 텍스트 보이는거) 변수 관리 provider
//크게 별거 없어서 확인만
class UnitAnimationNotifier extends ChangeNotifier{
  
  bool frontAnimation = false;
  bool backAnimation = false;
  bool aiAnimation = false;
  bool designAnimation = false;

  void animationchange(String unit){
    if(unit == 'Flutter UNIT'){
      frontAnimation = true;
    }else if(unit == 'Spring UNIT'){
      backAnimation = true;
    }else if(unit == 'AI R&D UNIT'){
      aiAnimation = true;
    }else if(unit == 'Design UNIT'){
      designAnimation = true;
    }else{
      return;
    }
    notifyListeners();
  }
}