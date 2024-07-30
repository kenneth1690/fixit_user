import 'dart:developer';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fixit_user/screens/app_pages_screens/add_new_location/layouts/county_drop_down.dart';
import 'package:fixit_user/screens/app_pages_screens/add_new_location/layouts/state_drop_down.dart';
import 'package:flutter/cupertino.dart';

import '../../../../config.dart';

class LocationTextFieldLayout extends StatelessWidget {
  const LocationTextFieldLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewLocationProvider>(builder: (context2, value, child) {
      return Consumer<LocationProvider>(
          builder: (context2, locationCtrl, child) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          textCommon.dmSensMediumDark14(context, text: appFonts.street),
          const VSpace(Sizes.s8),
          TextFieldCommon(
              validator: (add) => validation.addressValidation(context, add),
              controller: value.streetCtrl,
              hintText: appFonts.street,
              focusNode: value.streetFocus,
              prefixIcon: eSvgAssets.address),
          const VSpace(Sizes.s15),
          textCommon.dmSensMediumDark14(context, text: appFonts.country),
          const VSpace(Sizes.s8),
          const CountryDropDown(),
          const VSpace(Sizes.s15),
          textCommon.dmSensMediumDark14(context, text: appFonts.state),
          const VSpace(Sizes.s8),
          const StateDropDown(),
          const VSpace(Sizes.s18),
          Row(children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  textCommon.dmSensMediumDark14(context, text: appFonts.city),
                  const VSpace(Sizes.s8),
                  TextFieldCommon(
                      validator: (city) =>
                          validation.cityValidation(context, city),
                      controller: value.cityCtrl,
                      focusNode: value.cityFocus,
                      hintText: appFonts.city,
                      prefixIcon: eSvgAssets.cityLoc)
                ])),
            const HSpace(Sizes.s18),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  textCommon.dmSensMediumDark14(context,
                      text: appFonts.zipCode),
                  const VSpace(Sizes.s8),
                  TextFieldCommon(
                      validator: (zip) =>
                          validation.cityValidation(context, zip),
                      controller: value.zipCtrl,
                      focusNode: value.zipFocus,
                      hintText: appFonts.zipCode,
                      prefixIcon: eSvgAssets.zipcode)
                ]))
          ]),
          const VSpace(Sizes.s15),
          textCommon.dmSensMediumDark14(context, text: appFonts.personName),
          const VSpace(Sizes.s8),
          TextFieldCommon(
              controller: value.nameCtrl,
              validator: (zip) =>
                  validation.nameValidation(context, zip),
              focusNode: value.nameFocus,
              hintText: appFonts.personName,
              prefixIcon: eSvgAssets.user)
        ]);
      });
    });
  }
}
