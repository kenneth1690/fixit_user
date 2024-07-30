import '../../config.dart';

class ButtonCommon extends StatelessWidget {
  final String title;
  final double? padding, margin, radius, height, fontSize, width;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color, fontColor, borderColor;
  final Widget? icon;
  final FontWeight? fontWeight;

  const ButtonCommon(
      {super.key,
      required this.title,
      this.padding,
      this.margin = 0,
      this.radius = AppRadius.r8,
      this.height = 50,
      this.fontSize = FontSizes.f30,
      this.onTap,
      this.style,
      this.color,
      this.fontColor,
      this.icon,
      this.borderColor,
      this.width,
      this.fontWeight = FontWeight.w700});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: margin!),
        decoration: ShapeDecoration(
            color: color ?? appColor(context).primary,
            shape: SmoothRectangleBorder(
                side: BorderSide(color: borderColor ?? appColor(context).trans),
                borderRadius: SmoothBorderRadius(
                    cornerRadius: radius!, cornerSmoothing: 1))),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(language(context, title),
              textAlign: TextAlign.center,
              style: style ??
                  appCss.dmDenseSemiBold16
                      .textColor(fontColor ?? appColor(context).whiteColor)),
          if (icon != null)
            Row(children: [icon!, const HSpace(Sizes.s10)])
                .paddingOnly(left: Insets.i8),
        ])).inkWell(onTap: onTap);
  }
}
