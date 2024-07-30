import '../../../../config.dart';

class AmPmLayout extends StatelessWidget {
  final int? index,selectedIndex;
  final dynamic data;
  final GestureTapCallback? onTap;
  const AmPmLayout({super.key,this.onTap,this.index,this.selectedIndex,this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Sizes.s40,
        width: Sizes.s50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: index == selectedIndex
                ? appColor(context).primary
                : appColor(context).fieldCardBg,
            borderRadius: rtl(context) ? BorderRadius.only(
                bottomLeft: Radius.circular(index == 0 ? 0 : AppRadius.r30),
                topLeft: Radius.circular(index == 0 ? 0 : AppRadius.r30),
                topRight: Radius.circular(index == 0 ? AppRadius.r30 : 0),
                bottomRight: Radius.circular(index == 0 ? AppRadius.r30 : 0))
                : BorderRadius.only(
                bottomLeft: Radius.circular(index == 0 ? AppRadius.r30 : 0),
                topLeft: Radius.circular(index == 0 ? AppRadius.r30 : 0),
                topRight: Radius.circular(index == 0 ? 0 : AppRadius.r30),
                bottomRight: Radius.circular(index == 0 ? 0 : AppRadius.r30))),
        child: Text(language(context, data),
            style: appCss.dmDenseMedium14.textColor(
                index == selectedIndex
                    ? appColor(context).whiteBg
                    : appColor(context).lightText))).inkWell(onTap: onTap);
  }
}
