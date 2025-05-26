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
    apiKey: 'AIzaSyC1cyLz859C7jN8pyUzbbk17wg92HQuk9Q',
    appId: '1:741301307480:web:97d094a2abe9b3a57c622d',
    messagingSenderId: '741301307480',
    projectId: 'assesment-9ec9c',
    authDomain: 'assesment-9ec9c.firebaseapp.com',
    storageBucket: 'assesment-9ec9c.firebasestorage.app',
    measurementId: 'G-0CHY3YPQQQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgI7QXrAWOJJq9-YWDPzZJ43NaI9259EE',
    appId: '1:741301307480:android:41afaeedec8cfa897c622d',
    messagingSenderId: '741301307480',
    projectId: 'assesment-9ec9c',
    storageBucket: 'assesment-9ec9c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyA7FquN24DLJ-ehENhAxhOXZ8TjJ5r9s',
    appId: '1:741301307480:ios:8af93779672023397c622d',
    messagingSenderId: '741301307480',
    projectId: 'assesment-9ec9c',
    storageBucket: 'assesment-9ec9c.firebasestorage.app',
    iosBundleId: 'com.example.assesment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAyA7FquN24DLJ-ehENhAxhOXZ8TjJ5r9s',
    appId: '1:741301307480:ios:8af93779672023397c622d',
    messagingSenderId: '741301307480',
    projectId: 'assesment-9ec9c',
    storageBucket: 'assesment-9ec9c.firebasestorage.app',
    iosBundleId: 'com.example.assesment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC1cyLz859C7jN8pyUzbbk17wg92HQuk9Q',
    appId: '1:741301307480:web:c567ea6d21e56a4e7c622d',
    messagingSenderId: '741301307480',
    projectId: 'assesment-9ec9c',
    authDomain: 'assesment-9ec9c.firebaseapp.com',
    storageBucket: 'assesment-9ec9c.firebasestorage.app',
    measurementId: 'G-FFPQLYRXWL',
  );

}