import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../../../config.dart';

class ServiceImageLayout extends StatelessWidget {
  final String? image, rating, title;
  final Function(bool)? favTap;
  final bool? isFav;
  final GestureTapCallback? onBack;

  const ServiceImageLayout(
      {super.key,
      this.rating,
      this.image,
      this.favTap,
      this.title,
      this.isFav,
      this.onBack});

  @override
  Widget build(BuildContext context) {
    log("ISFA :$isFav");
    return Stack(children: [
      Stack(children: [
        /*  Container(
            width: MediaQuery.of(context).size.width,
            height: Sizes.s230,
            decoration: ShapeDecoration(
                image: DecorationImage(
                    image: AssetImage(image!),
                    fit: BoxFit.cover),
                shape: const SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius.only(
                        bottomRight: SmoothRadius(
                            cornerRadius: AppRadius.r20, cornerSmoothing: 1),
                        bottomLeft: SmoothRadius(
                            cornerRadius: AppRadius.r20,
                            cornerSmoothing: 1))))),*/
        CachedNetworkImage(
          imageUrl: image!,
          imageBuilder: (context, imageProvider) => Container(
              width: MediaQuery.of(context).size.width,
              height: Sizes.s230,
              decoration: ShapeDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image!), fit: BoxFit.cover),
                  shadows: [
                    BoxShadow(
                        color: appColor(context).darkText.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 3)
                  ],
                  shape: const SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.only(
                          bottomRight: SmoothRadius(
                              cornerRadius: AppRadius.r20, cornerSmoothing: 1),
                          bottomLeft: SmoothRadius(
                              cornerRadius: AppRadius.r20,
                              cornerSmoothing: 1))))),
          placeholder: (context, url) => Container(
              width: MediaQuery.of(context).size.width,
              height: Sizes.s230,
              decoration: ShapeDecoration(
                  shadows: [
                    BoxShadow(
                        color: appColor(context).darkText.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 3)
                  ],
                  image: DecorationImage(
                      image: AssetImage(eImageAssets.noImageFound2),
                      fit: BoxFit.cover),
                  shape: const SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.only(
                          bottomRight: SmoothRadius(
                              cornerRadius: AppRadius.r20, cornerSmoothing: 1),
                          bottomLeft: SmoothRadius(
                              cornerRadius: AppRadius.r20,
                              cornerSmoothing: 1))))),
          errorWidget: (context, url, error) => Container(
              width: MediaQuery.of(context).size.width,
              height: Sizes.s230,
              decoration: ShapeDecoration(
                  shadows: [
                    BoxShadow(
                        color: appColor(context).darkText.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 3)
                  ],
                  image: DecorationImage(
                      image: AssetImage(eImageAssets.noImageFound2),
                      fit: BoxFit.cover),
                  shape: const SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.only(
                          bottomRight: SmoothRadius(
                              cornerRadius: AppRadius.r20, cornerSmoothing: 1),
                          bottomLeft: SmoothRadius(
                              cornerRadius: AppRadius.r20,
                              cornerSmoothing: 1))))),
        ),
        SizedBox(
                width: MediaQuery.of(context).size.width,
                height: Sizes.s230,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonArrow(
                                arrow: eSvgAssets.arrowLeft, onTap: onBack),
                            isFav!
                                ? SvgPicture.asset(eSvgAssets.heart,
                                        height: Sizes.s40, width: Sizes.s40)
                                    .inkWell(onTap: () => favTap!(false))
                                : CommonArrow(
                                    arrow: eSvgAssets.like,
                                    onTap: () => favTap!(true))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(title!,
                                  style: appCss.dmDenseSemiBold18
                                      .textColor(appColor(context).whiteColor)),
                            ),
                            if (rating != null)
                              Row(children: [
                                SvgPicture.asset(eSvgAssets.star),
                                const HSpace(Sizes.s4),
                                Text(rating!,
                                    style: appCss.dmDenseMedium13.textColor(
                                        appColor(context).whiteColor))
                              ])
                          ])
                    ]).padding(
                    horizontal: Insets.i20,
                    top: Insets.i20,
                    bottom: Insets.i20))
            .decorated(
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(AppRadius.r20),
                    right: Radius.circular(AppRadius.r20)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      appColor(context).trans,
                      appColor(context).darkText.withOpacity(0.3)
                    ]))
      ])
    ]);
  }
}
