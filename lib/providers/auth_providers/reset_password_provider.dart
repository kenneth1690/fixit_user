import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/widgets/alert_dialog_common.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class ResetPasswordProvider extends ChangeNotifier {
  TextEditingController txtNewPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  GlobalKey<FormState> resetFormKey = GlobalKey<FormState>();
  bool isNewPassword = true, isConfirmPassword = true;
  String? email, otp;
  Future<ui.Image>? loadingImage;

  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  double slider = 4.0;

  //new password see tap
  newPasswordSeenTap() {
    isNewPassword = !isNewPassword;
    notifyListeners();
  }

  //confirm password see tap
  confirmPasswordSeenTap() {
    isConfirmPassword = !isConfirmPassword;
    notifyListeners();
  }

  reset(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (resetFormKey.currentState!.validate()) {
      resetPassword(context);
    }

  }

  resetPassword(context) async {
    showLoading(context);
    notifyListeners();

    var body = {
      "password": txtNewPassword.text,
      "password_confirmation": txtConfirmPassword.text,
      "otp": otp,
      "email": email
    };

    try {
      await apiServices.postApi(api.updatePassword, jsonEncode(body)).then((value) {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          showCupertinoDialog(
            context: context,
            builder: (context1) {
              return AlertDialogCommon(
                title: appFonts.successfullyChanged,
                height: Sizes.s140,
                image: eGifAssets.successGif,
                subtext: language(context, appFonts.thankYou),
                bText1: language(context, appFonts.loginAgain),
                b1OnTap: () {
                  txtNewPassword.text = "";
                  txtConfirmPassword.text = "";
                  notifyListeners();
                  Navigator.pop(context1);


                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MultiProvider(
                              providers: [
                                ChangeNotifierProvider(
                                    create: (_) => LoginProvider()),
                                ChangeNotifierProvider(
                                    create: (_) =>
                                        ForgetPasswordProvider()),
                                ChangeNotifierProvider(
                                    create: (_) =>
                                        VerifyOtpProvider()),
                              ],
                              child: const LoginScreen(),
                              builder: (context, child) {
                                return child!;
                              })));
                },
              );
            },
          );
        } else {
          log("VVVV : ${value.message}");
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
    }
  }

  static getDisposableProviders(BuildContext context) {
    return [
      Provider.of<LoginProvider>(context, listen: false),
      //...other disposable providers
    ];
  }

  static void disposeAllDisposableProviders(BuildContext context) {
    getDisposableProviders(context).forEach((disposableProvider) {
      disposableProvider.dispose();
    });
  }

  getArg(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    email = data['email'];
    otp = data['otp'];
    notifyListeners();
  }

  Future<ui.Image> loadImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
}
