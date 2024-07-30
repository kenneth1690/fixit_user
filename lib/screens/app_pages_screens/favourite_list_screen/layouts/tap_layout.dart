import '../../../../config.dart';

class TapLayout extends StatelessWidget {
  final int? index,selectedIndex;
  final dynamic data;
  final GestureTapCallback? onTap;
  const TapLayout({super.key,this.selectedIndex,this.index,this.data,this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
          height: height * 0.1,
          width: width,
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
                  :  BorderRadius.only(
                bottomLeft: Radius.circular(index == 0 ? AppRadius.r30 : 0),
                  topLeft: Radius.circular(index == 0 ? AppRadius.r30 : 0),
                  topRight: Radius.circular(index == 0 ? 0 : AppRadius.r30),
                  bottomRight: Radius.circular(index == 0 ? 0 : AppRadius.r30))),
          child: Text(language(context, data),
              style: appCss.dmDenseMedium14.textColor(index == selectedIndex
                  ? appColor(context).whiteBg
                  : appColor(context).lightText)).inkWell(onTap: onTap),)
    );
  }
}
