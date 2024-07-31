import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/models/booking_model.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';
import 'package:flutter/cupertino.dart';

import '../../config.dart';
import '../../models/app_setting_model.dart';
import '../../screens/app_pages_screens/profile_detail_screen/layouts/selection_option_layout.dart';

class PaymentProvider with ChangeNotifier {
  int? selectIndex, bookingId = 0;
  UserModel? userModel;
  String? method;
  BookingModel? booking;
  SharedPreferences? preferences;
  dynamic checkoutBody;
  double wallet = 0.0;
  CheckoutModel? checkoutModel;
  String? itemId;
  List<PaymentMethods> paymentList = [];
  bool isWallet = false, isBottom = true, isRePayment = false;
  ScrollController scrollController = ScrollController();

  getUserDetail(context) async {
    scrollController.addListener(listen);
    final common = Provider.of<CommonApiProvider>(context, listen: false);
    await common.getPaymentMethodList(context);

    for (var d in paymentMethods) {
      if (d.slug == "cash") {
        log("appSettingModel!.activation!.cash :${appSettingModel!.activation!.cash}");

        if (appSettingModel!.activation!.cash == "1") {
          paymentList.add(d);
        }
      } else {
        paymentList.add(d);
      }
    }
    notifyListeners();
    preferences = await SharedPreferences.getInstance();
    //Map user = json.decode(preferences!.getString(session.user)!);
    userModel =
        UserModel.fromJson(json.decode(preferences!.getString(session.user)!));
    wallet = userModel!.wallet != null ? userModel!.wallet!.balance! : 0.0;

    dynamic data = ModalRoute.of(context)!.settings.arguments;

    bookingId = data['bookingId'] ?? 0;

    if (bookingId == 0) {
      checkoutBody = data["checkoutBody"];
      checkoutModel = data["checkoutModel"];
    } else {
      getBookingDetailBy(context);
    }
    if (paymentMethods.isNotEmpty) {
      method = paymentMethods[0].slug;
    } else {
      final common = Provider.of<CommonApiProvider>(context, listen: false);
      await common.getPaymentMethodList(context);
      await Future.delayed(Durations.short3);
      method = paymentMethods[0].slug;
    }
    notifyListeners();
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

  onSelectPaymentMethod(index, data) {
    selectIndex = index;
    isWallet = false;
    method = data;
    log("selectIndex :$method");
    notifyListeners();
  }

  onContinue(context) {
    showDialog(
        context: context,
        builder: (context1) {
          return AlertDialogCommon(
              isBooked: true,
              title: appFonts.successfullyBooked,
              widget: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(children: [
                        Image.asset(eImageAssets.booked, height: Sizes.s145),
                        SizedBox(
                                height: Sizes.s34,
                                width: Sizes.s34,
                                child: Image.asset(eGifAssets.tick,
                                    height: Sizes.s34, width: Sizes.s34))
                            .paddingOnly(left: Insets.i13, top: Insets.i25)
                      ]))
                  .paddingSymmetric(vertical: Insets.i20)
                  .decorated(
                      color: appColor(context).fieldCardBg,
                      borderRadius: BorderRadius.circular(AppRadius.r10)),
              subtext: appFonts.yourBookingHasBeen,
              bText1: appFonts.goToBookingList,
              height: Sizes.s145,
              b1OnTap: () async {
                method = paymentMethods[0].slug;
                route.pushNamedAndRemoveUntil(context, routeName.dashboard);
                final dash =
                    Provider.of<DashboardProvider>(context, listen: false);
                final common =
                    Provider.of<CommonApiProvider>(context, listen: false);
                common.selfApi(context);
                final wallet =
                    Provider.of<WalletProvider>(context, listen: false);
                wallet.getWalletList(context);
                dash.selectIndex = 1;
                dash.notifyListeners();
                //  dash.getBookingHistory(context);
                final cartCtrl =
                    Provider.of<CartProvider>(context, listen: false);
                cartCtrl.checkoutModel = null;
                cartCtrl.isPayment = true;
                cartCtrl.cartList = [];
                isWallet = false;
                selectIndex = 0;
                method = null;
                notifyListeners();

                cartCtrl.notifyListeners();
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.remove(session.cart);
                cartCtrl.notifyListeners();
              });
        });
  }

