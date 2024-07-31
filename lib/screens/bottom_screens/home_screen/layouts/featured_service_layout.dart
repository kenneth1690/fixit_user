import 'package:fixit_user/utils/general_utils.dart';
import 'package:fixit_user/widgets/common_image_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../config.dart';
import '../../../../widgets/common_cached_image.dart';

class FeaturedServicesLayout extends StatelessWidget {
  final Services? data;
  final GestureTapCallback? onTap, addTap;
  final bool? isProvider, inCart;

  const FeaturedServicesLayout(
      {super.key,
      this.data,
      this.onTap,
      this.isProvider = true,
      this.addTap,
      this.inCart = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Stack(alignment: Alignment.topRight, children: [
                data!.media != null && data!.media!.isNotEmpty
                    ? CommonImageLayout(
                        tlRadius: 8,
                        tRRadius: 8,
                        blRadius: 0,
                        bRRadius: 0,
                        isAllBorderRadius: false,
                        image: data!.media![0].originalUrl!,
                        boxFit: BoxFit.cover,
                        height: Sizes.s230,
                        assetImage: eImageAssets.noImageFound2)
                    : CommonCachedImage(
                        tlRadius: 8,
                        tRRadius: 8,
                        blRadius: 0,
                        bRRadius: 0,
                        isAllBorderRadius: false,
                        height: Sizes.s230,
                        image: eImageAssets.noImageFound2),
                if (data!.discount != "")
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        SizedBox(
                                child: Text(
                                        "${data!.discount!}% ${language(context, appFonts.off)}",
                                        style: appCss.dmDenseMedium12.textColor(
                                            appColor(context).whiteColor))
                                    .padding(
                                        horizontal: Insets.i9,
                                        top: Insets.i3,
                                        bottom: Insets.i3))
                            .decorated(
                                color: appColor(context).red,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r30))
                      ]).paddingSymmetric(
                      horizontal: Insets.i20, vertical: Insets.i10)
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text(capitalizeFirstLetter(data!.title!),
                                style: appCss.dmDenseSemiBold15
                                    .textColor(appColor(context).darkText)),
                            const VSpace(Sizes.s8),
                            IntrinsicHeight(
                                child: Row(children: [
                              SvgPicture.asset(eSvgAssets.clock),
                              const HSpace(Sizes.s5),
                              Text(
                                  "${data!.duration} ${capitalizeFirstLetter(data!.durationUnit)}",
                                  style: appCss.dmDenseSemiBold12
                                      .textColor(appColor(context).online)),
                              VerticalDivider(
                                      indent: 4,
                                      endIndent: 4,
                                      width: 1,
                                      color: appColor(context).lightText)
                                  .paddingSymmetric(horizontal: Insets.i5),
                              SvgPicture.asset(eSvgAssets.user,
                                  height: Sizes.s16,
                                  colorFilter: ColorFilter.mode(
                                      appColor(context).darkText,
                                      BlendMode.srcIn)),
                              const HSpace(Sizes.s5),
                              Expanded(
                                child: Text(
                                    "${data!.requiredServicemen} ${capitalizeFirstLetter(language(context, appFonts.serviceman))}",
                                    style: appCss.dmDenseRegular13
                                        .textColor(appColor(context).darkText)),
                              )
                            ]))
                          ])),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                "${getSymbol(context)}${(currency(context).currencyVal * data!.price!).toStringAsFixed(2)}",
                                style: appCss.dmDenseRegular14
                                    .textColor(appColor(context).lightText)
                                    .lineThrough),
                            const HSpace(Sizes.s8),
                            Text(
                                "${getSymbol(context)}${((currency(context).currencyVal * data!.serviceRate!).toStringAsFixed(2))}",
                                style: appCss.dmDenseBold16
                                    .textColor(appColor(context).darkText))
                          ])
                    ]),
                const HSpace(Sizes.s10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        DottedLines(
                            width: MediaQuery.of(context).size.width - 155),
                        SvgPicture.asset(eSvgAssets.arrowRight1,
                            colorFilter: ColorFilter.mode(
                                appColor(context).stroke, BlendMode.srcIn))
                      ]),
                      const HSpace(Sizes.s10),
                      (inCart!)
                          ? AddedButtonCommon(onTap: addTap)
                          : AddButtonCommon(onTap: addTap)
                    ]),
                if (data!.description != null)
                  Text(capitalizeFirstLetter(data!.description!),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: appCss.dmDenseMedium13
                              .textColor(appColor(context).lightText))
                      .marginOnly(
                          right: rtl(context) ? 0 : Insets.i70,
                          left: rtl(context) ? Insets.i70 : 0,bottom: Sizes.s6)
              ]).padding(horizontal: Insets.i14, vertical: Insets.i13)
            ]))
        .decorated(
            color: appColor(context).whiteBg,
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 2,
                  color: appColor(context).darkText.withOpacity(0.06))
            ],
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(color: appColor(context).stroke))
        .inkWell(onTap: onTap)
        .paddingOnly(bottom: Insets.i15);
  }
}
