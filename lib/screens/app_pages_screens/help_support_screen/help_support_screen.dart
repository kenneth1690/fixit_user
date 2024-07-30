import '../../../config.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 80,
            title: Text(language(context, appFonts.helpSupport),
                style: appCss.dmDenseBold18
                    .textColor(appColor(context).darkText)),
            centerTitle: true,
            backgroundColor: appColor(context).fieldCardBg,
            leading: CommonArrow(
                    arrow: rtl(context) ? eSvgAssets.arrowRight : eSvgAssets.arrowLeft,
                    color: appColor(context).whiteBg,onTap: ()=> route.pop(context))
                .padding(vertical: Insets.i8)),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                    color: appColor(context).fieldCardBg,
                    shape: const SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius.only(
                            bottomRight: SmoothRadius(
                                cornerRadius: AppRadius.r20,
                                cornerSmoothing: 1),
                            bottomLeft: SmoothRadius(
                                cornerRadius: AppRadius.r20,
                                cornerSmoothing: 1)))),
                child: Image.asset(eImageAssets.helpSupport, height: Sizes.s280)
                    .paddingSymmetric(vertical: Insets.i18)),
            const VSpace(Sizes.s30),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(language(context, appFonts.youCanContact),
                      textAlign: TextAlign.center,
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).darkText)),
                  const VSpace(Sizes.s30),
                  const ContactUsLayout()
                ]).paddingSymmetric(horizontal: Insets.i20)
          ]),
        ));
  }
}
