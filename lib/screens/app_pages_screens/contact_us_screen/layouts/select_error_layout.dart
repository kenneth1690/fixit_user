import '../../../../config.dart';

class SelectErrorLayout extends StatelessWidget {
  final dynamic data;
  final int? index, selectedIndex;
  final GestureTapCallback? onTap;

  const SelectErrorLayout(
      {super.key, this.selectedIndex, this.data, this.onTap, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            height: Sizes.s40,
            width: Sizes.s130,
            child: Text(language(context, data),overflow: TextOverflow.ellipsis,
                style: selectedIndex == index
                    ? appCss.dmDenseSemiBold14
                        .textColor(appColor(context).primary)
                    : appCss.dmDenseMedium14
                        .textColor(appColor(context).lightText)).paddingSymmetric(horizontal: Insets.i10))
        .boxBorderExtension(context,
            bColor: selectedIndex == index
                ? appColor(context).primary
                : appColor(context).trans,
            isShadow: false,
            color: selectedIndex == index
                ? appColor(context).primary.withOpacity(0.1)
                : appColor(context).whiteBg)
        .inkWell(onTap: onTap);
  }
}
