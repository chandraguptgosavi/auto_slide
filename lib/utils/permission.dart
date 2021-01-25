import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class StoragePermission{
  static Future<void> checkPermission() async {
    var status = await Permission.storage.status;
    if(status != PermissionStatus.granted){
      await Permission.storage.request();
      status = await Permission.storage.status;
      if(status != PermissionStatus.granted){
        SystemNavigator.pop();
      }
    }
  }
}