import '../../../../config.dart';

class RatingBarLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final int? index;
  final bool? selectedIndex;

  const RatingBarLayout(
      {super.key, this.data, this.onTap, this.selectedIndex, this.index});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IntrinsicHeight(
          child: Row(children: [
        Text("${language(context, data['rate'])} ${language(context,data['rate'] =="1"?appFonts.rating : appFonts.ratings)}",
            style: appCss.dmDenseMedium14
                .textColor(appColor(context).darkText)),
        VerticalDivider(
                indent: 4,
                endIndent: 4,
                width: 1,
                color: appColor(context).stroke)
            .paddingSymmetric(horizontal: Insets.i12),
        SvgPicture.asset(data['icon'])
      ])),
      CheckBoxCommon(
          isCheck: selectedIndex, onTap: onTap),
  //    CommonRadioBool(index: index, selectedIndex: selectedIndex, onTap: onTap)
    ])
        .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
        .boxBorderExtension(context, isShadow: true,bColor:  appColor(context).fieldCardBg)
        .padding(horizontal: Insets.i20, bottom: Insets.i15);
  }
}
