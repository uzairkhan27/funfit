import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:funfit/global.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../services/update_user.dart';
import '../utils/shared_preferences.dart';
import 'dashboard_screen.dart';
import 'onBoarding_screen.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  updateUser() async{
    final user = Provider.of<User>(context);

    final prefs = await SharedPreferences.getInstance();

    dynamic jsonResponse = await getUser(customers_id: user.customers_id.toString());
    log("200");

    if(jsonResponse["data"]['package'] != null) {
      globals.expirey_date = jsonResponse["data"]['package']['end_date'].toString();
    }
    if (jsonResponse["success"] == "1") {
      await AppSharedPreference.saveUser("user", jsonResponse["data"]);
    }else{
      return print('failed');
    }
    getUserFromSF(user);
    prefs.reload();
  }

  getUserFromSF(User user) async {
    final prefs = await SharedPreferences.getInstance();
    // print(prefs.getString("user") );
    if (prefs.getString("user") != null) {
      user.fromJson(
          await AppSharedPreference.readUser("user"));
      user.toJson();
      if (user.email != null|| prefs != null) {
        return true;
      } else {
        return false;
      }
    }
    else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user.phone_number != null) {
      updateUser();
      return const DashboardScreen();
    } else {
      return const OnBoardingScreen();
      // }
    }
  }
}
