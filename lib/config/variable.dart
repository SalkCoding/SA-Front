import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/*
variable.dart

- 앱 내부 아이콘 및 이미지
- 앱 색상
- 이용약관
- 앱 텍스트 스타일
*/

/*
앱 내부 아이콘 및 이미지

aiia_logo : 투명 배경 하얀색 돌고래
aiia_logo_blue : 투명 배경 파란색 돌고래
background_image : 배경에 있는 웨이브 그림
*/

// 토큰 변수명
final IMAGE_TOKEN = 'IMAGE_TOKEN';

//반응형 웹을 위한 변수(현재 디바이스 크기 설정 변수)
late Size ratio;

//http 관리 패키지
//final dio = Dio();

//이미지 파일 서버 주소
const String Image_URL = "https://files.aiia-gcu.com/";

//OAuth 서버 주소
const String OAuth_URL = "http://210.102.178.161:8081/";

//AIR 서버 주소
const String BASE_URL = "http://146.56.96.206:50002/";

//로그인/회원가입 메타가천 서버 주소
const String AUTH_URL = "https://meta.aiia-gcu.com/";


class ImgPath {
  ImgPath._();
  static const String aiia_logo = "assets/images/AIIA_logo.png";
  static const String aiia_logo_blue = "assets/images/AIIA_logo_blue.png";
  static const String aiia_logo_main = "assets/images/AIIA_logo_main.png";
  static const String background_image = "assets/images/background_image.png";
  static const String gachon_logo = "assets/images/gachon_logo.png";
  static const String metagc_project = "assets/images/metagc_project.png";
  static const String air_project = "assets/images/air_project.png";
  static const String its_project = "assets/images/its_project.png";
  static const String flutter_unit = "assets/images/flutter_unit.png";
  static const String spring_unit = "assets/images/spring_unit.png";
  static const String ai_unit = "assets/images/ai_unit.png";
  static const String design_unit = "assets/images/design_unit.png";
  static const String chat = "assets/images/chat.png";
  static const String its_logo = "assets/images/its_logo.png";
  static const String apply_back = "assets/images/apply_back.png";
  static const String box = "assets/images/box.png";
  static const String bubble_chat = "assets/images/bubble_chat.png";
  static const String chat_tail = "assets/images/chat_tail.png";
  static const String main_dolphin = "assets/images/main_dolphin.png";
  static const String main_google = "assets/images/main_google.png";
  static const String main_layer = "assets/images/main_layers_alt.png";
  static const String main_user = "assets/images/main_user_arrows.png";
  static const String main_speech = "assets/images/main_speech.png";
  static const String newsIcon = "assets/images/news_icon.png";
  static const String unitIcon = "assets/images/unit_icon.png";
  static const String peopleIcon = "assets/images/people_icon.png";
  static const String rocket = "assets/images/rocket.png";
  static const String imageAu = "assets/images/imageAu.png";
  static const String imageAu2 = "assets/images/imageAu2.png";
  static const String imageupload = "assets/images/imageupload.png";
  static const String noImage = "assets/images/noimage.png";
}

//앱 색상
class AirColor {
  static const Color topBar = Color(0xFFF3FBFF);
  static const Color topBarTitle = Color(0xFF3A3A3A);
  static const Color subTitle1 = Color(0xFF818181);
  static const Color subTitle2 = Color(0xFF575757);
  static const Color subTitle3 = Color(0xFF797979);
  static const Color subtitie4 = Color(0xFFABABAB);
  static const Color subtitie5 = Color(0xFF656565);
  static const Color subtitie6 = Color(0xFFB6B6B6);
  static const Color line = Color(0xFFAFAFAF);
  static const Color notSeleted = Color(0xFFD9D9D9);
  static const Color wrong = Color(0xFFFF0000);
  static const Color button = Color(0xFF004DC2);
  static const Color checked = Color(0xFFCACACA);
  static const Color project = Color(0xFF9C9ED3);
  static const Color signupBt = Color(0xFF004DC2);
  static const Color gachon = Color(0xFF0D4D91);
  static const Color fileback = Color(0xFFF5F5F5);
  static const Color flutter_unit = Color(0xFF0D8496);
  static const Color spring_unit = Color(0xFF888C2B);
  static const Color ai_unit = Color(0xFFE06A1B);
  static const Color design_unit = Color(0xFF776AA6);
  static const Color cardHover = Color(0xFF005AE2);
  static const Color bubble = Color(0xFFE4F5FF);
  static const Color dark_grey = Color(0xFF656565);
  static const Color navy = Color(0xFF0B1127);
  static const Color hover = Color(0xFF171E39);
  static const Color blue1 = Color(0xFF4796FF);
  static const Color airblue = Color(0xFF0056D8);
  static const Color signupAu = Color(0xFFA5A5A5);
  static const Color grey2 = Color(0xFFC8C8C8);

}

