import 'dart:developer';

import 'package:fixit_user/screens/bottom_screens/booking_screen/booking_shimmer/booking_shimmer.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../config.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context2, dash, child) {
      return Consumer<BookingProvider>(builder: (context1, value, child) {
log("dash.isSearchData :${dash.isSearchData}");
        return StatefulWrapper(
            onInit: () =>
                Future.delayed(const Duration(milliseconds: 100),
                        () => value.onFetchData(context, this)),
            child: LoadingComponent(
                child: (value.widget1Opacity == 0.0) ? const BookingShimmer(): Scaffold(
                    appBar: AppBar(
                        leadingWidth: 80,
                        title: Text(language(context, appFonts.bookings),
                            style: appCss.dmDenseBold18
                                .textColor(appColor(context)
                                .darkText)),
                        centerTitle: true,
                        leading: CommonArrow(
                            arrow: rtl(context)
                                ? eSvgAssets.arrowRight
                                : eSvgAssets.arrowLeft,
                            onTap: () {
                              dash.selectIndex = 0;
                              dash.notifyListeners();
                            }).paddingAll(Insets.i8),
                        actions: [
                          Consumer<NotificationProvider>(
                              builder: (context2, notify, child) {
                                return Container(
                                    alignment: Alignment.center,
                                    height: Sizes.s40,
                                    width: Sizes.s40,
                                    child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          SvgPicture.asset(
                                              eSvgAssets.notification,
                                              alignment: Alignment.center,
                                              fit: BoxFit.scaleDown,
                                              colorFilter: ColorFilter.mode(
                                                  appColor(context)

                                                      .darkText,
                                                  BlendMode.srcIn)),
                                          if (notify.totalCount() != 0)
                                            Positioned(
                                                top: 2,
                                                right: 2,
                                                child: Icon(Icons.circle,
                                                    size: Sizes.s7,
                                                    color: appColor(context)

                                                        .red))
                                        ]))
                                    .decorated(
                                    shape: BoxShape.circle,
                                    color: appColor(context)
                                        .fieldCardBg)
                                    .inkWell(
                                    onTap: () =>
                                        route.pushNamed(
                                            context, routeName.notifications))
                                    .paddingOnly(
                                    left: rtl(context) ? Insets.i20 : 0,
                                    right: rtl(context) ? 0 : Insets.i20);
                              })
                        ]),
                    body: RefreshIndicator(
                        onRefresh: () async {
                          dash.getBookingHistory(context);
                        },
                        child: dash.isSearchData ? EmptyLayout(
                            title: appFonts.noMatching,
                            subtitle: appFonts.attemptYourSearch,
                            buttonText: appFonts.refresh,
                            isBooking: true,
                            bTap: ()async {
                              if(value.bookingList.isEmpty){
                                Fluttertoast.showToast(msg: "${language(context, appFonts.refresh)}...");

                                dash.getBookingHistory(context);
                              }
                            },
                            widget:  Stack
                              (children: [
                              Image.asset(eImageAssets.noSearch,
                                  height: Sizes.s346)
                                  .paddingOnly(top: Insets.i40),
                              if (value.animationController != null)
                                Positioned(
                                    left: 40,
                                    top: 0,
                                    child: RotationTransition(
                                        turns: Tween(begin: 0.01, end: -.01)
                                            .chain(CurveTween(
                                            curve: Curves.easeIn))
                                            .animate(
                                            value.animationController!),
                                        child: Image.asset(
                                            eImageAssets.mGlass,
                                            height: Sizes.s190,
                                            width: Sizes.s178)))
                            ])): value.bookingList.isNotEmpty
                    ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SearchTextFieldCommon(
                              focusNode: value.searchFocus,
                              hinText: language(context, appFonts.searchWithBookingId),
                              controller: value.searchText,
                              onTap: () {
                                dash.isTap = true;
                                dash.notifyListeners();

                              },
                              onChanged: (v) {
                                if (v.isEmpty) {
                                  dash.getBookingHistory(context, search: v);
                                }else if(v.length >3){
                                  dash.getBookingHistory(context, search: v);
                                }
                              },
                              onFieldSubmitted: (v) {
                                log("HHHHH");
                                dash.isTap = false;
                                dash.notifyListeners();
                                dash.getBookingHistory(context, search: v);
                              },
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if(value.searchText.text.isNotEmpty)
                                  Icon(Icons.cancel,color: appColor(context).darkText).inkWell(onTap: (){
                                    value.searchText.text = "";
                                    value.notifyListeners();
                                    dash.getBookingHistory(context);
                                  }),
                                  const HSpace(Sizes.s5),
                                  FilterIconCommon(

                                      onTap: () => value.onTapFilter(context),
                                      selectedFilter: value.totalCountFilter()),
                                ],
                              )).paddingSymmetric(horizontal: Insets.i20),
                          const VSpace(Sizes.s25),
                          Text(language(context, appFonts.allBooking),
                              style: appCss.dmDenseBold18.textColor(
                                  appColor(context).darkText)).paddingSymmetric(horizontal: Insets.i20),
                          const VSpace(Sizes.s15),

                          Expanded(
                            child: ListView.builder(
                                controller: value.scrollController,
                                itemCount: value.bookingList.length,
                                itemBuilder: (context, index) {
                                  return BookingLayout(
                                      data: value.bookingList[index],
                                      index: index,
                                      editLocationTap: () =>
                                          value.editAddress(
                                              context,
                                              value.bookingList[index]),
                                      editDateTimeTap: () =>
                                          value.editDateTimeTap(
                                              context,
                                              value.bookingList[index]),
                                      onTap: () =>
                                          value.onTapBookings(
                                              value.bookingList[index],
                                              context));
                                }),
                          ),
                          VSpace(dash.isTap ? 0 : Insets.i80)
                        ])


                        :   EmptyLayout(
                    title: appFonts.ohhNoList,
                    subtitle: appFonts.yourBookingList,
                    buttonText: appFonts.refresh,
                    bTap: (){
                      Fluttertoast.showToast(msg: "${language(context, appFonts.refresh)}...");
                      dash.getBookingHistory(context);
                    },
                    widget: Stack(children: [
                      Image.asset(eImageAssets.noList,
                          height: Sizes.s306)
                    ])))),)
        ,
        );
      });
    });
  }
}
