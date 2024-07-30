import '../config.dart';

class CommonCachedImage extends StatelessWidget {
  final double? height, width,radius,tlRadius,tRRadius,blRadius,bRRadius;
  final String? image,assetImage;
final bool isCircle,isBorder,isAllBorderRadius;
final BoxFit? boxFit;
  const CommonCachedImage({super.key, this.height, this.width, this.image, this.isCircle = false, this.radius, this.boxFit,  this.isBorder =false,  this.isAllBorderRadius=true, this.tlRadius, this.tRRadius, this.blRadius, this.bRRadius, this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width,

      decoration:isCircle?   BoxDecoration(
        shape: BoxShape.circle,
          border: isBorder ? Border.all(
              color: appColor(context).whiteColor,
              width: 4):null,
          image: DecorationImage(image: AssetImage(image!), fit: BoxFit.cover)):  ShapeDecoration(
          image: DecorationImage(
              image: AssetImage(image!), fit:boxFit?? BoxFit.cover),
          shape: SmoothRectangleBorder(

              borderRadius: isAllBorderRadius? SmoothBorderRadius(
                  cornerRadius: radius ??1, cornerSmoothing: 1): SmoothBorderRadius.only(
                topRight: SmoothRadius(
                    cornerRadius: tRRadius ?? 0, cornerSmoothing: 1),
                topLeft:  SmoothRadius(
                    cornerRadius: tlRadius ?? 0, cornerSmoothing: 1),
                  bottomRight: SmoothRadius(
                      cornerRadius:bRRadius??20, cornerSmoothing: 1),
                  bottomLeft: SmoothRadius(
                      cornerRadius: blRadius??20,
                      cornerSmoothing: 1)))),
    );
  }
}

class CommonCachedNetworkImage extends StatelessWidget {
  final double? height, width, radius,tlRadius,tRRadius,blRadius,bRRadius;
  final ImageProvider<Object>? image;
  final bool isCircle, isBorder, isAllBorderRadius;
  final BoxFit? boxFit;

  const CommonCachedNetworkImage(
      {super.key,
        this.height,
        this.width,
        this.image,
        this.isCircle = false,
        this.radius,
        this.boxFit,
        this.isBorder = false,
        this.isAllBorderRadius = true, this.tlRadius, this.tRRadius, this.blRadius, this.bRRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: isCircle
            ? BoxDecoration(

            shape: BoxShape.circle,
            border: isBorder
                ? Border.all(
                color: appColor(context).whiteColor, width: 4)
                : null,
            image: DecorationImage(image: image!, fit: BoxFit.cover))
            : ShapeDecoration(

            image:
            DecorationImage(image: image!, fit: boxFit ?? BoxFit.cover),
            shape: SmoothRectangleBorder(
                borderRadius: isAllBorderRadius
                    ? SmoothBorderRadius(
                    cornerRadius: radius ?? 1, cornerSmoothing: 1)
                    :  SmoothBorderRadius.only(
                    topRight: SmoothRadius(
                        cornerRadius: tRRadius ?? 0, cornerSmoothing: 1),
                    topLeft:  SmoothRadius(
                        cornerRadius: tlRadius ?? 0, cornerSmoothing: 1),
                    bottomRight: SmoothRadius(
                        cornerRadius:bRRadius??20, cornerSmoothing: 1),
                    bottomLeft: SmoothRadius(
                        cornerRadius: blRadius??20,
                        cornerSmoothing: 1)))));
  }
}
