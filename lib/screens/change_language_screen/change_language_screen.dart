import 'dart:developer';

import 'package:fixit_user/common/languages/language_change.dart';
import 'package:fixit_user/common/theme/index.dart';
import 'package:fixit_user/providers/auth_providers/change_password_provider.dart';
import 'package:fixit_user/screens/auth_screens/change_password_screen/layouts/change_password_layout.dart';

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
              leading: SvgPicture.asset(
                languageCtrl.getLocal() == "ar"
                    ? eSvgAssets.arrowRight
                    : eSvgAssets.arrowLeft1,
                colorFilter: ColorFilter.mode(
                    appColor(context).darkText, BlendMode.srcIn),
              )
                  .paddingAll(Insets.i10)
                  .decorated(
                      shape: BoxShape.circle,
                      color: appColor(context).fieldCardBg)
                  .inkWell(onTap: () => route.pop(context))
                  .paddingAll(Insets.i8),
              title: Text(
                language(context, appFonts.changeLanguage),
                style: appCss.dmDenseBold18
                    .textColor(appColor(context).darkText),
              ),
            ),
            body: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: Insets.i15, vertical: Insets.i25),
                decoration: BoxDecoration(
                    color: appColor(context).whiteBg,
                    border: Border.all(
                        color: appColor(context).fieldCardBg),
                    borderRadius: BorderRadius.circular(AppRadius.r12),
                    boxShadow: [
                      BoxShadow(
                          color: appColor(context).fieldCardBg,
                          spreadRadius: 2,
                          blurRadius: 4)
                    ]),
                child: SafeArea(
                    child: SingleChildScrollView(
                        child: Column(children: [
                  ...appArray.languageList.asMap().entries.map((e) {
                    return Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                height: Sizes.s40,
                                width: Sizes.s40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            e.value["icon"].toString()))),
                              ),
                              const HSpace(Sizes.s12),
                              Text(language(context, e.value['title']),
                                  style: appCss.dmDenseRegular14.textColor(
                                      appColor(context).darkText))
                            ]),
                            languageCtrl.getLocal() == e.value['code']
                                ? Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: const Color(0xff5465FF)
                                            .withOpacity(0.18)),
                                    child: const Icon(Icons.circle,
                                        color: Color(0xff5465FF), size: 13))
                                : Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color(0xffE5E8EA))))
                          ]).paddingSymmetric(vertical: Insets.i12),
                      Divider(
                          color: appColor(context).fieldCardBg,
                          height: 0)
                    ])
                        .paddingSymmetric(horizontal: Insets.i15)
                        .width(MediaQuery.of(context).size.width)
                        .inkWell(
                            onTap: () => languageCtrl
                                .changeLocale(e.value["title"].toString()));
                  }).toList()
                ]))))),
      );
    });
  }
}
