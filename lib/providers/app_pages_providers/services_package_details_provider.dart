import 'dart:developer';

import 'package:fixit_user/config.dart';

class ServicesPackageDetailsProvider with ChangeNotifier {
  int selectedIndex = 0;
  int? serviceId;
  bool isBottom = true;
  ScrollController  scrollController = ScrollController();
  double widget1Opacity =0.0;

  ServicePackageModel? service;

  onImageChange(index) {
    selectedIndex = index;
    notifyListeners();
  }

  onReady(context) async {

    scrollController.addListener(listen);
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    log("service :$data");
    if (data['packageId'] != null) {
      serviceId = data['packageId'];
      notifyListeners();
    } else {
      service = data['services'];
      serviceId = service!.id;
      notifyListeners();

    }
    Future.delayed(const Duration(milliseconds: 500), () {
      widget1Opacity = 1;
      notifyListeners();
    });
    getServicePackageById(context, serviceId);
    notifyListeners();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void listen() {
    if (scrollController.position.pixels >= 100) {
      hide();
      log("scrollController.position.pixels${scrollController.position.pixels}");
      notifyListeners();
    } else {
      show();
      log("scrollController.position.pixels${scrollController.position.pixels}");
      notifyListeners();
    }


    notifyListeners();
  }

  void show() {
    if (!isBottom) {
      isBottom = true;
      notifyListeners();
    }
  }

  void hide() {
    if (isBottom) {
      isBottom = false;
      notifyListeners();
    }
  }


  getServicePackageById(context, serviceId) async {
    try {
      await apiServices
          .getApi("${api.servicePackages}/$serviceId", []).then((value) {
        if (value.isSuccess!) {
          notifyListeners();
          log("DDDD :${value.data}");
          service = ServicePackageModel.fromJson(value.data[0]);
          notifyListeners();
        }

      });
    } catch (e) {

      log("ERRROEEE getServicePackageById : $e");
      notifyListeners();
    }
  }

  onRefresh(context)async{
    showLoading(context);
    notifyListeners();
    await getServicePackageById(context, serviceId);
    hideLoading(context);
    notifyListeners();
  }

  onBack(context,isBack) async {
    if(isBack){
      route.pop(context);
    }
    service = null;
    serviceId = null;
    notifyListeners();
  }
}
