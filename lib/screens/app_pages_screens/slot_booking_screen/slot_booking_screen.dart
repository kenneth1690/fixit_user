import 'dart:developer';

import 'package:fixit_user/screens/app_pages_screens/slot_booking_screen/layouts/bill_row_common.dart';
import 'package:fixit_user/screens/app_pages_screens/slot_booking_screen/layouts/step_one_layout.dart';
import 'package:fixit_user/screens/app_pages_screens/slot_booking_screen/layouts/step_two_layout.dart';

import '../../../config.dart';

class SlotBookingScreen extends StatelessWidget {
  const SlotBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context1, locationCtrl, child) {
      return Consumer<SlotBookingProvider>(builder: (context2, value, child) {
        return StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50)
              .then((_) => value.onReady(context)),
          child: PopScope(
            canPop: false,
            onPopInvoked: (pop) async {
              if (pop) {
                return;
              }
              value.onBack(context);
            },
            child: Scaffold(
               /* bottomNavigationBar: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: !value.isBottom?70 :0,
                  child: ButtonCommon(
                          title: value.buttonName(context),
                          margin: Insets.i20,
                          onTap: () => value.onTapNext(context))
                      .marginOnly(bottom: Insets.i20)
                      .backgroundColor(appColor(context).whiteBg),
                ),*/
                appBar: AppBarCommon(
                  title:
                      "${language(context, appFonts.step)} ${value.isStep2 == false ? "1" : "2"}",
                  onTap: () => value.onBack(context),
                ),
                body: value.isStep2 == false
                    ? const StepOneLayout()
                    : const StepTwoLayout()),
          ),
        );
      });
    });
  }
}
