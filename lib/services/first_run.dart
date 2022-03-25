import 'dart:math';

import 'package:shodaimama_bill/services/secure_storage.dart';

class FirstRun {
  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // final storage = new FlutterSecureStorage();
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  void init() {
    setDeviceSessionToken();
  }

  void setDeviceSessionToken() async {
    String val = "USER_MOBILE_APP_" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        "_" +
        getRandomString(10);
    try {
      await SecureStorage().write1SecureData("deviceSessionToken", val);
    } on Exception catch (e) {
      ("First Run: $e");
    }
  }

  // void setDeviceId(Future<String> token) async {
  //   _firebaseMessaging.getAPNSToken().then((value) async {
  //     await storage.write(key: "deviceId", value: value);
  //   });
  //   // print(val);
  //   // await storage.write(key: "deviceId", value: val);
  // }

  String getRandomString(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );
}
