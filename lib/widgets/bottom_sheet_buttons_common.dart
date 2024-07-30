import '../config.dart';

class BottomSheetButtonCommon extends StatelessWidget {
  final GestureTapCallback? clearTap,applyTap;
  final String? textOne,textTwo;
  final bool isRateComplete;
  final Widget? iconOne,iconTwo;
  const BottomSheetButtonCommon({super.key,this.applyTap,this.clearTap,this.textOne,this.textTwo,  this.isRateComplete =false, this.iconOne, this.iconTwo});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: ButtonCommon(
            icon: iconOne,
              title: textOne!,
              onTap: clearTap,
              style: appCss.dmDenseSemiBold16
                  .textColor(appColor(context).primary),
              color: appColor(context).trans,
              borderColor: appColor(context).primary)),
      if(!isRateComplete)
      const HSpace(Sizes.s15),
      if(!isRateComplete)
      Expanded(child: ButtonCommon(title: textTwo!,onTap: applyTap,icon: iconTwo,))
    ]).paddingOnly(left:Insets.i20,right: Insets.i20,bottom: Insets.i20);
  }
}
