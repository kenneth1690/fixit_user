import '../../../../config.dart';

class CompletedBookingBillLayoutIfNotPaid extends StatelessWidget {
  final BookingModel? bookingModel;
  const CompletedBookingBillLayoutIfNotPaid({super.key, this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                AssetImage(eImageAssets.completeBg),
                colorFilter: ColorFilter.mode(appColor(context).fieldCardBg, BlendMode.srcIn),
                fit: BoxFit.fill)),
        child: Column(children: [
          BillRowCommon(
              title: appFonts.perServiceCharge,
              price:
              "${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.perServicemanCharge!).ceilToDouble()}"),
          BillRowCommon(
              title:
              "${bookingModel!.totalServicemen == "0" ? 1 : bookingModel!.totalServicemen} ${language(context, appFonts.serviceman)} (${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.perServicemanCharge!).ceilToDouble()} × ${bookingModel!.totalServicemen == "0" ? 1 : bookingModel!.totalServicemen})",
              price:
              "${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.subtotal!).ceilToDouble()}",
              style: appCss.dmDenseBold14
                  .textColor(appColor(context)

                  .darkText))
              .paddingSymmetric(vertical: Insets.i20),
          BillRowCommon(
              title: appFonts.tax,
              price:
              "+${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.tax!).ceilToDouble()}",
              color:
              appColor(context).online),
          BillRowCommon(
              title: appFonts.platformFees,
              price:
              "+${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.platformFees!).ceilToDouble()}",
              color: appColor(context)

                  .online)
              .paddingSymmetric(vertical: Insets.i20),
          DottedLines(
              color: appColor(context)

                  .stroke,
          )
              .paddingOnly(bottom: 25).paddingSymmetric(horizontal: 5),
          BillRowCommon(
              title: appFonts.totalAmount,
              price:
              "${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.total!).ceilToDouble()}",
              styleTitle: appCss.dmDenseMedium14
                  .textColor(appColor(context)

                  .darkText),
              style: appCss.dmDenseBold16.textColor(
                  appColor(context).darkText)),
          const VSpace(Sizes.s15),
          BillRowCommon(
              title: language(context, appFonts.extraServiceCharge),
              price: "+\$5.80",
              styleTitle: appCss.dmDenseMedium14
                  .textColor(appColor(context)

                  .lightText ),
              style: appCss.dmDenseMedium14.textColor(
                  appColor(context).greenColor))
              .paddingOnly(bottom: Insets.i20),
          Divider(
              color: appColor(context)

                  .stroke,
              thickness: 1,
              height: 1,
              indent: 6,
              endIndent: 6)
              .paddingOnly(bottom:18),
          BillRowCommon(
              title: appFonts.payableAmount,
              price:  "${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.total!).ceilToDouble()}",
              styleTitle: appCss.dmDenseMedium14
                  .textColor(
                  appColor(context).primary),
              style: appCss.dmDenseBold16.textColor(
                  appColor(context).primary)).paddingOnly(bottom: 10),
        ]).paddingSymmetric(
            vertical: Insets.i20,
            ));
  }
}
