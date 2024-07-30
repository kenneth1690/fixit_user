import 'package:fixit_user/common_tap.dart';

import '../../../config.dart';

class SelectServiceScreen extends StatelessWidget {
  const SelectServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectServicemanProvider>(
        builder: (context1, value, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(
              const Duration(milliseconds: 100), () => value.onReady(context)),
          child: WillPopScope(
            onWillPop: () async {
              value.onBack();
              return true;
            },
            child: Scaffold(
                appBar: AppBarCommon(
                  title: appFonts.selectServiceman,
                  onTap: () {
                    value.onBack();
                    route.pop(context);
                  },
                ),
                body: Stack(alignment: Alignment.bottomCenter, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(language(context, appFonts.includedServiceInPackage),
                          style: appCss.dmDenseMedium14
                              .textColor(appColor(context).darkText)),
                      const VSpace(Sizes.s15),
                      ...servicePackageList
                          .asMap()
                          .entries
                          .map((e) => ServicePackageLayout(
                              data: e.value,
                              onTap: ()
                              {
                                final providerDetail = Provider.of<ProviderDetailsProvider>(context, listen: false);
                                providerDetail.selectProviderIndex = 0;
                                providerDetail.notifyListeners();
                                    onBook(context, e.value,
                                        isPackage: true,
                                        packageServiceId: e.key,
                                        addTap: () => value.onAdd(e.key),
                                        minusTap: () => value.onRemoveService(
                                            context, e.key));
                                  }))

                    ],
                  ).paddingSymmetric(horizontal: Insets.i20),
                  ButtonCommon(
                          onTap: () => value.addToCart(context),
                          title: appFonts.confirmBooking,
                          color: value.buttonVisible(context)
                              ? appColor(context).primary
                              : appColor(context).stroke,
                          style: appCss.dmDenseMedium16.textColor(
                              value.buttonVisible(context)
                                  ? appColor(context).whiteBg
                                  : appColor(context).lightText))
                      .paddingSymmetric(horizontal: Insets.i20).paddingOnly(bottom: Insets.i20)
                ])),
          ));
    });
  }
}
