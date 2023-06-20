import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class ProgressBox extends StatelessWidget {
  final icon;
  final title;
  final desc;
  const ProgressBox({
    Key? key,
    required this.icon,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: PhysicalModel(
        color: Colors.white12.withOpacity(.7),
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Icon(
                  this.icon,
                  color: Colors.green,
                ),
                const SizedBox(height: 4,),
                Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                  ),
                ),
                const SizedBox(height: 4,),
                Text(
                  this.desc,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}