import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDyVkD8LwtaGWdtpZkmreS7DEaP4epGD9Q",
            authDomain: "pdf-app-c4e03.firebaseapp.com",
            projectId: "pdf-app-c4e03",
            storageBucket: "pdf-app-c4e03.appspot.com",
            messagingSenderId: "137214672740",
            appId: "1:137214672740:web:36cf05ed9b72eed0fcc471",
            measurementId: "G-BP8352CH06"));
  } else {
    await Firebase.initializeApp();
  }
}
