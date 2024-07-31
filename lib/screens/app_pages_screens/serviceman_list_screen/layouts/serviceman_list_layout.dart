import '../../../../config.dart';

class ServicemanListLayout extends StatelessWidget {
  final ProviderModel? data;
  final List? selList;
  final int? index, selectedIndex;
  final GestureTapCallback? onTap;
  final int? requiredServiceman;

  const ServicemanListLayout(
      {super.key,
      this.selList,
      this.index,
      this.data,
      this.onTap,
      this.requiredServiceman,
      this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            data!.media != null && data!.media!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: data!.media![0].originalUrl!,
                    imageBuilder: (context, imageProvider) => Container(
                        height: Sizes.s40,
                        width: Sizes.s40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover, image: imageProvider))),
                    errorWidget: (context, url, error) => Container(
                        height: Sizes.s40,
                        width: Sizes.s40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage(eImageAssets.noImageFound3)))))
                : Container(
                    height: Sizes.s40,
                    width: Sizes.s40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(eImageAssets.noImageFound3))),
                  ),
            const HSpace(Sizes.s12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(children: [
                    Text(language(context, data!.name!),
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).darkText)),
                    if(data!.reviewRatings != null)
                    VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: appColor(context).lightText,
                            indent: 6,
                            endIndent: 6)
                        .paddingSymmetric(horizontal: Insets.i6),
                    if(data!.reviewRatings != null)
                    Row(children: [
                      SvgPicture.asset(eSvgAssets.star),
                      const HSpace(Sizes.s4),
                      Text(
                          data!.reviewRatings != null
                              ? data!.reviewRatings.toString()
                              : "0",
                          style: appCss.dmDenseMedium13
                              .textColor(appColor(context).darkText))
                    ])
                  ]),
                ),
                Text(
                    language(
                        context,
                        data!.experienceDuration == null || data!.experienceDuration == "0"

                            ? language(context, appFonts.fresher)
                            : "${data!.experienceDuration ?? 0} ${data!.experienceInterval  != null ?capitalizeFirstLetter(data!.experienceInterval)  : "Years"}  ${appFonts.of} ${language(context, appFonts.experience)}"),
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).lightText))
              ],
            )
          ],
        ).inkWell(
            onTap: () => route.pushNamed(
                context, routeName.servicemanDetailScreen,
                arg: data!.id)),
        requiredServiceman == 1
            ? Container(
                    width: Sizes.s22,
                    height: Sizes.s22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: index == selectedIndex
                                ? appColor(context).trans
                                : appColor(context).stroke),
                        color: index == selectedIndex
                            ? appColor(context)

                                .primary
                                .withOpacity(0.18)
                            : appColor(context).trans),
                    child: index == selectedIndex
                        ? Icon(Icons.circle,
                            color: appColor(context).primary, size: 13)
                        : null)
                .inkWell(onTap: onTap)
            : Container(
                    height: Sizes.s20,
                    width: Sizes.s20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: selList!.contains(data!.id)
                            ? appColor(context).primary
                            : appColor(context).whiteBg,
                        borderRadius: BorderRadius.circular(AppRadius.r4),
                        border: Border.all(
                            color: selList!.contains(data!.id)
                                ? appColor(context).trans
                                : appColor(context).stroke)),
                    child: selList!.contains(data!.id)
                        ? Icon(Icons.check,
                            size: Sizes.s15,
                            color: appColor(context).whiteBg)
                        : null)
                .inkWell(onTap: onTap)
      ],
    )
        .paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i15)
        .boxBorderExtension(context,
            color: appColor(context).whiteBg,
            isShadow: !selList!.contains(data!.id) ? true : false,
            radius: AppRadius.r10,
            bColor: selList!.contains(data!.id)
                ? appColor(context).fieldCardBg
                : null)
        .paddingOnly(bottom: Insets.i15);
  }
}
