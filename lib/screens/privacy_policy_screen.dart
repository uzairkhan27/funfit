import 'dart:convert';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:funfit/models/deal_model.dart';
import 'package:funfit/models/user_model.dart';
import 'package:funfit/widgets/workout_widget_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:funfit/global.dart' as globals;
import '../services/dashboard_workout.dart';
import '../services/search_program.dart';
import '../services/update_user.dart';
import '../utils/shared_preferences.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  final String? startDate;
  final String? endDate;
  const PrivacyPolicyScreen({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  updateUser() async {
    final user = Provider.of<User>(context);

    final prefs = await SharedPreferences.getInstance();
    dynamic jsonResponse =
        await getUser(customers_id: user.customers_id.toString());
    // log(200);
    if (jsonResponse["data"]['package'] != null) {
      globals.expirey_date =
          jsonResponse["data"]['package']['end_date'].toString();
      print(jsonResponse["data"]['package']['end_date'].toString());
    }
    if (jsonResponse["success"] == "1") {
      await AppSharedPreference.saveUser("user", jsonResponse["data"]);
    } else {
      return print('failed');
    }
    getUserFromSF(user);
    prefs.reload();
  }

  getUserFromSF(User user) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("user") != null) {
      user.fromJson(await AppSharedPreference.readUser("user"));
      user.toJson();
      if (user.phone_number != null || prefs != null) {
        return true;
      } else {
        return false;
        // }
      }
    } else {
      return false;
    }
  }

  String bullet = "\u2022 ";

  DateTime now = DateTime.now();
  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    // final deal = Provider.of<Deal>(context);
    final user = Provider.of<User>(context);

    if (user != null) {
      getUserFromSF(user);
    }
    updateUser();
    print(user.created_at.toString());
    print("hello world");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Transform.translate(
                        offset: Offset(-10, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey.shade200,
                            child: Transform.translate(
                              offset: const Offset(3, 0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 30,),
                    Expanded(
                      flex: 8,
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.width > 800
                              ? 16.sp
                              : MediaQuery.of(context).size.width < 500
                                  ? 17.sp
                                  : 15.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox())
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Privacy Policy For FunFit',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'At Funfit, we are committed to protecting the privacy of our users. This Privacy Policy outlines how we collect, use, disclose, and safeguard your personal information when you use our Funfit Flutter Gym App ("App"). Please read this Privacy Policy carefully to understand our practices regarding your personal information and how we will treat it. By accessing or using our App, you agree to the terms of this Privacy Policy.',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                      height: 1.8,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '1. Information We Collect ',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: RichText(
                text:  TextSpan(
                  text: "1.1  Personal Information: ",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                    height: 1.8,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'We may collect certain personal information that can be used to identify you as an individual. The types of personal information we may collect include your name, email address, age, gender, and any other information you provide to us voluntarily.',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text:  TextSpan(
                      text: "1.2 Usage Data: ",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                        height: 1.8,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'We may collect non-personal information about how you use our App, such as your device information, IP address, and browsing patterns. This information is used to analyze trends, administer the App, track user\'s movements, and gather demographic information for aggregate use.',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  '2. How We Use Your Information',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "2.1 We may use the personal information we collect to:",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                  height: 1.8,
                ),
              ),
            ),
                const SizedBox(
                  height: 8,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Provide and maintain our App\'s functionality and features.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Personalize your experience with the App.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Respond to your inquiries, comments, or feedback.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Send you promotional materials and other communications (only if you have given your consent).',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Improve our App and develop new features and offerings.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Ensure the security and integrity of the App.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "2.2 We may use the non-personal information we collect for various purposes, including:",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                      height: 1.8,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Analyzing usage patterns and trends to improve the App\'s functionality.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Conducting research and statistical analysis.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Enhancing the security and performance of the App.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Aggregating and anonymizing data for analytical purposes.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                const SizedBox(
                  height: 20,
                ),

                Text(
                  '3. How We Share Your Information',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "3.1 We may share your personal information with third parties in the following circumstances:",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                      height: 1.8,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'With your consent: We may share your information when you provide explicit consent for such disclosure.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Service providers: We may engage third-party service providers to assist us in operating the App and provide services on our behalf. These service providers will have access to your personal information but are obligated not to disclose or use it for any other purpose.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Legal requirements: We may disclose your information if required to do so by law or in response to valid requests by public authorities (e.g., a court or government agency).',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        bullet,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(
                          'Business transfers: If Funfit is involved in a merger, acquisition, or sale of all or a portion of its assets, your information may be transferred as part of that transaction.',
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  '4. Data Security',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'We implement reasonable security measures to protect your personal information from unauthorized access, use, or disclosure. However, please note that no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                      height: 1.8,
                    ),
                  ),
                ),


                const SizedBox(
                  height: 20,
                ),
                Text(
                  '5. Your Choices and Rights',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text:  TextSpan(
                      text: "5.1 Opt-Out: ",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                        height: 1.8,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'You may choose to opt-out of receiving promotional communications from us by following the instructions provided in those communications or by contacting us directly.',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text:  TextSpan(
                      text: "5.2 Access and Rectification: ",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                        height: 1.8,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'You have the right to access and update your personal information. If you would like to review, correct, or delete any personal information we have collected about you, please contact us.',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '6. Children\'s Privacy',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Our App is not intended for children under the age of 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe that your child has provided us with personal information, please contact us. If we become aware that we have collected personal information from a child under the age of 13 without verification of parental consent, we will take steps to remove that information from our servers.',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                      height: 1.8,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  '7. Changes to This Privacy Policy',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'We may update our Privacy Policy from time to time. Any changes we make will be posted on this page, and the effective date will be revised accordingly. We encourage you to review this Privacy Policy periodically for any updates.',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                      height: 1.8,
                    ),
                  ),
                ),


                const SizedBox(
                  height: 20,
                ),
                Text(
                  '8. Contact Us',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                    height: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text:  TextSpan(
                      text: "If you have any questions, concerns, or suggestions regarding our Privacy Policy or our privacy practices, please contact us at",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                        height: 1.8,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: ' [info@funfit.com].',
                          style: TextStyle(
                            color: Colors.green.shade800,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.8,
                          ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Terms of Service"');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'By using the Funfit Flutter Gym App, you signify your acceptance of this Privacy Policy. If you do not agree to this Privacy Policy, please do not use our App.',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                      height: 1.8,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text:  TextSpan(
                      text: "Last updated: ",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                        height: 1.8,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: ' $formattedDate',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
