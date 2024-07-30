import 'package:flutter/material.dart';

import '../../../../config.dart';

class ProviderDetailShimmer extends StatelessWidget {
  const ProviderDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.s20,
      ),
      children: [
        const VSpace(Sizes.s50),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonSkeleton(height: Sizes.s40, width: Sizes.s40, isCircle: true),
            CommonSkeleton(height: Sizes.s23, width: Sizes.s138),
            CommonSkeleton(height: Sizes.s40, width: Sizes.s40, isCircle: true)
          ],
        ),
        const VSpace(Sizes.s25),
        Container(
          padding: const EdgeInsets.all(Sizes.s20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(isDark(context)
                      ? eImageAssets.providerBgDark
                      : eImageAssets.providerBg),
                  fit: BoxFit.fill)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonWhiteShimmer(
                      height: Sizes.s80, width: Sizes.s80, isCircle: true)
                  .center(),
              const VSpace(Sizes.s8),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CommonWhiteShimmer(width: Sizes.s72, height: Sizes.s18),
                HSpace(Sizes.s6),
                CommonWhiteShimmer(
                    width: Sizes.s14, height: Sizes.s14, radius: 0)
              ]),
              const VSpace(Sizes.s8),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CommonWhiteShimmer(width: Sizes.s50, height: Sizes.s18),
                HSpace(Sizes.s7),
                CommonWhiteShimmer(width: Sizes.s72, height: Sizes.s18),
                HSpace(Sizes.s10),
                CommonWhiteShimmer(width: Sizes.s116, height: Sizes.s18)
              ]),
              const VSpace(Sizes.s26),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.s11, vertical: Sizes.s12),
                decoration: ShapeDecoration(
                    color: isDark(context) ?Colors.black26: appColor(context).whiteBg,
                    shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                            cornerRadius: 4, cornerSmoothing: 1))),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonSkeleton(height: Sizes.s17, width: Sizes.s116),
                      CommonSkeleton(height: Sizes.s17, width: Sizes.s116)
                    ]),
              ),
              const VSpace(Sizes.s15),
              const CommonWhiteShimmer(width: Sizes.s116, height: Sizes.s18),
              const VSpace(Sizes.s9),
              const CommonWhiteShimmer(width: Sizes.s260, height: Sizes.s18),
              const VSpace(Sizes.s6),
              const CommonWhiteShimmer(width: Sizes.s216, height: Sizes.s18),
              const VSpace(Sizes.s14),
              const CommonWhiteShimmer(width: Sizes.s100, height: Sizes.s18),
              const VSpace(Sizes.s11),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.s11, vertical: Sizes.s12),
                decoration: ShapeDecoration(
                    color: isDark(context)?Colors.black26: appColor(context).whiteColor,
                    shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                            cornerRadius: 4, cornerSmoothing: 1))),
                child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        CommonSkeleton(
                            height: Sizes.s14, width: Sizes.s14, radius: 0),
                        HSpace(Sizes.s8),
                        CommonSkeleton(height: Sizes.s17, width: Sizes.s25)
                      ]),
                      VSpace(Sizes.s8),
                      CommonSkeleton(height: Sizes.s14, width: Sizes.s178),
                      VSpace(Sizes.s20),
                      Row(children: [
                        CommonSkeleton(
                            height: Sizes.s14, width: Sizes.s14, radius: 0),
                        HSpace(Sizes.s8),
                        CommonSkeleton(height: Sizes.s17, width: Sizes.s25)
                      ]),
                      VSpace(Sizes.s10),
                      CommonSkeleton(height: Sizes.s14, width: Sizes.s96),
                      VSpace(Sizes.s15),
                      Row(children: [
                        CommonSkeleton(
                            height: Sizes.s14, width: Sizes.s14, radius: 0),
                        HSpace(Sizes.s8),
                        CommonSkeleton(height: Sizes.s17, width: Sizes.s25)
                      ]),
                      VSpace(Sizes.s13),
                      Row(children: [
                        CommonSkeleton(
                            height: Sizes.s32, width: Sizes.s69,radius: 6),
                        HSpace(Sizes.s12),
                        CommonSkeleton(height: Sizes.s32, width: Sizes.s69,radius: 6),
                        HSpace(Sizes.s12),
                        CommonSkeleton(height: Sizes.s32, width: Sizes.s69,radius: 6)
                      ])
                    ]),
              ),
            ],
          ),
        ),
        const VSpace(Sizes.s25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonSkeleton(height: Sizes.s14, width: Sizes.s165),
            const VSpace(Sizes.s20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:  List.generate(8, (index) {
                  return const Column(children: [
                    CommonSkeleton(height: Sizes.s60, width: Sizes.s60, radius: 10),
                    VSpace(Sizes.s11),
                    CommonSkeleton(height: Sizes.s13, width: Sizes.s60, radius: 10)
                  ]).padding( bottom: Sizes.s22,left: rtl(context) ? Sizes.s15:0,right: rtl(context) ? 0: Sizes.s15);
                }),
              ),
            ),
            const ServicesShimmer(count: 3),
          ],
        ),
      ],
    );
  }
}
