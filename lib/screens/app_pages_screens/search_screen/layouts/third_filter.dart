
import 'package:flutter_xlider/flutter_xlider.dart';
import '../../../../config.dart';

class ThirdFilter extends StatelessWidget {
  const ThirdFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<SearchProvider>(context, listen: true);
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(language(context, appFonts.distance),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).lightText))
            .padding(horizontal: Insets.i20, bottom: Insets.i10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IntrinsicHeight(
              child: Row(children: [
            SvgPicture.asset(
              eSvgAssets.address,
              colorFilter: ColorFilter.mode(
                  appColor(context).darkText, BlendMode.srcIn),
            ),
            VerticalDivider(
                    indent: 4,
                    endIndent: 4,
                    width: 1,
                    color: appColor(context).stroke)
                .paddingSymmetric(horizontal: Insets.i12),
            Text(language(context, appFonts.nearByLocation),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).darkText))
          ])),
          FilterRadioLayout(
              isCheck: value.isSelect == false, onTap: () => value.onChange())
        ])
            .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
            .boxBorderExtension(context, isShadow: true)
            .padding(horizontal: Insets.i20, bottom: Insets.i15),
        SizedBox(
                height: Sizes.s124,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IntrinsicHeight(
                            child: Row(children: [
                          SvgPicture.asset(eSvgAssets.country,
                              colorFilter: ColorFilter.mode(
                                  appColor(context).darkText,
                                  BlendMode.srcIn)),
                          VerticalDivider(
                                  indent: 4,
                                  endIndent: 4,
                                  width: 1,
                                  color: appColor(context).stroke)
                              .paddingSymmetric(horizontal: Insets.i12),
                          Text(language(context, appFonts.distanceLocation),
                              style: appCss.dmDenseMedium14.textColor(
                                  appColor(context).darkText))
                        ])),
                        FilterRadioLayout(
                            isCheck: value.isSelect,
                            onTap: () => value.onChange1())
                      ]),
                  /*  FutureBuilder<FrameInfo>(
                      future: value.loadImage(eImageAssets.userSlider),
                      builder: (context, snapshot) {

                        if (snapshot.hasData && snapshot.data != null) {
                          return SfSliderTheme(
                              data: SfSliderThemeData(
                                  activeTrackHeight: 4,
                                  inactiveTrackHeight: 4,
                                  disabledActiveTickColor:
                                      appColor(context).darkText,
                                  activeTickColor:
                                      appColor(context).darkText,
                                  inactiveTrackColor:
                                      appColor(context).stroke,
                                  activeLabelStyle: appCss.dmDenseMedium14
                                      .textColor(appColor(context)

                                          .darkText),
                                  inactiveLabelStyle: appCss.dmDenseMedium14
                                      .textColor(appColor(context)

                                          .lightText),
                                  activeTrackColor:
                                      appColor(context).darkText),
                              child: SfSlider(
                                  activeColor:
                                      appColor(context).darkText,
                                  min: 0.0,
                                  max: 30.0,
                                  interval: 5,

                                  dividerShape: const SfDividerShape(),
                                  showLabels: true,
                                  showTicks: true,
                                  labelFormatterCallback:
                                      (dynamic actualValue,
                                          String formattedText) {
                                    switch (actualValue) {
                                      case 0:
                                        return '00\nKm';
                                      case 5:
                                        return '05\nKm';
                                      case 10:
                                        return '10\nKm';
                                      case 15:
                                        return '15\nKm';
                                      case 20:
                                        return '20\nKm';
                                      case 25:
                                        return '25\nKm';
                                      case 30:
                                        return '30\nKm';
                                    }
                                    return actualValue.toString();
                                  },
                                  thumbShape:
                                      CustomThumbShape(snapshot.data!.image),
                                  value: value.slider,
                                  onChanged: (dynamic newValue) =>
                                      value.slidingValue(newValue)));
                        } else {
                          return Container();
                        }
                      })*/
                  SizedBox(
                    height: Sizes.s85,
                    child: FlutterSlider(
                        values: [value.slider],
                        min: 0.0,
                        max: 30.0,
                        hatchMark: FlutterSliderHatchMark(
                            density: 0.3,
                            // means 50 lines, from 0 to 100 percent
                            displayLines: true,
                            labelBox: FlutterSliderSizedBox(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: appColor(context).trans)),
                            smallLine:
                                FlutterSliderSizedBox(width: 1, height: 1),
                            bigLine: FlutterSliderSizedBox(
                              width: 1,
                              height: 1,
                            ),
                            labels: [
                              FlutterSliderHatchMarkLabel(
                                  percent: 0.5,
                                  label: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 2,
                                        color: value.slider == 0.0 ||
                                                value.slider == 5.0 ||
                                                value.slider == 10.0 ||
                                                value.slider == 15.0||
                                                value.slider == 20.0||
                                                value.slider == 25.0||
                                            value.slider == 30.0
                                            ? appColor(context)

                                                .darkText
                                            : appColor(context).stroke,
                                      ),
                                      const VSpace(Sizes.s3),
                                      Text('0\nkm',
                                          textAlign: TextAlign.center,
                                          style: appCss.dmDenseMedium12
                                              .textColor(appColor(context)

                                                  .darkText)
                                              .textHeight(1)),
                                    ],
                                  )),
                              FlutterSliderHatchMarkLabel(
                                  percent: 17,
                                  label: Column(
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 2,
                                        color: value.slider == 5.0 ||
                                            value.slider == 10.0 ||
                                            value.slider == 15.0||
                                            value.slider == 20.0||
                                            value.slider == 25.0||
                                            value.slider == 30.0
                                            ? appColor(context)

                                                .darkText
                                            : appColor(context).stroke,
                                      ),
                                      const VSpace(Sizes.s3),
                                      Text('5\nkm',
                                          textAlign: TextAlign.center,
                                          style: appCss.dmDenseMedium12
                                              .textColor(appColor(context)

                                                  .darkText)
                                              .textHeight(1)),
                                    ],
                                  )),
                              FlutterSliderHatchMarkLabel(
                                  percent: 33.5,
                                  label: Column(
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 2,
                                        color: value.slider == 10.0 ||
                                            value.slider == 15.0||
                                            value.slider == 20.0||
                                            value.slider == 25.0||
                                            value.slider == 30.0
                                            ? appColor(context)

                                                .darkText
                                            : appColor(context).stroke,
                                      ),
                                      const VSpace(Sizes.s3),
                                      Text('10\nkm',
                                          textAlign: TextAlign.center,
                                          style: appCss.dmDenseMedium12
                                              .textColor(appColor(context)

                                                  .darkText)
                                              .textHeight(1)),
                                    ],
                                  )),
                              FlutterSliderHatchMarkLabel(
                                  percent: 50,
                                  label: Column(
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 2,
                                        color: value.slider == 15.0||
                                            value.slider == 20.0||
                                            value.slider == 25.0||
                                            value.slider == 30.0
                                            ? appColor(context)

                                                .darkText
                                            : appColor(context).stroke,
                                      ),
                                      const VSpace(Sizes.s3),
                                      Text('15\nkm',
                                          textAlign: TextAlign.center,
                                          style: appCss.dmDenseMedium12
                                              .textColor(appColor(context)

                                                  .darkText)
                                              .textHeight(1)),
                                    ],
                                  )),
                              FlutterSliderHatchMarkLabel(
                                  percent: 66,
                                  label: Column(
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 2,
                                        color: value.slider == 20.0||
                                            value.slider == 25.0||
                                            value.slider == 30.0
                                            ? appColor(context)

                                                .darkText
                                            : appColor(context).stroke,
                                      ),
                                      const VSpace(Sizes.s3),
                                      Text('20\nkm',
                                          textAlign: TextAlign.center,
                                          style: appCss.dmDenseMedium12
                                              .textColor(appColor(context)

                                                  .darkText)
                                              .textHeight(1)),
                                    ],
                                  )),
                              FlutterSliderHatchMarkLabel(
                                  percent: 84,
                                  label: Column(
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 2,
                                        color: value.slider == 25.0||
                                            value.slider == 30.0
                                            ? appColor(context)

                                                .darkText
                                            : appColor(context).stroke,
                                      ),
                                      const VSpace(Sizes.s3),
                                      Text('25\nkm',
                                          textAlign: TextAlign.center,
                                          style: appCss.dmDenseMedium12
                                              .textColor(appColor(context)

                                                  .darkText)
                                              .textHeight(1)),
                                    ],
                                  )),
                              FlutterSliderHatchMarkLabel(
                                  percent: 100,
                                  label: Column(
                                    children: [
                                      Container(
                                        height: 4,
                                        width: 2,
                                        color: value.slider == 30.0
                                            ? appColor(context)

                                                .darkText
                                            : appColor(context).stroke,
                                      ),
                                      const VSpace(Sizes.s3),
                                      Text('30\nkm',
                                          textAlign: TextAlign.center,
                                          style: appCss.dmDenseMedium12
                                              .textColor(appColor(context)

                                                  .darkText)
                                              .textHeight(1)),
                                    ],
                                  )),
                            ],
                            labelsDistanceFromTrackBar: 35),
                        tooltip: FlutterSliderTooltip(
                            alwaysShowTooltip: false, disabled: true),
                        handler: FlutterSliderHandler(
                            decoration: BoxDecoration(
                                color: appColor(context).trans),
                            child: SvgPicture.asset(
                              eSvgAssets.userSlider,
                              height: Sizes.s28,
                            ).paddingOnly(bottom: 14)),
                        trackBar: FlutterSliderTrackBar(
                            activeTrackBarHeight: 4.5,
                            activeTrackBarDraggable: true,
                            inactiveTrackBar: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appColor(context).stroke),
                            activeTrackBar: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appColor(context).darkText),
                            inactiveTrackBarHeight: 4.5,
                            inactiveDisabledTrackBarColor:
                                appColor(context).stroke,
                            activeDisabledTrackBarColor:
                                appColor(context).darkText),
                        step: const FlutterSliderStep(step: 5),
                        jump: true,
                        onDragging: (handlerIndex, lowerValue, upperValue) =>
                            value.slidingValue(lowerValue)),
                  )
                ]))
            .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
            .boxBorderExtension(context, isShadow: true)
            .padding(horizontal: Insets.i20, bottom: Insets.i15),
      ]),
    );
  }
}
