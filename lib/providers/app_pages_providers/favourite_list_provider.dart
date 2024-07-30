import 'dart:developer';

import 'package:fixit_user/config.dart';

import '../../common_tap.dart';
import '../../widgets/alert_message_common.dart';

class FavouriteListProvider with ChangeNotifier {
  List<FavouriteModel> favoriteList = [];
  List<FavouriteModel> providerFavList = [];
  List<FavouriteModel> serviceFavList = [];
  TextEditingController providerCtrl = TextEditingController();
  TextEditingController serviceCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final FocusNode serviceSearchFocus = FocusNode();
  int selectedIndex = 0;

  onChangeList(index) {
    selectedIndex = index;
    notifyListeners();
  }

  //favorite list
  getFavourite() async {
    notifyListeners();

    String apiUrlName = "";
    if (providerCtrl.text.isNotEmpty || serviceCtrl.text.isNotEmpty) {
      if (selectedIndex == 0) {
        apiUrlName =
            "${api.favouriteList}?type=provider&search=${providerCtrl.text}";
      } else {
        apiUrlName =
            "${api.favouriteList}?type=service&search=${serviceCtrl.text}";
      }
    } else {
      apiUrlName = api.favouriteList;
    }
    try {
      await apiServices.getApi(apiUrlName, [], isToken: true).then((value) {
        if (value.isSuccess!) {
          List favList = value.data;
          favoriteList = [];
          serviceFavList = [];
          providerFavList = [];
          notifyListeners();
          for (var data in favList.reversed.toList()) {
            FavouriteModel favouriteModel = FavouriteModel.fromJson(data);
            favoriteList.add(favouriteModel);
            if (favouriteModel.serviceId != null) {
              log("SER : ${favouriteModel.serviceId}");
              if (!serviceFavList.contains(favouriteModel)) {
                serviceFavList.add(favouriteModel);
              } else {
                serviceFavList.remove(favouriteModel);
              }
              notifyListeners();
            } else {
              if (!providerFavList.contains(favouriteModel)) {
                providerFavList.add(favouriteModel);
              } else {
                providerFavList.remove(favouriteModel);
              }
              notifyListeners();
            }
          }
          notifyListeners();
        }
      });
      log("favoriteList : ${favoriteList.length}");
    } catch (e) {
      notifyListeners();
    }
  }

  // add to favourite api
  addToFav(context, id, type) async {
    var body = {};

    log("body : $body");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isGuest = preferences.getBool(session.isContinueAsGuest) ?? false;
    if (isGuest) {
      route.pushAndRemoveUntil(context);
    } else {
      try {

        String apiURL = "";
        if(type=="service"){
          apiURL = "${api.favouriteList}?serviceId=$id&type=$type";
        }else{
          apiURL = "${api.favouriteList}?providerId=$id&type=$type";
        }

        showLoading(context);
        notifyListeners();
        await apiServices
            .postApi(apiURL, {},
                isToken: true)
            .then((value) {

          if (value.isSuccess!) {
            getFavourite();
          } else {}
          hideLoading(context);
          notifyListeners();
        });
      } catch (e) {
        hideLoading(context);
        notifyListeners();
        log("CATCH : $e");
      }
    }
  }

  onBack(context, isBack) {
    selectedIndex = 0;
    providerCtrl.text = "";
    serviceCtrl.text = "";
    notifyListeners();
    if (isBack) {
      route.pop(context);
    }
  }

  //remove from favourite api
  deleteToFav(context, id, type) async {
    int index = 0;

    try {
      showLoading(context);
      notifyListeners();
      if (type == "service") {
        serviceFavList.removeWhere(
            (element) => element.serviceId.toString() == id.toString());
        notifyListeners();
        index = favoriteList.indexWhere(
            (element) => element.serviceId.toString() == id.toString());
      } else {
        providerFavList.removeWhere(
            (element) => element.providerId.toString() == id.toString());
        notifyListeners();
        index = favoriteList.indexWhere(
            (element) => element.providerId.toString() == id.toString());
      }

      notifyListeners();
      int favId = favoriteList[index].id!;
      log("favId : $favId");
      if (type == "service") {
        favoriteList.removeWhere(
            (element) => element.serviceId.toString() == id.toString());
      } else {
        favoriteList.removeWhere(
            (element) => element.providerId.toString() == id.toString());
      }
      log("DDD :${"${api.favoriteList}/$type/$favId"}");
      await apiServices
          .deleteApi("${api.favoriteList}/$type/$favId", {}, isToken: true)
          .then((value) {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          log("CCCC");
          getFavourite();
        }
      });
    } catch (e) {
      getFavourite();
      hideLoading(context);
      notifyListeners();
      log("CATCH : $e");
    }
  }

  onFeatured(context, Services? services, id) async {
    final commonApi = Provider.of<CommonApiProvider>(context, listen: false);
    ProviderModel provider = await commonApi.getProviderById(services!.userId);
    final providerDetail =
        Provider.of<ProviderDetailsProvider>(context, listen: false);
    providerDetail.selectProviderIndex = 0;
    providerDetail.notifyListeners();
    onBook(context, services,
            provider: provider,
            addTap: () => onAdd(id: id),
            minusTap: () => onRemoveService(context, id: id))!
        .then((e) {
      serviceFavList[id].service!.selectedRequiredServiceMan =
          serviceFavList[id].service!.requiredServicemen;
      notifyListeners();
    });
  }

  onRemoveService(context, {id}) async {
    if (int.parse(serviceFavList[id].service!.selectedRequiredServiceMan!) ==
        1) {
      route.pop(context);
      isAlert = false;
      notifyListeners();
    } else {
      if (int.parse(serviceFavList[id].service!.requiredServicemen!) ==
          int.parse(serviceFavList[id].service!.selectedRequiredServiceMan!)) {
        isAlert = true;
        notifyListeners();
        await Future.delayed(DurationClass.s3);
        isAlert = false;
        notifyListeners();
      } else {
        isAlert = false;
        notifyListeners();
        serviceFavList[id].service!.selectedRequiredServiceMan = (int.parse(
                    serviceFavList[id].service!.selectedRequiredServiceMan!) -
                1)
            .toString();
      }
    }
    notifyListeners();
  }

  onAdd({id}) {
    isAlert = false;
    notifyListeners();
    int count =
        int.parse(serviceFavList[id].service!.selectedRequiredServiceMan!);
    count++;
    serviceFavList[id].service!.selectedRequiredServiceMan = count.toString();
    notifyListeners();
  }
}
