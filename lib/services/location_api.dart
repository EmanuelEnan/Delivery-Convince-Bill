import 'dart:convert';

import 'package:http/http.dart' as http;

Future locationAPI(String lat, String long) async {
  String url = 'http://testandtry.xyz/v1/delivery/geotrack';
  final response = await http.post(
    Uri.parse(url),
    body: {"lat": lat, "long": long},
  );
  var convertToJson = jsonDecode(response.body);
  return convertToJson;
}