  onTapWallet(context) async {
    isWallet = !isWallet;
    notifyListeners();
    if (isWallet) {
      selectIndex = null;
    }
    notifyListeners();
  }

  //booking detail by id
  getBookingDetailBy(context) async {
    try {
      await apiServices
          .getApi("${api.booking}/$bookingId", [], isToken: true, isData: true)
          .then((value) {
        debugPrint("BOOKING DATA : ${value.data}");

        if (value.isSuccess!) {
          booking = BookingModel.fromJson(value.data);
          notifyListeners();
        }
      });
      log("STATYS L $booking");
    } catch (e) {
      notifyListeners();
    }
  }

  //booking payment
  bookingPayment(context) async {
    try {
      showLoading(context);
      notifyListeners();
      log("bookingId :${booking!.extraCharges}");
      var body = {
        "booking_id": bookingId,
        "payment_method": method,
        "type": booking!.extraCharges == null || booking!.extraCharges!.isEmpty
            ? "booking"
            : "extra_charge"
      };

      log("checkoutBody: $body");
      await apiServices
          .postApi(api.extraPaymentCharge, body, isData: true, isToken: true)
          .then((value) async {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          route
              .pushNamed(context, routeName.checkoutWebView, arg: value.data)
              .then((e) async {
            log("SSS :$e");
            if (e != null) {
              log("value.data[sss :${value.data}");
              if (e['isVerify'] == true) {
                log("value.data[sdsafdsfs :${value.data}");
                log("value.data[ :${value.data}");
                await getVerifyPayment(value.data['item_id'], context);
              } else {
                log("value.data[sss :${value.data}");
                snackBarMessengers(context,
                    message: "Payment Failed", color: appColor(context).red);
              }
            } else {
              log("value.data[sss :${value.data}");
              snackBarMessengers(context,
                  message: "Payment Failed", color: appColor(context).red);
            }
          });
          notifyListeners();
        } else {
          snackBarMessengers(context, message: value.message);
        }
      });
    } catch (e) {
      hideLoading(context);
      snackBarMessengers(context, message: e);
      notifyListeners();
    }
  }

  //re-payment
  rePayment(context, itemId, {pay}) async {
    try {
      showLoading(context);
      notifyListeners();
      var body = {
        "item_id": itemId,
        "payment_method": pay ?? method,
        "type": "booking"
      };

      log("checkoutBody: $body");
      await apiServices
          .postApi(api.repayment, body, isData: true, isToken: true)
          .then((value) async {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          route
              .pushNamed(context, routeName.checkoutWebView, arg: value.data)
              .then((e) async {
            log("SSS :$e");
            if (e != null) {
              log("value.data[sss :${value.data}");
              if (e['isVerify'] == true) {
                log("value.data[sdsafdsfs :${value.data}");
                log("value.data[ :${value.data}");
                await getVerifyPayment(value.data['item_id'], context);
              } else {
                log("value.data[sss :${value.data}");
                snackBarMessengers(context,
                    message: "Payment Failed", color: appColor(context).red);
              }
            } else {
              log("value.data[sss :${value.data}");
              snackBarMessengers(context,
                  message: "Payment Failed", color: appColor(context).red);
            }
          });
          notifyListeners();
        } else {
          snackBarMessengers(context, message: value.message);
        }
      });
    } catch (e) {
      hideLoading(context);
      snackBarMessengers(context, message: e);
      notifyListeners();
    }
  }

  addToCartOrBooking(context) {
    log("bookingId :$bookingId");
    log("bookingIdaa :$method");
    if (isRePayment) {
      rePayment(context, itemId);
    } else {
      if (bookingId == 0) {
        proceedToBook(context);
      } else {
        if (method == "cash") {
          updateStatus(context, "completed");
        } else if (method == "wallet") {
          updateStatus(context, "completed");
        } else {
          log("isRePayment:$isRePayment");
          if (isRePayment) {
            rePayment(context, itemId);
          } else {
            bookingPayment(context);
          }
        }
      }
    }
  }

  //update status
  updateStatus(context, status, {isCancel = false, sync, id}) async {
    log("NOCHANGE");
    try {
      showLoading(context);

      notifyListeners();
      dynamic data;
      if (isCancel) {
        route.pop(context);

        data = {
          "booking_status": "cancel",
          "reason": "Payment Failed",
        };
      } else {
        data = {"booking_status": status};
      }

      log("ON L$data");
      await apiServices
          .putApi("${api.booking}/${isCancel ? id : booking!.id}", data,
              isToken: true, isData: true)
          .then((value) async {
        log("value.isSuccess!:${value.isSuccess!}");
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          notifyListeners();
          if (status == "completed") {
            isWallet = false;
            selectIndex = 0;
            method = null;
            completeSuccess(context);
          } else {
            log("itemIditemId :$itemId");
            notifyListeners();
            await getVerifyPayment(context, itemId);
            route.pushNamedAndRemoveUntil(context, routeName.dashboard);
            final dash = Provider.of<DashboardProvider>(context, listen: false);
            dash.selectIndex = 1;
            dash.notifyListeners();
            dash.getBookingHistory(context);
            final cartCtrl = Provider.of<CartProvider>(context, listen: false);
            cartCtrl.checkoutModel = null;
            cartCtrl.isPayment = true;
            cartCtrl.cartList = [];
            isWallet = false;
            selectIndex = 0;
            method = null;
            cartCtrl.notifyListeners();
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.remove(session.cart);
            cartCtrl.notifyListeners();
          }
        } else {
          log("MMEES : ${value.message}");
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
      hideLoading(context);
      notifyListeners();
    } catch (e) {
      log("EEEE :$e");
      hideLoading(context);
      snackBarMessengers(context, message: e, color: appColor(context).red);
      notifyListeners();
    }
  }

  completeSuccess(context) {
    showCupertinoDialog(
        context: context,
        builder: (context1) {
          return AlertDialogCommon(
              title: appFonts.successfullyComplete,
              height: Sizes.s140,
              image: eGifAssets.successGif,
              subtext: language(context, appFonts.areYouSureComplete),
              bText1: language(context, appFonts.viewBillDetails),
              b1OnTap: () {
                route.pop(context);

                route.pushNamed(context, routeName.completedServiceScreen,
                    arg: {"booking": booking});
              });
        });
  }

  proceedToBook(context) async {
    try {
      showLoading(context);
      notifyListeners();
      var body = checkoutBody;
      body["payment_method"] = isWallet ? "wallet" : method;
      checkoutBody = body;
      notifyListeners();
      log("checkoutBody: $checkoutBody");
      await apiServices
          .postApi(api.booking, body, isData: true, isToken: true)
          .then((value) async {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          log("SHHHH :${value.data}");
          if (body["payment_method"] == "cash") {
            onContinue(context);
          } else if (body["payment_method"] == "wallet") {
            onContinue(context);
            final wallet = Provider.of<WalletProvider>(context, listen: false);
            wallet.getWalletList(context);
          } else {
            route
                .pushNamed(context, routeName.checkoutWebView, arg: value.data)
                .then((e) async {
              log("SSS :$e");
              if (e != null) {
                log("value.data[sss :${value.data}");
                if (e['isVerify'] == true) {
                  log("value.data[sdsafdsfs :${value.data}");
                  log("value.data[ :${value.data}");
                  await getVerifyPayment(value.data['item_id'], context);
                } else {
                  showLayout(context, value.data['item_id']);
                }
              } else {
                showLayout(context, value.data['item_id']);
              }
            });
          }
          notifyListeners();
        } else {
          log("SHHHH ::;:${value.data} //${value.message}");
          snackBarMessengers(context, message: value.data);
        }
      });
    } catch (e) {
      hideLoading(context);
      log("SHHHH:${e}");
      notifyListeners();
    }
  }

  showLayout(context, id) async {
    showDialog(
      context: context,
      builder: (context1) {
        return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: Insets.i20),
            shape: const SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.all(SmoothRadius(
                    cornerRadius: AppRadius.r14, cornerSmoothing: 1))),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, appFonts.selectOne),
                    style: appCss.dmDenseBold18
                        .textColor(appColor(context).darkText)),
                const Icon(CupertinoIcons.multiply)
                    .inkWell(onTap: () => route.pop(context))
              ]),
              Image.asset(eImageAssets.bulletDotted)
                  .paddingSymmetric(vertical: Insets.i8),
              Text(language(context, appFonts.areYouSureYouWantToCancelBooking),
                  textAlign: TextAlign.center,
                  style: appCss.dmDenseBold18.textColor(appColor(context).red)),
              Image.asset(eImageAssets.bulletDotted)
                  .paddingSymmetric(vertical: Insets.i12),
              Text(language(context, appFonts.optionForOrder),
                  textAlign: TextAlign.center,
                  style: appCss.dmDenseLight14
                      .textColor(appColor(context).darkText)),
              const VSpace(Sizes.s25),
              ...appArray.selectRepaymentOrCancel
                  .asMap()
                  .entries
                  .map((e) => e.value['title'] == appFonts.cashOnDelivery
                      ? appSettingModel!.activation!.cash == "1"
                          ? SelectOrderCancelOrRepayment(
                              data: e.value,
                              index: e.key,
                              list: appArray.selectRepaymentOrCancel,
                              onTap: () {
                                if (e.value['title'] ==
                                    appFonts.cancelBooking) {
                                  itemId = id.toString();
                                  notifyListeners();

                                  updateStatus(context, "cancel",
                                      isCancel: true, id: id);
                                } else if (e.value['title'] ==
                                    appFonts.cashOnDelivery) {
                                  route.pop(context);
                                  rePayment(context, id, pay: "cash");
                                  isRePayment = true;
                                  notifyListeners();
                                  // getImage(context, ImageSource.camera);
                                } else {
                                  route.pop(context);
                                  isRePayment = true;
                                  bookingId = int.parse(id.toString());
                                  itemId = id.toString();
                                  notifyListeners();
                                }
                              })
                          : Container()
                      : SelectOrderCancelOrRepayment(
                          data: e.value,
                          index: e.key,
                          list: appArray.selectRepaymentOrCancel,
                          onTap: () {
                            if (e.value['title'] == appFonts.cancelBooking) {
                              itemId = id.toString();
                              notifyListeners();

                              updateStatus(context, "cancel",
                                  isCancel: true, id: id);
                            } else if (e.value['title'] ==
                                appFonts.cashOnDelivery) {
                              route.pop(context);
                              rePayment(context, id, pay: "cash");
                              isRePayment = true;
                              notifyListeners();
                            } else {
                              route.pop(context);
                              isRePayment = true;
                              itemId = id.toString();
                              notifyListeners();
                            }
                          }))
            ]));
      },
    );
  }

//verify payment
  getVerifyPayment(data, context) async {
    log("OIIII ssss $data");
    log("OIIII ssss $itemId");
    try {
      String id = itemId ?? data.toString();
      log("VERIIFY L$id");
      await apiServices
          .getApi("${api.verifyPayment}?item_id=$id&type=booking", null,
              isToken: true)
          .then((value) {
        log("CALUE :${value.isSuccess}");
        log("CALUE :${value.message}");
        method = paymentMethods[0].slug;
        if (value.isSuccess!) {
          if (bookingId == 0) {
            onContinue(context);
          } else {
            log("OIIII");
            if (itemId == null) {
              updateStatus(context, "completed");
            }
          }
        }
      });
    } catch (e) {
      log("djhsgfkdg getVerifyPayment:$e");
      notifyListeners();
    }
  }
}
