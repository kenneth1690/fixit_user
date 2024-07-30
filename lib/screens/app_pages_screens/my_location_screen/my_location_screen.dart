import 'dart:developer';

import 'package:fixit_user/widgets/alert_message_common.dart';
import 'package:flutter/rendering.dart';

import '../../../config.dart';

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({
    super.key,
  });

  @override
  State<MyLocationScreen> createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context1, locationCtrl, child) {
      return PopScope(
          canPop: true,
          onPopInvoked: (didPop) async {
            locationCtrl.onBack();
            if (didPop) return;
          },
          child: StatefulWrapper(
              onInit: () => Future.delayed(DurationClass.ms50)
                  .then((_) => locationCtrl.onReady(context)),
              child: Scaffold(
                  appBar: AppBar(
                      leadingWidth: 80,
                      title: Text(language(context, appFonts.myLocations),
                          style: appCss.dmDenseBold18
                              .textColor(appColor(context).darkText)),
                      centerTitle: true,
                      leading: CommonArrow(
                          arrow: eSvgAssets.arrowLeft,
                          onTap: () {
                            locationCtrl.onBack();
                            route.pop(context);
                          }).paddingAll(Insets.i8),
                      actions: [
                        CommonArrow(
                            arrow: eSvgAssets.add,
                            onTap: () => route
                                .pushNamed(context, routeName.currentLocation)
                                .then((value) => locationCtrl
                                    .getLocationList(context))).paddingSymmetric(
                            horizontal: Insets.i20)
                      ]),
                  body: Stack(alignment: Alignment.bottomCenter, children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        return locationCtrl.getLocationList(context);
                      },
                      child: ListView(
                              controller: locationCtrl.scrollController,
                              children: [
                            if (locationCtrl.addressList.isEmpty)
                              const CommonEmpty(),
                            if (locationCtrl.addressList.isNotEmpty)
                              ...locationCtrl.addressList.asMap().entries.map((e) => LocationLayout(
                                      data: e.value,
                                      selectedIndex:
                                          locationCtrl.selectedIndex == e.key,
                                      deleteOnTap: () =>
                                          locationCtrl.deleteAccountConfirmation(
                                              context, this, e.value.id),
                                      editOnTap: () => route.pushNamed(
                                              context, routeName.currentLocation, arg: {
                                            "data": e.value,
                                            "isEdit": true
                                          }).then((value) => locationCtrl.getLocationList(context)))
                                  .inkWell(onTap: () => locationCtrl.selectAddress(e.key)))
                          ])
                          .paddingSymmetric(vertical: Insets.i20)
                          .marginOnly(bottom: Insets.i50),
                    ),
                    if (locationCtrl.addressList.isNotEmpty)
                      AnimatedBuilder(
                          animation: locationCtrl.scrollController,
                          builder: (BuildContext context, Widget? child) {
                            return AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                height: locationCtrl.scrollController.position
                                            .userScrollDirection ==
                                        ScrollDirection.reverse
                                    ? 0
                                    : 70,
                                child: child);
                          },
                          child: !locationCtrl.isButtonShow
                              ? ButtonCommon(
                                      onTap: () {
                                        if (locationCtrl.selectedIndex !=
                                            null) {
                                          locationCtrl.setDefault(context);
                                        } else {
                                          snackBarMessengers(context,
                                              message:
                                                  language(context, appFonts.pleaseSelectAddress));
                                        }
                                      },
                                      title: setPrimaryAddress == null
                                          ? language(
                                              context,
                                              locationCtrl.selectedIndex == null
                                                  ? appFonts
                                                      .selectPrimaryLocation
                                                  : appFonts.setAsPrimary)
                                          : language(context,
                                              appFonts.selectPrimaryLocation),
                                      style: appCss.dmDenseSemiBold16.textColor(
                                          setPrimaryAddress == null
                                              ? locationCtrl.selectedIndex ==
                                                      null
                                                  ? appColor(context).primary
                                                  : appColor(context).whiteColor
                                              : appColor(context).whiteColor),
                                      color: setPrimaryAddress == null
                                          ? locationCtrl.selectedIndex == null
                                              ? appColor(context)
                                                  .primary
                                                  .withOpacity(0.10)
                                              : appColor(context).primary
                                          : appColor(context).primary,
                                      margin: Insets.i20)
                                  .marginOnly(bottom: Insets.i20)
                              : ButtonCommon(
                                      onTap: () {
                                        if (locationCtrl.selectedIndex !=
                                            null) {
                                          route.pop(context,
                                              arg: locationCtrl.addressList[
                                                  locationCtrl.selectedIndex!]);
                                        } else {
                                          snackBarMessengers(context,
                                              message:
                                                 language(context,  appFonts.pleaseSelectAddress));
                                        }
                                      },
                                      title: language(
                                          context, appFonts.submitLocation),
                                      color: locationCtrl.selectedIndex != null
                                          ? appColor(context).primary
                                          : appColor(context).fieldCardBg,
                                      margin: Insets.i20)
                                  .marginOnly(bottom: Insets.i20))
                  ]))));
    });
  }
}
