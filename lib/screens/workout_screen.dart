import 'package:flutter/material.dart';
import 'package:funfit/models/user_model.dart';
import 'package:funfit/screens/profile_screen.dart';
import 'package:funfit/screens/seetings_screen.dart';
import 'package:funfit/services/dashboard_workout.dart';
import 'package:funfit/widgets/workout_widget_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:funfit/global.dart' as globals;
import '../main.dart';
import '../services/search_program.dart';
import 'login_screen.dart';
import 'package:funfit/utils/home_url.dart' as home_url;


class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  dynamic dataFuture;
  dynamic dealFuture;
      @override
        void initState() {
        // TODO: implement initState
      super.initState();
        dataFuture = dashboad(customer_id: globals.customer_id.toString(), type: 'deals');
        dealFuture = searchProgram(search: "", filterOption: '');
    }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user.path.toString());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width.w,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Row(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                              },
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.transparent,
                                backgroundImage: NetworkImage(
                                    '${home_url.baseUrl}/${user.path}',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: PopupMenuButton(
                                  shadowColor: Colors.transparent,
                                  // color: Colors.black.withOpacity(.9),
                                  // color: Colors.white,
                                  icon: const Icon(Icons.more_vert,color: Colors.grey,size: 18,),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                        child: InkWell(
                                          onTap: () {
                                            // user.removeUser();
                                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                                            // final prefs = await SharedPreferences.getInstance();
                                            // globals.customer_id = "";
                                            // await prefs.remove('user').whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())));
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
                                          },
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.settings_rounded,
                                                  color: Theme.of(context).brightness == Brightness.dark ?  Colors.white : Colors.blue.shade900
                                                ),
                                                const SizedBox(width: 10,),
                                                Text(
                                                  'Settings',
                                                  style: TextStyle(
                                                    color: Theme.of(context).brightness == Brightness.dark ?  Colors.white : Colors.blue.shade900,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Poppins',
                                                    fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                  ]),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'TRAIN LIKE ROBERT BLAZEVIC',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 10.sp: 15.sp,
                    ),
                  ),
                  const SizedBox(
                      height: 2
                  ),
                  Text(
                    'Workout Program',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 18.sp: 15.sp,
                    ),
                  ),
                  const SizedBox(height: 25,),
                    FutureBuilder(
                        future: dataFuture,
                        builder: (BuildContext context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.none || snapshot.connectionState == ConnectionState.waiting){
                              return const Center(child: CircularProgressIndicator(),);
                          }
                          if(snapshot.hasData){
                            dynamic data =  snapshot.data;
                            print(data.toString());
                                return Container(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      if (index < data.length) {
                                        var item = data[index];
                                        print(item['deals'][0]["deals_id"],);
                                        print('sdhfklajsdhfjklasd');
                                        if (item['deals'] != null && item['deals'].isNotEmpty) {
                                          return WorkoutWidget(
                                            vendors_types_id: item['deals'][0]["vendors_types_id"],
                                            deals_id: item['deals'][0]["deals_id"],
                                            vendors_id: item['deals'][0]["vendors_id"],
                                            image: item['deals'][0]["path"],
                                            title2: item['deals'][0]["name"],
                                            created_at: item['deals'][0]["created_at"],
                                            update_at: item['deals'][0]["update_at"],
                                            start_date: item['deals'][0]["start_date"],
                                            end_date: item['deals'][0]["end_date"],
                                            start_time: item['deals'][0]["start_time"],
                                            end_time: item['deals'][0]["end_time"],
                                            description: item['deals'][0]["description"],
                                            address: item['deals'][0]["address"],
                                            featured_img: item['deals'][0]["featured_img"],
                                            facilities: item['deals'][0]["facilities"],
                                            allowed_members: item['deals'][0]["allowed_members"],
                                            is_booking: item['deals'][0]["is_booking"],
                                            title1: 'Advance Level',
                                            title3: 'Full Equipment',
                                            title4: 'Strength',
                                            title5: 'Total time: 45 minutes',
                                          );
                                        }else {
                                          // Handle the case when there are no deals
                                          return Container(); // or any other widget you want to display
                                        }
                                      }
                                      else {
                                        // Handle the case when the index is out of range
                                        return Container(); // or any other widget you want to display
                                      }
                                    }
                                    )
                              );
                          }
                          else{
                            return Center(child: Text('No Workout Program',style: TextStyle(fontSize: 16.sp,fontFamily: 'Poppins',color: Colors.grey),));
                          }
                        }


                    ),
                  // WorkoutWidget(
                  //   title1: 'Advance Level',
                  //   title2: 'Strong & Big Chest',
                  //   title3: 'Full Equipment',
                  //   title4: 'Strength',
                  //   title5: 'Total time: 45 minutes',
                  //   onPress: () { },
                  //   image: 'assets/images/w2.jpg',
                  // ),

                  // const SizedBox(height: 20,),
                  // WorkoutWidget(
                  //   title1: 'Beginner Level',
                  //   title2: 'Back Workout',
                  //   title3: 'Full Equipment',
                  //   title4: 'Strength',
                  //   title5: 'Total time: 55 minutes',
                  //   onPress: () { },
                  //   image: 'assets/images/w3.jpg',
                  // ),
                  //
                  // const SizedBox(height: 20,),
                  // WorkoutWidget(
                  //   title1: 'Advance Level',
                  //   title2: 'The Total Attack',
                  //   title3: 'Basic Equipment',
                  //   title4: 'Endurance',
                  //   title5: 'Total time: 35 minutes',
                  //   onPress: () { },
                  //   image: 'assets/images/w4.jpeg',
                  // ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




}
