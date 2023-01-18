import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/router.dart';
import 'dart:async';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(MainApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MainApp extends StatefulWidget {
  final SharedPreferences sharedPreferences;
  const MainApp({
    super.key,
    required this.sharedPreferences,
  });

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  static const String oneSignalAppId = "9658a581-0943-4a59-abfe-a7d988893b60";
  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(oneSignalAppId);
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Main app',
      routerConfig: router(),
    );
  }
}
