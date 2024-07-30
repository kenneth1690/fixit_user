import 'dart:async';
import 'dart:developer';

import '../../../../config.dart';
import 'dart:math' as math;

class DiscountCouponLayout extends StatelessWidget {
  const DiscountCouponLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CartProvider>(context, listen: true);
    return Stack(alignment: Alignment.center, children: [
      rtl(context)
          ? Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Image.asset(eImageAssets.applyCoupon,
                  color: value.data == null
                      ? appColor(context).stroke
                      : appColor(context).primary,
                  height: Sizes.s50,
                  width: MediaQuery.of(context).size.width))
          : Image.asset(eImageAssets.applyCoupon,
              color: value.data == null
                  ? appColor(context).stroke
                  : appColor(context).primary,
              height: Sizes.s50,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        /*  Text(
                value.data == null
                    ? language(context, appFonts.enterCode)
                    : value.data!.code!,
                style: appCss.dmDenseRegular14.textColor(value.data == null
                    ? appColor(context).lightText
                    : appColor(context).primary))
            .paddingSymmetric(horizontal: Insets.i15)*/
        Expanded(
            flex: 8,
            child: TextFormField(
              controller: value.couponCtrl,
              focusNode: value.focus,
              onTap: () async {
                log("message:${value.focus.hasFocus}");
                value.focus.addListener(() {
                  if (value.focus.hasFocus) {
                    value.scrollController.animateTo(180.0,
                        duration: Duration(milliseconds: 500), curve: Curves.ease);
                  }

                  value.notifyListeners();
                });
              },
              style:
                  appCss.dmDenseRegular14.textColor(appColor(context).primary),
              decoration: InputDecoration(
                  hintText: language(context, appFonts.enterCode),
                  hintStyle: appCss.dmDenseRegular14
                      .textColor(appColor(context).lightText),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  errorBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            )),
        Text(
                language(context,
                    value.data == null ? appFonts.apply : appFonts.remove),
                style:
                    appCss.dmDenseMedium14.textColor(appColor(context).primary))
            .paddingSymmetric(horizontal: Insets.i26)
            .inkWell(onTap: () => value.onApplyRemoveTap(context))
      ]).width(MediaQuery.of(context).size.width)
    ]);
  }
}
