import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:funfit/screens/login_screen.dart';
import 'package:funfit/services/register.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/user_model.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  int pageIndex = 0;
  bool isActive = false;
  bool _isLoading = false;
  String _name = "";
  String _email = "";
  String _phone = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {

    return  LoaderOverlay(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
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
                                'Welcome!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 20.sp: 15.sp,
                                ),
                              ),
                              const SizedBox(height: 6,),
                              Text(
                                'to keep track of your \n progress',
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

                    Container(
                      height: MediaQuery.of(context).size.height,
                    ),

                    Positioned(
                      top: 150,
                      right: 0,
                      left: 0,
                      child:  LoginFormBox(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget LoginFormBox() {
    final user = Provider.of<User>(context);
    return Container(
      margin: const EdgeInsets.only(left: 12,right: 12),
      width: MediaQuery.of(context).size.width,
      // height: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 15,
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
                  'Create an account',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp: 15.sp,
                  ),
                ),
                const SizedBox(height: 20,),

                TextFormField(
                  validator: (value) =>
                  value!.isEmpty ? 'Cannot be blank' : null,
                  controller: nameController,
                  onChanged: (val) => _name = val,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      color: Color(0xffABABAB),
                    ),
                    hintText: 'Name',
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xffABABAB),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // height: 1.9,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 0, color: Colors.transparent), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Color(0xffF4F4F4),
                    border: InputBorder.none,
                  ),

                ),
                const SizedBox(height: 15,),
                TextFormField(
                  validator: (value) =>
                  value!.isEmpty ? 'Cannot be blank' : null,
                  controller: phoneController,
                  onChanged: (val) => _phone = val,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                      color: Color(0xffABABAB),
                    ),
                    hintText: 'Phone',
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xffABABAB),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // height: 1.9,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 0, color: Colors.transparent), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Color(0xffF4F4F4),
                    border: InputBorder.none,
                  ),

                ),
                const SizedBox(height: 15,),

                TextFormField(
                  validator: (value) =>
                  value!.isEmpty ? 'Cannot be blank' : null,
                  controller: emailController,
                  onChanged: (val) => _email = val,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: Color(0xffABABAB),
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: Color(0xffABABAB),
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      // height: 1.9,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 0, color: Colors.transparent), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Color(0xffF4F4F4),
                    border: InputBorder.none,
                  ),

                ),
                const SizedBox(height: 15,),
                TextFormField(
                  validator: (value) =>
                  value!.isEmpty ? 'Cannot be blank' : null,
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
                      color: Color(0xffABABAB),
                      fontFamily: 'Poppins',
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
                    fillColor: Color(0xffF4F4F4),
                    border: InputBorder.none,
                  ),
                  onTap: () => setState(
                          () => isPasswordVisible = !isPasswordVisible),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () async {
                  if(_formKey.currentState!.validate()) {
                    _isLoading = true;
                    context.loaderOverlay.show();
                      dynamic jsonResponse = await register(
                          name: _name,
                          email: _email,
                          phone_number: _phone
                      ).whenComplete(() => _isLoading = false);
                        if(!_isLoading){
                          context.loaderOverlay.hide();
                        }
                        if(jsonResponse["success"] == "1"){
                          user.fromJson(jsonResponse);
                          user.toJson();
                          if (!mounted) return;
                          Navigator.of(context).push(PageAnimationTransition(page: const LoginScreen(), pageAnimationType: ScaleAnimationTransition()));
                        }
                        else {
                          if(jsonResponse["success"] == "0"){
                            String message = jsonResponse['message'];
                            print(jsonResponse['message']);
                            AnimatedSnackBar.material(
                              duration: Duration(seconds: 5),
                              // jsonResponse['message'],
                              // 'Email address is already exist',
                              message,
                              type: AnimatedSnackBarType.error,
                              mobileSnackBarPosition: MobileSnackBarPosition.top,
                              desktopSnackBarPosition:
                              DesktopSnackBarPosition.topCenter,
                            ).show(context);
                          }
                        }
                  }
                  log(_phone);
                  log(_name);
                  log(_email);
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
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account?',
                      style: TextStyle(
                        color: const Color(0xffABABAB),
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(PageAnimationTransition(page: const LoginScreen(), pageAnimationType: RightToLeftTransition()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 0,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
