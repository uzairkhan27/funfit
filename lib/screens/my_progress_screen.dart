import 'package:flutter/material.dart';
import 'package:funfit/screens/profile_screen.dart';
import 'package:funfit/screens/seetings_screen.dart';
import 'package:funfit/widgets/performance_list.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../models/user_model.dart';
import '../services/user_progress.dart';
import 'login_screen.dart';
import 'package:funfit/global.dart' as globals;
import 'package:funfit/utils/home_url.dart' as home_url;

class MyProgressScreen extends StatefulWidget {
  const MyProgressScreen({Key? key}) : super(key: key);

  @override
  State<MyProgressScreen> createState() => _MyProgressScreenState();
}

class _MyProgressScreenState extends State<MyProgressScreen> {

  // final List<DataPoint> data = [
  //   DataPoint(x: DateTime(2023, 4, 1),y: 10),
  //   DataPoint(x: DateTime(2023, 4, 15), y: 30),
  //   DataPoint(x: DateTime(2023, 5, 1), y: 20),
  //   DataPoint(x: DateTime(2023, 5, 15), y: 40),
  //   DataPoint(x: DateTime(2023, 6, 1), y: 50),
  //   DataPoint(x: DateTime(2023, 6, 15), y: 60),
  // ];


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height > 800 ? 16.h : MediaQuery.of(context).size.width < 500 ? 130.h: 15.h,
              child: Stack(
                children: [
                  //FIRST CHILDREN
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width > 800 ? 16.h : MediaQuery.of(context).size.width < 500 ? 50.h: 15.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                          'assets/images/bg.jpg',
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.7), BlendMode.multiply),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      child: Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                          '${home_url.baseUrl}/${user.path}',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        // color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: PopupMenuButton(
                                          shadowColor: Colors.transparent,
                                          // color: Colors.black.withOpacity(.9),
                                          color: Colors.white,
                                          icon: const Icon(Icons.more_vert,color: Colors.white,size: 18,),
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                                child: InkWell(
                                                  onTap: () {
                                                    // user.removeUser();
                                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                                                    // final prefs = await SharedPreferences.getInstance();
                                                    // globals.customer_id = "";
                                                    // await prefs.remove('user').whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())));
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
                                                  },
                                                  child: SizedBox(
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.settings_rounded,color: Colors.blue.shade900,),
                                                        const SizedBox(width: 10,),
                                                        Text(
                                                          'Settings',
                                                          style: TextStyle(
                                                            color: Colors.blue.shade900,
                                                            fontWeight: FontWeight.w500,
                                                            fontFamily: 'Poppins',
                                                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                          ]),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Running',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 20.sp: 15.sp,
                                    ),
                                  ),

                                  Text(
                                    'For Weight loss'.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins',
                                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 9.sp: 15.sp,
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(top: 35),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 7),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star_border_rounded,
                                            color: Colors.yellow,
                                            size: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 15.sp: 15.sp,
                                          ),
                                          SizedBox(width: 7,),
                                          Text(
                                            'FunFit Club'.toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Poppins',
                                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            const SizedBox(
                              height: 120,
                                width: 150,
                                child: CircularProgressBar()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.width > 800 ? 16.h : MediaQuery.of(context).size.width < 500 ? 5.h: 15.h,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10,left: 20,top: 20,right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Performance',
                              style: TextStyle(
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 15.sp: 15.sp,
                              ),
                            ),
                            const SizedBox(height: 13,),
                            const PerformanceList(
                              image: 'assets/images/pull-up.png',
                              title: 'Pull Up',
                              t1: '1260 cal',
                              t2: '10 sets',
                              t3: 'Completed',
                            ),
                            const SizedBox(height: 13,),
                            const PerformanceList(
                              image: 'assets/images/stretching.jpg',
                              title: 'Stretching',
                              t1: '1500 cal',
                              t2: '30 min',
                              t3: 'Completed',
                            ),
                            const SizedBox(height: 13,),
                            const PerformanceList(
                              image: 'assets/images/plank.jpg',
                              title: 'Plank',
                              t1: '1000 cal',
                              t2: '8 min',
                              t3: 'Completed',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //SECOND CHILDREN
                  Positioned(
                    top: MediaQuery.of(context).size.width > 800 ? 16.h : MediaQuery.of(context).size.width < 500 ? 36.h: 15.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 22,
                              offset: Offset(0.5, 0.7),
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(right: 20),
                          width: MediaQuery.of(context).size.width, // set the desired width
                          height: 200, // set the desired height
                          child: SizedBox(),
                          // AnimatedLineChart(
                          //   data: data,
                          //   dividerX: DateTime(2023, 2, 1),
                          //   // dividerXColor: Colors.grey,
                          //   leftChartColor: Colors.grey,
                          //   rightChartColor: Colors.green,
                          //   showXLabel: true,
                          //   showYLabel: true,
                          //   // labelTextStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                          //   // showDotAnimation: false,
                          //   showLastData: true,
                          // ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),


                ],
              ),
            ),
          ),
        ),
    );
  }
}


class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar({Key? key}) : super(key: key);

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> {

  dynamic _userPackages;
  @override
  void initState() {
    _userPackages =  usePackage(customers_id: globals.customer_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _userPackages,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: CircularPercentIndicator(
                  radius: 55.0,
                  lineWidth: 10.0,
                  animation: true,
                  percent: 0.0,
                  center: Text(
                    "0%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800
                          ? 16.sp
                          : MediaQuery.of(context).size.width < 500
                          ? 11.sp
                          : 15.sp,
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.white,
                  backgroundColor: Colors.black26,
                  backgroundWidth: 3,
                ),
              ),
            ],
          );
        }

        if (snapshot.hasData) {
          dynamic data = snapshot.data;
          double percentage = 0.0;
          try {
            if (data['percentage_on_point'] != null) {
              percentage = double.parse(data['percentage_on_point'].toString());
              // print(percentage);
            }
          } catch (e) {
            print('Error parsing percentage: $e');
          }
          return SizedBox(
            height: 200,
            width: 120,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: CircularPercentIndicator(
                    radius: 55.0,
                    lineWidth: 10,
                    animation: true,
                    percent: percentage,
                    center: Text(
                      data['percentage']+'%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: MediaQuery.of(context).size.width > 800
                            ? 16.sp
                            : MediaQuery.of(context).size.width < 500
                            ? 11.sp
                            : 15.sp,
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.white,
                    backgroundColor: Colors.black26,
                    backgroundWidth: 3,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          // Handle the error case
          print('Error: ${snapshot.error}');
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: CircularPercentIndicator(
                  radius: 55.0,
                  lineWidth: 10.0,
                  animation: true,
                  percent: 0.7,
                  center: Text(
                    "70%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800
                          ? 16.sp
                          : MediaQuery.of(context).size.width < 500
                          ? 11.sp
                          : 15.sp,
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.white,
                  backgroundColor: Colors.black26,
                  backgroundWidth: 3,
                ),
              ),
            ],
          );
        } else {
          return Container(); // Placeholder for other cases (snapshot is null, etc.)
        }
      },
    );
  }
}
