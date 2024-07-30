import '../config.dart';

class FilterIconCommon extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? selectedFilter;

  const FilterIconCommon({super.key, this.onTap, this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CommonArrow(
              arrow: eSvgAssets.filter,
              color: appColor(context).whiteBg,
              onTap: onTap)
          .paddingAll(Insets.i4),
      if (selectedFilter != "0")
        Container(
          
                child: Text(selectedFilter!,
                        style: appCss.dmDenseMedium8
                            .textColor(appColor(context).whiteColor))
                    .paddingAll(Insets.i5))
            .decorated(
                color: appColor(context).red, shape: BoxShape.circle)
            .paddingOnly(top: Insets.i2, left: Insets.i2)
    ]);
  }
}
