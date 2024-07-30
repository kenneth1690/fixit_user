import 'dart:developer';

import 'package:fixit_user/screens/bottom_screens/cart_screen/cart_shimmer/cart_shimmer.dart';

import '../../../config.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context1, value, child) {
      final screenHeight = MediaQuery.of(context).size.height;
      final screenWidth = MediaQuery.of(context).size.width;
      return value.widget1Opacity == 0.0 ? const CartShimmer(): PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          value.onBack(context, false);
          if(didPop) return;
        },
        child: Stack(
          children: [
            Scaffold(
                appBar: AppBar(
                    leadingWidth: 80,
                    title: Text(
                        language(context,
                            "${language(context, appFonts.myCart)}${value.cartList.isEmpty ? "" : " (${value.cartList.length})"}"),
                        style: appCss.dmDenseBold18
                            .textColor(appColor(context).darkText)),
                    centerTitle: true,
                    leading: CommonArrow(
                            arrow: rtl(context)
                                ? eSvgAssets.arrowRight
                                : eSvgAssets.arrowLeft,
                            onTap: () =>
                               value.onBack(context, true))
                        .paddingAll(Insets.i8),
                    actions: [
                      if (value.cartList.isNotEmpty)
                        CommonArrow(
                                arrow: eSvgAssets.add,
                                onTap: () =>
                                    route.pushNamed(context, routeName.dashboard))
                            .paddingSymmetric(horizontal: Insets.i20)
                    ]),
                body: value.cartList.isEmpty
                    ? EmptyLayout(
                        widget: Image.asset(eImageAssets.emptyCart,
                            height: Sizes.s380),
                        title: appFonts.oopsNothingAdd,
                        subtitle: appFonts.thereIsNothingInBasket,
                        buttonText: appFonts.goToService,
                        bTap: () => value.addServiceEmptyTap(context),
                      )
                    : Stack(
                        children: [
                          SingleChildScrollView(
                            controller: value.scrollController,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                      ...value.cartList
                                          .asMap()
                                          .entries
                                          .map((e) => CartLayout(
                                                data: e.value,
                                                editTap: () => value.editCart(
                                                    e.value, context, e.key),
                                                deleteTap: () =>
                                                    value.deleteCartConfirmation(
                                                        context, this, e.key),
                                              )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              language(
                                                  context,
                                                  value.data == null
                                                      ? appFonts.applyCoupon
                                                      : appFonts.appliedDiscount),
                                              style: appCss.dmDenseMedium14
                                                  .textColor(appColor(context)

                                                      .darkText)),
                                          Text(
                                                  language(
                                                      context, appFonts.viewAll),
                                                  style: appCss.dmDenseRegular14
                                                      .textColor(appColor(context)

                                                          .primary))
                                              .inkWell(
                                                  onTap: () => route
                                                      .pushNamed(
                                                          context,
                                                          routeName
                                                              .couponListScreen)
                                                      .then((values) =>
                                                          value.onCode(
                                                              context, values)))
                                        ],
                                      ),
                                      const VSpace(Sizes.s10),
                                      const DiscountCouponLayout(),
                                      if (value.data != null)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const VSpace(Sizes.s10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                    eSvgAssets.offerFill,
                                                    colorFilter: ColorFilter.mode(
                                                        appColor(context)

                                                            .greenColor,
                                                        BlendMode.srcIn)),
                                                const HSpace(Sizes.s5),
                                                if (value.checkoutModel != null)
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      RichText(
                                                          text: TextSpan(
                                                              text:
                                                                  "${language(context, appFonts.hurry)} ",
                                                              style: appCss
                                                                  .dmDenseMedium14
                                                                  .textColor(appColor(
                                                                          context)

                                                                      .greenColor),
                                                              children: [
                                                            TextSpan(
                                                                text:
                                                                    "${getSymbol(context)}${(currency(context).currencyVal * value.checkoutModel!.total!.couponTotalDiscount!).ceilToDouble()}",
                                                                style: appCss
                                                                    .dmDenseblack13
                                                                    .textColor(appColor(
                                                                            context)

                                                                        .greenColor)),
                                                            TextSpan(
                                                                text:
                                                                    " ${language(context, appFonts.withCode)}",
                                                                style: appCss
                                                                    .dmDenseSemiBold12
                                                                    .textColor(appColor(
                                                                            context)

                                                                        .greenColor))
                                                          ])),
                                                      const VSpace(Sizes.s2),
                                                      Text(
                                                          "(${language(context, appFonts.couponDesc)})",
                                                          style: appCss
                                                              .dmDenseMedium14
                                                              .textColor(appColor(
                                                                      context)

                                                                  .greenColor))
                                                    ],
                                                  )
                                              ],
                                            ),
                                          ],
                                        ),
                                      const VSpace(Sizes.s25),
                                      Consumer<CommonApiProvider>(
                                          builder: (context1, api, child) {
                                        return BillSummaryLayout(
                                            balance: userModel!.wallet != null
                                                ? "${getSymbol(context)}${(currency(context).currencyVal * double.parse(userModel!.wallet!.balance.toString())).toStringAsFixed(2)}"
                                                : "0");
                                      }),
                                      const VSpace(Sizes.s10),
                                      if (value.checkoutModel != null)
                                        const BillLayout(),
                                      const VSpace(Sizes.s10),
                                      const DottedLines()
                                          .paddingSymmetric(vertical: Insets.i15),
                                      Text(language(context, appFonts.disclaimer),
                                              style: appCss.dmDenseSemiBold12
                                                  .textColor(appColor(context)

                                                      .darkText))
                                          .paddingOnly(bottom: Insets.i8),
                                      Text(
                                          language(
                                              context, appFonts.onceYouClick),
                                          style: appCss.dmDenseMedium12.textColor(
                                              appColor(context).red))
                                    ])
                                    .paddingSymmetric(horizontal: Insets.i20)
                                    .marginOnly(top: 20),
                                const VSpace(Sizes.s100),
                              ]).marginOnly(bottom: Insets.i100)),
                          if (value.checkoutModel != null)
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CartBottomLayout(
                                amount:
                                    "${getSymbol(context)}${(currency(context).currencyVal * value.checkoutModel!.total!.total!).toStringAsFixed(2)}",
                                onTap: () => route.pushNamed(
                                    context, routeName.paymentScreen, arg: {
                                  "checkoutBody": value.checkoutBody,
                                  "checkoutModel": value.checkoutModel
                                }),
                              ),
                            )
                        ],
                      ).height(MediaQuery.of(context).size.height)),
            if (value.isLoading)
              Container(
                width: screenWidth,
                height: screenHeight,
                 color: appColor(context).darkText.withOpacity(0.2),
                child: Center(
                    child: Image.asset(
                  eGifAssets.loader,
                  height: Sizes.s100,
                )),
              )
          ],
        ),
      );
    });
  }
}
