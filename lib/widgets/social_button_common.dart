import '../config.dart';

class SocialButtonCommon extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  const SocialButtonCommon({super.key,this.data,this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 84,alignment: Alignment.center,
      decoration:  ShapeDecoration(
          color: appColor(context).primary.withOpacity(0.1),

          shape:  SmoothRectangleBorder(
              side: BorderSide(color: appColor(context).primary),
              borderRadius: const SmoothBorderRadius.all(
                  SmoothRadius(
                      cornerRadius: AppRadius.r8,
                      cornerSmoothing: 1)))),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(data["image"],colorFilter: ColorFilter.mode(appColor(context).primary, BlendMode.srcIn),height: Sizes.s14,width: Sizes.s14,),
            const HSpace(Sizes.s4),
            Text(language(context, data["title"]),
                style: appCss.dmDenseMedium12.textColor(
                    appColor(context).primary))
          ]).paddingSymmetric(vertical: Insets.i10,horizontal: Insets.i15),
    ).inkWell(onTap: onTap);
  }
}
