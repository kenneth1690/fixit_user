
import 'package:fixit_user/common_tap.dart';

import '../../../config.dart';
import '../../bottom_screens/booking_screen/booking_shimmer/booking_detail_shimmer.dart';

class AcceptedBookingScreen extends StatelessWidget {
  const AcceptedBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AcceptedBookingProvider, PendingBookingProvider>(
        builder: (context, val, val2, child) {
      return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          val.onBack(context, false);
          if(didPop) return;
        },
        child: StatefulWrapper(
            onInit: () => Future.delayed(
                const Duration(milliseconds: 100), () => val.onReady(context)),
            child:val.booking == null
                ? const BookingDetailShimmer()
                :  Scaffold(
                appBar: AppBarCommon(title: appFonts.acceptedBookings,onTap: ()=>val.onBack(context, true)),
                body: LoadingComponent(
                  child: val.booking == null
                      ? Container()
                      : RefreshIndicator(
                          onRefresh: () async {
                            val.onRefresh(context);
                          },
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                StatusDetailLayout(
                                    data: val.booking,
                                    onTapStatus: () =>
                                        showBookingStatus(context, val.booking)),
                                Text(language(context, appFonts.billSummary),
                                        style: appCss.dmDenseSemiBold14.textColor(
                                            appColor(context).darkText))
                                    .paddingOnly(
                                        top: Insets.i25, bottom: Insets.i10),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              isDark(context)
                                                  ? eImageAssets.pendingBillBgDark
                                                  : eImageAssets.pendingBillBg),
                                          fit: BoxFit.fill)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            BillRowCommon(
                                                title: appFonts.perServiceCharge,
                                                price:
                                                    "${getSymbol(context)}${(currency(context).currencyVal * val.booking!.perServicemanCharge!).ceilToDouble()}"),
                                            BillRowCommon(
                                                    title:
                                                        "${val.booking!.totalServicemen == "0" ? 1 : val.booking!.totalServicemen} ${language(context, appFonts.serviceman)} (${getSymbol(context)}${(currency(context).currencyVal * val.booking!.perServicemanCharge!).ceilToDouble()} × ${val.booking!.totalServicemen == "0" ? 1 : val.booking!.totalServicemen})",
                                                    price:
                                                        "${getSymbol(context)}${(currency(context).currencyVal * val.booking!.subtotal!).ceilToDouble()}",
                                                    style: appCss.dmDenseBold14
                                                        .textColor(
                                                            appColor(context)

                                                                .darkText))
                                                .paddingSymmetric(
                                                    vertical: Insets.i20),
                                            BillRowCommon(
                                                    title: appFonts.tax,
                                                    price:
                                                        "+${getSymbol(context)}${(currency(context).currencyVal * val.booking!.tax!).ceilToDouble()}",
                                                    color: appColor(context)

                                                        .online)
                                                .paddingOnly(bottom: Insets.i20),
                                            BillRowCommon(
                                                title: appFonts.platformFees,
                                                price:
                                                    "+${getSymbol(context)}${(currency(context).currencyVal * (val.booking!.platformFees ?? 0.0)).ceilToDouble()}",
                                                color: appColor(context)

                                                    .online)
                                          ],
                                        ),
                                        const VSpace(Sizes.s30),
                                        /* Divider(
                                            color: appColor(context).stroke, thickness: 1, height: 1,indent: 6,endIndent: 6).paddingOnly(bottom:23),*/
                                        BillRowCommon(
                                                title: appFonts.totalAmount,
                                                price:
                                                    "${getSymbol(context)}${(currency(context).currencyVal * val.booking!.total!).ceilToDouble()}",
                                                styleTitle: appCss.dmDenseMedium14
                                                    .textColor(appColor(context)

                                                        .darkText),
                                                style: appCss.dmDenseBold16
                                                    .textColor(appColor(context)

                                                        .primary))
                                            .paddingOnly(top: Insets.i10)
                                      ]).paddingSymmetric(vertical: Insets.i20),
                                ),
                                if (val.booking!.service!.reviews!.isNotEmpty)

                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Text(
                                                language(
                                                    context, appFonts.review),
                                                overflow: TextOverflow.clip,
                                                style: appCss.dmDenseSemiBold14
                                                    .textColor(appColor(context)

                                                        .darkText))),
                                        Text(language(context, appFonts.viewAll),
                                                style: appCss.dmDenseRegular14
                                                    .textColor(appColor(context)

                                                        .primary))
                                            .inkWell(
                                                onTap: () => route.pushNamed(
                                                    context,
                                                    routeName
                                                        .servicesReviewScreen,
                                                    arg: val.booking!.service))
                                      ]).paddingOnly(
                                      top: Insets.i20, bottom: Insets.i12),
                                ...val.booking!.service!.reviews!
                                    .asMap()
                                    .entries
                                    .map((e) => ServiceReviewLayout(
                                        data: e.value,
                                        index: e.key,
                                        list: appArray.reviewList)),
                                (val.booking!.bookingStatus!.slug ==
                                    appFonts.accepted || val.booking!.bookingStatus!.slug ==
                                    appFonts.pending)?
                                  ButtonCommon(
                                          title: appFonts.cancelBooking,
                                          onTap: () =>
                                              val.onCancelBooking(context))
                                      .paddingOnly(
                                          top: Insets.i35, bottom: Insets.i30): const VSpace(Sizes.s30)
                              ]).paddingSymmetric(horizontal: Insets.i20)),
                        ),
                ))),
      );
    });
  }
}
