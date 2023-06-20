import 'package:flutter/material.dart';
import 'package:funfit/screens/dashboard_screen.dart';
import 'package:funfit/screens/workout_screen.dart';
import 'package:sizer/sizer.dart';
import '../screens/workout_detail_screen.dart';

class RelatedProgram extends StatefulWidget {
  final image;
  final title1;
  final title2;
  final title3;
  const RelatedProgram({
    Key? key,
    required this.image,
    required this.title1,
    required this.title2,
    required this.title3,
  }) : super(key: key);

  @override
  State<RelatedProgram> createState() => _RelatedProgramState();
}

class _RelatedProgramState extends State<RelatedProgram> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.dark ?  Colors.grey.shade700 :  Colors.grey.shade200,
              blurRadius: 15,
              offset: const Offset(0.3, 3),
            )
          ]
      ),
      child: Row(
        children: [
           ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image(
              image: AssetImage(
                widget.image,
              ),
              fit: BoxFit.cover,
              width: 100,
              // height: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title1,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                      color: Colors.green,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  widget.title2,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.start,
                ),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title3,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 9.sp: 15.sp,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(width: 70,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                          child: Text(
                            'Try',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
