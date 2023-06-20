import 'package:flutter/material.dart';
import 'package:funfit/widgets/diet_detail.dart';
import 'package:sizer/sizer.dart';


class DietBox extends StatefulWidget {
  final image;
  final title;
  final description;
  const DietBox({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<DietBox> createState() => _DietBoxState();
}

class _DietBoxState extends State<DietBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DietDetail(image: widget.image, title: widget.title)));
        },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height > 800 ? 36.h : MediaQuery.of(context).size.height < 500 ? 46.h: 22.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  Color(0xFFffe9bf),
                  Color(0xFFffd280),
                  Color(0xFFffb020),
                ],
              ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height > 800 ? 36.h : MediaQuery.of(context).size.height < 500 ? 46.h: 22.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              // borderRadius: BorderRadius.circular(50),
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(
                  widget.image,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3),BlendMode.darken),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 15.sp: 15.sp,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15,bottom: 12),
                  child: Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
