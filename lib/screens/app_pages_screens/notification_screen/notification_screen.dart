import '../../../config.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(builder: (context1, value, child) {
      return LoadingComponent(
        child: StatefulWrapper(
            onInit: () => Future.delayed(
                DurationClass.ms50, () => value.onAnimate(this, context)),
            child: WillPopScope(
                onWillPop: () async {
                  value.onBack();
                  return true;
                },
                child: Scaffold(
                    appBar: AppBar(
                        leadingWidth: 80,
                        title: Text(language(context, appFonts.notifications),
                            style: appCss.dmDenseBold18.textColor(
                                appColor(context).darkText)),
                        centerTitle: true,
                        leading: CommonArrow(
                            arrow: rtl(context)
                                ? eSvgAssets.arrowRight
                                : eSvgAssets.arrowLeft,
                            onTap: () {
                              value.onBack();
                              route.pop(context);
                            }).paddingAll(Insets.i8),
                        actions: [
                          if (value.notificationList.isNotEmpty)
                            CommonArrow(
                              arrow: eSvgAssets.readAll,
                              onTap: () => value.readAll(context),
                            ),
                          if (value.notificationList.isNotEmpty)
                          const HSpace(Sizes.s10),
                          if (value.notificationList.isNotEmpty)
                          CommonArrow(
                            arrow: eSvgAssets.delete,
                            color: appColor(context).red.withOpacity(0.10),
                            svgColor: appColor(context).red,
                            onTap: () => value.deleteNotificationConfirmation(context,this),
                          ).paddingOnly(
                              right: rtl(context) ? 0 : Insets.i20,
                              left: rtl(context) ? Insets.i20 : 0)
                        ]),
                    body: RefreshIndicator(
                      onRefresh: () async {
                        value.getNotificationList(context);
                      },
                      child: value.notificationList.isNotEmpty
                          ? ListView(
                                  children: value.notificationList
                                      .asMap()
                                      .entries
                                      .map((e) => NotificationLayout(
                                            data: e.value,
                                            onTap: () =>
                                                value.onTap(e.value, context),
                                          ))
                                      .toList())
                              .paddingAll(Insets.i20)
                          : EmptyLayout(
                              title: appFonts.nothingHere,
                              subtitle: appFonts.clickTheRefresh,
                              buttonText: appFonts.refresh,
                              bTap: () => value.onRefresh(context),
                              widget: Stack(children: [
                                Image.asset(eImageAssets.notiGirl,
                                    height: Sizes.s346),
                                if (value.animationController != null)
                                  Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.04,
                                      left: MediaQuery.of(context).size.height *
                                          0.055,
                                      child: RotationTransition(
                                          turns: Tween(begin: 0.05, end: -.1)
                                              .chain(CurveTween(
                                                  curve: Curves.elasticInOut))
                                              .animate(
                                                  value.animationController!),
                                          child: Image.asset(
                                              eImageAssets.notificationBell,
                                              height: Sizes.s40,
                                              width: Sizes.s40)))
                              ])),
                    )))),
      );
    });
  }
}
