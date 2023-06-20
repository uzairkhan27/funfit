import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DietDetail extends StatefulWidget {
  final image;
  final title;
  const DietDetail({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  State<DietDetail> createState() => _DietDetailState();
}

class _DietDetailState extends State<DietDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 35),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height > 800 ? 36.h : MediaQuery.of(context).size.height < 500 ? 46.h: 36.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              widget.image,
                          ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3),BlendMode.darken),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,top: 10),
                              child: Container(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                                ),
                              ),
                            ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60,left: 20),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 22.sp: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 185,left: 20,right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height > 800 ? 36.h : MediaQuery.of(context).size.height < 500 ? 44.h: 14.h,
                    decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '71.5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                                ),
                              ),
                              Text(
                                'Calories',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Poppins',
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '0.4g',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                                ),
                              ),
                              Text(
                                'Carbs',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '6.3g',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                                ),
                              ),
                              Text(
                                'Protein',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Poppins',
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.8g',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 16.sp: 15.sp,
                                ),
                              ),
                              Text(
                                'Fat',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Poppins',
                                  fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 300),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                  child: Text(
                                      'Protein',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(
                                  'Serving',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                      const SizedBox(height: 6,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(14)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 13),
                                  child: Text(
                                      '1.0',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 15.sp: 15.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                              // const SizedBox(width: 20,),
                            Expanded(
                              flex: 6,
                              child: Container(
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(14)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 13),
                                  child: Text(
                                    'Small(38,0g)',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 15.sp: 15.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Nutrion Facts',
                            style: TextStyle(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 18.sp: 15.sp,
                            ),
                          ),
                        ),
                        const NutronRow(
                          text1: 'Total Fat',
                          text2: '4.76g',
                        ),
                        const NutronRow(
                          text1: 'Cholesterol',
                          text2: '186.0 mg',
                        ),
                        const NutronRow(
                          text1: 'Sodium',
                          text2: '71.0 mg',
                        ),
                        const NutronRow(
                          text1: 'Potassium',
                          text2: '69.0 mg',
                        ),
                        const NutronRow(
                          text1: 'Total Carbohydrates',
                          text2: '0.36 g',
                        ),
                        const NutronRow(
                          text1: 'Vit A',
                          text2: '0.8 mg',
                        ),
                        const NutronRow(
                          text1: 'Vit C',
                          text2: '0.0 mg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70,),
            ],
          ),
        ),
      ),
    );
  }
}

class NutronRow extends StatelessWidget {
  final text1;
  final text2;
  const NutronRow({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.text1,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
            ),
          ),
          Text(
            this.text2,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}

