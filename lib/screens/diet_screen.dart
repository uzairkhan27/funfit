import 'package:flutter/material.dart';
import 'package:funfit/screens/profile_screen.dart';
import 'package:funfit/screens/seetings_screen.dart';
import 'package:funfit/widgets/diet_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:funfit/global.dart' as globals;
import '../models/user_model.dart';
import '../widgets/custom_tab_bar.dart';
import 'login_screen.dart';
import 'package:funfit/utils/home_url.dart' as home_url;

class DietScreen extends StatefulWidget {
  const DietScreen({Key? key}) : super(key: key);

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {

  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return  SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  Row(
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
                  const SizedBox(height: 20,),
                  Text(
                    'Diet Instructions',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp: 15.sp,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 47,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
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
                        suffixIcon: Icon(
                          Icons.filter_list_outlined,
                          color: Colors.grey.shade500,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 30,),
                  CustomTabBar(
                    tabs: const [
                      'Latest',
                      'Recommendation',
                      'Favourite',
                    ],
                    selectedIndex: selectedIndex,
                    onTabSelected: onTabSelected,
                  ),
                  // Add the content for each tab based on the selected index
                  if (selectedIndex == 0) ...[
                    // Content for Tab 1
                    Container(
                      // color: Colors.grey,
              // MediaQuery.of(context).size.height > 800 ? 36.h : MediaQuery.of(context).size.height < 500 ? 46.h: 30.h
              //         height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: const Column(
                        children: [
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/fss.jpeg',
                                  title: 'Fruit Salad',
                                  description: '100Cal',
                                ),),
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/vs.jpg',
                                  title: 'Vegan Salad',
                                  description: '140Cal',
                                ),),
                            ],
                          ),
                              SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/g.jpg',
                                  title: 'Granola',
                                  description: '120Cal',
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/cb.jpeg',
                                  title: 'Chicken Breast',
                                  description: '140Cal',
                                ),),
                            ],
                          ),

                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/1.jpg',
                                  title: 'Fruit Smoothies',
                                  description: '200Cal',
                                ),),
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/c.jpg',
                                  title: 'Carrot Porridge',
                                  description: '137Cal',
                                ),),
                            ],
                          ),

                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/vs.jpg',
                                  title: 'Vegan Salad',
                                  description: '140Cal',
                                ),),
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/g.jpg',
                                  title: 'Granola',
                                  description: '120Cal',
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),
                        ],
                      ),
                    ),

                  ] else if (selectedIndex == 1) ...[
                    // Content for Tab 2
                   Container(
                     width: MediaQuery.of(context).size.width,
                     child: Column(
                       children: [
                         const SizedBox(height: 30,),
                         const Row(
                           children: [
                             Expanded(
                               flex: 3,
                               child:  DietBox(
                                 image: 'assets/images/g.jpg',
                                 title: 'Granola',
                                 description: '120Cal',
                               ),
                             ),
                             Expanded(
                               flex: 3,
                               child:  DietBox(
                                 image: 'assets/images/cb.jpeg',
                                 title: 'Chicken Breast',
                                 description: '140Cal',
                               ),),
                           ],
                         ),
                         const SizedBox(height: 20,),
                         Row(
                           children: [
                             const Expanded(
                               flex: 3,
                               child:  DietBox(
                                 image: 'assets/images/vs.jpg',
                                 title: 'Vegan Salad',
                                 description: '140Cal',
                               ),),
                             Expanded(
                               flex: 3,
                               child:  Container(),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),

                  ] else if (selectedIndex == 2) ...[
                    // Content for Tab 3
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const SizedBox(height: 30,),
                          const Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/g.jpg',
                                  title: 'Granola',
                                  description: '120Cal',
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/cb.jpeg',
                                  title: 'Chicken Breast',
                                  description: '140Cal',
                                ),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          const Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/vs.jpg',
                                  title: 'Vegan Salad',
                                  description: '140Cal',
                                ),),
                              Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/g.jpg',
                                  title: 'Granola',
                                  description: '120Cal',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              const Expanded(
                                flex: 3,
                                child:  DietBox(
                                  image: 'assets/images/vs.jpg',
                                  title: 'Vegan Salad',
                                  description: '140Cal',
                                ),),
                              Expanded(
                                flex: 3,
                                child:  Container(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ],

                ],
              ),
            ),
          ),
        ));
  }
}
