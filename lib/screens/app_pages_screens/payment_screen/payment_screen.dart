
import 'dart:developer';

import 'package:flutter/rendering.dart';

import '../../../config.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(builder: (context1, value, child) {
log("kdsjhg");
      return LoadingComponent(
        child: StatefulWrapper(
            onInit: () => Future.delayed(Durations.short3)
                .then((_) => value.getUserDetail(context)),
            child: Scaffold(
                appBar: AppBarCommon(title: appFonts.payment),
                body: Stack(alignment: Alignment.bottomCenter,
                  children: [
                    ListView(
controller: value.scrollController,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(language(context, appFonts.selectMethod),
                                    style: appCss.dmDenseSemiBold14.textColor(
                                        appColor(context).lightText)).paddingSymmetric(horizontal: Insets.i20),
                                const VSpace(Sizes.s5),
                                if (value.bookingId == 0)
                                  if (userModel!.wallet != null && userModel!.wallet!.balance! >
                                      (value.checkoutModel != null
                                          ? value.checkoutModel!.total!.total ?? 0.0
                                          : 0.0))
                                    const WalletOptionSelection().paddingSymmetric(horizontal: Insets.i20),
                                ...paymentMethods
                                    .where((element) => element.status == true)
                                    .toList()
                                    .asMap()
                                    .entries
                                    .map((e) => PaymentMethodLayout(
                                        index: e.key,
                                        data: e.value,
                                        selectIndex: value.selectIndex,
                                        onTap: () => value.onSelectPaymentMethod(
                                            e.key, e.value.slug)))
                              ]),
                          const VSpace(Sizes.s100)

                        ]),
                    AnimatedBuilder(
                      animation: value.scrollController,
                      builder: (BuildContext context,
                          Widget? child) {
                        return AnimatedContainer(
                            duration: const Duration(
                                milliseconds: 400),
                            height: 70,
                            child: child);
                      },
                      child: ButtonCommon(
                          title: appFonts.continues,
                          margin: Sizes.s20,
                          onTap: () => value.addToCartOrBooking(context))
                          .paddingOnly(bottom: Insets.i20).backgroundColor(
                          appColor(context).whiteBg)
                    )
                  ]
                ))),
      );
    });
  }
}
