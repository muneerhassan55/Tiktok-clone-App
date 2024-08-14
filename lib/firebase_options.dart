// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAbV9iwSRuAGSclXQ1fbv1-QDzZ-sxbtpg',
    appId: '1:1060761054580:web:81fe2270d61cb2deb1d021',
    messagingSenderId: '1060761054580',
    projectId: 'tiktok-clone-app-d6dad',
    authDomain: 'tiktok-clone-app-d6dad.firebaseapp.com',
    storageBucket: 'tiktok-clone-app-d6dad.appspot.com',
    measurementId: 'G-Q9DNDZCRWK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrqqsDiNj9doFxNCJ5s3rqNPH8TiTobJM',
    appId: '1:1060761054580:android:014ccc6256affceeb1d021',
    messagingSenderId: '1060761054580',
    projectId: 'tiktok-clone-app-d6dad',
    storageBucket: 'tiktok-clone-app-d6dad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGhIQz3ehj65x-V464voJ71Ka7Ahq6zAk',
    appId: '1:1060761054580:ios:97dc05b7e130a8f6b1d021',
    messagingSenderId: '1060761054580',
    projectId: 'tiktok-clone-app-d6dad',
    storageBucket: 'tiktok-clone-app-d6dad.appspot.com',
    iosBundleId: 'com.example.tictocCloneApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGhIQz3ehj65x-V464voJ71Ka7Ahq6zAk',
    appId: '1:1060761054580:ios:97dc05b7e130a8f6b1d021',
    messagingSenderId: '1060761054580',
    projectId: 'tiktok-clone-app-d6dad',
    storageBucket: 'tiktok-clone-app-d6dad.appspot.com',
    iosBundleId: 'com.example.tictocCloneApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAbV9iwSRuAGSclXQ1fbv1-QDzZ-sxbtpg',
    appId: '1:1060761054580:web:33dbc5e101ca3c37b1d021',
    messagingSenderId: '1060761054580',
    projectId: 'tiktok-clone-app-d6dad',
    authDomain: 'tiktok-clone-app-d6dad.firebaseapp.com',
    storageBucket: 'tiktok-clone-app-d6dad.appspot.com',
    measurementId: 'G-9X8L0RC3G8',
  );
}