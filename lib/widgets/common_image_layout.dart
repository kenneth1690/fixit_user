import 'package:fixit_user/widgets/common_cached_image.dart';

import '../config.dart';

class CommonImageLayout extends StatelessWidget {
  final double? height, width, radius,tlRadius,tRRadius,blRadius,bRRadius;
  final String? image, assetImage;
  final bool isCircle, isBorder, isAllBorderRadius;
  final BoxFit? boxFit;

  const CommonImageLayout(
      {super.key,
      this.height,
      this.width,
      this.radius,
      this.image,
      this.isCircle = false,
      this.boxFit,
      this.isBorder = false,
      this.isAllBorderRadius = true,
      this.assetImage, this.tlRadius, this.tRRadius, this.blRadius, this.bRRadius});

  @override
  Widget build(BuildContext context) {
    return  image != null ?  CachedNetworkImage(
        imageUrl: image!,
        imageBuilder: (context, imageProvider) => CommonCachedNetworkImage(
            height: height,
            width: width,
            isCircle: isCircle,
            image: imageProvider,

            isAllBorderRadius: isAllBorderRadius,
            radius: radius,
            boxFit: boxFit,
            isBorder: isBorder,tlRadius: tlRadius,blRadius: blRadius,bRRadius: bRRadius,tRRadius: tRRadius),
        placeholder: (context, url) => CommonCachedImage(
            height: height,
            width: width,
            assetImage:assetImage,
            image: assetImage,
            isCircle: isCircle,isBorder: isBorder,boxFit: boxFit,radius: radius,isAllBorderRadius: isAllBorderRadius,tlRadius: tlRadius,blRadius: blRadius,bRRadius: bRRadius,tRRadius: tRRadius),
        errorWidget: (context, url, error) => CommonCachedImage(
            height: height,
            width: width,assetImage: assetImage,
            isAllBorderRadius: isAllBorderRadius,
            image: assetImage,boxFit: boxFit,
            isCircle: isCircle,tlRadius: tlRadius,blRadius: blRadius,bRRadius: bRRadius,tRRadius: tRRadius)):CommonCachedImage(
        height: height,
        width: width,
        assetImage: assetImage ,
        isAllBorderRadius: isAllBorderRadius,
        image:image,boxFit: boxFit,
        isCircle: isCircle,tlRadius: tlRadius,blRadius: blRadius,bRRadius: bRRadius,tRRadius: tRRadius);
  }
}
