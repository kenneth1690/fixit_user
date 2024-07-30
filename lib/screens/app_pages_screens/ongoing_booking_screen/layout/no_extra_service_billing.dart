
import '../../../../config.dart';

class NoExtraServiceAddedBill extends StatelessWidget {
  final BookingModel? bookingModel;
  const NoExtraServiceAddedBill({super.key, this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return     Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(isDark(context)
                    ? eImageAssets.pendingBillBgDark
                    : eImageAssets.pendingBillBg),
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
              .paddingSymmetric(
              vertical: Insets.i20),
          BillRowCommon(
              title: appFonts.tax,
              price:
              "+${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.tax!).ceilToDouble()}",
              color: appColor(context)
                  
                  .online),
          BillRowCommon(
              title: appFonts.platformFees,
              price:
              "+${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.platformFees!).ceilToDouble()}",
              color: appColor(context)
                  
                  .online)
              .paddingOnly(
              top: Insets.i20,bottom: Insets.i25),
          BillRowCommon(
              title: appFonts.totalAmount,
              price:
              "${getSymbol(context)}${(currency(context).currencyVal * bookingModel!.total!).ceilToDouble()}",
              styleTitle: appCss.dmDenseMedium14
                  .textColor(appColor(context)
                  
                  .darkText),
              style: appCss.dmDenseBold16.textColor(
                  appColor(context)
                      
                      .primary))
        ]).paddingSymmetric(vertical: Insets.i30));
  }
}
