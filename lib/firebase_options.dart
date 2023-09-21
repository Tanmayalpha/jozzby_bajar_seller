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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_1l5qdSvmWJ7MRj82U3_V4s6ymEprFdg',
    appId: '1:327324836622:android:728981062068bfc536ad5f',
    messagingSenderId: '327324836622',
    projectId: 'Jozzby-Bazaar-new',
    storageBucket: 'Jozzby-Bazaar-new.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBusENYY_9QM5nLi3lMJaCaECAJB2W-LhA',
    appId: '1:327324836622:ios:c962df41827f3f8a36ad5f',
    messagingSenderId: '327324836622',
    projectId: 'Jozzby-Bazaar-new',
    storageBucket: 'Jozzby-Bazaar-new.appspot.com',
    androidClientId: '327324836622-ji2sarngpv0f0ga7pucnf128apm136q3.apps.googleusercontent.com',
    iosClientId: '327324836622-nngdk8fa27nhmnm8vmr8boiffr9o96ls.apps.googleusercontent.com',
    iosBundleId: 'eshop.seller.multivendor',
  );
}