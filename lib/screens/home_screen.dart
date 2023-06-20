// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: AssetImage('assets/images/select3.png'),
//                     ),
//                   ],
//                 ),
//
//                 Row(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey.shade300,
//                         ),
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       child: const Padding(
//                         padding: EdgeInsets.all(4.0),
//                         child: Icon(
//                           Icons.search_sharp,
//                           size: 24,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10,),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey.shade300,
//                         ),
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       child: const Padding(
//                         padding: EdgeInsets.all(4.0),
//                         child: Icon(
//                           Icons.bookmark_border_rounded,
//                           size: 24,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Text(
//             'TRAIN LIKE ROBERT BLAZEVIC',
//             style: TextStyle(
//               color: Colors.green,
//               fontWeight: FontWeight.w500,
//               fontFamily: 'Poppins',
//               fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
//             ),
//           ),
//           const SizedBox(
//             height: 2
//           ),
//           Text(
//             'Workout Program',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w600,
//               fontFamily: 'Poppins',
//               fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 18.sp: 15.sp,
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
