import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:flutter_application_1/screens/setting.dart';
import 'package:go_router/go_router.dart';

GoRouter router() {
  return GoRouter(
    // initialLocation: '/home',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => HomePage(),
        pageBuilder: (_, state) {
          return CustomTransitionPage(
            child: HomePage(),
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          );
        },
      ),
      GoRoute(
        name: 'setting',
        path: '/setting',
        builder: (context, state) => const SettingScreen(),
      )
    ],
  );
}
