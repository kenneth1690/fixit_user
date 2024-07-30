import '../../../config.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context1, languageCtrl, child) {
      return LoadingComponent(
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                leadingWidth: 80,
                leading: CommonArrow(
                    arrow: languageCtrl.getLocal() == "ar"
                        ? eSvgAssets.arrowRight
                        : eSvgAssets.arrowLeft1,
                    onTap: () => route.pop(context)).paddingAll(Insets.i8),
                title: Text(
                    language(
                        context, language(context, appFonts.changeLanguage)),
                    style: appCss.dmDenseBold18
                        .textColor(appColor(context).darkText))),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const RadioLayout(),
                ButtonCommon(
                    title: appFonts.update,
                    margin: Insets.i20,
                    onTap: () => languageCtrl.changeLocale(appArray
                        .languageList[languageCtrl.selectedIndex]["title"]
                        .toString())).marginOnly(bottom: Insets.i20)
              ],
            )),
      );
    });
  }
}
