

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:funfit/notification_services.dart';
import 'package:funfit/screens/splash_screen.dart';
import 'package:funfit/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'app_localization.dart';
import 'models/deal_model.dart';
import 'models/user_model.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
      const MyApp());
}

@pragma('vm;entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

}

class _MyAppState extends State<MyApp> {

  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }



  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    // notificationServices.firebaseInit();
    notificationServices.getDeviceToken().then((value) {
        print('device token');
        print(value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        // final themeChanger  = Provider.of<ThemeProvider>(context);
         return  MultiProvider(
           providers: [
             ChangeNotifierProvider(create: (context) => User()),
             ChangeNotifierProvider(create: (context) => Deal()),
             ChangeNotifierProvider(create: (context) => ThemeProvider()),
           ],
           child: Builder(
             builder: (BuildContext context){
               final themeChanger  = Provider.of<ThemeProvider>(context);
               return  MaterialApp(
                 localizationsDelegates: AppLocalizations.localizationsDelegates,
                 supportedLocales: AppLocalizations.supportedLocales,
                 locale: _locale,
                 debugShowCheckedModeBanner: false,
                 title: 'Flutter Demo',
                 theme: ThemeData(
                   brightness: Brightness.light,
                 ),
                 darkTheme: ThemeData(
                   brightness: Brightness.dark,
                 ),
                 themeMode: themeChanger.themeMode,
                 home: const SplashScreen(),
               );
             },
           ),
         );
      },
    );
  }
}



