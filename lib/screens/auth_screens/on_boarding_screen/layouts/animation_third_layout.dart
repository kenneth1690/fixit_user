import 'dart:developer';

import '../../../../config.dart';
import '../../../../widgets/custom_painters.dart';

class AnimationLayoutThree extends StatefulWidget {
  const AnimationLayoutThree({super.key});

  @override
  State<AnimationLayoutThree> createState() => _AnimationLayoutThreeState();
}

class _AnimationLayoutThreeState extends State<AnimationLayoutThree>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context1, onboard, child) {
      double height = onboard.heightMQ(context);
      double width = onboard.widthMQ(context);
      log("value.lampOffset s: ${onboard.isDisplay}");
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Stack(alignment: Alignment.center, children: [
          Stack(alignment: Alignment.topCenter, children: [
            Center(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0XFFD4D4D4), shape: BoxShape.circle),
                    height: 305,
                    width: 305)),
            Positioned(
                top: 8,
                right: 0,
                left: 0,
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: appColor(context).whiteBg,
                                width: 3),
                            color: appColor(context).fieldCardBg,
                            shape: BoxShape.circle),
                        height: 300,
                        width: 410))),
            Positioned(
                top: height / 100,
                child: CustomPaint(
                    size: const Size(300, 300), painter: MyPainter2())),
            Positioned(
                top: height * 0.1,
                left: width * 0.3,
                child: AnimatedSize(
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(eImageAssets.frame2,
                        width: onboard.sizeB == true ? 22 : 0,
                        height: onboard.sizeA == true ? 26 : 0))),
            Positioned(
                top: height * 0.05,
                left: width * 0.2,
                child: AnimatedSize(
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(eImageAssets.frame,
                        width: onboard.sizeB == true ? 31 : 0,
                        height: onboard.sizeB == true ? 37 : 0))),
            if (onboard.frameAnimation != null)
              Positioned(
                  top: height * -0.05,
                  left: width * 0.57,
                  child: SlideTransition(
                      position: onboard.frameAnimation!,
                      child: Image.asset(eImageAssets.frame, height: 11))),
            if (onboard.frameAnimation != null)
              Positioned(
                  top: height * -0.07,
                  left: width * 0.35,
                  child: SlideTransition(
                      position: onboard.frameAnimation!,
                      child: Image.asset(eImageAssets.frame2, height: 11))),
            if (onboard.animationThree1 != null)
              Positioned(
                  right: width * 0.10,
                  top: height * 0.1,
                  child: Stack(children: [
                    FadeTransition(
                        opacity: onboard.animationThree1!,
                        child: Image.asset(eImageAssets.window,
                            fit: BoxFit.cover, height: 90, width: 40)),
                    AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        left: onboard.val == true ? 0 : width * -0.2,
                        top: 0,
                        bottom: height * 0.015,
                        child: Image.asset(eImageAssets.curtain1, height: 150)),
                    AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        left: onboard.val == true ? width * 0.045 : width * 2,
                        top: 0,
                        bottom: height * 0.015,
                        child: Image.asset(eImageAssets.curtain,
                            fit: BoxFit.contain, height: 140))
                  ])),
            if (onboard.animationThree != null)
              Positioned(
                  top: height * 0.01,
                  left: width * 0.13,
                  child: SlideTransition(
                      position: onboard.animationThree!,
                      child: Image.asset(height: 75, eImageAssets.plant))),
            Positioned(
                top: height * 0.08,
                left: 0,
                right: 0,
                child: Image.asset(eImageAssets.calender, height: 230)),
            Image.asset(height: 170, eImageAssets.subtract)
          ]),
          Stack(alignment: Alignment.center, children: [
            Container(
                height: 330,
                width: 350,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 13, color: appColor(context).whiteBg))),
            Positioned(
                top: 21,
                child: Container(
                    height: 300,
                    width: 408,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 4,
                            color: appColor(context).whiteBg))))
          ])
        ])
      ]).paddingOnly(bottom: Insets.i50);
    });
  }
}
