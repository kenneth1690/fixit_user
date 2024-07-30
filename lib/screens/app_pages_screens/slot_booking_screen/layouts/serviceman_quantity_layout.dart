import '../../../../config.dart';

class ServicemanQuantityLayout extends StatelessWidget {
  const ServicemanQuantityLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<SlotBookingProvider>(context);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          width: Sizes.s180,
          child: Text(language(context, appFonts.requiredServicemen),
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).darkText))),
      Stack(
          alignment: !value.visible ? Alignment.topRight : Alignment.center,
          children: [
            Container(
                width: Sizes.s100,
                height: 40,
                decoration: BoxDecoration(
                    color: appColor(context).fieldCardBg,
                    borderRadius: BorderRadius.circular(6))),
            SizedBox(
                width: Sizes.s100,
                height: Sizes.s40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => value.onRemoveService(
                                context,
                              ),
                          child: SvgPicture.asset(eSvgAssets.minus).paddingOnly(
                              left: AppLocalizations.of(context)
                                          ?.locale
                                          .languageCode ==
                                      "ar"
                                  ? 0
                                  : 8,
                              right: AppLocalizations.of(context)
                                          ?.locale
                                          .languageCode ==
                                      "ar"
                                  ? 8
                                  : 0)),
                      Text(
                          "${value.servicesCart!.selectedRequiredServiceMan ?? 1}",
                          style: appCss.dmDenseMedium14
                              .textColor(appColor(context).darkText)),
                      Container(
                          decoration: ShapeDecoration(
                              color: appColor(context).primary,
                              shape: SmoothRectangleBorder(
                                  borderRadius: SmoothBorderRadius(
                                      cornerRadius: 6, cornerSmoothing: 1))),
                          child: IconButton(
                              onPressed: () => value.onAdd(),
                              icon: Icon(
                                Icons.add,
                                color: appColor(context).whiteColor,
                              ))).inkWell(onTap: () => value.onAdd())
                    ]))
          ])
    ])
        .paddingAll(Insets.i15)
        .boxBorderExtension(context, isShadow: true)
        .paddingOnly(
            top: Insets.i10,
            bottom: Insets.i10,
            left: Insets.i20,
            right: Insets.i20);
  }
}
