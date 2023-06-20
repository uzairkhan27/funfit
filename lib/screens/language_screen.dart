import 'package:flutter/material.dart';
import 'package:funfit/classes/language.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_localization.dart';
import '../main.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  String selected = "";
  List<Map<String, dynamic>> checkListItems =[
    {
      "id": 0,
      "value": false,
      "title": "English",
    },
    {
      "id": 1,
      "value": false,
      "title": "Arabic",
    },
    {
      "id": 2,
      "value": false,
      "title": "Persian",
    },
  ];

  final Map<String, Widget> widgetMapping = {
    // 'appBarTitle': heading(),
    // Add more key-value pairs as needed
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text(
          //     // AppLocalizations.of(context)!.hello('App Bar'),
          //     // AppLocalizations.of(context)!.hello('dhfkad'),
          //   ''
          //   ),
          //   actions: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: DropdownButton<Language>(
          //         underline: const SizedBox(),
          //         icon: const Icon(
          //           Icons.language,
          //           color: Colors.black,
          //         ),
          //         onChanged: (Language? language) async {
          //           if (language != null) {
          //             MyApp.setLocale(context, Locale(language.languageCode, ''));
          //           }
          //         },
          //         items: Language.languageList()
          //             .map<DropdownMenuItem<Language>>(
          //               (e) => DropdownMenuItem<Language>(
          //             value: e,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceAround,
          //               children: <Widget>[
          //                 // Text(
          //                 //   e.flag,
          //                 //   style: const TextStyle(fontSize: 30),
          //                 // ),
          //                 Text(e.name)
          //               ],
          //             ),
          //           ),
          //         )
          //             .toList(),
          //       ),
          //     ),
          //   ],
          // ),
          body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.transparent : Colors.grey.shade200,
                          child: Transform.translate(
                            offset: const Offset(3, 0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade200 :  Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 30,),
                    Expanded(
                      flex: 8,
                      child: Text(
                        homePageMessage('John', locale: Localizations.localeOf(context).languageCode),
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: MediaQuery.of(context).size.width > 800 ? 16.sp : MediaQuery.of(context).size.width < 500 ? 17.sp : 15.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Expanded(
                        flex: 2,
                        child: SizedBox(

                        ))
                  ],
                ),

                const SizedBox(height: 30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    onChanged: (val){
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
                    ),
                  ),
                ),

                const SizedBox(height: 30,),
                Column(
                  children: List.generate(
                    checkListItems.length,
                        (index) => CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.platform,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(
                        checkListItems[index]["title"],
                        style:  TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                        ),
                      ),
                      value: checkListItems[index]["value"],
                          onChanged: (value) {
                            setState(() {
                              for (var element in checkListItems) {
                                element["value"] = false;
                              }
                              checkListItems[index]["value"] = value;

                              // if (index == 0) {
                              //   var local = const Locale('en','US');
                              //   Get.updateLocale(local);
                              //   print(local);
                              // } else if (index == 1) {
                              //   var local = const Locale('ar','SA');
                              //   Get.updateLocale(local);
                              //   print(local);
                              // } else {
                              //   var local = const Locale('fr','CA');
                              //   Get.updateLocale(local);
                              //   print(local);
                              // }

                              selected = "${checkListItems[index]["id"]}, ${checkListItems[index]["title"]}, ${checkListItems[index]["value"]}";
                            });
                          },
                        ),

                  ),

                ),
              ],
            ),
          ),
        ));
  }
  Widget heading(){
    return const Text('data');
  }


}
