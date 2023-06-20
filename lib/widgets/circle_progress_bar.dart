import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class CircularProgressBar extends StatelessWidget {
  final percent;
  final percenttext;
  final title;
  const CircularProgressBar({
    Key? key,
    required this.percent,
    required this.percenttext,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      reverse: false,
      radius: 40.0,
      lineWidth: 8.0,
      animation: true,
      percent: this.percent,
      center: Text(
        this.percenttext,
        style:
        TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          this.title,
          style:
          TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
          ),
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.green,
      backgroundColor: Colors.grey.shade300,
    );
  }
}
