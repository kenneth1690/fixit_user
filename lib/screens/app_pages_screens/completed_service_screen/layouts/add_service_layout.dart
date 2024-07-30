import '../../../../config.dart';

class AddServiceLayout extends StatelessWidget {
  final List<ExtraCharges>? extraCharge;
  const AddServiceLayout({super.key, this.extraCharge});

  @override
  Widget build(BuildContext context) {
    /*final value = Provider.of<AddExtraChargesProvider>(context);*/
    return Column(
        children: extraCharge!.asMap().entries.map((e) => Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(e.value.title!,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).darkText)),
              const VSpace(Sizes.s5),
              Text("${getSymbol(context)}${currency(context).currencyVal * double.parse(e.value.perServiceAmount!)} per service",
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).primary)),
            ]),
            Image.asset(eImageAssets.serviceIcon,
                height: Sizes.s46, width: Sizes.s46)
          ]),
          const DottedLines().paddingSymmetric(vertical: Insets.i12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(language(context, appFonts.noServiceDone),
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).darkText)),
            Text(e.value.noServiceDone!,
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).darkText))
          ])
        ]).paddingAll(Insets.i15).boxBorderExtension(context, isShadow: true).paddingOnly(bottom: Insets.i20)).toList()
    );
  }
}

/*class AddServiceLayout extends StatelessWidget {
  const AddServiceLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Fan repairing service",
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).darkText)),
          const VSpace(Sizes.s5),
          Text("\$${"20"} per service",
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).primary)),
        ]),
        Image.asset(eImageAssets.serviceIcon,
            height: Sizes.s46, width: Sizes.s46)
      ]),
      const DottedLines().paddingSymmetric(vertical: Insets.i12),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(language(context, appFonts.noServiceDone),
            style: appCss.dmDenseMedium12
                .textColor(appColor(context).darkText)),
        Text("2",
            style: appCss.dmDenseMedium12
                .textColor(appColor(context).darkText))
      ])
    ]).paddingAll(Insets.i15).boxBorderExtension(context, isShadow: true);
  }
}*/
