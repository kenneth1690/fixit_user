import '../../../../config.dart';

class TermsLayout extends StatelessWidget {
  const TermsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context,register,child) {
        return Row(children: [
          Container(
                  height: Sizes.s20,
                  width: Sizes.s20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: register.isCheck
                          ? appColor(context).primary
                          : appColor(context).whiteBg,
                      borderRadius: BorderRadius.circular(AppRadius.r4),
                      border: Border.all(color: appColor(context).stroke)),
                  child: register.isCheck
                      ? Icon(Icons.check,
                          size: Sizes.s15,
                          color: appColor(context).whiteBg)
                      : null)
              .inkWell(onTap: () => register.isCheckBoxCheck(!register.isCheck)),
          const HSpace(Sizes.s10),
          Text(appFonts.agreeTerms,
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).lightText))
        ]).paddingSymmetric(horizontal: Insets.i20);
      }
    );
  }
}
