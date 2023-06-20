// import 'package:animated_line_chart/animated_line_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:funfit/widgets/circle_progress_bar.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:sizer/sizer.dart';
// import 'package:funfit/global.dart' as globals;
// import '../services/user_progress.dart';
// import '../widgets/progress_box.dart';
//
// class ProgressScreen extends StatefulWidget {
//   const ProgressScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProgressScreen> createState() => _ProgressScreenState();
// }
//
// class _ProgressScreenState extends State<ProgressScreen> {
//
//   final List<DataPoint> data = [
//     DataPoint(x: DateTime(2023, 4, 1), y: 10),
//     DataPoint(x: DateTime(2023, 4, 15), y: 30),
//     DataPoint(x: DateTime(2023, 5, 1), y: 20),
//     DataPoint(x: DateTime(2023, 5, 15), y: 40),
//     DataPoint(x: DateTime(2023, 6, 1), y: 50),
//     DataPoint(x: DateTime(2023, 6, 15), y: 60),
//   ];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 30,),
//                   Text(
//                     'YOUR',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'Poppins',
//                       fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 18.sp: 15.sp,
//                     ),
//                   ),
//                   Text(
//                     'Daily Progress',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Poppins',
//                       fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
//                     ),
//                   ),
//                   const SizedBox(height: 30,),
//                   SizedBox(
//                     height:MediaQuery.of(context).size.height > 800 ? 16.h : MediaQuery.of(context).size.height < 500 ? 12.h: 15.h,
//                     width: MediaQuery.of(context).size.width,
//                     child: const Row(
//                       children: [
//                         Expanded(
//                           flex:2,
//                           child: ProgressBox(
//                             icon: Icons.directions_walk_rounded,
//                             title: '6,359',
//                             desc: 'STEPS',
//                           ),
//                         ),
//                         Expanded(
//                           flex:2,
//                           child: ProgressBox(
//                             icon: Icons.local_fire_department_outlined,
//                             title: '3.115 KCAL',
//                             desc: 'CAL BURN',
//                           ),
//                         ),
//                         Expanded(
//                           flex:2,
//                           child: ProgressBox(
//                             icon: Icons.favorite_border,
//                             title: '123 BPM',
//                             desc: 'HEARTBEAT',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 20,),
//                   Container(
//                     margin: const EdgeInsets.only(right: 10),
//                     width: MediaQuery.of(context).size.width, // set the desired width
//                     height: 200, // set the desired height
//                     child: AnimatedLineChart(
//                       data: data,
//                       dividerX: DateTime(2023, 2, 1),
//                       // dividerXColor: Colors.grey,
//                       leftChartColor: Colors.grey,
//                       rightChartColor: Colors.green,
//                       showXLabel: true,
//                       showYLabel: true,
//                       // labelTextStyle: const TextStyle(color: Colors.grey, fontSize: 12),
//                       // showDotAnimation: false,
//                       showLastData: true,
//                     ),
//                   ),
//                   // Container(
//                   //   height: 300,
//                   //   padding: const EdgeInsets.all(16),
//                   //   child: MonthlyChart.withSampleData(),
//                   // ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 15,),
//                           Text(
//                             'Performance',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Poppins',
//                               fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 15.sp: 15.sp,
//                             ),
//                           ),
//                           const SizedBox(height: 10,),
//                           Text(
//                             'Weekly',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Poppins',
//                               fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
//                             ),
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: 'Total :',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontFamily: 'Poppins',
//                                 fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
//                               ),
//                               children: const <TextSpan>[
//                                 TextSpan(text: ' 534', style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                   fontFamily: 'Poppins',
//                                 )),
//                                 // TextSpan(text: ' world!'),
//                               ],
//                             ),
//                           ),
//
//                           const SizedBox(height: 10,),
//                           Text(
//                             'Daily',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: 'Poppins',
//                               fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
//                             ),
//                           ),
//
//                           RichText(
//                             text: TextSpan(
//                               text: 'Total :',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontFamily: 'Poppins',
//                                 fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
//                               ),
//                               children: const <TextSpan>[
//                                 TextSpan(text: ' 83', style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                   fontFamily: 'Poppins',
//                                 )),
//                                 // TextSpan(text: ' world!'),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 50),
//                             child: CircularPercentIndicator(
//                               radius: 55.0,
//                               lineWidth: 10.0,
//                               animation: true,
//                               percent: 0.7,
//                               center: Text(
//                                 "70.0%",
//                                 style:
//                                 TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontFamily: 'Poppins',
//                                     fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
//                                 ),
//                               ),
//                               circularStrokeCap: CircularStrokeCap.round,
//                               progressColor: Colors.green,
//                               backgroundColor: Colors.grey.shade300,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10,),
//
//                   Divider(
//                       thickness: 2,
//                       color: Colors.grey.shade200,
//                   ),
//                   const SizedBox(height: 10,),
//                   Text(
//                     'Progress',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'Poppins',
//                       fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 15.sp: 15.sp,
//                     ),
//                   ),
//
//                   const SizedBox(height: 15,),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CircularProgressBar(
//                         percent: 0.2,
//                         percenttext: '5/100',
//                         title: 'LEVEL',
//                       ),
//                       CircularProgressBar(
//                         percent: 0.8,
//                         percenttext: '88%',
//                         title: 'COMPLETED',
//                       ),
//                       CircularProgressBar(
//                         percent: 0.9,
//                         percenttext: '829',
//                         title: 'HOURS',
//                       ),
//                     ],
//                   ),
//
//
//
//
//                   const SizedBox(height: 20,),
//                 ],
//               ),
//             ),
//           ),
//         ),
//     );
//   }
// }
//
//
//
//
//
