import '../../../config.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgetPasswordProvider>(builder: (forgotCtrl, value, child) {
      return LoadingComponent(
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
                      image: eImageAssets.forgetPass,
                      title: appFonts.forgetPass,
                      subTitle: appFonts.enterYourRegister,
                      isNumber: false),
                ),
              ],
            ),
            Stack(children: [
              const FieldsBackground(),
              Form(
                  key: value.forgetKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          const SmallContainer(),
                          const HSpace(Sizes.s20),
                          Text(language(context, appFonts.emailPhone),
                              style: appCss.dmDenseSemiBold14.textColor(
                                  appColor(context).darkText))
                        ]),
                        const VSpace(Sizes.s8),
                        TextFieldCommon(
                                validator: (pass) =>
                                    Validation().emailValidation(context,pass),
                                controller: value.forgetController,
                                focusNode: value.emailFocus,
                                hintText:
                                    language(context, appFonts.email),
                                prefixIcon: eSvgAssets.lock)
                            .paddingSymmetric(horizontal: Insets.i20),
                        const VSpace(Sizes.s40),
                        ButtonCommon(
                            title: appFonts.sendOtp,
                            margin: Insets.i20,
                            onTap: () => value.onTapSendOtp(context)),
                      ]).paddingSymmetric(vertical: Insets.i20))
            ]).paddingSymmetric(horizontal: Insets.i20)
          ])))));
    });
  }
}

