import 'package:flutter/material.dart';
import 'package:funfit/screens/language_screen.dart';
import 'package:funfit/screens/notification_screen.dart';
import 'package:funfit/screens/theme_mood_screen.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
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
                          'Settings',
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

                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade200,
                                width: 2),
                            top: BorderSide(
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade300,
                                width: 2,
                            ),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20,top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notifications',
                            style: TextStyle(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade300 : Colors.grey.shade700,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                            ) ,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LanguageScreen()));
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
                            'Languages',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ThemeMoodScreen()));
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
                            'Theme',
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
        )
    );
  }
}
