import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit_user/common_tap.dart';
import 'package:fixit_user/config.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

import '../../screens/bottom_screens/cart_screen/layouts/service_detail_layout.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> cartList = [];
  CouponModel? data;
  bool isLoading = false;
  double widget1Opacity = 0.0;
  dynamic checkoutBody;
  AnimationController? animationController;
  TextEditingController couponCtrl = TextEditingController();
  FocusNode focus = FocusNode();
  ScrollController scrollController = ScrollController();

  bool isPositionedRight = false;
  bool isAnimateOver = false, isPayment = false;
  AnimationController? controller;
  Animation<Offset>? offsetAnimation;
  CheckoutModel? checkoutModel;

  onCode(context, values)async {
    if (values != null) {
      isLoading = true;
      notifyListeners();
      data = values;
      couponCtrl.text = data!.code!;
      notifyListeners();

      await checkout(context);
      isLoading =false;
      notifyListeners();
    }
  }

  onReady(context) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final rawJson = preferences.getString(session.cart);
    final dash =
    Provider.of<DashboardProvider>(context, listen: false);
    dash.getCoupons();
    debugPrint("rawJson : $rawJson");
    if (rawJson != null) {
      List<dynamic> listMap = jsonDecode(rawJson);
      debugPrint("map : $listMap");
      cartList = listMap.map((e) {
        log(" json.decode(e)['isPackage']:${json.decode(e)['serviceList']}");

        CartModel cartModel = CartModel(
            isPackage: json.decode(e)['isPackage'],
            servicePackageList: json.decode(e)['isPackage'] == true
                ? ServicePackageModel.fromJson(
                    json.decode(e)['servicePackageList'])
                : null,
            serviceList: json.decode(e)['isPackage'] == false
                ? Services.fromJson(json.decode(e)['serviceList'])
                : null);

        return cartModel;
      }).toList();
    }
    isLoading = false;
    notifyListeners();
    log("cartList : ${cartList.length}");
    log("cartList : $isLoading");
  }

  onServiceDetail(context, {data, packageServices, totalServiceman}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context2) {
        return ServiceDetailLayout(
          data: data,
          packageService: packageServices,
          totalServiceman: totalServiceman,
        );
      },
    );
  }

  int totalRequiredServiceMan(List<Services> service) {
    int count = 0;
    service.asMap().entries.forEach((element) {
      count = count + (element.value.selectedRequiredServiceMan!);
    });

    notifyListeners();
    return count;
  }

  checkout(context, {isCreateBook = false}) async {
    try{
      if (cartList.isNotEmpty) {
        try {
          int primaryIndex = 0;
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences = await SharedPreferences.getInstance();
          //Map user = json.decode(preferences!.getString(session.user)!);
          UserModel userModel = UserModel.fromJson(
              json.decode(preferences.getString(session.user)!));
          final locationCtrl =
          Provider.of<LocationProvider>(context, listen: false);
          int index = locationCtrl.addressList
              .indexWhere((element) => element.isPrimary == 1);
          if (index >= 0) {
            primaryIndex = index;
          } else {
            primaryIndex = 0;
          }
          List services = [];
          List servicesPackage = [];

          cartList.asMap().entries.forEach((element) {
            if (element.value.isPackage! == false) {
              List idList = [];
              if (element.value.serviceList!.selectedServiceMan != null &&
                  element.value.serviceList!.selectedServiceMan!.isNotEmpty) {
                for (var list in element.value.serviceList!.selectedServiceMan!) {
                  idList.add(list.id);
                }
              }
              var serviceData = {
                "service_id": element.value.serviceList!.id,
                "required_servicemen":
                element.value.serviceList!.selectedRequiredServiceMan,
                "date_time":
                "${DateFormat("dd-MMM-yyyy").format(element.value.serviceList!.serviceDate!)},${DateFormat("hh:mm").format(element.value.serviceList!.serviceDate!)} ${element.value.serviceList!.selectedDateTimeFormat != null ? element.value.serviceList!.selectedDateTimeFormat!.toLowerCase() : DateFormat("aa").format(element.value.serviceList!.serviceDate!).toLowerCase()}",
                "address_id": element.value.serviceList!.primaryAddress!.id,
                "select_serviceman":
                element.value.serviceList!.selectServiceManType,
                "serviceman_id": idList,
                "select_date_time":
                element.value.serviceList!.selectDateTimeOption,
                "description": element.value.serviceList!.selectedServiceNote
              };

              services.add(serviceData);
            } else {
              List servicesPackageService = [];
              List idList = [];

              for (var ser in element.value.servicePackageList!.services!) {
                log("ser.selectServiceManType  :${ser.selectServiceManType} //${ser.id}");
                if (ser.selectServiceManType != "app_choose") {
                  for (var list in ser.selectedServiceMan!) {
                    idList.add(list.id);
                  }
                } else {
                  idList = [];
                  ser.selectedRequiredServiceMan ??= 1;
                }
                log("idList :$idList");
                var serviceData = {
                  "service_id": ser.id,
                  "required_servicemen": ser.selectedRequiredServiceMan ??
                      (idList.isEmpty ? "1" : idList.length.toString()),
                  "date_time":
                  "${DateFormat("dd-MMM-yyyy").format(ser.serviceDate!)},${DateFormat("hh:mm").format(ser.serviceDate!)} ${ser.selectedDateTimeFormat != null ? ser.selectedDateTimeFormat!.toLowerCase() : DateFormat("aa").format(ser.serviceDate!).toLowerCase()}",
                  "address_id": ser.primaryAddress != null
                      ? ser.primaryAddress!.id
                      : locationCtrl.addressList[primaryIndex].id,
                  "select_serviceman": ser.selectServiceManType,
                  "serviceman_id":
                  ser.selectServiceManType == "app_choose" ? [] : idList,
                  "select_date_time": ser.selectDateTimeOption,
                  "description": ser.selectedServiceNote
                };

                servicesPackageService.add(serviceData);
              }

              var package = {
                "service_package_id": element.value.servicePackageList!.id,
                "services": servicesPackageService,
              };
              servicesPackage.add(package);
            }
          });

          notifyListeners();
          var body = {
            "consumer_id": userModel.id,
            "services": services,
            "service_packages": servicesPackage,
            "coupon": data != null ? data!.code : couponCtrl.text,
            "wallet_balance": null,
            "payment_method": "cash"
          };

          log("CHECKOUT : $body");
          checkoutBody = body;
          notifyListeners();
          await apiServices
              .postApi(api.checkout, body, isData: true, isToken: true)
              .then((value) async {
            log("CHECKOUT RES :${value.data}");
            if (value.data == 0) {
              if(value.message.contains("Unauthenticated.") || value.message == "Unauthenticated."){
                SharedPreferences? preferences = await SharedPreferences.getInstance();
                final dash = Provider.of<DashboardProvider>(context, listen: false);
                dash.selectIndex =0;
                dash.notifyListeners();
                preferences.remove(session.user);
                preferences.remove(session.accessToken);
                preferences.remove(session.isContinueAsGuest);
                preferences.remove(session.isLogin);
                preferences.remove(session.cart);
                preferences.remove(session.recentSearch);


                final auth = FirebaseAuth.instance.currentUser;
                if(auth != null){
                  FirebaseAuth.instance.signOut();
                  GoogleSignIn().disconnect();
                }
                notifyListeners();
                route.pop(context);
                route.pushAndRemoveUntil(context);
                route.pushAndRemoveUntil(context);
              }else {
                snackBarMessengers(context, message: value.message);
                data = null;
                notifyListeners();
              }
            } else {
              if (value.isSuccess!) {
                checkoutModel = CheckoutModel.fromJson(value.data);
                notifyListeners();
              } else {
                snackBarMessengers(context, message: value.message);
              }
            }
          });
          Future.delayed(const Duration(milliseconds: 500), () {
            widget1Opacity = 1;
            notifyListeners();
          });
          log("checkoutModel::$checkoutModel");
        } catch (e) {
          Future.delayed(const Duration(milliseconds: 500), () {
            widget1Opacity = 1;
            notifyListeners();
          });
          log("CART ERROE :$e");
        } finally {}
      } else {
        Future.delayed(const Duration(milliseconds: 500), () {
          widget1Opacity = 1;
          notifyListeners();
        });
      }
    }catch(e){
      log("EEEE checkout : $e");
    }
  }

  editCart(CartModel cart, context, index) async {
    if (cart.isPackage!) {
      route.pushNamed(context, routeName.selectServiceScreen, arg: {
        "services": cart.servicePackageList!,
        "id": cart.servicePackageList!.id
      });
    } else {

      final providerDetail = Provider.of<ProviderDetailsProvider>(context, listen: false);
      providerDetail.selectProviderIndex = 0;
      providerDetail.notifyListeners();
      onBook(context, cart.serviceList!,

          addTap: () => onAdd(index),
          minusTap: () => onRemoveService(context, index));
    }
  }

  onRemoveService(context, index) async {
    if ((cartList[index].serviceList!.selectedRequiredServiceMan!) ==
        1) {
      route.pop(context);
      isAlert = false;
      notifyListeners();
    } else {
      if ((cartList[index].serviceList!.requiredServicemen!) ==
          (cartList[index].serviceList!.selectedRequiredServiceMan!)) {
        isAlert = true;
        notifyListeners();
        await Future.delayed(DurationClass.s3);
        isAlert = false;
        notifyListeners();
      } else {
        isAlert = false;
        notifyListeners();
        cartList[index].serviceList!.selectedRequiredServiceMan = ((
                    cartList[index].serviceList!.selectedRequiredServiceMan!) -
                1);
      }
    }

    notifyListeners();
  }

  onAdd(index) {
    isAlert = false;
    notifyListeners();
    int count =
        (cartList[index].serviceList!.selectedRequiredServiceMan!);
    count++;
    cartList[index].serviceList!.selectedRequiredServiceMan = count;

    notifyListeners();
  }

  deleteCart(context, index) async {
    route.pop(context);
    isLoading = true;
    cartList.removeAt(index);
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(session.cart);
    List<String> personsEncoded =
        cartList.map((person) => jsonEncode(person.toJson())).toList();
    preferences.setString(session.cart, json.encode(personsEncoded));
    notifyListeners();
    completeSuccess(context);
    await checkout(context);
    isLoading =false;
    notifyListeners();
  }

  completeSuccess(context) {
    showCupertinoDialog(
      context: context,
      builder: (context1) {
        return AlertDialogCommon(
          title: appFonts.successfullyDelete,
          height: Sizes.s140,
          image: eGifAssets.successGif,
          subtext: language(context, appFonts.cartDeletedSuccessfully),
          bText1: language(context, appFonts.okay),
          b1OnTap: () {
            route.pop(context);
          },
        );
      },
    );
  }

  onApplyRemoveTap(context) {
    if(data !=null) {
      data = null;
      couponCtrl.text = "";
      notifyListeners();
    }
    checkout(context);
  }

  deleteCartConfirmation(context, sync, id) {
    animateDesign(sync);
    showDialog(
        context: context,
        builder: (context1) {
          return StatefulBuilder(builder: (context2, setState) {
            return Consumer<CartProvider>(builder: (context3, value, child) {
              return AlertDialog(
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: Insets.i20),
                  shape: const SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.all(SmoothRadius(
                          cornerRadius: AppRadius.r14, cornerSmoothing: 1))),
                  backgroundColor: appColor(context).whiteBg,
                  content: Stack(alignment: Alignment.topRight, children: [
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      // Gif
                      Stack(alignment: Alignment.topCenter, children: [
                        Stack(alignment: Alignment.topCenter, children: [
                          SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        SizedBox(
                                            height: Sizes.s180,
                                            width: Sizes.s150,
                                            child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                curve: isPositionedRight
                                                    ? Curves.bounceIn
                                                    : Curves.bounceOut,
                                                alignment: isPositionedRight
                                                    ? Alignment.center
                                                    : Alignment.topCenter,
                                                child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    height: 40,
                                                    child: Image.asset(
                                                        eImageAssets
                                                            .cartTrash)))),
                                        Image.asset(eImageAssets.dustbin,
                                                height: Sizes.s88,
                                                width: Sizes.s88)
                                            .paddingOnly(bottom: Insets.i24)
                                      ]))
                              .decorated(
                                  color: appColor(context).fieldCardBg,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r10)),
                        ]),
                        if (offsetAnimation != null)
                          SlideTransition(
                              position: offsetAnimation!,
                              child: (offsetAnimation != null &&
                                      isAnimateOver == true)
                                  ? Image.asset(eImageAssets.dustbinCover,
                                      height: 38)
                                  : const SizedBox())
                      ]),
                      // Sub text
                      const VSpace(Sizes.s15),
                      Text(language(context, appFonts.deleteCartSuccessfully),
                          textAlign: TextAlign.center,
                          style: appCss.dmDenseRegular14
                              .textColor(appColor(context).lightText)
                              .textHeight(1.2)),
                      const VSpace(Sizes.s20),
                      Row(children: [
                        Expanded(
                            child: ButtonCommon(
                                onTap: () => route.pop(context),
                                title: appFonts.no,
                                borderColor: appColor(context).primary,
                                color: appColor(context).whiteBg,
                                style: appCss.dmDenseSemiBold16
                                    .textColor(appColor(context).primary))),
                        const HSpace(Sizes.s15),
                        Expanded(
                            child: ButtonCommon(
                                color: appColor(context).primary,
                                fontColor: appColor(context).whiteColor,
                                onTap: () => deleteCart(context, id),
                                title: appFonts.yes))
                      ])
                    ]).padding(top: Insets.i40),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title
                          Text(language(context, appFonts.successfullyDelete),
                              style: appCss.dmDenseExtraBold18
                                  .textColor(appColor(context).darkText)),
                          Icon(CupertinoIcons.multiply,
                                  size: Sizes.s20,
                                  color: appColor(context).darkText)
                              .inkWell(onTap: () => route.pop(context))
                        ])
                  ]));
            });
          });
        }).then((value) {
      isPositionedRight = false;
      isAnimateOver = false;
      notifyListeners();
    });
  }

  animateDesign(TickerProvider sync) {
    Future.delayed(DurationClass.ms500).then((value) {
      isPositionedRight = true;
      notifyListeners();
    }).then((value) {
      Future.delayed(DurationClass.ms150).then((value) {
        isAnimateOver = true;
        notifyListeners();
      }).then((value) {
        controller = AnimationController(
            vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
        offsetAnimation = Tween<Offset>(
                begin: const Offset(0, 0.5), end: const Offset(0, 1))
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        notifyListeners();
      });
    });

    notifyListeners();
  }

  addServiceEmptyTap(context) {
    route.pushNamedAndRemoveUntil(context, routeName.dashboard);
    final dash = Provider.of<DashboardProvider>(context, listen: false);
    dash.selectIndex = 0;
    dash.notifyListeners();
  }

  onBack(context,isBack){

    if(isBack){
      route.pushNamed(context, routeName.dashboard);
    }
    widget1Opacity = 0.0;
    notifyListeners();
  }
}
