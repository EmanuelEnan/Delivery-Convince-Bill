import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shodaimama_bill/services/secure_storage.dart';

import 'headers.dart';

class APIManager {
  var client = http.Client();

  Future<bool> getDeviceToken(String url) async {
    Map<String, String> headers = await AllHeaders().getHeader1();
    Map<String, dynamic> map;
    String deviceToken;
    bool flag = false;

    var body = {"type": "delivery"};

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        map = json.decode(response.body);

        deviceToken = map["data"]["deviceToken"];

        try {
          await SecureStorage().write1SecureData("deviceToken", deviceToken);

          flag = true;
        } on Exception catch (e) {
          // print("DeviceToken: $e");
        }
      }
    } catch (Exception) {
      print("GET Device Token: $Exception");
    }

    return flag;
  }

  Future<Map<String, dynamic>> getOTP(String url, String number) async {
    Map<String, String> headers = await AllHeaders().getHeader2();
    late Map<String, dynamic> map;

    var body = {
      "phone": number,
      "type": "delivery",
    };

    try {
      var response = await http.post(Uri.parse(url),
          headers: headers, body: json.encode(body));
      if (response.statusCode == 200) {
        map = json.decode(response.body);
      }
    } on Exception {
      print("GET OTP: $Exception");
    }

    return map;
  }

  Future<Map<String, dynamic>> verifyOTP(
      String url, String number, String otp) async {
    Map<String, String> headers = await AllHeaders().getHeader2();
    late Map<String, dynamic> map;

    var body = {
      "phone": number,
      "type": "delivery",
      "otp": int.parse(otp),
    };

    try {
      var response = await http.post(Uri.parse(url),
          headers: headers, body: json.encode(body));
      if (response.statusCode == 200) {
        map = json.decode(response.body);
      }
    } on Exception {
      print("Verify Device Token: $Exception");
    }

    return map;
  }
}
