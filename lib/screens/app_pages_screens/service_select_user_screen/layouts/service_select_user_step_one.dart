import 'dart:async';
import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../../../../config.dart';
import '../../../../widgets/alert_message_common.dart';

class ServiceSelectUserStepOne extends StatelessWidget {
  const ServiceSelectUserStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceSelectProvider>(builder: (context1, value, child) {
      return Consumer<LocationProvider>(builder: (context2, loc, child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
                controller: value.scrollController,children: [
              Text(language(context, appFonts.selectDateTime).toUpperCase(),
                  style: appCss.dmDenseSemiBold16
                      .textColor(appColor(context).primary)).paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s15),
              loc.addressList.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(language(context, appFonts.location),
                            overflow: TextOverflow.ellipsis,
                            style: appCss.dmDenseMedium14.textColor(
                                appColor(context).darkText)),
                        const VSpace(Sizes.s5),
                        ButtonCommon(
                            title: language(context, appFonts.addLocation),
                            color: appColor(context).whiteBg,
                            onTap: () => route
                                .pushNamed(context, routeName.currentLocation)
                                .then((e) => loc.getLocationList(context)),
                            fontColor: appColor(context).primary,
                            borderColor: appColor(context).primary),
                      ]
                    ).marginOnly(bottom: Insets.i10,left: Sizes.s20,right: Sizes.s20)
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
                            style: appCss.dmDenseMedium14.textColor(
                                appColor(context).darkText)),
                        const VSpace(Sizes.s10),
                        BookedDateTimeLayout(
                            onTap: () {
                              value.servicesCart!.serviceDate = null;
                              value.servicesCart!.selectedDateTimeFormat = null;
                              value.notifyListeners();
                            },

                            date: DateFormat('dd MMMM, yyyy')
                                .format(value.servicesCart!.serviceDate!),
                            time:
                                "At ${DateFormat('hh:mm').format(value.servicesCart!.serviceDate!)} ${value.servicesCart!.selectedDateTimeFormat.toString()!}"),
                      ],
                    ).paddingSymmetric(horizontal: Insets.i20)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(language(context, appFonts.dateTime),
                            style: appCss.dmDenseMedium14.textColor(
                                appColor(context).darkText)),
                        Text(language(context, appFonts.thisServiceWill),
                            style: appCss.dmDenseMedium12.textColor(
                                appColor(context).lightText)),
                        const VSpace(Sizes.s10),
                        Column(children: [
                          TimeSlotLayout(
                              title: appFonts.timeSlot,
                              onTap: () => value.onTapDate(context))
                        ]).boxShapeExtension(
                            color: appColor(context).fieldCardBg),
                      ],
                    ).paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s15),
              if (value.servicesCart != null &&
                  value.servicesCart!.selectedServiceMan != null &&
                  value.servicesCart!.selectedServiceMan!.isNotEmpty)
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(language(context, appFonts.selectedServicemen),
                            style: appCss.dmDenseMedium14.textColor(
                                appColor(context).darkText)),
                        if ((value
                                .servicesCart!.selectedRequiredServiceMan!) !=
                            value.servicesCart!.selectedServiceMan!.length)
                          Row(children: [
                            SvgPicture.asset(eSvgAssets.add,
                                height: Sizes.s15,
                                width: Sizes.s15,
                                fit: BoxFit.fitWidth,
                                colorFilter: ColorFilter.mode(
                                    appColor(context).primary,
                                    BlendMode.srcIn)),
                            Text(language(context, appFonts.add),
                                style: appCss.dmDenseRegular14.textColor(
                                    appColor(context).primary))
                          ]).inkWell(
                              onTap: () => route.pushNamed(
                                      context, routeName.servicemanListScreen,
                                      arg: {
                                        "providerId":
                                            value.servicesCart!.userId,
                                        "requiredServiceman": value
                                            .servicesCart!
                                            .selectedRequiredServiceMan,
                                        "selectedServiceMan": value
                                            .servicesCart!.selectedServiceMan
                                      }).then((val) {
                                    if (val != null) {
                                      value.servicesCart!.selectedServiceMan =
                                          val;
                                      value.notifyListeners();
                                    } else {
                                      value.servicesCart!.selectedServiceMan =
                                          null;
                                    }
                                  }))
                      ]),
                  ...value.servicesCart!.selectedServiceMan!
                      .asMap()
                      .entries
                      .map(
                        (e) => ServicemanLayout(
                            image: e.value.media != null &&
                                    e.value.media!.isNotEmpty
                                ? e.value.media![0].originalUrl!
                                : null,
                            title: e.value.name,
                            rate: e.value.reviewRatings != null
                                ? e.value.reviewRatings.toString()
                                : "0",
                            exp: e.value.experienceDuration != null ? e.value.experienceDuration.toString():"0",
                            expYear: e.value.experienceInterval ?? "Year",
                            editTap: () => route.pushNamed(
                                    context, routeName.servicemanListScreen,
                                    arg: {
                                      "providerId": value.servicesCart!.userId,
                                      "requiredServiceman": value.servicesCart!
                                          .selectedRequiredServiceMan,
                                      "selectedServiceMan":
                                          value.servicesCart!.selectedServiceMan
                                    }).then((val) {
                                  if (val != null) {
                                    value.servicesCart!.selectedServiceMan =
                                        val;
                                    value.notifyListeners();
                                  } else {
                                    value.servicesCart!.selectedServiceMan =
                                        null;
                                  }
                                }),
                            tileTap: () {
                              route.pushNamed(
                                  context, routeName.servicemanDetailScreen,
                                  arg: e.value.id);
                            }).paddingOnly(
                          top: Insets.i10,
                        ),
                      )
                ]).paddingSymmetric(horizontal: Insets.i20),
              if (value.servicesCart != null &&
                  (value.servicesCart!.selectedServiceMan == null ||
                      value.servicesCart!.selectedServiceMan!.isEmpty))
                SelectServicemanLayout(
                    onTap: (){
                      if(value.servicesCart != null &&
                          value.servicesCart!.serviceDate == null){
                        snackBarMessengers(context,message:"Please select Date time first");
                      }else{
                        route.pushNamed(
                            context, routeName.servicemanListScreen,
                            arg: {
                              "providerId": value.servicesCart!.userId,
                              "requiredServiceman":
                              value.servicesCart!.selectedRequiredServiceMan
                            }).then((val) {
                          if (val != null) {
                            value.servicesCart!.selectedServiceMan = val;
                            value.notifyListeners();
                          } else {
                            value.servicesCart!.selectedServiceMan = null;
                          }
                        });
                      }
                    }).paddingOnly(bottom: Insets.i15,left: Insets.i20,right: Insets.i20),
              CustomMessageLayout(
                controller: value.txtNote,
                focusNode: value.noteFocus,
                onTap: (){

                  Timer(Duration(milliseconds: 500), () {
                    log("value.scrollController.position.maxScrollExtent:${value.scrollController.position.maxScrollExtent}");
                    value.scrollController.jumpTo(value.scrollController.position.maxScrollExtent);
                    value.notifyListeners();
                  });

                  value.notifyListeners();
                },
              ).marginOnly(top: Insets.i15),
              const VSpace(Sizes.s100),
            ]),
            AnimatedBuilder(
                animation: value.scrollController,
                builder: (BuildContext context, Widget? child) {

                  return AnimatedContainer(

                    duration: const Duration(milliseconds: 400),
                    height: value.scrollController.position.userScrollDirection ==
                        ScrollDirection.reverse
                        ? 0
                        : 70,
                    child: child,
                  );
                },
                child: ButtonCommon(

                    title: value.buttonName(context),
                    margin: Insets.i20,
                    onTap: () => value.onNext(context)).marginOnly(bottom: Insets.i20).backgroundColor(appColor(context).whiteBg)

            )
           /* ButtonCommon(
                    title: value.buttonName(context),
                    onTap: () => value.onNext(context),
                    margin: Insets.i20)
                .paddingOnly(bottom: Insets.i20)
                .decorated(color: appColor(context).whiteBg)*/
          ],
        );
      });
    });
  }
}
