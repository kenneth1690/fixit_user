import 'dart:async';
import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../../../../config.dart';

class StepOneLayout extends StatelessWidget {
  const StepOneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SlotBookingProvider>(builder: (context1, value, child) {
      return Consumer<LocationProvider>(builder: (context2, loc, child) {
        return Stack(alignment: Alignment.bottomCenter, children: [
          value.servicesCart == null
              ? Container()
              : ListView(controller: value.scrollController, children: [
                  Text(language(context, appFonts.selectDateTime).toUpperCase(),
                          style: appCss.dmDenseSemiBold16
                              .textColor(appColor(context).primary))
                      .paddingSymmetric(horizontal: Insets.i20),
                  const VSpace(Sizes.s15),
                  loc.addressList.isEmpty && value.address == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(language(context, appFonts.location),
                                  overflow: TextOverflow.ellipsis,
                                  style: appCss.dmDenseMedium14
                                      .textColor(appColor(context).darkText)),
                              const VSpace(Sizes.s5),
                              ButtonCommon(
                                  title:
                                      language(context, appFonts.addLocation),
                                  color: appColor(context).whiteBg,
                                  onTap: () => value.addNewLoc(context),
                                  fontColor: appColor(context).primary,
                                  borderColor: appColor(context).primary)
                            ]).marginOnly(
                          bottom: Insets.i10,
                          right: Insets.i20,
                          left: Insets.i20)
                      : LocationChangeRowCommon(
                          title: language(
                              context,
                              value.address == null
                                  ? appFonts.addLocation
                                  : appFonts.change),
                          onTap: () => route
                                  .pushNamed(context, routeName.myLocation,
                                      arg: true)
                                  .then((e) {
                                log("EE :$e");
                                if (e != null) {
                                  value.onChangeLocation(context, e);
                                }
                              })),
                  const VSpace(Sizes.s10),
                  if (value.address != null)
                    LocationLayout(
                      data: value.address,
                      isPrimaryAnTapLayout: false,
                    ),
                  value.servicesCart != null &&
                          value.servicesCart!.serviceDate != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(language(context, appFonts.bookedDateTime),
                                style: appCss.dmDenseMedium14
                                    .textColor(appColor(context).darkText)),
                            const VSpace(Sizes.s10),
                            BookedDateTimeLayout(
                                onTap: () {
                                  value.servicesCart!.serviceDate = null;
                                  value.servicesCart!.selectedDateTimeFormat =
                                      null;
                                  value.notifyListeners();
                                },
                                date: DateFormat('dd MMMM, yyyy')
                                    .format(value.servicesCart!.serviceDate!),
                                time:
                                    "At ${DateFormat('hh:mm').format(value.servicesCart!.serviceDate!)} ${value.servicesCart!.selectedDateTimeFormat ?? DateFormat('aa').format(value.servicesCart!.serviceDate!)}"),
                          ],
                        ).paddingSymmetric(horizontal: Insets.i20)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(language(context, appFonts.dateTime),
                                    style: appCss.dmDenseMedium14
                                        .textColor(appColor(context).darkText))
                                .paddingSymmetric(horizontal: Insets.i20),
                            Text("${language(context, appFonts.thisServiceWill)} ${value.servicesCart!.duration} ${value.servicesCart!.durationUnit ?? "hours"}",
                                    style: appCss.dmDenseMedium12
                                        .textColor(appColor(context).lightText))
                                .paddingSymmetric(horizontal: Insets.i20),
                            const VSpace(Sizes.s10),
                            Column(children: [
                              Column(children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          language(
                                              context, appFonts.customDateTime),
                                          style: appCss.dmDenseRegular14
                                              .textColor(value.selectIndex == 0
                                                  ? appColor(context).primary
                                                  : appColor(context)
                                                      .darkText)),
                                      CommonRadio(
                                          onTap: () => value.onDateTimeSelect(
                                              context, 0),
                                          index: 0,
                                          selectedIndex: value.selectIndex)
                                    ]).inkWell(onTap:  () => value.onDateTimeSelect(
                                    context, 0)),
                                Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: appColor(context).stroke)
                                    .paddingSymmetric(vertical: Insets.i20),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          language(
                                              context, appFonts.asPerProvider),
                                          style: appCss.dmDenseRegular14
                                              .textColor(value.selectIndex == 1
                                                  ? appColor(context).primary
                                                  : appColor(context)
                                                      .darkText)),
                                      CommonRadio(
                                          onTap: () => value.onDateTimeSelect(
                                              context, 1),
                                          index: 1,
                                          selectedIndex: value.selectIndex)
                                    ]).inkWell(onTap: () => value.onDateTimeSelect(
                                    context, 1)),
                                const VSpace(Sizes.s20),
                                TimeSlotLayout(
                                    title: appFonts.dateTime,
                                    onTap: () =>
                                        value.onProviderDateTimeSelect(context))
                              ])
                            ])
                                .paddingSymmetric(
                                    vertical: Insets.i20,
                                    horizontal: Insets.i15)
                                .decorated(
                                    color: appColor(context).whiteBg,
                                    borderRadius:
                                        BorderRadius.circular(AppRadius.r8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: appColor(context)
                                              .darkText
                                              .withOpacity(0.06),
                                          blurRadius: 12,
                                          spreadRadius: 0,
                                          offset: const Offset(0, 2))
                                    ],
                                    border: Border.all(
                                        color: appColor(context).stroke))
                                .paddingSymmetric(horizontal: Insets.i20),
                          ],
                        ),
                  const VSpace(Sizes.s15),
                  const ServicemanQuantityLayout(),
                  if ((
                          value.servicesCart!.selectedRequiredServiceMan!) >
                      (value.servicesCart!.requiredServicemen ?? 1))
                    Text(language(context, appFonts.youWillOnly),
                            style: appCss.dmDenseMedium12
                                .textColor(appColor(context).red))
                        .paddingOnly(bottom: Insets.i25)
                        .paddingSymmetric(horizontal: Insets.i20),
                  CustomMessageLayout(
                    onTap: (){

                      Timer(Duration(milliseconds: 500), () {
                        log("value.scrollController.position.maxScrollExtent:${value.scrollController.position.maxScrollExtent}");
                        value.scrollController.jumpTo(value.scrollController.position.maxScrollExtent);
                        value.notifyListeners();
                      });

                      value.notifyListeners();
                    },
                      controller: value.txtNote, focusNode: value.noteFocus),
                  const VSpace(Sizes.s100)
                ]),
          if (value.scrollController.hasClients)
            AnimatedBuilder(
                animation: value.scrollController,
                builder: (BuildContext context, Widget? child) {
                  return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height:
                          value.scrollController.position.userScrollDirection ==
                                  ScrollDirection.reverse
                              ? 0
                              : 70,
                      child: child);
                },
                child: ButtonCommon(
                        title: value.buttonName(context),
                        margin: Insets.i20,
                        onTap: () => value.onTapNext(context))
                    .marginOnly(bottom: Insets.i20)
                    .backgroundColor(appColor(context).whiteBg))
        ]);
      });
    });
  }
}
