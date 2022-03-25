import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:shodaimama_bill/services/headers.dart';

class apiService2 {
  Future verifyApi(String phone, String otp, String type) async {
    String url2 = 'http://api.testandtry.xyz/v1/auth/verify/OTP';
    Map<String, String> headers = await AllHeaders().getHeader2();

    final resp = await http.post(
      Uri.parse(url2),
      body: {"phone": phone, "otp": otp, "type": type},
      headers: headers,
    );
    // headers: {"content-type": "application/json"});
    // var data = resp.body;
    // (data);
    // if (resp.statusCode == 200) {
    // var jsonConvert = jsonDecode(resp.body);
    // return jsonConvert;
    log(resp.body);
    log(resp.statusCode.toString());
  }
}
