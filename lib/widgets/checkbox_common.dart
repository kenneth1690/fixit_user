import '../config.dart';

class CheckBoxCommon extends StatelessWidget {
  final bool? isCheck;
  final GestureTapCallback? onTap;
  const CheckBoxCommon({super.key,this.isCheck = false,this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: Sizes.s20,
        width: Sizes.s20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isCheck == true
                ? appColor(context).primary
                : appColor(context).whiteBg,
            borderRadius: BorderRadius.circular(AppRadius.r4),
            border: Border.all(color:isCheck == true
                ? appColor(context).trans
                : appColor(context).stroke)),
        child: isCheck == true
            ? Icon(Icons.check,
            size: Sizes.s15,
            color: appColor(context).whiteBg)
            : null)
        .inkWell(onTap: onTap);
  }
}
