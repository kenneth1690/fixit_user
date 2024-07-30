import 'dart:developer';

import '../../config.dart';

class ServiceReviewProvider with ChangeNotifier {
  int? exValue = appArray.reviewLowHighList[0]["id"];
  Services? services;
  List<Reviews> reviewList = [];

  onReview(val) {
    exValue = val;

    notifyListeners();
    getReviewByServiceId(services!.id);
  }

  onReady(context) async {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    log("DATA : $data");
    services = data;
    getReviewByServiceId(services!.id);
    notifyListeners();
  }

  getReviewByServiceId(serviceId) async {
    reviewList = [];
    try {
      await apiServices
          .getApi(
              "${api.review}?serviceId=$serviceId&field=rating&sort=${exValue == 0 ? "asc" : "desc"}",
              [],
              isToken: true)
          .then((value) {
        if (value.isSuccess!) {
          for (var data in value.data) {
            if (!reviewList.contains(Reviews.fromJson(data))) {
              reviewList.add(Reviews.fromJson(data));
            }
            notifyListeners();
          }
          notifyListeners();
        }
      });
    } catch (e) {
      log("ERRROEEE getServiceById : $e");
      notifyListeners();
    }
  }
}
