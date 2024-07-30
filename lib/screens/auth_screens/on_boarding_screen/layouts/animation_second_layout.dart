import '../../../../config.dart';
import '../../../../widgets/custom_painters.dart';

class AnimationLayoutSecond extends StatelessWidget {
  const AnimationLayoutSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(
      builder: (context,value,child) {
        return Stack(alignment: Alignment.center, children: [
          if(value.animation != null)
          Stack(alignment: Alignment.topCenter, children: [
            // INNER CONTAINERS
            Center(
                child: Container(
                    decoration:  const BoxDecoration(
                          color: Color(0XFFD4D4D4), shape: BoxShape.circle),
                    height: 320,
                    width: 310)),
            Positioned(
                top: 19,
                right: 0,
                left: 0,
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: appColor(context).whiteBg, width: 3),
                            color: appColor(context).fieldCardBg,
                            shape: BoxShape.circle),
                        height: 300,
                        width: 400))),
            // SMI CIRCLE
            Positioned(
                top: 12,
                child: CustomPaint(
                    size: const Size(300, 300), painter: MyPainter2())),
            //animation helping hands
            Positioned(
                bottom: 270,
                left: 60,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: 1,
                  child: SlideTransition(
                      position: value.animation!,
                      child: Image.asset(
                          eImageAssets.helpingHands,
                          height: 55)),
                )),
            Positioned(
                bottom: 285,
                left: 95,
                child: SlideTransition(
                    position: value.animation!,
                    child: Image.asset(
                        eImageAssets.helpingHands1,
                        height: 90))),
            Positioned(
                bottom: 295,
                left: 115,
                child: SlideTransition(
                    position: value.animation!,
                    child: Image.asset(
                        eImageAssets.helpingHands4,
                        height: 90))),
            Positioned(
                bottom: 305,
                left: 145,
                child: SlideTransition(
                    position: value.animation!,
                    child: Image.asset(
                        eImageAssets.helpingHands3,
                        height: 90))),
            Positioned(
                bottom: 305,
                left: 160,
                child: SlideTransition(
                    position: value.animation!,
                    child: Image.asset(
                        eImageAssets.helpingHands5,
                        height: 70))),
            Positioned(
                bottom: 320,
                left: 190,
                child: SlideTransition(
                    position: value.animation!,
                    child: Image.asset(
                        eImageAssets.helpingHands6,
                        height: 100))),
            Positioned(
                bottom: 290,
                left: 235,
                child: SlideTransition(
                    position: value.animation!,
                    child: Image.asset(
                        eImageAssets.helpingHands7,
                        height: 80))),
            Positioned(
                bottom: 270,
                left: 270,
                child: SlideTransition(
                    position: value.animation!,
                    child: Image.asset(
                        eImageAssets.helpingHands8,
                        height: 55))),

            Image.asset(eImageAssets.postPage, height: Sizes.s280)
                .padding(top: 30),
            Image.asset(eImageAssets.subtract, height: Sizes.s175).padding(top: 6)
          ]),
          // ROUND CONTAINER OUT OF CONTAINERS
          Stack(alignment: Alignment.center, children: [
            Container(
                height: 330,
                width: 350,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 13, color: appColor(context).whiteBg))),
              Positioned(
                  top: 21,
                  child: Container(
                      height: 300,
                      width: 408,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: appColor(context).whiteBg))))
          ])
        ]).paddingOnly(bottom: Insets.i50);
      }
    );
  }
}
