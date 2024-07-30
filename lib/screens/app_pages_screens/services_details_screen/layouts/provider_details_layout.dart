import '../../../../config.dart';

class ProviderDetailsLayout extends StatelessWidget {
  final String? pName, rating, experience, service, image;
  final GestureTapCallback? onTap;

  const ProviderDetailsLayout(
      {super.key,
      this.rating,
      this.service,
      this.pName,
      this.experience,
      this.onTap,
      this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(language(context, appFonts.profileDetails),
            style: appCss.dmDenseMedium12
                .textColor(appColor(context).lightText)),
        Row(children: [
          Text(language(context, appFonts.view),
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).primary)),
          const HSpace(Sizes.s4),
          SvgPicture.asset(eSvgAssets.anchorArrowRight,
              colorFilter: ColorFilter.mode(
                  appColor(context).primary, BlendMode.srcIn))
        ]).inkWell(onTap: onTap)
      ]).paddingSymmetric(horizontal: Insets.i15),
      Divider(height: 1, color: appColor(context).stroke)
          .paddingSymmetric(vertical: Insets.i15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          image != null
              ? CachedNetworkImage(
                  imageUrl: image!,
                  imageBuilder: (context, imageProvider) => Container(
                      height: Sizes.s40,
                      width: Sizes.s40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(fit: BoxFit.cover,image: imageProvider))),
                  placeholder: (context, url) => Container(
                      height: Sizes.s40,
                      width: Sizes.s40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(fit: BoxFit.cover,
                              image: AssetImage(eImageAssets.profile)))),
                  errorWidget: (context, url, error) => Container(
                      height: Sizes.s40,
                      width: Sizes.s40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(fit: BoxFit.cover,
                              image: AssetImage(eImageAssets.profile)))),
                )
              : Container(
                  height: Sizes.s40,
                  width: Sizes.s40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(eImageAssets.noImageFound3)))),
          const HSpace(Sizes.s12),
          Text(capitalizeFirstLetter(pName!),
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).darkText))
        ]),
        if(rating != null && rating !="0.0")
        Row(children: [
          RatingLayout(
              initialRating: rating != null ? double.parse(rating!) : 0.0,
              color: appColor(context).rateColor),
          const HSpace(Sizes.s4),
          Text(rating!,
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).darkText))
        ])
      ]).paddingSymmetric(horizontal: Insets.i15),
      const VSpace(Sizes.s15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(language(context, appFonts.totalExperience),
            style: appCss.dmDenseMedium12
                .textColor(appColor(context).lightText)),
        Text(experience!,
            style: appCss.dmDenseMedium12
                .textColor(appColor(context).darkText))
      ]).paddingSymmetric(horizontal: Insets.i15),
      const DottedLines()
          .paddingSymmetric(vertical: Insets.i10, horizontal: Insets.i15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(language(context, appFonts.servicesDelivered),
            style: appCss.dmDenseMedium12
                .textColor(appColor(context).lightText)),
        RichText(
            text: TextSpan(
                text: service!,
                style: appCss.dmDenseSemiBold14
                    .textColor(appColor(context).primary),
                children: [
              TextSpan(
                  text: " ${language(context, appFonts.service)}",
                  style: appCss.dmDenseSemiBold12
                      .textColor(appColor(context).primary))
            ]))
      ]).paddingSymmetric(horizontal: Insets.i15)
    ]))
        .paddingSymmetric(vertical: Insets.i15)
        .boxShapeExtension(color: appColor(context).fieldCardBg);
  }
}
