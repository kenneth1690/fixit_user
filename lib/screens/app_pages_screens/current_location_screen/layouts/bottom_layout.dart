import 'dart:developer';

import '../../../../config.dart';

class BottomLocationLayout extends StatelessWidget {
  const BottomLocationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context1, value, child) {

      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonArrow(svgColor: appColor(context).whiteBg,
                        color: appColor(context).primary,
                        arrow: rtl(context)
                            ? eSvgAssets.arrowRight
                            : eSvgAssets.arrowLeft)
                    .inkWell(onTap: () => route.pop(context)),

                CommonArrow(svgColor: appColor(context).whiteBg,
                    color: appColor(context).primary,
                    arrow:eSvgAssets.search)
                    .inkWell(onTap: () => value.searchLocation(context))

              ],
            ) .paddingSymmetric(vertical: Insets.i50, horizontal: Insets.i20),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      height: Sizes.s40,
                      width: Sizes.s40,
                      margin:
                          const EdgeInsets.symmetric(horizontal: Insets.i20),
                      decoration: ShapeDecoration(
                          color: appColor(context).primary,
                          shape: SmoothRectangleBorder(
                              borderRadius: SmoothBorderRadius(
                                  cornerRadius: 8, cornerSmoothing: 1))),
                      child: SvgPicture.asset(
                        eSvgAssets.zipcode,
                        fit: BoxFit.scaleDown,
                        colorFilter: ColorFilter.mode(
                            appColor(context).whiteBg,
                            BlendMode.srcIn),
                      )).inkWell(onTap: () => value.fetchCurrent(context)),
                ),
                const VSpace(Sizes.s20),
                Container(
                        child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(language(context, appFonts.selectService),
                            style: appCss.dmDenseRegular14.textColor(
                                appColor(context).lightText)),
                      ]),
                  const VSpace(Sizes.s15),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(eSvgAssets.location,
                                  colorFilter: ColorFilter.mode(
                                      appColor(context).primary,
                                      BlendMode.srcIn))
                              .paddingAll(Insets.i7)
                              .decorated(
                                  color: appColor(context)
                                      
                                      .primary
                                      .withOpacity(0.15),
                                  shape: BoxShape.circle),
                          const HSpace(Sizes.s12),
                          if (currentAddress != null && street != null)
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (currentAddress != null)
                                    Text(currentAddress!,
                                        style: appCss.dmDenseBold14.textColor(
                                            appColor(context)
                                                
                                                .darkText)),
                                  const VSpace(Sizes.s8),
                                  SizedBox(
                                      width: Sizes.s200,
                                      child: Text(street!,
                                          style: appCss.dmDenseRegular13
                                              .textColor(appColor(context)
                                                  
                                                  .lightText)))
                                ])
                        ])
                  ])
                      .paddingAll(Insets.i12)
                      .boxBorderExtension(context,
                          bColor: appColor(context).fieldCardBg,
                          color: appColor(context).fieldCardBg,
                          radius: AppRadius.r8)
                      .paddingOnly(bottom: Insets.i15),
                  ButtonCommon(
                    title: appFonts.confirmLocation,
                    onTap: () => route.pushNamed(
                        context, routeName.addNewLocation,
                        arg: value.argumentData),
                  )
                ]).paddingAll(Insets.i20))
                    .bottomSheetExtension(context),
              ],
            )
          ]);
    });
  }
}
