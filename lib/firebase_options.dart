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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDdSPExRnx1VVzaWgYETKkS0yWbs1cJDBg',
    appId: '1:242157431700:web:f084e4af8be6756adc7d81',
    messagingSenderId: '242157431700',
    projectId: 'uas-healthypet',
    authDomain: 'uas-healthypet.firebaseapp.com',
    databaseURL: 'https://uas-healthypet-default-rtdb.firebaseio.com',
    storageBucket: 'uas-healthypet.appspot.com',
    measurementId: 'G-2DC1RY505R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGRk2cYN3xk-J8py2KV_11dJQXK56HYNM',
    appId: '1:242157431700:android:a8de6d9dd73fe95ddc7d81',
    messagingSenderId: '242157431700',
    projectId: 'uas-healthypet',
    databaseURL: 'https://uas-healthypet-default-rtdb.firebaseio.com',
    storageBucket: 'uas-healthypet.appspot.com',
  );
}
