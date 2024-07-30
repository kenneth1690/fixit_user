import '../../../../config.dart';

class HomeCouponShimmer extends StatelessWidget {
  const HomeCouponShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...List.generate(2, (index) {
            return Stack(children: [
              CommonSkeleton(
                  baseColor: Colors.grey,
                  child: CustomPaint(
                      size: Size(Sizes.s250, (Sizes.s70).toDouble()),
                      painter: CouponPainter())),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      CommonWhiteShimmer(
                          height: Sizes.s40,
                          width: Sizes.s40,
                          isCircle: true),
                      HSpace(Sizes.s8),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWhiteShimmer(
                                height: Sizes.s18, width: Sizes.s115),
                            VSpace(Sizes.s3),
                            CommonWhiteShimmer(
                                height: Sizes.s18, width: Sizes.s80)
                          ])
                    ]),
                    HSpace(Sizes.s25),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CommonWhiteShimmer(
                              height: Sizes.s18, width: Sizes.s35),
                          VSpace(Sizes.s3),
                          CommonWhiteShimmer(
                              height: Sizes.s18, width: Sizes.s26)
                        ])
                  ])
                  .marginSymmetric(horizontal: Sizes.s10, vertical: Sizes.s15)
            ]).marginSymmetric(horizontal: Sizes.s10);
          })
        ]).marginSymmetric(horizontal: Sizes.s10));
  }
}
