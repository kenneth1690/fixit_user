import '../config.dart';

class ServicesDeliveredLayout extends StatelessWidget {
  final String? services;
  final Color? color;
  const ServicesDeliveredLayout({super.key,this.color,this.services});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language(context, appFonts.servicesDelivered),
            style: appCss.dmDenseMedium12.textColor(
                appColor(context).darkText)),
        RichText(
            text: TextSpan(
                text: "$services ",
                style: appCss.dmDenseSemiBold14.textColor(
                    appColor(context).primary),
                children: [
                  TextSpan(
                      text:
                      language(context, appFonts.service),
                      style: appCss.dmDenseSemiBold12
                          .textColor(appColor(context)

                          .primary))
                ]))
      ],
    ).paddingAll(Insets.i12).boxShapeExtension(
        color: color ?? appColor(context).whiteBg);
  }
}
