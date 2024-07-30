import 'dart:developer';

import '../../../config.dart';
import 'layouts/common_otp_layout.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyOtpProvider>(builder: (context1, otpCtrl, child) {

      return LoadingComponent(
          child: StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50)
            .then((value) => otpCtrl.getArgument(context)),
        child: Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CommonArrow(
                        arrow: rtl(context)
                            ? eSvgAssets.arrowRight
                            : eSvgAssets.arrowLeft1,
                        onTap: ()=> route.pop(context))
                        .paddingAll(Insets.i20),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: AuthTopLayout(
                        image: eImageAssets.verifyOtp,
                        title: appFonts.verifyOtp,
                        subTitle: appFonts.enterTheCode,
                        isNumber: true,
                        number:otpCtrl.isEmail ? otpCtrl.email :  "${otpCtrl.dialCode} ${otpCtrl.phone}"),
                  ),
                ],
              ),
              Stack(children: [
                const FieldsBackground(),
                Form(
                    key: otpCtrl.otpKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContainerWithTextLayout(title: language(context, appFonts.enterOtp)),
                          const VSpace(Sizes.s8),
                          const CommonOtpLayout(),
                          const VSpace(Sizes.s20),
                          ButtonCommon(
                              title: appFonts.verifyProceed,
                              margin: Insets.i20,
                              onTap: () => otpCtrl.onTapVerify(context)),
                          const VSpace(Sizes.s15),
                          otpCtrl.isCountDown
                              ? Text("${otpCtrl.min} : ${otpCtrl.sec}",
                                      style: appCss.dmDenseMedium14.textColor(
                                          appColor(context).primary))
                                  .alignment(Alignment.center)
                              : Text(language(context, appFonts.resendCode),
                                      style: appCss.dmDenseMedium14.textColor(
                                          appColor(context).primary)).inkWell(onTap: ()=>otpCtrl.resendCode(context))
                                  .alignment(Alignment.center)
                        ]).paddingSymmetric(vertical: Insets.i20))
              ]).paddingSymmetric(horizontal: Insets.i20)
            ])))),
      ));
    });
  }
}
