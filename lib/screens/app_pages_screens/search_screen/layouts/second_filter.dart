import 'dart:developer';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../config.dart';

class SecondFilter extends StatefulWidget {
  final int? selectIndex;
  final bool? isSearch;
  final Function(int handlerIndex, dynamic lowerValue, dynamic upperValue)?
      onDragging;
  final double? min, max, lowerVal, upperVal;

  const SecondFilter(
      {super.key,
      this.isSearch = true,
      this.selectIndex,
      this.min,
      this.max,
      this.onDragging,
      this.lowerVal,
      this.upperVal});

  @override
  State<SecondFilter> createState() => _SecondFilterState();
}

class _SecondFilterState extends State<SecondFilter> {
  @override
  Widget build(BuildContext context) {
    final categoriesProvider =
        Provider.of<CategoriesDetailsProvider>(context, listen: true);
    final searchProvider = Provider.of<SearchProvider>(context, listen: true);

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const VSpace(Sizes.s20),
        Text(language(context, appFonts.priceRange),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).lightText))
            .paddingOnly(left: Insets.i20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Insets.i15),
          height: Sizes.s60,
          child: FlutterSlider(
                  values: [widget.lowerVal!, widget.upperVal ?? 100.0],
                  rangeSlider: true,
                  tooltip: FlutterSliderTooltip(
                      format: (String value) {
                        return '${getSymbol(context)}$value';
                      },
                      textStyle: appCss.dmDenseMedium12
                          .textColor(appColor(context).darkText),
                      direction: FlutterSliderTooltipDirection.top,
                      positionOffset:
                          FlutterSliderTooltipPositionOffset(top: 28),
                      alwaysShowTooltip: true,
                      boxStyle: FlutterSliderTooltipBox(
                          decoration: BoxDecoration(
                              color: appColor(context).trans))),
                  rightHandler: FlutterSliderHandler(
                      decoration: BoxDecoration(
                          color: appColor(context).trans),
                      child: SvgPicture.asset(
                        eSvgAssets.rSlider1,
                        fit: BoxFit.cover,
                      ).paddingOnly(bottom: 1)),
                  handler: FlutterSliderHandler(
                      decoration: BoxDecoration(
                          color: appColor(context).trans),
                      child: SvgPicture.asset(eSvgAssets.rSlider2)
                          .paddingOnly(bottom: 1)),
                  max: widget.max,
                  min: widget.min,
                  handlerHeight: 25,

                  trackBar: FlutterSliderTrackBar(
                      activeTrackBarHeight: 4.5,
                      activeTrackBar: BoxDecoration(
                          color: appColor(context).darkText),
                      inactiveTrackBarHeight: 4.5,
                      inactiveDisabledTrackBarColor: Colors.cyanAccent,
                      activeDisabledTrackBarColor:
                          appColor(context).darkText),
                  step: const FlutterSliderStep(step: 20),
                  jump: true,
                  onDragging: widget.onDragging!)
              .paddingOnly(bottom: Insets.i10),
        )
            .boxShapeExtension(color: appColor(context).fieldCardBg)
            .padding(
                horizontal: Insets.i20, top: Insets.i10, bottom: Insets.i20),
        Text(language(context, appFonts.ratings),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).lightText))
            .paddingOnly(left: Insets.i20),
        const VSpace(Sizes.s15),
        ...appArray.ratingList.asMap().entries.map((e) => RatingBarLayout(
            index: e.key,
            data: e.value,
            selectedIndex: widget.isSearch == true
                ? searchProvider.selectedRates.contains(e.key)
                : categoriesProvider.selectedRates.contains(e.key),
            onTap: widget.isSearch == true
                ? () => searchProvider.onTapRating(e.key)
                : () => categoriesProvider.onTapRating(e.key)))
      ]),
    );
  }
}

class CustomThumbShapes extends SfThumbShape {
  final ui.Image image;
  final ui.Image image1;
  final BuildContext? buildContext;

  CustomThumbShapes(this.values,
      {required this.image, required this.image1, this.buildContext})
      : _textSpan = const TextSpan(),
        _textPainter = TextPainter();

  final SfRangeValues values;
  TextPainter _textPainter;
  TextSpan _textSpan;
  final double verticalSpacing = 1.0;

  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required RenderBox? child,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required SfThumb? thumb}) {
    final canvas = context.canvas;
    final imageWidth = image.width;
    final imageHeight = image.height;
    final imageWidth1 = image1.width;
    final imageHeight1 = image1.height;

    Offset imageOffset = Offset(
      center.dx - (imageWidth / 1),
      center.dy - (imageHeight / 1.9),
    );
    Offset imageOffset1 = Offset(
      center.dx - (imageWidth1 / 9),
      center.dy - (imageHeight1 / 1.9),
    );
    String text = currentValues!.end.toInt().toString();
    Paint paint = Paint()..filterQuality = FilterQuality.high;
    if (thumb != null) {
      text = (thumb == SfThumb.start ? currentValues.start : currentValues.end)
          .toInt()
          .toString();
    }

    _textSpan = TextSpan(
      text:
          "${getSymbol(buildContext)}${currency(buildContext).currencyVal * double.parse(text)}",
      style: const TextStyle(color: Colors.black),
    );
    _textPainter
      ..text = _textSpan
      ..textDirection = textDirection
      ..layout()
      ..paint(
        context.canvas,
        // To show the label below the thumb, we had added it with thumb radius
        // and constant vertical spacing.
        Offset(center.dx - _textPainter.width / 1.5,
            center.dy + verticalSpacing + themeData.thumbRadius),
      );

    canvas.drawImage(thumb == SfThumb.start ? image : image1,
        thumb == SfThumb.start ? imageOffset : imageOffset1, paint);
  }
}

/*
class _CustomThumb extends SfThumbShape {
  _CustomThumb({required this.textScaleFactor, required this.values})
      : _textSpan = TextSpan(),
        _textPainter = TextPainter();
  final double textScaleFactor;
  final SfRangeValues values;
  TextPainter _textPainter;
  TextSpan _textSpan;
  final double verticalSpacing = 5.0;

  @override
  Size getPreferredSize(SfSliderThemeData themeData) {
    _textSpan = TextSpan(text: values.start.toInt().toString());
    _textPainter
      ..text = _textSpan
      ..textDirection = TextDirection.ltr
      ..textScaleFactor = textScaleFactor
      ..layout();
    // Considered label height along with thumb radius to avoid the
    // label get overlapping with adjacent widget.
    return Size(themeData.thumbRadius * 2,
        (themeData.thumbRadius + _textPainter.height + verticalSpacing) * 2);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
        required RenderBox? child,
        required SfSliderThemeData themeData,
        SfRangeValues? currentValues,
        dynamic currentValue,
        required Paint? paint,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required SfThumb? thumb}) {
    paint ??= Paint()..color = themeData.thumbColor!;
    context.canvas.drawCircle(center, themeData.thumbRadius, paint);
    String text = currentValues!.end.toInt().toString();
    if (thumb != null) {
      text = (thumb == SfThumb.start ? currentValues.start : currentValues.end)
          .toInt()
          .toString();
    }
    _textSpan = TextSpan(
      text: text,
      style: TextStyle(color: Colors.black),
    );
    _textPainter
      ..text = _textSpan
      ..textDirection = textDirection
      ..textScaleFactor = textScaleFactor
      ..layout()
      ..paint(
        context.canvas,
        // To show the label below the thumb, we had added it with thumb radius
        // and constant vertical spacing.
        Offset(center.dx - _textPainter.width / 2,
            center.dy + verticalSpacing + themeData.thumbRadius),
      );
  }
}*/
