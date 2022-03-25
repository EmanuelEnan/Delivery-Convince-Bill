import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseUtils {
  static updateFirebaseToken() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String? token = await firebaseMessaging.getToken();
    log("updateFirebaseToken $token");
  }
}
