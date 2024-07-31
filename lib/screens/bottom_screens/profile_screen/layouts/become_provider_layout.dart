import 'package:fixit_user/services/environment.dart';

import '../../../../config.dart';
import 'package:url_launcher/url_launcher.dart';

class BecomeProviderLayout extends StatelessWidget {
  const BecomeProviderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: ShapeDecoration(
                color: appColor(context).primary.withOpacity(0.1),
                shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: AppRadius.r12, cornerSmoothing: 1))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Image.asset(eImageAssets.becomeProvider,
                        height: Sizes.s40, width: Sizes.s40),
                    const HSpace(Sizes.s15),
                    Text(language(context, appFonts.becomeProvider),
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).primary))
                  ]),
                  SvgPicture.asset(
                      rtl(context)
                          ? eSvgAssets.arrowLeft
                          : eSvgAssets.arrowRight,
                      colorFilter: ColorFilter.mode(
                          appColor(context).primary, BlendMode.srcIn))
                ]).paddingAll(Insets.i15))
        .inkWell(onTap: () => launchUrl(Uri.parse(playstoreUrl)))
        .paddingOnly(top: Insets.i25);
  }
}
