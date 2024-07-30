import 'dart:developer';

import '../../config.dart';

class LatestBLogDetailsProvider with ChangeNotifier {
  dynamic data;
  double widget1Opacity = 0.0;

  onReady(context) {

    data = ModalRoute.of(context)!.settings.arguments;
    Future.delayed(const Duration(milliseconds: 500), () {
      widget1Opacity = 1;
      notifyListeners();
    });
    notifyListeners();
  }

  onBack(context,isBack){
    data = null;
    notifyListeners();
    if(isBack){
      route.pop(context);
    }
  }
}
