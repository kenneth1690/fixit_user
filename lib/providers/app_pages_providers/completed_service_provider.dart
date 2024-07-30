import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:fixit_user/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../firebase/firebase_api.dart';
import '../../models/status_booking_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../screens/app_pages_screens/completed_service_screen/layouts/pdf_view_screen.dart';
import '../../widgets/alert_message_common.dart';

class CompletedServiceProvider with ChangeNotifier {
  List<StatusBookingModel> bookingList = [];
  BookingModel? booking;
  double valDownload = 0.0;
  String? localPath;
  String progress = "";
  bool isDownloading = false;
  double uploadProgress = 0.0;
  double perc = 0.0;

  onReady(context) {
    dynamic arg = ModalRoute.of(context)!.settings.arguments;
    if (arg['bookingId'] != null) {
      getBookingDetailBy(context, id: arg['bookingId']);
    } else {
      booking = arg['booking'];
      notifyListeners();
      getBookingDetailBy(context);
    }
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

  Future<void> _prepareSaveDir() async {
    localPath = (await _findLocalPath())!;

    print(localPath);
    final savedDir = Directory(localPath!);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    if (Platform.isAndroid) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }

  download(context) async {
    valDownload = 0.0;
    notifyListeners();
    isDownloading = true;

    try {
      var savePath =
          '/storage/emulated/0/Download/${booking!.bookingNumber}.pdf';
      var dio = Dio();
      dio.interceptors.add(LogInterceptor());
      try {
        var response = await dio.get(
          booking!.invoiceUrl!,
          onReceiveProgress: showDownloadProgress,
          //Received data with List<int>
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: Duration(seconds: 0),
          ),
        );
        var file = File(savePath);

        if (response.statusCode == 200) {
          // response.data is List<int> type
          file.writeAsBytes(response.data);
          //    raf.writeFromSync(response.data);
          isDownloading = false;
          progress = "";
          notifyListeners();
          snackBarMessengers(context,message: language(context, appFonts.invoiceDownload),color: appColor(context).primary);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //booking payment
  bookingPayment(context, isCash) async {
    try {
      showLoading(context);
      notifyListeners();
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
        log("booking/payment :${value.data} //${value.message}");
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
                  log("value.data[sss :${value.message}");
                  snackBarMessengers(context,
                      message: "Payment Failed", color: appColor(context).red);
                }
              } else {
                log("value.data[sss s:${value.data}");
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

  //update status
  updateStatus(context, status, {isCancel = false, sync}) async {
    log("NOCHANGE");
    try {
      showLoading(context);

      notifyListeners();
      dynamic data;
      data = {"booking_status": status};
      log("ON L$data");
      await apiServices
          .putApi("${api.booking}/${booking!.id}", data,
              isToken: true, isData: true)
          .then((value) {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          debugPrint("STATYS YYYY:  ${value.data}");
          booking = BookingModel.fromJson(value.data);
          getBookingDetailBy(context);

          notifyListeners();
          if (status == appFonts.completed) {
            completeSuccess(
              context,
            );
          }
        }
      });
      hideLoading(context);
      notifyListeners();
    } catch (e) {
      hideLoading(context);
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
            route.pushNamed(context, routeName.completedServiceScreen,
                arg: {"booking": booking}).then(() {
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

  paySuccess(context) {
    if (booking!.paymentMethod == "cash") {
      bookingPayment(context, true);
    } else {
      bookingPayment(context, false);
    }
  }

//verify payment
  getVerifyPayment(data, context) async {
    try {
      await apiServices
          .getApi(
              "${api.verifyPayment}?item_id=${data['item_id']}&type=booking",
              [],
              isToken: true,
              isData: true)
          .then((value) {
        if (value.isSuccess!) {
          if (value.data["payment_status"].toString().toLowerCase() ==
              "pending") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(language(context, appFonts.yourPaymentIsDeclined)),

              backgroundColor: appColor(context).red,
            ));
          } else {
            log("CCCCC");
            updateStatus(context, appFonts.completed);
            getBookingDetailBy(context);
          }
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      valDownload = (received / total * 100);
      debugPrint((received / total * 100).toStringAsFixed(0) + '%');
      FirebaseApi().sendNotification(
          title: "Invoice Download",
          msg: "$valDownload% Invoice Downloaded",
          token: userModel!.fcmToken);
    }
    notifyListeners();
  }
}
