import '../../../../config.dart';

class AddMoneyLayout extends StatelessWidget {
  final BuildContext? buildContext;

  const AddMoneyLayout({super.key, this.buildContext});

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletProvider>(builder: (context1, value, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
                shape: const SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius.only(
                        topLeft: SmoothRadius(
                            cornerRadius: AppRadius.r20, cornerSmoothing: 1),
                        topRight: SmoothRadius(
                            cornerRadius: AppRadius.r20,
                            cornerSmoothing: 0.4))),
                color: appColor(context).whiteBg),
            child: SingleChildScrollView(
                child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, appFonts.addMoney),
                    style: appCss.dmDenseMedium18
                        .textColor(appColor(context).darkText)),
                SvgPicture.asset(eSvgAssets.close)
                    .inkWell(onTap: () => route.pop(context))
              ]).paddingAll(Insets.i20),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(language(context, appFonts.amount),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText)),
                const VSpace(Sizes.s8),
                TextFieldCommon(
                    controller: value.moneyCtrl,
                    focusNode: value.moneyFocus,
                    keyboardType: TextInputType.number,
                    hintText: appFonts.enterAmount,
                    prefixIcon: eSvgAssets.amount),
                const VSpace(Sizes.s20),
                Text(language(context, appFonts.addForm),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText)),
                const VSpace(Sizes.s8),
                PaymentDropDownLayout(
                    icon: eSvgAssets.wallet,
                    val: value.wallet,
                    isIcon: true,
                    list: value.paymentList,
                    onChanged: (val) => value.onTapGateway(val)),


              ])
                  .paddingSymmetric(
                      vertical: Insets.i20, horizontal: Insets.i15)
                  .boxShapeExtension(
                      color: appColor(context).fieldCardBg)
                  .paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s30),
              Row(children: [
                Expanded(
                    child: ButtonCommon(
                        title: appFonts.cancel,
                        color: appColor(context).whiteBg,
                        borderColor: appColor(context).primary,
                        onTap: () => route.pop(context),
                        style: appCss.dmDenseSemiBold16
                            .textColor(appColor(context).primary))),
                const HSpace(Sizes.s15),
                Expanded(
                    child: ButtonCommon(
                        title: appFonts.addMoney,
                        onTap: () => value.addToWallet(context, buildContext)))
              ]).paddingSymmetric(horizontal: Insets.i20)
            ]))),
      );
    });
  }
}
