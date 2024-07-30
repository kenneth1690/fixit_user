import '../../../../config.dart';

class WalletOptionSelection extends StatelessWidget {
  const WalletOptionSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(builder: (context1, value, child) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          SvgPicture.asset(
            eSvgAssets.wallet,
            colorFilter: ColorFilter.mode(
                value.isWallet
                    ? appColor(context).primary
                    : appColor(context).darkText,
                BlendMode.srcIn),
          ).paddingAll(Insets.i10).decorated(
              color: value.isWallet
                  ? appColor(context).primary.withOpacity(0.1)
                  : appColor(context).fieldCardBg,
              shape: BoxShape.circle),
          const HSpace(Sizes.s12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(language(context, appFonts.wallet),
                    style: appCss.dmDenseSemiBold14.textColor(value.isWallet
                        ? appColor(context).primary
                        : appColor(context).darkText))
               ,
            Text(
                language(context,
                    "${getSymbol(context)}${value.userModel != null && value.userModel!.wallet != null ? (currency(context).currencyVal * value.userModel!.wallet!.balance!).ceilToDouble() : "0.00"}"),
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).lightText))
          ])
        ]),
        Container(
                width: Sizes.s22,
                height: Sizes.s22,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: value.isWallet
                            ? appColor(context).trans
                            : appColor(context).stroke),
                    color: value.isWallet
                        ? appColor(context).primary.withOpacity(0.18)
                        : appColor(context).trans),
                child: value.isWallet
                    ? Icon(Icons.circle,
                        color: appColor(context).primary, size: 13)
                    : null)
            .inkWell(onTap: () =>value.onTapWallet(context))
      ])
          .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
          .boxBorderExtension(context, isShadow: value.isWallet ? false : true)
          .paddingSymmetric(vertical: Insets.i10) .inkWell(onTap: () => value.onTapWallet(context, ));
    });
  }
}
