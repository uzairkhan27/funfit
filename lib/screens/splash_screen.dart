import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:funfit/screens/selection_screen.dart';
import 'package:funfit/screens/wrapper_screen.dart';
import 'package:funfit/widgets/search_diet.dart';
import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:funfit/global.dart' as globals;
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../services/update_user.dart';
import '../utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) => const WrapperScreen(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) =>
                FadeTransition(opacity: animation, child: child))));

    super.initState();
  }

  updateUser() async{
    final user = Provider.of<User>(context);

    final prefs = await SharedPreferences.getInstance();
    dynamic jsonResponse = await getUser(customers_id: user.customers_id.toString());
    // log(200);
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
    if (prefs.getString("user") != null) {
      user.fromJson(
          await AppSharedPreference.readUser("user"));
      user.toJson();
      if (user.phone_number  != null|| prefs != null) {
        return true;
      } else {
        return false;
        // }
      }
    }
    else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user.email);
    if(user != null) {
      getUserFromSF(user);
    }
    updateUser();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/splash.jpg',
                  ),
                  fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black26,
                      Colors.black,
                    ],
                    begin: FractionalOffset(0.2, 2.0),
                    end: FractionalOffset(1.2, 0.0),
                    stops: [0.2, 1.0],
                    tileMode: TileMode.decal,
                ),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(),
                  Container(

                    decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage(
                      //     'assets/images/logo.png',
                      //   ),
                      // )
                    ),
                    child: const Column(
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/images/logo.png',
                          ),
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 15,),
                        Image(
                            image: AssetImage(
                                'assets/images/white.png',
                            ),
                        ),
                      ],
                    )
                  ),
                  // CircularProgressIndicator(color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
