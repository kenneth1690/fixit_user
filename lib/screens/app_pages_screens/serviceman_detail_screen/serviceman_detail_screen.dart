import 'package:fixit_user/providers/app_pages_providers/servicman_details_provider.dart';
import 'package:fixit_user/screens/app_pages_screens/serviceman_detail_screen/layouts/serviceman_detail_profile_layout.dart';

import '../../../config.dart';

class ServicemanDetailScreen extends StatelessWidget {
  const ServicemanDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicemanDetailProvider>(
        builder: (context1, value, child) {
      return StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50)
            .then((_) => value.onReady(context)),
        child: LoadingComponent(
          child: Scaffold(
              appBar: AppBarCommon(title: appFonts.servicemanDetail),
              body: value.provider != null
                  ? SingleChildScrollView(
                      child: Column(children: [
                      Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            ServicemanDetailProfileLayout(
                                image: eImageAssets.profile),
                            const VSpace(Sizes.s6),
                            IntrinsicHeight(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Text(value.provider!.name ?? "",
                                      style: appCss.dmDenseMedium14.textColor(
                                          appColor(context).darkText)),
                                  VerticalDivider(
                                          color:
                                              appColor(context).stroke,
                                          width: 1,
                                          thickness: 1,
                                          indent: 5,
                                          endIndent: 5)
                                      .paddingSymmetric(horizontal: Insets.i6),
                                  SvgPicture.asset(eSvgAssets.star),
                                  const HSpace(Sizes.s3),
                                  Text(
                                      value.provider!.reviewRatings != null
                                          ? value.provider!.reviewRatings
                                              .toString()
                                          : "0",
                                      style: appCss.dmDenseMedium13.textColor(
                                          appColor(context).darkText))
                                ])),
                            Text(
                                "${value.provider!.experienceDuration ?? "0"} ${value.provider!.experienceInterval  != null ?capitalizeFirstLetter(value.provider!.experienceInterval)  : "Years"}  ${appFonts.of} ${language(context, appFonts.experience)}",
                                style: appCss.dmDenseBold12.textColor(
                                    appColor(context).lightText)),
                            const VSpace(Sizes.s10),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(eSvgAssets.locationOut1,
                                      colorFilter: ColorFilter.mode(
                                          appColor(context).darkText,
                                          BlendMode.srcIn)),
                                  const HSpace(Sizes.s5),
                                  Text(
                                      "${value.provider!.primaryAddress!.address!}, ${value.provider!.primaryAddress!.area!}, ${value.provider!.primaryAddress!.city}",
                                      style: appCss.dmDenseMedium12.textColor(
                                          appColor(context).darkText))
                                ]),
                            const VSpace(Sizes.s15),
                            Image.asset(eImageAssets.bulletDotted),
                            const VSpace(Sizes.s15),
                            ServicesDeliveredLayout(
                                services: value.provider!.served ?? "0",
                                color: appColor(context)
                                    
                                    .primary
                                    .withOpacity(0.1)),
                            const VSpace(Sizes.s20),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(language(context, appFonts.personalInfo),
                                      style: appCss.dmDenseMedium14.textColor(
                                          appColor(context).darkText)),
                                  const VSpace(Sizes.s10),
                                  Column(children: [
                                    PersonalInfoRowLayout(
                                        icon: eSvgAssets.mail,
                                        title: appFonts.mail,
                                        content: value.provider!.email ?? ""),
                                    const VSpace(Sizes.s20),
                                    PersonalInfoRowLayout(
                                        icon: eSvgAssets.phone1,
                                        title: appFonts.call,
                                        content:
                                            "+${value.provider!.code} ${value.provider!.phone}")
                                  ])
                                      .paddingSymmetric(
                                          vertical: Insets.i12,
                                          horizontal: Insets.i15)
                                      .boxShapeExtension(
                                          color: appColor(context)
                                              
                                              .fieldCardBg),
                                  if (value
                                      .provider!.knownLanguages!.isNotEmpty)
                                    Text(
                                            language(
                                                context, appFonts.knowLanguage),
                                            style: appCss.dmDenseMedium14
                                                .textColor(appColor(context)
                                                    
                                                    .darkText))
                                        .alignment(Alignment.centerLeft)
                                        .paddingOnly(
                                            top: Insets.i20,
                                            bottom: Insets.i10),
                                  if (value
                                      .provider!.knownLanguages!.isNotEmpty)
                                    Wrap(
                                        direction: Axis.horizontal,
                                        children: value
                                            .provider!.knownLanguages!
                                            .asMap()
                                            .entries
                                            .map((e) => LanguageLayout(
                                                title: e.value.key))
                                            .toList()),
                                  if (value
                                      .provider!.knownLanguages!.isNotEmpty)
                                  const VSpace(Sizes.s20),
                                  if (value.provider!.expertise!.isNotEmpty)
                                    Text(
                                            language(
                                                context, appFonts.expertiseIn),
                                            style: appCss.dmDenseMedium14
                                                .textColor(appColor(context)
                                                    
                                                    .darkText))
                                        .alignment(Alignment.centerLeft),
                                  if (value.provider!.expertise!.isNotEmpty)
                                  const VSpace(Sizes.s10),
                                  if (value.provider!.expertise!.isNotEmpty)
                                  Wrap(
                                      direction: Axis.horizontal,
                                      children: value.provider!.expertise!
                                          .asMap()
                                          .entries
                                          .map((e) => Text(
                                                  language(context,
                                                      "\u2022  ${e.value.title!}"),
                                                  style: appCss.dmDenseMedium12
                                                      .textColor(
                                                          appColor(context)
                                                              
                                                              .darkText))
                                              .paddingOnly(right: Insets.i25))
                                          .toList()),
                                  if (value.provider!.expertise!.isNotEmpty)
                                    const VSpace(Sizes.s20),
                                  if (value.provider!.description != null)
                                    Text(
                                            language(
                                                context, appFonts.description),
                                            style: appCss.dmDenseMedium14
                                                .textColor(appColor(context)
                                                    
                                                    .darkText))
                                        .alignment(Alignment.centerLeft),
                                  if (value.provider!.expertise!.isNotEmpty)
                                  const VSpace(Sizes.s10),
                                  Text(value.provider!.description ?? "",
                                          style: appCss.dmDenseMedium12
                                              .textColor(appColor(context)
                                                  
                                                  .lightText))
                                      .alignment(Alignment.centerLeft),
                                ])
                          ])
                          .paddingOnly( left:Insets.i15,right: Insets.i15,top: Insets.i15)
                          .boxBorderExtension(context)
                          .paddingSymmetric(
                              horizontal: Insets.i20, vertical: Insets.i2)
                    ]))
                  : Container()),
        ),
      );
    });
  }
}
