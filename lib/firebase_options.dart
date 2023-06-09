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
    apiKey: 'AIzaSyDNxrVAcWrPsccYbGjvyz6oOvgZBjsW22Q',
    appId: '1:1033255648597:android:f6e59dbca36bb28b8383dc',
    messagingSenderId: '1033255648597',
    projectId: 'todo-5f27c',
    storageBucket: 'todo-5f27c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3dazpYt1oRXRu3aPkNUsDcVuKU1V0Wrw',
    appId: '1:1033255648597:ios:603607a4d93b2dc08383dc',
    messagingSenderId: '1033255648597',
    projectId: 'todo-5f27c',
    storageBucket: 'todo-5f27c.appspot.com',
    iosClientId:
        '1033255648597-eusqmm4v6uq59ftveqssarfapq2bmdq2.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoC7Mon',
  );
}
