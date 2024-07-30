import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:flutter/scheduler.dart';

class HomeScreenProvider with ChangeNotifier {
  int selectIndex = 0;
  int? cIndex;
  AnimationController? controller;
  Animation? animation;
  bool isSkeleton =true;

  HomeScreenProvider() {

    animationController =
    AnimationController(vsync: _TickerProvider(this), duration: const Duration(seconds: 10))
      ..repeat();
    rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController!);
  }

  onAnimate(TickerProvider sync) async{

    animationController =
    AnimationController(vsync: _TickerProvider(this), duration: const Duration(seconds: 10))
      ..repeat();
    rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController!);

    await Future.delayed(Duration(milliseconds: 2500));
    isSkeleton =false;
    notifyListeners();
    //notifyListeners();
  }

  List service = appArray.servicesList.getRange(1, 3).toList();

  double turns = 0.00;
  Animation<double>? rotationAnimation;
  AnimationController? animationController;


  isEmptyLayout(context){
    final dash = Provider.of<DashboardProvider>(context,listen: false);
    log("dash.bannerList.isNotEmpty :${dash.bannerList.isNotEmpty && dash.categoryList.isNotEmpty && dash.servicePackagesList.isNotEmpty && dash.featuredServiceList.isNotEmpty}");
    return dash.bannerList.isNotEmpty || dash.categoryList.isNotEmpty || dash.servicePackagesList.isNotEmpty && dash.featuredServiceList.isNotEmpty;
  }

  //on banner tap
  onBannerTap(context,type, id) {

    log("TYPE : $type / ID : $id");
    if (type == "service") {
      route.pushNamed(
          context, routeName.servicesDetailsScreen,
          arg:  {"serviceId" : id});
    } else if (type == "category") {
      final commonApi = Provider.of<CommonApiProvider>(context, listen: false);
      commonApi.getCategoryById(context, id);

    } else {
      route.pushNamed(
          context, routeName.providerDetailsScreen,
          arg: {'providerId':id});
    }
  }

  //on banner change
  onSlideBanner(index) {
    selectIndex = index;
    notifyListeners();
  }

//location tap
  locationTap(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref = await SharedPreferences.getInstance();
    bool isGuest = pref.getBool(session.isContinueAsGuest) ?? false;
    if (isGuest == false) {

      final location = Provider.of<LocationProvider>(context, listen: false);
      if (location.addressList.isEmpty) {
        route.pushNamed(context, routeName.location).then((e) {
          animationController!.reset();
          notifyListeners();
        }).then((e){
          location.getLocationList(context);
        });
      } else {
        route.pushNamed(context, routeName.myLocation).then((e) {
          animationController!.reset();
          notifyListeners();
        }).then((e){
location.getLocationList(context);
        });
      }
      animationController!.stop();
      notifyListeners();
    } else {
      route.pushAndRemoveUntil(context);
    }
  }

  //notification tap
  notificationTap(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref = await SharedPreferences.getInstance();
    bool isGuest = pref.getBool(session.isContinueAsGuest) ?? false;
    if (isGuest == false) {
      route.pushNamed(context, routeName.notifications);

    } else {
      route.pushAndRemoveUntil(context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    notifyListeners();
    super.dispose();
  }

}
class _TickerProvider extends TickerProvider {
  final HomeScreenProvider _notifier;

  _TickerProvider(this._notifier);

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick, debugLabel: 'ticker');
  }
}