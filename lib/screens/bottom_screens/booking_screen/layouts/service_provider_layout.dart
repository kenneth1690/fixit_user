import 'dart:developer';

import 'package:fixit_user/widgets/common_image_layout.dart';

import '../../../../config.dart';

class ServiceProviderLayout extends StatelessWidget {
  final List? list;
  final int? index;
  final String? title, name, rate, image;
  final GestureTapCallback? onTap;
  final bool isProvider;

  const ServiceProviderLayout(
      {super.key,
      this.list,
      this.index,
      this.title,
      this.rate,
      this.name,
      this.image,
      this.onTap,
      this.isProvider = true});

  @override
  Widget build(BuildContext context) {
    log("raterate :$name");
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CommonImageLayout(
              isCircle: true,
              image: image ??"",
              assetImage: eImageAssets.noImageFound3,
              height: Sizes.s40,
              width: Sizes.s40
            ),
            const HSpace(Sizes.s8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(language(context, title!),
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).lightText)),
              const VSpace(Sizes.s2),
              Text(language(context, name!),
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).darkText))
            ])
          ]),
          if (rate != null && rate != "null" && rate != "0.0" && rate != "0")
            Row(mainAxisSize: MainAxisSize.min, children: [
              SvgPicture.asset(eSvgAssets.star),
              const HSpace(Sizes.s4),
              Text(rate != null && rate != "null" ? rate! : "0",
                  style: appCss.dmDenseMedium13
                      .textColor(appColor(context).darkText))
            ])
        ],
      ).marginSymmetric(vertical: Insets.i13),
      if (isProvider && list!.isNotEmpty)
        Divider(
            color: appColor(context).stroke, thickness: 1, height: 0),
      if (list!.isNotEmpty)
        if (index != list!.length - 1)
          DottedLines(color: appColor(context).stroke)
    ]);
  }
}
