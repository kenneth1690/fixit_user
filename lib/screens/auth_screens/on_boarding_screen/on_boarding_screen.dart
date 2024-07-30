import 'dart:async';
import '../../../config.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context, onBoardPro, child) {
      return StatefulWrapper(
          onInit: () => Timer(
              const Duration(milliseconds: 50), () => onBoardPro.onReady(this)),
          onDispose: () => onBoardPro.onDispose(),
          child: Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                const LanguageDropDownLayout()
                    .paddingSymmetric(horizontal: Insets.i20)
                    .paddingOnly(top: Insets.i20, bottom: Insets.i20),
                onBoardPro.selectIndex == 0
                    ? const AnimationLayoutOne()
                    : onBoardPro.selectIndex == 1
                        ? const AnimationLayoutSecond()
                        : onBoardPro.selectIndex == 2
                            ? const AnimationLayoutThree()
                            : const AnimationFourthLayout(),
                Stack(alignment: Alignment.center, children: [
                  Image.asset(eImageAssets.onBoardBox,
                          color: appColor(context)

                              .darkText
                              .withOpacity(0.5))
                      .paddingOnly(bottom: Insets.i20),
                  Column(children: [
                    SizedBox(
                        height: Sizes.s120,
                        child: PageView.builder(
                            onPageChanged: (index) =>
                                onBoardPro.onPageChange(index),
                            itemCount: appArray.onBoardingList.length,
                            controller: onBoardPro.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (pageContext, index) {
                              return BottomLayout(
                                  title: language(context, appArray.onBoardingList[index]
                                  ["title"]),
                                  subText: language(context, appArray.onBoardingList[index]
                                  ["subtext"]));
                            })),
                    const VSpace(Sizes.s10),
                    const DotIndicatorLayout()
                  ])
                ]).paddingSymmetric(horizontal: Insets.i20)
              ])))));
    });
  }
}
