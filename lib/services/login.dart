import 'dart:convert';
import 'package:funfit/utils/home_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future login({
  required String phone_number,
}) async {
  String baseUrl = "$siteUrl/api/customers/login_otp";
  var headers = {'Content-Type': 'application/json; charset=UTF-8'};
  var request = http.Request('POST', Uri.parse(baseUrl));
  request.body = json.encode({
    "phone_number": phone_number,
  });
  SharedPreferences prefs = await SharedPreferences.getInstance();
  request.headers.addAll(headers);
  http.StreamedResponse streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  Map<String, dynamic> data = jsonDecode(response.body);
  // String serverResponse;

  if (streamedResponse.statusCode == 200) {
    print(data);
    return data;
    // sharedPreferences.setString("token", data['token']);
  } else {
    return data["errors"];
  }
}