//이용약관 텍스트
class Contract {
  static const String according_contract1 =
      "제 1 조 (목적)\n본 약관은 AIIA의 제반 서비스의 이용조건 및 절차에 관한 사항 및 기타 필요한 사항을 규정함을 목적으로 한다.\n\n제 2 조 (용어의 정의)\n본 약관에서 사용하는 용어는 다음과 같이 정의한다.\n ①회원 : 기본 회원 정보를 입력하였고, 회사와 서비스 이용계약을 체결하여 아이디를 부여받은 개인\n ②아이디(ID) : 회원식별과 회원의 서비스 이용을 위해 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합\n ③비밀번호(Password) : 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합\n ④해지 : 회사 또는 회원에 의한 이용계약의 종료\n\n제 3 조 (약관의 공시 및 효력과 변경)\n①본 약관은 회원가입 화면에 게시하여 공시하며 회사는 사정변경 및 영업상 중요한 사유가 있을 경우 약관을 변경할 수 있으며 변경된 약관은 공지사항을 통해 공시한다\n②본 약관 및 차후 회사사정에 따라 변경된 약관은 이용자에게 공시함으로써 효력을 발생한다.\n\n제 4 조 (약관 외 준칙)\n본 약관에 명시되지 않은 사항이 전기통신기본법, 전기통신사업법, 정보통신촉진법, ‘전자상거래등에서의 소비자 보호에 관한 법률’, ‘약관의 규제에관한법률’, ‘전자거래기본법’, ‘전자서명법’, ‘정보통신망 이용촉진등에 관한 법률’, ‘소비자보호법’ 등 기타 관계 법령에 규정되어 있을 경우에는 그 규정을 따르도록 한다.\n\n제 5 조 (이용신청)\n①이용신청자가 회원가입 안내에서 본 약관과 개인정보보호정책에 동의하고 등록절차(회사의 소정 양식의 가입 신청서 작성)를 거쳐 '확인' 버튼을 누르면 이용신청을 할 수 있다.\n②이용신청자는 반드시 실명과 실제 정보를 사용해야 하며 1개의 생년월일에 대하여 1건의 이용신청을 할 수 있다.\n③실명이나 실제 정보를 입력하지 않은 이용자는 법적인 보호를 받을 수 없으며, 서비스 이용에 제한을 받을 수 있다.\n\n제 6 조 (이용신청의 승낙)\n①회사는 제5조에 따른 이용신청자에 대하여 제2항 및 제3항의 경우를 예외로 하여 서비스 이용을 승낙한다.\n②회사는 아래 사항에 해당하는 경우에 그 제한사유가 해소될 때까지 승낙을 유보할 수 있다.\n  가. 서비스 관련 설비에 여유가 없는 경우\n  나. 기술상 지장이 있는 경우\n  다. 기타 회사 사정상 필요하다고 인정되는 경우\n③회사는 아래 사항에 해당하는 경우에 승낙을 하지 않을 수 있다.\n  가. 다른 사람의 명의를 사용하여 신청한 경우\n  나. 이용자 정보를 허위로 기재하여 신청한 경우\n  다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우\n  라. 기타 회사가 정한 이용신청 요건이 미비한 경우\n\n제 7 조 (회사의 의무)\n①회사는 사이트를 안정적이고 지속적으로 운영할 의무가 있다.\n②회사는 이용자로부터 제기되는 의견이나 불만이 정당하다고 인정될 경우에는 즉시 처리해야 한다. 단, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 공지사항 또는 전자우편을 통해 통보해야 한다.\n③제1항의 경우 수사상의 목적으로 관계기관 및 정보통신윤리위원회의 요청이 있거나 영장 제시가 있는 경우, 기타 관계 법령에 의한 경우는 예외로 한다.\n\n제 8 조 (이용자의 의무)\n①이용자는 본 약관 및 회사의 공지사항, 사이트 이용안내 등을 숙지하고 준수해야 하며 기타 회사의 업무에 방해되는 행위를 해서는 안된다.\n②이용자는 회사의 사전 승인 없이 본 사이트를 이용해 어떠한 영리행위도 할 수 없다.\n③이용자는 본 사이트를 통해 얻는 정보를 회사의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판, 방송 및 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.\n\n제 9 조 (서비스 이용)\n①이용자는 본 약관의 규정된 사항을 준수해 사이트를 이용한다.\n②본 약관에 명시되지 않은 서비스 이용에 관한 사항은 회사가 정해 '공지사항'에 게시하거나 또는 별도로 공지하는 내용에 따른다.\n\n제 10 조 (정보의 제공)\n본 사이트는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보에 대하여 전자메일이나 서신우편 등의 방법으로 회원에게 정보를 제공할 수 있다.\n\n제 11 조 (서비스 이용의 제한)\n본 사이트 이용 및 행위가 다음 각 항에 해당하는 경우 회사는 해당 이용자의 이용을 제한할 수 있다.\n①공공질서 및 미풍양속, 기타 사회질서를 해하는 경우\n②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된다고 객관적으로 인정되는 경우\n③타인의 명예를 손상시키거나 타인의 서비스 이용을 현저히 저해하는 경우\n④타인의 의사에 반하는 내용이나 광고성 정보 등을 지속적으로 전송하는 경우\n⑤해킹 및 컴퓨터 바이러스 유포 등으로 서비스의 건전한 운영을 저해하는 경우\n⑥다른 이용자 또는 제3자의 지적재산권을 침해하거나 지적재산권자가 지적 재산권의 침해를 주장할 수 있다고 판단되는 경우\n⑦타인의 아이디 및 비밀번호를 도용한 경우\n⑧기타 관계 법령에 위배되는 경우 및 회사가 이용자로서 부적당하다고 판단한 경우\n\n제 12 조 (서비스 제공의 중지)\n회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부의 제공을 중지할 수 있다.\n①전기통신사업법 상에 규정된 기간통신 사업자 또는 인터넷 망 사업자가 서비스를 중지했을 경우\n②정전으로 서비스 제공이 불가능할 경우\n③설비의 이전, 보수 또는 공사로 인해 부득이한 경우\n④서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 어려운 경우\n⑤전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우\n\n제 13 조 (게시물 관리)\n회사는 건전한 통신문화 정착과 효율적인 사이트 운영을 위하여 이용자가 게시하거나 제공하는 자료가 제12조에 해당한다고 판단되는 경우에 임의로 삭제, 자료이동, 등록거부를 할 수 있다.\n\n제 14 조 (서비스 이용 책임)\n이용자는 회사에서 권한 있는 사원이 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 서비스를 이용하여 불법상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈벌기 광고, 음란 사이트를 통한 상업행위, 상용 S/W 불법제공 등을 할 수 없다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 회사가 책임을 지지 않는다.\n\n제 15 조 (면책 및 손해배상)\n①천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 회사의 서비스 제공 책임이 면제된다.\n②회사는 이용자간 또는 이용자와 제3자간의 상호거래 관계에서 발생되는 결과에 대하여 어떠한 책임도 부담하지 않는다.\n③회사는 이용자가 게시판에 게재한 정보, 자료, 내용 등에 관하여 사실의 정확성, 신뢰도 등에 어떠한 책임도 부담하지 않으며 이용자는 본인의 책임 아래 본 사이트를 이용해야 한다.\n④이용자가 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 무료로 제공되는 서비스 이용과 관련해 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 이용자에게 있다.\n⑤아이디와 비밀번호의 관리 및 이용자의 부주의로 인하여 발생되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 이용자에게 있다.\n⑥이용자가 본 약관의 규정을 위반함으로써 회사에 손해가 발생하는 경우 이 약관을 위반한 이용자는 회사에 발생한 모든 손해를 배상해야 하며 동 손해로부터 회사를 면책시켜야 한다.\n\n제 16 조 (개인신용정보 제공 및 활용에 대한 동의서)\n회사가 회원 가입과 관련해 취득한 개인 신용 정보는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 타인에게 제공 및 활용 시 이용자의 동의를 얻어야 한다. 이용자의 동의는 회사가 회원으로 가입한 이용자의  신용정보를 신용정보기관, 신용정보업자 및 기타 이용자 등에게 제공해 이용자의 신용을 판단하기 위한 자료로서 활용하거나 공공기관에서 정책자료로 활용하는데 동의하는 것으로 간주한다.\n\n제 17 조 (분쟁의 해결)\n①회사와 이용자는 본 사이트 이용과 관련해 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 해야 한다.\n②제1항의 규정에도 불구하고 동 분쟁으로 인하여 소송이 제기될 경우 동 소송은 회사의 본사 소재지를 관할하는 법원의 관할로 본다.";
  static const String according_contract2 =
      '● 이용자 식별 및 본인여부 확인을 위해 이용자의 아이디, 이름, 비밀번호 정보를 회원  탈퇴 시까지 보유한다. \n● 고객서비스 이용에 관한 통지, 이용자 식별을 위해 연락처 (이메일 및 휴대전화번호)를 회원 탈퇴 시까지 보유한다.';
}

