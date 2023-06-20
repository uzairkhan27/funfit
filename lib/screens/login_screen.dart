import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:funfit/screens/dashboard_screen.dart';
import 'package:funfit/screens/registration_screen.dart';
import 'package:funfit/services/login.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';

import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../models/user_model.dart';
import '../utils/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


// getUserFromSF(User user) async {
//   final prefs = await SharedPreferences.getInstance();
//   // print(prefs.getString("user") );
//   if (prefs.getString("user") != null) {
//     user.fromJson(
//         await AppSharedPreference.readUser("user"));
//     user.toJson();
//     if (user != null|| prefs != null) {
//       return true;
//     } else {
//       return false;
//       // }
//     }
//   }
//   else {
//     return false;
//   }
// }

class _LoginScreenState extends State<LoginScreen> {



  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool _isLoading = false;
  String _password = "";
  String _phone = "";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user.email);
    return  LoaderOverlay(
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width > 800 ? 16.h : MediaQuery.of(context).size.width < 500 ? 40.h: 15.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/man1.jpg'),fit: BoxFit.cover)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // user.removeUser() ? 'Hi ${user.name}' : 'Welcome Back',
                             // prefs.remove("user") ? 'Hi ${user.name}' : 'Welcome Back',
                            user.email != null ? 'Hi ${user.name}' : 'Welcome back',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                              ),
                            ),
                            const SizedBox(height: 6,),
                            Text(
                              'good to have you back',
                              style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'Poppins',
                                fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      )
                    ),

                    // Container(
                    //   height: MediaQuery.of(context).size.width > 800 ? 16.h : MediaQuery.of(context).size.width < 500 ? 96.h: 15.h,
                    // ),

                    Positioned(
                      top: 150,
                      right: 0,
                      left: 0,
                      child:  LoginFormBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }


  Widget LoginFormBox() {
    final user = Provider.of<User>(context);
    // print(user.name);
    return Container(
      margin: const EdgeInsets.only(left: 12,right: 12),
      width: MediaQuery.of(context).size.width,
      // height: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 12,
              offset: const Offset(4, 8), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(18)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 24.sp: 15.sp,
                  ),
                ),
                const SizedBox(height: 40,),
                TextFormField(
                  onChanged: (val) => _phone = val,
                  validator: (value) =>
                  value!.isEmpty ? 'Email cannot be blank' : null,
                  // keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: Color(0xffABABAB),
                    ),
                    hintText: 'Email or Phone',
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xffABABAB),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // height: 1.9,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 0, color: Colors.transparent), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Color(0xffF4F4F4),
                    border: InputBorder.none,
                  ),

                ),
                const SizedBox(height: 20,),
                TextFormField(
                  validator: (value) =>
                  value!.isEmpty ? 'Password cannot be blank' : null,
                  onChanged: (val) => _password = val,
                  controller: passwordController,
                  obscureText: isPasswordVisible,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    prefixIcon: const Icon(
                      Icons.security,
                      color: Color(0xffABABAB),
                    ),
                    suffixIcon: isPasswordVisible ? const Icon(
                      Icons.visibility,
                      color: Color(0xffABABAB),
                    ) : const Icon(
                      Icons.visibility_off,
                      color: Color(0xffABABAB),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xffABABAB),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // height: 1.9,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0, color: Colors.transparent), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0, color: Colors.transparent), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: const Color(0xffF4F4F4),
                    border: InputBorder.none,
                  ),
                  onTap: () => setState(
                          () => isPasswordVisible = !isPasswordVisible),
                ),
                const SizedBox(height: 5,),
                // TextButton(
                //   onPressed: (){},
                //   child: const Text(
                //     'Forgot Password?',
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontFamily: 'Poppins',
                //     ),
                //   ),
                // ),
                const SizedBox(height: 25,),
                GestureDetector(
                  onTap: () async {
                     if(_formKey.currentState!.validate()){
                       _isLoading = true;
                        context.loaderOverlay.show();
                        dynamic jsonResponse = await login(
                            phone_number: _phone
                        ).whenComplete(() => context.loaderOverlay.hide());
                        log(_phone.toString());
                        if(!_isLoading){
                          context.loaderOverlay.hide();
                        }
                        if(jsonResponse["success"] == "1"){
                          print(jsonResponse["success"]);
                          await AppSharedPreference.saveUserHasLoggedIn('logged_in', true);
                          // globals.vendors_id=jsonResponse["data"][0]['vendors_id'].toString();
                          await AppSharedPreference.saveUser("user", jsonResponse["data"]);
                          user.fromJson(jsonResponse);
                          user.toJson();
                          if (!mounted) return;
                          Navigator.of(context).push(PageAnimationTransition(page: const DashboardScreen(), pageAnimationType: ScaleAnimationTransition()));
                        }else {
                          if(jsonResponse['success'] == "0"){
                            String message = jsonResponse['message'];
                            // print(jsonResponse['message']);
                            AnimatedSnackBar.material(
                              duration: Duration(seconds: 5),
                              message,
                              type: AnimatedSnackBarType.error,
                              mobileSnackBarPosition: MobileSnackBarPosition.top,
                              desktopSnackBarPosition:
                              DesktopSnackBarPosition.topCenter,
                            ).show(context);
                          }
                        }
                       emailController.clear();
                       passwordController.clear();
                     }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Need an Account?',
                      style: TextStyle(
                        color: const Color(0xffABABAB),
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(PageAnimationTransition(page: const RegisterationScreen(), pageAnimationType: RightToLeftTransition()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 13,),
              ],
            ),
          ),
        ),
      ),
    );
  }



}
