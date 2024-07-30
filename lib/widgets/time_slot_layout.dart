import '../config.dart';

class TimeSlotLayout extends StatelessWidget {
  final String? title;
  final GestureTapCallback? onTap;
  const TimeSlotLayout({super.key,this.onTap,this.title});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(language(context, title!),
          style: appCss.dmDenseMedium14
              .textColor(appColor(context).darkText)),
      const VSpace(Sizes.s6),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(language(context, appFonts.selectDateTime),
            style: appCss.dmDenseMedium14
                .textColor(appColor(context).lightText)),
        SvgPicture.asset(eSvgAssets.calendar)
      ])
          .paddingAll(Insets.i15)
          .boxShapeExtension(color: appColor(context).whiteBg)
          .inkWell(onTap: onTap /*value.onProviderDateTimeSelect(context)*/)
    ]).paddingAll(AppRadius.r15)
        .boxShapeExtension(color: appColor(context).fieldCardBg);
  }
}
