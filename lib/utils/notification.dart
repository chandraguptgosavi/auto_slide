import 'package:auto_slide/constants/strings.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DownloadNotification{
  static Future<void> show() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      AutoSlideString.download_channel_id,
      AutoSlideString.download_channel_name,
      AutoSlideString.download_channel_description,
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      AutoSlideString.app_name,
      AutoSlideString.download_successful,
      platformChannelSpecifics,
    );
  }
}