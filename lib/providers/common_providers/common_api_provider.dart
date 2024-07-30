import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/config.dart';

import '../../models/app_setting_model.dart';


class CommonApiProvider extends ChangeNotifier {
  //self api
  selfApi(context) async {
    var body = {};
    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      await apiServices.getApi(api.self, [], isToken: true).then((value) {
        if (value.isSuccess!) {
          log("DDD");
          log("value.data: ${value.data}");
          userModel =UserModel.fromJson(value.data);
          pref.setString(
              session.user, json.encode(UserModel.fromJson(value.data)));

          notifyListeners();
          log("DDD1");
        }
      });
    } catch (e) {
      log("SELF :$e");
      notifyListeners();
    }
  }



Future<ProviderModel>  getProviderById(id) async {
    ProviderModel? providerModel;
    try {
      await apiServices
          .getApi("${api.provider}/$id", [], isData: true)
          .then((value) {
        if (value.isSuccess!) {

           providerModel = ProviderModel.fromJson(value.data);
          notifyListeners();
          return providerModel;
        }
      });
      return providerModel!;
    } catch (e) {
      log("ERRROEEE getProviderById common: $e");
      notifyListeners();
    }
    return providerModel!;
  }

  getData(context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    log("pref :$pref");
    dynamic userData = pref.getString(session.user);
    if (userData != null) {
      final commonApi =
      Provider.of<CommonApiProvider>(context, listen: false);
      await commonApi.selfApi(context);
      final locationCtrl =
      Provider.of<LocationProvider>(context, listen: false);

      await locationCtrl.getUserCurrentLocation(context);
      //await locationCtrl.getLocationList();
      final dashCtrl = Provider.of<DashboardProvider>(context, listen: false);
      final favCtrl =
      Provider.of<FavouriteListProvider>(context, listen: false);
      favCtrl.getFavourite();
      dashCtrl.getBookingHistory(context);

      dashCtrl.getServicePackage();
      final cartCtrl = Provider.of<CartProvider>(context, listen: false);
      cartCtrl.onReady(context);
      final notifyCtrl = Provider.of<NotificationProvider>(
          context, listen: false);
      notifyCtrl.getNotificationList(context);
      dashCtrl.getBookingStatus();
    }

  }

  getPaymentMethodList(context) async {
    try {
      await apiServices.getApi(api.paymentMethod, []).then((value) {
        log("VALUE :${value.data}");
        if (value.isSuccess!) {
          paymentMethods =[];
          for(var d in value.data ){
            paymentMethods.add(PaymentMethods.fromJson(d));
          }
          notifyListeners();
        }

        notifyListeners();
      });
    } catch (e) {log("EEEE getPaymentMethodList:$e");
    notifyListeners();
    }
  }

  getCategoryById(context,id) async {
    CategoryModel? categoryModel;
    try {
      await apiServices
          .getApi("${api.category}/$id", [], isData: true,isMessage: false)
          .then((value) {
            log("CCCCC :${value.data}");
        if (value.isSuccess!) {

          categoryModel = CategoryModel.fromJson(value.data[0]);
          notifyListeners();
          route.pushNamed(context, routeName.categoriesDetailsScreen,
              arg: categoryModel);
        }
      });

    } catch (e) {
      log("ERRROEEE getCategoryById : $e");
      notifyListeners();
    }

  }

}