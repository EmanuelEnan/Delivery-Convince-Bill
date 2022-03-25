import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:shodaimama_bill/services/headers.dart';

class apiService1 {
  Future sendApi(String phone, String type) async {
    String url = 'http://api.testandtry.xyz/v1/auth/sendOTP';
    Map<String, String>? headers = await AllHeaders().getHeader2();

    final resp = await http.post(
      Uri.parse(url),
      body: {"phone": phone, "type": type},
      headers: headers,
    );

    // var data = resp.body;
    // (data);
    // if (resp.statusCode == 200) {
    // var jsonConvert = jsonDecode(resp.body);
    // return jsonConvert;
    log(resp.body);
    log(resp.statusCode.toString());
    // String respString = resp.body;
    // productModelFromJson(respString);
  }
}
