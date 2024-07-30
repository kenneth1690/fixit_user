import 'dart:developer';

import '../../../config.dart';

class CurrencyBottomSheet extends StatelessWidget {
  final String? currencys;
  final GestureTapCallback? onTap;

  const CurrencyBottomSheet({super.key, this.currencys, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  StatefulBuilder(builder: (context2, setState) {
        return  Consumer<DashboardProvider>(builder: (context3, dash, child) {
            return Consumer<AppSettingProvider>(builder: (context1, value, child) {
              double height = value.heightMQ(context);
              double width = value.widthMQ(context);
              log("CCC : ${dash.currencyList.length}");
              return Container(
                    height: height * 0.49,
                    width: width,
                    decoration: ShapeDecoration(
                        shape: const SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius.only(
                                topLeft: SmoothRadius(
                                    cornerRadius: AppRadius.r20, cornerSmoothing: 1),
                                topRight: SmoothRadius(
                                    cornerRadius: AppRadius.r20,
                                    cornerSmoothing: 0.4))),
                        color: appColor(context).whiteBg),
                    child: Column(children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(language(context, appFonts.changeCurrency),
                            style: appCss.dmDenseMedium18
                                .textColor(appColor(context).darkText)),
                        SvgPicture.asset(eSvgAssets.close)
                            .inkWell(onTap: () => route.pop(context))
                      ]).paddingAll(Insets.i20),
                      Expanded(
                          child: ListView.builder(
                              itemCount: dash.currencyList.length,
                              itemBuilder: (context1, index) {

                                return BulletLayout(
                                    currency: currencys,
                                    data: dash.currencyList[index],
                                    index: index,
                                    selectedIndex: value.selectIndex,
                                    onTap: () => value.onChangeButton(index)).inkWell(onTap: () => value.onChangeButton(index));
                              })),
                      Row(children: [
                        Expanded(
                            child: ButtonCommon(
                              onTap: ()=> route.pop(context),
                                title: appFonts.cancel,
                                style: appCss.dmDenseSemiBold16
                                    .textColor(appColor(context).primary),
                                borderColor: appColor(context).primary,
                                color: appColor(context).trans)),
                        const HSpace(Sizes.s15),
                        Expanded(child: ButtonCommon(
                          title: appFonts.update,
                          onTap: () => value.onUpdate(
                              context, dash.currencyList[value.selectIndex])))
                      ]).padding(horizontal: Insets.i20, bottom: Insets.i5)
                    ]));
              }
            );
          }
        );
      });
  }
}
