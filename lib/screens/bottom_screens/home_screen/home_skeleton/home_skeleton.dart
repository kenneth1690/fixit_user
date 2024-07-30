import 'package:fixit_user/config.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark(context)?Colors.black: Colors.white,
        body: ListView(children: [
      const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          CommonSkeleton(height: Sizes.s45, width: Sizes.s45, isCircle: true),
          HSpace(Sizes.s10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CommonSkeleton(height: Sizes.s14, width: Sizes.s138),
            VSpace(Sizes.s4),
            CommonSkeleton(height: Sizes.s14, width: Sizes.s155)
          ])
        ]),
        Row(children: [
          CommonSkeleton(height: Sizes.s45, width: Sizes.s45, isCircle: true),
          HSpace(Sizes.s10),
          CommonSkeleton(height: Sizes.s45, width: Sizes.s45, isCircle: true)
        ])
      ]).paddingSymmetric(horizontal: Sizes.s20),
      const VSpace(Sizes.s30),
      Stack(children: [
        const CommonSkeleton(height: Sizes.s224, radius: 0),
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CommonWhiteShimmer(width: Sizes.s70),
          VSpace(Sizes.s12),
          CommonWhiteShimmer(width: Sizes.s175),
          VSpace(Sizes.s12),
          CommonWhiteShimmer(width: Sizes.s130),
          VSpace(Sizes.s30),
          CommonWhiteShimmer(width: Sizes.s82, height: Sizes.s34)
        ]).paddingSymmetric(horizontal: Sizes.s25, vertical: Sizes.s40)
      ]),
      const VSpace(Sizes.s3),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CommonSkeleton(height: Sizes.s5, width: Sizes.s15),
            HSpace(Sizes.s3),
            CommonSkeleton(height: Sizes.s5, width: Sizes.s5, isCircle: true)
          ]),
      const VSpace(Sizes.s30),
      const RowText().paddingSymmetric(horizontal: Sizes.s20),
      const VSpace(Sizes.s20),
      const HomeCouponShimmer(),
      const VSpace(Sizes.s28),
      const RowText().paddingSymmetric(horizontal: Sizes.s20),
      const VSpace(Sizes.s17),
      const GridShimmer(),
      const VSpace(Sizes.s20),
      const RowText().paddingSymmetric(horizontal: Sizes.s20),
      const VSpace(Sizes.s17),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            ...List.generate(3, (index) {
              return const PackageShimmer();
            })
          ]).marginSymmetric(horizontal: Sizes.s10)),
      const VSpace(Sizes.s30),
          const RowText().paddingSymmetric(horizontal: Sizes.s20),

      const ServicesShimmer(),
      const VSpace(Sizes.s30),
      Container(
          color: appColor(context).skeletonColor,
          padding: const EdgeInsets.symmetric(vertical: Sizes.s28),
          child: Column(children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWhiteShimmer(height: Sizes.s18, width: Sizes.s155),
                  HSpace(Sizes.s3),
                  CommonWhiteShimmer(height: Sizes.s18, width: Sizes.s45)
                ]).padding(horizontal: Sizes.s20, bottom: Sizes.s17),
            const ExpertServiceShimmer()
          ])),
      const VSpace(Sizes.s28),
      const RowText().padding(horizontal: Sizes.s20, bottom: Sizes.s17),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            ...List.generate(2, (index) {
              return const BlogShimmerLayout();
            })
          ]).marginSymmetric(horizontal: Sizes.s20)),
      const VSpace(Sizes.s28)
    ]).paddingSymmetric(vertical: Sizes.s20));
  }
}
