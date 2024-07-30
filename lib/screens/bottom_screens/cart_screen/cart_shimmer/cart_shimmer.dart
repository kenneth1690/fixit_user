import 'package:fixit_user/config.dart';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark(context) ? Colors.black : Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const VSpace(Sizes.s50),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonSkeleton(
                        height: Sizes.s40, width: Sizes.s40, isCircle: true),
                    CommonSkeleton(
                        height: Sizes.s23, width: Sizes.s138, radius: 12),
                    CommonSkeleton(
                        height: Sizes.s40, width: Sizes.s40, isCircle: true)
                  ]),
              const VSpace(Sizes.s25),
              ...List.generate(
                  3,
                  (index) => Column(
                        children: [
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CommonSkeleton(
                                        height: Sizes.s38,
                                        width: Sizes.s38,
                                        isCircle: true),
                                    HSpace(Sizes.s11),
                                    CommonSkeleton(
                                        height: Sizes.s10,
                                        width: Sizes.s72,
                                        radius: 4),
                                    HSpace(Sizes.s18),
                                    CommonSkeleton(
                                        height: Sizes.s13, width: Sizes.s38),
                                  ],
                                ),
                                Row(children: [
                                  CommonSkeleton(
                                      height: Sizes.s30,
                                      width: Sizes.s30,
                                      isCircle: true),
                                  HSpace(Sizes.s12),
                                  CommonSkeleton(
                                      height: Sizes.s30,
                                      width: Sizes.s30,
                                      isCircle: true)
                                ])
                              ]),
                          const VSpace(Sizes.s24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CommonSkeleton(
                                        height: Sizes.s14,
                                        width: Sizes.s182,
                                        radius: 12),
                                    const VSpace(Sizes.s20),
                                    const Row(children: [
                                      CommonSkeleton(
                                          height: Sizes.s14, width: Sizes.s58),
                                      HSpace(Sizes.s8),
                                      CommonSkeleton(
                                          height: Sizes.s11, width: Sizes.s50)
                                    ]),
                                    const VSpace(Sizes.s10),
                                    Row(
                                        children: List.generate(
                                            2,
                                            (index) => Expanded(
                                              child: const Row(
                                                    children: [
                                                      Expanded(
                                                        child: CommonSkeleton(
                                                            height: Sizes.s14,
                                                            width: Sizes.s16,
                                                            radius: 0),
                                                      ),
                                                      HSpace(Sizes.s5),
                                                      Expanded(
                                                        child: CommonSkeleton(
                                                            height: Sizes.s14,
                                                            width: Sizes.s72,
                                                            radius: 7),
                                                      ),
                                                    ],
                                                  ).marginOnly(
                                                      right: rtl(context)
                                                          ? 0
                                                          : Sizes.s17,
                                                      left: rtl(context)
                                                          ? Sizes.s17
                                                          : 0),
                                            )))
                                  ],
                                ),
                              ),
                              const CommonSkeleton(
                                  height: Sizes.s92, width: Sizes.s92),
                            ],
                          ),
                          const VSpace(Sizes.s16),
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonSkeleton(
                                    height: Sizes.s8, width: Sizes.s125),
                                CommonSkeleton(
                                    height: Sizes.s8, width: Sizes.s75)
                              ]),
                          const VSpace(Sizes.s35),
                          if (index == 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CommonSkeleton(
                                    height: Sizes.s8, width: Sizes.s270),
                                const VSpace(Sizes.s8),
                                const CommonSkeleton(
                                        height: Sizes.s8, width: Sizes.s94)
                                    .paddingSymmetric(horizontal: Sizes.s23),
                              ],
                            ),
                          if (index != 0)
                            ...List.generate(
                                index == 1 ? 1 : 2,
                                (i) => Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        const CommonSkeleton(
                                            height: Sizes.s65, radius: 12),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(children: [
                                              CommonWhiteShimmer(
                                                  height: Sizes.s40,
                                                  width: Sizes.s40,
                                                  isCircle: true),
                                              HSpace(Sizes.s7),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CommonWhiteShimmer(
                                                        height: Sizes.s11,
                                                        width: Sizes.s66),
                                                    VSpace(Sizes.s8),
                                                    CommonWhiteShimmer(
                                                        height: Sizes.s11,
                                                        width: Sizes.s96)
                                                  ])
                                            ]),
                                            CommonWhiteShimmer(
                                                height: Sizes.s11,
                                                width: Sizes.s34)
                                          ],
                                        ).paddingAll(Sizes.s12)
                                      ],
                                    ).marginOnly(
                                        bottom: index == 1
                                            ? i == 1
                                                ? 0
                                                : 0
                                            : 10)),
                          if (index == 2)
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const VSpace(Sizes.s34),
                                  const CommonSkeleton(
                                      height: Sizes.s8, width: Sizes.s300),
                                  const VSpace(Sizes.s8),
                                  const CommonSkeleton(
                                          height: Sizes.s8, width: Sizes.s262)
                                      .paddingSymmetric(horizontal: Sizes.s23),
                                  const VSpace(Sizes.s8),
                                  const CommonSkeleton(
                                          height: Sizes.s8, width: Sizes.s26)
                                      .paddingSymmetric(horizontal: Sizes.s23)
                                ])
                        ],
                      )
                          .paddingAll(Sizes.s15)
                          .boxBorderExtension(context,
                              color:isDark(context)?Colors.black26:appColor(context).whiteBg,
                              isShadow:  true,
                              bColor:isDark(context)?Colors.grey.withOpacity(.2):  appColor(context).skeletonColor)
                          .marginOnly(bottom: Sizes.s15)),
              const VSpace(Sizes.s20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonSkeleton(height: Sizes.s12, width: Sizes.s115),
                  const VSpace(Sizes.s12),
                  rtl(context)
                      ? Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: Image.asset(eImageAssets.couponShimmer,
                              height: Sizes.s50,
                              width: MediaQuery.of(context).size.width))
                      : Image.asset(eImageAssets.couponShimmer,
                          height: Sizes.s50,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width),
                  const VSpace(Sizes.s8),
                  const Row(
                    children: [
                      CommonSkeleton(
                          height: Sizes.s18, width: Sizes.s18, radius: 0),
                      HSpace(Sizes.s5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonSkeleton(height: Sizes.s12, width: Sizes.s266),
                          VSpace(Sizes.s7),
                          CommonSkeleton(height: Sizes.s12, width: Sizes.s200),
                        ],
                      )
                    ],
                  ),
                  const VSpace(Sizes.s24),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonSkeleton(height: Sizes.s12, width: Sizes.s87),
                        CommonSkeleton(height: Sizes.s12, width: Sizes.s92)
                      ]),
                  const VSpace(Sizes.s13),
                  Stack(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: Sizes.s20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(eImageAssets.shimmerBg),
                                fit: BoxFit.fill)),
                        child: Column(
                          children: [
                            const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonWhiteShimmer(
                                      height: Sizes.s10, width: Sizes.s67),
                                  CommonWhiteShimmer(
                                      height: Sizes.s12, width: Sizes.s50)
                                ]).paddingOnly(
                                bottom: Sizes.s24,
                                right: Sizes.s20,
                                left: Sizes.s20),
                            const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonWhiteShimmer(
                                      height: Sizes.s10, width: Sizes.s67),
                                  CommonWhiteShimmer(
                                      height: Sizes.s12, width: Sizes.s42)
                                ]).paddingOnly(
                                bottom: Sizes.s24,
                                right: Sizes.s20,
                                left: Sizes.s20),
                            const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonWhiteShimmer(
                                      height: Sizes.s10, width: Sizes.s110),
                                  CommonWhiteShimmer(
                                      height: Sizes.s12, width: Sizes.s42)
                                ]).paddingOnly(
                                bottom: Sizes.s24,
                                right: Sizes.s20,
                                left: Sizes.s20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonWhiteShimmer(
                                    height: Sizes.s10, width: Sizes.s52),
                                CommonWhiteShimmer(
                                    height: Sizes.s12, width: Sizes.s50),
                              ],
                            ).paddingOnly(
                                bottom: Sizes.s24,
                                right: Sizes.s20,
                                left: Sizes.s20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonWhiteShimmer(
                                    height: Sizes.s10, width: Sizes.s116),
                                CommonWhiteShimmer(
                                    height: Sizes.s12, width: Sizes.s50),
                              ],
                            ).paddingOnly(
                                bottom: Sizes.s24,
                                right: Sizes.s20,
                                left: Sizes.s20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonWhiteShimmer(
                                    height: Sizes.s10, width: Sizes.s55),
                                CommonWhiteShimmer(
                                    height: Sizes.s12, width: Sizes.s50),
                              ],
                            ).paddingOnly(
                                bottom: Sizes.s24,
                                right: Sizes.s20,
                                left: Sizes.s20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonWhiteShimmer(
                                    height: Sizes.s10, width: Sizes.s86),
                                CommonWhiteShimmer(
                                    height: Sizes.s12, width: Sizes.s50),
                              ],
                            ).paddingOnly(
                                bottom: Sizes.s24,
                                right: Sizes.s20,
                                left: Sizes.s20),
                            Divider(color: appColor(context).stroke)
                                .paddingSymmetric(horizontal: Sizes.s8),
                            const VSpace(Sizes.s35),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonWhiteShimmer(
                                    height: Sizes.s13, width: Sizes.s105),
                                CommonWhiteShimmer(
                                    height: Sizes.s13, width: Sizes.s47),
                              ],
                            ).paddingSymmetric(horizontal: Sizes.s20),
                            const VSpace(Sizes.s24),
                          ],
                        ),
                      )
                    ],
                  ),
                  const VSpace(Sizes.s30),
                  const CommonSkeleton(height: Sizes.s14, width: Sizes.s68),
                  const VSpace(Sizes.s12),
                  const CommonSkeleton(height: Sizes.s12, width: Sizes.s315),
                  const VSpace(Sizes.s8),
                  const CommonSkeleton(height: Sizes.s12, width: Sizes.s160),
                  const VSpace(Sizes.s150)
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
