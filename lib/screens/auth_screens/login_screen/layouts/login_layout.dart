import 'package:flutter/gestures.dart';

import '../../../../config.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, value, child) {
      return Stack(children: [
        const FieldsBackground(),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const SmallContainer(),
                const HSpace(Sizes.s20),
                Text(language(context, appFonts.email),
                    style: appCss.dmDenseSemiBold14
                        .textColor(appColor(context).darkText))
              ]),
              const VSpace(Sizes.s8),
              TextFieldCommon(
                      validator: (email) =>
                          Validation().emailValidation(context, email),
                      controller: value.emailController,
                      hintText: language(context, appFonts.enterEmail),
                      focusNode: value.emailFocus,
                      onFieldSubmitted: (val) => validation.fieldFocusChange(
                          context, value.emailFocus, value.passwordFocus),
                      prefixIcon: eSvgAssets.email)
                  .paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s15),
              Row(children: [
                const SmallContainer(),
                const HSpace(Sizes.s20),
                Text(language(context, appFonts.password),
                    style: appCss.dmDenseSemiBold14
                        .textColor(appColor(context).darkText))
              ]),
              const VSpace(Sizes.s8),
              TextFieldCommon(
                      validator: (pass) =>
                          Validation().passValidation(context, pass),
                      controller: value.passwordController,
                  suffixIcon: SvgPicture.asset(
                      value.isPassword
                          ? eSvgAssets.hide
                          : eSvgAssets.eye,
                      fit: BoxFit.scaleDown)
                      .inkWell(onTap: () => value.passwordSeenTap()),
                      hintText: language(context, appFonts.enterPassword),
                      focusNode: value.passwordFocus,
                      obscureText: value.isPassword,
                      prefixIcon: eSvgAssets.lock)
                  .paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s10),
              Text(language(context, appFonts.forgotPassword),
                      style: appCss.dmDenseSemiBold14
                          .textColor(appColor(context).primary))
                  .inkWell(
                      onTap: () => route.push(context, const ForgotPasswordScreen()))
                  .alignment(Alignment.bottomRight)
                  .paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s35),
              ButtonCommon(
                      title: appFonts.loginNow,
                      onTap: () => value.onLogin(context))
                  .paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s12),
              RichText(
                  text: TextSpan(
                      text: language(context, appFonts.notMember),
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).lightText),
                      children: <TextSpan>[
                    TextSpan(
                        text: language(context, appFonts.signUp),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              route.pushNamed(context, routeName.registerUser),
                        style: appCss.dmDenseSemiBold14
                            .textColor(appColor(context).primary))
                  ])).alignment(Alignment.center)
            ]).paddingSymmetric(vertical: Insets.i20)
      ]);
    });
  }
}
