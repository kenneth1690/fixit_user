import 'dart:developer';

import 'package:fixit_user/common_tap.dart';

import '../../../../config.dart';

class PersonalDetailLayout extends StatelessWidget {
  final String? email, phone, code;
  final List<KnownLanguageModel>? knownLanguage;

  const PersonalDetailLayout(
      {super.key, this.email, this.phone, this.knownLanguage, this.code});

  @override
  Widget build(BuildContext context) {
    log("phone :${phone != null && phone != "null"}");
    log("phone :$phone");
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      PersonalInfoRowLayout(
              icon: eSvgAssets.mail, title: appFonts.mail, content: email)
          .inkWell(onTap: () => commonUrlTap(context, email!)),
      if (phone != null && phone != "null")
        PersonalInfoRowLayout(
          icon: eSvgAssets.phone1,
          title: appFonts.call,
          content: "$code $phone",
        ).paddingSymmetric(vertical: Insets.i20),
      if (knownLanguage!.isNotEmpty)
        Row(children: [
          SvgPicture.asset(eSvgAssets.country,
              colorFilter: ColorFilter.mode(
                  appColor(context).lightText, BlendMode.srcIn)),
          const HSpace(Sizes.s6),
          Text(language(context, appFonts.knowLanguage),
              style:
                  appCss.dmDenseMedium12.textColor(appColor(context).lightText))
        ]),
      const VSpace(Sizes.s7),
      if (knownLanguage!.isNotEmpty)
        Wrap(
            direction: Axis.horizontal,
            children: knownLanguage!
                .asMap()
                .entries
                .map((e) =>
                    LanguageLayout(title: e.value.key).paddingOnly(bottom: 10))
                .toList())
    ])
        .paddingAll(Insets.i12)
        .boxShapeExtension(color: appColor(context).whiteBg);
  }
}
