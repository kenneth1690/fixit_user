import '../../../../config.dart';

class IncludedServiceLayout extends StatelessWidget {
  final Services? data;
  final List<Services>? list;
  final int? index;

  const IncludedServiceLayout({super.key, this.data, this.index, this.list});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(children: [
                data!.media != null && data!.media!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: data!.media![0].originalUrl!,
                        imageBuilder: (context, imageProvider) => Container(
                            height: Sizes.s70,
                            width: Sizes.s70,
                            decoration: ShapeDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                                shape: const SmoothRectangleBorder(
                                    borderRadius: SmoothBorderRadius.all(
                                        SmoothRadius(
                                            cornerRadius: 8,
                                            cornerSmoothing: 1))))),
                        errorWidget: (context, url, error) => Container(
                            height: Sizes.s70,
                            width: Sizes.s70,
                            decoration: ShapeDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(eImageAssets.noImageFound1),
                                    fit: BoxFit.cover),
                                shape: const SmoothRectangleBorder(
                                    borderRadius: SmoothBorderRadius.all(
                                        SmoothRadius(
                                            cornerRadius: 8,
                                            cornerSmoothing: 1))))),
                      )
                    : Container(
                        height: Sizes.s70,
                        width: Sizes.s70,
                        decoration: ShapeDecoration(
                            image: DecorationImage(
                                image: AssetImage(eImageAssets.noImageFound1),
                                fit: BoxFit.cover),
                            shape: const SmoothRectangleBorder(
                                borderRadius: SmoothBorderRadius.all(
                                    SmoothRadius(
                                        cornerRadius: 8,
                                        cornerSmoothing: 1))))),
                /* Container(
                    height: Sizes.s70,
                    width: Sizes.s70,
                    decoration: ShapeDecoration(
                        image: DecorationImage(
                            image: AssetImage(data["image"]), fit: BoxFit.cover),
                        shape: const SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius.all(SmoothRadius(
                                cornerRadius: 8, cornerSmoothing: 1))))),*/
                const HSpace(Sizes.s10),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(language(context, data!.title!),
                            overflow: TextOverflow.clip,
                            style: appCss.dmDenseMedium14.textColor(
                                appColor(context).darkText)),
                        Text(
                            language(context,
                                "${getSymbol(context)}${(currency(context).currencyVal * (data!.serviceRate!)).ceilToDouble()}"),
                            style: appCss.dmDenseSemiBold14.textColor(
                                appColor(context).darkText)),
                        const VSpace(Sizes.s10),
                        FittedBox(
                          child: IntrinsicHeight(
                              child: Row(children: [
                            FittedBox(
                              child: Row(children: [
                                SvgPicture.asset(eSvgAssets.clock),
                                const HSpace(Sizes.s5),
                                Text(
                                    "${language(context, data!.duration!)} ${data!.durationUnit ?? "mins"}",
                                    style: appCss.dmDenseMedium12.textColor(
                                        appColor(context).online))
                              ]),
                            ),
                            if (data!.requiredServicemen != "0")
                              VerticalDivider(
                                      width: 1,
                                      indent: 3,
                                      endIndent: 3,
                                      color: appColor(context).lightText,
                                      thickness: 1)
                                  .paddingSymmetric(horizontal: Insets.i6),
                            if (data!.requiredServicemen != "0")
                              FittedBox(
                                child: Text(
                                    language(context,
                                        "${data!.requiredServicemen ?? 1} ${appFonts.serviceman}"),
                                    overflow: TextOverflow.clip,
                                    style: appCss.dmDenseMedium12.textColor(
                                        appColor(context).darkText))
                              )
                          ]))
                        )
                      ])
                )
              ])
            ),
            if(data!.ratingCount != null && data!.ratingCount != 0)
            Row(children: [
              SvgPicture.asset(eSvgAssets.star),
              const HSpace(Sizes.s4),
              Text(
                  data!.ratingCount != null
                      ? data!.ratingCount.toString()
                      : "0",
                  style: appCss.dmDenseMedium13
                      .textColor(appColor(context).darkText))
            ])
          ]),
      const DottedLines().paddingSymmetric(vertical: Insets.i15),
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("\u2022 ",
                style: appCss.dmDenseRegular13
                    .textColor(appColor(context).lightText)),
            Expanded(
                child: Text(language(context, data!.description),
                        style: appCss.dmDenseMedium13
                            .textColor(appColor(context).lightText))
                    .paddingOnly(right: Insets.i20))
          ]),
      if (index != list!.length - 1)
        const DividerCommon().paddingSymmetric(vertical: Insets.i20)
    ]).inkWell(
        onTap: () => route.pushNamed(context, routeName.servicesDetailsScreen,
            arg: {'services':data}));
  }
}
