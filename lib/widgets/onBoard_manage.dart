import 'package:flutter/material.dart';
import 'package:funfit/screens/wrapper_screen.dart';
import 'package:sizer/sizer.dart';

class OnBoardManage extends StatefulWidget {

  final image;
  final title1;
  final title2;
  final description;

  const OnBoardManage({
    Key? key,
    required this.image,
    required this.title1,
    required this.title2,
    required this.description,
  }) : super(key: key);

  @override
  State<OnBoardManage> createState() => _OnBoardManageState();
}

class _OnBoardManageState extends State<OnBoardManage> {




  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width.w,
            height: MediaQuery.of(context).size.height.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      widget.image,
                  ),
                fit: BoxFit.cover,
                // alignment: Alignment.topRight,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 80,right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                        widget.title1,
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 9.sp: 13.sp,
                      ),
                    ),
                      const SizedBox(height: 15,),
                  //Indicatore Here

                  Text(
                      widget.title2,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 35.sp: 13.sp,
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: 300,
                    child: Text(
                        widget.description,
                      style: TextStyle(
                        color: Colors.grey.shade200,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 13.sp,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        )
    );
  }
}




class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    super.key,
    this.duration = const Duration(milliseconds: 2000),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    required this.child,
  });

  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// convert 0-1 to 0-1-0
  double shake(double value) =>
      2 * (0.5 - (0.5 - widget.curve.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(widget.deltaX * shake(controller.value), 0),
        child: child,
      ),
      child: widget.child,
    );
  }
}
