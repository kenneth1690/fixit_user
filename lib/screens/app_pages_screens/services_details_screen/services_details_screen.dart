import 'package:fixit_user/common_tap.dart';
import 'package:fixit_user/screens/app_pages_screens/services_details_screen/service_detail_shimmer/services_details_shimmer.dart';
import 'package:flutter/rendering.dart';

import '../../../config.dart';

import 'dart:developer';

class ServicesDetailsScreen extends StatelessWidget {
  const ServicesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteListProvider>(builder: (context2, favCtrl, child) {
      return Consumer<ServicesDetailsProvider>(
          builder: (context1, serviceCtrl, child) {
        return Container(
          color: appColor(context).whiteBg,
          child: SafeArea(
            child: StatefulWrapper(
                onInit: () => Future.delayed(DurationClass.ms50)
                    .then((val) => serviceCtrl.onReady(context)),
                child: PopScope(
                    canPop: true,
                    onPopInvoked: (didPop) {
                      serviceCtrl.onBack(context, false);
                      if (didPop) return;
                    },
                    child: RefreshIndicator(
                      onRefresh: () {
                        return serviceCtrl.onRefresh(context);
                      },
                      child: LoadingComponent(
                        child: (serviceCtrl.widget1Opacity == 0.0)
                            ? const ServiceDetailShimmer()
                            : Scaffold(
                                body: AnimatedOpacity(
                                duration: const Duration(milliseconds: 1200),
                                opacity: serviceCtrl.widget1Opacity,
                                child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      SingleChildScrollView(
                                          controller:
                                              serviceCtrl.scrollController,
                                          child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                ServiceImageLayout(
                                                  onBack: () => serviceCtrl
                                                      .onBack(context, true),
                                                  isFav: favCtrl.serviceFavList
                                                      .where((element) =>
                                                          element.serviceId !=
                                                              null &&
                                                          element.serviceId.toString() ==
                                                              serviceCtrl
                                                                  .service!.id
                                                                  .toString())
                                                      .isNotEmpty,
                                                  title: serviceCtrl
                                                      .service!.title!,
                                                  image: serviceCtrl.service!
                                                          .media!.isNotEmpty
                                                      ? serviceCtrl
                                                          .service!
                                                          .media![serviceCtrl
                                                              .selectedIndex]
                                                          .originalUrl!
                                                      : "",
                                                  rating: serviceCtrl
                                                      .service!.ratingCount
                                                      ?.toString(),
                                                  favTap: (p0) {
                                                    log("FAV : $p0");
                                                    if (p0) {
                                                      favCtrl.addToFav(
                                                          context,
                                                          serviceCtrl
                                                              .service!.id,
                                                          'service');
                                                    } else {
                                                      favCtrl.deleteToFav(
                                                          context,
                                                          serviceCtrl
                                                              .service!.id,
                                                          'service');
                                                    }
                                                  },
                                                ),
                                                if (serviceCtrl.service!.media!
                                                        .length >
                                                    1)
                                                  const VSpace(Sizes.s12),
                                                if (serviceCtrl.service!.media!
                                                        .length >
                                                    1)
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: serviceCtrl
                                                          .service!.media!
                                                          .asMap()
                                                          .entries
                                                          .map((e) => ServicesImageLayout(
                                                              data: e.value,
                                                              index: e.key,
                                                              selectIndex:
                                                                  serviceCtrl
                                                                      .selectedIndex,
                                                              onTap: () =>
                                                                  serviceCtrl
                                                                      .onImageChange(
                                                                          e.key)))
                                                          .toList()),
                                                Column(children: [
                                                  Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Image.asset(
                                                            eImageAssets
                                                                .servicesBg,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  language(
                                                                      context,
                                                                      appFonts
                                                                          .amount),
                                                                  style: appCss
                                                                      .dmDenseMedium12
                                                                      .textColor(
                                                                          appColor(context)
                                                                              .primary)),
                                                              Text(
                                                                  "${getSymbol(context)}${(currency(context).currencyVal * double.parse(serviceCtrl.service!.serviceRate!)).toStringAsFixed(2)}",
                                                                  style: appCss
                                                                      .dmDenseBold18
                                                                      .textColor(
                                                                          appColor(context)
                                                                              .primary))
                                                            ]).paddingSymmetric(
                                                            horizontal:
                                                                Insets.i20)
                                                      ]).paddingSymmetric(
                                                      vertical: Insets.i15),
                                                  ServiceDescription(
                                                      services:
                                                          serviceCtrl.service),
                                                ]).paddingSymmetric(
                                                    horizontal: Insets.i20),
                                                if (serviceCtrl
                                                    .serviceFaq.isNotEmpty)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const VSpace(Sizes.s10),
                                                      Text(
                                                              language(context,
                                                                  appFonts.faq),
                                                              overflow:
                                                                  TextOverflow
                                                                      .clip,
                                                              style: appCss
                                                                  .dmDenseBold16
                                                                  .textColor(appColor(
                                                                          context)
                                                                      .darkText))
                                                          .paddingSymmetric(
                                                              horizontal:
                                                                  Sizes.s20),
                                                      const VSpace(Sizes.s10),
                                                      ...serviceCtrl.serviceFaq
                                                          .asMap()
                                                          .entries
                                                          .map((e) => Container(
                                                                margin: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        Sizes
                                                                            .s20,
                                                                    vertical:
                                                                        Sizes
                                                                            .s8),
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        Sizes
                                                                            .s20),
                                                                decoration: ShapeDecoration(
                                                                    shadows: [
                                                                      BoxShadow(
                                                                          blurRadius:
                                                                              2,
                                                                          spreadRadius:
                                                                              2,
                                                                          color: appColor(context)
                                                                              .darkText
                                                                              .withOpacity(0.06))
                                                                    ],
                                                                    color: appColor(
                                                                            context)
                                                                        .whiteBg,
                                                                    shape: SmoothRectangleBorder(
                                                                        borderRadius: SmoothBorderRadius(
                                                                            cornerRadius:
                                                                                8,
                                                                            cornerSmoothing:
                                                                                1))),
                                                                child:
                                                                    ExpansionTile(
                                                                        expansionAnimationStyle: AnimationStyle(
                                                                            curve: Curves
                                                                                .fastOutSlowIn),
                                                                        key: Key(serviceCtrl
                                                                            .selected
                                                                            .toString()),
                                                                        initiallyExpanded: e.key ==
                                                                            serviceCtrl
                                                                                .selected,
                                                                        onExpansionChanged: (newState) => serviceCtrl.onExpansionChange(
                                                                            newState,
                                                                            e
                                                                                .key),
                                                                        //atten
                                                                        tilePadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        collapsedIconColor:
                                                                            appColor(context)
                                                                                .darkText,
                                                                        dense:
                                                                            true,
                                                                        iconColor:
                                                                            appColor(context)
                                                                                .darkText,
                                                                        title: Text(
                                                                            e.value
                                                                                .question!,
                                                                            style:
                                                                                appCss.dmDenseMedium14.textColor(appColor(context).darkText)),
                                                                        children: <Widget>[
                                                                      Divider(
                                                                        color: appColor(context)
                                                                            .stroke,
                                                                        height:
                                                                            .5,
                                                                        thickness:
                                                                            0,
                                                                      ),
                                                                      ListTile(
                                                                          contentPadding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: Sizes
                                                                                  .s5),
                                                                          title: Text(
                                                                              e.value.answer!,
                                                                              style: appCss.dmDenseLight14.textColor(appColor(context).darkText.withOpacity(.8))))
                                                                    ]),
                                                              ))
                                                    ],
                                                  ).marginOnly(top: Sizes.s10),
                                                if (serviceCtrl.service!
                                                            .relatedServices !=
                                                        null &&
                                                    serviceCtrl
                                                        .service!
                                                        .relatedServices!
                                                        .isNotEmpty)
                                                  HeadingRowCommon(
                                                    title:
                                                        appFonts.alsoProvided,
                                                    onTap: () => route.pushNamed(
                                                        context,
                                                        routeName
                                                            .providerDetailsScreen,
                                                        arg: {
                                                          'provider':
                                                              serviceCtrl
                                                                  .service!.user
                                                        }),
                                                  ).padding(
                                                      top: Insets.i25,
                                                      bottom: Insets.i15,
                                                      horizontal: Insets.i20),
                                                if (serviceCtrl.service!.relatedServices !=
                                                        null &&
                                                    serviceCtrl
                                                        .service!
                                                        .relatedServices!
                                                        .isNotEmpty)
                                                  SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children:
                                                              serviceCtrl
                                                                  .service!
                                                                  .relatedServices!
                                                                  .asMap()
                                                                  .entries
                                                                  .map(
                                                                      (e) =>
                                                                          ServiceListLayout(
                                                                            data:
                                                                                e.value,
                                                                            favTap:
                                                                                (p0) {
                                                                              log("FAV : $p0");
                                                                              if (p0) {
                                                                                favCtrl.addToFav(context, e.value.id, 'service');
                                                                              } else {
                                                                                favCtrl.deleteToFav(context, e.value.id, 'service');
                                                                              }
                                                                            },
                                                                            onTap: () => serviceCtrl.onFeatured(
                                                                                context,
                                                                                e.value,
                                                                                e.key),
                                                                            isFav:
                                                                                favCtrl.serviceFavList.where((element) => element.serviceId != null && element.serviceId == e.value.id.toString()).isNotEmpty,
                                                                          )
                                                                              .inkWell(
                                                                                  onTap: () => route.pushNamed(context, routeName.servicesDetailsScreen, arg: {
                                                                                        'services': e.value
                                                                                      }))
                                                                              .paddingOnly(left: Insets.i20))
                                                                  .toList())),
                                              ])
                                              .marginOnly(bottom: Insets.i100)),
                                      /*                  ButtonCommon(
                                  margin: Insets.i20,
                                  title: appFonts.addToCart,
                                  onTap: () => onBook(context, serviceCtrl.service!,
                                          addTap: () => serviceCtrl.onAdd(),
                                          minusTap: () =>
                                              serviceCtrl.onRemoveService(context))
                                      .then((e) {
                                    serviceCtrl
                                            .service!.selectedRequiredServiceMan =
                                        serviceCtrl.service!.requiredServicemen;
                                    serviceCtrl.notifyListeners();
                                  }),
                                ).paddingOnly(bottom: Insets.i20).decorated(
                                    color: appColor(context).whiteBg)*/
                                      AnimatedBuilder(
                                          animation:
                                              serviceCtrl.scrollController,
                                          builder: (BuildContext context,
                                              Widget? child) {
                                            return AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              height: serviceCtrl
                                                          .scrollController
                                                          .position
                                                          .userScrollDirection ==
                                                      ScrollDirection.reverse
                                                  ? 0
                                                  : 70,
                                              child: child,
                                            );
                                          },
                                          child: ButtonCommon(
                                                  margin: Insets.i20,
                                                  title: appFonts.addToCart,
                                                  onTap: () {
                                                    final providerDetail = Provider
                                                        .of<ProviderDetailsProvider>(
                                                            context,
                                                            listen: false);
                                                    providerDetail
                                                        .selectProviderIndex = 0;
                                                    providerDetail
                                                        .notifyListeners();
                                                    onBook(context,
                                                        serviceCtrl.service!,
                                                        addTap: () =>
                                                            serviceCtrl.onAdd(),
                                                        minusTap: () => serviceCtrl
                                                            .onRemoveService(
                                                                context)).then(
                                                        (e) {
                                                      serviceCtrl.service!
                                                              .selectedRequiredServiceMan =
                                                          serviceCtrl.service!
                                                              .requiredServicemen;
                                                      serviceCtrl
                                                          .notifyListeners();
                                                    });
                                                  })
                                              .marginOnly(bottom: Insets.i20)
                                              .backgroundColor(
                                                  appColor(context).whiteBg))
                                    ]),
                              )),
                      ),
                    ))),
          ),
        );
      });
    });
  }
}
