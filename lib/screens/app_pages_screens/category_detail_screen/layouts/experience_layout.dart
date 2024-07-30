import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config.dart';

class ExperienceLayout extends StatelessWidget {
  final ProviderModel? data;
  final GestureTapCallback? onTap;
  final bool? isContain;

  const ExperienceLayout({super.key, this.onTap, this.data, this.isContain});

  @override
  Widget build(BuildContext context) {
    log("data!.media :${data!.media}");
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IntrinsicHeight(
          child: Row(children: [
        /*Container(
                  height: Sizes.s36,
                  width: Sizes.s36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(data["image"]))
                  )
                )*/

            data!.media != null && data!.media!.isNotEmpty ?    CachedNetworkImage(
          imageUrl:  data!.media![0].originalUrl! ,
          imageBuilder: (context, imageProvider) => Container(
              height: Sizes.s36,
              width: Sizes.s36,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider))),
          errorWidget: (context, url, error) => Container(
              height: Sizes.s36,
              width: Sizes.s36,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(eImageAssets.noImageFound1)))),
        ): Container(
                height: Sizes.s36,
                width: Sizes.s36,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(eImageAssets.noImageFound1)))),
        VerticalDivider(
                indent: 4,
                endIndent: 4,
                width: 1,
                color: appColor(context).lightText)
            .paddingSymmetric(horizontal: Insets.i12),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IntrinsicHeight(
              child: Row(children: [
            Text(language(context, data!.name),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).darkText)),
            VerticalDivider(
                    indent: 4,
                    endIndent: 4,
                    width: 1,
                    color: appColor(context).lightText)
                .paddingSymmetric(horizontal: Insets.i5),

            Text("${data!.served} ${language(context, appFonts.served)}",
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).darkText))
          ])),
          const VSpace(Sizes.s4),
          Text("${data!.experienceDuration ?? "0"} ${appFonts.of} ${data!.experienceInterval != null? capitalizeFirstLetter(data!.experienceInterval) : "Years"} ${language(context, appFonts.experience).toLowerCase()}",
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).lightText))
        ])
      ])),
      CheckBoxCommon(isCheck:isContain, onTap: onTap)
    ])
        .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
        .boxBorderExtension(context, isShadow: true)
        .padding(horizontal: Insets.i20, bottom: Insets.i15);
  }
}
