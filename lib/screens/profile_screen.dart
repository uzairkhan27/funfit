import 'package:flutter/material.dart';
import 'package:funfit/models/deal_model.dart';
import 'package:funfit/screens/edit_profile_screen.dart';
import 'package:funfit/screens/login_screen.dart';
import 'package:funfit/screens/seetings_screen.dart';
import 'package:funfit/utils/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../models/user_model.dart';
import '../widgets/progress_box.dart';
import 'package:funfit/global.dart' as globals;
import 'package:funfit/utils/home_url.dart' as home_url;

import 'privacy_policy_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
// File convertToFile(XFile image)=>File()
//   getUserFromSF(User user) async {
//     final prefs = await SharedPreferences.getInstance();
//     // print(prefs.getString("user") );
//     if (prefs.getString("user") != null) {
//       user.fromJson(await AppSharedPreference.readUser("user"));
//       user.toJson();
//       if (user != null || prefs != null) {
//         return true;
//       } else {
//         return false;
//         // }
//       }
//     } else {
//       return false;
//     }
//   }

  getUserFromSF(User user) async {
    final prefs = await SharedPreferences.getInstance();
    // print(prefs.getString("user") );
    if (prefs.getString("user") != null) {
      user.fromJson(
        // the value from key "user" is returned from shared pref and is passed as
        // json to user models' fromJson
          await AppSharedPreference.readUser("user"));
      return user.toJson();
    }
    else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user.name);
    if (user != null) {
      getUserFromSF(user);
    }
    // print(user.name);
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors.white,
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(right: 35,left: 10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade200,
                  width: 2,
                )
              ),
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
                elevation: 0,
                isExtended: true,
                onPressed: () async {
                  user.removeUser();
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  const LoginScreen()));
                  final prefs = await SharedPreferences.getInstance();
                  globals.customer_id = "";
                  await prefs.remove('user').whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())));
                },
                    child: Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
            ),
          ),
          body: Center(
            child: Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.blue,
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.transparent : Colors.grey.shade200,
                                  child: Transform.translate(
                                    offset: const Offset(3, 0),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 12,
                                      color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade200 :  Colors.grey.shade700,
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
                              'Profile',
                              style: Theme.of(context).brightness == Brightness.dark ?  TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp: 15.sp,
                              ) : TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp: 15.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Expanded(
                              flex: 2,
                              child: SizedBox(

                              ))
                        ],
                      ),
                      const SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //FIRST CHILDREN
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150),
                              border: Border.all(color: Colors.green,width: 2)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image(
                                image: NetworkImage(
                                  '${home_url.baseUrl}/${user.path}',
                              ),
                                width: 80,
                                height: 80,
                        ),
                            ),
                          ),

                           //SECOND CHILDREN
                           Container(
                             decoration: BoxDecoration(
                               border: Border(
                                 left: BorderSide(
                                   color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade700 :  Colors.grey.shade200,
                                   width: 2
                                 )
                               )
                             ),
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                       'Joined',
                                   style: TextStyle(
                                     color: Colors.grey,
                                     fontFamily: 'Poppins',
                                     fontWeight: FontWeight.w500,
                                     fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                                   ),
                                   ),
                                   Text(
                                     '2 mon ago',
                                     style: TextStyle(
                                       color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                       fontWeight: FontWeight.w600,
                                       fontFamily: 'Poppins',
                                       fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        user.name.toString(),
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 24.sp: 15.sp,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Divider(
                        thickness: 2,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade700 :  Colors.grey.shade200,
                      ),
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen(
                              name: user.name.toString(),
                              email: user.email.toString(),
                              // start_date: null,
                              // end_date: end_date,
                              // start_time: start_time,
                              // end_time: end_time,
                              // description: description,
                              // address: address,
                              vendor_types_id: globals.vendors_id,
                              vendors_id: user.vendors_types_id.toString(),
                              deals_id: '',
                              path: user.path.toString(),
                              featured_imgs: '',
                              // featured_imgs: featured_imgs,
                              // facilities: facilities,
                              // allowed_members: allowed_members,
                              // status: status,
                          )));
                          print(globals.vendors_id);
                          print('hello world');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade200,
                                width: 2
                              )
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade300 : Colors.grey.shade700,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                                  ),
                                ),
                                Icon(
                                    Icons.arrow_forward_ios,
                                color: Colors.grey.shade400,
                                  size: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen(startDate: '', endDate: '',)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade200,
                                      width: 2
                                  )
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                    color:Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade300 : Colors.grey.shade700,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey.shade400,
                                  size: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade200,
                                      width: 2
                                  )
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Settings',
                                  style: TextStyle(
                                    color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade300 : Colors.grey.shade700,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey.shade400,
                                  size: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

// Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 20,
// ),
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const SizedBox(height: 20,),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// InkWell(
// onTap: (){
// Navigator.of(context).pop();
// },
// child: CircleAvatar(
// backgroundColor: Colors.grey.shade200,
// child: Transform.translate(
// offset: const Offset(3, 0),
// child: Icon(
// Icons.arrow_back_ios,
// size: 16,
// color: Colors.grey.shade700,
// ),
// ),
// ),
// ),
// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
// ),
// child: PopupMenuButton(
// shadowColor: Colors.transparent,
// color: Colors.black,
// color: Colors.white70,
// fontWeight: FontWeight.w500,
// fontFamily: 'Poppins',
// fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
// ),
// textAlign: TextAlign.center,
// ),
// ],
// ),
//
//
// ],
// ),
// const SizedBox(height: 20,),
// SizedBox(
// height:MediaQuery.of(context).size.height > 800 ? 16.h : MediaQuery.of(context).size.height < 500 ? 12.h: 15.h,
// width: MediaQuery.of(context).size.width,
// child: const Row(
// children: [
// Expanded(
// flex:2,
// child: ProgressBox(
// icon: Icons.directions_walk_rounded,
// title: '6,359',
// desc: 'STEPS',
// ),
// ),
// Expanded(
// flex:2,
// child: ProgressBox(
// icon: Icons.local_fire_department_outlined,
// title: '3.115 KCAL',
// desc: 'CAL BURN',
// ),
// ),
// Expanded(
// flex:2,
// child: ProgressBox(
// icon: Icons.favorite_border,
// title: '123 BPM',
// desc: 'HEARTBEAT',
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// Transform.translate(
// offset: const Offset(28, 70),
// child:  Align(
// alignment: FractionalOffset.center,
// child: Container(
// decoration: BoxDecoration(
// color: Colors.green,
// borderRadius: BorderRadius.circular(8),
// ),
// child: const Padding(
// padding: EdgeInsets.all(6.0),
// child: Icon(
// Icons.mode_edit_sharp,
// color: Colors.white,
// size: 18,
// ),
// ),
// ),
// ),
// ),
// // Positioned(
// //   right: 10,
// //   top: 70,
// //   child: InkWell(
// //     onTap: (){
// //       print('object');
// //     },
// //     child: InkWell(
// //       onTap: (){
// //         Navigator.push(context, MaterialPageRoute(builder: (context) =>  const EditProfileScreen(name: '', email: '', path: '',)));
// //       },
// //       child: const CircleAvatar(
// //         backgroundColor: Colors.white,
// //         child: Icon(
// //           Icons.edit,
// //           color: Colors.green,
// //         ),
// //       ),
// //     ),
// //   ),
// // ),
// ],
// ),
// const SizedBox(height: 20,),
//
//
//
//
//
//
//
//
//
//
//
// const SizedBox(height: 20,),
// ],
// ),
// ),
// ),
// itemBuilder: (context) => [
// PopupMenuItem(
// child: InkWell(
// onTap: () async {
// // user.removeUser();
// // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
// final prefs = await SharedPreferences.getInstance();
// globals.customer_id = "";
// await prefs.remove('user').whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())));
// },
// child: SizedBox(
// // width: 80,
// // height: 20,
// child: Row(
// children: [
// const Icon(Icons.logout,color: Colors.white,),
// const SizedBox(width: 10,),
// Text(
// 'Logout',
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w500,
// fontFamily: 'Poppins',
// fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
// ),
// ),
// ],
// ),
// ),
// ))
// ]),
// ),
// ],
// ),
// const SizedBox(height: 20,),
// Text(
// 'MY PROFILE',
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.w600,
// fontFamily: 'Poppins',
// fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp: 15.sp,
// ),
// ),
// Stack(
// children: [
// Container(
// margin: const EdgeInsets.only(top: 60),
// width: MediaQuery.of(context).size.width,
// decoration: BoxDecoration(
// // color: Colors.grey.shade200,
// borderRadius: BorderRadius.circular(16),
// image: DecorationImage(
// image: const AssetImage(
// 'assets/images/bg.jpg',
// ),
// fit: BoxFit.cover,
// colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.7), BlendMode.multiply),
// ),
// ),
// child: Transform.translate(
// offset: Offset(0, -38),
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
// child: Column(
// children: [
// Container(
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(150),
// border: Border.all(color: Colors.white,style: BorderStyle.solid,width: 1),
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(150),
// child: Image(
// image:
// NetworkImage(
// '${home_url.baseUrl}/${user.path}'
// ),
// width: 80,
// height: 80,
// fit: BoxFit.cover,
// ),
// ),
// ),
// const SizedBox(height: 10,),
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Text(
// user.name.toString(),
// // 'Jamie Nelson',
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w600,
// fontFamily: 'Poppins',
// fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 15.sp: 15.sp,
// ),
// ),
// Text(
// // 'jamienelson12@gmail.com',
// user.email.toString(),
// style: TextStyle(
