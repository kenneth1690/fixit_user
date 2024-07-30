import 'package:fixit_user/screens/app_pages_screens/service_packages_screen/service_package_shimmer/service_package_shimmer.dart';
import 'package:flutter/rendering.dart';

import '../../../config.dart';

class PackageDetailsScreen extends StatelessWidget {
  const PackageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServicesPackageDetailsProvider>(
        builder: (context1, packageCtrl, child) {
      return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            packageCtrl.onBack(context, false);
            if (didPop) return;
          },
          child: StatefulWrapper(
              onInit: () => Future.delayed(DurationClass.ms20)
                  .then((_) => packageCtrl.onReady(context)),
              child: RefreshIndicator(
                onRefresh: (){
                  return packageCtrl.onRefresh(context);
                },
                child: Stack(children: [
                  LoadingComponent(
                      child: packageCtrl.widget1Opacity == 0.0 ?const ServicePackageShimmer() : Scaffold(
                          appBar: AppBarCommon(
                              title: appFonts.packageDetails,
                              onTap: () => packageCtrl.onBack(context, true)),
                          body: packageCtrl.service == null
                              ? Container()
                              : Stack(children: [
                                  SingleChildScrollView(
                                      controller: packageCtrl.scrollController,
                                      child: Column(children: [
                                        SizedBox(
                                                child: Column(children: [
                                          PackageTopLayout(
                                              packageModel: packageCtrl.service),
                                          const VSpace(Sizes.s15),
                                          Column(children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      language(
                                                          context,
                                                          appFonts
                                                              .profileDetails),
                                                      style: appCss
                                                          .dmDenseMedium12
                                                          .textColor(
                                                              appColor(context)
                                                                  .lightText)),
                                                  Row(children: [
                                                    Text(
                                                        language(context,
                                                            appFonts.view),
                                                        style: appCss
                                                            .dmDenseMedium12
                                                            .textColor(
                                                                appColor(context)
                                                                    .primary)),
                                                    const HSpace(Sizes.s4),
                                                    SvgPicture.asset(
                                                        eSvgAssets
                                                            .anchorArrowRight,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                                appColor(context)
                                                                    .primary,
                                                                BlendMode.srcIn))
                                                  ]).inkWell(
                                                      onTap: () => route.pushNamed(
                                                              context,
                                                              routeName
                                                                  .providerDetailsScreen,
                                                              arg: {
                                                                'provider':
                                                                    packageCtrl
                                                                        .service!
                                                                        .user!
                                                              }))
                                                ]).paddingSymmetric(
                                                horizontal: Insets.i15),
                                            Divider(
                                                    height: 1,
                                                    color:
                                                        appColor(context).stroke)
                                                .paddingSymmetric(
                                                    vertical: Insets.i15),
                                            ProviderDetailLayout(
                                                image:
                                                    packageCtrl.service!
                                                                    .user!.media !=
                                                                null &&
                                                            packageCtrl
                                                                .service!
                                                                .user!
                                                                .media!
                                                                .isNotEmpty
                                                        ? packageCtrl
                                                            .service!
                                                            .user!
                                                            .media![0]
                                                            .originalUrl!
                                                        : null,
                                                name: packageCtrl
                                                    .service!.user!.name,
                                                rate: packageCtrl.service!.user!
                                                            .reviewRatings !=
                                                        null
                                                    ? packageCtrl.service!.user!
                                                        .reviewRatings
                                                        .toString()
                                                    : "0",
                                                star: eSvgAssets.star3)
                                          ])
                                              .paddingSymmetric(
                                                  vertical: Insets.i15)
                                              .boxShapeExtension(
                                                  color: appColor(context)
                                                      .fieldCardBg),
                                          Text(
                                                  language(context,
                                                      appFonts.includedService),
                                                  style: appCss.dmDenseMedium14
                                                      .textColor(appColor(context)
                                                          .darkText))
                                              .paddingOnly(
                                                  top: Insets.i15,
                                                  bottom: Insets.i10)
                                              .alignment(Alignment.centerLeft),
                                          Column(
                                                  children: packageCtrl
                                                      .service!.services!
                                                      .asMap()
                                                      .entries
                                                      .map((e) =>
                                                          IncludedServiceLayout(
                                                              data: e.value,
                                                              index: e.key,
                                                              list: packageCtrl
                                                                  .service!
                                                                  .services!))
                                                      .toList())
                                              .paddingAll(Insets.i15)
                                              .boxShapeExtension(
                                                  color: appColor(context)
                                                      .fieldCardBg),
                                          const DottedLines().paddingSymmetric(
                                              vertical: Insets.i15),
                                          DisclaimerLayout(
                                              title: appFonts
                                                  .servicePackageDisclaimer,
                                              color: appColor(context).red)
                                        ]))
                                            .paddingAll(Insets.i15)
                                            .boxBorderExtension(context,
                                                isShadow: true,
                                                radius: AppRadius.r12),
                                        const VSpace(Sizes.s100),
                                      ]).paddingSymmetric(
                                          horizontal: Insets.i20)),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: AnimatedBuilder(
                                          animation: packageCtrl.scrollController,
                                          builder: (BuildContext context,
                                              Widget? child) {
                                            return AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                height: packageCtrl
                                                            .scrollController
                                                            .position
                                                            .userScrollDirection ==
                                                        ScrollDirection.reverse
                                                    ? 0
                                                    : 70,
                                                child: child);
                                          },
                                          child: ButtonCommon(
                                                  margin: Insets.i20,
                                                  title: appFonts.addToCart,
                                                  onTap: () => route
                                                          .pushNamed(
                                                              context,
                                                              routeName
                                                                  .selectServiceScreen,
                                                              arg: {
                                                            "services":
                                                                packageCtrl
                                                                    .service,
                                                            "id": packageCtrl
                                                                .service!.id
                                                          }))
                                              .marginOnly(bottom: Insets.i20)
                                              .backgroundColor(
                                                  appColor(context).whiteBg)))
                                ])))
                ]),
              )));
    });
  }
}
