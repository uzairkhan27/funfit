import 'package:flutter/material.dart';
import 'package:funfit/widgets/related_programs_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:funfit/utils/home_url.dart' as home_url;

class WorkoutDetail extends StatefulWidget {
  final int? my_vendors_type_id;
  final int? my_deals_id;
  final int? my_vendors_id;
  final String? my_start_date;
  final String? my_end_date;
  final String? my_start_time;
  final String? my_end_time;
  final String? my_description;
  final String? my_address;
  final String my_featured_img;
  final List? my_allowed_members;
  final List? my_facilities;
  final String? is_booking;
  final String customer_id;
  final image;
  final title;

  const WorkoutDetail({
    Key? key,
    required this.image,
    required this.title,
    required this.my_vendors_type_id,
    required this.my_deals_id,
    required this.my_vendors_id,
    required this.my_start_date,
    required this.my_end_date,
    required this.my_start_time,
    required this.my_end_time,
    required this.my_description,
    required this.my_address,
    required this.my_featured_img,
    required this.my_allowed_members,
    required this.my_facilities,
    required this.is_booking,
    required this.customer_id,

  }) : super(key: key);

  @override
  State<WorkoutDetail> createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  // margin: const EdgeInsets.only(bottom: 30),
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width > 800 ? 16.h : MediaQuery.of(context).size.width < 500 ? 40.h: 15.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${home_url.baseUrl}/${widget.image}'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.multiply),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.black.withOpacity(.5),
                                  child: IconButton(
                                    icon: Icon(
                                        Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: MediaQuery.of(context).size.height > 800 ? 20.h : MediaQuery.of(context).size.height < 500 ? 20.h: 28.h,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                // margin: const EdgeInsets.symmetric(horizontal: 15),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          offset: const Offset(0, 1),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 20,
                                      )
                                    ],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          widget.title.toString().toUpperCase(),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp: 15.sp,
                                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          wordSpacing: 4.0,
                                        ),
                                      ),
                                      Text(
                                        'Advance Level',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                                            color: Colors.green,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                        const SizedBox(height: 20,),
                                      Text(
                                        'Nutrition',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp: 15.sp,
                                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          wordSpacing: 4.0,
                                        ),
                                      ),
                                          const SizedBox(height: 16,),

                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [

                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: Colors.grey.shade100,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Transform.translate(
                                                      offset: const Offset(-5, 0),
                                                      child: const Icon(
                                                        Icons.local_fire_department_outlined,
                                                        color: Colors.red,
                                                        size: 22,
                                                      ),
                                                    ),
                                                    // const SizedBox(width: 5,),
                                                    Text(
                                                        '180k Cal',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                                    ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                              const SizedBox(width: 12,),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: Colors.grey.shade100,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Transform.translate(
                                                      offset: Offset(-5, 0),
                                                      child: const Icon(
                                                        Icons.egg_alt,
                                                        color: Colors.yellow,
                                                        size: 22,
                                                      ),
                                                    ),
                                                    // const SizedBox(width: 5,),
                                                    Text(
                                                      '30g Fat',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12,),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: Colors.grey.shade100,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Transform.translate(
                                                      offset: Offset(-5, 0),
                                                      child: const Icon(
                                                        Icons.local_drink_outlined,
                                                        color: Colors.deepOrangeAccent,
                                                        size: 20,
                                                      ),
                                                    ),
                                                    // const SizedBox(width: 5,),
                                                    Text(
                                                      '20g Proteins',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12,),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color: Colors.grey.shade100,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Transform.translate(
                                                      offset: Offset(-5, 0),
                                                      child: const Icon(
                                                        Icons.local_fire_department_outlined,
                                                        color: Colors.red,
                                                        size: 22,
                                                      ),
                                                    ),
                                                    // const SizedBox(width: 5,),
                                                    Text(
                                                      '180k Cal',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 15,),

                                      Text(
                                        'Description',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          wordSpacing: 4.0,
                                        ),
                                      ),
                                       const SizedBox(height: 10,),
                                       Text(
                                          'Want your body to be healthy. Join our program with directions according to body’s goals.'
                                           ' Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week. ',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize:  MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      const SizedBox(height: 25,),
                                      Text(
                                        'Related Programs',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 13.sp: 15.sp,
                                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          wordSpacing: 4.0,
                                        ),
                                      ),

                                      const SizedBox(height: 20,),
                                      const RelatedProgram(
                                        image: 'assets/images/w2.jpg',
                                        title1: 'Advance Level',
                                        title2: 'Strong & Big Chest',
                                        title3: 'Total time: \n 45 minutes',
                                      ),

                                      const SizedBox(height: 20,),
                                      const RelatedProgram(
                                        image: 'assets/images/w3.jpg',
                                        title1: 'Beginner Level',
                                        title2: 'Back Workout',
                                        title3: 'Total time: \n 55 minutes',
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
