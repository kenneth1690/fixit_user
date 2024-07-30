import '../../../../config.dart';

class ReviewLayout extends StatelessWidget {
  final Reviews? data;
  final GestureTapCallback? editTap, deleteTap;

  const ReviewLayout({super.key, this.data, this.deleteTap, this.editTap});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          //Image.asset(data["image"],height: Sizes.s38,width: Sizes.s38).decorated(shape: BoxShape.circle),
          data!.servicemanId == null
              ? data!.provider!.media != null &&
                      data!.provider!.media!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: data!.provider!.media![0].originalUrl!,
                      placeholder: (context, url) => Container(
                          height: Sizes.s38,
                          width: Sizes.s38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage(eImageAssets.noImageFound3)))),
                      imageBuilder: (context, imageProvider) => Container(
                          height: Sizes.s38,
                          width: Sizes.s38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: imageProvider))),
                      errorWidget: (context, url, error) => Container(
                          height: Sizes.s38,
                          width: Sizes.s38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage(eImageAssets.noImageFound1)))))
                  : Container(
                      height: Sizes.s38,
                      width: Sizes.s38,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(eImageAssets.noImageFound3))))
              : data!.serviceman!.media != null &&
                      data!.serviceman!.media!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: data!.serviceman!.media![0].originalUrl!,
                      placeholder: (context, url) => Container(
                          height: Sizes.s38,
                          width: Sizes.s38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage(eImageAssets.noImageFound1)))),
                      imageBuilder: (context, imageProvider) => Container(
                          height: Sizes.s38,
                          width: Sizes.s38,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image:
                                  DecorationImage(fit: BoxFit.cover, image: imageProvider))),
                      errorWidget: (context, url, error) => Container(height: Sizes.s38, width: Sizes.s38, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(eImageAssets.noImageFound3)))))
                  : Container(height: Sizes.s38, width: Sizes.s38, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(eImageAssets.noImageFound1)))),
          const HSpace(Sizes.s10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                      data!.servicemanId == null
                          ? data!.provider!.name!
                          : data!.serviceman!.name!,
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).darkText)),
                  VerticalDivider(
                      color: appColor(context).darkText,
                      thickness: 1.5,
                      endIndent: 4,
                      indent: 5),
                  Row(children: [
                    SvgPicture.asset(eSvgAssets.star),
                    Text(data!.rating.toString(),
                        style: appCss.dmDenseMedium13
                            .textColor(appColor(context).darkText))
                  ])
                ],
              ),
            ),
            if (data!.service != null)
              Text(data!.service!.title!,
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).lightText))
          ]),
        ]),
        Container(
          padding: const EdgeInsets.all(Insets.i5),
          decoration: ShapeDecoration(
              color: data!.servicemanId == null
                  ? appColor(context).primary.withOpacity(0.10)
                  : appColor(context).greenColor.withOpacity(0.10),
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 6,cornerSmoothing: 1
              )
            )
          ),
          child: Text(
            data!.servicemanId == null
                ? language(context, appFonts.service)
                : language(context, appFonts.serviceman).capitalizeFirst(),
            style: appCss.dmDenseMedium11.textColor(data!.servicemanId == null
                ? appColor(context).primary
                : appColor(context).greenColor),
          )
        )
      ]),
      const VSpace(Sizes.s15),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(data!.description!,
            style: appCss.dmDenseMedium12
                .textColor(appColor(context).darkText)),
        Divider(height: 1, color: appColor(context).stroke)
            .paddingSymmetric(vertical: Insets.i15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
              getTime(
                  DateTime.parse(data!.createdAt ?? DateTime.now().toString())),
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).lightText)),
          Row(children: [
            CommonArrow(
                onTap: editTap, isThirteen: true, arrow: eSvgAssets.edit),
            const HSpace(Sizes.s12),
            CommonArrow(
                onTap: deleteTap,
                isThirteen: true,
                arrow: eSvgAssets.delete,
                svgColor: appColor(context).red,
                color: appColor(context).red.withOpacity(0.1))
          ])
        ])
      ])
    ])
        .paddingAll(Insets.i15)
        .boxBorderExtension(context, radius: AppRadius.r12)
        .paddingOnly(bottom: Insets.i20);
  }
}
