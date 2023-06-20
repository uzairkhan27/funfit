import 'dart:developer';
import 'package:funfit/global.dart' as globals;
import 'package:flutter/material.dart';
import 'package:funfit/screens/diet_screen.dart';
import 'package:funfit/screens/my_progress_screen.dart';
import 'package:funfit/screens/search_screen.dart';
import 'package:funfit/screens/workout_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../services/update_user.dart';
import '../utils/shared_preferences.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _currentIndex = 0;

  final List<Widget> _screens = [
    // const HomeScreen(),
    const WorkoutScreen(),
    const DietScreen(),
    const SearchProgram(),
    const MyProgressScreen(),
  ];


  // getUserFromSF(User user) async {
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   // print(prefs.getString("user") );
  //   if (prefs.getString("user") != null) {
  //     user.fromJson(
  //       // the value from key "user" is returned from shared pref and is passed as
  //       // json to user models' fromJson
  //         await AppSharedPreference.readUser("user"));
  //     user.toJson();
  //
  //     if (user.email != null|| prefs != null) {
  //       return true;
  //     } else {
  //       // if (getOnBoardFromSF() == true) {
  //       //   return const SignInScreen();
  //       // } else {
  //       return false;
  //       // }
  //     }
  //   }
  //   else {
  //     return false;
  //   }
  // }
  //
  // updateUser() async {
  //   final user = Provider.of<User>(context);
  //
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   dynamic jsonResponse = await getUser(customers_id: user.customers_id.toString());
  //   log("200");
  //
  //   if(jsonResponse["data"]['package'] != null) {
  //     globals.expirey_date = jsonResponse["data"]['package']['end_date'].toString();
  //   }
  //   if (jsonResponse["success"] == "1") {
  //     await AppSharedPreference.saveUser("user", jsonResponse["data"]);
  //   }else{
  //     return print('failed');
  //   }
  //   getUserFromSF(user);
  //   prefs.reload();
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // if(user != null) {
    //   getUserFromSF(user);
    //   // print(user.email);
    //   globals.customer_id = user.customers_id.toString();
    // }
    // updateUser();
    return SafeArea(
        child: Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: Container(
            // margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.grey : Colors.transparent,
                  offset: Theme.of(context).brightness == Brightness.dark ?  Offset(0, 20) :  Offset(0, 0),
                  blurRadius: Theme.of(context).brightness == Brightness.dark ? 30 : 0,
                )
              ]
            ),
            child: BottomNavigationBar(
              selectedLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              iconSize: 26,
              selectedItemColor: Theme.of(context).brightness == Brightness.dark ? Colors.white70: Colors.green,
              selectedFontSize: 14,
              showSelectedLabels: true,
              backgroundColor: Colors.grey,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items:  [
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.home_outlined,
                //     color: Colors.black,),
                //   label: 'Home',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.fitness_center_outlined,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white: Colors.black,
                  ),
                  label: 'Workout',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.restaurant_menu_outlined,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white: Colors.black,
                  ),
                  label: 'Diet',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search_sharp,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white: Colors.black,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.trending_up_outlined,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white: Colors.black,
                  ),
                  label: 'Progress',
                ),
              ],
            ),
          ),
        ),
    );
  }
}
