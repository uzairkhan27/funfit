import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/home_url.dart';

Future getUser({
  required String customers_id,
}) async {
  String baseUrl = "$siteUrl/api/customers/getUser";
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
    print('msdnbfjkasdbfjkasdhfjklasdhfjkadsbfjkasdbfh');
    return data;
  } else {
    return data["errors"];
  }
}
