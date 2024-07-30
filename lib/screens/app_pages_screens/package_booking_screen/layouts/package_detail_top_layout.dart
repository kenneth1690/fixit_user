import 'package:fixit_user/models/package_booking_model.dart';
import 'package:fixit_user/screens/app_pages_screens/package_booking_screen/layouts/package_included_service_layout.dart';

import '../../../../config.dart';

class PackageDetailTopLayout extends StatelessWidget {
  final PackageBookingModel? data;
  const PackageDetailTopLayout({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
         //  PackageTopLayout(packageModel: data!),
          const VSpace(Sizes.s15),
          Column(children: [

            ProviderDetailLayout(
              //  title: appFonts.providerDetails,
                image: data!.pImage,
                name: data!.pName,
                rate: data!.rate,
                star: eSvgAssets.star3)
          ]).paddingSymmetric(vertical: Insets.i15).boxShapeExtension(
              color: appColor(context).fieldCardBg),
          Text(language(context, appFonts.includedService),
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).darkText))
              .paddingOnly(top: Insets.i15, bottom: Insets.i10)
              .alignment(Alignment.centerLeft),
           ...data!.includedService!.asMap().entries.map((s) => PackageIncludedServiceLayout(data: s.value)).toList()

        ])).paddingAll(Insets.i15).boxBorderExtension(context,
        isShadow: true, radius: AppRadius.r12);
  }
}
