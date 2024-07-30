import 'dart:developer';

import 'package:flutter/services.dart';

import '../../../config.dart';

class CouponListScreen extends StatefulWidget {
  const CouponListScreen({super.key});

  @override
  State<CouponListScreen> createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> with TickerProviderStateMixin {
  bool isArg = false;

  AnimationController? animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    setState(() {

    });
    _runAnimation();
  }


  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
    /*setState(() {

    });*/
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context3, dash, child) {
      dynamic data = ModalRoute.of(context)!.settings.arguments ?? false;
      isArg = data;
      log("dash.couponList :${dash.couponList}");
      return Scaffold(
          appBar: AppBarCommon(title: appFonts.couponList),
          body: RefreshIndicator(
            onRefresh: ()async{
              return dash.getCoupons();
            },
            child: SingleChildScrollView(
                child: dash.couponList.isNotEmpty? Column(
                        children: dash.couponList
                            .asMap()
                            .entries
                            .map((e) => CouponLayout(
                                data: e.value,
                                isArg: isArg,
                                onTap: () {
                                  if (!isArg) {
                                    route.pop(context, arg: e.value);
                                  }else{
                                    Clipboard.setData(ClipboardData(text: e.value.code!));
                                  }
                                }))
                            .toList()) :EmptyLayout(
                    title: appFonts.noCoupons,
                    subtitle: appFonts.noCouponsAvailable,
                    isButtonShow :false,
                    widget: Stack(children: [
                      Image.asset(eImageAssets.noSearch,
                          height: Sizes.s346)
                          .paddingOnly(top: Insets.i40),
                      if (animationController != null)
                        Positioned(
                            left: 40,
                            top: 0,
                            child: RotationTransition(
                                turns: Tween(begin: 0.01, end: -.01)
                                    .chain(CurveTween(
                                    curve: Curves.easeIn))
                                    .animate(
                                    animationController!),
                                child: Image.asset(
                                    eImageAssets.mGlass,
                                    height: Sizes.s190,
                                    width: Sizes.s178)))
                    ]))
                    .paddingSymmetric(horizontal: Insets.i20)),
          ));
    });
  }
}
