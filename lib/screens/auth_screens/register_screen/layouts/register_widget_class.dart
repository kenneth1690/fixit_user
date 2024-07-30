import 'package:country_list_pick/country_list_pick.dart';
import 'package:fixit_user/config.dart';
import 'package:fixit_user/widgets/country_picker_custom/country_code_custom.dart';
import 'package:flutter/gestures.dart';

class RegisterWidgetClass {
  //not member
  Widget notMember(context) => RichText(
          text: TextSpan(
              text: language(context, appFonts.alreadyMember),
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).lightText),
              children: <TextSpan>[
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => route.pop(context),
                text: " ${language(context, appFonts.loginUp)}",
                style: appCss.dmDenseSemiBold16
                    .textColor(appColor(context).primary))
          ])).alignment(Alignment.center);

  //phone textBox
  Widget phoneTextBox(context,controller,focus,{Function(CountryCodeCustom?)? onChanged,ValueChanged<String>? onFieldSubmitted,double? hPadding,dialCode}) =>
      Consumer2<ProfileDetailProvider,RegisterProvider>(builder: (context1, value,register, child) {
          return IntrinsicHeight(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
               CountryListLayout(onChanged: onChanged,dialCode: dialCode,),
              const HSpace(Sizes.s4),
              Expanded(
                  child: TextFieldCommon(
                      keyboardType: TextInputType.number,
                      validator: (phone) => Validation().phoneValidation(context,phone),
                      controller:controller ,
                      onFieldSubmitted: onFieldSubmitted,
                      focusNode: focus,
                      isNumber: true,
                      hintText: language(context, appFonts.enterPhoneNumber)))
            ]).paddingSymmetric(horizontal: hPadding ?? Insets.i20),
          );
        }
      );
}
