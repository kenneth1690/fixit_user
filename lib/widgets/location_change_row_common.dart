import '../config.dart';

class LocationChangeRowCommon extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? title;
  const LocationChangeRowCommon({super.key,this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(language(context, appFonts.location),
          overflow: TextOverflow.ellipsis,
          style: appCss.dmDenseMedium14
              .textColor(appColor(context).darkText)),
      Text(language(context, title ?? appFonts.change),
          style: appCss.dmDenseRegular14
              .textColor(appColor(context).primary))
          .inkWell(onTap: onTap)
    ]).paddingSymmetric(horizontal: Insets.i20);
  }
}
