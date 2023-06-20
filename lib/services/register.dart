import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:funfit/utils/home_url.dart';

Future register({
  required String name,
  required String email,
  required String phone_number,
  //required String code,
}) async {
  String baseUrl = "$siteUrl/api/customers/registration";
  var headers = {'Content-Type': 'application/json; charset=UTF-8'};
  var request = http.Request('POST', Uri.parse(baseUrl));
  request.body = json.encode({
    "name": name,
    "email": email,
    "phone_number": phone_number,
  });

  //request.headers.addAll("Content-Type", "application/json; charset=UTF-8");
  request.headers.addAll(headers);
  http.StreamedResponse streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  Map<String, dynamic> data = jsonDecode(response.body);
  print(response.body);
  print('hello world');
  if (streamedResponse.statusCode == 200) {
    print(response.body);
    print('dskfjhkasdjhfkajsdf');
    return data;
  } else {
    print(['data']);
    return data["errors"];
  }
}


