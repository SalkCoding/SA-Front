import 'package:air_front/config/function.dart';
import 'package:air_front/config/variable.dart';
import 'package:air_front/provider/goroute/go_route_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

main() {
  usePathUrlStrategy();
  startImgCache();
  // Riverpod
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  // 반응형 웹을 위한 초기 디바이스 크기 확인
  Widget build(BuildContext context, WidgetRef ref) {
    
    ratio = Size(MediaQuery.sizeOf(context).width / 2560, MediaQuery.sizeOf(context).height / 1600);

    final router = ref.watch(goRouteProvider);

    // GoRouter
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
    );
  }
}
