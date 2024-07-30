import 'dart:developer';

import '../../../config.dart';
import 'layouts/reset_password_layout.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'dart:ui' as ui;
import 'package:syncfusion_flutter_core/theme.dart';



class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordProvider>(
        builder: (context1, resetPass, child) {
          log("RESET : ${resetPass.resetFormKey}");
      return LoadingComponent(
        child: StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms150).then((value) =>
              resetPass.loadingImage ==
              resetPass.loadImage(eImageAssets.userSlider)),
          child: Scaffold(
            
            appBar: AppBar(
              elevation: 0,

              leading: CommonArrow(
                  arrow: rtl(context)
                      ? eSvgAssets.arrowRight
                      : eSvgAssets.arrowLeft1,
                  onTap: ()=> route.pop(context))
                  .paddingOnly(left: rtl(context) ? 0: Insets.i20,right: rtl(context)? Insets.i20:0),
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(eImageAssets.appLogo,
                    height: Sizes.s34, width: Sizes.s34),
                const HSpace(Sizes.s5),
                Text(language(context, appFonts.fixit),
                    style: appCss.outfitBold38
                        .textColor(appColor(context).darkText)),
                const VSpace(Sizes.s30)
              ]),
            ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
            Form(
                key: resetPass.resetFormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
const VSpace(Sizes.s44),
                      Text(
                          language(context, appFonts.resetPassword)
                              .toUpperCase(),
                          style: appCss.dmDenseBold20
                              .textColor(appColor(context).darkText)),
                      const VSpace(Sizes.s5),
                      Text(language(context, appFonts.resetPasswordDesc),
                          style: appCss.dmDenseLight14
                              .textColor(appColor(context).lightText)),
                      const VSpace(Sizes.s15),
                      const ResetPasswordLayout()
                    ]).alignment(Alignment.centerLeft))
          ]).paddingSymmetric(horizontal: Insets.i20,)))),
        ),
      );
    });
  }
}

