import '../../../../config.dart';

class CartBottomLayout extends StatelessWidget {
  final String? amount;
  final GestureTapCallback? onTap;
  const CartBottomLayout({super.key,this.amount,this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: Sizes.s120,
            width: MediaQuery.of(context).size.width,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, appFonts.subtotal),
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).lightText)),
                Text(amount!,
                    style: appCss.dmDenseBold20
                        .textColor(appColor(context).primary))
              ]),
              const VSpace(Sizes.s12),
              ButtonCommon(
                  title: appFonts.proceedCheckout,
                  icon: SvgPicture.asset(eSvgAssets.doubleRight),
                  onTap:onTap)
            ]).paddingSymmetric(horizontal: Insets.i20))
        .decorated(color: isDark(context)?appColor(context).whiteBg: appColor(context).cartBottomBg);
  }
}
