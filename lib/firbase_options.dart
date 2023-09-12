
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart';

class Defaultfirebaseoptions {
  static  FirebaseOptions get currentPlatform {
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
    apiKey: 'AIzaSyBYeteOFAGe_UP7N6xf5ugNHmNJeR9nu40',
    appId: '1:49480184102:web:e86635708e48ff3792d1e7',
    messagingSenderId: '49480184102',
    projectId: 'muvime-f2888',
    authDomain: 'muvime-f2888.firebaseapp.com',
    storageBucket: 'muvime-f2888.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-sIym33c1N7ypvpzVyqbobGBXO5u2fFM',
    appId: '1:49480184102:android:a9d9dc3c83358b8e92d1e7',
    messagingSenderId: '49480184102',
    projectId: 'muvime-f2888',
    storageBucket: 'muvime-f2888.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAP3namMKf_AmerJ1hoRK7iKX56rQ-iYtU',
    appId: '1:49480184102:ios:17ec8833c1b22cbc92d1e7',
    messagingSenderId: '49480184102',
    projectId: 'muvime-f2888',
    storageBucket: 'muvime-f2888.appspot.com',
    iosClientId: '49480184102-enj4scu2hpmepsdg7dpivno0kbjek92n.apps.googleusercontent.com',
    iosBundleId: 'com.example.bteProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAP3namMKf_AmerJ1hoRK7iKX56rQ-iYtU',
    appId: '1:49480184102:ios:d70c9fa44152979792d1e7',
    messagingSenderId: '49480184102',
    projectId: 'muvime-f2888',
    storageBucket: 'muvime-f2888.appspot.com',
    iosClientId: '49480184102-4gn5qtdhub4apqjhllqaic2lsbe0iop6.apps.googleusercontent.com',
    iosBundleId: 'com.example.bteProject.RunnerTests',
  );
}