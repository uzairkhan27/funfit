// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:sizer/sizer.dart';
// import '../services/user_progress.dart';
// import 'package:funfit/global.dart' as globals;
//
// class CircularProgressBar extends StatefulWidget {
//   final double? percentage;
//   final String? percentageTxt;
//   const CircularProgressBar({
//     Key? key,
//     required this.percentage,
//     required this.percentageTxt,
//   }) : super(key: key);
//
//   @override
//   State<CircularProgressBar> createState() => _CircularProgressBarState();
// }
//
// class _CircularProgressBarState extends State<CircularProgressBar> {
//
//   dynamic _userPackages;
//   @override
//   void initState() {
//     _userPackages =  usePackage(
//       customers_id: globals.customer_id,
//       // percentage_on_point: null,
//       // percentage: '',
//     );
//     print(globals.customer_id);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 0),
//           child: CircularPercentIndicator(
//           radius: 55.0,
//           lineWidth: 10.0,
//           animation: true,
//           percent: double.parse(widget.percentage.toString()),
//           center: Text(
//           widget.percentageTxt.toString(),
//           style:
//           TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//           fontFamily: 'Poppins',
//           fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
//     ),
//     ),
//     circularStrokeCap: CircularStrokeCap.round,
//     progressColor: Colors.white,
//     backgroundColor: Colors.black26,
//     backgroundWidth: 3,
//     ),
//           ),
//       ],
//     );
//   }
// }