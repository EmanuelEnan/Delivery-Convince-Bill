import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:shodaimama_bill/services/headers.dart';
import 'package:shodaimama_bill/services/secure_storage.dart';

class apiService3 {
  Future registerApi(String type) async {
    String url3 = 'http://api.testandtry.xyz/v1/system/register/device';
    Map<String, String> headers = await AllHeaders().getHeader1();
    Map<String, dynamic>? map;
    String deviceToken;

    //  await secureStorage.write1SecureData(
    //                 'phone', phoneController.text);

    // await SecureStorage().read1SecureData('deviceToken');

    final response = await http.post(
      Uri.parse(url3),
      body: {"type": "Customer"},
      headers: headers,
    );
    // var data = resp.body;
    // (data);
    // if (resp.statusCode == 200) {
    // var jsonConvert = jsonDecode(resp.body);
    // return jsonConvert;
    log(response.body);
    log(response.statusCode.toString());

    deviceToken = map!["data"]["deviceToken"];
    try {
      await SecureStorage().write1SecureData("deviceToken", deviceToken);
    } on Exception catch (e) {
      (e.toString());
    }
    // String respString2 = resp.body;
    // productModelFromJson(respString2);
    // }
  }
}
