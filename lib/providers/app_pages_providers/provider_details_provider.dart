import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/common_tap.dart';
import 'package:fixit_user/config.dart';
import 'package:fixit_user/models/selected_service_cart.dart';

import '../../widgets/alert_message_common.dart';

class ProviderDetailsProvider with ChangeNotifier {
  int selectIndex = 0;
  int selectProviderIndex = 0;
  double widget1Opacity =0.0;
  List<CategoryModel> categoryList = [];
  List<Services> serviceList = [];
  bool visible = true;
  int val = 1;
  double loginWidth = 100.0;
  int providerId = 0;
  ProviderModel? provider;

  onSelectService(context, index) {
    selectIndex = index;
    notifyListeners();

    getServiceByCategoryId(context, categoryList[index].id);
  }

  onChooseService(index) {
    selectProviderIndex = index;
    notifyListeners();
  }


  onAddService() {
    if (!visible) {
      visible = !visible;
      loginWidth = 100.0;
    } else {
      val = ++val;
    }
    notifyListeners();
  }

onBack(context, isBack){
    provider =null;
    widget1Opacity = 0.0;
    notifyListeners();
    if(isBack){
      route.pop(context);
    }
}

  onReady(context,{id}) async {
    notifyListeners();
    dynamic data;
    if(id != null){
      data = id;
    }else {
      data = ModalRoute
          .of(context)!
          .settings
          .arguments;
      notifyListeners();
      if(data['providerId'] != null){
        data = data['providerId'];
      }else{
        provider = data['provider'];
        data = provider!.id;
      }
    }
    notifyListeners();

   await getProviderById(context, data);
    await getCategory(context, data);
    widget1Opacity = 1;
    notifyListeners();
  }


  onRemoveService(context, index) async{
    if ((serviceList[index].selectedRequiredServiceMan!) == 1) {
      route.pop(context);
      isAlert = false;
      notifyListeners();
    } else {
      if ((serviceList[index].requiredServicemen!) ==
          (serviceList[index].selectedRequiredServiceMan!)) {
        isAlert = true;
        notifyListeners();
        await Future.delayed(DurationClass.s3);
        isAlert = false;
        notifyListeners();

      } else {
        isAlert = false;
        notifyListeners();
        serviceList[index].selectedRequiredServiceMan =
            ((serviceList[index].selectedRequiredServiceMan!) - 1);
      }

    }
    notifyListeners();
  }

  onAdd(index) {
    isAlert = false;
    notifyListeners();
    int count = (serviceList[index].selectedRequiredServiceMan!);
    count++;
    serviceList[index].selectedRequiredServiceMan = count;
log("CCCC");
    notifyListeners();
  }

  getProviderById(context, id) async {
    try {
      await apiServices
          .getApi("${api.provider}/$id", [], isData: true)
          .then((value) {

        if (value.isSuccess!) {
          provider = ProviderModel.fromJson(value.data);
          notifyListeners();
        }
      });
    } catch (e) {
      log("ERRROEEE getProviderById orovider: $e");
      notifyListeners();
    }
  }

  getCategory(context, id) async {

    // notifyListeners();
    try {
      String apiURL = "${api.category}?providerId=$id";
      if(zoneIds.isNotEmpty){
        apiURL = "${api.category}?providerId=$id&zone_ids=$zoneIds";
      }else{
        apiURL="${api.category}?providerId=$id";
      }

      await apiServices
          .getApi(apiURL, []).then((value) {
        if (value.isSuccess!) {
          List category = value.data;
          categoryList = [];
          for (var data in category.reversed.toList()) {
            if (!categoryList.contains(CategoryModel.fromJson(data))) {
              categoryList.add(CategoryModel.fromJson(data));
              notifyListeners();
            }
            notifyListeners();
          }
          getServiceByCategoryId(context, categoryList[0].id);
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  onRefresh(context)async{
    showLoading(context);
    notifyListeners();
    await getServiceByCategoryId(context, categoryList[selectIndex].id);
    hideLoading(context);
  }

  getServiceByCategoryId(context, id) async {
    final locationProvider =
    Provider.of<LocationProvider>(context, listen: false);

    notifyListeners();

    try {
      String apiUrl =
          "${api.service}?categoryIds=$id&zone_ids=$zoneIds";
      log("URRR L: $apiUrl");
      await apiServices.getApi(apiUrl, []).then((value) {
        if (value.isSuccess!) {
          serviceList = [];
          for (var data in value.data) {
            Services services = Services.fromJson(data);
            if (!serviceList.contains(services)) {
              serviceList.add(services);
            }

            notifyListeners();
          }
        }

        notifyListeners();
      });
    } catch (e) {
      log("ERRROEEE getServiceByCategoryId $e");
      notifyListeners();
    }
  }


}