import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends ChangeNotifier{
  int? id;
  int? vendors_id;
  int? vendors_types_id;
  String? name;
  String? email;
  String? phone_number;
  String? card_no;
  String? display_card_number;
  String? company;
  String? created_at;
  String? path;
  int? approved;
  int? customers_id;
  int? parent_id;
  dynamic? package;



  fromJson(Map<String,dynamic> json) {

    id = json["id"];
    vendors_id = json["vendors_id"];
    vendors_types_id = json["vendors_types_id"];
    name = json["name"];
    email = json["email"];
    phone_number = json["phone_number"];
    card_no = json["card_no"];
    display_card_number = json["display_card_number"];
    company = json["company"];
    created_at = json["created_at"];
    customers_id = json["customers_id"];
    parent_id = json["parent_id"];
    approved = json["approved"];
    package = json["package"];
    path = json["path"];
  }

  Map<String,dynamic> toJson() => {
    "id" : id,
    "vendors_id" : vendors_id,
    "vendors_types_id" : vendors_types_id,
    "name" : name,
    "email" : email,
    "phone_number" : phone_number,
    "card_no" : card_no,
    "display_card_number" : display_card_number,
    "company" : company,
    "created_at" : created_at,
    "approved" : approved,
    "customers_id" : customers_id,
    "parent_id" : parent_id,
    "package" : package,
    "path" : path,
  };

  removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
    //Map<String,dynamic> user = json["user"];
    name = null;
    id = null;
    email = null;
    phone_number = null;
    notifyListeners();
  }


}