import '../config.dart';

class EmptyLayout extends StatelessWidget {
  final String? title,subtitle,buttonText,inkText;
  final Widget? widget;
  final GestureTapCallback? bTap,inkOnTap;
  final bool isInk,isButtonShow,isBooking;
  const EmptyLayout({super.key,this.subtitle,this.bTap,this.title,this.buttonText,this.widget,this.inkText,this.inkOnTap,this.isInk = false,  this.isButtonShow=true,  this.isBooking=false, });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:isBooking? MainAxisAlignment.start: MainAxisAlignment.center, children: [
      const SizedBox(),
      Column(

          children: [
       widget!,
        const VSpace(Sizes.s25),
        Text(language(context, title!),
            style: appCss.dmDenseBold18
                .textColor(appColor(context).darkText)),
        const VSpace(Sizes.s8),
        Text(language(context, subtitle!),
            textAlign: TextAlign.center,
            style: appCss.dmDenseRegular14
                .textColor(appColor(context).lightText)).paddingSymmetric(horizontal: Insets.i10)
      ]),
    const VSpace(Sizes.s25),
      if(isButtonShow)
      Column(
        children: [
          ButtonCommon(
              title: buttonText!,
              onTap: bTap)
              .paddingOnly(bottom: isInk == true ? Insets.i15 : Insets.i40),
          if(isInk == true)
            Text(language(context, inkText!),style: appCss.dmDenseMedium16
                .textColor(appColor(context).primary)).inkWell(onTap: inkOnTap).paddingOnly(bottom: Insets.i40)
        ],
      )
    ]).paddingSymmetric(horizontal: Insets.i20);
  }
}
