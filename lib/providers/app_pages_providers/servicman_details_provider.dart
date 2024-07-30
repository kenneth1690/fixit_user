
import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/common_tap.dart';
import 'package:fixit_user/config.dart';
import 'package:fixit_user/models/selected_service_cart.dart';

class ServicemanDetailProvider with ChangeNotifier {

  int providerId = 0;
  ProviderModel? provider;

  onReady(context) async {
    showLoading(context);
    dynamic data = ModalRoute
        .of(context)!
        .settings
        .arguments;
    notifyListeners();
    log("idid : $data");
    getServicemanById(context, data);

  }


  getServicemanById(context, id) async {
    try {
      await apiServices
          .getApi("${api.serviceman}?id=$id", [])
          .then((value) {
        if (value.isSuccess!) {
          log("value.data[0]: ${value.data}");
          provider = ProviderModel.fromJson(value.data[0]);
          notifyListeners();
        }
      });
      hideLoading(context);
      notifyListeners();
    } catch (e) {
      hideLoading(context);
      log("ERRROEEE getServicemanById : $e");
      notifyListeners();
    }
  }


}