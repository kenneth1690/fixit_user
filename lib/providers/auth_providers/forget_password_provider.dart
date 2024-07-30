import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';

class ForgetPasswordProvider with ChangeNotifier {
  TextEditingController forgetController = TextEditingController();
  GlobalKey<FormState> forgetKey = GlobalKey<FormState>();
  final FocusNode emailFocus = FocusNode();

  onTapSendOtp(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (forgetKey.currentState!.validate()) {
      forgetPassword(context);
    }
  }

  //forget password api
  forgetPassword(context) async {
    showLoading(context);
    var body = {
      "email": forgetController.text,
    };
    try {
      await apiServices.postApi(api.forgotPassword, jsonEncode(body)).then((value) {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          log("dfdxf : $value");

          route.pushNamed(context, routeName.verifyOtp,arg: {"email":forgetController.text});

          forgetController.text ="";
          notifyListeners();
        } else {
          log("dfdxf : $value");
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("CATCH : $e");
    }
  }
}
