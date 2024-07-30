import 'dart:developer';

import 'package:fixit_user/common_tap.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../config.dart';
import '../../models/app_setting_model.dart';

class DashboardProvider with ChangeNotifier {
  List<BannerModel> bannerList = [];
  List<OfferModel> offerList = [];
  List<ProviderModel> highestRateList = [];
  List<CurrencyModel> currencyList = [];
  List<CouponModel> couponList = [];
  List<CategoryModel> categoryList = [];
  List<ServicePackageModel> servicePackagesList = [];
  List<ServicePackageModel> firstThreeServiceList = [];
  List<Services> featuredServiceList = [];
  static const pageSize = 1;
  SharedPreferences? pref;

  List<Services> firstTwoFeaturedServiceList = [];
  List<ProviderModel> firstTwoHighRateList = [];
  List<BlogModel> blogList = [];
  List<BlogModel> firstTwoBlogList = [];
  List<ProviderModel> providerList = [];
  List<BookingStatusModel> bookingStatusList = [];
  List service = appArray.servicesList.getRange(1, 3).toList();
  bool expanded = false;
  int selectIndex = 0, backCounter = 0;
  int? topSelected;
  bool isTap = false, isSearchData = false;

  final List<Widget> pages = [
    const HomeScreen(),
    const BookingScreen(),
    const OfferScreen(),
    const ProfileScreen()
  ];

