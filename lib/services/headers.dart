import 'dart:developer';

import 'package:shodaimama_bill/services/secure_storage.dart';

class AllHeaders {
  String? deviceId;
  String deviceInfo = "Later";
  String deviceSessionToken = "Later";
  String? deviceToken;
  String? userToken;
  String? sessionToken;
  String? userType;

  Future<void> init() async {
    try {
      deviceId = await SecureStorage().read1SecureData("deviceId");
      // print(deviceId);
    } on Exception {
      print("Device Id: $Exception");
    }
    //
    // try {
    //   deviceInfo = await storage.read(key: "deviceInfo");
    // } catch (Exception) {
    //   print("Device Info: $Exception");
    // }

    try {
      deviceSessionToken =
          await SecureStorage().read1SecureData("deviceSessionToken");
    } on Exception {
      print("Device Session Token: $Exception");
    }
  }

  Future<void> initDeviceToken() async {
    try {
      deviceToken = await SecureStorage().read1SecureData("deviceToken");
    } on Exception {
      print("Device Token: $Exception");
    }
  }

  Future<void> initUserInfo() async {
    try {
      userToken = await SecureStorage().read1SecureData("userToken");
    } on Exception {
      print("User Token: $Exception");
    }

    try {
      sessionToken = await SecureStorage().read1SecureData("sessionToken");
    } on Exception {
      print("Session Token: $Exception");
    }

    try {
      userType = await SecureStorage().read1SecureData("userType");
    } on Exception {
      print("User Type: $Exception");
    }
  }

  Future<Map<String, String>> getHeader1() async {
    await init();
    // print("GET: $deviceId");
    return {
      "app-token": "SMAAV1",
      "app-key": "SMAAV12021",
      "app-password": "SHODAIMAMA21",
      "source": "AMA",
      "language": "en",
      "permission": "COMMON_BROWSE_APP",
      "device-id": deviceId!,
      "device-info": deviceInfo,
      "device-session-token": deviceSessionToken,
      // "content-type": "application/json"
    };
  }

  Future<Map<String, String>> getHeader2() async {
    String? flag;
    try {
      flag = await SecureStorage().read1SecureData("isLoggedIn");
    } on Exception catch (e) {
      print("Header 2: $e");
    }

    if (flag == "Yes") {
      return getHeader3();
    }

    await init();
    await initDeviceToken();
    return {
      "app-token": "SMAAV1",
      "app-key": "SMAAV12021",
      "app-password": "SHODAIMAMA21",
      "source": "AMA",
      "language": "en",
      "permission": "COMMON_BROWSE_APP",
      "device-id": deviceId!,
      "device-info": deviceInfo,
      "device-session-token": deviceSessionToken,
      "device-token": deviceToken!,
      // "content-type": "application/json"
    };
  }

  Future<Map<String, String>> getHeader3() async {
    await init();
    await initDeviceToken();
    await initUserInfo();
    return {
      "app-token": "SMAAV1",
      "app-key": "SMAAV12021",
      "app-password": "SHODAIMAMA21",
      "source": "AMA",
      "language": "en",
      "permission": "COMMON_BROWSE_APP",
      "device-id": deviceId!,
      "device-info": deviceInfo,
      "device-session-token": deviceSessionToken,
      "device-token": deviceToken!,
      "user-token": userToken!,
      "session-token": sessionToken!,
      "user-type": userType!,
      // "content-type": "application/json"
    };
  }
}
