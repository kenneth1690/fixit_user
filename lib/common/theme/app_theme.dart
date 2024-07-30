import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color primary;
  Color darkText;
  Color lightText;
  Color whiteBg;
  Color stroke;
  Color fieldCardBg;
  Color trans;
  Color green;
  Color greenColor;
  Color online;
  Color red;
  Color whiteColor;
  Color rateColor;
  Color pending, accepted, ongoing, cartBottomBg, skeletonColor;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.primary,
    required this.darkText,
    required this.lightText,
    required this.whiteBg,
    required this.stroke,
    required this.fieldCardBg,
    required this.trans,
    required this.online,
    required this.red,
    required this.green,
    required this.whiteColor,
    required this.rateColor,
    required this.pending,
    required this.accepted,
    required this.ongoing,
    required this.greenColor,
    required this.cartBottomBg,
    required this.skeletonColor,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          primary: const Color(0xff0277fa),
          darkText: const Color(0xff00162E),
          lightText: const Color(0xff808B97),
          whiteBg: const Color(0xffFFFFFF),
          stroke: const Color(0xffE5E8EA),
          fieldCardBg: const Color(0xffF5F6F7),
          whiteColor: const Color(0xffFFFFFF),
          rateColor: const Color(0xffFFC412),
          trans: Colors.transparent,
          green: Colors.green,
          online: Colors.green,
          red: const Color(0xffFF4B4B),
          pending: const Color(0xffFDB448),
          accepted: const Color(0xff48BFFD),
          ongoing: const Color(0xffFF7456),
          greenColor: const Color(0xff27AF4D),
          cartBottomBg: const Color(0xffF1F3FF),
          skeletonColor: const Color(0xffEDEDED),
        );

      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          primary: const Color(0xff0277fa),
          darkText: const Color(0xffF1F1F1),
          lightText: const Color(0xff808B97),
          whiteBg: const Color(0xff1A1C28),
          stroke: const Color(0xff3A3D48),
          fieldCardBg: const Color(0xff262935),
          whiteColor: const Color(0xffFFFFFF),
          rateColor: const Color(0xffFFC412),
          trans: Colors.transparent,
          green: Colors.green,
          online: Colors.green,
          red: const Color(0xffFF4B4B),
          pending: const Color(0xffFDB448),
          accepted: const Color(0xff48BFFD),
          ongoing: const Color(0xffFF7456),
          greenColor: const Color(0xff27AF4D),
          cartBottomBg: const Color(0xffF1F3FF),
          skeletonColor: const Color(0xffEDEDED),
        );

      // TODO: Handle this case.
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        secondary: primary,
        background: whiteBg,
        surface: whiteBg,
        onBackground: whiteBg,
        onSurface: whiteBg,
        onError: Colors.red,
        onPrimary: primary,
        tertiary: whiteBg,
        onInverseSurface: whiteBg,
        tertiaryContainer: whiteBg,
        surfaceTint: whiteBg,
        surfaceVariant: whiteBg,
        onSecondary: primary,
        error: Colors.red,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent, cursorColor: primary),
      buttonTheme: ButtonThemeData(buttonColor: primary),
      highlightColor: primary,
    );
  }
}
