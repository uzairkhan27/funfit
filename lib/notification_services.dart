import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    void requestNotificationPermission() async {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );

      if(settings.authorizationStatus == AuthorizationStatus.authorized){
        print('user granted permission');
      }
      else if(settings.authorizationStatus == AuthorizationStatus.provisional){
        print('user granted provisional permission');
      }
      else{
        print('user denied permission');
      }
    }

    // void initLocalNotification(BuildContext context, RemoteMessage message) async {
    //   // var  androidInitializationSettings = AndroidInitializationSettings('@drawable_launcher');
    //   var  androidInitializationSettings = const AndroidInitializationSettings('@ic_launcher');
    //   var  iosInitializationSettings = const DarwinInitializationSettings();
    //
    //   var initializationSetting = InitializationSettings(
    //       android:  androidInitializationSettings,
    //       iOS: iosInitializationSettings
    //   );
    //
    //   await _flutterLocalNotificationsPlugin.initialize(
    //       initializationSetting,
    //     onDidReceiveNotificationResponse: (payload){
    //
    //     }
    //   );
    //
    // }
    //
    //   void firebaseInit(){
    //   FirebaseMessaging.onMessage.listen((message) {
    //     showNotification(message);
    //   });
    //   }
    //
    //   Future<void> showNotification(RemoteMessage message) async {
    //
    //   AndroidNotificationChannel channel = AndroidNotificationChannel(
    //       Random.secure().nextInt(10000).toString(),
    //       'High Importance Notifications',
    //       importance: Importance.max,
    //   );
    //
    //   AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
    //     channel.id.toString(),
    //     channel.name.toString(),
    //     channelDescription: 'Your Channel Description',
    //     importance: Importance.high,
    //     priority: Priority.high,
    //     ticker: 'ticker'
    //   );
    //
    //   DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
    //     presentAlert: true,
    //     presentBadge: true,
    //     presentSound: true
    //   );
    //
    //   NotificationDetails notificationDetails = NotificationDetails(
    //     android: androidNotificationDetails,
    //     iOS: darwinNotificationDetails,
    //   );
    //
    //   Future.delayed(
    //     Duration.zero, (){
    //     _flutterLocalNotificationsPlugin.show(
    //         0,
    //         message.notification!.title.toString(),
    //         message.notification!.body.toString(),
    //         notificationDetails);
    //   });
    //
    //   }


    Future<String> getDeviceToken() async {
     String? token = await messaging.getToken();
      return token!;
    }

}