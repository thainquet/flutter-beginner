// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyANBBoFp0bglQpIzhcr5GCbE1Fm_VVY1Jo',
    appId: '1:580847464094:web:a8ef9b36c128bb2ea9958f',
    messagingSenderId: '580847464094',
    projectId: 'flutter-noti-34d93',
    authDomain: 'flutter-noti-34d93.firebaseapp.com',
    storageBucket: 'flutter-noti-34d93.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA13ee6Z2h6K4xxdzT0t_8Y3LQSe7RXjso',
    appId: '1:580847464094:android:eb0d2cd94a8b8d62a9958f',
    messagingSenderId: '580847464094',
    projectId: 'flutter-noti-34d93',
    storageBucket: 'flutter-noti-34d93.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCZArNMQCXrKaloJUMzKuyedmsSm-Y1aY',
    appId: '1:580847464094:ios:56a69d5c184f21c8a9958f',
    messagingSenderId: '580847464094',
    projectId: 'flutter-noti-34d93',
    storageBucket: 'flutter-noti-34d93.appspot.com',
    iosClientId: '580847464094-914slt419u3ma10fo9mep9qeia1i1fck.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCZArNMQCXrKaloJUMzKuyedmsSm-Y1aY',
    appId: '1:580847464094:ios:56a69d5c184f21c8a9958f',
    messagingSenderId: '580847464094',
    projectId: 'flutter-noti-34d93',
    storageBucket: 'flutter-noti-34d93.appspot.com',
    iosClientId: '580847464094-914slt419u3ma10fo9mep9qeia1i1fck.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
