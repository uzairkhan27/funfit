import 'dart:developer';
import 'dart:io';
import 'package:funfit/utils/home_url.dart' as home_url;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:funfit/global.dart' as globals;
import 'package:sizer/sizer.dart';
import '../models/user_model.dart';
import '../services/update_profile.dart';
import '../utils/shared_preferences.dart';
import 'login_screen.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  // final String start_date;
  // final String end_date;
  // final String start_time;
  // final String end_time;
  // final String description;
  // final String address;
  final String vendor_types_id;
  final String vendors_id;
  final String deals_id;
  final String path;
  final String featured_imgs;
  // final List facilities;
  // final List allowed_members;
  // final String status;
  const EditProfileScreen({
    Key? key,
    required this.name,
    required this.email,
    // this.start_date,
    // this.end_date,
    // this.start_time,
    // this.end_time,
    // this.description,
    // this.address,
    required this.vendor_types_id,
    required this.vendors_id,
    required this.deals_id,
    required this.path,
    required this.featured_imgs,
    // required this.facilities,
    // required this.allowed_members,
    // required this.status,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  bool _isLoading = false;

  String name = "";
  String email = "";
  File? featured_img;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      nameController.text = widget.name;
      emailController.text = widget.email;

      name = widget.name;
      email = widget.email;
    });
    super.initState();
  }


  File convertToFile(XFile image) => File(image.path);
  File? _image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        featured_img = convertToFile(image);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  getUserFromSF(User user) async {
    final prefs = await SharedPreferences.getInstance();
    // print(prefs.getString("user") );
    if (prefs.getString("user") != null) {
      user.fromJson(await AppSharedPreference.readUser("user"));
      user.toJson();
      if (user != null || prefs != null) {
        return true;
      } else {
        return false;
        // }
      }
    } else {
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      getUserFromSF(user);
      // print(user.email);
    }
    return LoaderOverlay(
      child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding:  const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Transform.translate(
                              offset: Offset(-10, 0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey.shade200,
                                  child: Transform.translate(
                                    offset: const Offset(3, 0),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 12,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(width: 30,),
                          Expanded(
                            flex: 8,
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                fontSize: MediaQuery.of(context).size.width > 800
                                    ? 16.sp
                                    : MediaQuery.of(context).size.width < 500
                                    ? 17.sp
                                    : 15.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Expanded(flex: 2, child: SizedBox())
                        ],
                      ),

                    const SizedBox(height: 30,),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child:  _image == null ?  Image(
                                      image: NetworkImage(
                                        '${home_url.baseUrl}/${widget.path}',
                                      ),
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    ) :  Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green,width: 2),
                                          borderRadius: BorderRadius.circular(150),
                                          image: DecorationImage(
                                            image: FileImage(_image!),
                                          )),
                                    ),
                                  ),

                                  Positioned(
                                    right: 8,
                                    bottom: 2,
                                    child: InkWell(
                                      onTap: () async {
                                        dynamic _image = await pickImage();
                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.green,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            size: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30,),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade400,
                                        width: 1.2,
                                      )
                                    )
                                  ),
                                  child: TextFormField(
                                    validator: (val) =>
                                    val == "" ? "please update this field" : null,
                                    controller: nameController,
                                    onChanged: (val) {
                                      name = val;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Name',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        fontSize:  MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                                      )
                                    ),
                                  ),
                                ),

                              const SizedBox(height: 30,),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey.shade400,
                                          width: 1.2,
                                        )
                                    )
                                ),
                                child: TextFormField(
                                  validator: (val) =>
                                  val == "" ? "please update this field" : null,
                                  controller: emailController,
                                  onChanged: (val) {
                                    email = val;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        fontSize:  MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 12.sp: 15.sp,
                                      )
                                  ),
                                ),
                              ),

                              Container(
                                height: MediaQuery.of(context).size.height > 800 ? 16.h : MediaQuery.of(context).size.height < 500 ? 50.h: 36.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (_formKey.currentState!.validate()){
                                            _isLoading = true;
                                            context.loaderOverlay.show();
                                            dynamic jsonResponse = await updateProfile(
                                              user_id: user.id.toString(),
                                              name: name,
                                              // start_date: startDate,
                                              // end_date: endDate,
                                              // start_time: startTime,
                                              // end_time: endTime,
                                              // description: description,
                                              // address: address,
                                              img: featured_img,
                                              // deals_id: widget.deals_id,
                                              featured_img_old: widget.featured_imgs.toString(),
                                              email: email,
                                              deals_id: widget.deals_id,
                                              // deals_id: '',
                                              // allowed_members: memberList,
                                              // facilites: facilityList,
                                            ).whenComplete(() => _isLoading = false);

                                            if (!_isLoading) {
                                              context.loaderOverlay.hide();
                                              log(name);
                                              log(email);
                                              log(featured_img.toString());
                                            }

                                            if (jsonResponse["success"] == 1) {

                                              print('success');
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //         const SuccesfulPopup()));
                                            } else {}
                                          }
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(bottom: 0),
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(25)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            child: Text(
                                              'Update',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins',
                                                fontSize:  MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 14.sp: 15.sp,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        )

                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}
