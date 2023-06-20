import 'package:flutter/material.dart';
import 'package:funfit/screens/profile_screen.dart';
import 'package:funfit/screens/seetings_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:funfit/global.dart' as globals;
import '../models/user_model.dart';
import '../services/search_program.dart';
import '../widgets/workout_widget_screen.dart';
import 'login_screen.dart';
import 'package:funfit/utils/home_url.dart' as home_url;

class SearchProgram extends StatefulWidget {
  const SearchProgram({Key? key}) : super(key: key);

  @override
  State<SearchProgram> createState() => _SearchProgramState();
}

class _SearchProgramState extends State<SearchProgram> {

  String search = "";
  String sort = "Ascending";
  dynamic dealFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dealFuture = searchProgram(search: search, filterOption: sort);
  }


  Future<void> _showFilterOptions() async {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset topLeft = button.localToGlobal(Offset.zero);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        topLeft.translate(button.size.width, 0),
        topLeft.translate(button.size.width + 200, button.size.height),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      color: Colors.white,
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          value: "Ascending",
          child: Text(
            'Ascending Order',
            style: TextStyle(
              color: Colors.black87,
              fontSize: MediaQuery.of(context).size.width > 800 ? 14.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 13.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        PopupMenuItem(
          value: "Descending",
          child: Text(
            'Descending Order',
            style: TextStyle(
              color: Colors.black87,
              fontSize: MediaQuery.of(context).size.width > 800 ? 14.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 13.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        PopupMenuItem(
          value: "PopularPicks",
          child: Text(
            'Popular Picks',
            style: TextStyle(
              color: Colors.black87,
              fontSize: MediaQuery.of(context).size.width > 800 ? 14.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 13.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
      elevation: 8,
    ).then((value) {
      if (value != null) {
        setState(() {
          dealFuture = searchProgram(search: search, filterOption: value);
          sort = value;
        });
        print(value);
        print('sdnfkasdjfhsdjk');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return SafeArea(
      child: Scaffold(
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
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
                                  color: Colors.white,
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
                                                 Icon(Icons.settings_rounded,color: Colors.blue.shade900,),
                                                const SizedBox(width: 10,),
                                                Text(
                                                  'Settings',
                                                  style: TextStyle(
                                                    color: Colors.blue.shade900,
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
                      color:Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 18.sp: 15.sp,
                    ),
                  ),
                  const SizedBox(height: 10,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 47,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      onChanged: (val){
                        setState(() {
                          dealFuture = [];
                          search = val;
                          dealFuture = searchProgram(search: val, filterOption: sort);
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: Colors.grey.shade500,
                          size: 22,
                        ),
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            height: 1.5
                        ),
                        suffixIcon: GestureDetector(
                          onTap: ()  {
                            _showFilterOptions();
                          },
                          child: Icon(
                            Icons.filter_list_outlined,
                            color: Colors.grey.shade500,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  FutureBuilder(
                      future: dealFuture,
                      builder: (BuildContext context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.none || snapshot.connectionState == ConnectionState.waiting){
                          return const Center(child: CircularProgressIndicator(),);
                        }
                        if(snapshot.hasData){
                          dynamic data =  snapshot.data;
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              // scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) =>
                                  WorkoutWidget(
                                    vendors_types_id: data[index]["vendor_types_id"],
                                    deals_id: data[index]["deals_id"],
                                    title2: data[index]["name"],
                                    created_at: data[index]["created_at"],
                                    update_at: data[index]["update_at"],
                                    vendors_id: data[index]["vendors_id"],
                                    start_date: data[index]["start_date"],
                                    end_date: data[index]["end_date"],
                                    start_time: data[index]["start_time"],
                                    end_time: data[index]["end_time"],
                                    description: data[index]["description"],
                                    address: data[index]["address"],
                                    featured_img: data[index]["featured_img"],
                                    facilities: data[index]["facilities"],
                                    allowed_members: data[index]["allowed_members"],
                                    image: data[index]["path"],
                                    is_booking: data[index]["is_booking"],
                                    title1: 'Advance Level',
                                    title3: 'Full Equipment',
                                    title4: 'Strength',
                                    title5: 'Total time: 45 minutes',
                                  ),
                            ),
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
