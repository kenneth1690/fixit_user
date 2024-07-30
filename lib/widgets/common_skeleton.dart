import 'package:figma_squircle/figma_squircle.dart';
import 'package:shimmer/shimmer.dart';

import '../config.dart';

class CommonSkeleton extends StatelessWidget {
  final double? height, width, radius, tLRadius, tRRadius, bLRadius, bRRadius;
  final Widget? child;
  final Color? backgroundColor;
  final Color? baseColor;
  final Color? highlightColor;
  final bool isCircle, isAllRadius;

  const CommonSkeleton(
      {super.key,
      this.height,
      this.width,
      this.child,
      this.backgroundColor,
      this.baseColor,
      this.highlightColor,
      this.radius,
      this.isCircle = false,
      this.isAllRadius = false,
      this.tLRadius,
      this.tRRadius,
      this.bLRadius,
      this.bRRadius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ??( isDark(context)?const Color(0xFF202020).withOpacity(.5): Colors.grey.withOpacity(0.4)),
      highlightColor: highlightColor ??( isDark(context)?const Color(0xFF292929).withOpacity(.2): Colors.grey.withOpacity(.2)),
      enabled: true,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 1),
      child: child ??
          Container(
            height: height,
            width: width ?? MediaQuery.of(context).size.width,
            decoration: isCircle
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: appColor(context).trans),
                    color: backgroundColor ??
                       (isDark(context)?Colors.black:  const Color(0xFFF6F7F9).withOpacity(.3)))
                : ShapeDecoration(
                    color: backgroundColor ??
                        (isDark(context)?Colors.black: const Color(0xFFF6F7F9).withOpacity(.3)),
                    shape: SmoothRectangleBorder(
                        side: const BorderSide(color: Colors.transparent),
                        borderRadius: isAllRadius
                            ? SmoothBorderRadius.only(
                                topRight: SmoothRadius(
                                    cornerRadius: tRRadius ?? 1,
                                    cornerSmoothing: 1),
                                topLeft: SmoothRadius(
                                    cornerRadius: tLRadius ?? 1,
                                    cornerSmoothing: 1),
                                bottomLeft: SmoothRadius(
                                    cornerRadius: bLRadius ?? 1,
                                    cornerSmoothing: 1),
                                bottomRight: SmoothRadius(
                                    cornerRadius: bRRadius ?? 1,
                                    cornerSmoothing: 1))
                            : SmoothBorderRadius.all(SmoothRadius(
                                cornerRadius: radius ?? 9,
                                cornerSmoothing: 1)))),
          ),
    );
  }
}

class CommonWhiteShimmer extends StatelessWidget {
  final double? height, width, radius;
  final bool isCircle,isSmoothRadius;

  const CommonWhiteShimmer(
      {super.key, this.height, this.width, this.radius, this.isCircle = false,this.isSmoothRadius =false});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? Sizes.s20,
        width: width,
        decoration: isCircle
            ? BoxDecoration(
                color: isDark(context)?const Color(0xFF202020).withOpacity(.5): appColor(context).whiteBg, shape: BoxShape.circle)
            : isSmoothRadius?ShapeDecoration(
            color: appColor(context).whiteBg,
            shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                    cornerRadius: radius ?? 8, cornerSmoothing: 1)))  : BoxDecoration(
                color:  isDark(context)?const Color(0xFF202020).withOpacity(.5):appColor(context).whiteBg,
                borderRadius: BorderRadius.circular(radius ?? 50)));
  }
}
