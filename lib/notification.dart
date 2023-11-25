
//find documentation @ https://pub.dev/packages/flutter_local_notifications



import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotification {
  static Future initialize (FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = const AndroidInitializationSettings('delivered');
    DarwinInitializationSettings initializationSettingsDarwin = 
    const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: androidInitialize, iOS: initializationSettingsDarwin 
    );
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showActionButtonsNotification(
    {
      var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    }
  )


  async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      "any_value",
     "channel_name",
     playSound: true,
     importance: Importance.max,
     priority: Priority.high,
     actions: <AndroidNotificationAction>[
                                        //action button 1
                                        AndroidNotificationAction(
                                          "1",
                                                      'Allow',//button
                                          titleColor: Colors.green,
                                          icon: DrawableResourceAndroidBitmap('delivered'),
                                          contextual: true,
                                          showsUserInterface: true,
                                          cancelNotification: true,
                                        ),
                                        //action button 2
                                        AndroidNotificationAction(
                                        "2",
                                                      'Dont Allow!',
                                          titleColor: Colors.red,
                                          icon: DrawableResourceAndroidBitmap('delivered'),
                                          contextual: true,
                                          cancelNotification: true,
                                          showsUserInterface: false,
                                        ),
                                      ]);
      //ios initialization:
     const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentSound: false,
     );
     
     var not = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
     );

     await flutterLocalNotificationsPlugin.show(0, title, body, not);
  }
}

