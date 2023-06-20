import 'package:flutter/material.dart';
import 'package:funfit/screens/workout_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:funfit/utils/home_url.dart' as home_url;

import '../global.dart';

class WorkoutWidget extends StatefulWidget {
  final int? vendors_types_id;
  final int? deals_id;
  final int? vendors_id;
  final image;
  final String? start_date;
  final String? end_date;
  final String? start_time;
  final String? end_time;
  final String? description;
  final String? address;
  final String? created_at;
  final String? update_at;
  final int? featured_img;
  // final List? deals;
  final List? facilities;
  final List? allowed_members;
  final String? is_booking;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String title5;
  // final GestureTapCallback? onPress;
  const WorkoutWidget({
    Key? key,
    required this.image,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.title5,
    required this.vendors_types_id,
    required this.deals_id,
    required this.vendors_id,
    required this.created_at,
    required this.update_at,
    required this.start_date,
    required this.end_date,
    required this.start_time,
    required this.end_time,
    required this.description,
    required this.address,
    required this.allowed_members,
    required this.facilities,
    required this.featured_img,
    required this.is_booking,
    // required this.onPress,
  }) : super(key: key);

  @override
  State<WorkoutWidget> createState() => _WorkoutWidgetState();
}

class _WorkoutWidgetState extends State<WorkoutWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      child: PhysicalModel(
        color: Colors.grey,
        elevation: 5.0,
        shadowColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade900 : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height > 800 ? 20.h : MediaQuery.of(context).size.height < 500 ? 20.h: 30.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('${home_url.baseUrl}/${widget.image}'),
                fit: BoxFit.cover,
                colorFilter: Theme.of(context).brightness == Brightness.dark ? ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.multiply)
                    : ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.multiply),
              ),
              borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title1,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                          color: Colors.green,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      widget.title2.toUpperCase(),
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp: 15.sp,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title3,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      widget.title4,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title5,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 11.sp: 15.sp,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600
                          ),
                          textAlign: TextAlign.start,
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutDetail(
                                image: widget.image,
                                title: widget.title2,
                                my_vendors_type_id: widget.vendors_types_id,
                                my_deals_id: widget.deals_id,
                                my_vendors_id: widget.vendors_id,
                                my_start_date:widget.start_date,
                                my_end_date:widget.end_date,
                                my_start_time:widget.start_time,
                                my_end_time:widget.end_time,
                                my_description:widget.description,
                                my_address:widget.address,
                                my_featured_img:widget.featured_img.toString(),
                                my_allowed_members:widget.allowed_members,
                                my_facilities:widget.facilities,
                                is_booking:widget.is_booking,
                                customer_id: customer_id,
                            )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                              child: Text(
                                'Try',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
