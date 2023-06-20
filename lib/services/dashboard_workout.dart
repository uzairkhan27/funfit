import 'dart:convert';

import 'package:funfit/utils/home_url.dart';
import 'package:http/http.dart' as http;

Future dashboad({
  required String customer_id,
  required String type
}) async{
    String baseUrl = "$siteUrl/api/customers/dashboard";
    var headers = {'Content-Type' : 'application/json;charset=UTF-8'};
    var request = http.Request('POST', Uri.parse(baseUrl));

    request.body = json.encode({
        "customer_id": customer_id,
    });

    request.headers.addAll(headers);
    http.StreamedResponse streamedResponse = await request.send();
    var respose = await http.Response.fromStream(streamedResponse);
    Map<String, dynamic> data =  jsonDecode(respose.body);

  if (streamedResponse.statusCode == 200) {
      if(type == "slider"){
        return data['data']['slider'];
      }
      else if(type == 'deals'){
        return data['data']['getDeals_type'];
      }
  }
  else{
    return data['errors'];
  }
}
