import 'package:flutter/cupertino.dart';

class Deal extends ChangeNotifier {
  int? vendors_id;
  int? vendors_types_id;
  String? name;
  String? start_date;
  String? end_date;
  String? start_time;
  String? end_time;
  String? address;
  String? featured_img;
  List? facilites;
  List? allowed_members;
/*"created_at": "2022-11-21T07:46:02.000000Z",
  "updated_at": "2022-11-21T08:00:03.000000Z",
  "deleted_at": null,*/

  fromJson(Map<String, dynamic> json) {
    vendors_id = json["vendors_id"];
    vendors_types_id = json["vendors_types_id"];
    name = json["name"];
    start_date = json["start_date"];
    end_date = json["end_date"];
    start_time = json["start_time"];
    end_time = json["end_time"];
    address = json["address"];
    featured_img = json["featured_img"];
    facilites = json["facilites"];
    allowed_members = json["allowed_members"];
  }

  toJson() => {
    "vendors_id": vendors_id,
    "vendors_types_id": vendors_types_id,
    "name": name,
    "start_date": start_date,
    "end_date": end_date,
    "start_time": start_time,
    "end_time": end_time,
    "address": address,
    "featured_img": featured_img,
    "facilites": facilites,
    "allowed_members" : allowed_members,
  };
}
