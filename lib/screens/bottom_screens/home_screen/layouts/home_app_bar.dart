import 'dart:developer';

import '../../../../config.dart';

class HomeAppBar extends StatelessWidget {
  final String? location;
  final GestureTapCallback? onTap;

  const HomeAppBar({super.key, this.location, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
      log("street :$street");
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          const HSpace(Sizes.s20),
          CommonArrow(
              onTap: () => value.locationTap(context),
              arrow: eSvgAssets.location,
              svgColor: appColor(context).primary,
              color: appColor(context).primary.withOpacity(0.2)),
          const HSpace(Sizes.s10),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          setPrimaryAddress == null
                              ? language(context, appFonts.currentLocation)
                              : setPrimaryAddress == -1 ? language(context, appFonts.currentLocation): capitalizeFirstLetter(userPrimaryAddress!.type),
                          style: appCss.dmDenseRegular13
                              .textColor(appColor(context).lightText)),
                      const HSpace(Sizes.s5),
                      SvgPicture.asset(eSvgAssets.arrowDown)
                    ]).inkWell(onTap: () => value.locationTap(context)),
                if (street != null)
                  SizedBox(
                      width: Sizes.s180,
                      child: Text(street!,
                              overflow: TextOverflow.ellipsis,
                              style: appCss.dmDenseBold14.textColor(
                                  appColor(context).darkText))
                          .inkWell(onTap: () => value.locationTap(context)))
              ])
        ]),
        Row(children: [
          CommonArrow(arrow: eSvgAssets.search).inkWell(onTap: () {
            value.animationController!.stop();
            value.notifyListeners();
            route.pushNamed(context, routeName.search).then((e) {
              value.animationController!.reset();
              value.notifyListeners();
            });
          }),
          const HSpace(Sizes.s10),
          Consumer<NotificationProvider>(
              builder: (context1, notification, child) {
            return Container(
                    alignment: Alignment.center,
                    height: Sizes.s40,
                    width: Sizes.s40,
                    child: Stack(alignment: Alignment.topRight, children: [
                      SvgPicture.asset(eSvgAssets.notification,
                          alignment: Alignment.center,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              appColor(context).darkText,
                              BlendMode.srcIn)),
                      if (notification.totalCount() != 0)
                        Positioned(
                            top: 2,
                            right: 2,
                            child: Icon(Icons.circle,
                                size: Sizes.s7,
                                color: appColor(context).red))
                    ]))
                .decorated(
                    shape: BoxShape.circle,
                    color: appColor(context).fieldCardBg)
                .inkWell(onTap: () => value.notificationTap(context))
                .paddingOnly(
                    right: rtl(context) ? 0 : Insets.i20,
                    left: rtl(context) ? Insets.i20 : 0);
          })
        ])
      ]);
    });
  }
}
