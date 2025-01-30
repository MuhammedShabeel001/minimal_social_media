import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.camera,
    ].request();

    return statuses[Permission.storage]?.isGranted == true &&
           statuses[Permission.camera]?.isGranted == true;
  }
}
