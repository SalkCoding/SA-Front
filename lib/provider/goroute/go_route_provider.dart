import 'package:air_front/pages/news/news.dart';
import 'package:air_front/pages/news/newsinfo.dart';
import 'package:air_front/pages/signup/certification_complete.dart';
import 'package:air_front/pages/signup/signup2.dart';
import 'package:air_front/pages/test_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:air_front/pages/loading_page.dart';
import 'package:air_front/pages/mainpage/main_page.dart';
import 'package:air_front/pages/project/projects.dart';
import 'package:air_front/pages/member/unit.dart';
import 'package:air_front/pages/signup/image_authentication.dart';
import 'package:air_front/pages/signup/phone_authentication.dart';
import 'package:air_front/pages/login/login.dart';
import 'package:air_front/pages/member/member.dart';
import 'package:air_front/pages/signup/signup1.dart';

part 'go_route_provider.g.dart';

// 라우팅 설정
@riverpod
GoRouter goRoute(GoRouteRef ref){

  List<GoRoute> routes = [
    GoRoute(
      path: '/',
      name: MainPage.routeName,
      builder: (context, state) => MainPage(),
    ),
    GoRoute(
      path: '/loading',
      name: LoadingPage.routeName,
      builder: (context, state) => LoadingPage(),
    ),
    GoRoute(
      path: '/login',
      name: Login.routeName,
      builder: (context, state) => Login(),
    ),
    GoRoute(
      path: '/signup1',
      name: SignUp1.routeName,
      builder: (context, state) => SignUp1(),
    ),
    GoRoute(
      path: '/signup2',
      name: SignUp2.routeName,
      builder: (context, state) => SignUp2(),
    ),
    GoRoute(
      path: '/member',
      name: Member.routeName,
      builder: (context, state) => Member()
    ),
    GoRoute(
      path: '/unit',
      name: Unit.routeName,
      builder: (context, state) => Unit(),
    ),
    GoRoute(
      path: '/project',
      name: Projects.routeName,
      builder: (context, state) => Projects(),
    ),
    GoRoute(
      path: '/phone_certification',
      name: PhoneAuthentication.routeName,
      builder: (context, state) => PhoneAuthentication(),
    ),
    GoRoute(
      path: '/image_certification',
      name: ImageAuthentication.routeName,
      builder: (context, state) {
        final phoneNumber = state.uri.queryParameters['phoneNumber'];
        return ImageAuthentication(phoneNumber: phoneNumber ?? '',);
      },
    ),
    GoRoute(
      path: '/signup_complete',
      name: CertificationComplete.routeName,
      builder: (context, state) => CertificationComplete(),
    ),
    GoRoute(
      path: '/test',
      name: TestPage.routeName,
      builder: (context, state) => TestPage(),
    ),
    GoRoute(
      path: '/news',
      name: News.routeName,
      builder: (context, state) => News(),
      routes: [
        GoRoute(
          path: ':nid',
          name: NewsInfo.routeName,
          builder: (context, state) => NewsInfo(nid: state.pathParameters['nid']!,),
        ),
      ]
    )
  ];


  final GoRoutes = GoRouter(
    routes: routes,
    initialLocation: '/',
  );

  return GoRoutes;
}
