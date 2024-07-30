import 'dart:developer';

import 'package:fixit_user/common_tap.dart';
import 'package:fixit_user/screens/app_pages_screens/ongoing_booking_screen/layout/extra_service_add_billing.dart';
import 'package:fixit_user/screens/app_pages_screens/ongoing_booking_screen/layout/no_extra_service_billing.dart';
import 'package:flutter/rendering.dart';

import '../../../config.dart';
import '../../bottom_screens/booking_screen/booking_shimmer/booking_detail_shimmer.dart';

class OngoingBookingScreen extends StatefulWidget {
  const OngoingBookingScreen({super.key});

  @override
  State<OngoingBookingScreen> createState() => _OngoingBookingScreenState();
}

class _OngoingBookingScreenState extends State<OngoingBookingScreen>
    with TickerProviderStateMixin {


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      log("fdftsf :$state");
      final book = Provider.of<OngoingBookingProvider>(context,listen: false);
      book.getBookingDetailBy(context);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Consumer<OngoingBookingProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
          onInit: () =>
              Future.delayed(
                  const Duration(milliseconds: 100), () =>
                  value.onReady(context)),
          child: PopScope(
              canPop: true,
              onPopInvoked: (didPop) {
                value.onBack(context, false);
                if (didPop) return;

              },
              child:value.booking == null
                  ? const BookingDetailShimmer()
                  : Scaffold(
                  appBar: AppBarCommon(
                    title: appFonts.ongoingBooking,
                    onTap: () => value.onBack(context, true),
                  ),
                  body: value.booking == null
                      ? Container()
                      : LoadingComponent(
                      child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            RefreshIndicator(
                              onRefresh: () async {
                                value.onRefresh(context);
                              },
                              child: SingleChildScrollView(
                                  controller: value.scrollController,
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        StatusDetailLayout(
                                            data: value.booking,
                                            onTapStatus: () =>
                                                showBookingStatus(
                                                    context, value.booking)),
                                        if (value.booking!.extraCharges != null &&
                                            value.booking!.extraCharges!
                                                .isNotEmpty)
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    language(
                                                        context,
                                                        appFonts
                                                            .addedServiceDetails),
                                                    style: appCss
                                                        .dmDenseSemiBold14
                                                        .textColor(
                                                        appColor(context)

                                                            .darkText))
                                                    .padding(
                                                    top: Insets.i20,
                                                    bottom: Insets.i10),
                                                AddServiceLayout(
                                                    extraCharge: value
                                                        .booking!.extraCharges),
                                              ]),
                                        Text(
                                            language(
                                                context, appFonts.billSummary),
                                            style: appCss.dmDenseSemiBold14
                                                .textColor(appColor(context)
                                                .darkText))
                                            .paddingOnly(
                                            top: Insets.i25,
                                            bottom: Insets.i10),
                                        value.booking!.extraCharges != null &&
                                            value.booking!.extraCharges!
                                                .isNotEmpty
                                            ? ExtraServiceAddBilling(
                                            booking: value.booking)
                                            : NoExtraServiceAddedBill(
                                            bookingModel: value.booking),
                                        if (value.booking!.extraCharges !=
                                            null &&
                                            value.booking!.extraCharges!
                                                .isNotEmpty)
                                          Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    language(
                                                        context,
                                                        appFonts
                                                            .addedServiceDetails),
                                                    style: appCss
                                                        .dmDenseSemiBold14
                                                        .textColor(
                                                        appColor(context)
                                                            .darkText))
                                                    .padding(
                                                    top: Insets.i20,
                                                    bottom: Insets.i10),
                                                AddServiceLayout(
                                                    extraCharge: value
                                                        .booking!.extraCharges),
                                              ]),
                                        if(value.booking!.service!.reviews !=
                                            null &&
                                            value.booking!.service!.reviews!
                                                .isNotEmpty)
                                          Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                        language(
                                                            context,
                                                            appFonts.review),
                                                        overflow: TextOverflow
                                                            .clip,
                                                        style: appCss
                                                            .dmDenseSemiBold14
                                                            .textColor(
                                                            appColor(context)
                                                                .darkText))),
                                                Text(
                                                    language(context,
                                                        appFonts.viewAll),
                                                    style: appCss
                                                        .dmDenseRegular14
                                                        .textColor(
                                                        appColor(context)
                                                            .primary))
                                                    .inkWell(
                                                    onTap: () =>
                                                        route.pushNamed(
                                                            context,
                                                            routeName
                                                                .servicesReviewScreen,
                                                            arg: value
                                                                .booking!
                                                                .service))
                                              ]).paddingOnly(
                                              top: Insets.i20,
                                              bottom: Insets.i12),
                                        ...value.booking!.service!.reviews!
                                            .asMap()
                                            .entries
                                            .map((e) =>
                                            ServiceReviewLayout(
                                                data: e.value,
                                                index: e.key,
                                                list: appArray.reviewList)),
                                        const VSpace(Sizes.s100)
                                      ]).paddingOnly(
                                      left: Insets.i20, right: Insets.i20)),
                            ),
                            AnimatedBuilder(
                                animation: value.scrollController,
                                builder: (BuildContext context, Widget? child) {
                                  return AnimatedContainer(


                                      duration: const Duration(
                                          milliseconds: 400),
                                      height: value.scrollController.position
                                          .userScrollDirection ==
                                          ScrollDirection.reverse
                                          ? 0
                                          : 70,
                                      color: appColor(context).whiteBg,
                                      padding: const EdgeInsets.only(
                                          left: Insets.i20,
                                          right: Insets.i20,
                                          bottom: Insets.i20),
                                      child: value.booking!.bookingStatus!.slug ==
                                          appFonts.ontheway
                                          ? ButtonCommon(
                                          title: appFonts.startService,
                                          onTap: () => value.onStart(context))
                                          : value.isPayButton
                                          ? ButtonCommon(
                                          title:
                                          "${language(
                                              context,
                                              appFonts.pay)} ${getSymbol(
                                              context)}${(currency(context)
                                              .currencyVal *
                                              totalServicesChargesAndTotalBooking(
                                                  value.booking!))
                                              .ceilToDouble()}",
                                          onTap: () =>
                                              value.paySuccess(context,),
                                          style: appCss.dmDenseSemiBold16
                                              .textColor(appColor(context)
                                              .whiteColor),
                                          color: appColor(context)
                                              .greenColor,
                                          borderColor: appColor(context)
                                              .greenColor)

                                          : Row(
                                          children: [
                                            Expanded(
                                                child: ButtonCommon(
                                                    title: value.booking!
                                                        .bookingStatus!.slug ==
                                                        appFonts.onHold
                                                        ? appFonts.restart
                                                        : appFonts.pause,
                                                    color: value
                                                        .booking!
                                                        .bookingStatus!
                                                        .name!
                                                        .toLowerCase() ==
                                                        appFonts.onHold
                                                        ? const Color(
                                                        0xFF27AF4D)
                                                        : const Color(
                                                        0xFFFF4B4B),
                                                    onTap: () =>
                                                    value
                                                        .booking!
                                                        .bookingStatus!
                                                        .name!
                                                        .toLowerCase() ==
                                                        appFonts.onHold
                                                        ? value
                                                        .onPauseConfirmation(
                                                        context, isHold: false)
                                                        : value
                                                        .onPauseConfirmation(
                                                        context))
                                            ),
                                            const HSpace(Sizes.s15),
                                            Expanded(
                                                child: ButtonCommon(
                                                    title: appFonts.completed,
                                                    onTap: () =>
                                                        value
                                                            .completeConfirmation(
                                                            context, this))
                                            )
                                          ]
                                      ));
                                }
                            )
                          ]
                      )
                  ))
          ));
    });
  }
}