class Intro {
  static const String intro =
      """내용 추가 1""";

  static const String intro1 =
      """내용 추가 2""";
  static const String intro2 =
      """AIIA는 Google에서 개발한 하이브리드 웹 프레임워크인 Flutter와 서버 개발을 위한 Spring,\n그리고 AI 딥러닝 모델 개발을 위한 라이브러리인 Pytorch를 주 도구로 채택하여 Android, iOS 같은\n모바일 환경부터 Windows, macOS, Linux 등의 웹 브라우저 환경까지 다양한 플랫폼 생태계에서\n이용 가능한 애플리케이션 및 웹 서비스를 개발하는 팀 프로젝트, ‘AIIA Project’를 동아리의\n대표 활동으로 운영하고 있습니다.""";
  static const String intro3 =
      """또한 동아리 구성원들이 바쁜 프로젝트 활동 속에서도 AI·소프트웨어학부 재학 중 학습한 지식을\n놓치지 않도록 자체적인 Major-Study Group을 운영하고 있으며, 이를 통해 우수한 학부 과정을\n충실히 이행할 수 있도록 돕고 있습니다. 이를 통해 선후배 간의 네트워크 형성은 물론,\n공동체 의식을 길러 동아리 활동에도 긍정적인 영향을 끼칠 수 있도록 운영하고 있습니다.""";
  static const String intro4 =
      """이외에도 네카라쿠배 (네이버·카카오·라인·쿠팡·배달의민족) 현직자 및 유망한 스타트업 대표님을\n특별 초청해 강연을 개최하거나 Flutter, Spring 및 인공지능 모델에 대한 최신 경향을 조사하여\n발표하는 ‘Future-Tech Seminar’, IT Show 및 AI Conference 방문, AIIA Day\nfor Membership Training 등 다양한 콘텐츠를 통해 동아리 개개인의 잠재력 향상과\nAI·소프트웨어 학부 전체에 좋은 영향을 끼칠 수 있도록 노력하고 있습니다.""";
}

