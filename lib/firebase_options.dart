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
    apiKey: 'AIzaSyCnlA-eBdcJDO7B0rukz2plZi49TEukApg',
    appId: '1:687338534792:web:ffdf9425b55a6be81b6c3d',
    messagingSenderId: '687338534792',
    projectId: 'flutter-web--firebase-crud',
    authDomain: 'flutter-web--firebase-crud.firebaseapp.com',
    storageBucket: 'flutter-web--firebase-crud.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl-rL1WcC_VieVvYIpDlYiBCW1CTekr3s',
    appId: '1:687338534792:android:af2deae58289db621b6c3d',
    messagingSenderId: '687338534792',
    projectId: 'flutter-web--firebase-crud',
    storageBucket: 'flutter-web--firebase-crud.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAr5A53oQ6dY2mAeMCDgj7ZIeh6x6zH5ik',
    appId: '1:687338534792:ios:afc4a73ef57df8cb1b6c3d',
    messagingSenderId: '687338534792',
    projectId: 'flutter-web--firebase-crud',
    storageBucket: 'flutter-web--firebase-crud.appspot.com',
    iosBundleId: 'com.example.webApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAr5A53oQ6dY2mAeMCDgj7ZIeh6x6zH5ik',
    appId: '1:687338534792:ios:dbbb2efc00867a771b6c3d',
    messagingSenderId: '687338534792',
    projectId: 'flutter-web--firebase-crud',
    storageBucket: 'flutter-web--firebase-crud.appspot.com',
    iosBundleId: 'com.example.webApplication.RunnerTests',
  );
}