import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../../config.dart';

class ThemeSelect extends StatefulWidget {
  const ThemeSelect({super.key});

  @override
  ThemeSelectState createState() => ThemeSelectState();
}

class ThemeSelectState extends State<ThemeSelect> {


  int? currentIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    currentIndex = themeIndex(context);
    setState(() { });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<ThemeService>(builder: (themeContext, theme, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(language(context, appFonts.selectOne),
                  style: appCss.dmDenseBold18
                      .textColor(appColor(context).darkText)),
              const Icon(CupertinoIcons.multiply)
            ]),
            const VSpace(Sizes.s20),
          ...appArray.themeModeList.asMap().entries.map((e) =>
              Column(
                  children: [
                    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(language(context, e.value),style: appCss.dmDenseMedium14.textColor(appColor(context).darkText)),
                          CommonRadio(index: e.key,selectedIndex: currentIndex,)
                        ]
                    ),
                    if( e.key != appArray.themeModeList.length - 1)
                      Divider(height: 1,color: appColor(context).stroke).paddingSymmetric(vertical: Insets.i20)
                  ]
              ).inkWell(
                onTap: (){
                  log("OMDE :${e.key}");
                  log("OMDE :${e.value}");
                  log("OMDE :${MediaQuery.of(context).platformBrightness}");
                  if (e.key == 0) {
                    theme.switchTheme(true,e.key);
                  } else if (e.key ==1) {
                    theme.switchTheme(false,e.key);
                  } else {
                    theme.switchTheme( MediaQuery.of(context).platformBrightness == Brightness.dark,e.key);
                  }
                  route.pop(context);
                  theme.notifyListeners();
                }
              )/*RadioListTile(
            value: e.key,
            activeColor: appColor(context).primary,
            groupValue: currentIndex,
            title: Text(language(context, e.value), style: appCss.dmDenseMedium14.textColor(appColor(context).darkText )),
            onChanged: (dynamic val) async {
              currentIndex = val;
              *//*
                    if (val == THEME_MODE_SYSTEM) {
                      appStore.setDarkMode(context.platformBrightness() == Brightness.dark);
                    } else if (val == THEME_MODE_LIGHT) {
                      appStore.setDarkMode(false);
                    } else if (val == THEME_MODE_DARK) {
                      appStore.setDarkMode(true);
                    }
                    await setValue(THEME_MODE_INDEX, val);
                    setState(() {});

                    finish(context);*//*
            },
          )*/)

          ],
        );
      }
    );
  }
}