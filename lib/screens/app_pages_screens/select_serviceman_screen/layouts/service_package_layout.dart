import 'dart:developer';

import 'package:intl/intl.dart';

import '../../../../config.dart';

class ServicePackageLayout extends StatelessWidget {
  final Services? data;
  final GestureTapCallback? onTap;

  const ServicePackageLayout({super.key, this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    log("data!.serviceDate :${data!.serviceDate}");
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Stack(alignment: Alignment.topRight,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
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
                                      borderRadius: SmoothBorderRadius.all(SmoothRadius(
                                          cornerRadius: 8, cornerSmoothing: 1))))),
                          errorWidget: (context, url, error) => Container(
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
                                              cornerSmoothing: 1))))))
                      : Container(
                          height: Sizes.s70,
                          width: Sizes.s70,
                          decoration:
                              ShapeDecoration(image: DecorationImage(image: AssetImage(eImageAssets.noImageFound1), fit: BoxFit.cover), shape: const SmoothRectangleBorder(borderRadius: SmoothBorderRadius.all(SmoothRadius(cornerRadius: 8, cornerSmoothing: 1))))),
                  const HSpace(Sizes.s10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                            child: Row(children: [
                          Text(language(context, data!.title!),
                                  overflow: TextOverflow.ellipsis,
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).darkText)).width(data!.title!.length >= 20 ? Sizes.s150 :Sizes.s110)
                              ,
                          VerticalDivider(
                                  width: 1,
                                  indent: 3,
                                  endIndent: 3,
                                  color: appColor(context).stroke,
                                  thickness: 1)
                              .paddingSymmetric(horizontal: Insets.i6),
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
                        ]).width(Sizes.s200)),
                        const VSpace(Sizes.s4),
                        Row(children: [
                          SvgPicture.asset(eSvgAssets.clock),
                          const HSpace(Sizes.s5),
                          Text("${language(context, data!.duration!)} ${data!.durationUnit ?? "mins"}",
                              style: appCss.dmDenseMedium12
                                  .textColor(appColor(context).online))
                        ]),
                        const VSpace(Sizes.s8),
                        data!.serviceDate == null
                            ? Text(language(context, appFonts.serviceDateTime),
                                style: appCss.dmDenseMedium12.textColor(
                                    appColor(context).lightText))
                            : Row(children: [
                                SvgPicture.asset(eSvgAssets.calendar),
                                const HSpace(Sizes.s5),
                                Text(
                                    DateFormat("dd MMMM, yyyy")
                                        .format(data!.serviceDate!),
                                    style: appCss.dmDenseMedium11.textColor(
                                        appColor(context).darkText)),
                                // if(data["servicemanRequired"] != "0")
                                VerticalDivider(
                                        width: 1,
                                        indent: 3,
                                        endIndent: 3,
                                        color: appColor(context).stroke,
                                        thickness: 1)
                                    .paddingSymmetric(horizontal: Insets.i6),
                                // if(data["servicemanRequired"] != "0")
                                Row(children: [
                                  SvgPicture.asset(eSvgAssets.clock,
                                      colorFilter: ColorFilter.mode(
                                          appColor(context).darkText,
                                          BlendMode.srcIn)),
                                  const HSpace(Sizes.s5),
                                  Text(
                                      "${DateFormat("hh:mm").format(data!.serviceDate!)} ${data!.selectedDateTimeFormat}",
                                      style: appCss.dmDenseMedium11.textColor(
                                          appColor(context).darkText))
                                ])
                              ])
                      ])
                ]),

              ]),
          if (data!.serviceDate != null)
            Container(
              height: Sizes.s30,
              width: Sizes.s30,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: appColor(context).fieldCardBg,
                  shape: BoxShape.circle),
              child: SvgPicture.asset(eSvgAssets.edit,
                  colorFilter: ColorFilter.mode(
                      appColor(context).darkText, BlendMode.srcIn)),
            ).inkWell(onTap: onTap)
        ],
      ),
      const DottedLines().paddingSymmetric(vertical: Insets.i15),
      if (data!.selectServiceManType != null)
        data!.selectServiceManType == "app_choose"
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, appFonts.requiredServicemen),
                        overflow: TextOverflow.clip,
                        style: appCss.dmDenseMedium12
                            .textColor(appColor(context).darkText))
                    .width(Sizes.s200),
                Text(
                    language(context,
                        "${data!.selectedRequiredServiceMan} ${appFonts.serviceman}"),
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).primary))
              ]).paddingOnly(bottom: Insets.i15)
            : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, appFonts.requiredServicemen),
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).darkText)),
                Text(
                    language(context,
                        "${data!.selectedServiceMan != null ? data!.selectedServiceMan!.length : 0} ${appFonts.serviceman}"),
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).primary))
              ]).paddingOnly(bottom: Insets.i15),
      if (data!.selectServiceManType == null)
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
              "${data!.requiredServicemen ?? 1} ${language(context, appFonts.requiredServicemen)} :",
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).darkText)),
          Container(
                  decoration: ShapeDecoration(
                      color: appColor(context).primary,
                      shape: const SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius.all(SmoothRadius(
                              cornerRadius: 8, cornerSmoothing: 1)))),
                  child: Text(language(context, appFonts.selectServicemen),
                          style: appCss.dmDenseMedium12
                              .textColor(appColor(context).whiteColor))
                      .paddingSymmetric(
                          vertical: Insets.i10, horizontal: Insets.i12))
              .inkWell(onTap: onTap)
        ]),
      if (data!.selectServiceManType != null &&
          data!.selectServiceManType == "app_choose")
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(language(context, appFonts.note),
                overflow: TextOverflow.clip,
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).lightText)),
            const HSpace(
              Sizes.s10,
            ),
            Expanded(
              child: Text(language(context, appFonts.asYouPreviously),
                  overflow: TextOverflow.clip,
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).lightText)),
            )
          ],
        ),
      if (data!.selectedServiceMan != null &&
          data!.selectedServiceMan!.isNotEmpty)
        const VSpace(Sizes.s10),
      if (data!.selectedServiceMan != null &&
          data!.selectedServiceMan!.isNotEmpty)
        ...data!.selectedServiceMan!.asMap().entries.map((s) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    s.value.media != null && s.value.media!.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: s.value.media![0].originalUrl!,
                            imageBuilder: (context, imageProvider) => Container(
                                height: Sizes.s40,
                                width: Sizes.s40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image:
                                        DecorationImage(image: imageProvider))),
                            errorWidget: (context, url, error) => Container(
                                height: Sizes.s40,
                                width: Sizes.s40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            eImageAssets.noImageFound1)))),
                          )
                        : Container(
                            height: Sizes.s40,
                            width: Sizes.s40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        eImageAssets.noImageFound1)))),
                    const HSpace(Sizes.s12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            language(context, appFonts.serviceman)
                                .capitalizeFirst(),
                            style: appCss.dmDenseMedium12.textColor(
                                appColor(context).lightText)),
                        Text(language(context, s.value.name),
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).darkText))
                      ],
                    )
                  ],
                ),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  SvgPicture.asset(eSvgAssets.star),
                  const HSpace(Sizes.s4),
                  Text(
                      s.value.reviewRatings != null
                          ? s.value.reviewRatings.toString()
                          : "0",
                      style: appCss.dmDenseMedium13
                          .textColor(appColor(context).darkText))
                ])
              ],
            )
                .paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i13)
                .boxBorderExtension(context,
                    color: appColor(context).fieldCardBg,
                    bColor: appColor(context).fieldCardBg)
                .marginOnly(bottom: Insets.i10))
    ])
        .paddingAll(Insets.i15)
        .boxBorderExtension(context)
        .paddingOnly(bottom: Insets.i15);
  }
}
