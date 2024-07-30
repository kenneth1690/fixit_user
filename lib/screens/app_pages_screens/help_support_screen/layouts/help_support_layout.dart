import '../../../../config.dart';

class ContactUsLayout extends StatelessWidget {
  const ContactUsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        color: appColor(context).stroke,
        borderType: BorderType.RRect,
        radius: const Radius.circular(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(children: [
            SvgPicture.asset(eSvgAssets.mail),
            const HSpace(Sizes.s8),
            Text(language(context, appFonts.emailAddress),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).lightText))
          ]),
          const VSpace(Sizes.s8),
          Text("example.help&support@gmail.com",
              style: appCss.dmDenseRegular16
                  .textColor(appColor(context).darkText)),
          Divider(height: 1, color: appColor(context).stroke)
              .paddingSymmetric(vertical: Insets.i20),
          Column(children: [
            Row(children: [
              SvgPicture.asset(eSvgAssets.phone),
              const HSpace(Sizes.s8),
              Text(language(context, appFonts.contactNumber),
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).lightText))
            ]),
            const VSpace(Sizes.s8),
            IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("(406) 555-0120",
                      style: appCss.dmDenseRegular16
                          .textColor(appColor(context).darkText)),
                  VerticalDivider(
                      color: appColor(context).stroke,
                      width: 1,
                      endIndent: 3,
                      indent: 3),
                  Text("(704) 555-0127",
                      style: appCss.dmDenseRegular16
                          .textColor(appColor(context).darkText))
                ]))
          ])
        ]).paddingAll(Insets.i15).decorated(
            color: appColor(context).fieldCardBg,
            borderRadius: BorderRadius.circular(AppRadius.r13)));
  }
}
