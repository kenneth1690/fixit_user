import 'package:fixit_user/models/checkout_model.dart';

import '../../../../config.dart';

class ServiceDetailLayout extends StatelessWidget {
  final SingleServices? data;
  final PackageServices? packageService;
  final int? totalServiceman;
  const ServiceDetailLayout({super.key, this.data, this.packageService, this.totalServiceman});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2.8,
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
            shape: const SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius.only(
                    topLeft: SmoothRadius(
                        cornerRadius: AppRadius.r20, cornerSmoothing: 1),
                    topRight: SmoothRadius(
                        cornerRadius: AppRadius.r20, cornerSmoothing: 0.4))),
            color: appColor(context).whiteBg),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(language(context, appFonts.acServiceCharge),
                style: appCss.dmDenseMedium18
                    .textColor(appColor(context).darkText)),
            SvgPicture.asset(eSvgAssets.close)
                .inkWell(onTap: () => route.pop(context)),
          ]).paddingAll(Insets.i20),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(eImageAssets.detailsBg),
                      fit: BoxFit.fill)),
              child: Column(children: [
                Column(children: [
                  BillRowCommon(
                      title: appFonts.perServiceCharge, price: "${getSymbol(context)}${(currency(context).currencyVal * (data != null ? data!.perServicemanCharge! : packageService!.perServicemanCharge!)).ceilToDouble()}"),
                  const VSpace(Sizes.s20),
                  BillRowCommon(
                      title: "\$${data != null ? data!.total!.totalServicemen! : packageService!.total!.totalServicemen!} servicemen (${getSymbol(context)}${"${(currency(context).currencyVal * (data != null ? data!.perServicemanCharge! : packageService!.perServicemanCharge!)).ceilToDouble()} × ${data != null ? data!.total!.totalServicemen! : packageService!.total!.totalServicemen!}"})",
                      price: "${getSymbol(context)}${(currency(context).currencyVal * (data != null ? data!.total!.subtotal! : packageService!.total!.subtotal!)).ceilToDouble()}")
                ]).paddingSymmetric(
                    vertical: Insets.i20,),
                const VSpace(Sizes.s6),
                Divider(
                    color: appColor(context).stroke,
                    thickness: 1,
                    height: 1,
                    endIndent: 6,
                    indent: 6),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(language(context, appFonts.totalAmount),
                          style: appCss.dmDenseMedium14
                              .textColor(appColor(context).darkText)),
                      Text( "${getSymbol(context)}${(currency(context).currencyVal * (data != null ? data!.total!.subtotal! : packageService!.total!.subtotal!)).ceilToDouble()}",
                          style: appCss.dmDenseBold16
                              .textColor(appColor(context).primary))
                    ]).paddingSymmetric(
                    vertical: Insets.i20, horizontal: Insets.i15)
              ])).paddingSymmetric(horizontal: Insets.i15)
        ]));
  }
}
