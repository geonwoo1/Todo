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
    apiKey: 'AIzaSyCl1ylS-7Ps2GGSsW3gDBKsEpHEwebsj2A',
    appId: '1:596817906107:web:dd89f2a4b1bfb7f1e8dc9e',
    messagingSenderId: '596817906107',
    projectId: 'gw-todoapp-flutter',
    authDomain: 'gw-todoapp-flutter.firebaseapp.com',
    storageBucket: 'gw-todoapp-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLqRfu74Yo4XnWhPVC9YZaAiyN3vPfkGs',
    appId: '1:596817906107:android:cbe7b93b657a2473e8dc9e',
    messagingSenderId: '596817906107',
    projectId: 'gw-todoapp-flutter',
    storageBucket: 'gw-todoapp-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBzg4QUMBm8V6GOBGxvGLwOSBcNzsjmd0',
    appId: '1:596817906107:ios:f8feacb366f5ac15e8dc9e',
    messagingSenderId: '596817906107',
    projectId: 'gw-todoapp-flutter',
    storageBucket: 'gw-todoapp-flutter.appspot.com',
    iosClientId: '596817906107-a00f98cbigrr11en7gv1s59gkpg00qvq.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBzg4QUMBm8V6GOBGxvGLwOSBcNzsjmd0',
    appId: '1:596817906107:ios:f8feacb366f5ac15e8dc9e',
    messagingSenderId: '596817906107',
    projectId: 'gw-todoapp-flutter',
    storageBucket: 'gw-todoapp-flutter.appspot.com',
    iosClientId: '596817906107-a00f98cbigrr11en7gv1s59gkpg00qvq.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}
