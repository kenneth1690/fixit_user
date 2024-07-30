import 'dart:developer';

import 'package:fixit_user/screens/auth_screens/on_boarding_screen/layouts/stack_containers_layout.dart';
import '../../../../config.dart';

class AnimationFourthLayout extends StatelessWidget {
  const AnimationFourthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context, value, child) {

      return Stack(alignment: Alignment.center, children: [
        Container(
            decoration: const BoxDecoration(
                color: Color(0xffD4D4D4), shape: BoxShape.circle),
            height: 325,
            width: 325),
        Container(
            margin: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
                color: const Color(0xffF5F6F7),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4)),
            height: 318,
            width: 318,
            child: Stack(children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffE8E9EA),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(156),
                          topRight: Radius.circular(156))),
                  height: 157,
                  width: 318),
              Image.asset(eImageAssets.line),
              if (value.lampOffset != null)
                Positioned(
                    top: 52,
                    child: SlideTransition(
                        position: value.lampOffset!,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: value.isDisplay ?1:0,
                          child: Image.asset(eImageAssets.lamp,
                              height: 105, width: 80),
                        ))),
              Positioned(
                  left: 100,
                  top: 30,
                  child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: value.height,
                      width: value.width,
                      child:
                          Image.asset(eImageAssets.window1, fit: BoxFit.fill))),
              Positioned(
                  right: 114,
                  top: 60,
                  child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: value.window2height,
                      width: value.window2Width,
                      child:
                          Image.asset(eImageAssets.window2, fit: BoxFit.fill))),
              Positioned(
                  right: 76,
                  top: 30,
                  child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: value.window3Height,
                      width: value.window3Width,
                      child:
                          Image.asset(eImageAssets.window3, fit: BoxFit.fill))),
              if (value.lampOffset != null)
                Positioned(
                    right: 0,
                    top: 95,
                    child: SlideTransition(
                        position: value.potOffset!,

                        child: AnimatedOpacity(
duration: const Duration(milliseconds: 500),
                          opacity: value.isDisplay ?1:0,
                          child: Image.asset(eImageAssets.pot,
                              height: 60, width: 70),
                        ))),
              Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image.asset(eImageAssets.onBoard3,
                      height: 198, width: 198, alignment: Alignment.topRight))
            ])),
        Stack(alignment: Alignment.topCenter, children: [
          const StackContainerCommon(shape: BoxShape.rectangle),
          //const StackContainerCommon(shape: BoxShape.circle),

          Container(
              height: 355,
              width: 370,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 13, color: appColor(context).whiteBg))),
          Positioned(
              top: 15, child: Image.asset(eImageAssets.subtract, height: 180)),
          Positioned(
              top: 23,
              child: Container(
                  height: 320,
                  width: 418,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 4,
                          color: appColor(context).whiteBg))))
        ])
      ]).paddingOnly(bottom: Insets.i25);
    });
  }
}
