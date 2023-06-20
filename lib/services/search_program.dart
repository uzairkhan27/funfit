import 'dart:convert';

import 'package:http/http.dart' as http;
import '../utils/home_url.dart';

enum FilterOption { Ascending, Descending, PopularPicks }

Future searchProgram ({
  required String search,
  required String filterOption,
}) async {
  String baseUrl = "$siteUrl/api/customers/searchDeals";
  var headers = {'Content-Type' : 'application/json; charset=UTF-8'};
  var request =http.Request('POST', Uri.parse(baseUrl));
  request.body = json.encode({
    "search" : search,
    "filter": filterOption,
  });
    request.headers.addAll(headers);
    http.StreamedResponse streamedResponse =  await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    Map<String, dynamic> data = jsonDecode(response.body);

    if(streamedResponse.statusCode == 200){
      print(data);
      return data['data']['getDeals'];

    }
    else{
      return data['errors'];
    }
}