import 'dart:developer';

import '../../../../config.dart';

class BillLayout extends StatelessWidget {
  const BillLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CartProvider>(context, listen: true);
    log("value.checkoutModel!: ${value.checkoutModel!}");
    return value.checkoutModel != null
        ? Container(
      padding: const EdgeInsets.symmetric(vertical: Insets.i20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(isDark(context) ? eImageAssets.pendingBillBgDark:  eImageAssets.pendingBillBg),
                fit: BoxFit.fill)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Column(children: [
            /* Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                Text(language(context, "Ac service"),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).lightText)),
                const HSpace(Sizes.s5),
                SvgPicture.asset(eSvgAssets.about,
                        fit: BoxFit.scaleDown,
                        colorFilter: ColorFilter.mode(
                            appColor(context).primary,
                            BlendMode.srcIn))
                    .inkWell(onTap: () => value.onServiceDetail(context))
              ]),
              Text("\$22.00",
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).darkText))
            ]),
            const VSpace(Sizes.s20),
            BillRowCommon(title: appFonts.perServiceCharge, price: "\$12.00"),
            const BillRowCommon(title: "Furnishing", price: "\$12.00")
                .paddingSymmetric(vertical: Insets.i20),
            const BillRowCommon(title: "Cleaning package", price: "\$15.23"),
            const VSpace(Sizes.s20),
            const BillRowCommon(title: "Subtotal", price: "+\$52.46"),
            BillRowCommon(
                    color: appColor(context).red,
                    title: "Coupon Discount (24% off)",
                    price: "-\$2.00")
                .paddingSymmetric(vertical: Insets.i20),
            BillRowCommon(
                title: appFonts.tax,
                color: appColor(context).online,
                price: "+\$2.46"),*/
            if (value.checkoutModel!.services != null)
              Column(
                children: [
                  ...value.checkoutModel!.services!
                      .asMap()
                      .entries
                      .map((e) {
                    int total =getTotalRequiredServiceMan(value.cartList,
                        e.value.serviceId, false);
                    return e.value.total!.totalServicemen! >1
                        ? Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text(
                                getName(value.cartList,
                                    e.value.serviceId, false),
                                style: appCss.dmDenseMedium14
                                    .textColor(appColor(context)

                                    .lightText)),
                            const HSpace(Sizes.s5),
                            SvgPicture.asset(eSvgAssets.about,
                                fit: BoxFit.scaleDown,
                                colorFilter: ColorFilter.mode(
                                    appColor(context)

                                        .primary,
                                    BlendMode.srcIn))
                                .inkWell(
                                onTap: () => value
                                    .onServiceDetail(context,data: e.value,totalServiceman: total))
                          ]),
                          Text(
                              "${getSymbol(context)}${(currency(context).currencyVal * e.value.total!.subtotal!).toStringAsFixed(2)}",
                              style: appCss.dmDenseMedium14.textColor(
                                  appColor(context)

                                      .darkText))
                        ]).paddingOnly(bottom: Insets.i10,right: Insets.i15,left: Insets.i15)
                        : BillRowCommon(
                        title: getName(value.cartList,
                            e.value.serviceId, false),
                        color: appColor(context).darkText,
                        price:
                        "${getSymbol(context)}${(currency(context).currencyVal * e.value.total!.subtotal!).toStringAsFixed(2)}")
                        .paddingOnly(bottom: Insets.i10);
                  })
                ],
              ),
            if (value.checkoutModel!.servicesPackage != null)
              Column(
                children: [
                  ...value.checkoutModel!.servicesPackage!
                      .asMap()
                      .entries
                      .map((e) => Column(
                    children: e.value.services!
                        .asMap()
                        .entries
                        .map((ser) {
                      int total = getTotalRequiredServiceMan(value.cartList,
                          ser.value.serviceId, true);
                      return ser
                          .value.total!.totalServicemen! >1
                          ? Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Text(
                                  getName(value.cartList,
                                      ser.value.serviceId, true),
                                  style: appCss.dmDenseMedium14
                                      .textColor(appColor(context)

                                      .lightText)),
                              const HSpace(Sizes.s5),
                              SvgPicture.asset(eSvgAssets.about,
                                  fit: BoxFit.scaleDown,
                                  colorFilter:
                                  ColorFilter.mode(
                                      appColor(context)

                                          .primary,
                                      BlendMode.srcIn))
                                  .inkWell(
                                  onTap: () =>
                                      value.onServiceDetail(
                                          context,packageServices: ser.value,totalServiceman: total))
                            ]),
                            Text(
                                "${getSymbol(context)}${(currency(context).currencyVal * ser.value.total!.subtotal!).toStringAsFixed(2)}",
                                style: appCss.dmDenseMedium14
                                    .textColor(appColor(context)

                                    .darkText))
                          ]).paddingOnly(bottom: Insets.i10,right: Insets.i15,left: Insets.i15)
                          : BillRowCommon(
                          title: getName(value.cartList,
                              ser.value.serviceId, true),
                          color:
                          appColor(context).darkText,
                          price:
                          "${getSymbol(context)}${(currency(context).currencyVal * ser.value.total!.subtotal!).toStringAsFixed(2)}")
                          .paddingOnly(bottom: Insets.i10);
                    })
                        .toList(),
                  ))
                ],
              ),
            BillRowCommon(
                title: appFonts.subtotal,
                price:
                "${getSymbol(context)}${(currency(context).currencyVal * value.checkoutModel!.total!.subtotal!).toStringAsFixed(2)}")
                .paddingOnly(bottom: Insets.i10),
            BillRowCommon(
                title: appFonts.tax,
                color: appColor(context).online,
                price:
                "+${getSymbol(context)}${(currency(context).currencyVal * value.checkoutModel!.total!.tax!).toStringAsFixed(2)}")
                .paddingOnly(bottom: Insets.i10),
            BillRowCommon(
                title: appFonts.platformFees,
                color: appColor(context).online,
                price:
                "+${getSymbol(context)}${(currency(context).currencyVal * value.checkoutModel!.total!.platformFees!).toStringAsFixed(2)}")
                .paddingOnly(bottom: Insets.i25),

            /* ...value.checkoutModel!.servicesPackage!.asMap().entries.map((e) {
              return BillRowCommon(
                  title:" e.value.title",
                  color: appColor(context).online,
                  price: "${getSymbol(context)}${(currency(context).currencyVal*int.parse(e.value.subtotal.toString()).toStringAsFixed(2)())}").paddingSymmetric(vertical: Insets.i20);
            }).toList()*/
          ]),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(language(context, appFonts.totalAmount),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).darkText)),
            Text(
                "${getSymbol(context)}${(currency(context).currencyVal * value.checkoutModel!.total!.total!).toStringAsFixed(2)}",
                style: appCss.dmDenseBold16
                    .textColor(appColor(context).primary))
          ]).paddingSymmetric( horizontal: Insets.i15).paddingOnly(bottom: Insets.i5,top: Insets.i10)
        ]))
        : Container();
  }
}