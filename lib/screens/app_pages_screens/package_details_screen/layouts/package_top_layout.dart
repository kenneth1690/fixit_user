import 'package:fixit_user/config.dart';

class PackageTopLayout extends StatelessWidget {

  final ServicePackageModel? packageModel;
  const PackageTopLayout({super.key,this.packageModel});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(eImageAssets.packageBg,
            height: Sizes.s78, width: MediaQuery.of(context).size.width),
        const VSpace(Sizes.s12),

        Text(language(context, packageModel!.title!),
            style: appCss.dmDenseMedium16
                .textColor(appColor(context).darkText)),
        const VSpace(Sizes.s4),
        Text("${getSymbol(context)}${currency(context).currencyVal * (packageModel!.price ?? 0.0)}",
            style: appCss.dmDenseBold18
                .textColor(appColor(context).online)),
        Image.asset(eImageAssets.bulletDotted)
            .paddingSymmetric(vertical: Insets.i15),
        Text(language(context, appFonts.description),
            style: appCss.dmDenseMedium14
                .textColor(appColor(context).darkText))
            .alignment(Alignment.centerLeft),
        const VSpace(Sizes.s8),
        Text(

            language(context,
                packageModel!.description),

            style: appCss.dmDenseMedium12
                .textColor(appColor(context).lightText)).alignment(Alignment.centerLeft)
      ]
    );
  }
}
