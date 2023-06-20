import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../utils/theme_provider.dart';

class ThemeMoodScreen extends StatelessWidget {
  const ThemeMoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
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
                          onTap: () {
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
                                color:Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade200 :  Colors.grey.shade700,
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
                        'Theme Mood',
                        style: Theme.of(context).brightness == Brightness.dark ?
                        TextStyle(
                          color:  Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp : 15.sp,
                        ) : TextStyle(
                          color:  Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp : 15.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox())
                  ],
                ),

                Builder(
                  builder: (BuildContext context) {
                    final themeChanger = Provider.of<ThemeProvider>(context);

                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const SizedBox(
                          height: 30,
                        ),
                        Divider(
                          thickness: 3,
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade300,
                        ),
                        RadioListTile<ThemeMode>(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.trailing,
                            value: ThemeMode.light,
                            groupValue: themeChanger.themeMode,
                            onChanged: themeChanger.setTheme,
                          title:  Text(
                            'Light Mode',
                            style: Theme.of(context).brightness == Brightness.dark ? TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                            ) : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                            ),
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                            Divider(
                              thickness: 2,
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade300,
                            ),
                        RadioListTile<ThemeMode>(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Dark Mode',
                            style: Theme.of(context).brightness == Brightness.dark ? TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                            ) : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                            ),
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr,
                          ),
                          value: ThemeMode.dark,
                          groupValue: themeChanger.themeMode,
                          onChanged: themeChanger.setTheme,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                        Divider(
                          thickness: 2,
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade300,
                        ),
                        RadioListTile<ThemeMode>(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: ThemeMode.system,
                          groupValue: themeChanger.themeMode,
                          onChanged: themeChanger.setTheme,
                          title: Text(
                            'System Mode',
                            style: Theme.of(context).brightness == Brightness.dark ? TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                            ) : TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                            ),
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade300,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}


