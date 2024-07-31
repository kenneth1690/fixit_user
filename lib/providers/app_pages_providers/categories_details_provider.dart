import 'dart:developer';
import 'dart:math' as math;
import 'package:fixit_user/common_tap.dart';
import 'package:fixit_user/config.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import '../../screens/app_pages_screens/category_detail_screen/layouts/categories_filter.dart';


class CategoriesDetailsProvider with ChangeNotifier {
  TextEditingController searchCtrl = TextEditingController();
  TextEditingController filterSearchCtrl = TextEditingController();
  int selectedIndex = 0;
  double widget1Opacity = 0.0;
  Future<ui.Image>? loadingImage;
  final FocusNode searchFocus = FocusNode();
  final FocusNode filterSearchFocus = FocusNode();
  int? exValue = appArray.experienceList[0]["id"];
  String selectedExp = appArray.experienceList[0]["title"];
  List selectedRates = [];
  List<Services> serviceList = [];
  CategoryModel? categoryModel;
  bool val = true;
  double maxPrice = 100.0, minPrice = 0.0, lowerVal = 00.0, upperVal = 100.0;
  Services? services;
  List<ProviderModel> providerList = [];
  List selectedProvider = [];

  onSwitch(value) {
    val = value;
    notifyListeners();
  }

  onExperience(val) {
    exValue = val;
    selectedExp = appArray.experienceList[val]['title'];
    notifyListeners();
    fetchProviderByFilter();
  }

  String totalCountFilter() {
    log("maxPrice :: $maxPrice");
    int count = 0;

    if (selectedProvider.isNotEmpty) {
      count++;
    }
    if (lowerVal != 00.0 || upperVal < maxPrice) {
      count++;
    }
    if (selectedRates.isNotEmpty) {
      count++;
    }
    if (slider != 0.0) {
      count++;
    }

    if (isSelect != null) {
      count++;
    }

    return count.toString();
  }

  fetchProviderByFilter() async {
    try {
      String val = selectedExp.toString().contains("highestExperience") ||
              selectedExp.toString().contains("highestServed")
          ? "high"
          : "low";
      String apiUrl = "";

      if (filterSearchCtrl.text.isEmpty) {
        if (selectedExp.toString().contains("highestExperience") ||
            selectedExp.toString().contains("lowestExperience")) {
          apiUrl =
              "${api.provider}?experience=$val&search=${filterSearchCtrl.text}";
        } else {
          apiUrl =
              "${api.provider}?served=$val&search=${filterSearchCtrl.text}";
        }
      } else {
        apiUrl = "${api.provider}?search=${filterSearchCtrl.text}";
      }
      log("apiUrl:$apiUrl");
      await apiServices.getApi(apiUrl, []).then((value) {
        if (value.isSuccess!) {
          List provider = value.data;
          providerList = [];
          for (var data in provider) {

            if (!providerList.contains(ProviderModel.fromJson(data))) {
              providerList.add(ProviderModel.fromJson(data));
            }
            notifyListeners();
          }

          notifyListeners();
          log("providerList ::${providerList.length}");
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  onCategoryChange(index) {
    if (!selectedProvider.contains(index)) {
      selectedProvider.add(index);
    } else {
      selectedProvider.remove(index);
    }
    notifyListeners();
  }

  onSubCategories(context, index, id)async {
    showLoading(context);
    notifyListeners();
    selectedIndex = index;
    notifyListeners();
    log("idid:$id");
    await getServiceByCategoryId(context, id);
    hideLoading(context);
    notifyListeners();
  }

  int selectIndex = 0;

  onFilter(index) {
    selectIndex = index;
    notifyListeners();
  }

  double slider = 0;
  bool? isSelect;
  int ratingIndex = 0;

  onSliderChange(handlerIndex, lowerValue, upperValue) {
    lowerVal = lowerValue;
    upperVal = upperValue;
    notifyListeners();
  }

  onTapRating(id) {
    if (!selectedRates.contains(id)) {
      selectedRates.add(id);
    } else {
      selectedRates.remove(id);
    }

    notifyListeners();
  }

  onChange() {
    isSelect = false;
    notifyListeners();
  }

  onChange1() {
    isSelect = true;
    notifyListeners();
  }

  double sliderValue = 0.0;

  onChangeSlider(sVal) {
    notifyListeners();
    sliderValue = sVal;
    notifyListeners();
  }

  Future<ui.FrameInfo> loadImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: 30, targetWidth: 30);
    ui.FrameInfo fi = await codec.getNextFrame();
    notifyListeners();
    return fi;
  }

  ui.Image? customImage;

  slidingValue(newValue) {
    slider = newValue;
    notifyListeners();
  }

  onBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const CategoriesFilterLayout();
      },
    );
  }

