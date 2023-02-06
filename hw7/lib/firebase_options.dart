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
    apiKey: 'AIzaSyDmlQ2eosH78HI6FAMiD9MbNGPRdxC8xBE',
    appId: '1:229058906104:web:093eb52efe14d06647780d',
    messagingSenderId: '229058906104',
    projectId: 'cs311hw7-92c97',
    authDomain: 'cs311hw7-92c97.firebaseapp.com',
    storageBucket: 'cs311hw7-92c97.appspot.com',
    measurementId: 'G-H8XXRJX7XJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2K09ktRwxvpi3qSyHwODgj8b6svlnGi8',
    appId: '1:229058906104:android:cd28b2d55b7f549247780d',
    messagingSenderId: '229058906104',
    projectId: 'cs311hw7-92c97',
    storageBucket: 'cs311hw7-92c97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUHg0bIhonHQJu70nkoT4qITfmKIZcrGk',
    appId: '1:229058906104:ios:09e2c0ad2ac1d02a47780d',
    messagingSenderId: '229058906104',
    projectId: 'cs311hw7-92c97',
    storageBucket: 'cs311hw7-92c97.appspot.com',
    iosClientId: '229058906104-9vajcubs79m5kjs3e62ge07e87eh7taq.apps.googleusercontent.com',
    iosBundleId: 'com.example.hw7',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUHg0bIhonHQJu70nkoT4qITfmKIZcrGk',
    appId: '1:229058906104:ios:09e2c0ad2ac1d02a47780d',
    messagingSenderId: '229058906104',
    projectId: 'cs311hw7-92c97',
    storageBucket: 'cs311hw7-92c97.appspot.com',
    iosClientId: '229058906104-9vajcubs79m5kjs3e62ge07e87eh7taq.apps.googleusercontent.com',
    iosBundleId: 'com.example.hw7',
  );
}