  onTap(index, context) async {
    selectIndex = index;
    expanded = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    expanded = false;
    if (selectIndex != 0) {
      final homeCtrl = Provider.of<HomeScreenProvider>(context, listen: false);
      homeCtrl.animationController!.stop();
      homeCtrl.notifyListeners();
    } else {
      if (selectIndex == 3) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        bool isGuest = preferences.getBool(session.isContinueAsGuest) ?? false;
        if (isGuest == false) {
          final homeCtrl =
              Provider.of<HomeScreenProvider>(context, listen: false);
          homeCtrl.animationController!.reset();
          homeCtrl.notifyListeners();
        } else {
          route.pushAndRemoveUntil(context);
        }
      } else {
        final homeCtrl =
            Provider.of<HomeScreenProvider>(context, listen: false);
        homeCtrl.animationController!.reset();
        homeCtrl.notifyListeners();
      }
    }
    if (selectIndex != 1) {
      final booking = Provider.of<BookingProvider>(context, listen: false);
      if(booking.animationController != null) {
        if (booking.animationController != null) {
          booking.animationController!.stop();
          booking.notifyListeners();
        }
      }
      final data =
      Provider.of<DashboardProvider>(context, listen: false);
      data.getBookingHistory(context);
      final book = Provider.of<BookingProvider>(context,listen: false);

      book.clearTap(context,isBack: false);

    } else if (selectIndex == 1) {
      final booking = Provider.of<BookingProvider>(context, listen: false);
      booking.animationController!.reset();
      booking.notifyListeners();
    }
    notifyListeners();
  }

  //on back
  onBack(context) async {
    if (selectIndex != 0) {
      selectIndex = 0;
      notifyListeners();
      Fluttertoast.showToast(msg: language(context, appFonts.pressBackAgain));
    } else {
      if (backCounter == 0) {
        Fluttertoast.showToast(msg: language(context, appFonts.pressBackAgain));
        backCounter++;
        notifyListeners();
      } else {
        backCounter = 0;
        notifyListeners();
        SystemNavigator.pop();
      }
    }
  }

  onRefresh(context) async {
    final locationCtrl = Provider.of<LocationProvider>(context, listen: false);
    await locationCtrl.getZoneId();
    getBanner();
    getOffer();
    getCoupons();

    getCategory();
    getServicePackage();
    getProvider();

    getFeaturedPackage(1);
    getHighestRate();
    getBlog();
  }

  //banner list
  getBanner() async {
    try {
      await apiServices
          .getApi(api.banner, []).then((value) {
        if (value.isSuccess!) {
          bannerList = [];
          for (var data in value.data) {
            bannerList.add(BannerModel.fromJson(data));
            notifyListeners();
          }
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  //offer list
  getOffer() async {
    try {
      await apiServices.getApi("${api.banner}?banner_type=true", []).then((value) {
        if (value.isSuccess!) {
          offerList = [];
          notifyListeners();
          for (var data in value.data) {
            offerList.add(OfferModel.fromJson(data));
            notifyListeners();
          }
        }
        notifyListeners();
      });
    } catch (e) {
      notifyListeners();
    }
  }

  //highest rate provider list
  getHighestRate() async {
    try {
      await apiServices
          .getApi(api.highestRating, [], isData: true, isMessage: true)
          .then((value) {
        if (value.isSuccess!) {
          highestRateList = [];
          firstTwoHighRateList = [];
          debugPrint("HIGHH :${value.data}");
          for (var data in value.data) {
            highestRateList.add(ProviderModel.fromJson(data));
            debugPrint("highestRateList :$data");
            notifyListeners();
          }
          if (highestRateList.length >= 3) {
            firstTwoHighRateList = highestRateList.getRange(0, 3).toList();
          }

          debugPrint("firstTwoHighRateList :${firstTwoHighRateList.length}");
          notifyListeners();
        }
      });
    } catch (e) {
      debugPrint("getHighestRate ::$e");
      notifyListeners();
    }
  }

//currency list
  getCurrency() async {
    try {
      await apiServices.getApi(api.currency, []).then((value) {
        if (value.isSuccess!) {
          currencyList = [];
          debugPrint("fbhgfvhg:${value.data}");
          for (var data in value.data) {
            currencyList.add(CurrencyModel.fromJson(data));
            notifyListeners();
          }
        }
      });
    } catch (e) {
      debugPrint("getCurrency ::$e}");

      notifyListeners();
    }
  }

//coupons list
  getCoupons() async {
    debugPrint("CHHHH");
    try {
      await apiServices.getApi(api.coupon, []).then((value) {
        if (value.isSuccess!) {
          debugPrint("COUPN :${value.data}");
          couponList = [];
          for (var data in value.data) {
            couponList.add(CouponModel.fromJson(data));
            notifyListeners();
          }
        }
      });
    } catch (e) {
      debugPrint("EEEE getCoupons: $e")
;      notifyListeners();
    }
  }

  //category list
  getCategory({search}) async {
    // notifyListeners();
    debugPrint("zoneIds zoneIds:$zoneIds");
    try {
      String apiUrl = "${api.category}?zone_ids=$zoneIds";
      if (zoneIds.isNotEmpty) {
        if (search != null) {
          apiUrl = "${api.category}?search=$search&zone_ids=$zoneIds";
        } else {
          apiUrl = "${api.category}?zone_ids=$zoneIds";
        }
      } else {
        if (search != null) {
          apiUrl = "${api.category}?search=$search";
        } else {
          apiUrl = api.category;
        }
      }

      await apiServices.getApi(apiUrl, []).then((value) {
        if (value.isSuccess!) {
          List category = value.data;
          categoryList = [];
          for (var data in category.reversed.toList()) {
            if (!categoryList.contains(CategoryModel.fromJson(data))) {
              categoryList.add(CategoryModel.fromJson(data));
            }
            notifyListeners();
          }
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  //service package list
  getServicePackage() async {
    debugPrint("SERR :$zoneIds");
    try {
      String apiUrl = api.servicePackages;
      if (zoneIds.isNotEmpty) {
        apiUrl = "${api.servicePackages}?zone_ids=$zoneIds";
      } else {
        apiUrl = api.servicePackages;
      }
      await apiServices.getApi(apiUrl, []).then((value) {
        if (value.isSuccess!) {
          List service = value.data;
          servicePackagesList = [];
          for (var data in service.reversed.toList()) {
            servicePackagesList.add(ServicePackageModel.fromJson(data));
            notifyListeners();
          }
          if (servicePackagesList.length >= 3) {
            firstThreeServiceList = servicePackagesList.getRange(0, 3).toList();
          }
          notifyListeners();

          debugPrint("servicePackagesList LEN: ${servicePackagesList.length}");
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  //featured package list
  getFeaturedPackage(page) async {
    try {
      await apiServices.getApi(api.featuredServices, []).then((value) {
        if (value.isSuccess!) {
          featuredServiceList = [];
          firstTwoFeaturedServiceList = [];
          List service = value.data;
          for (var data in service.reversed.toList()) {
            if (!featuredServiceList.contains(Services.fromJson(data))) {
              featuredServiceList.add(Services.fromJson(data));
            }
            notifyListeners();
          }
          if (featuredServiceList.length >= 2) {
            firstTwoFeaturedServiceList =
                featuredServiceList.getRange(0, 2).toList();
          }
          notifyListeners();
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  //blog list
  getBlog() async {
    try {
      await apiServices.getApi(api.blog, []).then((value) {
        if (value.isSuccess!) {
          blogList = [];
          List service = value.data['data'];
          for (var data in service.reversed.toList()) {
            blogList.add(BlogModel.fromJson(data));
            notifyListeners();
          }
          if (blogList.length >= 6) {
            firstTwoBlogList = blogList.getRange(0, 6).toList();
          }
          notifyListeners();
        }
        debugPrint("firstTwoBlogList :${firstTwoBlogList.length}");
      });
    } catch (e) {
      notifyListeners();
    }
  }

  //provider list
  getProvider() async {
    try {
      await apiServices.getApi(api.provider, []).then((value) {
        if (value.isSuccess!) {
          List provider = value.data;
          providerList = [];
          for (var data in provider.reversed.toList()) {
            debugPrint("PPPPP :$data");
            providerList.add(ProviderModel.fromJson(data));
            notifyListeners();
          }

          notifyListeners();
          debugPrint("providerList ::${providerList.length}");
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  //booking history list
  getBookingHistoryList() async {
    providerList = [];
    try {
      await apiServices.getApi(api.provider, []).then((value) {
        if (value.isSuccess!) {
          List provider = value.data;

          for (var data in provider.reversed.toList()) {
            debugPrint("PPPPP :$data");
            providerList.add(ProviderModel.fromJson(data));
            notifyListeners();
          }

          notifyListeners();
          debugPrint("providerList ::${providerList.length}");
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  onRemoveService(context, index) async {
    if (firstTwoFeaturedServiceList.isEmpty) {
      if (int.parse(featuredServiceList[index].selectedRequiredServiceMan!) ==
          1) {
        isAlert = false;
        notifyListeners();
        route.pop(context);
      } else {
        if (int.parse(featuredServiceList[index].requiredServicemen!) ==
            int.parse(featuredServiceList[index].selectedRequiredServiceMan!)) {
          isAlert = true;
          notifyListeners();
          await Future.delayed(DurationClass.s3);
          isAlert = false;
          notifyListeners();
        } else {
          isAlert = false;
          notifyListeners();
          featuredServiceList[index].selectedRequiredServiceMan = (int.parse(
                      featuredServiceList[index].selectedRequiredServiceMan!) -
                  1)
              .toString();
        }
      }
    } else {
      if (int.parse(
              firstTwoFeaturedServiceList[index].selectedRequiredServiceMan!) ==
          1) {
        isAlert = false;
        notifyListeners();
        route.pop(context);
      } else {
        debugPrint("djghdfkjg");
        if (int.parse(featuredServiceList[index].requiredServicemen!) ==
            int.parse(featuredServiceList[index].selectedRequiredServiceMan!)) {
          isAlert = true;
          notifyListeners();
          await Future.delayed(DurationClass.s3);
          isAlert = false;
          notifyListeners();
        } else {
          isAlert = false;
          notifyListeners();
          featuredServiceList[index].selectedRequiredServiceMan = (int.parse(
                      featuredServiceList[index].selectedRequiredServiceMan!) -
                  1)
              .toString();
        }
      }
    }
    notifyListeners();
  }

  onAdd(index) {
    isAlert = false;
    notifyListeners();
    int count =
        int.parse(featuredServiceList[index].selectedRequiredServiceMan!);
    count++;
    featuredServiceList[index].selectedRequiredServiceMan = count.toString();

    notifyListeners();
  }

  onAddTap(context, Services? service, index, inCart) {
    if (inCart) {
      route.pushNamed(context, routeName.cartScreen);
    } else {
      final providerDetail = Provider.of<ProviderDetailsProvider>(context, listen: false);
      providerDetail.selectProviderIndex = 0;
      providerDetail.notifyListeners();
      onBook(context, service!,
          provider: service.user,
          addTap: () => onAdd(index),
          minusTap: () => onRemoveService(context, index)).then((e) {
        featuredServiceList[index].selectedRequiredServiceMan =
            featuredServiceList[index].requiredServicemen;
        notifyListeners();
      });
    }
  }

  //booking status list
  getBookingStatus() async {
    try {
      await apiServices
          .getApi(api.bookingStatus, [], isToken: true)
          .then((value) {
        if (value.isSuccess!) {
          for (var data in value.data) {
            bookingStatusList.add(BookingStatusModel.fromJson(data));
            notifyListeners();
          }
        }
      });

      notifyListeners();

      debugPrint("STATYS L ${bookingStatusList.length}");
      int cancelIndex = bookingStatusList.indexWhere((element) => element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "cancel" ||element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "cancelled");
      if(cancelIndex >=0){
        debugPrint("CANCEl :${bookingStatusList[cancelIndex].slug}");
        appFonts.cancel = bookingStatusList[cancelIndex].slug!;

      }
      int acceptedIndex = bookingStatusList.indexWhere((element) => element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "accepted" || element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "accept" );
      if(acceptedIndex >=0){
        debugPrint("ACCEPTEF :${bookingStatusList[acceptedIndex].slug}");
        appFonts.accepted  = bookingStatusList[acceptedIndex].slug!;
      }

      int assignedIndex = bookingStatusList.indexWhere((element) => element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "assign" || element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "assigned" );
      if(assignedIndex >=0){
        debugPrint("ASSIGNED :${bookingStatusList[assignedIndex].slug}");
        appFonts.assigned  = bookingStatusList[assignedIndex].slug!;
      }

      int onTheWayIndex = bookingStatusList.indexWhere((element) => element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "ontheway");
      if(onTheWayIndex >=0){
        debugPrint("ON THE WAY :${bookingStatusList[onTheWayIndex].slug}");
        appFonts.ontheway  = bookingStatusList[onTheWayIndex].slug!;
      }

      int onGoingIndex = bookingStatusList.indexWhere((element) => element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "ongoing");
      if(onGoingIndex >=0){
        debugPrint("ONGOING :${bookingStatusList[onGoingIndex].slug}");
        appFonts.onGoing  = bookingStatusList[onGoingIndex].slug!;
      }

      int onHoldIndex = bookingStatusList.indexWhere((element) => element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "onhold");
      if(onHoldIndex >=0){
        debugPrint("onHOLD :${bookingStatusList[onHoldIndex].slug}");
        appFonts.onHold  = bookingStatusList[onHoldIndex].slug!;
      }

      int restartIndex = bookingStatusList.indexWhere((element) => element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "restart");
      if(restartIndex >=0){
        debugPrint("RESTART :${bookingStatusList[restartIndex].slug}");
        appFonts.restart  = bookingStatusList[restartIndex].slug!;
      }

      int startAgainIndex = bookingStatusList.indexWhere((element) => element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "startagain");
      if(startAgainIndex >=0){
        debugPrint("START AGAIN :${bookingStatusList[startAgainIndex].slug}");
        appFonts.startAgain  = bookingStatusList[startAgainIndex].slug!;
      }

      int completedIndex = bookingStatusList.indexWhere((element) => element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "completed" ||element.slug!.toLowerCase().replaceAll("-", "").replaceAll(" ", "").replaceAll("_", "") == "complete");
      if(completedIndex >=0){
        debugPrint("COMPLETED:${bookingStatusList[completedIndex].slug}");
        appFonts.completed  = bookingStatusList[completedIndex].slug!;
      }

      notifyListeners();


      debugPrint("APPP ;${appFonts.ontheway}");
    } catch (e) {
      notifyListeners();
    }
  }

  int count = 0;

  //booking history list
  getBookingHistory(context, {search, pageKey = 1}) async {
    final booking = Provider.of<BookingProvider>(context, listen: false);
    dynamic data;

    if (booking.selectedCategory.isNotEmpty &&
        booking.rangeStart != null &&
        booking.statusIndex != null) {
      data = {
        "status": bookingStatusList[booking.statusIndex!].slug,
        "start_date": booking.rangeStart,
        "end_date": booking.rangeEnd,
        "category_ids": booking.selectedCategory,
        "search": search
      };
    } else if (booking.selectedCategory.isNotEmpty &&
        booking.rangeStart != null) {
      data = {
        "start_date": booking.rangeStart,
        "end_date": booking.rangeEnd,
        "category_ids": booking.selectedCategory,
        "search": search
      };
    } else if (booking.selectedCategory.isNotEmpty) {
      data = {"category_ids": booking.selectedCategory};
    } else if (booking.selectedCategory.isNotEmpty &&
        booking.statusIndex != null) {
      data = {
        "status": bookingStatusList[booking.statusIndex!].slug,
        "category_ids": booking.selectedCategory,
        "search": search
      };
    } else if (booking.statusIndex != null) {
      data = {
        "status": bookingStatusList[booking.statusIndex!].slug,
        "search": search
      };
    } else if (booking.rangeStart != null && booking.statusIndex != null) {
      data = {
        "status": bookingStatusList[booking.statusIndex!].slug,
        "start_date": booking.rangeStart,
        "end_date": booking.rangeEnd,
        "search": search
      };
    } else if (booking.rangeStart != null) {
      data = {
        "start_date": booking.rangeStart,
        "end_date": booking.rangeEnd,
        "search": search
      };
    } else if (search != null) {
      data = {"search": search};
    }

    debugPrint("BD:: $data");
    try {
      await apiServices
          .getApi(api.booking, data ?? [], isToken: true)
          .then((value) {
        count++;
        debugPrint("datadata :${value.data}");
        if (value.isSuccess!) {
          booking.bookingList = [];
          for (var data in value.data) {
            if (!booking.bookingList.contains(BookingModel.fromJson(data))) {
              booking.bookingList.add(BookingModel.fromJson(data));
            }
            booking.notifyListeners();
          }
          if (booking.bookingList.isEmpty) {
            if(search != null) {
              isSearchData = true;
              booking.searchText.text = "";
              booking.notifyListeners();
            }else {
              isSearchData = false;
            }
          } else {
            isSearchData = false;
          }
          booking.notifyListeners();
        } else {
          booking.bookingList = [];
          booking.notifyListeners();
        }
      });
    } catch (e) {
      debugPrint("getBookingHistory ::$e");
      notifyListeners();
    }
  }

  onFeatured(context, Services? services, id, {inCart}) async {
    if (inCart) {
      route.pushNamed(context, routeName.cartScreen);
    } else {
      final commonApi = Provider.of<CommonApiProvider>(context, listen: false);
      ProviderModel provider =
          await commonApi.getProviderById(services!.userId);
      final providerDetail = Provider.of<ProviderDetailsProvider>(context, listen: false);
      providerDetail.selectProviderIndex = 0;
      providerDetail.notifyListeners();
      onBook(context, services,
              provider: provider,
              addTap: () => onAdd(id),
              minusTap: () => onRemoveService(context, id))!
          .then((e) {
        featuredServiceList[id].selectedRequiredServiceMan =
            featuredServiceList[id].requiredServicemen;
        notifyListeners();
      });
    }
  }

  onBannerTap(context, id) {
    final commonApi = Provider.of<CommonApiProvider>(context, listen: false);
    commonApi.getCategoryById(context, id);
  }

  cartTap(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    getCoupons();
    bool isGuest = preferences.getBool(session.isContinueAsGuest) ?? false;
    if (isGuest == false) {
      final cartCtrl = Provider.of<CartProvider>(context, listen: false);
      debugPrint("dg :");
      cartCtrl.checkout(context);
      /* cartCtrl.cartList = [];
                        cartCtrl.notifyListeners();*/
      route.pushNamed(context, routeName.cartScreen);
    } else {
      route.pushAndRemoveUntil(context);
    }
  }
}
