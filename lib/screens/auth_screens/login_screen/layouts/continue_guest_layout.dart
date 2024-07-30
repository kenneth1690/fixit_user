import '../../../../config.dart';

class ContinueGuestLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  const ContinueGuestLayout({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(eSvgAssets.profile),
              VerticalDivider(
                  color: appColor(context).stroke,
                  width: 1,
                  thickness: 1)
                  .paddingSymmetric(horizontal: Insets.i10),
              Text(language(context, appFonts.continueAsGuest),
                  style: appCss.dmDenseMedium14.textColor(
                      appColor(context).primary))
            ]).inkWell(
            onTap: onTap
        ));
  }
}
