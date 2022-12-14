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
    apiKey: 'AIzaSyAXdhBCRp8oLs1jSc8f4B-4kSyNdRIN3es',
    appId: '1:61376799605:web:3892c5379ebdbdc38ee93c',
    messagingSenderId: '61376799605',
    projectId: 'innervehacks-80d52',
    authDomain: 'innervehacks-80d52.firebaseapp.com',
    databaseURL: 'https://innervehacks-80d52-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'innervehacks-80d52.appspot.com',
    measurementId: 'G-GR8TKSXB5M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl7EyOTXv9dQ708Q3PRmvk8X29YjyrYyU',
    appId: '1:61376799605:android:db77491cd22ca6c88ee93c',
    messagingSenderId: '61376799605',
    projectId: 'innervehacks-80d52',
    databaseURL: 'https://innervehacks-80d52-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'innervehacks-80d52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHz6N2dx9OiA072ur25L-SxyBuCpJFP3g',
    appId: '1:61376799605:ios:b6af8329bd921c868ee93c',
    messagingSenderId: '61376799605',
    projectId: 'innervehacks-80d52',
    databaseURL: 'https://innervehacks-80d52-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'innervehacks-80d52.appspot.com',
    iosClientId: '61376799605-srs8v65oa349h7deavtanbq00ej5j8k2.apps.googleusercontent.com',
    iosBundleId: 'com.example.empoweringHumanity',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHz6N2dx9OiA072ur25L-SxyBuCpJFP3g',
    appId: '1:61376799605:ios:b6af8329bd921c868ee93c',
    messagingSenderId: '61376799605',
    projectId: 'innervehacks-80d52',
    databaseURL: 'https://innervehacks-80d52-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'innervehacks-80d52.appspot.com',
    iosClientId: '61376799605-srs8v65oa349h7deavtanbq00ej5j8k2.apps.googleusercontent.com',
    iosBundleId: 'com.example.empoweringHumanity',
  );
}
