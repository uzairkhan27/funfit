import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../utils/home_url.dart';

Future updateProfile ({
  required String user_id,
  // required String deals_id,
  required String name,
  required String email,
  // required String start_date,
  // required String end_date,
  // required String start_time,
  // required String end_time,
  // required String description,
  // required String address,
  required File? img,
  required String featured_img_old,
  required String deals_id,
  // required List allowed_members,
  // required List facilites,
  // required  List<dynamic> allowed_members,
  // required List<FacilityList> facilites
}) async {
  // product
  // log(allowed_members.toString());
  String baseUrl = "$siteUrl/api/vendors/updateDeals";
  var headers = {'Content-Type': 'application/json; charset=UTF-8'};
  var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
  Map<String, String>  temp = {
    "user_id" : user_id,
    "deals_id" : deals_id,
    "name" : name,
    "email" : email,
    // "start_date" : start_date,
    // "end_date" : end_date,
    // "start_time" : start_time,
    // "end_time" : end_time,
    // "description" : description,
    // "address" : address,
    "featured_img_old" : featured_img_old,
    // "allowed_members" : jsonEncode(allowed_members),
    // "facilites" : jsonEncode(facilites)
  };
  request.fields.addAll((temp));
  log(img.toString());
  if(img != null) {
    var imgField = await http.MultipartFile.fromPath("featured_img", img.path);
    request.files.add(imgField);
  }
  request.headers.addAll(headers);
  http.StreamedResponse streamedResponse = await request.send();
  var response = await http.Response.fromStream(streamedResponse);
  print(response.body);
  Map<String, dynamic> dataList = jsonDecode(response.body);
  if (streamedResponse.statusCode == 200) {
    // log(dataList.toString());
    print(dataList.toString());
    print('sdhfjkasdhjkl');
    return dataList;
  } else {
    return dataList;
  }
}