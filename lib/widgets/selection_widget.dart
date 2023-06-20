import 'package:flutter/material.dart';
import 'package:funfit/screens/login_screen.dart';
import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:sizer/sizer.dart';

class SelectionWidget extends StatefulWidget {
  final image;
  final title;
  final description;
  const SelectionWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(PageAnimationTransition(page: const LoginScreen(), pageAnimationType: ScaleAnimationTransition()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Container(
          clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                // border: Border.all(color: Colors.green, width: 2.0),
            ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage(
                  widget.image,
                ),
                fit: BoxFit.cover,
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
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 20.sp: 15.sp,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15,bottom: 20),
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
