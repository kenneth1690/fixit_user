import 'package:fixit_user/common/languages/app_language.dart';

import '../../../../config.dart';

class ServiceDescription extends StatelessWidget {
  final Services? services;

  const ServiceDescription({super.key, this.services});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
            child: DescriptionLayout(
                icon: eSvgAssets.clock,
                title: appFonts.time,
                subtitle:
                    "${services!.duration} ${services!.durationUnit}")),
        Container(
          color: appColor(context).stroke,
          width: 2,
          height: Sizes.s78,
        ),
        if (services!.categories!.isNotEmpty)
          Expanded(
            child: DescriptionLayout(
                    icon: eSvgAssets.categories,
                    title: appFonts.category,
                    subtitle: services!.categories![0].title!)
                .paddingOnly(
                    left: AppLocalizations.of(context)?.locale.languageCode ==
                            "ar"
                        ? 0
                        : Insets.i20,
                    right: AppLocalizations.of(context)?.locale.languageCode ==
                            "ar"
                        ? 0
                        : Insets.i20),
          )
      ]).paddingSymmetric(horizontal: Insets.i25),
      const DottedLines(),
      const VSpace(Sizes.s17),
      DescriptionLayout(
              icon: eSvgAssets.accountTag,
              title: appFonts.requiredServicemen,
              subtitle:
                  "${services!.requiredServicemen ?? '1'} ${capitalizeFirstLetter(language(context, appFonts.serviceman))}")
          .paddingSymmetric(horizontal: Insets.i25),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(language(context, appFonts.description),
            style: appCss.dmDenseMedium12
                .textColor(appColor(context).lightText)),
        const VSpace(Sizes.s6),
        if (services!.description != null)
          ReadMoreLayout(text: services!.description!),
        const VSpace(Sizes.s20),
        ProviderDetailsLayout(
          image: services!.user!.media != null && services!.user!.media!.isNotEmpty ? services!.user!.media![0].originalUrl : null,
            pName: services!.user!.name!,
            rating: services!.user!.reviewRatings != null
                ? services!.user!.reviewRatings.toString()
                : "0.0",
            experience:
                "${services!.user!.experienceDuration} ${capitalizeFirstLetter(services!.user!.experienceInterval)} ${language(context, appFonts.of)} ${language(context, appFonts.experience)}",
            onTap: () => route.pushNamed(
                context, routeName.providerDetailsScreen,
                arg: {'provider':services!.user}),
            service: services!.user!.served ?? "0"),
        if (services!.reviews!.isNotEmpty)
          HeadingRowCommon(
                  title: appFonts.review,
                  onTap: () => route.pushNamed(
                      context, routeName.servicesReviewScreen, arg: services!))
              .paddingOnly(top: Insets.i20, bottom: Insets.i12),
        if (services!.reviews!.isNotEmpty)
          Column(
              children: services!.reviews!
                  .asMap()
                  .entries
                  .map((e) => ServiceReviewLayout(
                      data: e.value, index: e.key, list: appArray.reviewList))
                  .toList())
      ]).paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i20)
    ]).boxBorderExtension(context, isShadow: true);
  }
}
