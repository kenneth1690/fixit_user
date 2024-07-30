import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';

import '../config.dart';

flutterAlertMessage(context, {msg, bgColor}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor ?? Colors.red.withOpacity(0.8),
      textColor: appColor(context).whiteBg,
      fontSize: Sizes.s16);
}

void showSnackBar(scaffoldKey, context, {required String message, color}) {
  log(""" sf " $scaffoldKey""");
  scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Container(
          padding: const EdgeInsets.all(Insets.i15),
          decoration: BoxDecoration(
              color: color ?? appColor(context).red,
              borderRadius: BorderRadius.circular(AppRadius.r8)),
          child: Text(message.toString(),
              style:
                  appCss.dmDenseMedium16.textColor(appColor(context).whiteBg))),
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      padding: EdgeInsets.zero));
}

snackBarMessengers(context, {message, color, isDuration = false}) {
  ScaffoldMessenger.of(context).showSnackBar(isDuration
      ? SnackBar(
          duration: Duration(milliseconds: 500),
          content: Container(
              padding: const EdgeInsets.all(Insets.i15),
              decoration: BoxDecoration(
                  color: color ?? appColor(context).red,
                  borderRadius: BorderRadius.circular(AppRadius.r8)),
              child: Text(message.toString(),
                  style: appCss.dmDenseMedium16
                      .textColor(appColor(context).whiteBg))),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          padding: EdgeInsets.zero)
      : SnackBar(
          content: Container(
              padding: const EdgeInsets.all(Insets.i15),
              decoration: BoxDecoration(
                  color: color ?? appColor(context).red,
                  borderRadius: BorderRadius.circular(AppRadius.r8)),
              child: Text(message.toString(),
                  style: appCss.dmDenseMedium16
                      .textColor(appColor(context).whiteBg))),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          padding: EdgeInsets.zero));
  /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message.toString(),
          style: appCss.dmDenseMedium16.textColor(appColor(context).whiteBg)),
      backgroundColor: color ?? Colors.red.withOpacity(0.8)));*/
}
