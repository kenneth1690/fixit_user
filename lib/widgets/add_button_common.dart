import '../config.dart';

class AddButtonCommon extends StatelessWidget {
  final GestureTapCallback? onTap;
  const AddButtonCommon({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
            color: appColor(context).primary,
            shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                    cornerRadius: AppRadius.r8,
                    cornerSmoothing: 1))),
        child: SizedBox(
          width: Sizes.s60,
          child: Text("+ ${language(context, appFonts.add)}",
              overflow: TextOverflow.clip,
              style: appCss.dmDenseMedium12.textColor(
                  appColor(context).whiteColor))
              .padding(
              horizontal: Insets.i12, vertical: Insets.i10),
        )).inkWell(onTap: onTap);
  }
}

class AddedButtonCommon extends StatelessWidget {
  final GestureTapCallback? onTap;
  const AddedButtonCommon({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        decoration: ShapeDecoration(
            color: appColor(context).primary.withOpacity(0.10),
            shape: SmoothRectangleBorder(
              side: BorderSide(color: appColor(context).primary),
                borderRadius: SmoothBorderRadius(
                    cornerRadius: AppRadius.r8,
                    cornerSmoothing: 1))),
        child: SizedBox(
          width: Sizes.s65,
          child: Text(language(context, appFonts.added),
              overflow: TextOverflow.clip,
              style: appCss.dmDenseMedium12.textColor(
                  appColor(context).primary))
              .padding(
              horizontal: Insets.i12, vertical: Insets.i10),
        )).inkWell(onTap: onTap);
  }
}
