import 'dart:async';
import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/status_booking_model.dart';
import '../../widgets/alert_message_common.dart';

class OngoingBookingProvider with ChangeNotifier {
  BookingModel? booking;
  TextEditingController onHoldCtrl = TextEditingController();
  final FocusNode reasonFocus = FocusNode();
  List<StatusBookingModel> bookingList = [];
  ScrollController scrollController = ScrollController();

  bool animate1 = false,
      animate2 = false,
      animate3 = false,
      isPayButton = false,
      isBottom = true;

  onBack(context, isBack) {
    isPayButton = false;
    booking = null;
    notifyListeners();
    if (isBack) {
      route.pop(context);
    }
  }

  onStart(context) {
    showDialog(
        context: context,
        builder: (context1) {
          return AlertDialogCommon(
              title: appFonts.startService,
              image: eGifAssets.restart,
              subtext: appFonts.areYouSureBeing,
              bText1: appFonts.startService,
              height: Sizes.s145,
              isBooked: true,
              widget: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        eImageAssets.restartBg,
                        width: Sizes.s150,
                      )),
                  Image.asset(
                    eGifAssets.restart,
                    height: Sizes.s137,
                  ),
                ],
              ).height(Sizes.s150).paddingOnly(bottom: Insets.i20).decorated(
                  color: appColor(context).fieldCardBg,
                  borderRadius: BorderRadius.circular(AppRadius.r10)),
              b1OnTap: () {
                route.pop(context);
                log("appFonts.onGoing:${appFonts.onGoing}");
                updateStatus(context, appFonts.onGoing);
              });
        });
  }

  onPauseConfirmation(context, {isHold = true}) {
    showDialog(
        context: context,
        builder: (context1) {
          return AlertDialogCommon(
              title: isHold ? appFonts.holdService : appFonts.restartService,
              image: isHold ? eImageAssets.hold : eImageAssets.complete1,
              subtext:
                  isHold ? appFonts.areYouSureHold : appFonts.areYouSureRestart,
              isBooked: true,
              bText1: isHold ? appFonts.pauseService : appFonts.restartService,
              height: Sizes.s145,
              widget: isHold
                  ? Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(eImageAssets.holdCloud,
                                              width: Sizes.s60),
                                          Image.asset(eGifAssets.hold,
                                              height: Sizes.s125,
                                              width: Sizes.s125),
                                        ])),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Image.asset(eImageAssets.hold,
                                            height: Sizes.s34,
                                            width: Sizes.s62,
                                            fit: BoxFit.fill)
                                        .paddingOnly(top: 20))
                              ]).width(Sizes.s223)
                            ],
                          ))
                      .paddingSymmetric(vertical: Insets.i20)
                      .decorated(
                          color: appColor(context).fieldCardBg,
                          borderRadius: BorderRadius.circular(AppRadius.r10))
                  : Stack(alignment: Alignment.bottomCenter, children: [
                      Image.asset(eGifAssets.restart, height: Sizes.s130)
                          .paddingOnly(top: Insets.i10),
                      ClipRRect(
                          borderRadius: SmoothBorderRadius(
                              cornerRadius: 12, cornerSmoothing: 1),
                          child: Image.asset(eImageAssets.restartCloud))
                    ]).decorated(
                      color: appColor(context).fieldCardBg,
                      borderRadius: BorderRadius.circular(AppRadius.r10)),
              b1OnTap: () {
                route.pop(context);
                if (isHold) {
                  onPauseBooking(context);
                } else {
                  updateStatus(context, appFonts.startAgain);
                }
              });
        });
  }

  onReady(context) {
    scrollController.addListener(listen);
    notifyListeners();
    dynamic arg = ModalRoute.of(context)!.settings.arguments;
    if (arg['bookingId'] != null) {
      getBookingDetailBy(context, id: arg['bookingId']);
    } else {
      booking = arg['booking'];
      notifyListeners();
      getBookingDetailBy(context);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void listen() {
    if (scrollController.position.pixels >= 200) {
      hide();
      notifyListeners();
    } else {
      show();
      notifyListeners();
    }
  }

  void show() {
    if (!isBottom) {
      isBottom = true;
      notifyListeners();
    }
    notifyListeners();
  }

  void hide() {
    if (isBottom) {
      isBottom = false;
      notifyListeners();
    }
    notifyListeners();
  }

  onRefresh(context) async {
    showLoading(context);
    notifyListeners();
    await getBookingDetailBy(context);
    hideLoading(context);
    notifyListeners();
  }

  //booking detail by id
  getBookingDetailBy(context, {id}) async {
    try {
      await apiServices
          .getApi("${api.booking}/${id ?? booking!.id}", [],
              isToken: true, isData: true)
          .then((value) {
        hideLoading(context);
        if (value.isSuccess!) {
          debugPrint("BOOKING DATA : ${value.data}");
          booking = BookingModel.fromJson(value.data);
          notifyListeners();
        }
      });
      log("STATYS L $booking");
    } catch (e) {
      hideLoading(context);
      notifyListeners();
    }
  }

  doneButtonTap(context, status, {isCancel = false, sync}) {
    route.pop(context);
    log("isPaymentComplete(booking!):${isPaymentComplete(booking!)}");
    if (isPaymentComplete(booking!)) {
      isPayButton = true;
    } else {
      isPayButton = false;
    }

    if (isPayButton == false) {
      updateStatus(context, appFonts.completed);
    }
    notifyListeners();
  }

/*  paySuccess(context) {
    route.pushNamed(context, routeName.paymentScreen,
        arg: {'bookingId': booking!.id}).then((e) async {
      log("PAYME :$e");
      if (e != null) {
        if (e['isVerify'] == true) {
          await getVerifyPayment(e['data'], context);
        }
      }
    });
  }*/

  //booking payment
  bookingPayment(context, isCash) async {
    showLoading(context);
    notifyListeners();
    log("bookingId :${booking!.extraCharges}");
    try {
      var body = {
        "booking_id": booking!.id,
        "payment_method": booking!.paymentMethod,
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
          if (isCash) {
            updateStatus(context, appFonts.completed);
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
          }
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

//verify payment
  getVerifyPayment(data, context) async {
    try {
      await apiServices
          .getApi("${api.verifyPayment}?item_id=$data&type=${booking!.extraCharges == null || booking!.extraCharges!.isEmpty
          ? "booking"
          : "extra_charge"}", [],
              isToken: true, isData: true)
          .then((value) {
        if (value.isSuccess!) {
          if (value.data["payment_status"].toString().toLowerCase() ==
              "pending") {
            log("EEEE xfgxdvgxdvsdd :${value.message}");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(language(context, appFonts.yourPaymentIsDeclined)),

              backgroundColor: appColor(context).red,

            ));
          } else {
            log("EEEE xfgsdd :${value.message}");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(language(context, appFonts.successfullyComplete)),
              backgroundColor: appColor(context).primary,

            ));
            updateStatus(context, appFonts.completed);
            getBookingDetailBy(context);
          }
        }else{
          log("EEEE xfg :${value.message}");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(language(context, value.message)),

            backgroundColor: appColor(context).red,

          ));
        }
      });
    } catch (e) {
      log("xfgjkhdfg :$e");
      notifyListeners();
    }
  }

  //update status
  updateStatus(context, status, {isCancel = false, sync}) async {
    log("NOCHANGE");
    try {
      showLoading(context);

      notifyListeners();
      dynamic data;
      if (isCancel) {
        route.pop(context);
        data = {"reason": onHoldCtrl.text, "booking_status": status};
      } else {
        data = {"booking_status": status};
      }
      log("ON L$data");
      await apiServices
          .putApi("${api.booking}/${booking!.id}", data,
              isToken: true, isData: true)
          .then((value) {
        hideLoading(context);
        notifyListeners();
        onHoldCtrl.text = "";
        if (value.isSuccess!) {
          debugPrint("STATYS YYYY:  ${value.data}");
          booking = BookingModel.fromJson(value.data);
          getBookingDetailBy(context);

          notifyListeners();
          if (status == "completed") {

            completeSuccess(
              context,
            );
          }
        }else{
          log("SSS :${value.data} // ${value.message}");
        }
      });
      hideLoading(context);
      notifyListeners();
    } catch (e) {
      log("SSS :$e");
      hideLoading(context);
      notifyListeners();
    }
  }

  paySuccess(context) {
    if (booking!.paymentMethod == "cash") {
      bookingPayment(context, true);
    }else  if (booking!.paymentMethod == "wallet") {
      bookingPayment(context, true);
    }  else {
      bookingPayment(context, false);
    }
  }

  onPauseBooking(context) {
    showDialog(
        context: context,
        builder: (context1) => AlertDialog(
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.symmetric(horizontal: Insets.i20),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppRadius.r14))),
            backgroundColor: appColor(context).whiteBg,
            content: Stack(alignment: Alignment.topRight, children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(language(context, appFonts.reason),
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).darkText)),
                    const VSpace(Sizes.s8),
                    TextFieldCommon(
                        controller: onHoldCtrl,
                        focusNode: reasonFocus,
                        isNumber: true,
                        hintText: appFonts.writeHere,
                        maxLines: 4,
                        minLines: 4,
                        fillColor: appColor(context).fieldCardBg),
                    // Sub text
                    const VSpace(Sizes.s15),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(language(context, "\u2022"),
                              style: appCss.dmDenseMedium14
                                  .textColor(appColor(context).lightText)),
                          const HSpace(Sizes.s10),
                          Expanded(
                              child: RichText(
                                  text: TextSpan(
                                      style: appCss.dmDenseMedium14.textColor(
                                          appColor(context).lightText),
                                      text: language(
                                          context, appFonts.pleaseReadThe),
                                      children: [
                                TextSpan(
                                    style: TextStyle(
                                        color: appColor(context).darkText,
                                        fontFamily:
                                            GoogleFonts.dmSans().fontFamily,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline),
                                    text: language(
                                        context, appFonts.cancellationPolicy)),
                                TextSpan(
                                    style: appCss.dmDenseMedium14
                                        .textColor(appColor(context).lightText),
                                    text: language(
                                        context, appFonts.beforeCancelling))
                              ])))
                        ]),
                    const VSpace(Sizes.s20),
                    ButtonCommon(
                        onTap: () {
                          if (onHoldCtrl.text.isNotEmpty) {
                            updateStatus(context, appFonts.onHold, isCancel: true);
                          } else {
                            Fluttertoast.showToast(msg: "Please Enter reason");
                          }
                        },
                        title: appFonts.submit)
                  ]).padding(
                  horizontal: Insets.i20, top: Insets.i60, bottom: Insets.i20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                // Title
                Text(language(context, appFonts.reasonOfHold),
                    style: appCss.dmDenseExtraBold16
                        .textColor(appColor(context).darkText)),
                Icon(CupertinoIcons.multiply,
                        size: Sizes.s20, color: appColor(context).darkText)
                    .inkWell(onTap: () => route.pop(context))
              ]).paddingAll(Insets.i20)
            ])));
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
            route
                .pushNamed(context, routeName.completedServiceScreen,arg: {"booking": booking})
                .then((e) {
              route.pushNamedAndRemoveUntil(context, routeName.dashboard);
              final dash =
                  Provider.of<DashboardProvider>(context, listen: false);
              dash.selectIndex = 1;
              dash.notifyListeners();
            });
          },
        );
      },
    );
  }

  //complete done confirmation
  completeConfirmation(context, sync) {
    showDialog(
        context: context,
        builder: (context1) {
          return StatefulBuilder(builder: (context2, setState) {
            return Consumer<OngoingBookingProvider>(
                builder: (context3, value, child) {
              return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: Insets.i20),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppRadius.r14))),
                  backgroundColor: appColor(context).whiteBg,
                  content: Stack(alignment: Alignment.topRight, children: [
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      // Gif
                      Stack(alignment: Alignment.topCenter, children: [
                        Stack(alignment: Alignment.topCenter, children: [
                          SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(children: [
                                    Stack(children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                              eImageAssets.completeBookingGirl,
                                              height: Sizes.s150)),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                            eGifAssets.completeBooking,
                                            height: Sizes.s55,
                                          ).paddingOnly(top: Insets.i10))
                                    ]).width(Sizes.s160)
                                  ]))
                              .paddingSymmetric(vertical: Insets.i5)
                              .decorated(
                                  color: appColor(context).fieldCardBg,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r10))
                        ])
                      ]),
                      // Sub text
                      const VSpace(Sizes.s15),
                      Text(language(context, appFonts.areYouSureComplete),
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
                                onTap: () => doneButtonTap(context, "completed",
                                    sync: this),
                                title: appFonts.yes))
                      ])
                    ]).padding(
                        horizontal: Insets.i20,
                        top: Insets.i60,
                        bottom: Insets.i20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title
                          Text(language(context, appFonts.completeService),
                              style: appCss.dmDenseExtraBold18
                                  .textColor(appColor(context).darkText)),
                          Icon(CupertinoIcons.multiply,
                                  size: Sizes.s20,
                                  color: appColor(context).darkText)
                              .inkWell(onTap: () => route.pop(context))
                        ]).paddingAll(Insets.i20)
                  ]));
            });
          });
        }).then((value) {
      notifyListeners();
    }).then((value) {
      log("SSSS555");
      animate1 = false;
      animate2 = false;
      animate3 = false;
      notifyListeners();
    });
  }
}
