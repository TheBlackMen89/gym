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
    apiKey: 'AIzaSyBt5OzRyjN0AmXDR2rNv7KbUgdUC46Zn1c',
    appId: '1:350397722393:web:572e19176ae2eaa98ddf88',
    messagingSenderId: '350397722393',
    projectId: 'crud-futter-9501a',
    authDomain: 'crud-futter-9501a.firebaseapp.com',
    storageBucket: 'crud-futter-9501a.appspot.com',
    measurementId: 'G-H3KNE2RF0K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2kLTgojTvyaCrGDBV5YYgSpj4nLZswRk',
    appId: '1:350397722393:android:d714651889830c1b8ddf88',
    messagingSenderId: '350397722393',
    projectId: 'crud-futter-9501a',
    storageBucket: 'crud-futter-9501a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCY_kC-zs0bjaPqkVB8-aETLqfuftR3DZM',
    appId: '1:350397722393:ios:65183042fb4214ee8ddf88',
    messagingSenderId: '350397722393',
    projectId: 'crud-futter-9501a',
    storageBucket: 'crud-futter-9501a.appspot.com',
    iosBundleId: 'com.example.gym',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCY_kC-zs0bjaPqkVB8-aETLqfuftR3DZM',
    appId: '1:350397722393:ios:d08dd1bca4d34de38ddf88',
    messagingSenderId: '350397722393',
    projectId: 'crud-futter-9501a',
    storageBucket: 'crud-futter-9501a.appspot.com',
    iosBundleId: 'com.example.gym.RunnerTests',
  );
}
