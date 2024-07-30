import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../../../config.dart';

class ServiceListLayout extends StatelessWidget {
  final Services? data;
  final bool isFav, isWidth;
  final Function(bool)? favTap;
  final GestureTapCallback? onTap;

  const ServiceListLayout(
      {super.key,
      this.data,
      this.isFav = false,
      this.favTap,
      this.onTap,
      this.isWidth = false});

  @override
  Widget build(BuildContext context) {
    log("message :$isFav");
    return SizedBox(
        width: isWidth ? Sizes.s223 : null,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(alignment: Alignment.topRight, children: [
            data!.media != null && data!.media!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: data!.media![0].originalUrl!,
                    imageBuilder: (context, imageProvider) => ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.r6),
                        child: Image(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            height: Sizes.s106,
                            width: Sizes.s223)),
                    placeholder: (context, url) => ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.r6),
                        child: Image.asset(eImageAssets.noImageFound2,
                            fit: BoxFit.fill,
                            height: Sizes.s106,
                            width: Sizes.s223)),
                    errorWidget: (context, url, error) => ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.r6),
                        child: Image.asset(eImageAssets.noImageFound2,
                            fit: BoxFit.fill,
                            height: Sizes.s106,
                            width: Sizes.s223)))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r6),
                    child: Image.asset(eImageAssets.noImageFound2,
                        fit: BoxFit.cover,
                        height: Sizes.s106,
                        width: Sizes.s223)),
            /*SvgPicture.asset(eSvgAssets.heart).paddingAll(Insets.i8)*/

            SvgPicture.asset(
              isFav ? eSvgAssets.heart : eSvgAssets.like,
              height: isWidth ? Sizes.s40 : Sizes.s30,
              width: isWidth ? Sizes.s40 : Sizes.s30,
            ).paddingAll(Insets.i8).inkWell(onTap: () => favTap!(isFav?false:true))
          ]),
          const VSpace(Sizes.s12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(data!.title!,
                    overflow: TextOverflow.ellipsis,
                    style: appCss.dmDenseSemiBold13
                        .textColor(appColor(context).darkText)),
              ),
              data!.ratingCount != null
                  ? Row(
                      children: [
                        SvgPicture.asset(eSvgAssets.star),
                        const HSpace(Sizes.s3),
                        Text(
                          data!.ratingCount != null
                              ? data!.ratingCount.toString()
                              : "0",
                          style: appCss.dmDenseMedium14
                              .textColor(appColor(context).darkText),
                        )
                      ],
                    )
                  : Container()
            ],
          ).width(Sizes.s223),
          const VSpace(Sizes.s5),
          Text("\u2022 ${data!.categories![0].title!}",
              style: appCss.dmDenseMedium13
                  .textColor(appColor(context).lightText)),
          const VSpace(Sizes.s10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${currency(context).priceSymbol}${data!.price}",
                style: appCss.dmDenseBold14
                    .textColor(appColor(context).darkText)),
            AddButtonCommon(
              onTap: onTap,
            )
          ]).width(Sizes.s223)
        ]).paddingAll(Insets.i12).boxBorderExtension(context));
  }
}
