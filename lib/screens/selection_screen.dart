import 'package:flutter/material.dart';
import 'package:funfit/widgets/selection_widget.dart';
import 'package:sizer/sizer.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 20.sp: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'to',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                ),
              ),
              Image(image: AssetImage('assets/images/blue.png'),
                width: MediaQuery.of(context).size.width > 800 ? 36.w : MediaQuery.of(context).size.width < 500 ? 46.w: 15.w,
              ),
              SizedBox(height: 40,),
              Text(
                'What is your fitness goal?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                ),
              ),
              const SizedBox(height: 20,),
              const SizedBox(
                height: 200,
                child: SelectionWidget(
                  image: 'assets/images/select4.png',
                  title: 'BIGGER MUSCLES',
                  description:  'FOCUS ON HEAVY LIFTS FOR MAXIMUM RESULTS',
                ),
              ),
              const SizedBox(height: 20,),
              const SizedBox(
                height: 200,
                child: SelectionWidget(
                  image: 'assets/images/select3.png',
                  title: 'BODY TONING',
                  description: 'BUILD A FLEXIBLE BODY IN YOUR TEMPO',
                ),
              ),
              const SizedBox(height: 20,),
              const SizedBox(
                height: 200,
                child: SelectionWidget(
                  image: 'assets/images/select4.png',
                  title: 'BIGGER MUSCLES',
                  description:  'FOCUS ON HEAVY LIFTS FOR MAXIMUM RESULTS',
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
