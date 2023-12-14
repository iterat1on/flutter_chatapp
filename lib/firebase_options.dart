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
    apiKey: 'AIzaSyBQiK0bKLhra24gOzahV-_UAyw9FXUA4cg',
    appId: '1:1079859983557:web:3a3b2ad274e1670df7ecac',
    messagingSenderId: '1079859983557',
    projectId: 'untitled2-ec3fe',
    authDomain: 'untitled2-ec3fe.firebaseapp.com',
    storageBucket: 'untitled2-ec3fe.appspot.com',
    measurementId: 'G-JL6DMK9GC3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBS9JWcORrLmnBjkPtfR2VnRAzLt6mjYuo',
    appId: '1:1079859983557:android:c16f87506b5d5052f7ecac',
    messagingSenderId: '1079859983557',
    projectId: 'untitled2-ec3fe',
    storageBucket: 'untitled2-ec3fe.appspot.com',
  );
}
