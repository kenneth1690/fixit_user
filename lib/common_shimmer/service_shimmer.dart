import 'package:fixit_user/config.dart';

class ServicesShimmer extends StatelessWidget {
  final int count;
  const ServicesShimmer({super.key,  this.count =2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ ...List.generate(count, (index) {
        return Container(
            margin:  EdgeInsets.symmetric(
                horizontal:count >2?0: Sizes.s20, vertical: Sizes.s15),
            decoration: ShapeDecoration(
                color: isDark(context)?Colors.black26: appColor(context).whiteBg,
                shadows: isDark(context) ?[]: [
                  BoxShadow(
                      color:  appColor(context).darkText.withOpacity(0.06),
                      spreadRadius: 2,
                      blurRadius: 12)
                ],
                shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: 8, cornerSmoothing: 1),
                    side:
                    BorderSide(color:isDark(context)?appColor(context).whiteBg:  appColor(context).skeletonColor))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(children: [
                    CommonSkeleton(
                        height: Sizes.s30, width: Sizes.s30, isCircle: true),
                    HSpace(Sizes.s15),
                    CommonSkeleton(height: Sizes.s15, width: Sizes.s108)
                  ]).paddingAll(Sizes.s15),
                  const CommonSkeleton(height: Sizes.s145, radius: 0),
                  const VSpace(Sizes.s15),
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonSkeleton(height: Sizes.s16, width: Sizes.s155),
                        VSpace(Sizes.s10),
                        CommonSkeleton(height: Sizes.s16, width: Sizes.s224),
                        VSpace(Sizes.s10),
                        CommonSkeleton(height: Sizes.s16, width: Sizes.s205),
                        VSpace(Sizes.s10),
                        CommonSkeleton(height: Sizes.s16, width: Sizes.s175),
                        VSpace(Sizes.s10)
                      ]).paddingSymmetric(horizontal: Sizes.s15)
                ]));
      })],
    );
  }
}
