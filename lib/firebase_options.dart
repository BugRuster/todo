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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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
    apiKey: 'AIzaSyDC8QI0i-i7GbETPGD-UF20M1f3DLzCNdE',
    appId: '1:44584806569:android:a63d82300a7d2f425be1b8',
    messagingSenderId: '44584806569',
    projectId: 'personalised-app-abaad',
    storageBucket: 'personalised-app-abaad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNUh5ea53fhcFW6fbXp9F4W3ezUE_RnaI',
    appId: '1:44584806569:ios:5b899b91d0d72c785be1b8',
    messagingSenderId: '44584806569',
    projectId: 'personalised-app-abaad',
    storageBucket: 'personalised-app-abaad.appspot.com',
    iosBundleId: 'com.example.todo',
  );
}