  onRefresh(context)async{
    showLoading(context);
    notifyListeners();
    if (categoryModel!.hasSubCategories != null &&
        categoryModel!.hasSubCategories!.isNotEmpty) {
    await  getServiceByCategoryId(context, categoryModel!.hasSubCategories![0].id);
    } else {
     await getServiceByCategoryId(context, categoryModel!.id);
    }
    hideLoading(context);
    notifyListeners();
  }

  onReady(context)async {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    categoryModel = data;
    notifyListeners();
    if (categoryModel!.hasSubCategories != null &&
        categoryModel!.hasSubCategories!.isNotEmpty) {
   await   getServiceByCategoryId(context, categoryModel!.hasSubCategories![0].id);
    } else {
      await getServiceByCategoryId(context, categoryModel!.id);
    }
    final dash = Provider.of<DashboardProvider>(context, listen: false);
    providerList = dash.providerList;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 500), () {
      widget1Opacity = 1;
      notifyListeners();
    });
    notifyListeners();
    log("providerList : ${categoryModel!.hasSubCategories!.isNotEmpty}");
  }

  onBack(context, isBack) {
    selectedIndex = 0;
    selectIndex = 0;
    serviceList = [];
    searchCtrl.text ="";
    widget1Opacity = 0.0;
    notifyListeners();
    if (isBack) {
      route.pop(context);
    }
  }

  getServiceByCategoryId(context, id) async {
    notifyListeners();

    try {
      String apiUrl = "";
      log("isSelect :$isSelect // $lowerVal // $upperVal // $zoneIds");
      if (isSelect == null &&
          lowerVal == 0.0 &&
          selectedProvider.isEmpty &&
          selectedRates.isEmpty &&
          upperVal == 100.0) {
        log("LOG 1");
        apiUrl =
            "${api.service}?categoryIds=$id&zone_ids=$zoneIds";
      } else if (selectedRates.isNotEmpty) {
        log("LOG 2");
        apiUrl =
            "${api.service}?categoryIds=$id&zone_ids=$zoneIds&rating=$selectedRates&search=${searchCtrl.text}";
      } else if (selectedProvider.isNotEmpty) {
        log("LOG 3");
        apiUrl =
            "${api.service}?categoryIds=$id&zone_ids=$zoneIds&providerIds=$selectedProvider&search=${searchCtrl.text}";
      } else if (selectedProvider.isNotEmpty && selectedRates.isNotEmpty) {
        log("LOG 4");
        apiUrl =
            "${api.service}?categoryIds=$id&zone_ids=$zoneIds&providerIds=$selectedProvider&rating=$selectedRates&search=${searchCtrl.text}";
      } else if (lowerVal != 0 || upperVal != 100) {
        log("LOG 5");
        apiUrl =
            "${api.service}?categoryIds=$id&min=${lowerVal.round()}&max${upperVal.round()}&zone_ids=$zoneIds";
      } else if (isSelect != null && !isSelect!) {
        log("LOG 6");
        apiUrl =
            "${api.service}?categoryIds=$id&zone_ids=$zoneIds&distance=$slider&search=${searchCtrl.text}";
      } else if (lowerVal != 0 &&
          upperVal != 100 &&
          selectedProvider.isNotEmpty) {
        log("LOG 7");
        apiUrl =
            "${api.service}?categoryIds=$id&min=$lowerVal&max$upperVal&zone_ids=$zoneIds&providerIds=$selectedProvider&search=${searchCtrl.text}";
      } else if (lowerVal != 0 && upperVal != 100 && selectedRates.isNotEmpty) {
        log("LOG 8");
        apiUrl =
            "${api.service}?categoryIds=$id&min=$lowerVal&max$upperVal&zone_ids=$zoneIds&rating=$selectedRates&search=${searchCtrl.text}";
      } else if (lowerVal != 0 &&
          upperVal != 100 &&
          selectedRates.isNotEmpty &&
          selectedProvider.isNotEmpty) {
        log("LOG 9");
        apiUrl =
            "${api.service}?categoryIds=$id&min=$lowerVal&max$upperVal&zone_ids=$zoneIds&rating=$selectedRates&providerIds=$selectedProvider&search=${searchCtrl.text}";
      } else if (lowerVal != 0 &&
          upperVal != 100 &&
          isSelect != null &&
          isSelect!) {
        log("LOG 10");
        apiUrl =
            "${api.service}?categoryIds=$id&min=$lowerVal&max$upperVal&zone_ids=$zoneIds&distance=$slider&search=${searchCtrl.text}";
      } else if (lowerVal != 0 &&
          upperVal != 100 &&
          isSelect != null &&
          isSelect! &&
          selectedRates.isNotEmpty) {
        log("LOG 11");
        apiUrl =
            "${api.service}?categoryIds=$id&min=$lowerVal&max$upperVal&zone_ids=$zoneIds&distance=$slider&rating=$selectedRates&search=${searchCtrl.text}";
      } else if (lowerVal != 0 &&
          upperVal != 100 &&
          isSelect != null &&
          isSelect! &&
          selectedProvider.isNotEmpty) {
        log("LOG 12");
        apiUrl =
            "${api.service}?categoryIds=$id&min=$lowerVal&max$upperVal&zone_ids=$zoneIds&distance=$slider&providerIds=$selectedProvider&search=${searchCtrl.text}";
      } else if (lowerVal != 0 &&
          upperVal != 100 &&
          isSelect != null &&
          isSelect! &&
          selectedProvider.isNotEmpty &&
          selectedRates.isNotEmpty) {
        log("LOG 13");
        apiUrl =
            "${api.service}?categoryIds=$id&min=$lowerVal&max$upperVal&zone_ids=$zoneIds&distance=$slider&providerIds=$selectedProvider&rating=$selectedRates&search=${searchCtrl.text}";
      } else {
        log("LOG 14");
        apiUrl =
            "${api.service}?categoryIds=$id&zone_ids=$zoneIds&search=${searchCtrl.text}";
      }
      log("URRR L: $apiUrl");
      await apiServices.getApi(apiUrl, []).then((value) {
        if (value.isSuccess!) {

          List dataList = value.data;
          serviceList = [];
          log("serviceListserviceList;${dataList.length}");
          if (dataList.isNotEmpty) {
            for (var data in value.data) {
              Services services = Services.fromJson(data);
              if (!serviceList.contains(services)) {
                serviceList.add(services);
              }
              if (services.price! > maxPrice) {
                maxPrice = services.price!;
                log(" a :::::::$maxPrice");
              }


              notifyListeners();
            }
            upperVal = maxPrice;
            notifyListeners();
          } else {
            maxPrice = 100.0;
            upperVal = 100.0;

            notifyListeners();
          }
          notifyListeners();
        } else {
          maxPrice = 100.0;
          upperVal = 100.0;

          notifyListeners();
        }

        notifyListeners();
      });
    } catch (e) {
      maxPrice = 100.0;
      upperVal = 100.0;
      log("ERRROEEE getServiceByCategoryId $e");
      notifyListeners();
    }
  }

  getServiceById(context, serviceId) async {
    try {
      await apiServices
          .getApi("${api.service}?serviceId=$serviceId", []).then((value) {
        if (value.isSuccess!) {
          services = Services.fromJson(value.data[0]);
          notifyListeners();
        }
        route.pushNamed(context, routeName.servicesDetailsScreen,
            arg: {'services':services!});
      });
    } catch (e) {
      log("ERRROEEE getServiceById : $e");
      notifyListeners();
    }
  }

  getProviderById(context, id, index, Services service) async {
    final cartCtrl = Provider.of<CartProvider>(context, listen: false);
    if (cartCtrl.cartList
        .where((element) =>
            element.serviceList != null &&
            element.serviceList!.id == service.id)
        .isNotEmpty) {
      cartCtrl.checkout(context);
      route.pushNamed(context, routeName.cartScreen);
    } else {
      try {
        await apiServices
            .getApi("${api.provider}/$id", [], isData: true)
            .then((value) {
          if (value.isSuccess!) {
            ProviderModel providerModel = ProviderModel.fromJson(value.data);
            final providerDetail = Provider.of<ProviderDetailsProvider>(context, listen: false);
            providerDetail.selectProviderIndex = 0;
            providerDetail.notifyListeners();
            onBook(context, service,
                provider: providerModel,
                addTap: () => onAdd(index),
                minusTap: () => onRemoveService(context, index)).then((e) {
              serviceList[index].selectedRequiredServiceMan =
                  serviceList[index].requiredServicemen;
              notifyListeners();
            });
            notifyListeners();
          }
        });
      } catch (e) {
        log("ERRROEEE getProviderById gategory detail: $e");
        notifyListeners();
      }
    }
  }

  onRemoveService(context, index) async {
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
            ((serviceList[index].selectedRequiredServiceMan!) - 1)
                ;
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

    notifyListeners();
  }

  //clear filter
  clearFilter(context) {
    selectedProvider = [];
    selectedRates = [];
    lowerVal = 00.0;
    upperVal = maxPrice;
    slider = 0;
    route.pop(context);
    notifyListeners();
  }
}