//앱 텍스트 스타일
class AirTextStyle {
  static TextStyle mTopBar = TextStyle(
      fontSize: ratio.width * 60,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard',
      color: AirColor.topBarTitle);
  static TextStyle topBar = TextStyle(
      fontSize: ratio.width * 32,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard',
      color: AirColor.topBarTitle);
  static const TextStyle signUp = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w900,
      fontFamily: 'Pretendard',
      color: AirColor.button);
  static const TextStyle login = TextStyle(
      fontSize: 60, color: AirColor.airblue, fontWeight: FontWeight.w900, fontFamily: 'Pretendard');
  static const TextStyle image_auth = TextStyle(
      fontSize: 40, color: AirColor.airblue, fontWeight: FontWeight.w800, fontFamily: 'Pretendard');
  static const TextStyle loginsub = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w900,
      fontFamily: 'Pretendard',
      color: AirColor.subtitie4);
  static const TextStyle placeholderL = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w200,
      fontFamily: 'Pretendard',
      color: AirColor.line);
  static const TextStyle loginText = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'Pretendard');
  static const TextStyle placeholderS = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w200,
      fontFamily: 'Pretendard',
      color: AirColor.line);
  static const TextStyle signUpText = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Pretendard');
  static const TextStyle signUpsub = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Pretendard');
  static const TextStyle phone_basic_black = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: 'Pretendard',
      color: Colors.black);
  static const TextStyle phone_basic_blue = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: 'Pretendard',
      color: AirColor.airblue);
  static const TextStyle imageAU_sub = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Pretendard',
      color: AirColor.signupAu);
  static const TextStyle agree = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      fontFamily: 'Pretendard',
      color: AirColor.subTitle1);
  static const TextStyle button = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: 'Pretendard',
      color: Colors.white);
  static const TextStyle unitName = TextStyle(
      fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'Pretendard');
  static const TextStyle subtitle1 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'Pretendard');
  static const TextStyle git = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontFamily: 'Pretendard',
      color: AirColor.subTitle2);
  static const TextStyle position = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard',
      color: AirColor.button);
  static const TextStyle info = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard',
      color: AirColor.button);
  static const TextStyle signupBt = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Pretendard',
      color: AirColor.button);
  static const TextStyle newsnum = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontFamily: 'Pretendard',
      color: AirColor.subtitie5);
  static const TextStyle searchPh = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: 'Pretendard',
      color: AirColor.blue1,
  );
  static const TextStyle pageNum = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard',
      color: AirColor.subtitie5);
  static const TextStyle boardTitle = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w800,
      fontFamily: 'Pretendard',
      color: AirColor.button);
  static TextStyle basicText = TextStyle(
    fontSize: ratio.width * 26,
    fontWeight: FontWeight.w300,
    fontFamily: 'Pretendard',
  );
  static const TextStyle boxChat = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w800,
    fontFamily: 'Pretendard',
    color: AirColor.dark_grey,
  );
  static TextStyle footer = TextStyle(
    fontSize: ratio.width * 30,
    fontWeight: FontWeight.w300,
    fontFamily: 'Pretendard',
    color: AirColor.line,
  );
  static const TextStyle projectDescription = TextStyle(
    color: Colors.white,
    fontSize: 21,
    fontWeight: FontWeight.w700,
    fontFamily: 'Pretendard',
  );
  static const TextStyle infoText = TextStyle(
    color: AirColor.subtitie5,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Pretendard',
  );

  static const TextStyle imageUploadText = TextStyle(fontSize: 18, color: AirColor.button, fontWeight: FontWeight.w500,);

  static const TextStyle CommentButton = TextStyle(color: AirColor.button, fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Pretendard',);
  static const TextStyle userName = TextStyle(color: AirColor.subtitie5, fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Pretendard',);
}


List<String> preCacheImages = [
  ImgPath.background_image,
  ImgPath.apply_back,
];