import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit_user/config.dart';

class LoginWithPhoneProvider with ChangeNotifier {
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isCodeSent = false;
  String dialCode = "+506";
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FocusNode phoneFocus = FocusNode();
  String? verificationCode;

  onTapOtp(context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (globalKey.currentState!.validate()) {
      showLoading(context);
      notifyListeners();
      onVerifyCode(context);
    }
  }

  //on verify code
  void onVerifyCode(context) {


    verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {

    }

    verificationFailed(FirebaseAuthException authException) {
      hideLoading(context);
      notifyListeners();
    }

    codeSent(String verificationId, [int? forceResendingToken]) async {
      verificationCode = verificationId;
      hideLoading(context);
      notifyListeners();
      route.pushNamed(context, routeName.verifyOtp,
          arg: {"phone": numberController.text, "dialCode": dialCode,"verificationCode":verificationCode});

    }

    codeAutoRetrievalTimeout(String verificationId) {
      verificationCode = verificationId;
      hideLoading(context);
      notifyListeners();
      log("codeAutoRetrievalTimeout : $verificationCode");
    }

    //   Change country code

    firebaseAuth.verifyPhoneNumber(
        phoneNumber: "$dialCode${numberController.text}",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

  }

  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }
}
