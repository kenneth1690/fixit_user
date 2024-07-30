import '../../../../config.dart';

class BookingStatusFilterLayout extends StatelessWidget {
  final String? title;
  final int? index,selectedIndex;
  final GestureTapCallback? onTap;
  const BookingStatusFilterLayout({super.key,this.title,this.onTap,this.selectedIndex,this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title!,
            style: appCss.dmDenseMedium14
                .textColor(appColor(context).darkText)),
        CommonRadio(index: index, selectedIndex: selectedIndex,onTap: onTap)
      ]
    )
        .paddingAll(Insets.i15)
        .boxBorderExtension(context,
            color: appColor(context).whiteBg, isShadow: true)
        .paddingOnly(bottom: Insets.i12);
  }
}
