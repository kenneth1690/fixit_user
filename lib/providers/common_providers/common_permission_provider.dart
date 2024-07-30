
import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:permission_handler/permission_handler.dart';

class CommonPermissionProvider extends ChangeNotifier {
  //location permission
  Future<bool> checkIfLocationEnabled() async {
    log("CHECKKK");
    if (await Permission.location.request().isGranted) {
      return true;
    } else if (await Permission.locationAlways.request().isGranted) {
      return true;
    } else if (await Permission.locationWhenInUse.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }

}
