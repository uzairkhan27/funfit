import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PerformanceList extends StatelessWidget {
  final image;
  final title;
  final t1;
  final t2;
  final t3;
  const PerformanceList({
    Key? key,
    required this.image,
    required this.title,
    required this.t1,
    required this.t2,
    required this.t3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage(
                    this.image,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).brightness == Brightness.dark ?  Colors.grey.shade800 : Colors.grey.shade200,
                      blurRadius: 18,
                      offset: const Offset(0.4, 0.7)
                  )
                ]
            ),
          ),
          const VerticalDivider(
            width: 40,
            color: Colors.green,
            indent: 14,
            thickness: 2.0,
            endIndent: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                this.title,
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.white: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.t1,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                    ),
                  ),
                  const SizedBox(width: 6,),
                  Icon(
                    Icons.circle_rounded,
                    color: Colors.grey.shade400,
                    size: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 5.sp: 15.sp,
                  ),
                  const SizedBox(width: 6,),
                  Text(
                    this.t2,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                    ),
                  ),
                  const SizedBox(width: 6,),
                  Icon(
                    Icons.circle_rounded,
                    color: Colors.grey.shade400,
                    size: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 5.sp: 15.sp,
                  ),
                  const SizedBox(width: 6,),
                  Text(
                    this.t3,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
