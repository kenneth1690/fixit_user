
import '../../../../config.dart';

class BookYourServiceLayout extends StatelessWidget {
  final double? price;
  final TextStyle? style;
  final Services? services;
  final int? requiredServiceMan, packageServiceId;
  final GestureTapCallback? minusTap, addTap, onTap;
  final bool isPackage;

  const BookYourServiceLayout(
      {super.key,
      this.price,
      this.style,
      this.requiredServiceMan,
      this.addTap,
      this.minusTap,
      this.services,
      this.onTap,
      this.packageServiceId,
      this.isPackage = false});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProviderDetailsProvider, SelectServicemanProvider>(
        builder: (context2, value, serviceCtrl, child) {
      return StatefulBuilder(builder: (context1, setState) {

        return SizedBox(
            height: MediaQuery.of(context).size.height / 1.4,
            child: Stack(children: [
              SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const BottomSheetTopLayout(),
                    const VSpace(Sizes.s25),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ServiceLayout(
                              title: services!.title!,
                              isPackage: isPackage,
                              image: services!.media != null &&
                                      services!.media!.isNotEmpty
                                  ? services!.media![0].originalUrl!
                                  : null,
                              price: (int.parse(requiredServiceMan.toString()) *
                                  price!)
                                  .toString(),
                              style: style),
                          Text(language(context, appFonts.addRequiredPerson),
                                  style: appCss.dmDenseMedium14.textColor(
                                      appColor(context).darkText))
                              .paddingOnly(top: Insets.i25),
                          PersonRequiredAnimation(
                              addTap: addTap,
                              requiredMan: requiredServiceMan,
                              minusTap: minusTap),
                          if (requiredServiceMan! >
                              (services!.requiredServicemen??1))
                            Text(language(context, appFonts.youWillOnly),
                                    style: appCss.dmDenseMedium12.textColor(
                                        appColor(context).red))
                                .paddingOnly(bottom: Insets.i25),
                          AnimatedOpacity(
                              opacity: isAlert ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                      "You need to select ${services!.requiredServicemen} serviceman",
                                      textAlign: TextAlign.center,
                                      style: appCss.dmDenseMedium14.textColor(
                                          appColor(context).red))
                                  .paddingOnly(
                                      bottom: isAlert ? Insets.i20 : 0)),
                          Text(language(context, appFonts.chooseOneOf),
                              style: appCss.dmDenseMedium14.textColor(
                                  appColor(context).darkText)),
                          const VSpace(Sizes.s10),
                          Column(
                                  children: appArray.servicemanChooseList
                                      .asMap()
                                      .entries
                                      .map((e) => ChooseServicemanLayout(
                                          title: e.value,
                                          index: e.key,
                                          selectIndex:
                                              value.selectProviderIndex,
                                          list: appArray.servicemanChooseList,
                                          onTap: () =>
                                              value.onChooseService(e.key)).inkWell(onTap: () =>
                                      value.onChooseService(e.key)))
                                      .toList())
                              .paddingSymmetric(
                                  horizontal: Insets.i15, vertical: Insets.i20)
                              .boxBorderExtension(context, isShadow: true)
                        ]).paddingSymmetric(horizontal: Insets.i20),
                    const VSpace(Sizes.s30),
                    ButtonCommon(
                            title: appFonts.bookNow,
                            onTap: () => serviceCtrl.onTapBook(context,
                                service: services,
                                isPackage: isPackage,
                                index: packageServiceId,
                                //providerModel: providerModel,
                                selectProviderIndex: value.selectProviderIndex))
                        .paddingSymmetric(horizontal: Insets.i20)
                  ]).paddingSymmetric(vertical: Insets.i20))
            ])).bottomSheetExtension(context);
      });
    });
  }
}
