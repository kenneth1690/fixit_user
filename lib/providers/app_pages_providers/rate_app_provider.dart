import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;

import 'package:fixit_user/config.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rate_my_app/rate_my_app.dart';
//import 'package:rate_my_app/rate_my_app.dart';

class RateAppProvider with ChangeNotifier {
  int selectedIndex = 0;
  bool isServiceRate = false, isServiceManRate = false;
  Reviews? review;
  String? serviceId, serviceManId;
  TextEditingController rateController = TextEditingController();
  final FocusNode rateFocus = FocusNode();

  GlobalKey<FormState> rateKey = GlobalKey<FormState>();

  onTapEmoji(index) {
    selectedIndex = index;
    notifyListeners();
  }

  //
  onSubmit(context) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (rateKey.currentState!.validate()) {
      if (isServiceRate) {
        rateService(context);
      } else {
        if (selectedIndex == 4) {
          rateBuilder(context);
          rateApp(context);
        } else {
          route.pushNamed(context, routeName.contactUs,
              arg: {'rate': selectedIndex, "desc": rateController.text});
        }
      }
    }
  }

  rateBuilder(context) async {
    /*  LaunchReview.launch(androidAppId: "com.webiots.chatzy",
        iOSAppId: "585027354");*/
    rateMyApp.init();
    rateMyApp
        .showRateDialog(
      context,
      title: 'Rate this app',
      // The dialog title.
      message:
          'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.',
      // The dialog message.
      rateButton: 'RATE',
      // The dialog "rate" button text.
      noButton: 'NO THANKS',
      // The dialog "no" button text.
      laterButton: 'MAYBE LATER',
      // The dialog "later" button text.
      listener: (button) {
        // The button click listener (useful if you want to cancel the click event).
        switch (button) {
          case RateMyAppDialogButton.rate:
            print('Clicked on "Rate".');
            break;
          case RateMyAppDialogButton.later:
            print('Clicked on "Later".');
            break;
          case RateMyAppDialogButton.no:
            print('Clicked on "No".');
            break;
        }

        return true; // Return false if you want to cancel the click event.
      },
      ignoreNativeDialog: Platform.isAndroid,
      // Set to false if you want to show the Apple's native app rating dialog on iOS or Google's native app rating dialog (depends on the current Platform).
      dialogStyle: const DialogStyle(),
      // Custom dialog styles.
      onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
          .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
      // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
      // actionsBuilder: (context) => [], // This one allows you to use your own buttons.
    )
        .then((value) {
      log("VALUE ");
    });
  }

  rateApp(context, {data}) async {
    showLoading(context);
    notifyListeners();
    dynamic body;
    if (data != null) {
      body = {
        "rating": selectedIndex,
        "description": rateController.text,
        "name": data['name'],
        "email": data['email'],
        "error_type": data['type'],
      };
    } else {
      body = {"rating": selectedIndex, "description": rateController.text};
    }

    try {
      await apiServices
          .postApi(api.rateApp, body, isToken: true)
          .then((value) async {
        hideLoading(context);

        notifyListeners();
        if (value.isSuccess!) {
          showDialog(
              context: context,
              builder: (context1) {
                return AlertDialogCommon(
                    title: appFonts.reviewSubmitted,
                    image: eImageAssets.review,
                    subtext: appFonts.yourReview,
                    bText1: appFonts.okay,
                    height: Sizes.s145,
                    b1OnTap: () {
                      route.pop(context);
                      route.pop(context);
                    });
              });
        } else {
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
    }
  }

  onReady(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    if (data != null) {
      if (data["review"] != null) {
        review = data["review"];
      }
      log("iSSS:$data");

      isServiceRate = data["isServiceRate"];
      serviceId = data["serviceId"]?.toString();
      serviceManId = data["servicemanId"]?.toString();
    }
    log("EEEE :$isServiceRate");
    notifyListeners();
  }

  rateService(context) async {
    showLoading(context);
    notifyListeners();
    dynamic body = {
      if (serviceId != null) "service_id": serviceId,
      if (serviceManId != null) "serviceman_id": serviceManId,
      "description": rateController.text,
      "rating": selectedIndex == 0
          ? 1
          : selectedIndex == 1
              ? 2
              : selectedIndex == 2
                  ? 3
                  : selectedIndex == 3
                      ? 4
                      : 5
    };

    log("BODU :$body");
    try {
      await apiServices
          .postApi(api.review, jsonEncode(body), isToken: true)
          .then((value) async {
        hideLoading(context);

        notifyListeners();
        if (value.isSuccess!) {
          showDialog(
              context: context,
              builder: (context1) {
                return AlertDialogCommon(
                  title: appFonts.successfullyChanged,
                  image: eImageAssets.review,
                  subtext: appFonts.yourReview,
                  bText1: appFonts.okay,
                  height: Sizes.s145,
                  b1OnTap: () {
                    route.pop(context);
                    route.pop(context);
                    selectedIndex = 3;
                    rateController.text = "";
                    notifyListeners();
                  },
                );
              });
        } else {
          log("value.message :${value.message}");
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
    } catch (e) {
      log("EEEE :$e");
      hideLoading(context);
      notifyListeners();
    }
  }
}
