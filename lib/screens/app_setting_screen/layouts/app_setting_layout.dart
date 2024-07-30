import '../../../config.dart';

class AppSettingLayout extends StatelessWidget {
  const AppSettingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingProvider>(builder: (context1, settingCtrl, child) {
        return Consumer<ThemeService>(builder: (themeContext, theme, child) {
          return SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            ...appArray.appSetting(theme.isDarkMode).asMap().entries.map((e) {
              return Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(children: [
                    CommonArrow(
                        arrow: e.value['icon'].toString()),
                    const HSpace(Sizes.s12),
                  e.key == 0 ?  Text(language(context,appArray.themeModeList[themeIndex(context)]),
                      style: appCss.dmDenseRegular14
                          .textColor(appColor(context).darkText)) :  Text(language(context, e.value['title']),
                        style: appCss.dmDenseRegular14
                            .textColor(appColor(context).darkText))
                  ]),

                    SvgPicture.asset(rtl(context) ? eSvgAssets.arrowLeft : eSvgAssets.arrowRight,
                        colorFilter: ColorFilter.mode(
                            appColor(context).lightText, BlendMode.srcIn))
                ]).paddingSymmetric(vertical: Insets.i12),
                Divider(color: appColor(context).fieldCardBg, height: 0)
              ])
                  .paddingSymmetric(horizontal: Insets.i15)
                  .width(MediaQuery.of(context).size.width)
                  .inkWell(onTap: () => settingCtrl.onTapData(context, e.key));
            })
          ]))).decorated(
              color: appColor(context).whiteBg,
              border: Border.all(color: appColor(context).fieldCardBg),
              borderRadius: BorderRadius.circular(AppRadius.r12),
              boxShadow: [
                BoxShadow(
                    color: appColor(context).fieldCardBg,
                    spreadRadius: 2,
                    blurRadius: 4)
              ]).marginSymmetric(horizontal: Insets.i15, vertical: Insets.i25);
        });
      }
    );
  }
}
