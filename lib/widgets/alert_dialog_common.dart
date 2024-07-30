import 'package:flutter/cupertino.dart';
import '../config.dart';

class AlertDialogCommon extends StatelessWidget {
  final String? image, title, subtext, bText1;
  final GestureTapCallback? b1OnTap;
  final double? height;
  final bool? isBooked;
  final Widget? widget;


  const AlertDialogCommon(
      {super.key,
      this.title,
      this.b1OnTap,
      this.bText1,
      this.image,
      this.subtext,
      this.isBooked = false,
      this.widget,
      this.height});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(horizontal: Insets.i20),
        shape: const  SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(SmoothRadius(
                cornerRadius: AppRadius.r14, cornerSmoothing: 1))),
        backgroundColor: appColor(context).whiteBg,
        content: Stack(alignment: Alignment.topRight, children: [
          Column(
              mainAxisSize: MainAxisSize.min, children: [
            // Gif
          isBooked == true ? widget! : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(image!, height: height ?? Sizes.s190))
                .paddingSymmetric(vertical: Insets.i20)
                .decorated(
                    color: appColor(context).fieldCardBg,
                    borderRadius: BorderRadius.circular(AppRadius.r10)),
            // Sub text
            const VSpace(Sizes.s15),
            Text(language(context, subtext!),
                textAlign: TextAlign.center,
                style: appCss.dmDenseRegular14
                    .textColor(appColor(context).lightText)
                    .textHeight(1.1)),
            const VSpace(Sizes.s20),
            ButtonCommon(onTap: b1OnTap, title: bText1!)
          ]).padding(
              horizontal: Insets.i20, top: Insets.i60, bottom: Insets.i20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // Title
            Text(language(context, title!),
                style: appCss.dmDenseExtraBold18
                    .textColor(appColor(context).darkText)),
            Icon(CupertinoIcons.multiply,
                    size: Sizes.s20, color: appColor(context).darkText)
                .inkWell(onTap: () => route.pop(context))
          ]).paddingAll(Insets.i20)
        ]));
  }
}
