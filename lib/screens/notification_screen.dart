import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  bool _notificationStatus = true;
  bool _languageStatus = false;

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
                          'Notifications',
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
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
                  Container(
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
                      padding: const EdgeInsets.only(bottom: 15,top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Workout Reminders',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: _notificationStatus,
                              onChanged: (value) {
                                setState(() {
                                  _notificationStatus = value;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 15,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 :  Colors.grey.shade300,
                                width: 2
                            )
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Program Notifications',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              value: _languageStatus,
                              onChanged: (value) {
                                setState(() {
                                  _languageStatus = value;
                                });
                              },
                              activeColor: Colors.green,
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
    );
  }
}
