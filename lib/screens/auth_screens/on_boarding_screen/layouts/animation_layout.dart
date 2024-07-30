import '../../../../config.dart';
import '../../../../widgets/custom_painters.dart';

class AnimationLayoutOne extends StatelessWidget {

  const AnimationLayoutOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context,value,child) {
        return Stack(alignment: Alignment.topCenter, children: [
          Center(
            child: Container(
              decoration:  BoxDecoration(
                  color: appColor(context).stroke, shape: BoxShape.circle),
              height: 325,
              width: 320,
            ),
          ),
          Center(
              child: Container(
                  decoration:  BoxDecoration(
                      color: appColor(context).whiteBg, shape: BoxShape.circle),
                  height: 315,
                  width: 400)),
          Positioned(
              top: 10,
              child: CustomPaint(
                  size: const Size(300, 300), painter: MyPainter())),
          if(value.cloud != null)
          Positioned(
              top: 15,
              left: 2,
              right: 60,
              child: FadeTransition(
                  opacity: value.cloud!,
                  child: Image.asset(eImageAssets.cloud,
                      height: 18))),
          if(value.cloud != null)
          Positioned(
              top: 50,
              left: 20,
              right: 60,
              child: FadeTransition(
                  opacity: value.cloud!,
                  child: Image.asset(eImageAssets.cloud,
                      height: 18))),
          if(value.cloud != null)
          Positioned(
              top: 30,
              left: 100,
              right: 6,
              child: FadeTransition(
                  opacity: value.cloud!,
                  child: Image.asset(eImageAssets.cloud1,
                      height: 10))),
          if(value.cloud1 != null)
          Positioned(
            top: 30,
            left: 110,
            right: 2,
            child: FadeTransition(
              opacity: value.cloud1!,
              child: Image.asset(eImageAssets.cloud1,
                  height: 10),
            ),
          ),
          if(value.animation1 != null)
          Positioned(
              top: MediaQuery.of(context).size.height / 15,
              right: 0,
              left: 0,
              child: Stack(alignment: Alignment.topCenter, children: [
                Opacity(
                  opacity: value.isOpacity == false ? 0 : 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: Sizes.s120),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Transform.translate(
                                  offset: Offset(0, value.animation1!.value),
                                  child: Image.asset(
                                      eImageAssets.rock1,
                                      height: Sizes.s8)),
                              Transform.translate(
                                  offset: Offset(0, value.animation1!.value),
                                  child: Image.asset(eImageAssets.buildings,
                                      height: Sizes.s62)),
                              const SizedBox(width: 20),
                              Transform.translate(
                                  offset: Offset(0, value.animation2!.value),
                                  child: Image.asset(
                                      eImageAssets.buildings1,
                                      height: Sizes.s106)),
                              Transform.translate(
                                  offset: Offset(0, value.animation1!.value),
                                  child: Image.asset(
                                      eImageAssets.buildings,
                                      height: Sizes.s47)),
                            ],
                          ).padding(left: 15),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Transform.translate(
                                    offset: Offset(0, value.animation1!.value),
                                    child: Image.asset(
                                        eImageAssets.buildings,
                                        height: Sizes.s90)),
                                const SizedBox(width: 6),
                                Transform.translate(
                                    offset: Offset(0, value.animation2!.value),
                                    child: Image.asset(
                                        eImageAssets.buildings1,
                                        height: Sizes.s75)),
                                const SizedBox(width: 6),
                                Transform.translate(
                                    offset: Offset(0, value.animation1!.value),
                                    child: Image.asset(
                                        eImageAssets.buildings,
                                        height: Sizes.s47)),
                                Transform.translate(
                                    offset: Offset(0, value.animation1!.value),
                                    child: Image.asset(
                                        height: Sizes.s8,
                                        eImageAssets.rock1))
                              ]).padding(right: Insets.i16)
                        ]),
                  ),
                ),
                RotationTransition(
                    turns: const AlwaysStoppedAnimation(180 / 360),
                    child: CustomPaint(
                        size: const Size(200, 200),
                        painter: MyPainterWhite()))
              ])),
          Image.asset(height: Sizes.s380, eImageAssets.girl)
        ]);
      }
    );
  }
}
