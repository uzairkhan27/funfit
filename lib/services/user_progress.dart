import 'dart:convert';
import 'package:funfit/utils/home_url.dart';
import 'package:http/http.dart' as http;

Future usePackage({
  required String customers_id,
}) async {
  String baseUrl = "$siteUrl/api/customers/usePackage";
  var headers = {'Content-Type': 'application/json; charset=UTF-8'};
  var request = http.Request('POST', Uri.parse(baseUrl));
  request.body = json.encode({
    "customers_id": customers_id,
  });

  request.headers.addAll(headers);
  http.StreamedResponse streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  Map<String, dynamic> data = jsonDecode(response.body);
  if (streamedResponse.statusCode == 200) {
    print(data.toString());
    // return data['data'];
    return data;
  } else {
    return data["errors"];
  }
}