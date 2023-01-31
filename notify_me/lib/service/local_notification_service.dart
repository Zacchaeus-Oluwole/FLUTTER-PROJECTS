import "package:flutter_local_notifications/flutter_local_notifications.dart";
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


class LocalNotificationService{

  LocalNotificationService();
  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings = 
      AndroidInitializationSettings('@drawable/ic_stat_notification_important.png');
      
    // IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings(
    //     requestAlertPermission: true,
    //     requestBadgePermission: true,
    //     requestSoundPermission: true,
    //     onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    //   );

      // ignore: prefer_const_constructors
      final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings,
        // iOS: iosInitializationSettings
      );
      await _localNotificationService.initialize(
        settings,
      );
      
    }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails("channelId", "channelName",
      channelDescription: "description",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true
    );
    // const IOSNotificationDetails iosNotificationDetails = IOSNotificationdetails();

    return const NotificationDetails(
      android: androidNotificationDetails,
    );

  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);
  
  }


  void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload
  ){
    print("id $id");
  }

  void onSelectNotification(String? payload){
    print('payload $payload');
  }
}