import 'package:fixit_user/config.dart';

class OfferShimmer extends StatelessWidget {
  const OfferShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: ListView(
  padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
  children: [
    const VSpace(Sizes.s50),
    const CommonSkeleton(height: Sizes.s15,width: Sizes.s94).alignment(Alignment.centerLeft),
    const VSpace(Sizes.s40),
    ...List.generate(2, (index) => Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommonSkeleton(height: Sizes.s14,width: Sizes.s150),
        const VSpace(Sizes.s20),
        ...List.generate( index ==0 ?2:3, (i) => Stack(
          children: [
            const CommonSkeleton(height: Sizes.s137,radius: 14),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWhiteShimmer(height: Sizes.s7,width: Sizes.s48),
                VSpace(Sizes.s8),
                CommonWhiteShimmer(height: Sizes.s13,width: Sizes.s75),
                VSpace(Sizes.s13),
                CommonWhiteShimmer(height: Sizes.s12,width: Sizes.s158),
                VSpace(Sizes.s26),
                CommonWhiteShimmer(height: Sizes.s9,width: Sizes.s53)
              ],
            ).marginAll(Sizes.s20)

          ],
        ).marginOnly(bottom: Sizes.s15))
      ],
    ).marginOnly(bottom: Sizes.s10)),
    const VSpace(Sizes.s120),
  ],
),
    );
  }
}
