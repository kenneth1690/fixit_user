import 'dart:developer';

import '../../../../config.dart';

class CompletedBookingPaymentSummaryLayout extends StatelessWidget {
  final BookingModel? bookingModel;

  const CompletedBookingPaymentSummaryLayout({super.key, this.bookingModel});

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage( isDark(context)? eImageAssets.billSummaryDark: eImageAssets.paymentSummary),
                fit: BoxFit.fill)),
        child: Column(children: [

          BillRowCommon(
              title: appFonts.methodType,
              price: bookingModel!.paymentMethod == "cash"
                  ? appFonts.cash
                  : bookingModel!.paymentMethod),
          const VSpace(Sizes.s20),
          BillRowCommon(
              title: appFonts.status,
              price: bookingModel!.bookingStatus!.slug ==
                      appFonts.completed
                  ? bookingModel!.paymentStatus == "COMPLETED"
                      ? language(context, appFonts.paid)
                      : language(context, appFonts.notPaid)
                  : bookingModel!.paymentStatus == "COMPLETED"
                      ? language(context, appFonts.paid)
                      : language(context, appFonts.notPaid),
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).online)),
        ]).paddingSymmetric(vertical: Insets.i20, ));
  }
}
