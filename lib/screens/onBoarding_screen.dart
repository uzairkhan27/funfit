import 'package:flutter/material.dart';
import 'package:funfit/global.dart' as globals;
import 'package:funfit/screens/login_screen.dart';
import 'package:funfit/screens/wrapper_screen.dart';
import 'package:funfit/widgets/onBoarding_content_list_widget.dart';
import 'package:sizer/sizer.dart';

import '../widgets/onBoard_manage.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                itemCount: onBoard_content.length,
                  onPageChanged: (index){
                    setState(() {
                      globals.pageIndex = index;
                    });
                  },
                itemBuilder: (context, index) =>
                    OnBoardManage(
                      image: onBoard_content[index].image,
                      title1: onBoard_content[index].title1,
                      title2: onBoard_content[index].title2,
                      description:onBoard_content[index].description,
                    ),
              ),

              Positioned(
                bottom: 20,
                left: 20,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShakeWidget(
                      child: InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 26,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 20.sp: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          'SKIP',
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 13.sp,
                          ),
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
