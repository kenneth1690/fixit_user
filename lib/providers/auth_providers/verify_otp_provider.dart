import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit_user/config.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';

class VerifyOtpProvider with ChangeNotifier {
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? phone, dialCode, verificationCode, min, sec, email;
  bool isCodeSent = false, isCountDown = false, isEmail = false;
  Timer? countdownTimer;
  final FocusNode phoneFocus = FocusNode();
  Duration myDuration = const Duration(seconds: 60);

  onTapVerify(context) {
    if (otpKey.currentState!.validate()) {
      if (isEmail) {
        verifyOtp(context);
      } else {
        onFormSubmitted(context);
      }
    }
  }

  //on form submit
  void onFormSubmitted(context) async {
    showLoading(context);
    notifyListeners();

    debugPrint("verificationCode : $verificationCode");
    PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationCode!, smsCode: otpController.text);

    firebaseAuth
        .signInWithCredential(authCredential)
        .then((UserCredential value) async {
      if (value.user != null) {
        login(context);
      } else {
        hideLoading(context);
        notifyListeners();
        snackBarMessengers("SOMETHING WENT WRONG",
            color: appColor(context).red);
      }
    }).catchError((error) {
      hideLoading(context);
      notifyListeners();
      snackBarMessengers(error.toString(),
          color: appColor(context).red);
    });
  }

  //verify otp
  verifyOtp(context) async {
    showLoading(context);
    notifyListeners();

    var body = {"otp": otpController.text, "email": email};
    log("body : $body");

    try {
      await apiServices.postApi(api.verifyOtp, jsonEncode(body)).then((value) {
        hideLoading(context);
        log("SSSS : ${value.isSuccess}");
        notifyListeners();
        if (value.isSuccess!) {
          route.pushNamed(context, routeName.resetPass,
              arg: {"otp": otpController.text, "email": email});
        } else {
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("CATCH verifyOtp: $e");
    }
  }

  defaultTheme(context) {
    final defaultPinTheme = PinTheme(
        textStyle: appCss.dmDenseSemiBold18
            .textColor(appColor(context).darkText),
        width: Sizes.s55,
        height: Sizes.s48,
        decoration: BoxDecoration(
            color: appColor(context).whiteBg,
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(color: appColor(context).whiteBg)));
    return defaultPinTheme;
  }

  getArgument(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    if (data['email'] != null) {
      isEmail = true;
      email = data["email"].toString();
    } else {
      isEmail = false;
      phone = data["phone"].toString();
      dialCode = data["dialCode"].toString();
      verificationCode = data["verificationCode"].toString();

      startTimer();
    }
    log("ARG : $data");
    notifyListeners();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    notifyListeners();
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      isCountDown = false;
      countdownTimer!.cancel();
    } else {
      isCountDown = true;
      myDuration = Duration(seconds: seconds);
    }
    notifyListeners();
    String strDigits(int n) => n.toString().padLeft(2, '0');
    min = strDigits(myDuration.inMinutes.remainder(60));
    sec = strDigits(myDuration.inSeconds.remainder(60));
    notifyListeners();
  }

  //resend code
  resendCode(context) {
    showLoading(context);
    notifyListeners();

    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {}

    verificationFailed(FirebaseAuthException authException) {
      hideLoading(context);
      notifyListeners();
    }

    codeSent(String verificationId, [int? forceResendingToken]) async {
      verificationCode = verificationId;
      hideLoading(context);
      notifyListeners();
    }

    codeAutoRetrievalTimeout(String verificationId) {
      verificationCode = verificationId;
      hideLoading(context);
      notifyListeners();
      log("codeAutoRetrievalTimeout : $verificationCode");
      startTimer();
    }

    //   Change country code

    firebaseAuth.verifyPhoneNumber(
        phoneNumber: "$dialCode$phone",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  //login
  login(context) async {
    String token = await getFcmToken();
    var body = {
      "login_type": "phone",
      "user": {"phone": phone, "code": dialCode},
      'fcm_token': token
    };

    log("body : $body");

    try {
      await apiServices
          .postApi(api.socialLogin, jsonEncode(body))
          .then((value) async {
        hideLoading(context);
        log("VVVV : ${value.isSuccess}");
        notifyListeners();
        if (value.isSuccess!) {
          SharedPreferences pref = await SharedPreferences.getInstance();

          pref.setBool(session.isContinueAsGuest, false);
          final commonApi =
              Provider.of<CommonApiProvider>(context, listen: false);
          await commonApi.selfApi(context);
          dynamic userData = pref.getString(session.user);
          if (userData != null) {

            final locationCtrl =
            Provider.of<LocationProvider>(context, listen: false);
            pref.remove(session.isContinueAsGuest);
            locationCtrl.getUserCurrentLocation(context);
            locationCtrl.getLocationList(context);
            locationCtrl.getCountryState();
            final favCtrl =
            Provider.of<FavouriteListProvider>(context, listen: false);
            favCtrl.getFavourite();
            final cartCtrl = Provider.of<CartProvider>(context, listen: false);
            cartCtrl.onReady(context);
            final notifyCtrl =
            Provider.of<NotificationProvider>(context, listen: false);
            notifyCtrl.getNotificationList(context);
          }
          snackBarMessengers(context,
              message: value.message, color: appColor(context).primary);
          route.pushReplacementNamed(context, routeName.dashboard);
        } else {
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("CATCH login: $e");
    }
  }
}
