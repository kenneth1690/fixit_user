
import 'package:fixit_user/widgets/common_image_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config.dart';
import 'dart:math' as math;

class ServicePackageList extends StatelessWidget {
  final ServicePackageModel? data;
  final GestureTapCallback? onTap;
  final bool? isViewAll;
  final Animation<double>? rotationAnimation;

  const ServicePackageList(
      {super.key,
      this.data,
      this.onTap,
      this.isViewAll = false,
      this.rotationAnimation});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context, value, child) {
      return Stack(children: [
        Stack(children: [
          Container(
              padding: EdgeInsets.only(
                  top: Insets.i15,
                  left:
                      AppLocalizations.of(context)?.locale.languageCode == "ar"
                          ? 0
                          : Insets.i15,
                  right:
                      AppLocalizations.of(context)?.locale.languageCode == "ar"
                          ? Insets.i15
                          : 0),
              decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                          cornerRadius: 10, cornerSmoothing: 1)),
                  color: data!.hexaCode != null
                      ? fromHex(data!.hexaCode!)
                      : appColor(context).primary.withOpacity(0.8)),
              height: isViewAll == true ? MediaQuery.of(context).size.height : Sizes.s145,
              width: isViewAll == true ? MediaQuery.of(context).size.width : Sizes.s125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            height: isViewAll == true ? Sizes.s43 : Sizes.s32,
                            width: isViewAll == true ? Sizes.s43 : Sizes.s32,
                            decoration: ShapeDecoration(
                                color: appColor(context).whiteBg,
                                shape: SmoothRectangleBorder(
                                    borderRadius: SmoothBorderRadius(
                                        cornerRadius: 8, cornerSmoothing: 1))),
                            padding: const EdgeInsets.all(5),
                            child:
                            data!.media != null && data!.media!.isNotEmpty?  CachedNetworkImage(
                            imageUrl: data!.media![0].originalUrl!,
                            errorWidget: (context, url, error) => Image.asset(eImageAssets.noImageFound1),
                            placeholder: (context, url) => Image.asset(eImageAssets.noImageFound1),
                            imageBuilder: (context, imageProvider) =>
                            Image(image: imageProvider,color: data!.hexaCode != null
                                ? fromHex(data!.hexaCode!)
                                : appColor(context).primary.withOpacity(0.8),),
                          ):Image.asset(eImageAssets.noImageFound1)
                        ),

                        const VSpace(Sizes.s8),
                        Text(data!.title!,
                            overflow: TextOverflow.ellipsis,
                            style: isViewAll == true
                                ? appCss.dmDenseMedium14
                                    .textColor(appColor(context).whiteBg)
                                : appCss.dmDenseMedium12
                                    .textColor(appColor(context).whiteBg)).paddingOnly(right: Sizes.s12),
                        const VSpace(Sizes.s2),
                        Text(
                            "${getSymbol(context)}${(currency(context).currencyVal * double.parse(data!.price!)).toStringAsFixed(2)}",
                            style: isViewAll == true
                                ? appCss.dmDenseBold18
                                    .textColor(appColor(context).whiteBg)
                                : appCss.dmDenseBold14
                                    .textColor(appColor(context).whiteBg)),
                      ],
                    ),
                   // VSpace(isViewAll == true ? Sizes.s26 : Sizes.s15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(language(context, appFonts.seeMore),
                              style: appCss.dmDenseMedium14
                                  .textColor(appColor(context).whiteBg)),

                          Expanded(
                            child: SvgPicture.asset(eSvgAssets.anchorArrowRight,
                                colorFilter: ColorFilter.mode(
                                    appColor(context).whiteBg, BlendMode.srcIn)).marginSymmetric(horizontal: 15),
                          )
                        ]).marginOnly(bottom: Sizes.s20)
                  ])),
       /*   if (rotationAnimation != null)
            Positioned(
                bottom: 50,
                left: 50,
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                      3.1415926535897932 / 4,
                    ),
                    child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                            height: 118,
                            width: 145,
                            eImageAssets.p1,
                            fit: BoxFit.cover))))*/
        ])
      ]).inkWell(onTap: onTap).paddingOnly(right: Insets.i15);
    });
  }
}
