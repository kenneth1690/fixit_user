import 'package:fixit_user/config.dart';
import 'package:fixit_user/models/package_booking_model.dart';

class PackageBookingProvider with ChangeNotifier {

  List<PackageBookingModel> packageBookingLists = [];

  onReady(context){
    packageBookingLists = [];
    notifyListeners();
    appArray.packageBookingList.asMap().entries.forEach((element) {
      if(!packageBookingLists.contains(PackageBookingModel.fromJson(element.value))) {
        packageBookingLists.add(PackageBookingModel.fromJson(element.value));
      }
    });
    notifyListeners();
  }

}