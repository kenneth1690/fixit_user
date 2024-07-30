import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config.dart';

class ServicesImageLayout extends StatelessWidget {
  final Media? data;
  final int? index, selectIndex;
  final GestureTapCallback? onTap;

  const ServicesImageLayout(
      {super.key, this.data, this.selectIndex, this.index, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Sizes.s60,
        width: Sizes.s60,
        decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
                side: BorderSide(
                    color: selectIndex == index
                        ? appColor(context).primary
                        : appColor(context).trans),
                borderRadius: SmoothBorderRadius(
                    cornerRadius: AppRadius.r8, cornerSmoothing: 1))),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.r6),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                  sigmaX: selectIndex == index ? 0.1 : 1.0,
                  sigmaY: selectIndex == index ? 0.1 : 1.0),
              /*  child: Image.asset(data!.originalUrl!,
                  height: Sizes.s60, width: Sizes.s60, fit: BoxFit.cover)*/
              child:  CachedNetworkImage(
                imageUrl: data!.originalUrl!,
                imageBuilder: (context, imageProvider) => Container(
                  height: Sizes.s60,
                  width: Sizes.s60,

                  decoration: BoxDecoration(
                    color: appColor(context).whiteBg,

                      image: DecorationImage(image: imageProvider,fit: BoxFit.cover)),
                ),
                errorWidget: (context, url, error) => Container(
                  height: Sizes.s60,
                  width: Sizes.s60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(eImageAssets.noImageFound2))),
                ),
              ),
            ))).inkWell(onTap: onTap).paddingOnly(right: Insets.i15);
  }
}
